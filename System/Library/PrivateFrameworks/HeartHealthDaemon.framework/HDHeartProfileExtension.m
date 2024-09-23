@implementation HDHeartProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4;
  void *cardioFitnessFeatureAvailabilityManager;
  id v6;
  void *v7;
  void *irregularRhythmNotificationsAvailabilityManager;
  void *electrocardiogramRecordingAvailabilityManager;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5000]))
  {
    cardioFitnessFeatureAvailabilityManager = self->_cardioFitnessFeatureAvailabilityManager;
LABEL_11:
    v6 = cardioFitnessFeatureAvailabilityManager;
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB4FF8]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5058]))
    {
      cardioFitnessFeatureAvailabilityManager = self->_lowHeartRateNotificationsFeatureAvailabilityManager;
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5030]))
    {
      cardioFitnessFeatureAvailabilityManager = self->_highHeartRateNotificationsFeatureAvailabilityManager;
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5038]))
    {
      cardioFitnessFeatureAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5040]))
    {
      irregularRhythmNotificationsAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
LABEL_16:
      objc_msgSend(irregularRhythmNotificationsAvailabilityManager, "v1FeatureAvailabilityManager");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5048]))
    {
      electrocardiogramRecordingAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5008]))
      {
        cardioFitnessFeatureAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
        goto LABEL_11;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5010]))
      {
        irregularRhythmNotificationsAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
        goto LABEL_16;
      }
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5018]))
      {
        v7 = 0;
        goto LABEL_13;
      }
      electrocardiogramRecordingAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
    }
    objc_msgSend(electrocardiogramRecordingAvailabilityManager, "v2FeatureAvailabilityManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[HDHRAFibBurdenProfileExtensionComponents featureAvailabilityManager](self->_aFibBurdenComponents, "featureAvailabilityManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v7 = v6;
LABEL_13:

  return v7;
}

