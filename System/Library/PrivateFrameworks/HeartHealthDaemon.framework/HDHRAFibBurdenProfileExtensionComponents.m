@implementation HDHRAFibBurdenProfileExtensionComponents

- (HDFeatureAvailabilityExtension)featureAvailabilityManager
{
  return self->_featureAvailabilityManager;
}

- (HDHRAFibBurdenProfileExtensionComponents)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHRAFibBurdenProfileExtensionComponents)initWithProfile:(id)a3
{
  id v4;
  HDHRAFibBurdenProfileExtensionComponents *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  HDFeatureAvailabilityExtension *featureAvailabilityManager;
  void *v30;
  HKHRAFibBurdenAnalyzer *v31;
  HKHRAFibBurdenAnalyzer *analyzer;
  objc_class *v33;
  id v34;
  uint64_t v35;
  HKFeatureStatusManager *featureStatusManager;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v37;
  HKHRAFibBurdenSevenDayAnalysisScheduling *sevenDayAnalysisScheduler;
  HDHRAFibBurdenNotificationManager *v39;
  HDHRAFibBurdenNotificationManaging *notificationManager;
  HDHRAFibBurdenRescindedNotificationManager *v41;
  HDHRAFibBurdenRescindedNotificationManager *notificationsRescindedManager;
  id v43;
  void *v44;
  uint64_t v45;
  HDAnalyticsDailyEventManager *dailyAnalyticsEventManager;
  void *v47;
  HDHRAFibBurdenNotificationManager *v49;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HDHRAFibBurdenProfileExtensionComponents *v56;
  objc_super v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)HDHRAFibBurdenProfileExtensionComponents;
  v5 = -[HDHRAFibBurdenProfileExtensionComponents init](&v57, sel_init);
  if (v5)
  {
    HKHRAFibBurdenLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (id)*MEMORY[0x1E0CB4FF8];
    objc_msgSend(MEMORY[0x1E0CB6538], "localAvailabilityForAFibBurden");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D294C8]);
    objc_msgSend(v4, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v8;
    v11 = objc_msgSend(v9, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v7, v8, v10);

    v12 = objc_alloc(MEMORY[0x1E0D29538]);
    HKHRAFibBurdenLocalFeatureAttributes();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v11;
    v51 = (void *)objc_msgSend(v12, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v7, v13, v11);

    v14 = objc_alloc(MEMORY[0x1E0D29510]);
    objc_msgSend(v4, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDaemon:featureIdentifier:", v15, v7);

    +[HDHRAFibBurdenProfileExtensionComponents determineDeviceCapability](HDHRAFibBurdenProfileExtensionComponents, "determineDeviceCapability");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)v6;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D295C8]), "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v51, v4, v17, v6);
    v19 = objc_alloc(MEMORY[0x1E0D294A8]);
    objc_msgSend(v4, "daemon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nanoRegistryDeviceCapabilityProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithFeatureIdentifier:currentOnboardingVersion:pairedDeviceCapability:pairedDeviceCapabilityProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v7, 1, v17, v21, v18, v16, v6);

    v23 = objc_alloc(MEMORY[0x1E0D29568]);
    v58[0] = *MEMORY[0x1E0CB50C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithRequiredSettingsKeys:", v24);

    v26 = objc_alloc(MEMORY[0x1E0D294A0]);
    objc_msgSend(MEMORY[0x1E0D2FB90], "requirementSet");
    v27 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v25;
    v28 = objc_msgSend(v26, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:onboardingEligibilityDeterminer:featureSettingsAtOnboardingTimeValidator:loggingCategory:", v4, v7, v27, 1, v17, v51, v18, v16, v22, v25, v55);
    featureAvailabilityManager = v5->_featureAvailabilityManager;
    v5->_featureAvailabilityManager = (HDFeatureAvailabilityExtension *)v28;

    objc_msgSend(v51, "synchronizeLocalProperties");
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v30, "isAppleWatch");

    if ((v27 & 1) == 0)
    {
      v31 = -[HKHRAFibBurdenAnalyzer initWithProfile:]([HKHRAFibBurdenAnalyzer alloc], "initWithProfile:", v4);
      analyzer = v5->_analyzer;
      v5->_analyzer = v31;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (objc_class *)MEMORY[0x1E0CB6730];
        v34 = v4;
        v35 = objc_msgSend([v33 alloc], "initWithFeatureAvailabilityProviding:healthDataSource:", v5->_featureAvailabilityManager, v34);
        featureStatusManager = v5->_featureStatusManager;
        v5->_featureStatusManager = (HKFeatureStatusManager *)v35;

        v37 = -[HKHRAFibBurdenSevenDayAnalysisScheduler initWithProfile:featureStatusManager:onboardingEligibilityDeterminer:analyzer:]([HKHRAFibBurdenSevenDayAnalysisScheduler alloc], "initWithProfile:featureStatusManager:onboardingEligibilityDeterminer:analyzer:", v34, v5->_featureStatusManager, v22, v5->_analyzer);
        sevenDayAnalysisScheduler = v5->_sevenDayAnalysisScheduler;
        v5->_sevenDayAnalysisScheduler = (HKHRAFibBurdenSevenDayAnalysisScheduling *)v37;
        v50 = v37;

        v39 = -[HDHRAFibBurdenNotificationManager initWithProfile:]([HDHRAFibBurdenNotificationManager alloc], "initWithProfile:", v34);
        notificationManager = v5->_notificationManager;
        v5->_notificationManager = (HDHRAFibBurdenNotificationManaging *)v39;
        v49 = v39;

        v41 = -[HDHRAFibBurdenRescindedNotificationManager initWithProfile:featureStatusProvider:]([HDHRAFibBurdenRescindedNotificationManager alloc], "initWithProfile:featureStatusProvider:", v34, v5->_featureStatusManager);
        notificationsRescindedManager = v5->_notificationsRescindedManager;
        v5->_notificationsRescindedManager = v41;

        -[HKHRAFibBurdenSevenDayAnalysisScheduler setDelegate:](v50, "setDelegate:", v49);
        v43 = objc_alloc(MEMORY[0x1E0D29410]);
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB62B8]), "initWithLoggingCategory:healthDataSource:", v55, v34);
        v45 = objc_msgSend(v43, "initWithProfile:eventSubmissionManager:logCategory:eventConstructor:", v34, v44, v55, &__block_literal_global_0);

        dailyAnalyticsEventManager = v5->_dailyAnalyticsEventManager;
        v5->_dailyAnalyticsEventManager = (HDAnalyticsDailyEventManager *)v45;

      }
    }
    HKCreateSerialDispatchQueue();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v5;
    v56->_stateHandlerHandle = HDAddStateHandler();

  }
  return v5;
}

