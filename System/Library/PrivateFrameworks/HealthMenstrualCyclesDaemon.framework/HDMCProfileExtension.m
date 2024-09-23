@implementation HDMCProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E28]) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E38]) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E30]) & 1) != 0)
  {
    v5 = 64;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD2E40]))
    {
      v6 = 0;
      goto LABEL_10;
    }
    v5 = 40;
  }
  v6 = *(id *)((char *)&self->super.isa + v5);
LABEL_10:

  return v6;
}

- (HDMCAnalysisManager)analysisManager
{
  return self->_analysisManager;
}

- (HDMCProfileExtension)initWithProfile:(id)a3 settingsManager:(id)a4
{
  id v6;
  id v7;
  HDMCProfileExtension *v8;
  HDMCProfileExtension *v9;
  HKCalendarCache *v10;
  HKCalendarCache *calendarCache;
  HDMCDeviceScopedStorageManager *v12;
  id WeakRetained;
  uint64_t v14;
  HDMCDeviceScopedStorageManager *deviceScopedStorageManager;
  void *v16;
  id v17;
  uint64_t v18;
  HDFeatureAvailabilityManager *featureAvailabilityManager;
  void *v20;
  id v21;
  uint64_t v22;
  HDFeatureAvailabilityManager *heartRateFeatureAvailabilityManager;
  id v24;
  void *v25;
  void *v26;
  int v27;
  os_log_t *v28;
  id v29;
  id v30;
  uint64_t v31;
  HDBackgroundFeatureDeliveryManager *heartRateBackgroundFeatureDeliveryManager;
  void *v33;
  id v34;
  uint64_t v35;
  HDFeatureAvailabilityManager *wristTemperatureInputAvailabilityManager;
  id v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  id v42;
  uint64_t v43;
  HDBackgroundFeatureDeliveryManager *wristTemperatureInputBackgroundFeatureDeliveryManager;
  void *v45;
  id v46;
  uint64_t v47;
  HDFeatureAvailabilityManager *deviationsFeatureAvailabilityManager;
  id v49;
  id v50;
  os_log_t *v51;
  uint64_t v52;
  HDBackgroundFeatureDeliveryManager *deviationsBackgroundFeatureDeliveryManager;
  _TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *v54;
  void *v55;
  uint64_t v56;
  _TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *experienceModelManager;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *v58;
  _TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *v59;
  void *v60;
  uint64_t v61;
  _TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *pregnancyManager;
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *v63;
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *pregnancyRequirementEvaluator;
  _TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *v65;
  _TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *pregnancyFeatureAdjustmentManager;
  HDMCAnalysisManager *v67;
  HDMCAnalysisManager *analysisManager;
  HDMCNotificationSyncManager *v69;
  HDMCNotificationSyncManager *notificationSyncManager;
  HDMCNotificationManager *v71;
  HDMCNotificationManager *notificationManager;
  HDMCAnalysisScheduler *v73;
  void *v74;
  uint64_t v75;
  HDMCAnalysisScheduler *analysisScheduler;
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *v77;
  _TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *widgetSchedulingManager;
  void *v79;
  id v80;
  uint64_t v81;
  HDMCAnalyticsManager *v82;
  HDMCAnalyticsManager *analyticsManager;
  HDMCAnalysisManager *v84;
  id v85;
  os_log_t v86;
  HDMCAnalysisManager *v87;
  uint64_t v88;
  HDAnalyticsDailyEventManager *wristTemperatureDailyEventManager;
  void *v90;
  int v91;
  id v92;
  id v93;
  void *v94;
  uint64_t v95;
  HDSettingsMigrationManager *settingsMigrationManager;
  HDMCPostInstallUpdateManager *v97;
  HDMCPostInstallUpdateManager *postInstallUpdateManager;
  os_log_t v99;
  NSObject *v100;
  void *v101;
  id v102;
  void *v104;
  _QWORD v105[4];
  HDMCAnalysisManager *v106;
  objc_super v107;
  uint8_t buf[4];
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v107.receiver = self;
  v107.super_class = (Class)HDMCProfileExtension;
  v8 = -[HDMCProfileExtension init](&v107, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_16;
  objc_storeWeak((id *)&v8->_profile, v6);
  v10 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x24BDD3968]);
  calendarCache = v9->_calendarCache;
  v9->_calendarCache = v10;

  objc_storeStrong((id *)&v9->_settingsManager, a4);
  v12 = [HDMCDeviceScopedStorageManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
  v104 = v7;
  v14 = -[HDMCDeviceScopedStorageManager initWithProfile:settingsManager:](v12, "initWithProfile:settingsManager:", WeakRetained, v7);
  deviceScopedStorageManager = v9->_deviceScopedStorageManager;
  v9->_deviceScopedStorageManager = (HDMCDeviceScopedStorageManager *)v14;

  v16 = (void *)MEMORY[0x24BE40AB8];
  v17 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v16, "hdmc_menstrualCyclesAvailabilityManagerWithProfile:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  featureAvailabilityManager = v9->_featureAvailabilityManager;
  v9->_featureAvailabilityManager = (HDFeatureAvailabilityManager *)v18;

  v20 = (void *)MEMORY[0x24BE40AB8];
  v21 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v20, "hdmc_heartRateInputAvailabilityManagerWithProfile:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  heartRateFeatureAvailabilityManager = v9->_heartRateFeatureAvailabilityManager;
  v9->_heartRateFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v22;

  v24 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v24, "daemon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "behavior");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isCompanionCapable");

  v28 = (os_log_t *)MEMORY[0x24BDD3030];
  if (v27)
  {
    v29 = objc_alloc(MEMORY[0x24BE40A48]);
    v30 = objc_loadWeakRetained((id *)&v9->_profile);
    v31 = objc_msgSend(v29, "initWithProfile:featureAvailabilityExtension:loggingCategory:", v30, v9->_heartRateFeatureAvailabilityManager, *v28);
    heartRateBackgroundFeatureDeliveryManager = v9->_heartRateBackgroundFeatureDeliveryManager;
    v9->_heartRateBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v31;

  }
  v33 = (void *)MEMORY[0x24BE40AB8];
  v34 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v33, "hdmc_wristTemperatureInputAvailabilityManagerWithProfile:", v34);
  v35 = objc_claimAutoreleasedReturnValue();
  wristTemperatureInputAvailabilityManager = v9->_wristTemperatureInputAvailabilityManager;
  v9->_wristTemperatureInputAvailabilityManager = (HDFeatureAvailabilityManager *)v35;

  v37 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v37, "daemon");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "behavior");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isCompanionCapable");

  if (v40)
  {
    v41 = objc_alloc(MEMORY[0x24BE40A48]);
    v42 = objc_loadWeakRetained((id *)&v9->_profile);
    v43 = objc_msgSend(v41, "initWithProfile:featureAvailabilityExtension:loggingCategory:", v42, v9->_wristTemperatureInputAvailabilityManager, *v28);
    wristTemperatureInputBackgroundFeatureDeliveryManager = v9->_wristTemperatureInputBackgroundFeatureDeliveryManager;
    v9->_wristTemperatureInputBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v43;

  }
  v45 = (void *)MEMORY[0x24BE40AB8];
  v46 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v45, "hdmc_deviationsAvailabilityManagerWithProfile:", v46);
  v47 = objc_claimAutoreleasedReturnValue();
  deviationsFeatureAvailabilityManager = v9->_deviationsFeatureAvailabilityManager;
  v9->_deviationsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v47;

  v49 = objc_alloc(MEMORY[0x24BE40A48]);
  v50 = objc_loadWeakRetained((id *)&v9->_profile);
  v51 = v28;
  v52 = objc_msgSend(v49, "initWithProfile:featureAvailabilityExtension:loggingCategory:", v50, v9->_deviationsFeatureAvailabilityManager, *v28);
  deviationsBackgroundFeatureDeliveryManager = v9->_deviationsBackgroundFeatureDeliveryManager;
  v9->_deviationsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v52;

  v54 = [_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager alloc];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[HDMCExperienceModelManager initWithNotificationProvider:](v54, "initWithNotificationProvider:", v55);
  experienceModelManager = v9->_experienceModelManager;
  v9->_experienceModelManager = (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *)v56;

  v58 = [_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager alloc];
  v59 = v9->_experienceModelManager;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[HDMCPregnancyManager initWithProfile:operation:experienceModelProvider:notificationProvider:calendarCache:](v58, "initWithProfile:operation:experienceModelProvider:notificationProvider:calendarCache:", v6, 0, v59, v60, v9->_calendarCache);
  pregnancyManager = v9->_pregnancyManager;
  v9->_pregnancyManager = (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *)v61;

  v63 = -[HDMCPregnancyRequirementEvaluator initWithPregnancyManager:]([_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator alloc], "initWithPregnancyManager:", v9->_pregnancyManager);
  pregnancyRequirementEvaluator = v9->_pregnancyRequirementEvaluator;
  v9->_pregnancyRequirementEvaluator = v63;

  v65 = -[HDMCPregnancyFeatureAdjustmentManager initWithPregnancyManager:profile:experienceModelProvider:]([_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager alloc], "initWithPregnancyManager:profile:experienceModelProvider:", v9->_pregnancyManager, v6, v9->_experienceModelManager);
  pregnancyFeatureAdjustmentManager = v9->_pregnancyFeatureAdjustmentManager;
  v9->_pregnancyFeatureAdjustmentManager = v65;

  v67 = -[HDMCAnalysisManager initWithProfile:settingsManager:featureAvailabilityManager:heartRateAvailabilityManager:wristTemperatureAvailabilityManager:deviationsAvailabilityManager:deviceScopedStorageManager:calendarCache:]([HDMCAnalysisManager alloc], "initWithProfile:settingsManager:featureAvailabilityManager:heartRateAvailabilityManager:wristTemperatureAvailabilityManager:deviationsAvailabilityManager:deviceScopedStorageManager:calendarCache:", v6, v9->_settingsManager, v9->_featureAvailabilityManager, v9->_heartRateFeatureAvailabilityManager, v9->_wristTemperatureInputAvailabilityManager, v9->_deviationsFeatureAvailabilityManager, v9->_deviceScopedStorageManager, v9->_calendarCache);
  analysisManager = v9->_analysisManager;
  v9->_analysisManager = v67;

  v69 = -[HDMCNotificationSyncManager initWithProfile:]([HDMCNotificationSyncManager alloc], "initWithProfile:", v6);
  notificationSyncManager = v9->_notificationSyncManager;
  v9->_notificationSyncManager = v69;

  v71 = -[HDMCNotificationManager initWithProfile:analysisManager:settingsManager:deviceScopedStorageManager:notificationSyncManager:]([HDMCNotificationManager alloc], "initWithProfile:analysisManager:settingsManager:deviceScopedStorageManager:notificationSyncManager:", v6, v9->_analysisManager, v9->_settingsManager, v9->_deviceScopedStorageManager, v9->_notificationSyncManager);
  notificationManager = v9->_notificationManager;
  v9->_notificationManager = v71;

  if ((HDIsUnitTesting() & 1) == 0)
    -[HDMCNotificationManager start](v9->_notificationManager, "start");
  v73 = [HDMCAnalysisScheduler alloc];
  objc_msgSend(v6, "daemon");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[HDMCAnalysisScheduler initWithDaemon:analysisManager:settingsManager:calendarCache:](v73, "initWithDaemon:analysisManager:settingsManager:calendarCache:", v74, v9->_analysisManager, v9->_settingsManager, v9->_calendarCache);
  analysisScheduler = v9->_analysisScheduler;
  v9->_analysisScheduler = (HDMCAnalysisScheduler *)v75;

  v77 = -[HDMCWidgetSchedulingManager initWithProfile:]([_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager alloc], "initWithProfile:", v6);
  widgetSchedulingManager = v9->_widgetSchedulingManager;
  v9->_widgetSchedulingManager = v77;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v104;
  if ((objc_msgSend(v79, "isAppleWatch") & 1) != 0)
    goto LABEL_11;
  v80 = objc_loadWeakRetained((id *)&v9->_profile);
  v81 = objc_msgSend(v80, "profileType");

  if (v81 == 1)
  {
    v82 = -[HDMCAnalyticsManager initWithProfile:analysisManager:heartRateFeatureAvailabilityManager:deviationDetectionFeatureAvailabilityManager:wristTemperatureInputFeatureAvailabilityManager:pregnancyManager:]([HDMCAnalyticsManager alloc], "initWithProfile:analysisManager:heartRateFeatureAvailabilityManager:deviationDetectionFeatureAvailabilityManager:wristTemperatureInputFeatureAvailabilityManager:pregnancyManager:", v6, v9->_analysisManager, v9->_heartRateFeatureAvailabilityManager, v9->_deviationsFeatureAvailabilityManager, v9->_wristTemperatureInputAvailabilityManager, v9->_pregnancyManager);
    analyticsManager = v9->_analyticsManager;
    v9->_analyticsManager = v82;

    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3918]), "initWithLoggingCategory:healthDataSource:", *v51, v6);
    v84 = v9->_analysisManager;
    v85 = objc_alloc(MEMORY[0x24BE40A28]);
    v86 = *v51;
    v105[0] = MEMORY[0x24BDAC760];
    v105[1] = 3221225472;
    v105[2] = __56__HDMCProfileExtension_initWithProfile_settingsManager___block_invoke;
    v105[3] = &unk_24DB22B08;
    v106 = v84;
    v87 = v84;
    v88 = objc_msgSend(v85, "initWithProfile:eventSubmissionManager:logCategory:eventConstructor:", v6, v79, v86, v105);
    wristTemperatureDailyEventManager = v9->_wristTemperatureDailyEventManager;
    v9->_wristTemperatureDailyEventManager = (HDAnalyticsDailyEventManager *)v88;

