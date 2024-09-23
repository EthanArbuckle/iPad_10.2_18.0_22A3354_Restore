@implementation HDHRAFibBurdenNotificationAnalyticsEvent

- (HDHRAFibBurdenNotificationAnalyticsEvent)initWithNotificationMode:(id)a3 featureStatus:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDHRAFibBurdenBiomeFocusModeDeterminer *v11;
  void *v12;
  HDHRAFibBurdenNotificationAnalyticsEvent *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HDHRAFibBurdenBiomeFocusModeDeterminer);
  objc_msgSend(v8, "notificationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HDHRAFibBurdenNotificationAnalyticsEvent initWithNotificationMode:featureStatus:focusModeDeterminer:notificationsAuthorizedProvider:](self, "initWithNotificationMode:featureStatus:focusModeDeterminer:notificationsAuthorizedProvider:", v10, v9, v11, v12);
  return v13;
}

- (HDHRAFibBurdenNotificationAnalyticsEvent)initWithNotificationMode:(id)a3 featureStatus:(id)a4 focusModeDeterminer:(id)a5 notificationsAuthorizedProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDHRAFibBurdenNotificationAnalyticsEvent *v15;
  HDHRAFibBurdenNotificationAnalyticsEvent *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDHRAFibBurdenNotificationAnalyticsEvent;
  v15 = -[HDHRAFibBurdenNotificationAnalyticsEvent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationMode, a3);
    objc_storeStrong((id *)&v16->_featureStatus, a4);
    objc_storeStrong((id *)&v16->_focusModeDeterminer, a5);
    objc_storeStrong((id *)&v16->_notificationsAuthorizedProvider, a6);
  }

  return v16;
}

- (NSString)eventName
{
  return (NSString *)(id)*MEMORY[0x1E0D2FA38];
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
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "healthDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v7, "biologicalSexWithError:", &v48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v48;

  if (v9)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.3();

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
  HKHRAFibBurdenLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[HDHRAFibBurdenNotificationAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.3((uint64_t)self, v9, v41, v42, v43, v44, v45, v46);
LABEL_8:

  objc_msgSend(v5, "healthDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v14, "ageWithCurrentDate:error:", v16, &v47);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v47;

  if (v18)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.1();

    v20 = (void *)*MEMORY[0x1E0CB46A8];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CB74F8]);
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

  -[HKFeatureStatus onboardingRecord](self->_featureStatus, "onboardingRecord");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "onboardingCompletion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v23, "version");
    HKHRAFibBurdenAnalyticsPropertyValueForVersion();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("featureVersion"));

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[HDHRAFibBurdenNotificationAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:].cold.1((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB4750], CFSTR("featureVersion"));
  }
  -[HDHRAFibBurdenNotificationAnalyticsEvent _notificationTypeStringForType:](self, "_notificationTypeStringForType:", -[HKHRAFibBurdenNotificationMode type](self->_notificationMode, "type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("notificationType"));

  -[HKHRAFibBurdenNotificationMode currentValueClamped](self->_notificationMode, "currentValueClamped");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[HKHRAFibBurdenNotificationMode currentValueClamped](self->_notificationMode, "currentValueClamped");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("wasDataClamped"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKHRAFibBurdenNotificationMode shouldForwardToWatch](self->_notificationMode, "shouldForwardToWatch"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("wasForwardedToWatch"));

  -[HKHRAFibBurdenNotificationMode previousTimeZoneDiffersFromCurrent](self->_notificationMode, "previousTimeZoneDiffersFromCurrent");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[HKHRAFibBurdenNotificationMode previousTimeZoneDiffersFromCurrent](self->_notificationMode, "previousTimeZoneDiffersFromCurrent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("wasPreviousValueInDifferentTimeZone"));

  }
  -[HDHRAFibBurdenNotificationAnalyticsEventFocusModeDeterminer isFocusModeOn](self->_focusModeDeterminer, "isFocusModeOn");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("isFocusModeOn"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HDHRAFibBurdenAnalyticsEventHealthAppNotificationsAuthorizedProvider areHealthNotificationsAuthorized](self->_notificationsAuthorizedProvider, "areHealthNotificationsAuthorized"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0CB4710]);

  return v6;
}

- (id)_notificationTypeStringForType:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 3)
    return CFSTR("insufficientData");
  if (a3 == 2)
    return CFSTR("burdenPercentageWithPreviousValue");
  if (a3)
    return CFSTR("burdenPercentageWithoutPreviousValue");
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[HDHRAFibBurdenNotificationAnalyticsEvent _notificationTypeStringForType:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  return (id)*MEMORY[0x1E0CB4750];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsAuthorizedProvider, 0);
  objc_storeStrong((id *)&self->_focusModeDeterminer, 0);
  objc_storeStrong((id *)&self->_featureStatus, 0);
  objc_storeStrong((id *)&self->_notificationMode, 0);
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CC29C000, a2, a3, "[%{public}@] No onboarding completion when sending notification analytics event", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CC29C000, a2, a3, "[%{public}@] No error when fetching biological sex but also didn't get object", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_notificationTypeStringForType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CC29C000, a2, a3, "[%{public}@] Sending notification event when we actually do not have notification", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
