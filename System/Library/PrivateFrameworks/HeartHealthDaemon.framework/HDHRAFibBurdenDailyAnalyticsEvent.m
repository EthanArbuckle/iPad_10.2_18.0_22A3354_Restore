@implementation HDHRAFibBurdenDailyAnalyticsEvent

- (HDHRAFibBurdenDailyAnalyticsEvent)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  HDHRAFibBurdenDailyAnalyticsEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDHRAFibBurdenDailyAnalyticsEvent initWithProfile:notificationsAuthorizedProvider:](self, "initWithProfile:notificationsAuthorizedProvider:", v4, v5);

  return v6;
}

- (HDHRAFibBurdenDailyAnalyticsEvent)initWithProfile:(id)a3 notificationsAuthorizedProvider:(id)a4
{
  id v6;
  id v7;
  HDHRAFibBurdenDailyAnalyticsEvent *v8;
  HDHRAFibBurdenDailyAnalyticsEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDHRAFibBurdenDailyAnalyticsEvent;
  v8 = -[HDHRAFibBurdenDailyAnalyticsEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_notificationsAuthorizedProvider, a4);
  }

  return v9;
}

- (NSString)eventName
{
  return (NSString *)(id)*MEMORY[0x1E0D2FA30];
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "environmentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activePairedDeviceProductType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB4700]);
  objc_msgSend(v5, "healthDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v9, "biologicalSexWithError:", &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;

  if (v11)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.3();

    v13 = *MEMORY[0x1E0CB4750];
    v14 = *MEMORY[0x1E0CB4718];
    v15 = v6;
    goto LABEL_9;
  }
  if (v10)
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB4718];
    v15 = v6;
    v13 = v11;
LABEL_9:
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v14);
    goto LABEL_10;
  }
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.2();
LABEL_10:

  objc_msgSend(v5, "healthDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v16, "ageWithCurrentDate:error:", v18, &v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v34;

  if (v20)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.1();

    v22 = (void *)*MEMORY[0x1E0CB46A8];
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB74F8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v22;
  if (v19)
  {
LABEL_15:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB4708]);
    v22 = v20;
  }

  -[HDHRAFibBurdenDailyAnalyticsEvent _extractAFibBurdenFeatureStatusPropertiesFromDataSource:payload:](self, "_extractAFibBurdenFeatureStatusPropertiesFromDataSource:payload:", v5, v6);
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractIRNFeatureStatusPropertiesFromDataSource:payload:](self, "_extractIRNFeatureStatusPropertiesFromDataSource:payload:", v5, v6);
  v24 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v24, "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", WeakRetained);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHRAFibBurdenDailyAnalyticsEvent _extractDaysSinceDateInKeyValueDomain:withKey:intoProperty:inPayload:dataSource:](self, "_extractDaysSinceDateInKeyValueDomain:withKey:intoProperty:inPayload:dataSource:", v26, *MEMORY[0x1E0D2FA80], CFSTR("numberOfDaysSinceLastAnalysis"), v6, v5);
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractDaysSinceDateInKeyValueDomain:withKey:intoProperty:inPayload:dataSource:](self, "_extractDaysSinceDateInKeyValueDomain:withKey:intoProperty:inPayload:dataSource:", v26, *MEMORY[0x1E0D2FA88], CFSTR("numberOfDaysSinceLastNotification"), v6, v5);
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractBurdenSamplePropertiesIntoPayload:dataSource:](self, "_extractBurdenSamplePropertiesIntoPayload:dataSource:", v6, v5);
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:](self, "_extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:", v27, CFSTR("numberOfDaysSinceLastSleepEntry"), v6, v5);

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CE0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:](self, "_extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:", v28, CFSTR("numberOfDaysSinceLastAlcoholicDrinksEntry"), v6, v5);

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4928]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:](self, "_extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:", v29, CFSTR("numberOfDaysSinceLastMindfulMinutesEntry"), v6, v5);

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AB8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:](self, "_extractBucketedDaysSinceLastSampleOfType:intoProperty:inPayload:dataSource:", v30, CFSTR("numberOfDaysSinceLastBodyMassEntry"), v6, v5);

  -[HDHRAFibBurdenDailyAnalyticsEvent _extractWatchWearPropertiesIntoPayload:dataSource:](self, "_extractWatchWearPropertiesIntoPayload:dataSource:", v6, v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HDHRAFibBurdenAnalyticsEventHealthAppNotificationsAuthorizedProvider areHealthNotificationsAuthorized](self->_notificationsAuthorizedProvider, "areHealthNotificationsAuthorized"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CB4710]);

  v32 = (void *)objc_msgSend(v6, "copy");
  return v32;
}