LABEL_11:
  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "isCompanionCapable");

  if (v91)
  {
    v92 = objc_alloc(MEMORY[0x24BE40BD0]);
    v93 = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v104, "userDefaults");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v92, "initWithProfile:userDefaults:delegate:", v93, v94, v9);
    settingsMigrationManager = v9->_settingsMigrationManager;
    v9->_settingsMigrationManager = (HDSettingsMigrationManager *)v95;

  }
  v97 = -[HDMCPostInstallUpdateManager initWithProfileExtension:]([HDMCPostInstallUpdateManager alloc], "initWithProfileExtension:", v9);
  postInstallUpdateManager = v9->_postInstallUpdateManager;
  v9->_postInstallUpdateManager = v97;

  _HKInitializeLogging();
  v99 = *v51;
  if (os_log_type_enabled(*v51, OS_LOG_TYPE_DEFAULT))
  {
    v100 = v99;
    v101 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v109 = v101;
    v102 = v101;
    _os_log_impl(&dword_21961B000, v100, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);

  }
LABEL_16:

  return v9;
}

HDMCWristTemperatureDailyAnalyticsEvent *__56__HDMCProfileExtension_initWithProfile_settingsManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDMCWristTemperatureDailyAnalyticsEvent *v4;
  uint64_t v5;
  void *v6;
  HDMCWristTemperatureDailyAnalyticsEvent *v7;

  v3 = a2;
  v4 = [HDMCWristTemperatureDailyAnalyticsEvent alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9950]), "initWithIdentifier:healthStore:options:", CFSTR("HDMCProfileExtension"), 0, 2);
  v7 = -[HDMCWristTemperatureDailyAnalyticsEvent initWithProfile:analysisManager:sleepStore:](v4, "initWithProfile:analysisManager:sleepStore:", v3, v5, v6);

  return v7;
}

- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  id v8;
  HDSettingsMigrationManager *settingsMigrationManager;
  HDMCWatchSettingsCompatibilityManager *v10;
  id WeakRetained;
  void *v12;
  HDMCWatchSettingsCompatibilityManager *v13;
  HDMCWatchSettingsCompatibilityManager *watchSettingsCompatibilityManager;
  id v15;
  id v16;
  void *v17;
  HDWatchSettingsReconciliationManager *v18;
  HDWatchSettingsReconciliationManager *watchSettingsReconciliationManager;
  int v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v20 = 138543362;
    v21 = (id)objc_opt_class();
    v8 = v21;
    _os_log_impl(&dword_21961B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings migration finished, initiating watch settings managers", (uint8_t *)&v20, 0xCu);

  }
  settingsMigrationManager = self->_settingsMigrationManager;
  self->_settingsMigrationManager = 0;

  v10 = [HDMCWatchSettingsCompatibilityManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HKMCSettingsManager userDefaults](self->_settingsManager, "userDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDMCWatchSettingsCompatibilityManager initWithProfile:userDefaults:](v10, "initWithProfile:userDefaults:", WeakRetained, v12);
  watchSettingsCompatibilityManager = self->_watchSettingsCompatibilityManager;
  self->_watchSettingsCompatibilityManager = v13;

  -[HDMCWatchSettingsCompatibilityManager setDelegate:](self->_watchSettingsCompatibilityManager, "setDelegate:", self);
  v15 = objc_alloc(MEMORY[0x24BE40CF8]);
  v16 = objc_loadWeakRetained((id *)&self->_profile);
  -[HKMCSettingsManager userDefaults](self->_settingsManager, "userDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (HDWatchSettingsReconciliationManager *)objc_msgSend(v15, "initWithProfile:userDefaults:", v16, v17);
  watchSettingsReconciliationManager = self->_watchSettingsReconciliationManager;
  self->_watchSettingsReconciliationManager = v18;

  -[HDWatchSettingsReconciliationManager setDelegate:](self->_watchSettingsReconciliationManager, "setDelegate:", self);
  if (v4)
    -[HDMCProfileExtension _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("settingsMigrationManagerDidRunMigrationSteps"));
}

- (void)watchSettingsCompatibilityManager:(id)a3 didChangeUserDefaultsKeys:(id)a4
{
  id v4;

  v4 = a4;
  if (objc_msgSend(v4, "count"))
    HKSynchronizeNanoPreferencesUserDefaults();

}

- (void)watchSettingsReconciliationManager:(id)a3 didReconcileValuesForKeys:(id)a4 didUpdateFeatureSetting:(BOOL)a5 didUpdateUserDefault:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v7 = a5;
  v15 = a3;
  v10 = a4;
  v11 = v10;
  if (v6)
  {
    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v10, "defaultsEnabledKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
  if (v7)
    -[HDMCProfileExtension _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("watchSettingsReconciliationManagerDidUpdateFeatureSetting"));

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
  v11[2] = __56__HDMCProfileExtension__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_24DB21FF8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v10, v11);

}