- (HDHeartProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDHeartProfileExtension *v5;
  HDHeartProfileExtension *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHeartProfileExtension;
  v5 = -[HDHeartProfileExtension init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (HDHeartProfileExtension)initWithProfile:(id)a3 heartNotificationsUserDefaults:(id)a4
{
  id v6;
  id v7;
  HDHeartProfileExtension *v8;
  HDHeartProfileExtension *v9;
  void *v10;
  int v11;
  HDHeartRateWidgetDataManager *v12;
  id WeakRetained;
  uint64_t v14;
  HDHeartRateWidgetDataManager *heartRateDataManager;
  HDHRHealthLiteDataCollector *v16;
  id v17;
  uint64_t v18;
  HDHRHealthLiteDataCollector *healthLiteDataCollector;
  HDHRDailyHeartRateManager *v20;
  id v21;
  uint64_t v22;
  HDHRDailyHeartRateManager *dailyHeartRateManager;
  HDHRNotificationManager *v24;
  id dailyAnalyticsActivity;
  uint64_t v26;
  HDHRNotificationManager *heartRateNotificationManager;
  HDHRCardioFitnessAnalyticsDailyEventActivity *v28;
  uint64_t v29;
  os_log_t *v30;
  uint64_t v31;
  HDFeatureAvailabilityExtension *cardioFitnessFeatureAvailabilityManager;
  id v33;
  void *v34;
  void *v35;
  int v36;
  HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider *v37;
  uint64_t v38;
  HDBackgroundFeatureDeliveryManager *cardioFitnessBackgroundFeatureDeliveryManager;
  uint64_t v40;
  HDSettingsMigrationManager *settingsMigrationManager;
  HDHRHeartRateNotificationsFeatureAvailabilityManager *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  HDFeatureAvailabilityExtension *lowHeartRateNotificationsFeatureAvailabilityManager;
  HDHRHeartRateNotificationsFeatureAvailabilityManager *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  HDFeatureAvailabilityExtension *highHeartRateNotificationsFeatureAvailabilityManager;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *irregularRhythmNotificationsAvailabilityManager;
  void *v59;
  char v60;
  HDHRIrregularRhythmNotificationsSettingMigrator *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  HDHRIrregularRhythmNotificationsSettingMigrator *irregularRhythmNotificationsSettingMigrator;
  uint64_t v66;
  HDHRAFibBurdenProfileExtensionComponents *aFibBurdenComponents;
  id v68;
  void *v69;
  void *v70;
  int v71;
  HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria *v72;
  void *v73;
  HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria *v74;
  id v75;
  void *v76;
  HDHRIrregularRhythmNotificationsV1SettingsProvider *v77;
  uint64_t v78;
  HDBackgroundFeatureDeliveryManager *irregularRhythmNotificationsV2DeliveryManager;
  void *v80;
  int v81;
  HRAtrialFibrillationNotificationManager *v82;
  void *v83;
  uint64_t v84;
  HRAtrialFibrillationNotificationManager *atrialFibrillationNotificationManager;
  HRAtrialFibrillationEventDetector *v86;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *v87;
  void *v88;
  uint64_t v89;
  HRAtrialFibrillationEventDetector *atrialFibrillationEventDetector;
  void *v91;
  os_log_t v92;
  NSObject *v93;
  void *v94;
  id v95;
  objc_super v97;
  uint8_t buf[4];
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v97.receiver = self;
  v97.super_class = (Class)HDHeartProfileExtension;
  v8 = -[HDHeartProfileExtension init](&v97, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_19;
  objc_storeWeak((id *)&v8->_profile, v6);
  objc_storeStrong((id *)&v9->_heartNotificationsUserDefaults, a4);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if (v11)
  {
    v12 = [HDHeartRateWidgetDataManager alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    v14 = -[HDHeartRateWidgetDataManager initWithProfile:](v12, "initWithProfile:", WeakRetained);
    heartRateDataManager = v9->_heartRateDataManager;
    v9->_heartRateDataManager = (HDHeartRateWidgetDataManager *)v14;

    v16 = [HDHRHealthLiteDataCollector alloc];
    v17 = objc_loadWeakRetained((id *)&v9->_profile);
    v18 = -[HDHRHealthLiteDataCollector initWithProfile:](v16, "initWithProfile:", v17);
    healthLiteDataCollector = v9->_healthLiteDataCollector;
    v9->_healthLiteDataCollector = (HDHRHealthLiteDataCollector *)v18;

    v20 = [HDHRDailyHeartRateManager alloc];
    v21 = objc_loadWeakRetained((id *)&v9->_profile);
    v22 = -[HDHRDailyHeartRateManager initWithProfile:](v20, "initWithProfile:", v21);
    dailyHeartRateManager = v9->_dailyHeartRateManager;
    v9->_dailyHeartRateManager = (HDHRDailyHeartRateManager *)v22;

    v24 = [HDHRNotificationManager alloc];
    dailyAnalyticsActivity = objc_loadWeakRetained((id *)&v9->_profile);
    v26 = -[HDHRNotificationManager initWithProfile:](v24, "initWithProfile:", dailyAnalyticsActivity);
    heartRateNotificationManager = v9->_heartRateNotificationManager;
    v9->_heartRateNotificationManager = (HDHRNotificationManager *)v26;

  }
  else
  {
    if (objc_msgSend(v6, "profileType") != 1)
      goto LABEL_7;
    v28 = -[HDHRCardioFitnessAnalyticsDailyEventActivity initWithProfile:]([HDHRCardioFitnessAnalyticsDailyEventActivity alloc], "initWithProfile:", v6);
    dailyAnalyticsActivity = v9->_dailyAnalyticsActivity;
    v9->_dailyAnalyticsActivity = v28;
  }

LABEL_7:
  v29 = objc_msgSend(v6, "profileType");
  v30 = (os_log_t *)MEMORY[0x1E0CB52E8];
  if (v29 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D294A0], "hdhr_makeCardioFitnessFeatureAvailabilityManagerWithProfile:", v6);
    v31 = objc_claimAutoreleasedReturnValue();
    cardioFitnessFeatureAvailabilityManager = v9->_cardioFitnessFeatureAvailabilityManager;
    v9->_cardioFitnessFeatureAvailabilityManager = (HDFeatureAvailabilityExtension *)v31;

    v33 = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(v33, "daemon");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "behavior");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isCompanionCapable");

    if (v36)
    {
      v37 = -[HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider initWithHeartRateSettingsDefaults:]([HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider alloc], "initWithHeartRateSettingsDefaults:", v9->_heartNotificationsUserDefaults);
      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29420]), "initWithProfile:featureAvailabilityExtension:deliveryCriteria:settingsProvider:loggingCategory:", v6, v9->_cardioFitnessFeatureAvailabilityManager, 0, v37, *v30);
      cardioFitnessBackgroundFeatureDeliveryManager = v9->_cardioFitnessBackgroundFeatureDeliveryManager;
      v9->_cardioFitnessBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v38;

      v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29580]), "initWithProfile:heartNotificationsUserDefaults:delegate:", v6, v9->_heartNotificationsUserDefaults, v9);
      settingsMigrationManager = v9->_settingsMigrationManager;
      v9->_settingsMigrationManager = (HDSettingsMigrationManager *)v40;

    }
  }
  v42 = [HDHRHeartRateNotificationsFeatureAvailabilityManager alloc];
  v43 = *MEMORY[0x1E0CB5058];
  objc_msgSend(v6, "daemon");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "nanoRegistryDeviceCapabilityProvider");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[HDHRHeartRateNotificationsFeatureAvailabilityManager initWithFeatureIdentifier:notificationSettingsDefaults:pairedDeviceCapabilityProvider:](v42, "initWithFeatureIdentifier:notificationSettingsDefaults:pairedDeviceCapabilityProvider:", v43, v7, v45);
  lowHeartRateNotificationsFeatureAvailabilityManager = v9->_lowHeartRateNotificationsFeatureAvailabilityManager;
  v9->_lowHeartRateNotificationsFeatureAvailabilityManager = (HDFeatureAvailabilityExtension *)v46;

  v48 = [HDHRHeartRateNotificationsFeatureAvailabilityManager alloc];
  v49 = *MEMORY[0x1E0CB5030];
  objc_msgSend(v6, "daemon");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "nanoRegistryDeviceCapabilityProvider");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[HDHRHeartRateNotificationsFeatureAvailabilityManager initWithFeatureIdentifier:notificationSettingsDefaults:pairedDeviceCapabilityProvider:](v48, "initWithFeatureIdentifier:notificationSettingsDefaults:pairedDeviceCapabilityProvider:", v49, v7, v51);
  highHeartRateNotificationsFeatureAvailabilityManager = v9->_highHeartRateNotificationsFeatureAvailabilityManager;
  v9->_highHeartRateNotificationsFeatureAvailabilityManager = (HDFeatureAvailabilityExtension *)v52;

  v54 = [HDHRIrregularRhythmNotificationsFeatureAvailabilityManager alloc];
  objc_msgSend(v6, "daemon");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  HDHRIrregularRhythmNotificationsV2PairedFeaturePropertiesSyncManager(v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager initWithProfile:v2PairedFeaturePropertiesSyncManager:notificationSettingDefaults:](v54, "initWithProfile:v2PairedFeaturePropertiesSyncManager:notificationSettingDefaults:", v6, v56, v9->_heartNotificationsUserDefaults);
  irregularRhythmNotificationsAvailabilityManager = v9->_irregularRhythmNotificationsAvailabilityManager;
  v9->_irregularRhythmNotificationsAvailabilityManager = (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v57;

  if (objc_msgSend(v6, "profileType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "isAppleWatch");

    if ((v60 & 1) == 0)
    {
      v61 = [HDHRIrregularRhythmNotificationsSettingMigrator alloc];
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager v1FeatureAvailabilityManager](v9->_irregularRhythmNotificationsAvailabilityManager, "v1FeatureAvailabilityManager");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager v2FeatureAvailabilityManager](v9->_irregularRhythmNotificationsAvailabilityManager, "v2FeatureAvailabilityManager");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[HDHRIrregularRhythmNotificationsSettingMigrator initWithV1FeatureAvailabilityManager:v2FeatureAvailabilityManager:](v61, "initWithV1FeatureAvailabilityManager:v2FeatureAvailabilityManager:", v62, v63);
      irregularRhythmNotificationsSettingMigrator = v9->_irregularRhythmNotificationsSettingMigrator;
      v9->_irregularRhythmNotificationsSettingMigrator = (HDHRIrregularRhythmNotificationsSettingMigrator *)v64;

    }
  }
  +[HDHRAFibBurdenProfileExtensionComponents makeComponentsForProfile:](HDHRAFibBurdenProfileExtensionComponents, "makeComponentsForProfile:", v6);
  v66 = objc_claimAutoreleasedReturnValue();
  aFibBurdenComponents = v9->_aFibBurdenComponents;
  v9->_aFibBurdenComponents = (HDHRAFibBurdenProfileExtensionComponents *)v66;

  v68 = objc_loadWeakRetained((id *)&v9->_profile);
  objc_msgSend(v68, "daemon");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "behavior");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "isCompanionCapable");

  if (v71)
  {
    v72 = [HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria alloc];
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager v1FeatureAvailabilityManager](v9->_irregularRhythmNotificationsAvailabilityManager, "v1FeatureAvailabilityManager");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria initWithV1FeatureAvailabilityManager:](v72, "initWithV1FeatureAvailabilityManager:", v73);

    v75 = objc_alloc(MEMORY[0x1E0D29420]);
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager v2FeatureAvailabilityManager](v9->_irregularRhythmNotificationsAvailabilityManager, "v2FeatureAvailabilityManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_alloc_init(HDHRIrregularRhythmNotificationsV1SettingsProvider);
    v78 = objc_msgSend(v75, "initWithProfile:featureAvailabilityExtension:deliveryCriteria:settingsProvider:loggingCategory:", v6, v76, v74, v77, *MEMORY[0x1E0CB52F0]);
    irregularRhythmNotificationsV2DeliveryManager = v9->_irregularRhythmNotificationsV2DeliveryManager;
    v9->_irregularRhythmNotificationsV2DeliveryManager = (HDBackgroundFeatureDeliveryManager *)v78;

  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "isAppleWatch");

  if (v81)
  {
    v82 = [HRAtrialFibrillationNotificationManager alloc];
    -[HDHeartProfileExtension irregularRhythmNotificationsFeatureStatusManager](v9, "irregularRhythmNotificationsFeatureStatusManager");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = -[HRAtrialFibrillationNotificationManager initWithProfile:featureStatusManager:](v82, "initWithProfile:featureStatusManager:", v6, v83);
    atrialFibrillationNotificationManager = v9->_atrialFibrillationNotificationManager;
    v9->_atrialFibrillationNotificationManager = (HRAtrialFibrillationNotificationManager *)v84;

    v86 = [HRAtrialFibrillationEventDetector alloc];
    v87 = v9->_irregularRhythmNotificationsAvailabilityManager;
    -[HDHeartProfileExtension irregularRhythmNotificationsFeatureStatusManager](v9, "irregularRhythmNotificationsFeatureStatusManager");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[HRAtrialFibrillationEventDetector initWithProfile:availabilityManager:featureStatusManager:notificationManager:](v86, "initWithProfile:availabilityManager:featureStatusManager:notificationManager:", v6, v87, v88, v9->_atrialFibrillationNotificationManager);
    atrialFibrillationEventDetector = v9->_atrialFibrillationEventDetector;
    v9->_atrialFibrillationEventDetector = (HRAtrialFibrillationEventDetector *)v89;

  }
  -[HDHeartProfileExtension _setupElectrocardiogramRecordingWithProfile:](v9, "_setupElectrocardiogramRecordingWithProfile:", v6);
  HKCreateSerialDispatchQueue();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerProfileReadyObserver:queue:", v9, v91);

  _HKInitializeLogging();
  v92 = *v30;
  if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEFAULT))
  {
    v93 = v92;
    v94 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v99 = v94;
    v95 = v94;
    _os_log_impl(&dword_1CC29C000, v93, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);

  }
