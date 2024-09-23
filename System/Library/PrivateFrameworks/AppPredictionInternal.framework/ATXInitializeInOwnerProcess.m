@implementation ATXInitializeInOwnerProcess

void ___ATXInitializeInOwnerProcess_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  id v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  id v57;
  _QWORD v58[4];
  NSObject *v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("deferredInit", v1);

  objc_msgSend(MEMORY[0x1E0CAA078], "setPredicatePropertyLoadMode:", 2);
  v3 = +[ATXPrivacyReset sharedInstance](ATXPrivacyReset, "sharedInstance");
  objc_msgSend(MEMORY[0x1E0CF94D8], "createDirectoriesIfNeeded");
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_250);
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_ATXDECBackupNeedsRestoring(v5))
    {
      __atxlog_handle_backup();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Taking old backup path", buf, 2u);
      }

      objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Backups/AppPredictionExpert"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = _ATXExtractFilesFromDECBackupArchiveIfExists(v7, v5);
      v4 = v8;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeItemAtPath:error:", v7, 0);

        __atxlog_handle_backup();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Restored old backup", buf, 2u);
        }

      }
    }
    else
    {
      +[ATXBackupService backupService](ATXBackupService, "backupService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "restoreFromBackupIfNeccessary:", &__block_literal_global_254);

      v4 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("restore_finished"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "fileExistsAtPath:", v14);

  if (v15)
  {
    __atxlog_handle_backup();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "already restored, not registering for restore state notifications", buf, 2u);
    }
  }
  else
  {
    if (!registerForRestoreStateNotifications_mobileBackup)
    {
      registerForRestoreStateNotifications_mobileBackup = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileBackup.framework/MobileBackup", 1);
      if (!registerForRestoreStateNotifications_mobileBackup)
      {
        __atxlog_handle_backup();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          ___ATXInitializeInOwnerProcess_block_invoke_cold_1(v17);

      }
    }
    restoreStateQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v16, &__block_literal_global_327);
  }

  v18 = (void *)*MEMORY[0x1E0C80748];
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.apppredictionupdate", (void *)*MEMORY[0x1E0C80748], &__block_literal_global_334);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.atxbackupnow", v18, &__block_literal_global_336);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.atxbackup", v18, &__block_literal_global_344);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.atxtrain", v18, &__block_literal_global_348);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.action.timeestimate", v18, &__block_literal_global_349);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.everydayshortcuts", v18, &__block_literal_global_351);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.everydayshortcuts-trigger", v18, &__block_literal_global_354);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.dailyroutines", v18, &__block_literal_global_355);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.dailyroutines-trigger", v18, &__block_literal_global_357);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.updateAssetMetadata", v18, &__block_literal_global_359);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.magicalmoments", v18, &__block_literal_global_362);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.anchormodeldataharvesting", v18, &__block_literal_global_364);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.anchormodeltraining", v18, &__block_literal_global_368);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.biome-ui-feedback-result-stream-writing", v18, &__block_literal_global_371);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.mode-entity-model-training", v18, &__block_literal_global_374);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.mode-setup-prediction-training", v18, &__block_literal_global_377);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.urgency-tuning-global-metrics-logging", v18, &__block_literal_global_380);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.periodiclog", v18, &__block_literal_global_383);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.infoStorePeriodicCleanup", v18, &__block_literal_global_388);
  atxRegisterCTSJobHandlerForNonClassCLocked((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.appdirectory"), "UTF8String"), v18, &__block_literal_global_392);
  atxRegisterCTSJobHandler((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.appdirectorylogging"), "UTF8String"), v18, &__block_literal_global_395);
  v19 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForFirstWakeupStatus");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:", v20, &unk_1E83CC838, 14400.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C70], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.information.userWakeUp"), v21, CFSTR("com.apple.duetexpertd.cdidentifier"), &__block_literal_global_398);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerCallback:", v22);

  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.timelinerelevance", v18, &__block_literal_global_407);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.tl_prediction", v18, &__block_literal_global_409);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.cardSuggestionClientCacheCleanup", v18, &__block_literal_global_414);
  v24 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v25 = (void *)objc_msgSend(v24, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v26 = objc_msgSend(v25, "integerForKey:", *MEMORY[0x1E0CF9438]);
  if (v26 < 1)
  {
    atxRegisterCTSJobHandlerForNonClassCLocked((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.defaultwidgetsuggester"), "UTF8String"), v18, &__block_literal_global_417);
  }
  else
  {
    v27 = v26;
    __atxlog_handle_home_screen();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v61 = v27;
      _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "No longer running ATXDefaultWidgetSuggester CTS job due to feedback: %ld", buf, 0xCu);
    }

  }
  atxRegisterCTSJobHandler("com.apple.duetexpertd.widgetonboarding", v18, &__block_literal_global_419);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.biomepruning", v18, &__block_literal_global_425);
  atxRegisterCTSJobHandler((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.focusMetricsLogging"), "UTF8String"), v18, &__block_literal_global_429);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.homescreenlogging", v18, &__block_literal_global_433);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.nPlusOneStudyLogging", v18, &__block_literal_global_436);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.blendingbiomestreamlogging", v18, &__block_literal_global_439);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.blendingfeedbackmetricslogging", v18, &__block_literal_global_442);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.refreshfacesuggestions", v18, &__block_literal_global_446);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.collectlockscreenmetrics", v18, &__block_literal_global_451);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.collectzkwmetrics", v18, &__block_literal_global_454);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.verticalmodelstraining", v18, &__block_literal_global_457);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.modelscoreharvesting", v18, &__block_literal_global_460);
  atxRegisterCTSJobHandlerForNonClassCLocked((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.updateInferredModeBiomeStream"), "UTF8String"), v18, &__block_literal_global_464);
  atxRegisterCTSJobHandlerForNonClassCLocked((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.updateSuggestedPages"), "UTF8String"), v18, &__block_literal_global_468);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.blending-shadow-logging", v18, &__block_literal_global_470);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.logModeActivityMetrics", v18, &__block_literal_global_473);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.logNotificationDigestMetrics", v18, &__block_literal_global_475);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.logDigestGlobalNotificationFeedback", v18, &__block_literal_global_478);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.pruneNotificationSuggestionDatastore", v18, &__block_literal_global_481);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.pruneNotificationsBasedOnHardLimits", v18, &__block_literal_global_485);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.pruneSuggestionsBasedOnHardLimits", v18, &__block_literal_global_487);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.analyzeNotificationsAndSuggestionsDatabase", v18, &__block_literal_global_489);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.notificationAndSuggestionDatastorePerfMetricsLogging", v18, &__block_literal_global_491);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.datastoremaintenance", v18, &__block_literal_global_493);
  atxRegisterCTSJobHandler("com.apple.duetexpertd.activitySuggestionFeedbackProcessing", v18, &__block_literal_global_496);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.homeScreenModificationMetricsLogger", v18, &__block_literal_global_499);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.ambientmetrics", v18, &__block_literal_global_502);
  atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.timelinedonationspruning", v18, &__block_literal_global_506);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)languagePrefChanged, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v30 = (void *)MEMORY[0x1E0D81590];
  v31 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = ___ATXInitializeInOwnerProcess_block_invoke_259;
  v58[3] = &unk_1E82DAC38;
  v32 = v2;
  v59 = v32;
  objc_msgSend(v30, "runBlockWhenDeviceIsClassCUnlocked:", v58);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v33, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CF9368], 0, 0, &__block_literal_global_275);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v35, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D14528], 0, 0, &__block_literal_global_278);

  dispatch_async(v32, &__block_literal_global_280);
  PMMInitializeInOwnerProcess();
  v37 = +[ATXServer sharedInstance](ATXServer, "sharedInstance");
  v38 = +[ATXActionPredictionServer sharedInstance](ATXActionPredictionServer, "sharedInstance");
  if (_PASIsInternalDevice())
    v39 = +[ATXModeAutomationSuggestionTester sharedInstance](ATXModeAutomationSuggestionTester, "sharedInstance");
  objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_285);
  objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", 25, &__block_literal_global_307);
  v40 = +[ATXWifiStateMonitor sharedInstance](ATXWifiStateMonitor, "sharedInstance");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  restoreStateFinishedPath();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "fileExistsAtPath:", v42))
  {
    v43 = +[ATXBackupService isBackupRestore](ATXBackupService, "isBackupRestore");

    if (!v43)
    {
      __atxlog_handle_backup();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v44, OS_LOG_TYPE_DEFAULT, "Scheduling app directory update after restore", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_316);
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringByAppendingPathComponent:", CFSTR("restored"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = objc_msgSend(v47, "fileExistsAtPath:", v46),
        v47,
        v48))
  {
    __atxlog_handle_backup();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v49, OS_LOG_TYPE_DEFAULT, "Restore marker seen, updating predictions immediately", buf, 2u);
    }

    __atxlog_handle_backup();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = +[ATXBackupService isBackupRestore](ATXBackupService, "isBackupRestore");
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = v51;
      _os_log_impl(&dword_1C9A3B000, v50, OS_LOG_TYPE_DEFAULT, "Scheduling app directory update after restore (based on ATXBackupService marker); isBackupRestore=%{BOOL}d",
        buf,
        8u);
    }

    v52 = (void *)MEMORY[0x1E0D81590];
    v53 = v31;
    v54 = 3221225472;
    v55 = ___ATXInitializeInOwnerProcess_block_invoke_317;
    v56 = &unk_1E82DAC38;
    v57 = v46;
    objc_msgSend(v52, "runBlockWhenDeviceIsClassCUnlocked:", &v53);

  }
  objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_320, v53, v54, v55, v56);

}

