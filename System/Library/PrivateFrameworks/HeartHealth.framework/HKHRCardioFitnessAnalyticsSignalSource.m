@implementation HKHRCardioFitnessAnalyticsSignalSource

- (int64_t)bucketedAgeWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHRCardioFitnessAnalyticsSignalSource.m"), 26, CFSTR("Subclass must implement"));

  return -1;
}

- (id)biologicalSexStringWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHRCardioFitnessAnalyticsSignalSource.m"), 31, CFSTR("Subclass must implement"));

  return &stru_1E9C26A20;
}

- (NSString)activeWatchProductType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  HKHRCardioFitnessAnalyticsSignalSource *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getActivePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51738]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = self;
        _os_log_impl(&dword_1D7781000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No watch product type retrieved, returning unavailable", (uint8_t *)&v11, 0xCu);
      }
      v7 = CFSTR("unavailable");
    }

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1D7781000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No active paired device, returning unavailable", (uint8_t *)&v11, 0xCu);
    }
    v7 = CFSTR("unavailable");
  }

  return (NSString *)v7;
}

- (NSString)featureVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f"), 0x3FF0000000000000);
}

- (int64_t)bucketedAgeForDateOfBirthComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDateComponents:toDateComponents:options:", 4, v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "year");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAgeAndMaximumAge();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  return v12;
}

- (id)biologicalSexStringForBiologicalSex:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("male");
  else
    return off_1E9C267C8[a3];
}

@end
