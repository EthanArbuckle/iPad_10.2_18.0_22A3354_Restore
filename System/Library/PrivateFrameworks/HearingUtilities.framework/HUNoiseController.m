@implementation HUNoiseController

+ (id)sharedController
{
  if (sharedController_onceToken_3 != -1)
    dispatch_once(&sharedController_onceToken_3, &__block_literal_global_21);
  return (id)sharedController_Controller_2;
}

void __37__HUNoiseController_sharedController__block_invoke()
{
  HUNoiseController *v0;
  void *v1;

  v0 = objc_alloc_init(HUNoiseController);
  v1 = (void *)sharedController_Controller_2;
  sharedController_Controller_2 = (uint64_t)v0;

}

+ (BOOL)deviceSupportsEnvironmentalDosimetry
{
  if (deviceSupportsEnvironmentalDosimetry_onceToken != -1)
    dispatch_once(&deviceSupportsEnvironmentalDosimetry_onceToken, &__block_literal_global_186);
  return deviceSupportsEnvironmentalDosimetry_SupportsEnvironmentalDosimetry;
}

uint64_t __57__HUNoiseController_deviceSupportsEnvironmentalDosimetry__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  deviceSupportsEnvironmentalDosimetry_SupportsEnvironmentalDosimetry = result;
  return result;
}

- (HUNoiseController)init
{
  HUNoiseController *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  AXDispatchTimer *v9;
  AXDispatchTimer *adamSuspendedTimer;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  HKHealthStore *v17;
  HKHealthStore *healthStore;
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v28;
  HKDataCollector *attenuationDataCollector;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  UNUserNotificationCenter *userNotificationCenter;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  NSMutableArray *v39;
  NSMutableArray *leqBuffer;
  NSMutableArray *v41;
  NSMutableArray *leqBuffer80Threshold;
  NSMutableArray *v43;
  NSMutableArray *leqBuffer85Threshold;
  NSMutableArray *v45;
  NSMutableArray *leqBuffer90Threshold;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  objc_class *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  ADAMAudioDataReceiver *edDataReceiver;
  void *v58;
  uint64_t v59;
  dispatch_time_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  _QWORD block[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  objc_super v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 buf;
  uint64_t v78;
  void *v79;
  uint64_t *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v72.receiver = self;
  v72.super_class = (Class)HUNoiseController;
  v2 = -[HUNoiseController init](&v72, sel_init);
  if (v2)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initializing HUNoiseController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController init]", 244, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      v8 = objc_msgSend(v6, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    v9 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x1E0CF3978]);
    adamSuspendedTimer = v2->_adamSuspendedTimer;
    v2->_adamSuspendedTimer = v9;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.HearingUtilities.HUNoiseController.DataQueue", v11);
    -[HUNoiseController setDataQueue:](v2, "setDataQueue:", v12);

    -[HUNoiseController _clearCachedValues](v2, "_clearCachedValues");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNoiseController setAttenuationBuffer:](v2, "setAttenuationBuffer:", v13);

    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v14 = (void *)getHKHealthStoreClass_softClass;
    v76 = getHKHealthStoreClass_softClass;
    v15 = MEMORY[0x1E0C809B0];
    if (!getHKHealthStoreClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v78 = (uint64_t)__getHKHealthStoreClass_block_invoke;
      v79 = &unk_1EA8E8270;
      v80 = &v73;
      __getHKHealthStoreClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v74[3];
    }
    v16 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v73, 8);
    v17 = (HKHealthStore *)objc_alloc_init(v16);
    healthStore = v2->_healthStore;
    v2->_healthStore = v17;

    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v19 = (void *)getHKQuantityTypeClass_softClass;
    v76 = getHKQuantityTypeClass_softClass;
    if (!getHKQuantityTypeClass_softClass)
    {
      *(_QWORD *)&buf = v15;
      *((_QWORD *)&buf + 1) = 3221225472;
      v78 = (uint64_t)__getHKQuantityTypeClass_block_invoke;
      v79 = &unk_1EA8E8270;
      v80 = &v73;
      __getHKQuantityTypeClass_block_invoke((uint64_t)&buf);
      v19 = (void *)v74[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v73, 8);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v78 = 0x2020000000;
    v21 = (_QWORD *)getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr;
    v79 = (void *)getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr;
    if (!getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr)
    {
      v22 = (void *)HealthKitLibrary();
      v21 = dlsym(v22, "HKQuantityTypeIdentifierEnvironmentalSoundReduction");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v21;
      getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(&buf, 8);
    if (!v21)
    {
      getADAFMetadataKeyHAEDataForGauge_cold_1();
      __break(1u);
    }
    objc_msgSend(v20, "quantityTypeForIdentifier:", *v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v24 = (void *)getHKDataCollectorClass_softClass;
    v76 = getHKDataCollectorClass_softClass;
    if (!getHKDataCollectorClass_softClass)
    {
      *(_QWORD *)&buf = v15;
      *((_QWORD *)&buf + 1) = 3221225472;
      v78 = (uint64_t)__getHKDataCollectorClass_block_invoke;
      v79 = &unk_1EA8E8270;
      v80 = &v73;
      __getHKDataCollectorClass_block_invoke((uint64_t)&buf);
      v24 = (void *)v74[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v73, 8);
    v26 = [v25 alloc];
    -[HUNoiseController healthStore](v2, "healthStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithHealthStore:bundleIdentifier:quantityType:", v27, CFSTR("com.apple.Noise"), v23);
    attenuationDataCollector = v2->_attenuationDataCollector;
    v2->_attenuationDataCollector = (HKDataCollector *)v28;

    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v30, "thresholdVersion") == 0;

    if ((_DWORD)v26)
    {
      +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setThresholdVersion:", 1);

      +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setNotificationThreshold:", 90);

    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Noise"));
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v33;

    objc_initWeak(&location, v2);
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "notificationMuteDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeIntervalSinceNow");
    -[HUNoiseController setMuted:](v2, "setMuted:", v37 > 0.0);

    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v15;
    v69[1] = 3221225472;
    v69[2] = __25__HUNoiseController_init__block_invoke;
    v69[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v70, &location);
    objc_msgSend(v38, "registerUpdateBlock:forRetrieveSelector:withListener:", v69, sel_notificationMuteDate, v2);

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leqBuffer = v2->_leqBuffer;
    v2->_leqBuffer = v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leqBuffer80Threshold = v2->_leqBuffer80Threshold;
    v2->_leqBuffer80Threshold = v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leqBuffer85Threshold = v2->_leqBuffer85Threshold;
    v2->_leqBuffer85Threshold = v43;

    v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leqBuffer90Threshold = v2->_leqBuffer90Threshold;
    v2->_leqBuffer90Threshold = v45;

    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initializing ADAM data receiver"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController init]", 284, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v50;
      _os_log_impl(&dword_1DE311000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }

    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v51 = (void *)getADAMAudioDataReceiverClass_softClass_0;
    v76 = getADAMAudioDataReceiverClass_softClass_0;
    if (!getADAMAudioDataReceiverClass_softClass_0)
    {
      *(_QWORD *)&buf = v15;
      *((_QWORD *)&buf + 1) = 3221225472;
      v78 = (uint64_t)__getADAMAudioDataReceiverClass_block_invoke_0;
      v79 = &unk_1EA8E8270;
      v80 = &v73;
      __getADAMAudioDataReceiverClass_block_invoke_0((uint64_t)&buf);
      v51 = (void *)v74[3];
    }
    v52 = objc_retainAutorelease(v51);
    _Block_object_dispose(&v73, 8);
    v53 = [v52 alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bundleIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v53, "initWithIdentifier:", v55);
    edDataReceiver = v2->_edDataReceiver;
    v2->_edDataReceiver = (ADAMAudioDataReceiver *)v56;

    -[ADAMAudioDataReceiver stopMeasuringAudioSampleType:](v2->_edDataReceiver, "stopMeasuringAudioSampleType:", 1702260324);
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "noiseEnabled");

    -[HUNoiseController _logNoiseEnabledStateToPowerlog:](v2, "_logNoiseEnabledStateToPowerlog:", v59);
    if ((_DWORD)v59)
    {
      v60 = dispatch_time(0, 100000000);
      dispatch_get_global_queue(21, 0);
      v61 = objc_claimAutoreleasedReturnValue();
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __25__HUNoiseController_init__block_invoke_208;
      block[3] = &unk_1EA8E81D0;
      objc_copyWeak(&v68, &location);
      dispatch_after(v60, v61, block);

      objc_destroyWeak(&v68);
    }
    else
    {
      HCHPInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Noise not enabled"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController init]", 307, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (id)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
        LODWORD(buf) = 136446210;
        *(_QWORD *)((char *)&buf + 4) = v65;
        _os_log_impl(&dword_1DE311000, v64, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
      }

    }
    -[HUNoiseController subscribeToSharedNotifications](v2, "subscribeToSharedNotifications");
    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __25__HUNoiseController_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  double v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HCHPInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationMuteDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Notification mute date changed: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController init]_block_invoke", 272, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationMuteDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceNow");
  objc_msgSend(WeakRetained, "setMuted:", v13 > 0.0);

}

