@implementation HDHRCardioFitnessAnalyticsDailyEventDataSource

- (HDHRCardioFitnessAnalyticsDailyEventDataSource)initWithProfile:(id)a3
{
  id v4;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v5;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHRCardioFitnessAnalyticsDailyEventDataSource;
  v5 = -[HDHRCardioFitnessAnalyticsDailyEventDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)determineDaysSinceLastLowNotificationWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4908]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v10 = -[HDHRCardioFitnessAnalyticsDailyEventDataSource _determineDaysSinceLastSampleWithSampleType:currentDate:error:](self, "_determineDaysSinceLastSampleWithSampleType:currentDate:error:", v9, v8, &v15);
    v11 = v15;
    if (v11)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineDaysSinceLastLowNotificationWithCurrentDate:isImproveHealthAndActivityAllowed:error:].cold.1();
      if (a5)
      {
        v12 = 0;
        *a5 = objc_retainAutorelease(v11);
      }
      else
      {
        _HKLogDroppedError();
        v12 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including days since last low notification as user does not have IH&A allowed", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)determineDaysSinceLastVO2MaxSampleWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v10 = -[HDHRCardioFitnessAnalyticsDailyEventDataSource _determineDaysSinceLastSampleWithSampleType:currentDate:error:](self, "_determineDaysSinceLastSampleWithSampleType:currentDate:error:", v9, v8, &v15);
    v11 = v15;
    if (v11)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineDaysSinceLastVO2MaxSampleWithCurrentDate:isImproveHealthAndActivityAllowed:error:].cold.1();
      if (a5)
      {
        v12 = 0;
        *a5 = objc_retainAutorelease(v11);
      }
      else
      {
        _HKLogDroppedError();
        v12 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including days since last low VO2 Max as user does not have IH&A allowed", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)determineNumberOfLowNotificationsInPastYearWithCurrentDate:(id)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    +[HDHRCardioFitnessAnalyticsDailyEventDataSource localGregorianCalendar](HDHRCardioFitnessAnalyticsDailyEventDataSource, "localGregorianCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 4, -1, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4908]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D29840];
    HDSampleEntityPredicateForStartDate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    HDSampleEntityPredicateForStartDate();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateMatchingAllPredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D29578];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v24 = 0;
    v19 = objc_msgSend(v17, "countOfSamplesWithType:profile:matchingPredicate:withError:", v11, WeakRetained, v16, &v24);
    v20 = v24;

    if (v20)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineNumberOfLowNotificationsInPastYearWithCurrentDate:isImproveHealthAndActivityAllowed:error:].cold.1();
      if (a5)
      {
        v21 = 0;
        *a5 = objc_retainAutorelease(v20);
      }
      else
      {
        _HKLogDroppedError();
        v21 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including number of low notifications in past year as user does not have IH&A allowed", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (id)determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3 error:(id *)a4
{
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL8 v14;
  id v15;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB6390], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB7120]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "userCharacteristicsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v8, "userCharacteristicForType:error:", v6, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    if (v10)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:error:].cold.1();
      if (a4)
      {
        v11 = 0;
        *a4 = objc_retainAutorelease(v10);
      }
      else
      {
        _HKLogDroppedError();
        v11 = 0;
      }
    }
    else if (v9)
    {
      v14 = objc_msgSend(v9, "unsignedIntValue") != 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C9AAA0];
    }

    return v11;
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including whether user has blockers enabled as user does not have IH&A allowed", buf, 0xCu);
    }
    return 0;
  }
}

- (id)determineIsHeartRateEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v9;
  int v11;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentDomainForName:", *MEMORY[0x1E0CB7790]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB77A0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)MEMORY[0x1E0C9AAB0];

    return v7;
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including whether user has heart rate as user does not have IH&A allowed", (uint8_t *)&v11, 0xCu);
    }
    return 0;
  }
}

- (id)determineIsWristDetectionEnabledWithIsImproveHealthAndActivityAllowed:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v6;
  int v8;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB6ED8], "isWristDetectEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including whether user has wrist detect as user does not have IH&A allowed", (uint8_t *)&v8, 0xCu);
    }
    v4 = 0;
  }
  return v4;
}