uint64_t ___ATXInitializeInOwnerProcess_block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  __atxlog_handle_backup();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Unlock seen. Checking for restore.", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void ___ATXInitializeInOwnerProcess_block_invoke_252(uint64_t a1, int a2)
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  __atxlog_handle_backup();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Restored new style backup. Restarting process...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("restored"));
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("restore_finished"));
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createFileAtPath:contents:attributes:", v6, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createFileAtPath:contents:attributes:", v8, 0, 0);

    exit(0);
  }
  if (v4)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Didn't restore new style backup", v11, 2u);
  }

}

void ___ATXInitializeInOwnerProcess_block_invoke_259(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  id v9;

  ATXEnableMobileAssetDataVault();
  v2 = +[ATXHeuristicActionProducer sharedInstance](ATXHeuristicActionProducer, "sharedInstance");
  v3 = +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
  v4 = +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v5 = +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v6 = +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v7 = dispatch_time(0, 100000000);
  dispatch_after(v7, *(dispatch_queue_t *)(a1 + 32), &__block_literal_global_266);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CF9340], 0, 0, &__block_literal_global_272);

}

void ___ATXInitializeInOwnerProcess_block_invoke_2_265()
{
  id v0;
  id v1;
  id v2;

  v0 = +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
  v1 = (id)objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  objc_msgSend(MEMORY[0x1E0CF9208], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshWithCompletion:", 0);

}

void ___ATXInitializeInOwnerProcess_block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchHomeScreenWidgetDescriptorMetadataWithError:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    ATXSharedDefaultHomeScreenItemUpdater();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeScreenDescriptors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "updateDefaultsWithSystemDescriptors:installDatesCache:reason:", v2, v0, CFSTR("Descriptor change"));

  }
}