LABEL_19:

  return v9;
}

- (HKFeatureStatusManager)irregularRhythmNotificationsFeatureStatusManager
{
  HKFeatureStatusManager *irregularRhythmNotificationsFeatureStatusManager;
  id v4;
  HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *irregularRhythmNotificationsAvailabilityManager;
  id WeakRetained;
  HKFeatureStatusManager *v7;
  HKFeatureStatusManager *v8;

  irregularRhythmNotificationsFeatureStatusManager = self->_irregularRhythmNotificationsFeatureStatusManager;
  if (!irregularRhythmNotificationsFeatureStatusManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB6730]);
    irregularRhythmNotificationsAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v7 = (HKFeatureStatusManager *)objc_msgSend(v4, "initWithFeatureAvailabilityProviding:healthDataSource:", irregularRhythmNotificationsAvailabilityManager, WeakRetained);
    v8 = self->_irregularRhythmNotificationsFeatureStatusManager;
    self->_irregularRhythmNotificationsFeatureStatusManager = v7;

    irregularRhythmNotificationsFeatureStatusManager = self->_irregularRhythmNotificationsFeatureStatusManager;
  }
  return irregularRhythmNotificationsFeatureStatusManager;
}

- (void)_setupElectrocardiogramRecordingWithProfile:(id)a3
{
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v4;
  void *v5;
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *v6;
  HDHRElectrocardiogramRecordingFeatureAvailabilityManager *electrocardiogramRecordingAvailabilityManager;
  void *v8;
  HDHRElectrocardiogramRecordingV2UpgradeManager *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HDHRElectrocardiogramRecordingV2UpgradeManager *v14;
  id electrocardiogramRecordingV2DeliveryManager;
  id v16;

  v16 = a3;
  v4 = [HDHRElectrocardiogramRecordingFeatureAvailabilityManager alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager initWithProfile:cacheDefaults:](v4, "initWithProfile:cacheDefaults:", v16, v5);
  electrocardiogramRecordingAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
  self->_electrocardiogramRecordingAvailabilityManager = v6;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "isCompanionCapable");

  if ((_DWORD)v5)
  {
    v9 = [HDHRElectrocardiogramRecordingV2UpgradeManager alloc];
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager v1FeatureAvailabilityManager](self->_electrocardiogramRecordingAvailabilityManager, "v1FeatureAvailabilityManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager v2FeatureAvailabilityManager](self->_electrocardiogramRecordingAvailabilityManager, "v2FeatureAvailabilityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0CB62B8]);
    v13 = (void *)objc_msgSend(v12, "initWithLoggingCategory:healthDataSource:", *MEMORY[0x1E0CB52F0], v16);
    v14 = -[HDHRElectrocardiogramRecordingV2UpgradeManager initWithProfile:v1FeatureAvailabilityManager:v2FeatureAvailabilityManager:analyticsSubmissionManager:](v9, "initWithProfile:v1FeatureAvailabilityManager:v2FeatureAvailabilityManager:analyticsSubmissionManager:", v16, v10, v11, v13);
    electrocardiogramRecordingV2DeliveryManager = self->_electrocardiogramRecordingV2DeliveryManager;
    self->_electrocardiogramRecordingV2DeliveryManager = v14;

  }
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  char v5;
  HDHRHeartbeatSeriesFeatureExclusivityManager *v6;
  void *v7;
  void *v8;
  HDHRHeartbeatSeriesFeatureExclusivityManager *v9;
  HDHRHeartbeatSeriesFeatureExclusivityManager *heartbeatSeriesFeatureExclusivityManager;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "profileType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");

    if ((v5 & 1) == 0)
    {
      v6 = [HDHRHeartbeatSeriesFeatureExclusivityManager alloc];
      -[HDHeartProfileExtension irregularRhythmNotificationsFeatureStatusManager](self, "irregularRhythmNotificationsFeatureStatusManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHRAFibBurdenProfileExtensionComponents featureStatusManager](self->_aFibBurdenComponents, "featureStatusManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HDHRHeartbeatSeriesFeatureExclusivityManager initWithIrregularRhythmNotificationsStatusManager:aFibHistoryStatusManager:profile:](v6, "initWithIrregularRhythmNotificationsStatusManager:aFibHistoryStatusManager:profile:", v7, v8, v11);
      heartbeatSeriesFeatureExclusivityManager = self->_heartbeatSeriesFeatureExclusivityManager;
      self->_heartbeatSeriesFeatureExclusivityManager = v9;

    }
  }

}

- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  id v9;
  HDSettingsMigrationManager *settingsMigrationManager;
  id v11;
  void *v12;
  NSUserDefaults *heartNotificationsUserDefaults;
  id v14;
  void *v15;
  void *v16;
  HDWatchSettingsReconciliationManager *v17;
  HDWatchSettingsReconciliationManager *settingsReconciliationManager;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v6 = (_QWORD *)MEMORY[0x1E0CB52E8];
  v7 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v9 = v21;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings migration finished, initiating watch settings manager", buf, 0xCu);

  }
  settingsMigrationManager = self->_settingsMigrationManager;
  self->_settingsMigrationManager = 0;

  v11 = objc_alloc(MEMORY[0x1E0D295D8]);
  -[HDHeartProfileExtension profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  heartNotificationsUserDefaults = self->_heartNotificationsUserDefaults;
  v14 = objc_alloc(MEMORY[0x1E0D295D0]);
  v15 = (void *)objc_msgSend(v14, "initWithFeatureIdentifier:defaultsEnabledKey:", *MEMORY[0x1E0CB5000], *MEMORY[0x1E0CB76E0]);
  v19 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (HDWatchSettingsReconciliationManager *)objc_msgSend(v11, "initWithProfile:userDefaults:managedKeys:debugIdentifier:loggingCategory:", v12, heartNotificationsUserDefaults, v16, CFSTR("CardioFitness"), *v6);
  settingsReconciliationManager = self->_settingsReconciliationManager;
  self->_settingsReconciliationManager = v17;

  -[HDWatchSettingsReconciliationManager setDelegate:](self->_settingsReconciliationManager, "setDelegate:", self);
  if (v4)
    -[HDHeartProfileExtension _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("HDHeartProfileExtension.settingsMigrationManagerDidRunMigrationSteps"));
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
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "defaultsEnabledKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
  if (v7)
    -[HDHeartProfileExtension _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("HDHeartProfileExtension.watchSettingsReconciliationManagerDidUpdateFeatureSetting"));

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
  v7 = objc_alloc(MEMORY[0x1E0CB6430]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
  v9 = (void *)objc_msgSend(v7, "initWithChangesSyncRequest:", v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_1E87EFA38;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v10, v11);

}

void __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
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

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52E8];
  v7 = *MEMORY[0x1E0CB52E8];
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
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (NSUserDefaults)heartNotificationsUserDefaults
{
  return self->_heartNotificationsUserDefaults;
}