- (int64_t)determineWeeksSinceOnboardingWithCurrentDate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id WeakRetained;
  os_log_t *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0D294A0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = (os_log_t *)MEMORY[0x1E0CB52E8];
  v10 = (void *)objc_msgSend(v7, "initWithProfile:featureIdentifier:currentOnboardingVersion:loggingCategory:", WeakRetained, *MEMORY[0x1E0CB5000], 1, *MEMORY[0x1E0CB52E8]);

  v16 = 0;
  objc_msgSend(v10, "earliestDateLowestOnboardingVersionCompletedWithError:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      -[HDHRCardioFitnessAnalyticsDailyEventDataSource determineWeeksSinceOnboardingWithCurrentDate:error:].cold.1();
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
LABEL_11:
    v13 = *MEMORY[0x1E0D2FB00];
    goto LABEL_12;
  }
  if (!v11)
  {
    _HKInitializeLogging();
    v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No onboarding date given, user has not onboarded yet", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v13 = -[HDHRCardioFitnessAnalyticsDailyEventDataSource numberOfDaysBetweenStartDate:endDate:](self, "numberOfDaysBetweenStartDate:endDate:", v11, v6)/ 7;
LABEL_12:

  return v13;
}

- (BOOL)determineIsNotificationsEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0CB76E0]);

  return v4;
}

- (id)latestClassificationWithIsOnboarded:(BOOL)a3 isImproveHealthAndActivityAllowed:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v7;
  HDHRCardioFitnessAnalyticsSignalSource *v8;
  id WeakRetained;
  HDHRCardioFitnessAnalyticsSignalSource *v10;
  void *v11;
  NSObject *v13;
  int v14;
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v7 = a3;
    v8 = [HDHRCardioFitnessAnalyticsSignalSource alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v10 = -[HDHRCardioFitnessAnalyticsSignalSource initWithProfile:](v8, "initWithProfile:", WeakRetained);

    -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:](v10, "latestClassificationWithIsOnboarded:error:", v7, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not including latest classification as user does not have IH&A allowed", (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
}

- (int64_t)_determineDaysSinceLastSampleWithSampleType:(id)a3 currentDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int64_t v16;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsDailyEventDataSource *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D29578];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v20 = 0;
  objc_msgSend(v10, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v8, WeakRetained, 0, 0, 0, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;

  if (v13)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    {
      v18 = v14;
      objc_msgSend(v8, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2114;
      v24 = v19;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Error when querying for %{public}@: %{public}@", buf, 0x20u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    v16 = *MEMORY[0x1E0D2FB00];
    goto LABEL_10;
  }
  objc_msgSend(v12, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDHRCardioFitnessAnalyticsDailyEventDataSource numberOfDaysBetweenStartDate:endDate:](self, "numberOfDaysBetweenStartDate:endDate:", v15, v9);

LABEL_10:
  return v16;
}

- (int64_t)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  +[HDHRCardioFitnessAnalyticsDailyEventDataSource localGregorianCalendar](HDHRCardioFitnessAnalyticsDailyEventDataSource, "localGregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", 16, &v14, 0, v6);

  v8 = v14;
  v13 = 0;
  objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", 16, &v13, 0, v5);

  v9 = v13;
  objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "day");

  return v11;
}

+ (id)localGregorianCalendar
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)determineDaysSinceLastLowNotificationWithCurrentDate:isImproveHealthAndActivityAllowed:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error when determining days since last low notification, will retry daily event: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)determineDaysSinceLastVO2MaxSampleWithCurrentDate:isImproveHealthAndActivityAllowed:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error when determining days since last VO2 max sample, will retry daily event: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)determineNumberOfLowNotificationsInPastYearWithCurrentDate:isImproveHealthAndActivityAllowed:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error received from query, assigning error so we retry: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error when retrieving cardio fitness medications use object, using error sentinel: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)determineWeeksSinceOnboardingWithCurrentDate:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error when determining onboarding date: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
