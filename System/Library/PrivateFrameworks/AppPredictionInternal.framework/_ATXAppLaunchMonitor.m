@implementation _ATXAppLaunchMonitor

- (BOOL)isValidAppLaunchBundleId:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.springboard.")) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)handleAppOrClipLaunchNotificationForBundleId:(id)a3 poweringAppClipBundleId:(id)a4 urlHash:(id)a5 isClip:(BOOL)a6 appLaunchReason:(id)a7 appClipLaunchReason:(int)a8 date:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *logQueue;
  void *v24;
  _PASQueueLock *history;
  NSObject *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a9;
  sel_getName(a2);
  v21 = (void *)os_transaction_create();
  -[_ATXAppLaunchMonitor processDonationsForPreviousAppSessionEndIfNeeded](self, "processDonationsForPreviousAppSessionEndIfNeeded");
  if (objc_msgSend(v16, "length"))
  {
    -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 0, CFSTR("ATXAppLaunchMonitor_LastLaunchWasHomescreen"));
    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v16;
      v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_INFO, "App launch: %@ for reason %@", buf, 0x16u);
    }

    logQueue = self->_logQueue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke_101;
    v27[3] = &unk_1E82E1FE0;
    v27[4] = self;
    v28 = v16;
    v29 = v19;
    v30 = v17;
    v31 = v18;
    v35 = a6;
    v34 = a8;
    v32 = v20;
    v33 = v21;
    dispatch_async(logQueue, v27);

    v24 = v28;
  }
  else
  {
    history = self->_history;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __149___ATXAppLaunchMonitor_handleAppOrClipLaunchNotificationForBundleId_poweringAppClipBundleId_urlHash_isClip_appLaunchReason_appClipLaunchReason_date___block_invoke;
    v36[3] = &unk_1E82E1F90;
    v37 = v20;
    v38 = v21;
    -[_PASQueueLock runAsyncWithLockAcquired:](history, "runAsyncWithLockAcquired:", v36);
    -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("ATXAppLaunchMonitor_LastLaunchWasHomescreen"));
    __atxlog_handle_default();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchMonitor handleAppOrClipLaunchNotificationForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:date:].cold.1();

    v24 = v37;
  }

}

- (void)processDonationsForPreviousAppSessionEndIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  _PASQueueLock *history;
  _QWORD v7[4];
  NSObject *v8;
  uint8_t *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (-[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("ATXAppLaunchMonitor_LastLaunchWasHomescreen")))
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Last app launch was the homescreen. Not going to process donations for previous app session end.", buf, 2u);
    }
  }
  else
  {
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIntentMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__43;
    v17 = __Block_byref_object_dispose__43;
    v18 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__43;
    v11[4] = __Block_byref_object_dispose__43;
    v12 = 0;
    history = self->_history;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72___ATXAppLaunchMonitor_processDonationsForPreviousAppSessionEndIfNeeded__block_invoke;
    v7[3] = &unk_1E82E1F68;
    v9 = buf;
    v10 = v11;
    v3 = v5;
    v8 = v3;
    -[_PASQueueLock runAsyncWithLockAcquired:](history, "runAsyncWithLockAcquired:", v7);

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(buf, 8);

  }
}

+ (id)predictionUpdateBlacklistedBundleIds
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1CAA48B6C](a1, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.ClipViewService"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (_ATXAppLaunchMonitor)initWithInMemoryStore
{
  _ATXAppInfoManager *v3;
  ATXPredictionContextBuilder *v4;
  void *v5;
  void *v6;
  ATXAmbientLightMonitor *v7;
  ATXPredictionContextBuilder *v8;
  _ATXAppLaunchHistogramManager *v9;
  _ATXAppLaunchSequenceManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _ATXAppLaunchMonitor *v16;

  v3 = -[_ATXAppInfoManager initWithInMemoryStore]([_ATXAppInfoManager alloc], "initWithInMemoryStore");
  v4 = [ATXPredictionContextBuilder alloc];
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXAmbientLightMonitor initWithoutMonitoring]([ATXAmbientLightMonitor alloc], "initWithoutMonitoring");
  v8 = -[ATXPredictionContextBuilder initWithAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:](v4, "initWithAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:", v3, v5, v6, v7, objc_opt_class(), 1);

  v9 = -[_ATXAppLaunchHistogramManager initWithInMemoryStore]([_ATXAppLaunchHistogramManager alloc], "initWithInMemoryStore");
  v10 = -[_ATXAppLaunchSequenceManager initWithInMemoryStore]([_ATXAppLaunchSequenceManager alloc], "initWithInMemoryStore");
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "predictionUpdateBlacklistedBundleIds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  v16 = -[_ATXAppLaunchMonitor initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:](self, "initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:", v3, v9, v10, v11, v12, v8, v13, v14, v15);

  return v16;
}