void __25__HUNoiseController_init__block_invoke_208(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "readEnvironmentalDosimetryLevels");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_measurementSuspensionNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)HUNoiseController;
  -[HUNoiseController dealloc](&v3, sel_dealloc);
}

- (void)showNotificationForAlertType:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UNUserNotificationCenter *userNotificationCenter;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  __CFString *v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  hearingLocString(CFSTR("NoiseAlertTitle"));
  v5 = objc_claimAutoreleasedReturnValue();
  hearingLocString(CFSTR("NoiseAlertLevelContent80"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  hearingLocString(CFSTR("NoiseAlertLevelDetailedContent80"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &stru_1EA8EC4E0;
  objc_msgSend(v7, "stringWithFormat:", v8, v6, &stru_1EA8EC4E0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUNoiseController isWearingAirpods](self, "isWearingAirpods"))
  {
    accessibilityHearingAidSupportBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NoiseAlertAirPodsDetail"), CFSTR("NoiseAlertAirPodsDetail"), CFSTR("HearingAidSupport-B698"));
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  }
  switch(a3)
  {
    case 1uLL:
      hearingLocString(CFSTR("NoiseAlertLevelContent80"));
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("NoiseAlertLevelDetailedContent80");
      goto LABEL_9;
    case 2uLL:
      hearingLocString(CFSTR("NoiseAlertLevelContent85"));
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("NoiseAlertLevelDetailedContent85");
      goto LABEL_9;
    case 3uLL:
      hearingLocString(CFSTR("NoiseAlertLevelContent90"));
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("NoiseAlertLevelDetailedContent90");
      goto LABEL_9;
    case 4uLL:
      hearingLocString(CFSTR("NoiseAlertLevelContent95"));
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("NoiseAlertLevelDetailedContent95");
      goto LABEL_9;
    case 5uLL:
      hearingLocString(CFSTR("NoiseAlertLevelContent100"));
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = CFSTR("NoiseAlertLevelDetailedContent100");
LABEL_9:
      hearingLocString(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, v12, v9);
      v16 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v12;

      v10 = (void *)v16;
      break;
    default:
      break;
  }
  v17 = -[HUNoiseController shouldShowHearingProtectionSuggestion](self, "shouldShowHearingProtectionSuggestion");
  hearingLocString(CFSTR("NoiseAlertDamageWarning"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("\n\n%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (__CFString *)v9;
  if (!v17)
  {
    hearingLocString(CFSTR("NoiseAlertDamageWarningConsiderSuggestion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(" %@"), v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.noise.threshold"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  userNotificationCenter = self->_userNotificationCenter;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter setNotificationCategories:](userNotificationCenter, "setNotificationCategories:", v24);

  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setCategoryIdentifier:", CFSTR("com.apple.noise.threshold"));
  objc_msgSend(v25, "setThreadIdentifier:", CFSTR("com.apple.noise.threshold"));
  objc_msgSend(v25, "setExpirationDate:", 0);
  v26 = (void *)v5;
  objc_msgSend(v25, "setTitle:", v5);
  objc_msgSend(v25, "setBody:", v19);
  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSound:", v27);

  objc_msgSend(v25, "setInterruptionLevel:", 2);
  v28 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "requestWithIdentifier:content:trigger:destinations:", v30, v25, 0, 15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v31, &__block_literal_global_256);
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification request added to notification center: %@"), v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController showNotificationForAlertType:]", 428, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v35 = objc_retainAutorelease(v33);
    v36 = v34;
    *(_DWORD *)buf = 136446210;
    v39 = objc_msgSend(v35, "UTF8String");
    _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

void __50__HUNoiseController_showNotificationForAlertType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = a2;
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification request failed to add to notification center with error: %@"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController showNotificationForAlertType:]_block_invoke", 425, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      *(_DWORD *)buf = 136446210;
      v9 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

- (unint64_t)alertTypeFromLevel:(float)a3
{
  if (a3 >= 80.0 && a3 < 85.0)
    return 1;
  if (a3 >= 85.0 && a3 < 90.0)
    return 2;
  if (a3 >= 90.0 && a3 < 95.0)
    return 3;
  if (a3 >= 95.0 && a3 < 100.0)
    return 4;
  if (a3 >= 100.0)
    return 5;
  return 0;
}

- (void)restartADAMTimer
{
  AXDispatchTimer *adamSuspendedTimer;
  _QWORD v4[4];
  id v5;
  id location;

  if (!_AXSVoiceOverTouchEnabled())
  {
    -[AXDispatchTimer cancel](self->_adamSuspendedTimer, "cancel");
    objc_initWeak(&location, self);
    adamSuspendedTimer = self->_adamSuspendedTimer;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__HUNoiseController_restartADAMTimer__block_invoke;
    v4[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v5, &location);
    -[AXDispatchTimer afterDelay:processBlock:](adamSuspendedTimer, "afterDelay:processBlock:", v4, 1.0);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __37__HUNoiseController_restartADAMTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id *v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Didn't receive measurements from ADAM."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController restartADAMTimer]_block_invoke", 464, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v14 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "setMeasurementEnabled:", 0);

  v9 = objc_loadWeakRetained(v7);
  objc_msgSend(v9, "dataQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HUNoiseController_restartADAMTimer__block_invoke_263;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v12, v7);
  dispatch_async(v10, block);

  objc_destroyWeak(&v12);
}

void __37__HUNoiseController_restartADAMTimer__block_invoke_263(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendUpdateMessageForCurrentValues");

}

- (void)processMeasurement:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HUNoiseController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HUNoiseController setMeasurementEnabled:](self, "setMeasurementEnabled:", 1);
  -[HUNoiseController restartADAMTimer](self, "restartADAMTimer");
  -[HUNoiseController dataQueue](self, "dataQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HUNoiseController_processMeasurement_withMetadata___block_invoke;
  block[3] = &unk_1EA8E9C00;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __53__HUNoiseController_processMeasurement_withMetadata___block_invoke(id *a1)
{
  float v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  HUNoiseSample *v10;
  void *v11;
  float v12;
  int v13;
  double v14;
  double v15;
  HUNoiseSample *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  double v21;
  void *v22;
  int v23;
  id v24;
  int v25;
  double v26;
  double v27;
  id v28;
  int v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "floatValue");
  v3 = v2;
  v4 = objc_msgSend(a1[5], "_fetchDeviceState");
  v6 = v5;
  v7 = v3;
  +[HUNoiseUtilities attenuationForExposure:deviceType:andListeningState:](HUNoiseUtilities, "attenuationForExposure:deviceType:andListeningState:", v4, v5, v3);
  v9 = v8;
  v10 = [HUNoiseSample alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "sampleDuration");
  LODWORD(v14) = v13;
  v12 = v9;
  *(float *)&v15 = v12;
  v16 = -[HUNoiseSample initWithSampleDate:splValue:andDuration:](v10, "initWithSampleDate:splValue:andDuration:", v11, v15, v14);

  objc_msgSend(a1[5], "attenuationBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v16);

  objc_msgSend(a1[6], "objectForKey:", CFSTR("FastData"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = a1[5];
  *(float *)&v21 = v3;
  if (v19)
  {
    objc_msgSend(v20, "setFastLeq:", v21);
  }
  else
  {
    objc_msgSend(v20, "setSlowLeq:", v21);
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "notificationsEnabled");

    if (v23)
    {
      v24 = a1[5];
      objc_msgSend(v24, "sampleDuration");
      LODWORD(v26) = v25;
      *(float *)&v27 = v7 - v9;
      objc_msgSend(v24, "applyNotificationLogicForSPL:withDuration:", v27, v26);
      v28 = a1[5];
      objc_msgSend(v28, "sampleDuration");
      LODWORD(v30) = v29;
      *(float *)&v31 = v7 - v9;
      objc_msgSend(v28, "applyAnalyticsNotificationLogicForSPL:withDuration:", v31, v30);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "attenuationBuffer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sampleDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceDate:", v35);
  v37 = v36;

  if (v37 > 5.0)
    objc_msgSend(a1[5], "writeAttentuationSampleToHealth");
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "internalLoggingEnabled");

  if (v39)
  {
    HCHPInitializeLogging();
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("Measured %lf with attenuation %lf for listening mode %@ and device type %@"), *(_QWORD *)&v7, *(_QWORD *)&v9, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController processMeasurement:withMetadata:]_block_invoke", 516, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v46 = objc_retainAutorelease(v44);
      v47 = v45;
      *(_DWORD *)buf = 136446210;
      v49 = objc_msgSend(v46, "UTF8String");
      _os_log_impl(&dword_1DE311000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  objc_msgSend(a1[5], "_sendUpdateMessageForCurrentValues");

}

- (void)readEnvironmentalDosimetryLevels
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HUNoiseController dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke;
  block[3] = &unk_1EA8E8B68;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  double v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countOfClientsListeningForIdentifier:", 0x40000);

  if (v5)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuring for foreground measurements."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 533, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      v45 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    LODWORD(v11) = 1148846080;
    objc_msgSend(*(id *)(a1 + 32), "setSampleDuration:", v11);
    objc_msgSend(*(id *)(a1 + 32), "measurementConfigurationWithDuration:period:config:", 100, 100, 1);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    objc_msgSend(*(id *)(a1 + 32), "stopReceivingAudioDosageSamples");
    objc_msgSend(*(id *)(a1 + 32), "edDataReceiver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configureAudioSampleType:configuration:", 1702260324, v13);

    objc_msgSend(*(id *)(a1 + 32), "edDataReceiver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isMeasurementOnForAudioSampleType:", 1702260324);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "edDataReceiver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startMeasuringAudioSampleType:withConfiguration:", 1702260324, v13);

    }
    objc_msgSend(*(id *)(a1 + 32), "restartADAMTimer");
    objc_msgSend(*(id *)(a1 + 32), "edDataReceiver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke_283;
    v42[3] = &unk_1EA8EB088;
    objc_copyWeak(&v43, (id *)(a1 + 40));
    objc_msgSend(v18, "startReceivingAudioSampleType:withCallback:", 1702260324, v42);

    objc_destroyWeak(&v43);
    goto LABEL_17;
  }
  if ((v3 & 1) == 0)
  {
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "noiseEnabled");

    if ((v20 & 1) != 0)
    {
      v21 = objc_msgSend(MEMORY[0x1E0D2F990], "supportsAlwaysListening");
      HCHPInitializeLogging();
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuring for background measurements with AOM."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 559, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)*MEMORY[0x1E0D2F938];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_retainAutorelease(v23);
          v26 = v24;
          *(_DWORD *)buf = 136446210;
          v45 = objc_msgSend(v25, "UTF8String");
          _os_log_impl(&dword_1DE311000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        LODWORD(v27) = 1148846080;
        objc_msgSend(*(id *)(a1 + 32), "setSampleDuration:", v27);
        objc_msgSend(*(id *)(a1 + 32), "measurementConfigurationWithDuration:period:config:", 1000, 1000, 0);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuring for background measurements."));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 565, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)*MEMORY[0x1E0D2F938];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
        {
          v39 = objc_retainAutorelease(v37);
          v40 = v38;
          *(_DWORD *)buf = 136446210;
          v45 = objc_msgSend(v39, "UTF8String");
          _os_log_impl(&dword_1DE311000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        LODWORD(v41) = 1167867904;
        objc_msgSend(*(id *)(a1 + 32), "setSampleDuration:", v41);
        objc_msgSend(*(id *)(a1 + 32), "measurementConfigurationWithDuration:period:config:", 1000, 5000, 0);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_5;
    }
  }
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping background measurements. Low power enabled %d"), v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 540, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_retainAutorelease(v29);
    v32 = v30;
    *(_DWORD *)buf = 136446210;
    v45 = objc_msgSend(v31, "UTF8String");
    _os_log_impl(&dword_1DE311000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v34 = *(void **)(a1 + 32);
  v33 = (id *)(a1 + 32);
  objc_msgSend(v34, "setMeasurementEnabled:", 0);
  objc_msgSend(*v33, "edDataReceiver");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stopReceivingAudioSampleType:", 1702260324);

  objc_msgSend(*v33, "edDataReceiver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopMeasuringAudioSampleType:", 1702260324);
LABEL_17:

}

void __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "processMeasurement:withMetadata:", v6, v5);

}

- (void)_sendUpdateMessageForCurrentValues
{
  NSObject *v3;
  float v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  -[HUNoiseController dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HUNoiseController slowLeq](self, "slowLeq");
  if (v4 != 1.1755e-38 && (-[HUNoiseController fastLeq](self, "fastLeq"), v5 != 1.1755e-38)
    || !-[HUNoiseController isMeasurementEnabled](self, "isMeasurementEnabled"))
  {
    v6 = -[HUNoiseController _fetchDeviceState](self, "_fetchDeviceState");
    v8 = v7;
    -[HUNoiseController slowLeq](self, "slowLeq");
    v10 = v9;
    -[HUNoiseController fastLeq](self, "fastLeq");
    v12 = v11;
    +[HUNoiseUtilities attenuationForExposure:deviceType:andListeningState:](HUNoiseUtilities, "attenuationForExposure:deviceType:andListeningState:", v6, v8, v10);
    v14 = v13;
    +[HUNoiseUtilities attenuationForExposure:deviceType:andListeningState:](HUNoiseUtilities, "attenuationForExposure:deviceType:andListeningState:", v6, v8, v12);
    v16 = v15;
    if ((float)(v10 - v14) >= 80.0)
      v17 = 80;
    else
      v17 = 0;
    *(float *)&v15 = v10 - v14;
    -[HUNoiseController setThresholdLevel:](self, "setThresholdLevel:", v17, v15);
    v33 = (void *)MEMORY[0x1E0C99D80];
    *(float *)&v18 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[HUNoiseController fastLeq](self, "fastLeq");
    objc_msgSend(v19, "numberWithFloat:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUNoiseController isMeasurementEnabled](self, "isMeasurementEnabled"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUNoiseController thresholdLevel](self, "thresholdLevel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUNoiseController isWearingAirpods](self, "isWearingAirpods"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryWithObjectsAndKeys:", v32, CFSTR("HUEDSlowLeqIdentifier"), v31, CFSTR("HUEDFastLeqIdentifier"), v30, CFSTR("HUEDEnabledIdentifier"), v20, CFSTR("HUEDThresholdCrossedIdentifier"), v22, CFSTR("HUEDSlowAttenuationLevelIdentifier"), v24, CFSTR("HUEDFastAttenuationLevelIdentifier"), v25, CFSTR("HUEDWearingAirPodsIdentifier"), v26, CFSTR("HUEDDeviceTypeIdentifier"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v27, 0x40000);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D2F9A0], "messageWithPayload:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendUpdateMessage:forIdentifier:", v29, 0x40000);

  }
}

- (void)_clearCachedValues
{
  NSObject *v3;
  _QWORD block[5];

  -[HUNoiseController dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HUNoiseController__clearCachedValues__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__HUNoiseController__clearCachedValues__block_invoke(uint64_t a1, double a2)
{
  double v3;

  LODWORD(a2) = 0x800000;
  objc_msgSend(*(id *)(a1 + 32), "setSlowLeq:", a2);
  LODWORD(v3) = 0x800000;
  objc_msgSend(*(id *)(a1 + 32), "setFastLeq:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "setMeasurementEnabled:", 0);
}

- (void)stopReceivingAudioDosageSamples
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stop receiving audio dosage samples. clearing cached values"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController stopReceivingAudioDosageSamples]", 643, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUNoiseController _clearCachedValues](self, "_clearCachedValues");
  -[AXDispatchTimer cancel](self->_adamSuspendedTimer, "cancel");
  -[ADAMAudioDataReceiver stopReceivingAudioSampleType:](self->_edDataReceiver, "stopReceivingAudioSampleType:", 1702260324);
}

- (void)_logNoiseEnabledStateToPowerlog:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t, const __CFString *, uint64_t, _QWORD);
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("noiseEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v5 = (void (*)(uint64_t, const __CFString *, uint64_t, _QWORD))getPLLogRegisteredEventSymbolLoc_ptr;
  v10 = getPLLogRegisteredEventSymbolLoc_ptr;
  if (!getPLLogRegisteredEventSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getPLLogRegisteredEventSymbolLoc_block_invoke;
    v6[3] = &unk_1EA8E8270;
    v6[4] = &v7;
    __getPLLogRegisteredEventSymbolLoc_block_invoke((uint64_t)v6);
    v5 = (void (*)(uint64_t, const __CFString *, uint64_t, _QWORD))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v5)
  {
    getADAFMetadataKeyHAEDataForGauge_cold_1();
    __break(1u);
  }
  v5(92, CFSTR("NoiseEnabledStateChanged"), v4, MEMORY[0x1E0C9AA60]);

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_fetchDeviceState
{
  void *v2;
  NSObject *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  _QWORD block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1DE3A18A6;
  +[HUAccessoryManager sharedInstance](HUAccessoryManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HUNoiseController__fetchDeviceState__block_invoke;
  block[3] = &unk_1EA8E8270;
  block[4] = &v9;
  dispatch_sync(v3, block);

  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

void __38__HUNoiseController__fetchDeviceState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[HUAccessoryHearingSyncManager sharedInstance](HUAccessoryHearingSyncManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "deviceState");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v4;

}

- (void)applyNotificationLogicForSPL:(float)a3 withDuration:(float)a4
{
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "notificationsEnabled");

  if (v8)
  {
    if (-[HUNoiseController isNotified](self, "isNotified"))
    {
      if (-[HUNoiseController isMuted](self, "isMuted"))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "notificationMuteDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", v17);
        v19 = v18;

        if (v19 > 0.0)
        {
          HCHPInitializeLogging();
          v20 = (void *)MEMORY[0x1E0CB3940];
          +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "notificationMuteDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Resetting notifications since it has past the notification mute date of %@"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController applyNotificationLogicForSPL:withDuration:]", 689, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)*MEMORY[0x1E0D2F938];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_retainAutorelease(v24);
            v27 = v25;
            *(_DWORD *)buf = 136446210;
            v29 = objc_msgSend(v26, "UTF8String");
            _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
          -[HUNoiseController setNotified:](self, "setNotified:", 0);
          -[HUNoiseController setMuted:](self, "setMuted:", 0);
        }
      }
      else
      {
        LODWORD(v14) = 1230748160;
        *(float *)&v12 = a3;
        *(float *)&v13 = a4;
        -[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:](self, "checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:", self->_leqBuffer, v12, v13, v14);
      }
    }
    else
    {
      LODWORD(v11) = 1211090944;
      *(float *)&v9 = a3;
      *(float *)&v10 = a4;
      -[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:](self, "checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:", self->_leqBuffer, v9, v10, v11);
    }
  }
}

- (void)checkToResetNotificationsForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6
{
  id v10;
  HUNoiseSample *v11;
  void *v12;
  double v13;
  double v14;
  HUNoiseSample *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  unsigned int v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = [HUNoiseSample alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  v15 = -[HUNoiseSample initWithSampleDate:splValue:andDuration:](v11, "initWithSampleDate:splValue:andDuration:", v12, v13, v14);

  objc_msgSend(v10, "addObject:", v15);
  *(float *)&v16 = a6;
  -[HUNoiseController maintainCircularBuffer:forTime:](self, "maintainCircularBuffer:forTime:", v10, v16);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sampleDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sampleDate");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sampleDuration");
    v23 = v22;

    objc_msgSend(v20, "timeIntervalSinceDate:", v18);
    v25 = v24;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", self->_timeNotified);
    v28 = (v27 * 1000.0);

    if ((float)v28 >= a6)
    {
      v29 = v23 + v25 * 1000.0;
      if ((float)(a6 * 90.0) / 100.0 <= v29)
      {
        -[HUNoiseController calculateLeqForBuffer:](self, "calculateLeqForBuffer:", v10);
        v31 = v30;
        +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (float)(unint64_t)objc_msgSend(v32, "notificationThreshold");

        if (v31 < v33)
        {
          HCHPInitializeLogging();
          v39 = (void *)MEMORY[0x1E0CB3940];
          +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("Resetting notifications for Leq %0.1f dB being under %i dB threshold for minimum reset time"), v31, objc_msgSend(v40, "notificationThreshold"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:]", 731, v34);
          v35 = (id)objc_claimAutoreleasedReturnValue();
          v36 = (void *)*MEMORY[0x1E0D2F938];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
          {
LABEL_11:
            v35 = objc_retainAutorelease(v35);
            v41 = v36;
            *(_DWORD *)buf = 136446210;
            v43 = objc_msgSend(v35, "UTF8String");
            _os_log_impl(&dword_1DE311000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
LABEL_12:

          -[HUNoiseController setNotified:](self, "setNotified:", 0);
          goto LABEL_13;
        }
      }
    }
    if (v28 >= 0x1B7740)
    {
      HCHPInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resetting notifications since it has been more than general reset time"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:]", 739, v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (void *)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      goto LABEL_12;
    }
  }
  else
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed while checking to reset notifications because buffer is empty."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:]", 714, v18);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v37 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_retainAutorelease(v20);
      v38 = v37;
      *(_DWORD *)buf = 136446210;
      v43 = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
LABEL_13:

}

- (void)checkToSurfaceNotificationForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6
{
  id v10;
  HUNoiseSample *v11;
  void *v12;
  double v13;
  double v14;
  HUNoiseSample *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  double v25;
  void *v26;
  float v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  unsigned int v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  float v64;
  float v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  int v87;
  id v88;
  _QWORD v89[5];
  _QWORD v90[4];
  id v91;
  id v92;
  uint8_t v93[4];
  uint64_t v94;
  __int128 buf;
  uint64_t v96;
  int v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = [HUNoiseSample alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  v15 = -[HUNoiseSample initWithSampleDate:splValue:andDuration:](v11, "initWithSampleDate:splValue:andDuration:", v12, v13, v14);

  -[HUNoiseController logThresholdTransitionForSample:](self, "logThresholdTransitionForSample:", v15);
  objc_msgSend(v10, "addObject:", v15);
  *(float *)&v16 = a6;
  -[HUNoiseController maintainCircularBuffer:forTime:](self, "maintainCircularBuffer:forTime:", v10, v16);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sampleDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sampleDate");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sampleDuration");
    v23 = v22;

    objc_msgSend(v20, "timeIntervalSinceDate:", v18);
    v25 = v24;
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((float)(unint64_t)objc_msgSend(v26, "notificationThreshold") > a3
      || (v27 = v23 + v25 * 1000.0, (float)(a6 * 90.0) / 100.0 > v27))
    {

      goto LABEL_25;
    }

    if (v27 <= 15000.0)
      goto LABEL_25;
    HCHPInitializeLogging();
    v30 = (void *)MEMORY[0x1E0CB3940];
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Sample is above threshold of %i dB and buffered more than %i ms"), objc_msgSend(v31, "notificationThreshold"), (int)a6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 769, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_retainAutorelease(v33);
      v36 = v34;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v35, "UTF8String");
      _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(v20, "dateByAddingTimeInterval:", -15.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leq buffer gating date: %@"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 772, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_retainAutorelease(v39);
      v42 = v40;
      v43 = objc_msgSend(v41, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_1DE311000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke;
    v90[3] = &unk_1EA8EB0B0;
    v88 = v37;
    v91 = v88;
    v45 = v44;
    v92 = v45;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v90);
    if (!objc_msgSend(v45, "count"))
    {
LABEL_24:

      goto LABEL_25;
    }
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total count of samples beyond gate date: %i"), objc_msgSend(v45, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 787, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_retainAutorelease(v47);
      v50 = v48;
      v51 = objc_msgSend(v49, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_1DE311000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v96 = 0x2020000000;
    v97 = 0;
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke_312;
    v89[3] = &unk_1EA8EB0D8;
    v89[4] = &buf;
    objc_msgSend(v45, "enumerateObjectsUsingBlock:", v89);
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Count of samples beyond gate date and above threshold: %i"), *(unsigned int *)(*((_QWORD *)&buf + 1) + 24));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 798, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
      *(_DWORD *)v93 = 136446210;
      v94 = v55;
      _os_log_impl(&dword_1DE311000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    v56 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
    v57 = (float)((float)v56 / (float)(unint64_t)objc_msgSend(v45, "count")) * 100.0;
    if (v57 < 50.0)
      goto LABEL_23;
    HCHPInitializeLogging();
    v58 = (void *)MEMORY[0x1E0CB3940];
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringWithFormat:", CFSTR("Checking to surface notification: %i percent of last %i seconds of samples are above %i dB set threshold - calculating leq"), (int)v57, 15, objc_msgSend(v59, "notificationThreshold"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 803, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
      *(_DWORD *)v93 = 136446210;
      v94 = v63;
      _os_log_impl(&dword_1DE311000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    -[HUNoiseController calculateLeqForBuffer:](self, "calculateLeqForBuffer:", v10);
    v65 = v64;
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calculated Leq: %0.1f dB"), v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 806, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
      *(_DWORD *)v93 = 136446210;
      v94 = v69;
      _os_log_impl(&dword_1DE311000, v68, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v65 < (float)(unint64_t)objc_msgSend(v70, "notificationThreshold");

    if (v71)
    {
LABEL_23:
      _Block_object_dispose(&buf, 8);
      goto LABEL_24;
    }
    HCHPInitializeLogging();
    v72 = (void *)MEMORY[0x1E0CB3940];
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "stringWithFormat:", CFSTR("Leq over last 3 minutes is %0.0f dB, which is over set threshold of %i dB."), v65, objc_msgSend(v73, "notificationThreshold"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 810, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = objc_msgSend(objc_retainAutorelease(v75), "UTF8String");
      *(_DWORD *)v93 = 136446210;
      v94 = v77;
      _os_log_impl(&dword_1DE311000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    *(float *)&v78 = v65;
    -[HUNoiseController logNoiseBuffer:calculatedLeq:](self, "logNoiseBuffer:calculatedLeq:", v10, v78);
    *(float *)&v79 = v65;
    -[HUNoiseController showNotificationForAlertType:](self, "showNotificationForAlertType:", -[HUNoiseController alertTypeFromLevel:](self, "alertTypeFromLevel:", v79));
    -[HUNoiseController setNotified:](self, "setNotified:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNoiseController setTimeNotified:](self, "setTimeNotified:", v80);

    *(float *)&v81 = v65;
    -[HUNoiseController writeNotificationSampleToHKWithSPL:startDate:endDate:](self, "writeNotificationSampleToHKWithSPL:startDate:endDate:", v18, v20, v81);
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Completed surfacing notification at %@ for Leq %0.1f dB and writing sample to HK"), self->_timeNotified, v65);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 852, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = objc_msgSend(objc_retainAutorelease(v83), "UTF8String");
      *(_DWORD *)v93 = 136446210;
      v94 = v85;
      _os_log_impl(&dword_1DE311000, v84, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "isHealthDataSubmissionAllowed");

    if (v87)
      AnalyticsSendEventLazy();
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed while checking to surface notification because buffer is empty."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 756, v18);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v28 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_retainAutorelease(v20);
      v29 = v28;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_1DE311000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
  }
LABEL_25:

}

void __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sampleDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32));

  if (v5 != -1)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    HCHPInitializeLogging();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "splValue");
    v8 = v7;
    objc_msgSend(v3, "sampleDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Sample is beyond gate date: %0.1f, %@"), *(_QWORD *)&v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]_block_invoke", 781, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

void __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke_312(uint64_t a1, void *a2)
{
  float v3;
  float v4;
  void *v5;
  float v6;

  objc_msgSend(a2, "splValue");
  v4 = v3;
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float)(unint64_t)objc_msgSend(v5, "notificationThreshold");

  if (v4 >= v6)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

id __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke_326(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("timeNotified");
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 3, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("leq");
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("notificationThreshold");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "notificationThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)applyAnalyticsNotificationLogicForSPL:(float)a3 withDuration:(float)a4
{
  void *v7;
  int v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  NSMutableArray *leqBuffer80Threshold;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *leqBuffer85Threshold;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  NSMutableArray *leqBuffer90Threshold;

  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "notificationsEnabled");

  if (v8)
  {
    v9 = -[HUNoiseController isNotified80](self, "isNotified80");
    leqBuffer80Threshold = self->_leqBuffer80Threshold;
    if (v9)
    {
      LODWORD(v12) = 1230748160;
      *(float *)&v10 = a3;
      *(float *)&v11 = a4;
      -[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:](self, "checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:", leqBuffer80Threshold, 0, v10, v11, v12);
    }
    else
    {
      LODWORD(v12) = 1211090944;
      *(float *)&v10 = a3;
      *(float *)&v11 = a4;
      -[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:](self, "checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:", leqBuffer80Threshold, 0, v10, v11, v12);
    }
    v14 = -[HUNoiseController isNotified85](self, "isNotified85");
    leqBuffer85Threshold = self->_leqBuffer85Threshold;
    if (v14)
    {
      LODWORD(v17) = 1230748160;
      *(float *)&v15 = a3;
      *(float *)&v16 = a4;
      -[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:](self, "checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:", leqBuffer85Threshold, 1, v15, v16, v17);
    }
    else
    {
      LODWORD(v17) = 1211090944;
      *(float *)&v15 = a3;
      *(float *)&v16 = a4;
      -[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:](self, "checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:", leqBuffer85Threshold, 1, v15, v16, v17);
    }
    v19 = -[HUNoiseController isNotified90](self, "isNotified90");
    leqBuffer90Threshold = self->_leqBuffer90Threshold;
    if (v19)
    {
      LODWORD(v22) = 1230748160;
      *(float *)&v20 = a3;
      *(float *)&v21 = a4;
      -[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:](self, "checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:", leqBuffer90Threshold, 2, v20, v21, v22);
    }
    else
    {
      LODWORD(v22) = 1211090944;
      *(float *)&v20 = a3;
      *(float *)&v21 = a4;
      -[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:](self, "checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:", leqBuffer90Threshold, 2, v20, v21, v22);
    }
  }
}

- (void)checkToResetAnalyticsNotificationsForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6 andThreshold:(int64_t)a7
{
  id v12;
  HUNoiseSample *v13;
  void *v14;
  double v15;
  double v16;
  HUNoiseSample *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  double v27;
  float v28;
  void *v29;
  double v30;
  unsigned int v31;
  void *v32;
  NSObject *v33;
  float v34;
  float v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = [HUNoiseSample alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a3;
  *(float *)&v16 = a4;
  v17 = -[HUNoiseSample initWithSampleDate:splValue:andDuration:](v13, "initWithSampleDate:splValue:andDuration:", v14, v15, v16);

  objc_msgSend(v12, "addObject:", v17);
  *(float *)&v18 = a6;
  -[HUNoiseController maintainCircularBuffer:forTime:](self, "maintainCircularBuffer:forTime:", v12, v18);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sampleDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sampleDate");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sampleDuration");
    v25 = v24;

    objc_msgSend(v22, "timeIntervalSinceDate:", v20);
    v27 = v26;
    if ((unint64_t)a7 > 2)
    {
      v31 = 0;
      v28 = 0.0;
    }
    else
    {
      v28 = flt_1DE390008[a7];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", (&self->_timeNotified80)[a7]);
      v31 = (v30 * 1000.0);

    }
    *(float *)&v26 = (float)v31;
    if ((float)v31 >= a6)
    {
      v34 = v25 + v27 * 1000.0;
      v26 = v34;
      if ((float)(a6 * 90.0) / 100.0 <= v26)
      {
        -[HUNoiseController calculateLeqForBuffer:](self, "calculateLeqForBuffer:", v12);
        if (*(float *)&v26 < v28)
        {
          v35 = *(float *)&v26;
          switch(a7)
          {
            case 2:
              -[HUNoiseController setNotified90:](self, "setNotified90:", 0);
              break;
            case 1:
              -[HUNoiseController setNotified85:](self, "setNotified85:", 0);
              break;
            case 0:
              -[HUNoiseController setNotified80:](self, "setNotified80:", 0);
              break;
          }
          HCHPInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics]: Resetting notifications for Leq %0.1f dB being under %i dB threshold for minimum reset time"), v35, (int)v28);
          v33 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:]", 982, v33);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v37 = (void *)*MEMORY[0x1E0D2F938];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
LABEL_26:
          v36 = objc_retainAutorelease(v36);
          v38 = v37;
          *(_DWORD *)buf = 136446210;
          v40 = objc_msgSend(v36, "UTF8String");
          _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

LABEL_27:
          goto LABEL_28;
        }
      }
    }
    if (v31 >= 0x1B7740)
    {
      switch(a7)
      {
        case 2:
          -[HUNoiseController setNotified90:](self, "setNotified90:", 0, v26);
          break;
        case 1:
          -[HUNoiseController setNotified85:](self, "setNotified85:", 0, v26);
          break;
        case 0:
          -[HUNoiseController setNotified80:](self, "setNotified80:", 0, v26);
          break;
      }
      HCHPInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Resetting notifications since it has been more than general reset time for %i dB threshold"), (int)v28);
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1007, v33);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v37 = (void *)*MEMORY[0x1E0D2F938];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics]: Failed while checking to reset notifications because buffer is empty."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:]", 927, v20);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v32 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v22);
      v33 = v32;
      *(_DWORD *)buf = 136446210;
      v40 = objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_1DE311000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_28:

    }
  }

}

- (void)checkToSurfaceAnalyticsNotificationForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6 andThreshold:(int64_t)a7
{
  id v12;
  void *v13;
  int v14;
  HUNoiseSample *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  unsigned int v56;
  float v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  float v62;
  float v63;
  double v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  void *v80;
  _QWORD v81[5];
  float v82;
  _QWORD v83[4];
  id v84;
  id v85;
  float v86;
  uint8_t v87[4];
  uint64_t v88;
  __int128 buf;
  uint64_t v90;
  int v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isHealthDataSubmissionAllowed");

  if (v14)
  {
    v15 = [HUNoiseSample alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v17 = a3;
    *(float *)&v18 = a4;
    v19 = -[HUNoiseSample initWithSampleDate:splValue:andDuration:](v15, "initWithSampleDate:splValue:andDuration:", v16, v17, v18);

    v80 = (void *)v19;
    objc_msgSend(v12, "addObject:", v19);
    *(float *)&v20 = a6;
    -[HUNoiseController maintainCircularBuffer:forTime:](self, "maintainCircularBuffer:forTime:", v12, v20);
    if (!objc_msgSend(v12, "count"))
    {
      HCHPInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Failed while checking to surface notification because buffer is empty."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1025, v22);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v72 = (void *)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_retainAutorelease(v24);
        v73 = v72;
        LODWORD(buf) = 136446210;
        *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v24, "UTF8String");
        _os_log_impl(&dword_1DE311000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

      }
      goto LABEL_40;
    }
    objc_msgSend(v12, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sampleDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sampleDate");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sampleDuration");
    v27 = v26;

    objc_msgSend(v24, "timeIntervalSinceDate:", v22);
    v29 = 0.0;
    if ((unint64_t)a7 <= 2)
      v29 = flt_1DE390008[a7];
    if (v29 > a3
      || ((v30 = v27 + v28 * 1000.0, v30 > 15000.0) ? (v31 = (float)(a6 * 90.0) / 100.0 > v30) : (v31 = 1), v31))
    {
LABEL_40:

      goto LABEL_41;
    }
    HCHPInitializeLogging();
    v79 = (int)v29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Sample is above threshold of %i dB and buffered more than %i ms"), v79, (int)a6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1058, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_retainAutorelease(v33);
      v36 = v34;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v35, "UTF8String");
      _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(v24, "dateByAddingTimeInterval:", -15.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Leq buffer gating date for %i dB threshold: %@"), v79, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1061, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_retainAutorelease(v39);
      v42 = v40;
      v43 = objc_msgSend(v41, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_1DE311000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke;
    v83[3] = &unk_1EA8EB128;
    v78 = v37;
    v84 = v78;
    v45 = v44;
    v85 = v45;
    v86 = v29;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v83);
    if (!objc_msgSend(v45, "count"))
    {
LABEL_39:

      goto LABEL_40;
    }
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Total count of samples beyond gate date for %i dB threshold: %i"), v79, objc_msgSend(v45, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1076, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_retainAutorelease(v47);
      v50 = v48;
      v51 = objc_msgSend(v49, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_1DE311000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v90 = 0x2020000000;
    v91 = 0;
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_351;
    v81[3] = &unk_1EA8EB150;
    v82 = v29;
    v81[4] = &buf;
    objc_msgSend(v45, "enumerateObjectsUsingBlock:", v81);
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Count of samples beyond gate date and above %i dB threshold: %i"), v79, *(unsigned int *)(*((_QWORD *)&buf + 1) + 24));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1087, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
      *(_DWORD *)v87 = 136446210;
      v88 = v55;
      _os_log_impl(&dword_1DE311000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    v56 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
    v57 = (float)((float)v56 / (float)(unint64_t)objc_msgSend(v45, "count")) * 100.0;
    if (v57 < 50.0)
      goto LABEL_38;
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Checking to surface notification: %i percent of last %i seconds of samples are above %i dB set threshold - calculating leq"), (int)v57, 15, v79);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1092, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
      *(_DWORD *)v87 = 136446210;
      v88 = v61;
      _os_log_impl(&dword_1DE311000, v60, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    -[HUNoiseController calculateLeqForBuffer:](self, "calculateLeqForBuffer:", v12);
    v63 = v62;
    if (v62 < v29)
    {
LABEL_38:
      _Block_object_dispose(&buf, 8);
      goto LABEL_39;
    }
    HCHPInitializeLogging();
    v64 = v63;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Leq over last 3 minutes is %0.0f dB, which is over set threshold of %i dB."), *(_QWORD *)&v64, v79);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1098, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
      *(_DWORD *)v87 = 136446210;
      v88 = v68;
      _os_log_impl(&dword_1DE311000, v67, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "isHealthDataSubmissionAllowed");

    if (v70)
    {
      switch(a7)
      {
        case 2:
          -[HUNoiseController setNotified90:](self, "setNotified90:", 1);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUNoiseController setTimeNotified90:](self, "setTimeNotified90:", v71);
          goto LABEL_34;
        case 1:
          -[HUNoiseController setNotified85:](self, "setNotified85:", 1);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUNoiseController setTimeNotified85:](self, "setTimeNotified85:", v71);
          goto LABEL_34;
        case 0:
          -[HUNoiseController setNotified80:](self, "setNotified80:", 1);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUNoiseController setTimeNotified80:](self, "setTimeNotified80:", v71);
LABEL_34:

          AnalyticsSendEventLazy();
          break;
      }
    }
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Analytics] Analytics notification surfaced for Leq %0.1f dB and analytics threshold %i dB"), *(_QWORD *)&v64, v79);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1137, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (id)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = objc_msgSend(objc_retainAutorelease(v75), "UTF8String");
      *(_DWORD *)v87 = 136446210;
      v88 = v77;
      _os_log_impl(&dword_1DE311000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    goto LABEL_38;
  }
LABEL_41:

}

void __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sampleDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32));

  if (v5 != -1)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    HCHPInitializeLogging();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (int)*(float *)(a1 + 48);
    objc_msgSend(v3, "splValue");
    v9 = v8;
    objc_msgSend(v3, "sampleDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[Analytics] Sample is beyond gate date for %i dB threshold: %0.1f, %@"), v7, *(_QWORD *)&v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]_block_invoke", 1070, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

