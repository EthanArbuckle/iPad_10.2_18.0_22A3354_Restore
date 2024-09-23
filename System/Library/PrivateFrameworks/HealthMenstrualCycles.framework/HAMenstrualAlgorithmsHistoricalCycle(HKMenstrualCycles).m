@implementation HAMenstrualAlgorithmsHistoricalCycle(HKMenstrualCycles)

- (id)hkmc_cycleWithLastDayIndex:()HKMenstrualCycles includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  char v36;
  void *v37;
  id v39;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v39 = a7;
  +[HKMCCycleSegment _menstruationSegmentWithDays:](HKMCCycleSegment, "_menstruationSegmentWithDays:", objc_msgSend(a1, "julianDayOfMenstruationStart"), objc_msgSend(a1, "julianDayOfMenstruationEnd")- objc_msgSend(a1, "julianDayOfMenstruationStart")+ 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && (objc_msgSend(a1, "fertilityStartJulianDay"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v18;
    objc_msgSend(a1, "fertilityEndJulianDay");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(a1, "fertilityStartJulianDay");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      objc_msgSend(a1, "fertilityEndJulianDay");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

      +[HKMCCycleSegment _fertileWindowSegmentWithDays:](HKMCCycleSegment, "_fertileWindowSegmentWithDays:", v22, v24 - v22 + 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(a1, "phases");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hk_map:", &__block_literal_global_223);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(a1, "predictionPrimarySource");
  if (v27 == 2)
    v28 = a8;
  else
    v28 = 0;
  if (v27 == 3)
    v29 = 2;
  else
    v29 = v28;
  v30 = objc_msgSend(a1, "ovulationConfirmationFailure");
  if (a8 && (v30 - 1) <= 3u)
    v31 = qword_218AC7D08[(char)(v30 - 1)];
  else
    v31 = 0;
  v32 = objc_msgSend(a1, "dailyEligibleWristTemperatureCount");
  if (v15 && v16)
  {
    v33 = v39;
    if (v39)
    {
      v34 = objc_msgSend(v15, "integerValue");
      if (v34 == 2)
        v35 = a8;
      else
        v35 = 0;
      if (v34 == 3)
        v29 = 2;
      else
        v29 = v35;
      v36 = objc_msgSend(v16, "integerValue");
      if (a8 && (v36 - 1) <= 3u)
        v31 = qword_218AC7D08[(char)(v36 - 1)];
      else
        v31 = 0;
      v32 = objc_msgSend(v39, "integerValue");
    }
  }
  else
  {
    v33 = v39;
  }
  +[HKMCCycle _cycleWithMenstruationSegment:fertileWindowSegment:lastDayIndex:ovulationConfirmationType:ovulationConfirmationFailure:dailyEligibleWristTemperatureCount:cycleFactors:](HKMCCycle, "_cycleWithMenstruationSegment:fertileWindowSegment:lastDayIndex:ovulationConfirmationType:ovulationConfirmationFailure:dailyEligibleWristTemperatureCount:cycleFactors:", v17, v20, v14, v29, v31, v32, v26);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)hkmc_description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfMenstruationStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfMenstruationEnd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fertilityStartJulianDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fertilityEndJulianDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isDeterminant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<menstruation: %@ - %@, fertile window: %@ - %@, determinant: %@>"), v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
