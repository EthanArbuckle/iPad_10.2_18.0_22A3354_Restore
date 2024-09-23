@implementation HKMobilityAnalyticsUtilities

+ (id)yearsBetweenStartDateComponents:(id)a3 endDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "hk_gregorianCalendarWithLocalTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "components:fromDate:toDate:options:", 4, v9, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "year"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "hk_gregorianCalendarWithLocalTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "rangeOfUnit:startDate:interval:forDate:", 16, &v15, 0, v7);

  v9 = v15;
  v14 = 0;
  objc_msgSend(v8, "rangeOfUnit:startDate:interval:forDate:", 16, &v14, 0, v6);

  v10 = v14;
  objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "day"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)payloadStringForBiologicalSex:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "integerValue"), v5 <= 3))
    v6 = off_1E9C36818[v5];
  else
    v6 = 0;

  return v6;
}

+ (id)payloadValueForAge:(id)a3
{
  return (id)HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAgeAndMaximumAge();
}

+ (id)activeWatchProductType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  id v12;
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
      v9 = *MEMORY[0x1E0CB5328];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = a1;
        _os_log_impl(&dword_1D7804000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No watch product type retrieved, returning unavailable", (uint8_t *)&v11, 0xCu);
      }
      v7 = CFSTR("unavailable");
    }

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5328];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = a1;
      _os_log_impl(&dword_1D7804000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No active paired device, returning unavailable", (uint8_t *)&v11, 0xCu);
    }
    v7 = CFSTR("unavailable");
  }

  return v7;
}

+ (id)ageWithHealthStore:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dateOfBirthComponentsWithError:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMobilityAnalyticsUtilities yearsBetweenStartDateComponents:endDate:](HKMobilityAnalyticsUtilities, "yearsBetweenStartDateComponents:endDate:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)biologicalSexWithHealthStore:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "biologicalSexWithError:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "biologicalSex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
