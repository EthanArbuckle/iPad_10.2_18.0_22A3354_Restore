@implementation HDSQLitePredicate(HKMenstrualCycles)

+ (id)hdmc_predicateForSamplesInDayIndexRange:()HKMenstrualCycles
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_earliestPossibleDateWithDayIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 <= 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = a4 + a3 - 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_latestPossibleDateWithDayIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE40E20];
  v15[0] = v9;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)hdmc_predicateForPossibleOngoingSamplesOnDayIndex:()HKMenstrualCycles
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_latestPossibleDateWithDayIndex:", a3 - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_earliestPossibleDateWithDayIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE40E20];
  v12[0] = v6;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateMatchingAllPredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