- (_ATXAppLaunchMonitor)initWithAppInfoManager:(id)a3 appLaunchHistogramManager:(id)a4 appLaunchSequenceManager:(id)a5 appDailyDose:(id)a6 duetHelper:(id)a7 contextBuilder:(id)a8 tracker:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _ATXAppLaunchMonitor *v25;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend((id)objc_opt_class(), "predictionUpdateBlacklistedBundleIds");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  v25 = -[_ATXAppLaunchMonitor initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:](self, "initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:", v22, v21, v20, v19, v18, v17, v16, v23, v24);

  return v25;
}

- (_ATXAppLaunchMonitor)initWithAppInfoManager:(id)a3 appLaunchHistogramManager:(id)a4 appLaunchSequenceManager:(id)a5 appDailyDose:(id)a6 duetHelper:(id)a7 contextBuilder:(id)a8 tracker:(id)a9 predictionUpdateBlacklist:(id)a10 heroPoiManager:(id)a11
{
  id v17;
  _ATXAppLaunchMonitor *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *appLaunchHistoryQueue;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *logQueue;
  uint64_t v26;
  ATXAppClipUsageDuetContextUpdateListener *appClipChangeListener;
  id *v28;
  uint64_t v29;
  _PASQueueLock *history;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _PASLock *cdContext;
  id v36;
  uint64_t v37;
  NSUserDefaults *userDefaults;
  NSObject *v39;
  id v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v17 = a3;
  v50 = a4;
  v49 = a5;
  v48 = a6;
  v47 = a7;
  v46 = a8;
  v45 = a9;
  v44 = a10;
  v43 = a11;
  v51.receiver = self;
  v51.super_class = (Class)_ATXAppLaunchMonitor;
  v18 = -[_ATXAppLaunchMonitor init](&v51, sel_init);
  if (v18)
  {
    v41 = v17;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppLaunchHistory", v19);
    appLaunchHistoryQueue = v18->_appLaunchHistoryQueue;
    v18->_appLaunchHistoryQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.duetexpertcenter.AppPredictionExpert.AppLaunchHistory.logging", v23);
    logQueue = v18->_logQueue;
    v18->_logQueue = (OS_dispatch_queue *)v24;

    v26 = objc_opt_new();
    appClipChangeListener = v18->_appClipChangeListener;
    v18->_appClipChangeListener = (ATXAppClipUsageDuetContextUpdateListener *)v26;

    v28 = (id *)objc_opt_new();
    objc_storeStrong(v28 + 2, a7);
    objc_storeStrong(v28 + 3, a6);
    objc_storeStrong(v28 + 4, a3);
    objc_storeStrong(v28 + 5, a4);
    objc_storeStrong(v28 + 6, a5);
    objc_storeStrong(v28 + 7, a8);
    objc_storeStrong(v28 + 8, a11);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81600]), "initWithGuardedData:serialQueue:", v28, v18->_appLaunchHistoryQueue);

    history = v18->_history;
    v18->_history = (_PASQueueLock *)v29;

    v31 = (_QWORD *)objc_opt_new();
    v32 = objc_opt_new();
    v33 = (void *)v31[2];
    v31[2] = v32;

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v31);
    cdContext = v18->_cdContext;
    v18->_cdContext = (_PASLock *)v34;

    objc_storeStrong((id *)&v18->_tracker, a9);
    v36 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v37 = objc_msgSend(v36, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    userDefaults = v18->_userDefaults;
    v18->_userDefaults = (NSUserDefaults *)v37;

    objc_storeStrong((id *)&v18->_predictionUpdateBlacklist, a10);
    __atxlog_handle_default();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchMonitor initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:].cold.1();

    v17 = v41;
  }

  return v18;
}

- (id)appIconState
{
  _ATXAppIconState *appIconState;
  _ATXAppIconState *v4;
  _ATXAppIconState *v5;

  appIconState = self->_appIconState;
  if (!appIconState)
  {
    +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
    v4 = (_ATXAppIconState *)objc_claimAutoreleasedReturnValue();
    v5 = self->_appIconState;
    self->_appIconState = v4;

    appIconState = self->_appIconState;
  }
  return appIconState;
}

