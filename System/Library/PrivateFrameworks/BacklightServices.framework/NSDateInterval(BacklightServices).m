@implementation NSDateInterval(BacklightServices)

- (uint64_t)bls_machContinuousStartTime
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "startDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "bls_machContinuousTime");

  return v2;
}

- (uint64_t)bls_machContinuousEndTime
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "endDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "bls_machContinuousTime");

  return v2;
}

- (unint64_t)bls_machDuration
{
  double v1;
  double v2;

  objc_msgSend(a1, "duration");
  v2 = v1;
  if (BLSMachTimeFromNSTimeInterval_onceToken != -1)
    dispatch_once(&BLSMachTimeFromNSTimeInterval_onceToken, &__block_literal_global_62);
  return (unint64_t)(v2 / *(double *)&BLSMachTimeFromNSTimeInterval___TimeScale);
}

- (id)bls_initWithStartMachContinuousTime:()BacklightServices endMachContinuousTime:
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  v3 = v2;
  BSTimeDifferenceFromMachTimeToMachTime();
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(a1, "initWithStartDate:duration:", v6, v5);

  return v7;
}

- (uint64_t)bls_containsDate:()BacklightServices withEpsilon:
{
  return objc_msgSend(a1, "bls_containsDate:withEpsilon:outDelta:", a3, 0);
}

- (BOOL)bls_containsDate:()BacklightServices withEpsilon:outDelta:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL8 v18;

  v8 = a4;
  v9 = v8;
  if (!v8)
  {
LABEL_5:
    v18 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(a1, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  objc_msgSend(a1, "duration");
  v16 = v14 - a2 - v11;
  if (v16 > 0.0)
  {
    if (a5)
    {
      v17 = -v16;
LABEL_8:
      v18 = 0;
      *a5 = v17;
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v17 = v11 - (v14 + v15 + a2);
  v18 = v17 <= 0.0;
  if (a5 && v17 > 0.0)
    goto LABEL_8;
LABEL_9:

  return v18;
}

- (id)bls_loggingString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_loggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ -> %.3fs duration"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bls_shortLoggingString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@->%.3fs"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