uint64_t ___ATXInitializeInOwnerProcess_block_invoke_4()
{
  return objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_276);
}

void ___ATXInitializeInOwnerProcess_block_invoke_5()
{
  id v0;

  ATXSharedDefaultHomeScreenItemUpdater();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateDefaultsDueToRelevantHomeScreenConfigUpdate");

}

uint64_t ___ATXInitializeInOwnerProcess_block_invoke_6()
{
  return objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_279);
}

void ___ATXInitializeInOwnerProcess_block_invoke_7()
{
  id v0;

  ATXSharedDefaultHomeScreenItemUpdater();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateDefaultsDueToAmbientConfigUpdate");

}

id ___ATXInitializeInOwnerProcess_block_invoke_8()
{
  return +[_ATXInspectionServer sharedInstance](_ATXInspectionServer, "sharedInstance");
}

id ___ATXInitializeInOwnerProcess_block_invoke_9()
{
  NSObject *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ___ATXInitializeInOwnerProcess_block_invoke_9_cold_1();

  v1 = +[ATXMagicalMomentsAppPredictor sharedInstance](ATXMagicalMomentsAppPredictor, "sharedInstance");
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

  +[ATXActionPredictionServer sharedInstance](ATXActionPredictionServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingLayerServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForRealTimeRequestsWithBlendingLayerServer:", v5);

  v6 = +[ATXModeAnchorModelSuggestionClient sharedInstance](ATXModeAnchorModelSuggestionClient, "sharedInstance");
  v7 = +[ATXNotificationsLoggingServer sharedInstance](ATXNotificationsLoggingServer, "sharedInstance");
  v8 = +[ATXActionNotificationServer sharedInstance](ATXActionNotificationServer, "sharedInstance");
  v9 = +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v10 = +[ATXContextHeuristicsServer sharedInstance](ATXContextHeuristicsServer, "sharedInstance");
  v11 = +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v12 = +[ATXSmartActivationEarlyExitDetectionLogger sharedInstance](ATXSmartActivationEarlyExitDetectionLogger, "sharedInstance");
  v13 = +[ATXNotificationDigestRankerServer sharedInstance](ATXNotificationDigestRankerServer, "sharedInstance");
  v14 = +[ATXUserEducationSuggestionServer sharedInstance](ATXUserEducationSuggestionServer, "sharedInstance");
  v15 = +[ATXContextualEngine sharedInstance](ATXContextualEngine, "sharedInstance");
  +[ATXAnchorModelInferenceEngine sharedInstance](ATXAnchorModelInferenceEngine, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "start");

  v17 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v18 = *MEMORY[0x1E0CF9510];
  v19 = (void *)objc_msgSend(v17, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  if (objc_msgSend(v19, "BOOLForKey:", CFSTR("ATXInitializationLanguageChangeDirty")))
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v54) = 0;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "Language change detected upon process start - updating predictions once and immediately", (uint8_t *)&v54, 2u);
    }

    v54 = MEMORY[0x1E0C809B0];
    v55 = 3221225472;
    v56 = __updatePredictionsIfLanguageChanged_block_invoke;
    v57 = &unk_1E82DAC38;
    v58 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], &v54);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v18);
  v22 = *MEMORY[0x1E0CF9588];
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CF9588]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v24, v22);
    if (objc_msgSend(v21, "BOOLForKey:", *MEMORY[0x1E0CF9530]))
    {
      objc_msgSend(v21, "setObject:forKey:", v24, *MEMORY[0x1E0CF9528]);
      v25 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
      v26 = objc_msgSend(v25, "hasWidgetsOnTheHomeScreen");

      v27 = *MEMORY[0x1E0CF9520];
      if (v26)
        v28 = CFSTR("active");
      else
        v28 = CFSTR("abandoned");
    }
    else
    {
      v27 = *MEMORY[0x1E0CF9520];
      v28 = CFSTR("neverUsed");
    }
    objc_msgSend(v21, "setObject:forKey:", v28, v27);

  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v18);
  v30 = *MEMORY[0x1E0CF9558];
  v31 = objc_msgSend(v29, "integerForKey:", *MEMORY[0x1E0CF9558]);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "operatingSystemVersion");
    v34 = v55;
  }
  else
  {
    v34 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "operatingSystemVersion");
    v37 = v59;
  }
  else
  {
    v37 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
  }

  v38 = (_QWORD *)MEMORY[0x1E0CF9568];
  v39 = (_QWORD *)MEMORY[0x1E0CF9560];
  if (v37 <= v31)
  {
    v40 = objc_msgSend(v29, "integerForKey:", *MEMORY[0x1E0CF9568]);
  }
  else
  {
    objc_msgSend(v29, "removeObjectForKey:", *MEMORY[0x1E0CF9560]);
    v40 = -1;
  }
  if (v34 > v40)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v29, "setDouble:forKey:", *v39);
    objc_msgSend(v29, "setInteger:forKey:", v34, *v38);
  }

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v18);
  v42 = objc_msgSend(v41, "integerForKey:", v30);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    objc_msgSend(v43, "operatingSystemVersion");
    v45 = v54;
  }
  else
  {
    v45 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
  }

  if (v45 > v42)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v41, "setDouble:forKey:", *MEMORY[0x1E0CF9550]);
    objc_msgSend(v41, "setInteger:forKey:", v45, v30);
  }

  objc_msgSend(MEMORY[0x1E0D14398], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "blendingLayerServer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "startWithBlendingLayerServer:", v48);

  v49 = +[ATXSleepSuggestionServer sharedInstance](ATXSleepSuggestionServer, "sharedInstance");
  v50 = +[ATXSportsServer sharedInstance](ATXSportsServer, "sharedInstance");
  if (objc_msgSend(MEMORY[0x1E0CF94B0], "isDigitalBalanceEnabled"))
    v51 = +[ATXUsageInsightsServer sharedInstance](ATXUsageInsightsServer, "sharedInstance");
  if (objc_msgSend(MEMORY[0x1E0CF94B0], "isNotificationCategorizationEnabled", v54, v55, v56))
    v52 = +[ATXNotificationCategorizationServer sharedInstance](ATXNotificationCategorizationServer, "sharedInstance");
  return +[ATXSettingsActionsServer sharedInstance](ATXSettingsActionsServer, "sharedInstance");
}