- (void)_updateAppIconStateForTests:(id)a3
{
  objc_storeStrong((id *)&self->_appIconState, a3);
}

- (void)start
{
  objc_class *v3;
  void *v4;
  id v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-start"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create(v6, v8);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___ATXAppLaunchMonitor_start__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(v9, block);
  -[_PASLock runWithLockAcquired:](self->_cdContext, "runWithLockAcquired:", &__block_literal_global_93);
  -[_ATXAppLaunchMonitor registerForAppChange](self, "registerForAppChange");
  -[_ATXAppLaunchMonitor registerForAppClipLaunch](self, "registerForAppClipLaunch");
  -[_ATXAppLaunchMonitor registerForBacklightChange](self, "registerForBacklightChange");

}

+ (void)mergeAppLaunches:(id)a3 andBacklightTransitions:(id)a4 callingAppLaunchBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *, void *, void *, uint64_t);
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, void *, void *, void *, uint64_t))a5;
  if (objc_msgSend(v27, "count"))
  {
    v9 = 0;
    v10 = 0;
    do
    {
      if (v10 >= objc_msgSend(v7, "count"))
        break;
      objc_msgSend(v27, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "earlierDate:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToDate:", v15);

      if (v16)
      {
        objc_msgSend(v11, "bundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "reason");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v17, v18, v19, v20, 1);

        ++v9;
      }
      else
      {
        v8[2](v8, 0, v12, 0, 0, 0);
        ++v10;
      }

    }
    while (v9 < objc_msgSend(v27, "count"));
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  while (v9 < objc_msgSend(v27, "count"))
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reason");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v22, v23, v24, v25, 1);

    ++v9;
  }
  while (v10 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v26, 0, 0, 0);

    ++v10;
  }

}

