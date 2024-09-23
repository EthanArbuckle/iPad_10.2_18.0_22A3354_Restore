@implementation NSDate(BacklightServices)

- (uint64_t)bls_machContinuousTime
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;

  v2 = mach_continuous_time();
  objc_msgSend(a1, "timeIntervalSinceNow");
  v4 = v3;
  if (BLSMachTimeFromNSTimeInterval_onceToken != -1)
    dispatch_once(&BLSMachTimeFromNSTimeInterval_onceToken, &__block_literal_global_62);
  v5 = fabs(v4) / *(double *)&BLSMachTimeFromNSTimeInterval___TimeScale;
  v6 = v2 - (unint64_t)v5;
  if (v2 < (unint64_t)v5)
    v6 = 0;
  if (v4 >= 0.0)
    return v2 + (unint64_t)v5;
  else
    return v6;
}

- (id)bls_initWithMachContinuousTime:()BacklightServices
{
  double v2;

  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  return (id)objc_msgSend(a1, "initWithTimeIntervalSinceNow:", v2);
}

- (id)bls_initWithBSContinuousMachTime:()BacklightServices
{
  id v3;
  double v4;

  v3 = a1;
  BSContinuousMachTimeNow();
  return (id)objc_msgSend(v3, "initWithTimeIntervalSinceNow:", v4 - a2);
}

- (__CFString)bls_loggingString
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (bls_loggingString_onceToken != -1)
    dispatch_once(&bls_loggingString_onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToDate:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("<Distant Past>");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqualToDate:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("<Distant Future>");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "compare:", v7);
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)bls_loggingString_dateFormatter, "stringFromDate:", a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == -1)
      {
        objc_msgSend((id)bls_loggingString_dateComponentsFormatter, "stringFromDate:toDate:", a1, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (%@ ago)"), v10, v11);
      }
      else
      {
        objc_msgSend((id)bls_loggingString_dateComponentsFormatter, "stringFromDate:toDate:", v7, a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (in %@)"), v10, v11);
      }
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (__CFString)bls_shortLoggingString
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  char v6;

  if (bls_shortLoggingString_onceToken != -1)
    dispatch_once(&bls_shortLoggingString_onceToken, &__block_literal_global_16);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToDate:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("<Distant Past>");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqualToDate:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("<Distant Future>");
    }
    else
    {
      objc_msgSend((id)bls_shortLoggingString_dateFormatter, "stringFromDate:", a1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (uint64_t)bls_fileNameString
{
  if (bls_fileNameString_onceToken != -1)
    dispatch_once(&bls_fileNameString_onceToken, &__block_literal_global_19);
  return objc_msgSend((id)bls_fileNameString_dateFormatter, "stringFromDate:", a1);
}

- (uint64_t)bls_compare:()BacklightServices withEpsilon:
{
  id v6;
  double v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a1, "timeIntervalSinceDate:", v6);
  if (fabs(v7) >= a2)
    v8 = objc_msgSend(a1, "compare:", v6);
  else
    v8 = 0;

  return v8;
}

- (BOOL)bls_isOnOrAfter:()BacklightServices andOnOrBefore:
{
  id v6;
  _BOOL8 v7;

  v6 = a4;
  v7 = objc_msgSend(a3, "compare:", a1) != 1 && objc_msgSend(v6, "compare:", a1) != -1;

  return v7;
}

- (BOOL)bls_isOnOrAfter:()BacklightServices andOnOrBefore:withEpsilon:
{
  id v8;
  _BOOL8 v9;

  v8 = a5;
  v9 = objc_msgSend(a4, "bls_compare:withEpsilon:", a1, a2) != 1
    && objc_msgSend(v8, "bls_compare:withEpsilon:", a1, a2) != -1;

  return v9;
}

@end