- (void)_extractAFibBurdenFeatureStatusPropertiesFromDataSource:(id)a3 payload:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *MEMORY[0x1E0CB4FF8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke;
  v9[3] = &unk_1E87EFB88;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:](self, "_extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:", v7, a4, v8, v9, &__block_literal_global_4, &__block_literal_global_232);

}

void __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(v16, "featureSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberForKey:", *MEMORY[0x1E0CB50C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("isBurdenSettingEnabled"));
  objc_msgSend(v16, "featureSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberForKey:", *MEMORY[0x1E0D2FB30]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("isWeeklyNotificationSettingEnabled"));
  objc_msgSend(v16, "onboardingCompletion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v10, "completionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "_bucketedWeeksSinceDate:dataSource:", v13, *(_QWORD *)(a1 + 40)));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("weeksSinceOnboardedBurden"));

  objc_msgSend(v10, "version");
  HKHRAFibBurdenAnalyticsPropertyValueForVersion();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("versionBurden"));

}

void __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(a2, "areAllRequirementsSatisfied"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("isBurdenFeatureEnabled"));

}

void __101__HDHRAFibBurdenDailyAnalyticsEvent__extractAFibBurdenFeatureStatusPropertiesFromDataSource_payload___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *MEMORY[0x1E0CB46A0];
  v4 = a2;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("isBurdenSettingEnabled"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("isWeeklyNotificationSettingEnabled"));
  v3 = *MEMORY[0x1E0CB46A8];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], CFSTR("isBurdenFeatureEnabled"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("weeksSinceOnboardedBurden"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB4750], CFSTR("versionBurden"));

}

- (void)_extractIRNFeatureStatusPropertiesFromDataSource:(id)a3 payload:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = *MEMORY[0x1E0CB5038];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke;
  v9[3] = &unk_1E87EFB88;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[HDHRAFibBurdenDailyAnalyticsEvent _extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:](self, "_extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:", v7, a4, v8, v9, &__block_literal_global_233, &__block_literal_global_234);

}

void __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a2, "onboardingCompletion");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v10, "completionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "_bucketedWeeksSinceDate:dataSource:", v8, *(_QWORD *)(a1 + 40)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("weeksSinceOnboardedIRN"));

}

void __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(a2, "areAllRequirementsSatisfied"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("isIRNEnabled"));

}

void __94__HDHRAFibBurdenDailyAnalyticsEvent__extractIRNFeatureStatusPropertiesFromDataSource_payload___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *MEMORY[0x1E0CB46A0];
  v3 = a2;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("isIRNEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], CFSTR("weeksSinceOnboardedIRN"));

}

- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:(id)a3 payload:(id)a4 dataSource:(id)a5 ifOnboardedBlock:(id)a6 ifUsageRequirementsEvaluationPresentBlock:(id)a7 ifErrorRetrievingFeatureStatusBlock:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, void *, id);
  void (**v17)(id, void *, id);
  void (**v18)(id, id);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void (**v27)(id, id);
  id v28;
  id v29;
  void (**v30)(id, void *, id);
  void (**v31)(id, void *, id);
  void *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  HDHRAFibBurdenDailyAnalyticsEvent *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (void (**)(id, void *, id))a6;
  v17 = (void (**)(id, void *, id))a7;
  v18 = (void (**)(id, id))a8;
  objc_msgSend(a5, "healthDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "featureStatusProviderForIdentifier:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v42 = 0;
    objc_msgSend(v20, "featureStatusWithError:", &v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;
    v23 = v22;
    if (!v21)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v44 = self;
        v45 = 2114;
        v46 = v14;
        v47 = 2114;
        v48 = v23;
        _os_log_error_impl(&dword_1CC29C000, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving feature status for %{public}@: %{public}@", buf, 0x20u);
      }

      v18[2](v18, v15);
      goto LABEL_18;
    }
    v41 = v22;
    objc_msgSend(v21, "onboardingRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "onboardingCompletion");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(v21, "onboardingRecord");
      v27 = v18;
      v28 = v14;
      v29 = v15;
      v30 = v16;
      v31 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v21;
      v33 = objc_msgSend(v32, "onboardingState");

      v17 = v31;
      v16 = v30;
      v15 = v29;
      v14 = v28;
      v18 = v27;

      v34 = v33 == 3;
      v21 = v40;
      v23 = v41;
      if (v34)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v40, "onboardingRecord");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v35, v15);

      objc_msgSend(v40, "requirementsEvaluationByContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v17[2](v17, v24, v15);
      }
      else
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          -[HDHRAFibBurdenDailyAnalyticsEvent _extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:].cold.2();

      }
      v21 = v40;
    }

    v23 = v41;
    goto LABEL_18;
  }
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    -[HDHRAFibBurdenDailyAnalyticsEvent _extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:].cold.1();

  v18[2](v18, v15);
LABEL_19:

}

- (void)_extractDaysSinceDateInKeyValueDomain:(id)a3 withKey:(id)a4 intoProperty:(id)a5 inPayload:(id)a6 dataSource:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v17 = 0;
  objc_msgSend(a3, "dateForKey:error:", a4, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDHRAFibBurdenDailyAnalyticsEvent _daysSinceDate:maximum:dataSource:](self, "_daysSinceDate:maximum:dataSource:", v15, &unk_1E87FEDB0, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v12);

  }
  else if (v17)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], v12);
  }

}

- (void)_extractBurdenSamplePropertiesIntoPayload:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  HDHRAFibBurdenDailyAnalyticsEvent *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D29578];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v35 = 0;
  objc_msgSend(v9, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v8, WeakRetained, 0, 0, 0, &v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;

  if (v11)
  {
    v32 = v12;
    v33 = v8;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "_creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", -[HDHRAFibBurdenDailyAnalyticsEvent _daysSinceDate:maximum:dataSource:](self, "_daysSinceDate:maximum:dataSource:", v14, &unk_1E87FEDB0, v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v6;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("numberOfDaysSinceLastSample"));

    objc_msgSend(v7, "environmentDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "calendarCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "calendarForTimeZone:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v11, "hk_dayIndexRangeWithCalendar:", v19);
    v22 = v21;
    objc_msgSend(v7, "environmentDataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = HKHRAFibBurdenPreviousWeekDayIndexRange();
    v27 = v26;

    if (v20 == v25 && v22 - 1 == v27)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDHRAFibBurdenDailyAnalyticsEvent _bucketedBurdenValueForSample:](self, "_bucketedBurdenValueForSample:", v11));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v34;
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v28, CFSTR("previousWeekBurdenValue"));

      -[HDHRAFibBurdenDailyAnalyticsEvent _determineIfSamplesOverlappingSample:dataSource:](self, "_determineIfSamplesOverlappingSample:dataSource:", v11, v7);
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v29, CFSTR("previousWeekHasOverlappingSamples"));
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = self;
        _os_log_impl(&dword_1CC29C000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Most recent sample not for previous calendar week", buf, 0xCu);
      }
      v6 = v34;
    }
    v12 = v32;
    v8 = v33;

  }
  else if (v12)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenDailyAnalyticsEvent _extractBurdenSamplePropertiesIntoPayload:dataSource:].cold.1();

    v31 = *MEMORY[0x1E0CB46A8];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], CFSTR("numberOfDaysSinceLastSample"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("previousWeekBurdenValue"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A0], CFSTR("previousWeekHasOverlappingSamples"));
  }

}