id ___ATXInitializeInOwnerProcess_block_invoke_306()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v0 = +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v1 = +[ATXAppDirectoryServer sharedInstance](ATXAppDirectoryServer, "sharedInstance");
  v2 = +[ATXDefaultWidgetSuggesterServer sharedInstance](ATXDefaultWidgetSuggesterServer, "sharedInstance");
  v3 = +[ATXSuggestedPagesServer sharedInstance](ATXSuggestedPagesServer, "sharedInstance");
  v4 = +[ATXFaceSuggestionServer sharedInstance](ATXFaceSuggestionServer, "sharedInstance");
  return +[_ATXAppProtectionMonitor sharedInstance](_ATXAppProtectionMonitor, "sharedInstance");
}

void ___ATXInitializeInOwnerProcess_block_invoke_315()
{
  void *v0;
  id v1;

  performPostRestoreTasks();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  restoreStateFinishedPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeItemAtPath:error:", v0, 0);

}

void ___ATXInitializeInOwnerProcess_block_invoke_317(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  performPostRestoreTasks();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ATXInitializeInOwnerProcess_block_invoke_2_318;
  block[3] = &unk_1E82DAC38;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void ___ATXInitializeInOwnerProcess_block_invoke_2_318(uint64_t a1)
{
  id v2;

  ATXUpdatePredictionsImmediatelyWithReason(11);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);

}

void ___ATXInitializeInOwnerProcess_block_invoke_3_319()
{
  NSObject *v0;
  void *v1;
  BOOL v2;
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ___ATXInitializeInOwnerProcess_block_invoke_3_319_cold_1();

  +[ATXServer consumerSubTypesToUpdate](ATXServer, "consumerSubTypesToUpdate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[ATXFileUtil cachesAreValidForConsumerSubTypes:](ATXFileUtil, "cachesAreValidForConsumerSubTypes:", v1);

  if (!v2)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "At least one cache is invalid or stale. Triggering an update", v4, 2u);
    }

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_323);
  }
}

void ___ATXInitializeInOwnerProcess_block_invoke_322()
{
  ATXUpdatePredictionsImmediatelyIfPossible(12);
}

void ___ATXInitializeInOwnerProcess_block_invoke_cold_1(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dlerror();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a1, v2, "Could not load MobileBackup: %s", v3);
  OUTLINED_FUNCTION_1();
}

void ___ATXInitializeInOwnerProcess_block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXMM: Creating the MagicalMomentsAppPredictor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ___ATXInitializeInOwnerProcess_block_invoke_3_319_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Running startup check of caches to see if their format is valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