- (void)updateLaunchHistoryFromDuet:(double)a3 callback:(id)a4
{
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  double v21;

  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("-update"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create(v11, v13);

  sel_getName(a2);
  v15 = (void *)os_transaction_create();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61___ATXAppLaunchMonitor_updateLaunchHistoryFromDuet_callback___block_invoke;
  v18[3] = &unk_1E82E1E78;
  v21 = a3;
  v19 = v15;
  v20 = v7;
  v18[4] = self;
  v16 = v15;
  v17 = v7;
  dispatch_async(v14, v18);

}

- (void)registerForAppChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _PASLock *cdContext;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAppDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C90], "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke;
  aBlock[3] = &unk_1E82E1EF0;
  objc_copyWeak(&v15, &location);
  v6 = v3;
  v14 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D15C70], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.appchangeprediction"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  cdContext = self->_cdContext;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __44___ATXAppLaunchMonitor_registerForAppChange__block_invoke_2;
  v11[3] = &unk_1E82E1F18;
  v10 = v8;
  v12 = v10;
  -[_PASLock runWithLockAcquired:](cdContext, "runWithLockAcquired:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)registerForAppClipLaunch
{
  ATXAppClipUsageDuetContextUpdateListener *appClipChangeListener;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  appClipChangeListener = self->_appClipChangeListener;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48___ATXAppLaunchMonitor_registerForAppClipLaunch__block_invoke;
  v4[3] = &unk_1E82DC4B0;
  objc_copyWeak(&v5, &location);
  -[ATXAppClipUsageDuetContextUpdateListener startListeningWithCallback:clientId:](appClipChangeListener, "startListeningWithCallback:clientId:", v4, CFSTR("_ATXAppLaunchMonitor"));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (int)petClipCaptureTypeFromDuetClipLaunchReason:(int)a3
{
  if ((a3 - 1) >= 9)
    return 0;
  else
    return a3;
}

- (void)registerForBacklightChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _PASLock *cdContext;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBacklightOnStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C90], "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke;
  aBlock[3] = &unk_1E82E1EF0;
  objc_copyWeak(&v15, &location);
  v6 = v3;
  v14 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D15C70], "localNonWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.duetexpertd.screensleepchangeprediction"), v4, CFSTR("com.apple.duetexpertd.cdidentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  cdContext = self->_cdContext;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __50___ATXAppLaunchMonitor_registerForBacklightChange__block_invoke_3;
  v11[3] = &unk_1E82E1F18;
  v10 = v8;
  v12 = v10;
  -[_PASLock runWithLockAcquired:](cdContext, "runWithLockAcquired:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (void)_logPredictionForBundleId:(id)a3 poweringAppClipBundleId:(id)a4 urlHash:(id)a5 isClip:(BOOL)a6 appLaunchReason:(id)a7 appClipLaunchReason:(int)a8 consumerType:(unint64_t)a9 consumerSubType:(unsigned __int8)a10 context:(id)a11
{
  uint64_t v11;
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *context;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;

  v11 = *(_QWORD *)&a8;
  v13 = a6;
  v53 = a3;
  v16 = a4;
  v52 = a5;
  v17 = a7;
  v18 = a11;
  v19 = (void *)os_transaction_create();
  v51 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0CF8D28], "clientForConsumerType:", a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appPredictionsForConsumerSubType:limit:", a10, 20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      +[_ATXAppLaunchMonitor _logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:].cold.2(v21, v23);
LABEL_4:

    objc_autoreleasePoolPop(v51);
    goto LABEL_25;
  }
  if (!objc_msgSend(v17, "length"))
  {
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[_ATXAppLaunchMonitor _logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:].cold.1();
    goto LABEL_4;
  }
  v49 = v18;
  objc_msgSend(v21, "predictedApps");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "indexOfObject:", v53);

  +[_ATXAggregateLogger sharedInstance](_ATXAggregateLogger, "sharedInstance");
  v50 = v16;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logLaunchEventWithLaunchReason:predicted:position:", v17, v25 != 0x7FFFFFFFFFFFFFFFLL, v25);

  v16 = v50;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shadowLogSamplingRate");
  v29 = v28;

  v30 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
  v31 = v29 * 10.0;
  if (v29 * 10.0 > 1.0)
    v31 = 1.0;
  if (v30)
    v29 = v31;
  if (v50 && v13 && (v11 - 4) <= 0xFFFFFFFD)
  {
    v32 = -[ATXAppOrClipLaunch initAppClipLaunchWithBundleId:urlHash:launchReason:]([ATXAppOrClipLaunch alloc], "initAppClipLaunchWithBundleId:urlHash:launchReason:", v50, v52, v11);
    +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:isNegativeSession:](ATXLaunchAndLocationHarvester, "logAppOrClipLaunch:isNegativeSession:", v32, 0);

  }
  if (+[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", v29))
  {
    context = (void *)MEMORY[0x1CAA48B6C]();
    v33 = (void *)objc_opt_new();
    objc_msgSend(v21, "predictedApps");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    v36 = 4;
    if (v35 < 4)
      v36 = v35;
    if (v36)
    {
      v37 = 0;
      do
      {
        objc_msgSend(v21, "predictedApps");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v39);

        ++v37;
        objc_msgSend(v21, "predictedApps");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (v41 >= 4)
          v42 = 4;
        else
          v42 = v41;
      }
      while (v37 < v42);
    }
    +[ATXAppPredictionFeedbackItem feedbackItemsForResponse:](ATXAppPredictionFeedbackItem, "feedbackItemsForResponse:", v21);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXAggregateLogger propertyStringForLaunchReason:](_ATXAggregateLogger, "propertyStringForLaunchReason:", v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAppPredictorFeedback constructSessionLogDictionaryWithFeedbackItems:engagedBundleId:shownBundleIdIndexes:consumerType:consumerSubType:outcome:annotation:context:](ATXAppPredictorFeedback, "constructSessionLogDictionaryWithFeedbackItems:engagedBundleId:shownBundleIdIndexes:consumerType:consumerSubType:outcome:annotation:context:", v43, v53, v44, a9, a10, 5, v45, v49);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATXAWDUtils logAppPredictionDictionaryViaAWD:](ATXAWDUtils, "logAppPredictionDictionaryViaAWD:", v46);
    objc_autoreleasePoolPop(context);
    v16 = v50;
  }

  objc_autoreleasePoolPop(v51);
  v47 = (id)objc_opt_self();
  v18 = v49;
LABEL_25:

}