uint64_t __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_351(uint64_t a1, void *a2)
{
  uint64_t result;
  float v4;

  result = objc_msgSend(a2, "splValue");
  if (v4 >= *(float *)(a1 + 40))
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_360()
{
  return &unk_1EA900508;
}

void *__107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_366()
{
  return &unk_1EA900530;
}

void *__107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_372()
{
  return &unk_1EA900558;
}

- (void)maintainCircularBuffer:(id)a3 forTime:(float)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sampleDuration");
    v8 = v7;

    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sampleDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      v16 = v8;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v18, "sampleDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeIntervalSinceDate:", v19);
          *(float *)&v20 = v16 + v20 * 1000.0;
          if (*(float *)&v20 >= a4)
            objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
      objc_msgSend(v12, "removeObjectsInArray:", v11);
  }
  else
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to maintain circular buffer because buffer is empty."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController maintainCircularBuffer:forTime:]", 1150, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v11);
      v22 = v21;
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (float)calculateLeqForBuffer:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  uint64_t i;
  void *v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  float v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      v8 = 0.0;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "splValue");
          v13 = v12;
          objc_msgSend(v11, "sampleDuration");
          v8 = v8 + v14;
          v9 = v9 + v14 * __exp10((float)(v13 / 10.0));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
      v9 = 0.0;
    }

    v20 = log10((float)((float)(1.0 / v8) * v9)) * 10.0;
  }
  else
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to calculate Leq for buffer because buffer is empty."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController calculateLeqForBuffer:]", 1179, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_retainAutorelease(v16);
      v19 = v17;
      *(_DWORD *)buf = 136446210;
      v28 = objc_msgSend(v18, "UTF8String");
      _os_log_impl(&dword_1DE311000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v20 = 0.0;
  }

  return v20;
}

