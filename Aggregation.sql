
SELECT [Compliance month] as YearMonth                   
		 , Case when Program = 'Warranty' then 'In-Store Warranty'                  
					when program = 'DRP' then 'Trade-in'            
							else Program end as Program 
		 , sum(Vol_Numerator) as Vol_Numerator                       
         , sum(Vol_Denominator) as Vol_Denominator              
         , Round(sum(Vol_Numerator)*1.0/sum(VOl_Denominator), 4) as 'Vol%'              
         , sum(volume_loss) as volLoss          
         , sum(Value_numerator) as Value_numerator              
         , sum(Value_denominator) as Value_denominator          
         , Round(sum(Value_numerator) *1.0/sum(Value_denominator), 4) as 'Val%'         
         , sum(value_loss) as valLoss           
--into ##M_DeviceReturnCondition_StagingFromDetail 
FROM busOps_DLP.dbo.ReturnProgram_ComplThrsh          
	--FROM #tempthresh        
	WHERE [Compliance month] between '2018-03' and '2018-06' 
               
	GROUP BY [Compliance month], Program                  
	ORDER BY [Compliance month]
			 ,CASE WHEN Program = 'Warranty' THEN 'In-Store Warranty'                    
					WHEN program = 'DRP' THEN 'Trade-in'            
							ELSE Program END