- (void)logAppLaunchForBundleId:(id)a3 launchReason:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB210]))
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB258]))
    {
      v10 = v13;
      v11 = 14;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB248]))
    {
      v10 = v13;
      v11 = 11;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB220]))
    {
      v10 = v13;
      v11 = 18;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB240]))
    {
      v10 = v13;
      v11 = 19;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB1C0]))
    {
      v10 = v13;
      v11 = 20;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAB1D0]))
        goto LABEL_23;
      v10 = v13;
      v11 = 21;
    }
    +[_ATXAppLaunchMonitor _logAppLaunch:from:](_ATXAppLaunchMonitor, "_logAppLaunch:from:", v10, v11);
    goto LABEL_23;
  }
  -[_ATXAppLaunchMonitor appIconState](self, "appIconState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "appOnDockWithBundleId:", v13) & 1) != 0)
  {
    v8 = v13;
    v9 = 16;
LABEL_10:
    +[_ATXAppLaunchMonitor _logAppLaunch:from:](_ATXAppLaunchMonitor, "_logAppLaunch:from:", v8, v9);
    goto LABEL_11;
  }
  v12 = objc_msgSend(v7, "springboardPageNumberForBundleId:", v13);
  if ((v12 & 0x8000000000000000) == 0)
  {
    v8 = v13;
    if (v12 >= 10)
      v9 = 10;
    else
      v9 = v12;
    goto LABEL_10;
  }
LABEL_11:
  -[_ATXAppLaunchMonitor _logAppPanelCaptureRateForBundleId:](self, "_logAppPanelCaptureRateForBundleId:", v13);

LABEL_23:
  -[_ATXAppLaunchMonitor _logAppLaunchOverallCaptureRateForBundleId:launchReason:](self, "_logAppLaunchOverallCaptureRateForBundleId:launchReason:", v13, v6);
  -[_ATXAppLaunchMonitor _logAppPanelLaunchRatioForBundleId:launchReason:](self, "_logAppPanelLaunchRatioForBundleId:launchReason:", v13, v6);

}

- (void)_logAppPanelLaunchRatioForBundleId:(id)a3 launchReason:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0DAB210]))
  {
    -[_ATXAppLaunchMonitor appIconState](self, "appIconState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "springboardPageNumbersWithAppPredictionPanels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v9 = *MEMORY[0x1E0CF9338];
    objc_msgSend(v8, "removeIndex:", *MEMORY[0x1E0CF9338]);
    if (objc_msgSend(v8, "count"))
    {
      if (objc_msgSend(v6, "appOnDockWithBundleId:", v12))
      {
        objc_msgSend(MEMORY[0x1E0CF8CC8], "logNonAppPanelAppLaunchFromDock");
      }
      else
      {
        v10 = objc_msgSend(v6, "springboardPageNumberForBundleId:", v12);
        v11 = objc_msgSend(v8, "containsIndex:", v10);
        if ((v10 & 0x8000000000000000) == 0 && v10 < v9 && v11)
          objc_msgSend(MEMORY[0x1E0CF8CC8], "logNonAppPanelAppLaunchWithSBPageIndex:", v10);
      }
    }

  }
}

- (void)_logAppPanelCaptureRateForBundleId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  id v15;

  v15 = a3;
  -[_ATXAppLaunchMonitor appIconState](self, "appIconState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "springboardPageNumbersWithAppPredictionPanels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *MEMORY[0x1E0CF9338];
  objc_msgSend(v6, "removeIndex:", *MEMORY[0x1E0CF9338]);
  if (objc_msgSend(v6, "count"))
  {
    if ((objc_msgSend(v4, "appOnDockWithBundleId:", v15) & 1) != 0)
    {
      v8 = 5004;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CF8D18], "logHomeScreenDiversionWithCaptureType:tracker:", v8, self->_tracker);
      goto LABEL_16;
    }
    v9 = objc_msgSend(v4, "springboardPageNumberForBundleId:", v15);
    if ((v9 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 < v7)
      {
        v11 = objc_msgSend(v4, "appInFolderWithBundleId:", v15);
        v12 = objc_msgSend(v6, "containsIndex:", v10);
        if (v11)
          v13 = 5006;
        else
          v13 = 5005;
        if (v11)
          v14 = 5008;
        else
          v14 = 5007;
        if (v12)
          v8 = v13;
        else
          v8 = v14;
        goto LABEL_15;
      }
    }
  }
LABEL_16:

}

