@implementation HAMenstrualAlgorithmsPrediction(HKMenstrualCycles)

- (HKMCProjection)hkmc_projectionConstrainingToMostLikelyDays:()HKMenstrualCycles overridePredictionPrimarySource:currentDayIndex:
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  HKMCProjection *v30;

  v8 = a4;
  v9 = (double)objc_msgSend(a1, "julianDayOfWindowStart");
  objc_msgSend(a1, "startProbabilityMean");
  v11 = v10 + v9;
  objc_msgSend(a1, "startProbabilityStdDev");
  v13 = v12;
  v14 = (double)objc_msgSend(a1, "julianDayOfWindowStart");
  objc_msgSend(a1, "endProbabilityMean");
  v16 = v15 + v14;
  objc_msgSend(a1, "endProbabilityStdDev");
  v18 = v17;
  v19 = objc_msgSend(a1, "julianDayOfWindowStart");
  v20 = objc_msgSend(a1, "lowRange");
  objc_msgSend(a1, "lowRange");
  if (a3)
  {
    v22 = llround(v11);
    v23 = llround(v16 - v11) + 1;
  }
  else
  {
    v23 = v21;
    v22 = v20 + v19;
  }
  v24 = HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource(objc_msgSend(a1, "predictionPrimarySource"));
  if (v8)
  {
    v25 = HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource(objc_msgSend(v8, "integerValue"));
    v26 = v22 + v23 + 2;
    if (v23 <= 0)
      v26 = 0x8000000000000002;
    v27 = v26 <= a5;
    v28 = 3;
    if (!v27)
      v28 = 1;
    if (v25 == 3)
      v29 = v28;
    else
      v29 = v25;
  }
  else
  {
    v29 = v24;
  }
  v30 = -[HKMCProjection initWithStartMean:startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:]([HKMCProjection alloc], "initWithStartMean:startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:", v22, v23, objc_msgSend(a1, "isOngoingMenstruation"), objc_msgSend(a1, "daysOffsetFromCalendarMethod"), v29, v11, v13, v16, v18);

  return v30;
}

- (id)hkmc_description
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSRange v15;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "julianDayOfWindowStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startProbabilityMean");
  v5 = v4;
  objc_msgSend(a1, "startProbabilityStdDev");
  v7 = v6;
  objc_msgSend(a1, "endProbabilityMean");
  v9 = v8;
  objc_msgSend(a1, "endProbabilityStdDev");
  v11 = v10;
  v15.location = objc_msgSend(a1, "lowRange");
  NSStringFromRange(v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<startDay:%@ start:%.2f±%.2f end:%.2f±%.2f lowRange:%@ isOngoing:%d>"), v3, v5, v7, v9, v11, v12, objc_msgSend(a1, "isOngoingMenstruation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