- (id)_determineIfSamplesOverlappingSample:(id)a3 dataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v29;

  v6 = a3;
  objc_msgSend(a4, "environmentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarForTimeZone:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hk_dayIndexWithCalendar:", v10);

  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hk_dayIndexWithCalendar:", v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "hk_earliestPossibleDateWithDayIndex:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_latestPossibleDateWithDayIndex:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v16);
  v18 = (void *)MEMORY[0x1E0D29578];
  objc_msgSend(v6, "quantityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v6, "quantityType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForDateInterval();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v18, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v19, WeakRetained, 0, v22, 2, 0, &v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v29;

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unint64_t)objc_msgSend(v23, "count") > 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[HDHRAFibBurdenDailyAnalyticsEvent _determineIfSamplesOverlappingSample:dataSource:].cold.2();
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      -[HDHRAFibBurdenDailyAnalyticsEvent _determineIfSamplesOverlappingSample:dataSource:].cold.1();
    }

    v25 = (id)*MEMORY[0x1E0CB46A0];
  }

  return v25;
}

- (void)_extractBucketedDaysSinceLastSampleOfType:(id)a3 intoProperty:(id)a4 inPayload:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  HDHRAFibBurdenDailyAnalyticsEvent *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0D29578];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v25 = 0;
  objc_msgSend(v14, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v10, WeakRetained, 0, 0, 0, &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v25;

  if (v16)
  {
    objc_msgSend(v16, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDHRAFibBurdenDailyAnalyticsEvent _daysSinceDate:dataSource:](self, "_daysSinceDate:dataSource:", v18, v13);

    v20 = (id)*MEMORY[0x1E0CB46A8];
    v21 = v20;
    if (v19)
    {
      if (v19 == 1)
      {
        v22 = &unk_1E87FEDE0;
      }
      else if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v22 = &unk_1E87FEDF8;
      }
      else if ((v19 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      {
        v22 = &unk_1E87FEE10;
      }
      else if ((unint64_t)(v19 - 8) >= 7)
      {
        if ((unint64_t)(v19 - 15) >= 7)
        {
          if ((unint64_t)(v19 - 22) >= 7)
          {
            if ((unint64_t)(v19 - 29) >= 0x20)
            {
              if ((unint64_t)(v19 - 61) >= 0x1E)
              {
                if (v19 < 91)
                {
LABEL_27:
                  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v11);

                  goto LABEL_28;
                }
                v22 = &unk_1E87FEEA0;
              }
              else
              {
                v22 = &unk_1E87FEE88;
              }
            }
            else
            {
              v22 = &unk_1E87FEE70;
            }
          }
          else
          {
            v22 = &unk_1E87FEE58;
          }
        }
        else
        {
          v22 = &unk_1E87FEE40;
        }
      }
      else
      {
        v22 = &unk_1E87FEE28;
      }
    }
    else
    {
      v22 = &unk_1E87FEDC8;
    }

    v21 = v22;
    goto LABEL_27;
  }
  if (v17)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = self;
      v28 = 2114;
      v29 = v24;
      v30 = 2114;
      v31 = v17;
      _os_log_error_impl(&dword_1CC29C000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving sample of type %{public}@: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], v11);
  }
LABEL_28:

}

