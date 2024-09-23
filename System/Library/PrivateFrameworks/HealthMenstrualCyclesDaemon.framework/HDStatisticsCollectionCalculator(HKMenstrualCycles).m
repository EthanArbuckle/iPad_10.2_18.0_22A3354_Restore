@implementation HDStatisticsCollectionCalculator(HKMenstrualCycles)

+ (id)hdmc_tenthPercentileCalculator
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "heartRateType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v2, 0, _HKStatisticsOptionPercentile(), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C58]), "initWithPercentile:", &unk_24DB30548);
  objc_msgSend(v3, "setStatisticsConfiguration:", v4);

  return v3;
}

- (id)hdmc_heartRateStatisticsWithProfile:()HKMenstrualCycles predicate:errorOut:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v8 = (void *)MEMORY[0x24BDD3E80];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "heartRateType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C38]), "initForProfile:quantityType:predicate:restrictedSourceEntities:", v10, v11, v9, 0);

  objc_msgSend(a1, "setDataSource:", v12);
  v16 = 0;
  objc_msgSend(a1, "queryForInitialStatisticsWithError:", &v16);
  v13 = v16;
  if (v13)
  {
    if (a5)
    {
      v14 = 0;
      *a5 = objc_retainAutorelease(v13);
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "currentStatistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end
