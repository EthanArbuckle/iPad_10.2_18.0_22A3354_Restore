@implementation HMDLightProfileDataSource

- (NSDate)date
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (unint64_t)millisecondsElapsedSinceStartOfDayWithDate:(id)a3 timeZone:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = *MEMORY[0x1E0C996C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v5, "calendarWithIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v7);

  objc_msgSend(v9, "components:fromDate:", 224, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 3600 * objc_msgSend(v10, "hour");
  v12 = v11 + 60 * objc_msgSend(v10, "minute");
  v13 = 1000 * (v12 + objc_msgSend(v10, "second"));

  return v13;
}

- (NSTimeZone)localTimeZone
{
  return (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
}

- (NSDictionary)naturalLightingCurveResourceFileContent
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("NaturalLightingCurve"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)v15;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create dictionary from file URL %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v7 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = CFSTR("NaturalLightingCurve");
      v20 = 2112;
      v21 = CFSTR("plist");
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to locate the resource file with name: %@ with extension: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = (id)MEMORY[0x1E0C9AA70];
  }

  return (NSDictionary *)v7;
}

- (double)naturalLightingCurveUpdateInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("naturalLightingCurveUpdateInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  if (v5 >= 0.0)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v7;
  }
  else
  {
    v6 = 86400.0;
  }

  return v6;
}

- (double)naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  if (v5 >= 0.0)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v7;
  }
  else
  {
    v6 = 60.0;
  }

  return v6;
}

- (void)dispatchAfterTimeInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  int64_t v6;
  id v7;
  dispatch_time_t v8;
  NSObject *queue;

  v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a5;
  queue = a4;
  v8 = dispatch_time(0, v6);
  dispatch_after(v8, queue, v7);

}

- (int64_t)naturalLightingEnabledMaxRetryCount
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("naturalLightingEnabledMaxRetryCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)naturalLightingEnabledRetryInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("naturalLightingEnabledRetryInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

@end