- (void)_extractWatchWearPropertiesIntoPayload:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[6];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "environmentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "currentDate");
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, -1, v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v10, "startOfDayForDate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v12;
  objc_msgSend(v10, "startOfDayForDate:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "component:fromDate:", 512, v13));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("previousCalendarDayOfWeek"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v33[5] = 0;
  HDAnalyticsBucketedNumberOfStandAndIdleHours();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;

  if (!v20)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenDailyAnalyticsEvent _extractWatchWearPropertiesIntoPayload:dataSource:].cold.1();

    v20 = (id)*MEMORY[0x1E0CB46A8];
  }
  v30 = (void *)v13;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("numberOfStandHoursInPreviousCalendarDay"));
  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v23 = v6;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke;
  v33[3] = &unk_1E87EFC70;
  v33[4] = self;
  -[HDHRAFibBurdenDailyAnalyticsEvent _numberOfSamplesOfType:dateInterval:additionalPredicate:bucketer:](self, "_numberOfSamplesOfType:dateInterval:additionalPredicate:bucketer:", v24, v17, 0, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("numberOfTachogramsInPreviousCalendarDay"));
  objc_msgSend(MEMORY[0x1E0CB6A70], "heartRateType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenDailyAnalyticsEvent _sedentaryAndBackgroundHeartRateContextPredicate](self, "_sedentaryAndBackgroundHeartRateContextPredicate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v25;
  v32[1] = 3221225472;
  v32[2] = __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_256;
  v32[3] = &unk_1E87EFC70;
  v32[4] = self;
  -[HDHRAFibBurdenDailyAnalyticsEvent _numberOfSamplesOfType:dateInterval:additionalPredicate:bucketer:](self, "_numberOfSamplesOfType:dateInterval:additionalPredicate:bucketer:", v27, v17, v28, v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("numberOfBackgroundHRSamplesInPreviousCalendarDay"));
}

id __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  NSObject *v3;

  if (a2)
  {
    if ((unint64_t)a2 >= 5)
    {
      if ((unint64_t)(a2 - 5) >= 6)
      {
        if ((unint64_t)(a2 - 11) >= 0xA)
        {
          if ((unint64_t)(a2 - 21) >= 0x14)
          {
            if (a2 <= 40)
            {
              _HKInitializeLogging();
              HKHRAFibBurdenLogForCategory();
              v3 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
                __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_cold_1();

              v2 = (id)*MEMORY[0x1E0CB46A8];
            }
            else
            {
              v2 = &unk_1E87FEF00;
            }
          }
          else
          {
            v2 = &unk_1E87FEEE8;
          }
        }
        else
        {
          v2 = &unk_1E87FEED0;
        }
      }
      else
      {
        v2 = &unk_1E87FEEB8;
      }
    }
    else
    {
      v2 = &unk_1E87FEDE0;
    }
  }
  else
  {
    v2 = &unk_1E87FEDC8;
  }
  return v2;
}

id __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_256(uint64_t a1, uint64_t a2)
{
  id v2;
  NSObject *v3;

  if (a2)
  {
    if ((unint64_t)a2 >= 5)
    {
      if ((unint64_t)(a2 - 5) >= 6)
      {
        if ((unint64_t)(a2 - 11) >= 0xA)
        {
          if ((unint64_t)(a2 - 21) >= 0x14)
          {
            if ((unint64_t)(a2 - 41) >= 0x3C)
            {
              if ((unint64_t)(a2 - 101) >= 0x3C)
              {
                if ((unint64_t)(a2 - 161) >= 0x3C)
                {
                  if ((unint64_t)(a2 - 221) >= 0x50)
                  {
                    if ((unint64_t)(a2 - 301) >= 0x64)
                    {
                      if (a2 <= 400)
                      {
                        _HKInitializeLogging();
                        HKHRAFibBurdenLogForCategory();
                        v3 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
                          __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_cold_1();

                        v2 = (id)*MEMORY[0x1E0CB46A8];
                      }
                      else
                      {
                        v2 = &unk_1E87FEF78;
                      }
                    }
                    else
                    {
                      v2 = &unk_1E87FEF60;
                    }
                  }
                  else
                  {
                    v2 = &unk_1E87FEF48;
                  }
                }
                else
                {
                  v2 = &unk_1E87FEF30;
                }
              }
              else
              {
                v2 = &unk_1E87FEF18;
              }
            }
            else
            {
              v2 = &unk_1E87FEF00;
            }
          }
          else
          {
            v2 = &unk_1E87FEEE8;
          }
        }
        else
        {
          v2 = &unk_1E87FEED0;
        }
      }
      else
      {
        v2 = &unk_1E87FEEB8;
      }
    }
    else
    {
      v2 = &unk_1E87FEDE0;
    }
  }
  else
  {
    v2 = &unk_1E87FEDC8;
  }
  return v2;
}

