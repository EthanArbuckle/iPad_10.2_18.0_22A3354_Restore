@implementation HDMobilityProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2EA8]) & 1) != 0)
  {
    v5 = 40;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2EA0]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = 24;
  }
  v6 = *(id *)((char *)&self->super.isa + v5);
LABEL_7:

  return v6;
}

- (HDMobilityProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDMobilityProfileExtension *v5;
  HDMobilityProfileExtension *v6;
  void *v7;
  char v8;
  os_log_t *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  HDFeatureAvailabilityManager *walkingSteadinessClassificationsAvailabilityManager;
  HDMobilityNotificationManager *v17;
  HDMobilityNotificationManager *notificationManager;
  void *v19;
  void *v20;
  uint64_t v21;
  HDBackgroundFeatureDeliveryManager *walkingSteadinessClassificationsBackgroundFeatureDeliveryManager;
  uint64_t v23;
  HDSettingsMigrationManager *settingsMigrationManager;
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *v25;
  HDMobilityWalkingSteadinessFeatureAvailabilityManager *walkingSteadinessNotificationsAvailabilityManager;
  id v27;
  void *v28;
  uint64_t v29;
  HDAnalyticsDailyEventManager *walkingSteadinessDailyAnalyticsEventManager;
  os_log_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  HDMobilityProfileExtension *v35;
  objc_super v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HDMobilityProfileExtension;
  v5 = -[HDMobilityProfileExtension init](&v37, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAppleWatch");

    v9 = (os_log_t *)MEMORY[0x24BDD3040];
    if ((v8 & 1) == 0)
    {
      v10 = objc_alloc_init(MEMORY[0x24BE40AC0]);
      objc_msgSend(MEMORY[0x24BE40BA8], "anyCountryAvailability");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x24BE40AB8]);
      v13 = *MEMORY[0x24BDD2EA0];
      objc_msgSend(MEMORY[0x24BE46DB0], "requirementSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v4, v13, v14, 1, 0, v11, v10, *v9);
      walkingSteadinessClassificationsAvailabilityManager = v6->_walkingSteadinessClassificationsAvailabilityManager;
      v6->_walkingSteadinessClassificationsAvailabilityManager = (HDFeatureAvailabilityManager *)v15;

      v17 = -[HDMobilityNotificationManager initWithProfile:walkingSteadinessAvailabilityManager:]([HDMobilityNotificationManager alloc], "initWithProfile:walkingSteadinessAvailabilityManager:", v4, v6->_walkingSteadinessClassificationsAvailabilityManager);
      notificationManager = v6->_notificationManager;
      v6->_notificationManager = v17;

      objc_msgSend(v4, "daemon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "behavior");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v20, "isCompanionCapable");

      if ((_DWORD)v14)
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE40A48]), "initWithProfile:featureAvailabilityExtension:loggingCategory:", v4, v6->_walkingSteadinessClassificationsAvailabilityManager, *v9);
        walkingSteadinessClassificationsBackgroundFeatureDeliveryManager = v6->_walkingSteadinessClassificationsBackgroundFeatureDeliveryManager;
        v6->_walkingSteadinessClassificationsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v21;

        if (objc_msgSend(v4, "profileType") == 1)
        {
          v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE40BD0]), "initForWalkingSteadinessWithProfile:delegate:", v4, v6);
          settingsMigrationManager = v6->_settingsMigrationManager;
          v6->_settingsMigrationManager = (HDSettingsMigrationManager *)v23;

        }
      }
      v25 = -[HDMobilityWalkingSteadinessFeatureAvailabilityManager initWithProfile:regionAvailabilityProvider:]([HDMobilityWalkingSteadinessFeatureAvailabilityManager alloc], "initWithProfile:regionAvailabilityProvider:", v4, v11);
      walkingSteadinessNotificationsAvailabilityManager = v6->_walkingSteadinessNotificationsAvailabilityManager;
      v6->_walkingSteadinessNotificationsAvailabilityManager = v25;

      v27 = objc_alloc(MEMORY[0x24BE40A28]);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3918]), "initWithLoggingCategory:healthDataSource:", *v9, v4);
      v29 = objc_msgSend(v27, "initWithProfile:eventSubmissionManager:logCategory:eventConstructor:", v4, v28, *v9, &__block_literal_global);
      walkingSteadinessDailyAnalyticsEventManager = v6->_walkingSteadinessDailyAnalyticsEventManager;
      v6->_walkingSteadinessDailyAnalyticsEventManager = (HDAnalyticsDailyEventManager *)v29;

    }
    _HKInitializeLogging();
    v31 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = objc_opt_class();
      v34 = objc_msgSend(v4, "profileType");
      *(_DWORD *)buf = 138543618;
      v39 = v33;
      v40 = 2048;
      v41 = v34;
      _os_log_impl(&dword_2160FB000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Plugin loaded for profileType %ld", buf, 0x16u);

    }
    v35 = v6;
  }

  return v6;
}

id __46__HDMobilityProfileExtension_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource *v3;
  void *v4;

  v2 = a2;
  v3 = -[HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource initWithProfile:]([HDMobilityWalkingSteadinessAnalyticsDailyEventDataSource alloc], "initWithProfile:", v2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE46D90]), "initWithDataSource:", v3);
  return v4;
}

- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  id v8;
  HDSettingsMigrationManager *settingsMigrationManager;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *v10;
  id WeakRetained;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *v12;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *walkingSteadinessOnboardingAcknowledgementMigrationManager;
  int v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v14 = 138543362;
    v15 = (id)objc_opt_class();
    v8 = v15;
    _os_log_impl(&dword_2160FB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings migration finished, initiating onboarding acknowledgement migration manager", (uint8_t *)&v14, 0xCu);

  }
  settingsMigrationManager = self->_settingsMigrationManager;
  self->_settingsMigrationManager = 0;

  v10 = [HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager initWithProfile:delegate:](v10, "initWithProfile:delegate:", WeakRetained, self);
  walkingSteadinessOnboardingAcknowledgementMigrationManager = self->_walkingSteadinessOnboardingAcknowledgementMigrationManager;
  self->_walkingSteadinessOnboardingAcknowledgementMigrationManager = v12;

  if (v4)
    -[HDMobilityProfileExtension _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("HDMobilityProfileExtension.settingsMigrationManagerDidRunMigrationSteps"));
}

- (void)onboardingAcknowledgementMigrationManager:(id)a3 didCompleteMigrationWithDidUpdate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v8 = v10;
    _os_log_impl(&dword_2160FB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding acknowledgement migration completed", (uint8_t *)&v9, 0xCu);

  }
  if (v4)
    -[HDMobilityProfileExtension _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("HDMobilityProfileExtension.onboardingAcknowledgementMigrationManagerDidRunMigrationSteps"));
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD3A00]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
  v9 = (void *)objc_msgSend(v7, "initWithChangesSyncRequest:", v8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_24D4DFA78;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v10, v11);

}

void __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3040];
  v7 = *MEMORY[0x24BDD3040];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v11 = v9;
      _os_log_impl(&dword_2160FB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSteadinessOnboardingAcknowledgementMigrationManager, 0);
  objc_storeStrong((id *)&self->_settingsMigrationManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessDailyAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessNotificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessClassificationsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_walkingSteadinessClassificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __62__HDMobilityProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = a3;
  v8 = v6;
  _os_log_error_impl(&dword_2160FB000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
