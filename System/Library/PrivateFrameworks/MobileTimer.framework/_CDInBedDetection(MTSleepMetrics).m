@implementation _CDInBedDetection(MTSleepMetrics)

- (id)_mt_dateInterval
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "mtIsAfterOrSameAsDate:", v3);

  if (v4)
  {
    MTLogForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetection(MTSleepMetrics) _mt_dateInterval].cold.1((uint64_t)a1, v5);

    NSLog(CFSTR("startDate must occur before endDate"));
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(a1, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);

  }
  return v6;
}

- (void)_mt_dateInterval
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ startDate must occur before endDate.", (uint8_t *)&v2, 0xCu);
}

@end
