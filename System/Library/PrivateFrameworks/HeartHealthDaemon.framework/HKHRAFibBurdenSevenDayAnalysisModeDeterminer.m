@implementation HKHRAFibBurdenSevenDayAnalysisModeDeterminer

- (HKHRAFibBurdenSevenDayAnalysisModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4
{
  id v6;
  id v7;
  HKHRAFibBurdenSevenDayAnalysisModeDeterminer *v8;
  HKHRAFibBurdenSevenDayAnalysisModeDeterminer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisModeDeterminer;
  v8 = -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_calendarCache, a4);
  }

  return v9;
}

- (id)determineModeForAnalysisWeekRange:(id)a3 featureStatus:(id)a4 error:(id *)a5
{
  int64_t var1;
  int64_t var0;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  HKHRAFibBurdenSevenDayAnalysisModeDeterminer *v22;
  uint64_t v23;

  var1 = a3.var1;
  var0 = a3.var0;
  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer _onboardingDateDayIndexWithFeatureStatus:error:](self, "_onboardingDateDayIndexWithFeatureStatus:error:", a4, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v10)
  {
    v11 = v10;
    if (a5)
    {
      v11 = objc_retainAutorelease(v10);
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
LABEL_26:

    goto LABEL_27;
  }
  if (v9)
  {
    v13 = objc_msgSend(v9, "integerValue");
    if (v13 >= var0 + var1)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer determineModeForAnalysisWeekRange:featureStatus:error:].cold.1((uint64_t)self, v11);
      v12 = &unk_1E87FF890;
    }
    else
    {
      v14 = v13;
      v19 = 0;
      -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer _mostRecentSampleEndDateDayIndexWithError:](self, "_mostRecentSampleEndDateDayIndexWithError:", &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      if (v11)
      {
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
      else if (v15 && objc_msgSend(v15, "integerValue") >= var0)
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = self;
          _os_log_impl(&dword_1CC29C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Most recent sample end date after analysis week range start, implying part of this week or future. Skipping analysis", buf, 0xCu);
        }

        v12 = &unk_1E87FF890;
      }
      else
      {
        v12 = &unk_1E87FF8C0;
        if (v14 >= var0 && v14 - var0 < var1)
        {
          _HKInitializeLogging();
          HKHRAFibBurdenLogForCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v22 = self;
            _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding date within analysis week range, allowing analysis to proceed but will not notify on no data.", buf, 0xCu);
          }

          v12 = &unk_1E87FF8A8;
        }
      }

    }
    goto LABEL_26;
  }
  v12 = &unk_1E87FF890;
LABEL_27:

  return v12;
}

- (id)_onboardingDateDayIndexWithFeatureStatus:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isOnboardingRecordPresent")
    && (objc_msgSend(v5, "onboardingRecord"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "allOnboardingCompletionsRegardlessOfSupportedState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v5, "onboardingRecord", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allOnboardingCompletionsRegardlessOfSupportedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "completionDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v9, "hk_isBeforeDate:", v17);

          if (v18)
          {
            objc_msgSend(v16, "completionDate");
            v19 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v19;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v9, "hk_dayIndexWithCalendar:", v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_mostRecentSampleEndDateDayIndexWithError:(id *)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HKCalendarCache *calendarCache;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  HKHRAFibBurdenSevenDayAnalysisModeDeterminer *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29578];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v22 = 0;
  objc_msgSend(v5, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v6, WeakRetained, 0, 0, 0, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;

  if (!v8)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v9)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer _mostRecentSampleEndDateDayIndexWithError:].cold.1((uint64_t)self, (uint64_t)v9, v18);

      if (a3)
      {
        v16 = 0;
        *a3 = objc_retainAutorelease(v9);
        goto LABEL_14;
      }
      _HKLogDroppedError();
    }
    else
    {
      v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

      if (v19)
      {
        HKHRAFibBurdenLogForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v24 = self;
          _os_log_impl(&dword_1CC29C000, v20, OS_LOG_TYPE_INFO, "[%{public}@] No sample found", buf, 0xCu);
        }

      }
    }
    v16 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  calendarCache = self->_calendarCache;
  objc_msgSend(v8, "_timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarCache calendarForTimeZone:](calendarCache, "calendarForTimeZone:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "hk_dayIndexWithCalendar:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)determineModeForAnalysisWeekRange:(uint64_t)a1 featureStatus:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Onboarding date day index after analysis week, meaning we were not onboarded for any part of the analysis week. Skipping analysis.", (uint8_t *)&v2, 0xCu);
}

- (void)_mostRecentSampleEndDateDayIndexWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when finding most recent sample: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