- (void)_logAppLaunchOverallCaptureRateForBundleId:(id)a3 launchReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _ATXAppLaunchMonitor *v29;
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  -[_ATXAppLaunchMonitor appIconState](self, "appIconState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "appOnDockWithBundleId:", v6);
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB210]))
  {
    if (v9)
      v10 = 2;
    else
      v10 = 1;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB248]) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB198]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB1A8]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB1A0]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB1B0]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB1B8]) & 1) != 0)
  {
    v10 = 4;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB258]))
      goto LABEL_24;
    v10 = 5;
  }
  v11 = objc_msgSend(v8, "springboardPageNumberForBundleId:", v6);
  v30 = v7;
  v31 = v6;
  v29 = self;
  if ((v9 & 1) != 0)
  {
    v12 = 1;
  }
  else if ((unint64_t)(v11 + 1) > 6)
  {
    v12 = 8;
  }
  else
  {
    v12 = dword_1C9E80308[v11 + 1];
  }
  objc_msgSend(v8, "springboardPageNumbersWithAppPredictionPanels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v8, "springboardPageNumbersWithSuggestionsWidgets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = *MEMORY[0x1E0CF9338];
  v18 = objc_msgSend(v14, "containsIndex:", *MEMORY[0x1E0CF9338]);
  v19 = objc_msgSend(v16, "containsIndex:", v17);
  objc_msgSend(v14, "removeIndex:", v17);
  objc_msgSend(v16, "removeIndex:", v17);
  v20 = objc_msgSend(v14, "count");
  v21 = objc_msgSend(v16, "count");
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setCaptureType:", v10);
  objc_msgSend(v22, "setIconLocation:", v12);
  v23 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledDomains"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v24 = objc_msgSend(v23, "containsObject:", CFSTR("DOMAIN_ZKWS")) ^ 1;

  objc_msgSend(v22, "setSpotlightEnabled:", v24);
  v25 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  v26 = v25;
  if (v25)
    v27 = objc_msgSend(v25, "BOOLValue");
  else
    v27 = 1;

  objc_msgSend(v22, "setAppLibraryEnabled:", v27);
  objc_msgSend(v22, "setAppPredictionPanelTodayEnabled:", v18);
  objc_msgSend(v22, "setAppPredictionPanelEnabled:", v20 != 0);
  objc_msgSend(v22, "setSuggestionsWidgetEnabled:", v21 != 0);
  objc_msgSend(v22, "setSuggestionsWidgetTodayEnabled:", v19);
  -[ATXPETEventTracker2Protocol trackScalarForMessage:](v29->_tracker, "trackScalarForMessage:", v22);
  __atxlog_handle_metrics();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_ATXAppLaunchMonitor _logAppLaunchOverallCaptureRateForBundleId:launchReason:].cold.1((uint64_t)v29, v22, v28);

  v7 = v30;
  v6 = v31;
LABEL_24:

}

+ (void)_logAppLaunch:(id)a3 from:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  +[ATXAppLaunchLogger sharedInstance](ATXAppLaunchLogger, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logAppLaunchFrom:at:", a4, v6);

  if (a4 == 16)
  {
    +[_ATXAggregateLogger sharedInstance](_ATXAggregateLogger, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 16;
LABEL_7:
    ATXAppLaunchFromToString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logAppLaunch:bundleId:", v9, v10);

    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.camera")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Music")))
  {
    +[_ATXAggregateLogger sharedInstance](_ATXAggregateLogger, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 22;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)handleBacklightChangeNotificationWithValue:(int)a3 date:(id)a4
{
  id v7;
  void *v8;
  _PASQueueLock *history;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;

  v7 = a4;
  sel_getName(a2);
  v8 = (void *)os_transaction_create();
  history = self->_history;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72___ATXAppLaunchMonitor_handleBacklightChangeNotificationWithValue_date___block_invoke;
  v12[3] = &unk_1E82E2008;
  v15 = a3;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[_PASQueueLock runAsyncWithLockAcquired:](history, "runAsyncWithLockAcquired:", v12);

}

- (void)clearHistory
{
  -[_PASQueueLock runWithLockAcquired:](self->_history, "runWithLockAcquired:", &__block_literal_global_124);
}

- (void)clearIntentHistogramHistory
{
  -[_PASQueueLock runWithLockAcquired:](self->_history, "runWithLockAcquired:", &__block_literal_global_126);
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASQueueLock *history;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  history = self->_history;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67___ATXAppLaunchMonitor_addLaunchWithBundleId_date_timeZone_reason___block_invoke;
  v19[3] = &unk_1E82E20D0;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[_PASQueueLock runWithLockAcquired:](history, "runWithLockAcquired:", v19);

}

- (void)_addLaunchWithLockWitness:(id)a3 bundleId:(id)a4 date:(id)a5 timeZone:(id)a6 reason:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[5];

  v82[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v18, "userContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastAppLaunch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)*((_QWORD *)v13 + 6);
    objc_msgSend(v18, "userContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastAppLaunch");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "launchSequenceForBundle:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubsequentLaunch:", v14);

    objc_msgSend(*((id *)v13 + 6), "addBundleIdToLaunchSequence:date:", v14, v15);
  }
  objc_msgSend(*((id *)v13 + 4), "addLaunchForBundleId:date:", v14, v15);
  objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  objc_msgSend(v18, "userContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastUnlockDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v18, "userContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastUnlockDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v31);
    v33 = v32;

    if (v33 >= 0.0)
    {
      if (v33 >= 3600.0)
        v33 = 3599.0;
      objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addLaunchWithBundleId:elapsedTime:", v14, v33);

    }
  }
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB248]) & 1) != 0
    || objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB258]))
  {
    objc_msgSend(*((id *)v13 + 4), "addSpotlightLaunchForBundleId:date:", v14, v15);
    objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  }
  if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB210]))
  {
    objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 92);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  }
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB1B8]) & 1) != 0
    || (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB198]) & 1) != 0
    || (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB1A8]) & 1) != 0
    || (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB1A0]) & 1) != 0
    || objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB1B0]))
  {
    objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 93);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  }
  objc_msgSend(v18, "deviceStateContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "inAirplaneMode");

  if (v39)
  {
    objc_msgSend(*((id *)v13 + 5), "histogramForLaunchType:", 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addLaunchWithBundleId:date:timeZone:", v14, v15, v16);

  }
  objc_msgSend(v18, "deviceStateContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "wifiSSID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v42, "length"))
  {
    objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addLaunchWithBundleId:date:category:", v14, v15, v42);

  }
  v80 = v42;
  v44 = (void *)*((_QWORD *)v13 + 1);
  if (v44)
  {
    v82[0] = v14;
    v45 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v82[1] = v45;
    v82[2] = v15;
    v46 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v82[3] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v47);

    if (v16)
    {
      if (v17)
        goto LABEL_30;
    }
    else
    {

      if (v17)
        goto LABEL_30;
    }

  }