- (BOOL)isWearingAirpods
{
  unint64_t v2;

  -[HUNoiseController _fetchDeviceState](self, "_fetchDeviceState");
  return (v2 < 6) & (0x36u >> v2);
}

- (BOOL)shouldShowHearingProtectionSuggestion
{
  return 0;
}

- (void)writeNotificationSampleToHKWithSPL:(float)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id HKQuantityClass;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  HKCategorySample *v35;
  HKCategorySample *notificationSample;
  HKCategorySample **p_notificationSample;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  _QWORD v51[2];
  __int128 buf;
  uint64_t v53;
  void *v54;
  uint64_t *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  HKQuantityClass = getHKQuantityClass();
  objc_msgSend(getHKUnitClass(), "decibelAWeightedSoundPressureLevelUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a3;
  objc_msgSend(HKQuantityClass, "quantityWithUnit:doubleValue:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = getHKQuantityClass();
  objc_msgSend(getHKUnitClass(), "decibelAWeightedSoundPressureLevelUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15, (double)(unint64_t)objc_msgSend(v16, "notificationThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v53 = 0x2020000000;
  v18 = (id *)getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr;
  v54 = (void *)getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr;
  if (!getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr)
  {
    v19 = (void *)HealthKitLibrary();
    v18 = (id *)dlsym(v19, "HKMetadataKeyAudioExposureLevel");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v18;
    getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&buf, 8);
  if (!v18)
    goto LABEL_17;
  v20 = *v18;
  v49 = v20;
  v51[0] = v13;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v53 = 0x2020000000;
  v21 = (id *)get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr;
  v54 = (void *)get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr)
  {
    v22 = (void *)HealthKitLibrary();
    v21 = (id *)dlsym(v22, "_HKPrivateMetadataKeyAudioExposureLimit");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v21;
    get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&buf, 8);
  if (!v21)
  {
LABEL_17:
    getADAFMetadataKeyHAEDataForGauge_cold_1();
    goto LABEL_20;
  }
  v50 = *v21;
  v51[1] = v17;
  v23 = (void *)MEMORY[0x1E0C99D80];
  v24 = v50;
  objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v51, &v49, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v26 = (void *)getHKCategorySampleClass_softClass;
  v48 = getHKCategorySampleClass_softClass;
  if (!getHKCategorySampleClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v53 = (uint64_t)__getHKCategorySampleClass_block_invoke;
    v54 = &unk_1EA8E8270;
    v55 = &v45;
    __getHKCategorySampleClass_block_invoke((uint64_t)&buf);
    v26 = (void *)v46[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v45, 8);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v28 = (void *)getHKObjectTypeClass_softClass;
  v48 = getHKObjectTypeClass_softClass;
  if (!getHKObjectTypeClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v53 = (uint64_t)__getHKObjectTypeClass_block_invoke;
    v54 = &unk_1EA8E8270;
    v55 = &v45;
    __getHKObjectTypeClass_block_invoke((uint64_t)&buf);
    v28 = (void *)v46[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v45, 8);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v53 = 0x2020000000;
  v30 = (id *)getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr;
  v54 = (void *)getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr;
  if (!getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr)
  {
    v31 = (void *)HealthKitLibrary();
    v30 = (id *)dlsym(v31, "HKCategoryTypeIdentifierEnvironmentalAudioExposureEvent");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v30;
    getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(&buf, 8);
  if (!v30)
  {
    getADAFMetadataKeyHAEDataForGauge_cold_1();
LABEL_20:
    __break(1u);
  }
  v32 = *v30;
  objc_msgSend(v29, "categoryTypeForIdentifier:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKDeviceClass(), "localDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "categorySampleWithType:value:startDate:endDate:device:metadata:", v33, 1, v8, v9, v34, v25);
  v35 = (HKCategorySample *)objc_claimAutoreleasedReturnValue();
  p_notificationSample = &self->_notificationSample;
  notificationSample = self->_notificationSample;
  self->_notificationSample = v35;

  -[HUNoiseController healthStore](self, "healthStore");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "saveObject:withCompletion:", *p_notificationSample, &__block_literal_global_385);

  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrote sample to HK for Leq: %0.1f dB, StartDate: %@, EndDate: %@"), *(_QWORD *)&v12, v8, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController writeNotificationSampleToHKWithSPL:startDate:endDate:]", 1267, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v42 = objc_retainAutorelease(v40);
    v43 = v41;
    v44 = objc_msgSend(v42, "UTF8String");
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v44;
    _os_log_impl(&dword_1DE311000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
}

void __74__HUNoiseController_writeNotificationSampleToHKWithSPL_startDate_endDate___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = a3;
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write sample to HK with error: %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController writeNotificationSampleToHKWithSPL:startDate:endDate:]_block_invoke", 1264, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

- (void)writeAttentuationSampleToHealth
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id HKQuantityClass;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  HKDataCollector *attenuationDataCollector;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 buf;
  AXFakeHearingAidDevice *(*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HUNoiseController attenuationBuffer](self, "attenuationBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[HUNoiseController attenuationBuffer](self, "attenuationBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HUNoiseController calculateLeqForBuffer:](self, "calculateLeqForBuffer:", v4);
  v7 = v6;
  objc_msgSend(v4, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sampleDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 < 1.0 || (objc_msgSend(v11, "timeIntervalSinceDate:", v9), v12 <= 0.0))
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping HK write %lf"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController writeAttentuationSampleToHealth]", 1294, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v25 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v16);
      v26 = v25;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v16, "UTF8String");
      _os_log_impl(&dword_1DE311000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
  }
  else
  {
    HKQuantityClass = getHKQuantityClass();
    objc_msgSend(getHKUnitClass(), "decibelAWeightedSoundPressureLevelUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(HKQuantityClass, "quantityWithUnit:doubleValue:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v11);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v17 = (void *)getHKQuantityDatumClass_softClass;
    v30 = getHKQuantityDatumClass_softClass;
    if (!getHKQuantityDatumClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v33 = __getHKQuantityDatumClass_block_invoke;
      v34 = &unk_1EA8E8270;
      v35 = &v27;
      __getHKQuantityDatumClass_block_invoke((uint64_t)&buf);
      v17 = (void *)v28[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v27, 8);
    v19 = [v18 alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithIdentifier:dateInterval:quantity:resumeContext:", v20, v16, v15, 0);

    attenuationDataCollector = self->_attenuationDataCollector;
    v31 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getHKDeviceClass(), "localDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataCollector insertDatums:device:metadata:completion:](attenuationDataCollector, "insertDatums:device:metadata:completion:", v23, v24, 0, &__block_literal_global_392);

  }
}

void __52__HUNoiseController_writeAttentuationSampleToHealth__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = a3;
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write sample to HK with error: %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController writeAttentuationSampleToHealth]_block_invoke", 1288, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

- (id)measurementConfigurationWithDuration:(unsigned int)a3 period:(unsigned int)a4 config:(unint64_t)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v6 = *(_QWORD *)&a3;
  v15[5] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E08];
  v14[0] = &unk_1EA8FFE30;
  v14[1] = &unk_1EA8FFE48;
  v15[0] = MEMORY[0x1E0C9AAA0];
  v15[1] = &unk_1EA901B28;
  v15[2] = &unk_1EA8FFE78;
  v14[2] = &unk_1EA8FFE60;
  v14[3] = &unk_1EA8FFE90;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  v14[4] = &unk_1EA8FFEA8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, &unk_1EA8FFEC0);

  }
  return v11;
}

