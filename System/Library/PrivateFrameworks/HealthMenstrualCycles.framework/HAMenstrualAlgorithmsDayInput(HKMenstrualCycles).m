@implementation HAMenstrualAlgorithmsDayInput(HKMenstrualCycles)

+ (id)hkmc_dayInputWithDaySummary:()HKMenstrualCycles
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE3F588]);
  objc_msgSend(v4, "setJulianDay:", objc_msgSend(v3, "dayIndex"));
  v5 = objc_msgSend(v3, "menstrualFlow");
  v6 = 0x40302010500uLL >> (8 * v5);
  if (v5 >= 6)
    LOBYTE(v6) = 0;
  objc_msgSend(v4, "setFlow:", v6 & 7);
  objc_msgSend(v4, "setSpotting:", objc_msgSend(v3, "intermenstrualBleeding"));
  v7 = objc_msgSend(v3, "ovulationTestResult");
  v8 = 0x203010300uLL >> (8 * v7);
  if (v7 >= 5)
    LOBYTE(v8) = 0;
  objc_msgSend(v4, "setOvulationTestResult:", v8 & 3);
  v9 = (void *)MEMORY[0x24BE3F5E0];
  objc_msgSend(v3, "wristTemperature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hkmc_wristTemperatureWithTemperature:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWristTemperature:", v11);

  return v4;
}

+ (id)hkmc_emptyDayInputWithDayIndex:()HKMenstrualCycles
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BE3F588]);
  objc_msgSend(v4, "setJulianDay:", a3);
  return v4;
}

+ (id)hkmc_dayInputWithHeartStatistics:()HKMenstrualCycles
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BE3F588];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setJulianDay:", objc_msgSend(v4, "dayIndex"));
  v6 = (void *)MEMORY[0x24BE3F5B8];
  objc_msgSend(v4, "tenthPercentileAwakeHeartRateStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hkmc_heartRateStatisticsWithStatistics:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSedentaryHeartRateStatistics:", v8);

  v9 = (void *)MEMORY[0x24BE3F5B8];
  objc_msgSend(v4, "tenthPercentileAsleepHeartRateStatistics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hkmc_heartRateStatisticsWithStatistics:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSleepHeartRateStatistics:", v11);

  return v5;
}

- (void)hkmc_updateWithHeartStatistics:()HKMenstrualCycles
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BE3F5B8];
  v5 = a3;
  objc_msgSend(v5, "tenthPercentileAwakeHeartRateStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hkmc_heartRateStatisticsWithStatistics:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSedentaryHeartRateStatistics:", v7);

  v8 = (void *)MEMORY[0x24BE3F5B8];
  objc_msgSend(v5, "tenthPercentileAsleepHeartRateStatistics");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hkmc_heartRateStatisticsWithStatistics:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSleepHeartRateStatistics:", v9);

}

@end