LABEL_30:
  v81 = v17;
  v48 = v16;
  objc_msgSend(v18, "ambientLightContext");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "ambientLightType");

  if ((_DWORD)v50 != 7)
  {
    objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 41);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addLaunchWithBundleId:date:category:", v14, v15, v53);

  }
  v54 = (void *)MEMORY[0x1E0D80E00];
  objc_msgSend(v18, "locationMotionContext");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "getMotionStringFromMotionType:", objc_msgSend(v55, "motionType"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 37);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addLaunchWithBundleId:date:category:", v14, v15, v79);

  +[_ATXActionUtils stringForTimeOfDayAndDayOfWeek:timeZone:](_ATXActionUtils, "stringForTimeOfDayAndDayOfWeek:timeZone:", v15, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 42);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addLaunchWithBundleId:date:category:", v14, v15, v78);

  objc_msgSend(v18, "locationMotionContext");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForCoarseTimePOWLocation:timeZone:coarseGeohash:](_ATXActionUtils, "stringForCoarseTimePOWLocation:timeZone:coarseGeohash:", v15, 0, objc_msgSend(v58, "coarseGeohash"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "locationMotionContext");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForSpecificTimeDOWLocation:timeZone:geohash:](_ATXActionUtils, "stringForSpecificTimeDOWLocation:timeZone:geohash:", v15, 0, objc_msgSend(v59, "geohash"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 43);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addLaunchWithBundleId:date:category:", v14, v15, v77);

  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 44);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addLaunchWithBundleId:date:category:", v14, v15, v76);

  objc_msgSend(v18, "locationMotionContext");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForCoarseGeohash:](_ATXActionUtils, "stringForCoarseGeohash:", objc_msgSend(v62, "coarseGeohash"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "locationMotionContext");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForSpecificGeohash:](_ATXActionUtils, "stringForSpecificGeohash:", objc_msgSend(v64, "geohash"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "locationMotionContext");
  v75 = v18;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForZoom7Geohash:](_ATXActionUtils, "stringForZoom7Geohash:", objc_msgSend(v66, "largeGeohash"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 50);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addLaunchWithBundleId:date:category:", v14, v15, v65);

  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 51);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addLaunchWithBundleId:date:category:", v14, v15, v63);

  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 61);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addLaunchWithBundleId:date:category:", v14, v15, v67);

  +[_ATXActionUtils stringForTwoHourTimeWindow:timeZone:](_ATXActionUtils, "stringForTwoHourTimeWindow:timeZone:", v15, v16);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 52);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addLaunchWithBundleId:date:category:", v14, v15, v71);

  objc_msgSend(*((id *)v13 + 8), "currentPoiCategory");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v13 + 5), "categoricalHistogramForLaunchType:", 95);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addLaunchWithBundleId:date:category:", v14, v15, v73);

}