void __56__HDMCProfileExtension__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
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
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
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
      _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __56__HDMCProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (id)evaluatorForRequirement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDD2D40]))
  {

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD2D50]);

    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  v8 = self->_pregnancyRequirementEvaluator;
LABEL_6:

  return v8;
}

- (id)getPregnancyModelProvider
{
  return self->_pregnancyManager;
}

- (id)_bridging_analysisProviding
{
  return self->_analysisManager;
}

- (HDPrimaryProfile)profile
{
  return (HDPrimaryProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager)pregnancyManager
{
  return self->_pregnancyManager;
}

- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)pregnancyRequirementEvaluator
{
  return self->_pregnancyRequirementEvaluator;
}

- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)pregnancyFeatureAdjustmentManager
{
  return self->_pregnancyFeatureAdjustmentManager;
}

- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)experienceModelManager
{
  return self->_experienceModelManager;
}

- (HDMCDeviceScopedStorageManager)deviceScopedStorageManager
{
  return self->_deviceScopedStorageManager;
}

- (HDMCNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (HDMCNotificationSyncManager)notificationSyncManager
{
  return self->_notificationSyncManager;
}

- (HKMCSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_experienceModelManager, 0);
  objc_storeStrong((id *)&self->_pregnancyManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_analysisScheduler, 0);
  objc_storeStrong((id *)&self->_watchSettingsReconciliationManager, 0);
  objc_storeStrong((id *)&self->_watchSettingsCompatibilityManager, 0);
  objc_storeStrong((id *)&self->_settingsMigrationManager, 0);
  objc_storeStrong((id *)&self->_postInstallUpdateManager, 0);
  objc_storeStrong((id *)&self->_pregnancyFeatureAdjustmentManager, 0);
  objc_storeStrong((id *)&self->_pregnancyRequirementEvaluator, 0);
  objc_storeStrong((id *)&self->_deviationsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_deviationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureDailyEventManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_heartRateBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

void __56__HDMCProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
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
  _os_log_error_impl(&dword_21961B000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
