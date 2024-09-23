@implementation HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent

- (HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent)initWithSampleType:(id)a3 context:(int64_t)a4
{
  id v7;
  HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *v8;
  HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent;
  v8 = -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sampleType, a3);
    v9->_context = a4;
  }

  return v9;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.burden.lifefactorlogged");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  int64_t context;
  const __CFString *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "healthDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v7, "biologicalSexWithError:", &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;

  v10 = (id *)MEMORY[0x1E0CB4750];
  if (v9)
  {
    _HKInitializeLogging();
    HKLogAFibBurden();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.3();

    v12 = *v10;
    v13 = *MEMORY[0x1E0CB4718];
    v14 = v6;
    goto LABEL_7;
  }
  if (v8)
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v9 = objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB4718];
    v14 = v6;
    v12 = v9;
LABEL_7:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v13);
    goto LABEL_8;
  }
  _HKInitializeLogging();
  HKLogAFibBurden();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.2((uint64_t)self, v9, v31, v32, v33, v34, v35, v36);
LABEL_8:

  objc_msgSend(v5, "healthDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v15, "ageWithCurrentDate:error:", v17, &v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v37;

  if (v19)
  {
    _HKInitializeLogging();
    HKLogAFibBurden();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.1();

    v21 = (void *)*MEMORY[0x1E0CB46A8];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB74F8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v21;
    if (!v18)
      goto LABEL_14;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB4708]);
  v21 = v19;
LABEL_14:

  objc_msgSend(v5, "healthDataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:](self, "determineFeatureVersionWithHealthDataSource:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("featureVersion"));
  -[HKSampleType identifier](self->_sampleType, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("lifeFactor"));

  v26 = (__CFString *)*v10;
  v27 = v26;
  context = self->_context;
  if (!context)
  {
    v29 = CFSTR("interactiveChart");
    goto LABEL_20;
  }
  if (context == 1)
  {
    v29 = CFSTR("lifeFactorPlatter");
LABEL_20:

    v27 = (__CFString *)v29;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("context"));

  return v6;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)determineFeatureVersionWithHealthDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v22;

  objc_msgSend(a3, "featureAvailabilityProviderForIdentifier:", *MEMORY[0x1E0CB4FF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v22 = 0;
    objc_msgSend(v4, "featureOnboardingRecordWithError:", &v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v6)
    {
      objc_msgSend(v6, "onboardingCompletion");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend(v9, "setNumberStyle:", 1);
        objc_msgSend(v9, "setMinimumFractionDigits:", 1);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "onboardingCompletion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "version"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringFromNumber:", v12);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogAFibBurden();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:].cold.2();

      v8 = (id)*MEMORY[0x1E0CB4750];
    }

  }
  else
  {
    _HKInitializeLogging();
    HKLogAFibBurden();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:].cold.1((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);

    v8 = (id)*MEMORY[0x1E0CB4750];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleType, 0);
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "[%{public}@] Error when determining age, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_7_0();
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D7813000, a2, a3, "[%{public}@] No error when fetching biological sex but also didn't get object", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "[%{public}@] Error when determining biological sex, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_7_0();
}

- (void)determineFeatureVersionWithHealthDataSource:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D7813000, a2, a3, "[%{public}@] No feature availability provider found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)determineFeatureVersionWithHealthDataSource:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "[%{public}@] Error when retrieving onboarding record: %{public}@");
  OUTLINED_FUNCTION_7_0();
}

@end
