@implementation HRAtrialFibrillationAnalyticsCollector

- (HRAtrialFibrillationAnalyticsCollector)initWithProfile:(id)a3
{
  id v4;
  HRAtrialFibrillationAnalyticsCollector *v5;
  HRAtrialFibrillationAnalyticsCollector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HRAtrialFibrillationAnalyticsCollector;
  v5 = -[HRAtrialFibrillationAnalyticsCollector init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (void)collectAnalyticsForResult:(id)a3 algorithmVersion:(int64_t)a4 samplesDateInterval:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HRAtrialFibrillationConfirmationCycleMetric *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  HRAtrialFibrillationConfirmationCycleMetric *v22;
  id v23;

  v23 = a3;
  v8 = a5;
  if ((objc_msgSend(v23, "tachogramShouldBeRequested") & 1) == 0)
  {
    -[HRAtrialFibrillationAnalyticsCollector _fetchCurrentAge](self, "_fetchCurrentAge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HKHRAnalyticsAgeBinFromAgeInYears();

    objc_msgSend(v23, "positiveUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    objc_msgSend(v23, "negativeUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    -[HRAtrialFibrillationAnalyticsCollector _fetchBiologicalSex](self, "_fetchBiologicalSex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    v17 = [HRAtrialFibrillationConfirmationCycleMetric alloc];
    v18 = objc_msgSend(v23, "userShouldBeAlerted");
    objc_msgSend(v8, "duration");
    v20 = v19;
    objc_msgSend(v23, "metricsForCoreAnalytics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HRAtrialFibrillationConfirmationCycleMetric initWithAgeBin:numberOfPositiveTachograms:numberOfNegativeTachograms:algorithmVersion:biologicalSex:userShouldBeAlerted:cycleDuration:additionalMetrics:](v17, "initWithAgeBin:numberOfPositiveTachograms:numberOfNegativeTachograms:algorithmVersion:biologicalSex:userShouldBeAlerted:cycleDuration:additionalMetrics:", v10, v12, v14, a4, v16, v18, v20, v21);

    -[HRAtrialFibrillationAnalyticsCollector _postConfirmationCycleMetric:](self, "_postConfirmationCycleMetric:", v22);
  }

}

- (void)collectAnalyticsForRemoteDisableMessageShownForOnboardingCountryCode:(id)a3
{
  const __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = (const __CFString *)a3;
  else
    v3 = CFSTR("nil");
  v7 = CFSTR("OnboardingCountryCode");
  v8[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

- (void)collectAnalyticsForRemoteReEnableMessageShownForOnboardingCountryCode:(id)a3
{
  const __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = (const __CFString *)a3;
  else
    v3 = CFSTR("nil");
  v7 = CFSTR("OnboardingCountryCode");
  v8[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

- (void)updateCountAnalyzedTachogramsWithCount:(int64_t)a3 keyValueDomain:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a4;
  v6 = v5;
  if (a3 >= 1)
  {
    v7 = *MEMORY[0x1E0CB4600];
    v13 = 0;
    objc_msgSend(v5, "numberForKey:error:", v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationAnalyticsCollector updateCountAnalyzedTachogramsWithCount:keyValueDomain:].cold.2();
    }
    else
    {
      if (v8 && (objc_msgSend(v8, "integerValue") & 0x8000000000000000) == 0)
        a3 += objc_msgSend(v8, "integerValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v6, "setNumber:forKey:error:", v10, v7, &v12);
      v11 = v12;

      if (v11)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
          -[HRAtrialFibrillationAnalyticsCollector updateCountAnalyzedTachogramsWithCount:keyValueDomain:].cold.1();
      }

    }
  }

}

- (void)_postConfirmationCycleMetric:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    objc_msgSend(v4, "payload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (id)_fetchCurrentAge
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_dateOfBirthDateComponentsWithDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "components:fromDateComponents:toDateComponents:options:", 4, v6, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "year"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HRAtrialFibrillationAnalyticsCollector _fetchCurrentAge].cold.1();
    }
    v12 = 0;
  }

  return v12;
}

- (id)_fetchBiologicalSex
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HRAtrialFibrillationAnalyticsCollector _fetchBiologicalSex].cold.1();
  }

  return v6;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)updateCountAnalyzedTachogramsWithCount:keyValueDomain:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to set CountAnalyzedTacogramsPast24Hours, error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateCountAnalyzedTachogramsWithCount:keyValueDomain:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to get CountAnalyzedTacogramsPast24Hours, error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchCurrentAge
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to get date of birth, error: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchBiologicalSex
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_4_1();
  HRLogSensitiveClassName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v3, v4, "[%{public}@] Failed to get biological sex, error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