- (void)subscribeToSharedNotifications
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, int);
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  objc_initWeak(&location, self);
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__HUNoiseController_subscribeToSharedNotifications__block_invoke;
  v12[3] = &unk_1EA8E95E8;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", v12, sel_noiseEnabled, self);

  -[HUNoiseController dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = 3221225472;
  v9 = __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_412;
  v10 = &unk_1EA8E9740;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch("com.apple.coreaudio.envsenseagent", &self->_measurementSuspensionNotifyToken, v5, &v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_lowPowerModeChanged_, *MEMORY[0x1E0CB3048], 0);

  -[HUNoiseController lowPowerModeChanged:](self, "lowPowerModeChanged:", 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __51__HUNoiseController_subscribeToSharedNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "noiseEnabled");

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_logNoiseEnabledStateToPowerlog:", v3);

  objc_msgSend(*(id *)(a1 + 32), "dataQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_2;
  v7[3] = &unk_1EA8EB238;
  v9 = v3;
  objc_copyWeak(&v8, v4);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
}

void __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  HCHPInitializeLogging();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Noise measurements enabled."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController subscribeToSharedNotifications]_block_invoke_2", 1329, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "readEnvironmentalDosimetryLevels");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Noise measurements disabled."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1334, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v14 = (id *)(a1 + 32);
    v15 = objc_loadWeakRetained(v14);
    objc_msgSend(v15, "writeAttentuationSampleToHealth");

    v16 = objc_loadWeakRetained(v14);
    objc_msgSend(v16, "edDataReceiver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopReceivingAudioSampleType:", 1702260324);

    WeakRetained = objc_loadWeakRetained(v14);
    objc_msgSend(WeakRetained, "edDataReceiver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stopMeasuringAudioSampleType:", 1702260324);

  }
}

