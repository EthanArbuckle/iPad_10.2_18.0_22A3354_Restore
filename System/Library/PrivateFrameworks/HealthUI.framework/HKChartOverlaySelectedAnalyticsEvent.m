@implementation HKChartOverlaySelectedAnalyticsEvent

- (HKChartOverlaySelectedAnalyticsEvent)initWithConfiguration:(id)a3 previousItem:(id)a4 currentItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKChartOverlaySelectedAnalyticsEvent *v12;
  HKChartOverlaySelectedAnalyticsEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKChartOverlaySelectedAnalyticsEvent;
  v12 = -[HKChartOverlaySelectedAnalyticsEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_previousItem, a4);
    objc_storeStrong((id *)&v13->_currentItem, a5);
  }

  return v13;
}

- (NSString)eventName
{
  return -[HKChartOverlaySelectedAnalyticsEventConfiguration eventName](self->_configuration, "eventName");
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
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HKDisplayTypeContextItem *previousItem;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  HKDisplayTypeContextItem *currentItem;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "healthDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v7, "biologicalSexWithError:", &v56);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v56;

  if (v9)
  {
    _HKInitializeLogging();
    -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](self->_configuration, "loggingCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.3();

    v11 = *MEMORY[0x1E0CB4750];
    v12 = *MEMORY[0x1E0CB4718];
    v13 = v6;
    goto LABEL_7;
  }
  if (v8)
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB4718];
    v13 = v6;
    v11 = v9;
LABEL_7:
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v12);
    goto LABEL_8;
  }
  _HKInitializeLogging();
  -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](self->_configuration, "loggingCategory");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.2((uint64_t)self, v9, v49, v50, v51, v52, v53, v54);
LABEL_8:

  objc_msgSend(v5, "healthDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v14, "ageWithCurrentDate:error:", v16, &v55);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v55;

  if (v18)
  {
    _HKInitializeLogging();
    -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](self->_configuration, "loggingCategory");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.1();

    v20 = (void *)*MEMORY[0x1E0CB46A8];
  }
  else
  {
    -[HKChartOverlaySelectedAnalyticsEventConfiguration minimumAge](self->_configuration, "minimumAge");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v20;
    if (!v17)
      goto LABEL_14;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB4708]);
  v20 = v18;
LABEL_14:

  objc_msgSend(v5, "healthDataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartOverlaySelectedAnalyticsEvent determineFeatureVersionWithHealthDataSource:](self, "determineFeatureVersionWithHealthDataSource:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("featureVersion"));
  previousItem = self->_previousItem;
  if (previousItem)
  {
    -[HKDisplayTypeContextItem analyticsIdentifier](previousItem, "analyticsIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[HKDisplayTypeContextItem analyticsIdentifier](self->_previousItem, "analyticsIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKChartOverlaySelectedAnalyticsEventConfiguration previousContextItemPropertyName](self->_configuration, "previousContextItemPropertyName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v27);

    }
    else
    {
      _HKInitializeLogging();
      -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](self->_configuration, "loggingCategory");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[HKChartOverlaySelectedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.2((uint64_t)self, v28, v29, v30, v31, v32, v33, v34);

      v35 = *MEMORY[0x1E0CB4750];
      -[HKChartOverlaySelectedAnalyticsEventConfiguration previousContextItemPropertyName](self->_configuration, "previousContextItemPropertyName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, v26);
    }

  }
  currentItem = self->_currentItem;
  if (currentItem)
  {
    -[HKDisplayTypeContextItem analyticsIdentifier](currentItem, "analyticsIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[HKDisplayTypeContextItem analyticsIdentifier](self->_currentItem, "analyticsIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKChartOverlaySelectedAnalyticsEventConfiguration currentContextItemPropertyName](self->_configuration, "currentContextItemPropertyName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, v39);

    }
    else
    {
      _HKInitializeLogging();
      -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](self->_configuration, "loggingCategory");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[HKChartOverlaySelectedAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.1((uint64_t)self, v40, v41, v42, v43, v44, v45, v46);

      v47 = *MEMORY[0x1E0CB4750];
      -[HKChartOverlaySelectedAnalyticsEventConfiguration currentContextItemPropertyName](self->_configuration, "currentContextItemPropertyName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, v38);
    }

  }
  return v6;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)determineFeatureVersionWithHealthDataSource:(id)a3
{
  id v4;
  HKChartOverlaySelectedAnalyticsEventConfiguration **p_configuration;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;

  v4 = a3;
  p_configuration = &self->_configuration;
  -[HKChartOverlaySelectedAnalyticsEventConfiguration featureIdentifier](self->_configuration, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKChartOverlaySelectedAnalyticsEventConfiguration featureIdentifier](*p_configuration, "featureIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureAvailabilityProviderForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v19 = 0;
      objc_msgSend(v8, "featureOnboardingRecordWithError:", &v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;
      if (v9)
      {
        objc_msgSend(v9, "onboardingCompletion");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v12, "setNumberStyle:", 1);
          objc_msgSend(v12, "setMinimumFractionDigits:", 1);
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v9, "onboardingCompletion");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "version"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringFromNumber:", v15);
          v11 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        _HKInitializeLogging();
        -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](*p_configuration, "loggingCategory");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[HKAFibBurdenLifeFactorLoggingInitiatedAnalyticsEvent determineFeatureVersionWithHealthDataSource:].cold.2();

        v11 = (id)*MEMORY[0x1E0CB4750];
      }

    }
    else
    {
      _HKInitializeLogging();
      -[HKChartOverlaySelectedAnalyticsEventConfiguration loggingCategory](*p_configuration, "loggingCategory");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[HKChartOverlaySelectedAnalyticsEvent determineFeatureVersionWithHealthDataSource:].cold.1((uint64_t)self, (id *)&self->_configuration, v16);

      v11 = (id)*MEMORY[0x1E0CB4750];
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D7813000, a2, a3, "[%{public}@] Attempting to log analytics for current context item that does not have analytics identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D7813000, a2, a3, "[%{public}@] Attempting to log analytics for previous context item that does not have analytics identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)determineFeatureVersionWithHealthDataSource:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_fault_impl(&dword_1D7813000, a3, OS_LOG_TYPE_FAULT, "[%{public}@] Given feature identifier %{public}@ but no feature availability provider found", (uint8_t *)&v6, 0x16u);

}

@end