- (void)stop
{
  -[_PASLock runWithLockAcquired:](self->_cdContext, "runWithLockAcquired:", &__block_literal_global_134);
}

- (void)startDeltaRecording
{
  -[_PASQueueLock runWithLockAcquired:](self->_history, "runWithLockAcquired:", &__block_literal_global_135_0);
}

- (id)stopDeltaRecording
{
  _PASQueueLock *history;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___ATXAppLaunchMonitor_stopDeltaRecording__block_invoke;
  v5[3] = &unk_1E82E1DC0;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](history, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_ATXAppLaunchMonitor stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchMonitor;
  -[_ATXAppLaunchMonitor dealloc](&v3, sel_dealloc);
}

- (id)appInfoManager
{
  _PASQueueLock *history;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___ATXAppLaunchMonitor_appInfoManager__block_invoke;
  v5[3] = &unk_1E82E1DC0;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](history, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)appLaunchHistogramManager
{
  _PASQueueLock *history;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49___ATXAppLaunchMonitor_appLaunchHistogramManager__block_invoke;
  v5[3] = &unk_1E82E1DC0;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](history, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)appLaunchSequenceManager
{
  _PASQueueLock *history;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48___ATXAppLaunchMonitor_appLaunchSequenceManager__block_invoke;
  v5[3] = &unk_1E82E1DC0;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](history, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)swapDuetHelper:(id)a3
{
  id v4;
  _PASQueueLock *history;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  history = self->_history;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39___ATXAppLaunchMonitor_swapDuetHelper___block_invoke;
  v7[3] = &unk_1E82E2138;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](history, "runAsyncWithLockAcquired:", v7);

}

- (id)dailyDose
{
  _PASQueueLock *history;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  history = self->_history;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___ATXAppLaunchMonitor_dailyDose__block_invoke;
  v5[3] = &unk_1E82E1DC0;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](history, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_syncForTests
{
  dispatch_sync((dispatch_queue_t)self->_logQueue, &__block_literal_global_138);
  dispatch_sync((dispatch_queue_t)self->_appLaunchHistoryQueue, &__block_literal_global_139);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionUpdateBlacklist, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_appClipChangeListener, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_cdContext, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_appLaunchHistoryQueue, 0);
}

- (void)initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:predictionUpdateBlacklist:heroPoiManager:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "_ATXAppLaunchMonitor initialized", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)handleAppOrClipLaunchNotificationForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:date:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_2(&dword_1C9A3B000, v0, v1, "Ignoring app launch with nil or empty value for bundleId (\"%@\") and launchReason of \"%@\")");
  OUTLINED_FUNCTION_1_0();
}

+ (void)_logPredictionForBundleId:poweringAppClipBundleId:urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "No launch reason provided for launch.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_logPredictionForBundleId:(void *)a1 poweringAppClipBundleId:(NSObject *)a2 urlHash:isClip:appLaunchReason:appClipLaunchReason:consumerType:consumerSubType:context:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v4, "No results predicted. Error: %@", (uint8_t *)&v5);

}

- (void)_logAppLaunchOverallCaptureRateForBundleId:(NSObject *)a3 launchReason:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "captureType");
  if (v7 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E82E2198[(int)v7];
  }
  v9 = v8;
  v10 = objc_msgSend(a2, "iconLocation");
  if (v10 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E82E21E8[(int)v10];
  }
  *(_DWORD *)buf = 138414338;
  v13 = v6;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = v11;
  v18 = 1024;
  v19 = objc_msgSend(a2, "spotlightEnabled");
  v20 = 1024;
  v21 = objc_msgSend(a2, "appLibraryEnabled");
  v22 = 1024;
  v23 = objc_msgSend(a2, "appPredictionPanelEnabled");
  v24 = 1024;
  v25 = objc_msgSend(a2, "appPredictionPanelTodayEnabled");
  v26 = 1024;
  v27 = objc_msgSend(a2, "suggestionsWidgetEnabled");
  v28 = 1024;
  v29 = objc_msgSend(a2, "suggestionsWidgetTodayEnabled");
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAppLaunchOverallCaptureRateTracker with captureType: %@, iconLocation: %@, spotlightEnabled: %u, appLibraryEnabled: %u, hasAppPanel: %u, hasAppPanelToday: %u, suggestionsWidgetEnabled: %u, suggestionsWidgetTodayEnabled: %u", buf, 0x44u);

}

@end
