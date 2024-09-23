@implementation HAMenstrualAlgorithmsDeviation(HKMenstrualCycles)

- (HKMCUnconfirmedDeviation)hkmc_deviationOfType:()HKMenstrualCycles
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  HKMCUnconfirmedDeviation *v8;
  void *v9;
  HKMCUnconfirmedDeviation *v10;

  v5 = objc_msgSend(a1, "julianDayOfAnalysisWindowStart");
  v6 = objc_msgSend(a1, "julianDayOfAnalysisWindowEnd");
  v7 = v6 - objc_msgSend(a1, "julianDayOfAnalysisWindowStart") + 1;
  v8 = [HKMCUnconfirmedDeviation alloc];
  objc_msgSend(a1, "metricsForCoreAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKMCUnconfirmedDeviation initWithType:days:analyticsMetadata:](v8, "initWithType:days:analyticsMetadata:", a3, v5, v7, v9);

  return v10;
}

- (id)hkmc_description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfAnalysisWindowStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfAnalysisWindowEnd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metricsForCoreAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<analysis window: %@ - %@, analytics: %@>"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