- (void)setHeartNotificationsUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, a3);
}

- (HDPrimaryProfile)profile
{
  return (HDPrimaryProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDHRHealthLiteDataCollector)healthLiteDataCollector
{
  return self->_healthLiteDataCollector;
}

- (void)setHealthLiteDataCollector:(id)a3
{
  objc_storeStrong((id *)&self->_healthLiteDataCollector, a3);
}

- (HDHRDailyHeartRateManager)dailyHeartRateManager
{
  return self->_dailyHeartRateManager;
}

- (void)setDailyHeartRateManager:(id)a3
{
  objc_storeStrong((id *)&self->_dailyHeartRateManager, a3);
}

- (HDHRNotificationManager)heartRateNotificationManager
{
  return self->_heartRateNotificationManager;
}

- (void)setHeartRateNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateNotificationManager, a3);
}

- (HDHeartRateWidgetDataManager)heartRateDataManager
{
  return self->_heartRateDataManager;
}

- (void)setHeartRateDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateDataManager, a3);
}

- (HDHRAFibBurdenProfileExtensionComponents)aFibBurdenComponents
{
  return self->_aFibBurdenComponents;
}

- (void)setAFibBurdenComponents:(id)a3
{
  objc_storeStrong((id *)&self->_aFibBurdenComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aFibBurdenComponents, 0);
  objc_storeStrong((id *)&self->_heartRateDataManager, 0);
  objc_storeStrong((id *)&self->_heartRateNotificationManager, 0);
  objc_storeStrong((id *)&self->_dailyHeartRateManager, 0);
  objc_storeStrong((id *)&self->_healthLiteDataCollector, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_storeStrong(&self->_electrocardiogramRecordingV2DeliveryManager, 0);
  objc_storeStrong((id *)&self->_electrocardiogramRecordingAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_atrialFibrillationNotificationManager, 0);
  objc_storeStrong((id *)&self->_atrialFibrillationEventDetector, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsV2DeliveryManager, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsSettingMigrator, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_highHeartRateNotificationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_lowHeartRateNotificationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_heartbeatSeriesFeatureExclusivityManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsActivity, 0);
  objc_storeStrong((id *)&self->_cardioFitnessBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_cardioFitnessFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_settingsReconciliationManager, 0);
  objc_storeStrong((id *)&self->_settingsMigrationManager, 0);
}

void __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
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

  v15 = *MEMORY[0x1E0C80C00];
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
  _os_log_error_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
