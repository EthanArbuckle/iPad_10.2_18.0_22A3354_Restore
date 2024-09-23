@implementation HAMenstrualAlgorithmsStats(HKMenstrualCycles)

- (HKMCStatistics)hkmc_statistics
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKMCStatistics *v12;
  HKMCStatistics *v14;

  v14 = [HKMCStatistics alloc];
  objc_msgSend(a1, "numberOfCyclesFound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");
  objc_msgSend(a1, "julianDayOfFirstCycleStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "julianDayOfLastCycleStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "medianCycleLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lowerCycleLengthPercentile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "upperCycleLengthPercentile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "medianMenstruationLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lowerMenstruationLengthPercentile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "upperMenstruationLengthPercentile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKMCStatistics initWithNumberOfCycles:firstMenstruationStartDayIndex:lastMenstruationStartDayIndex:cycleLengthMedian:cycleLengthLowerPercentile:cycleLengthUpperPercentile:menstruationLengthMedian:menstruationLengthLowerPercentile:menstruationLengthUpperPercentile:](v14, "initWithNumberOfCycles:firstMenstruationStartDayIndex:lastMenstruationStartDayIndex:cycleLengthMedian:cycleLengthLowerPercentile:cycleLengthUpperPercentile:menstruationLengthMedian:menstruationLengthLowerPercentile:menstruationLengthUpperPercentile:", v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)hkmc_description
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v13 = (void *)MEMORY[0x24BDD17C8];
  v2 = objc_opt_class();
  objc_msgSend(a1, "numberOfCyclesFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "julianDayOfLastCycleStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "medianCycleLength");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lowerCycleLengthPercentile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "upperCycleLengthPercentile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "medianMenstruationLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lowerMenstruationLengthPercentile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "upperMenstruationLengthPercentile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@:%p %@ cycles, lastMenstruationStart: %@, cycleLength: %@ (%@ - %@) menstruationLength: %@ (%@ - %@)>"), v2, a1, v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
