@implementation HAMenstrualAlgorithmsHeartRateStatistics(HKMenstrualCycles)

+ (id)hkmc_heartRateStatisticsWithStatistics:()HKMenstrualCycles
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BE3F5B8];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "percentileQuantityValue");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLowerPercentile:", v7);

    v8 = objc_msgSend(v4, "sampleCount");
    objc_msgSend(v5, "setSampleCount:", v8);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