void __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_412(uint64_t a1, int token)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  state64 = -1;
  notify_get_state(token, &state64);
  if (state64 == 1835885673)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received measurement disabled by EDA."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1362, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      v17 = objc_msgSend(v15, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v25 = v17;
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = WeakRetained;
    v11 = 0;
    goto LABEL_9;
  }
  if (state64 == 1835885934)
  {
    HCHPInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received measurement enabled by EDA."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1357, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      v8 = objc_msgSend(v6, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v25 = v8;
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = WeakRetained;
    v11 = 1;
LABEL_9:
    objc_msgSend(WeakRetained, "setMeasurementEnabled:", v11);
    goto LABEL_13;
  }
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to receive measurement state from EDA."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1367, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v18);
    v21 = v19;
    v22 = objc_msgSend(v20, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v25 = v22;
    _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
LABEL_13:

}

- (void)lowPowerModeChanged:(id)a3
{
  void *v4;
  void *v5;
  os_log_t *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  float v12;
  void *v13;
  void *v14;
  os_log_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  os_log_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Low power changed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController lowPowerModeChanged:]", 1381, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x1E0D2F938];
  v7 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v5);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v32 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isLowPowerModeEnabled");

  if (v11)
  {
    -[HUNoiseController sampleDuration](self, "sampleDuration");
    if (v12 == 5000.0)
    {
      HCHPInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Low power enabled. Stopping measurements."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController lowPowerModeChanged:]", 1386, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_retainAutorelease(v14);
        v17 = v15;
        v18 = objc_msgSend(v16, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v32 = v18;
        _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[HUNoiseController setMeasurementEnabled:](self, "setMeasurementEnabled:", 0);
      -[HUNoiseController edDataReceiver](self, "edDataReceiver");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stopReceivingAudioSampleType:", 1702260324);

      -[HUNoiseController edDataReceiver](self, "edDataReceiver");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stopMeasuringAudioSampleType:", 1702260324);

    }
  }
  else
  {
    +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "noiseEnabled");

    if (v22)
    {
      HCHPInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Low power disabled. Resuming measurements."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController lowPowerModeChanged:]", 1404, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_retainAutorelease(v24);
        v27 = v25;
        v28 = objc_msgSend(v26, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v32 = v28;
        _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[HUNoiseController setMeasurementEnabled:](self, "setMeasurementEnabled:", 1);
      -[HUNoiseController readEnvironmentalDosimetryLevels](self, "readEnvironmentalDosimetryLevels");
    }
  }
  -[HUNoiseController dataQueue](self, "dataQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HUNoiseController_lowPowerModeChanged___block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v29, block);

}

uint64_t __41__HUNoiseController_lowPowerModeChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendUpdateMessageForCurrentValues");
}

- (id)registerForEnvironmentalDosimetryUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWantsUpdates:forIdentifier:", v7, 0x40000);
  -[HUNoiseController readEnvironmentalDosimetryLevels](self, "readEnvironmentalDosimetryLevels");
  return 0;
}

- (void)logThresholdTransitionForSample:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "notificationThreshold");

  -[HUNoiseController leqBuffer](self, "leqBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "splValue");
  v9 = (float)v6;
  if (v10 >= (float)v6)
  {
    if (!v8 || (objc_msgSend(v8, "splValue"), v17 < v9))
    {
      HCHPInitializeLogging();
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "detailedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("[Notifications] Sample rises above threshold: %@"), v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController logThresholdTransitionForSample:]", 1708, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (void *)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        v15 = objc_retainAutorelease(v15);
        v20 = v16;
        *(_DWORD *)buf = 136446210;
        v22 = objc_msgSend(v15, "UTF8String");
        _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
LABEL_9:

    }
  }
  else
  {
    objc_msgSend(v8, "splValue");
    if (v11 >= v9)
    {
      HCHPInitializeLogging();
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "detailedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("[Notifications] Sample falls below threshold: %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController logThresholdTransitionForSample:]", 1713, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (void *)*MEMORY[0x1E0D2F938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      goto LABEL_9;
    }
  }

}

