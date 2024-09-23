@implementation HAMenstrualAlgorithmsAnalysis(UnitTesting)

+ (id)hdmc_demoAnalysisWithStartDayIndex:()UnitTesting
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BE3F5D0]);
  objc_msgSend(v4, "setJulianDayOfWindowStart:", (a3 + 5));
  objc_msgSend(v4, "setStartProbabilityMean:", 1.0);
  objc_msgSend(v4, "setEndProbabilityMean:", 5.0);
  objc_msgSend(v4, "setStartProbabilityStdDev:", 1.0);
  objc_msgSend(v4, "setEndProbabilityStdDev:", 1.0);
  objc_msgSend(v4, "setLowRange:", 0, 10);
  v5 = objc_alloc_init(MEMORY[0x24BE3F5D0]);
  objc_msgSend(v5, "setJulianDayOfWindowStart:", (a3 + 15));
  objc_msgSend(v5, "setStartProbabilityMean:", 1.0);
  objc_msgSend(v5, "setEndProbabilityMean:", 6.0);
  objc_msgSend(v5, "setStartProbabilityStdDev:", 2.0);
  objc_msgSend(v5, "setEndProbabilityStdDev:", 2.0);
  objc_msgSend(v5, "setLowRange:", 0, 10);
  v6 = objc_alloc_init(MEMORY[0x24BE3F5D8]);
  objc_msgSend(v6, "setNumberOfCyclesFound:", &unk_24DB30378);
  objc_msgSend(v6, "setJulianDayOfFirstCycleStart:", &unk_24DB30390);
  objc_msgSend(v6, "setJulianDayOfLastCycleStart:", &unk_24DB303A8);
  objc_msgSend(v6, "setMedianCycleLength:", &unk_24DB303C0);
  objc_msgSend(v6, "setLowerCycleLengthPercentile:", &unk_24DB303D8);
  objc_msgSend(v6, "setUpperCycleLengthPercentile:", &unk_24DB303F0);
  objc_msgSend(v6, "setMedianMenstruationLength:", &unk_24DB30408);
  objc_msgSend(v6, "setLowerMenstruationLengthPercentile:", &unk_24DB30588);
  objc_msgSend(v6, "setUpperMenstruationLengthPercentile:", &unk_24DB30598);
  v7 = objc_alloc_init(MEMORY[0x24BE3F5A0]);
  objc_msgSend(v7, "setJulianDayOfAnalysisWindowStart:", (a3 - 179));
  objc_msgSend(v7, "setJulianDayOfAnalysisWindowEnd:", a3);
  objc_msgSend(v7, "setMetricsForCoreAnalytics:", &unk_24DB305A8);
  v8 = objc_alloc_init(MEMORY[0x24BE3F5A8]);
  objc_msgSend(v8, "setIrregularBleeding:", v7);
  objc_msgSend(v8, "setProlongedBleeding:", v7);
  v9 = objc_alloc_init(MEMORY[0x24BE3F580]);
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMenstruationPredictions:", v10);

  objc_msgSend(v9, "setFertilityPredictions:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v9, "setStats:", v6);
  objc_msgSend(v9, "setDeviationAnalysis:", v8);

  return v9;
}

@end