- (id)_numberOfSamplesOfType:(id)a3 dateInterval:(id)a4 additionalPredicate:(id)a5 bucketer:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v25;
  id v26;
  uint8_t buf[4];
  HDHRAFibBurdenDailyAnalyticsEvent *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  HDSampleEntityPredicateForDateInterval();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E0D29840];
    v33[0] = v12;
    v33[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateMatchingAllPredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  v17 = (void *)MEMORY[0x1E0D29578];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v26 = 0;
  v19 = objc_msgSend(v17, "countOfSamplesWithType:profile:matchingPredicate:withError:", v9, WeakRetained, v13, &v26);
  v20 = v26;

  if (v20)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = self;
      v29 = 2114;
      v30 = v25;
      v31 = 2114;
      v32 = v20;
      _os_log_error_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving sample count of type %{public}@: %{public}@", buf, 0x20u);

    }
    v22 = (id)*MEMORY[0x1E0CB46A8];
  }
  else
  {
    v11[2](v11, v19);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  return v23;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;

  v5 = a3;
  objc_msgSend(a4, "environmentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bucketedNumberOfWeeksSinceDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)*MEMORY[0x1E0CB46A8];
  if (v7)
    v8 = v7;
  v9 = v8;

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

- (int64_t)_daysSinceDate:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "environmentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "currentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v6, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "day");
  return v13;
}

- (int64_t)_daysSinceDate:(id)a3 maximum:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v17;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "environmentDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "currentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:toDate:options:", 16, v9, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "day");
  if (v7)
  {
    v17 = objc_msgSend(v7, "integerValue");
    if (v16 >= v17)
      v16 = v17;
  }

  return v16;
}

- (int64_t)_bucketedBurdenValueForSample:(id)a3
{
  void *v3;
  double v4;
  uint64_t v5;

  objc_msgSend(a3, "quantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_value");
  v5 = (uint64_t)(v4 * 100.0);

  if (v5 < 3)
    return 2;
  if ((unint64_t)v5 >= 0xA)
    return 10 * (v5 / 0xAuLL);
  return 3;
}

- (id)_sedentaryAndBackgroundHeartRateContextPredicate
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E87FEF90, &unk_1E87FEFA8, &unk_1E87FEFC0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "metadataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithMetadataKey:allowedValues:", *MEMORY[0x1E0CB7298], v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsAuthorizedProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error when determining age, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_1CC29C000, v0, v1, "[%{public}@] No error when fetching biological sex but also didn't get object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)makeIHAGatedEventPayloadWithDataSource:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error when determining biological sex, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_1CC29C000, v0, v1, "[%{public}@] No feature status provider could be found for %{public}@.");
  OUTLINED_FUNCTION_2();
}

- (void)_extractFeatureStatusPropertiesForFeatureIdentifier:payload:dataSource:ifOnboardedBlock:ifUsageRequirementsEvaluationPresentBlock:ifErrorRetrievingFeatureStatusBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_1CC29C000, v0, v1, "[%{public}@] No usage requirements evaluation found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_extractBurdenSamplePropertiesIntoPayload:dataSource:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error when retrieving burden sample: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_determineIfSamplesOverlappingSample:dataSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_1CC29C000, v0, v1, "[%{public}@] When determining overlapping samples could no longer find previous sample.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_determineIfSamplesOverlappingSample:dataSource:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error when retrieving all previous week samples: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_extractWatchWearPropertiesIntoPayload:dataSource:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v4 = 2114;
  v5 = v0;
  v6 = 2114;
  v7 = v1;
  _os_log_error_impl(&dword_1CC29C000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving sample count of type %{public}@: %{public}@", v3, 0x20u);
}

void __87__HDHRAFibBurdenDailyAnalyticsEvent__extractWatchWearPropertiesIntoPayload_dataSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_2(&dword_1CC29C000, v0, v1, "[%{public}@] Unexpectedly got %{sensitive}ld tachograms");
  OUTLINED_FUNCTION_2();
}

@end