HDHRAFibBurdenDailyAnalyticsEvent *__60__HDHRAFibBurdenProfileExtensionComponents_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDHRAFibBurdenDailyAnalyticsEvent *v3;

  v2 = a2;
  v3 = -[HDHRAFibBurdenDailyAnalyticsEvent initWithProfile:]([HDHRAFibBurdenDailyAnalyticsEvent alloc], "initWithProfile:", v2);

  return v3;
}

id __60__HDHRAFibBurdenProfileExtensionComponents_initWithProfile___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showSensitiveLogItems");

  if (v4)
    v5 = CFSTR("Enabled");
  else
    v5 = CFSTR("Disabled");
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("Sensitive Logging"));
  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/System/Library/Preferences/Logging/Subsystems/com.apple.Health.AFibBurden.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v16);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("AFib History Logging Plist"));
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v19 = v14;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to read AFib History logging plist: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to fetch AFib History logging plist: %@", buf, 0x16u);
    }
    v11 = v9;
  }

  return v2;
}

- (id)_initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDHRAFibBurdenProfileExtensionComponents;
  return -[HDHRAFibBurdenProfileExtensionComponents init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stateHandlerHandle)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)HDHRAFibBurdenProfileExtensionComponents;
  -[HDHRAFibBurdenProfileExtensionComponents dealloc](&v3, sel_dealloc);
}

+ (id)makeComponentsForProfile:(id)a3
{
  id v4;
  HDHRAFibBurdenProfileExtensionComponents *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "profileType") == 1
    || objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && objc_msgSend(v4, "profileType") == 100)
  {
    v5 = -[HDHRAFibBurdenProfileExtensionComponents initWithProfile:]([HDHRAFibBurdenProfileExtensionComponents alloc], "initWithProfile:", v4);
  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = a1;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not creating AFib Burden components for profile %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)makeComponentsForTesting
{
  return -[HDHRAFibBurdenProfileExtensionComponents _initForTesting]([HDHRAFibBurdenProfileExtensionComponents alloc], "_initForTesting");
}

+ (id)determineDeviceCapability
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isAppleWatch") & 1) != 0)
    v3 = 0;
  else
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("46D9FF45-6717-4357-9B04-2E06E1095260"));

  return v3;
}

- (void)setFeatureAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_featureAvailabilityManager, a3);
}

- (HKFeatureStatusManager)featureStatusManager
{
  return self->_featureStatusManager;
}

- (void)setFeatureStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatusManager, a3);
}

- (HDAnalyticsDailyEventManager)dailyAnalyticsEventManager
{
  return self->_dailyAnalyticsEventManager;
}

- (void)setDailyAnalyticsEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_dailyAnalyticsEventManager, a3);
}

- (unint64_t)stateHandlerHandle
{
  return self->_stateHandlerHandle;
}

- (void)setStateHandlerHandle:(unint64_t)a3
{
  self->_stateHandlerHandle = a3;
}

- (HDHRAFibBurdenNotificationManaging)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (HDHRAFibBurdenRescindedNotificationManager)notificationsRescindedManager
{
  return self->_notificationsRescindedManager;
}

- (void)setNotificationsRescindedManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsRescindedManager, a3);
}

- (HKHRAFibBurdenSevenDayAnalysisScheduling)sevenDayAnalysisScheduler
{
  return self->_sevenDayAnalysisScheduler;
}

- (void)setSevenDayAnalysisScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_sevenDayAnalysisScheduler, a3);
}

- (HKHRAFibBurdenAnalyzer)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_analyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_sevenDayAnalysisScheduler, 0);
  objc_storeStrong((id *)&self->_notificationsRescindedManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_featureStatusManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end