- (void)logNoiseBuffer:(id)a3 calculatedLeq:(float)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t i;
  void *v22;
  float v23;
  float v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "notificationThreshold");

  HCHPInitializeLogging();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("[Notifications] Surfacing notification with buffer count: %@, calculated Leq: %@"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController logNoiseBuffer:calculatedLeq:]", 1720, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v13);
    v16 = v14;
    *(_DWORD *)buf = 136446210;
    v41 = objc_msgSend(v15, "UTF8String");
    _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    v20 = (float)v7;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v22, "splValue");
        v24 = v23;
        HCHPInitializeLogging();
        v25 = (void *)MEMORY[0x1E0CB3940];
        if (v24 < v20)
          v26 = CFSTR(" ");
        else
          v26 = CFSTR("+");
        objc_msgSend(v22, "detailedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("[Notifications] %@ %@"), v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseController logNoiseBuffer:calculatedLeq:]", 1724, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)*MEMORY[0x1E0D2F938];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_retainAutorelease(v29);
          v32 = v30;
          v33 = objc_msgSend(v31, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v41 = v33;
          _os_log_impl(&dword_1DE311000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }

}

- (AXDispatchTimer)edDummyDataTimer
{
  return self->_edDummyDataTimer;
}

- (void)setEdDummyDataTimer:(id)a3
{
  objc_storeStrong((id *)&self->_edDummyDataTimer, a3);
}

- (AXDispatchTimer)adamSuspendedTimer
{
  return self->_adamSuspendedTimer;
}

- (void)setAdamSuspendedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_adamSuspendedTimer, a3);
}

- (NSMutableArray)leqBuffer
{
  return self->_leqBuffer;
}

- (void)setLeqBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_leqBuffer, a3);
}

- (NSMutableArray)attenuationBuffer
{
  return self->_attenuationBuffer;
}

- (void)setAttenuationBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_attenuationBuffer, a3);
}

- (float)slowLeq
{
  return self->_slowLeq;
}

- (void)setSlowLeq:(float)a3
{
  self->_slowLeq = a3;
}

- (float)fastLeq
{
  return self->_fastLeq;
}

- (void)setFastLeq:(float)a3
{
  self->_fastLeq = a3;
}

- (BOOL)isMeasurementEnabled
{
  return self->_measurementEnabled;
}

- (void)setMeasurementEnabled:(BOOL)a3
{
  self->_measurementEnabled = a3;
}

- (unint64_t)thresholdLevel
{
  return self->_thresholdLevel;
}

- (void)setThresholdLevel:(unint64_t)a3
{
  self->_thresholdLevel = a3;
}

- (NSDate)timeNotified
{
  return self->_timeNotified;
}

- (void)setTimeNotified:(id)a3
{
  objc_storeStrong((id *)&self->_timeNotified, a3);
}

- (float)sampleDuration
{
  return self->_sampleDuration;
}

- (void)setSampleDuration:(float)a3
{
  self->_sampleDuration = a3;
}

- (BOOL)isNotified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (NSMutableArray)leqBuffer80Threshold
{
  return self->_leqBuffer80Threshold;
}

- (void)setLeqBuffer80Threshold:(id)a3
{
  objc_storeStrong((id *)&self->_leqBuffer80Threshold, a3);
}

- (NSMutableArray)leqBuffer85Threshold
{
  return self->_leqBuffer85Threshold;
}

- (void)setLeqBuffer85Threshold:(id)a3
{
  objc_storeStrong((id *)&self->_leqBuffer85Threshold, a3);
}

- (NSMutableArray)leqBuffer90Threshold
{
  return self->_leqBuffer90Threshold;
}

- (void)setLeqBuffer90Threshold:(id)a3
{
  objc_storeStrong((id *)&self->_leqBuffer90Threshold, a3);
}

- (BOOL)isNotified80
{
  return self->_notified80;
}

- (void)setNotified80:(BOOL)a3
{
  self->_notified80 = a3;
}

- (BOOL)isNotified85
{
  return self->_notified85;
}

- (void)setNotified85:(BOOL)a3
{
  self->_notified85 = a3;
}

- (BOOL)isNotified90
{
  return self->_notified90;
}

- (void)setNotified90:(BOOL)a3
{
  self->_notified90 = a3;
}

- (NSDate)timeNotified80
{
  return self->_timeNotified80;
}

- (void)setTimeNotified80:(id)a3
{
  objc_storeStrong((id *)&self->_timeNotified80, a3);
}

- (NSDate)timeNotified85
{
  return self->_timeNotified85;
}

- (void)setTimeNotified85:(id)a3
{
  objc_storeStrong((id *)&self->_timeNotified85, a3);
}

- (NSDate)timeNotified90
{
  return self->_timeNotified90;
}

- (void)setTimeNotified90:(id)a3
{
  objc_storeStrong((id *)&self->_timeNotified90, a3);
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataQueue, a3);
}

- (ADAMAudioDataReceiver)edDataReceiver
{
  return self->_edDataReceiver;
}

- (void)setEdDataReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_edDataReceiver, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKCategorySample)notificationSample
{
  return self->_notificationSample;
}

- (void)setNotificationSample:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSample, a3);
}

- (HKDataCollector)attenuationDataCollector
{
  return self->_attenuationDataCollector;
}

- (void)setAttenuationDataCollector:(id)a3
{
  objc_storeStrong((id *)&self->_attenuationDataCollector, a3);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_attenuationDataCollector, 0);
  objc_storeStrong((id *)&self->_notificationSample, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_edDataReceiver, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_timeNotified90, 0);
  objc_storeStrong((id *)&self->_timeNotified85, 0);
  objc_storeStrong((id *)&self->_timeNotified80, 0);
  objc_storeStrong((id *)&self->_leqBuffer90Threshold, 0);
  objc_storeStrong((id *)&self->_leqBuffer85Threshold, 0);
  objc_storeStrong((id *)&self->_leqBuffer80Threshold, 0);
  objc_storeStrong((id *)&self->_timeNotified, 0);
  objc_storeStrong((id *)&self->_attenuationBuffer, 0);
  objc_storeStrong((id *)&self->_leqBuffer, 0);
  objc_storeStrong((id *)&self->_adamSuspendedTimer, 0);
  objc_storeStrong((id *)&self->_edDummyDataTimer, 0);
}

@end
