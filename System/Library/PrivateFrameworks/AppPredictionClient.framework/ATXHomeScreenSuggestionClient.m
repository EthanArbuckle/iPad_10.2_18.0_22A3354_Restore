@implementation ATXHomeScreenSuggestionClient

uint64_t __99__ATXHomeScreenSuggestionClient_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logHomeScreenPageDidAppear:topWidgetsByStackIdentifier:prediction:", a1[6], a1[4], a1[5]);
}

- (void)logHomeScreenPageDidAppear:(unint64_t)a3 topWidgetsByStackIdentifier:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  _PASQueueLock *lock;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__ATXHomeScreenSuggestionClient_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke;
  v13[3] = &unk_1E4D59F90;
  v15 = v9;
  v16 = a3;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v13);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ATXHomeScreenSuggestionClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_6, block);
  return (id)sharedInstance__pasExprOnceResult_7;
}

void __74__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_stackId_prediction___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v4 = *(void **)(a1[4] + 64);
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetDidDisappear:date:", v3, v7);

  v8 = (void *)v6[24];
  objc_msgSend(v8, "logWidgetDidDisappear:stackId:prediction:", a1[5], a1[6], a1[7]);
  objc_msgSend((id)a1[5], "widgetUniqueId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[4];
    v14[0] = CFSTR("uniqueID");
    v14[1] = CFSTR("stackID");
    v12 = a1[6];
    v15[0] = v9;
    v15[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ATXHomeScreenSuggestionClientTopWidgetDidDisappearNotification"), v11, v13);

  }
}

uint64_t __72__ATXHomeScreenSuggestionClient_significantDwellDetectedForWidget_date___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 184), "updateMostRecentSignificantDwellOfWidget:date:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)significantDwellDetectedForWidget:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__ATXHomeScreenSuggestionClient_significantDwellDetectedForWidget_date___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

- (void)logWidgetDidDisappear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E4D59F40;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

void __47__ATXHomeScreenSuggestionClient_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1A85A4F90]();
  v3 = objc_alloc(*(Class *)(a1 + 32));
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v3, "initWithHomeScreenConfigCache:engagementRecordManager:widgetDwellTracker:widgetDismissManager:uiCacheManager:actionPredictionClient:chronoServicesProvider:store:logger:", v4, v5, v6, 0, v7, v8, v9, 0, 0);
  v11 = (void *)sharedInstance__pasExprOnceResult_7;
  sharedInstance__pasExprOnceResult_7 = v10;

  objc_autoreleasePoolPop(v2);
}

- (ATXHomeScreenSuggestionClient)initWithHomeScreenConfigCache:(id)a3 engagementRecordManager:(id)a4 widgetDwellTracker:(id)a5 widgetDismissManager:(id)a6 uiCacheManager:(id)a7 actionPredictionClient:(id)a8 chronoServicesProvider:(id)a9 store:(id)a10 logger:(id)a11
{
  id v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_queue_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int *v38;
  void *v39;
  void *v40;
  id *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  id v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[8];
  _QWORD v58[4];
  id *v59;
  _QWORD v60[4];
  int *v61;
  objc_super v62;

  v17 = a3;
  v56 = a4;
  v55 = a5;
  v54 = a6;
  v53 = a7;
  v48 = a8;
  v52 = a8;
  v51 = a9;
  v50 = a10;
  v49 = a11;
  v62.receiver = self;
  v62.super_class = (Class)ATXHomeScreenSuggestionClient;
  v18 = -[ATXHomeScreenSuggestionClient init](&v62, sel_init);
  if (v18)
  {
    v46 = v17;
    v19 = objc_opt_new();
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    v21 = *(void **)(v19 + 8);
    *(_QWORD *)(v19 + 8) = v20;

    v22 = objc_opt_new();
    v23 = *(void **)(v19 + 80);
    *(_QWORD *)(v19 + 80) = v22;

    objc_storeStrong((id *)(v19 + 184), a10);
    objc_storeStrong((id *)(v19 + 200), a6);
    objc_storeStrong((id *)(v19 + 192), a11);
    v24 = objc_opt_new();
    v25 = *(void **)(v19 + 128);
    *(_QWORD *)(v19 + 128) = v24;

    v26 = objc_alloc(MEMORY[0x1E0D81600]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("com.apple.proactive.ATXHomeScreenSuggestionClient.lock", v27);
    v29 = objc_msgSend(v26, "initWithGuardedData:serialQueue:", v19, v28);
    v30 = (void *)*((_QWORD *)v18 + 3);
    *((_QWORD *)v18 + 3) = v29;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.proactive.ATXHomeScreenSuggestionClient.output", v31);
    v33 = (void *)*((_QWORD *)v18 + 1);
    *((_QWORD *)v18 + 1) = v32;

    v34 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v35 = objc_msgSend(v34, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    v36 = (void *)*((_QWORD *)v18 + 11);
    *((_QWORD *)v18 + 11) = v35;

    objc_storeStrong((id *)v18 + 5, a7);
    objc_storeStrong((id *)v18 + 6, a3);
    objc_storeStrong((id *)v18 + 7, a4);
    objc_storeStrong((id *)v18 + 8, a5);
    objc_msgSend(*((id *)v18 + 8), "setDelegate:", v18);
    *(_OWORD *)(v18 + 104) = xmmword_1A4B66D50;
    *((_QWORD *)v18 + 15) = 0x4014000000000000;
    objc_storeStrong((id *)v18 + 9, v48);
    objc_storeStrong((id *)v18 + 10, a9);
    objc_msgSend(*((id *)v18 + 10), "setDelegate:", v18);
    v37 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke;
    v60[3] = &unk_1E4D59AD0;
    v38 = v18;
    v61 = v38;
    v39 = (void *)MEMORY[0x1A85A511C](v60);
    notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.homeScreenPageConfigCacheUpdate"), "UTF8String"), v38 + 8, *((dispatch_queue_t *)v18 + 1), v39);
    notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.todayPageConfigCacheUpdate"), "UTF8String"), v38 + 9, *((dispatch_queue_t *)v18 + 1), v39);
    v40 = (void *)MEMORY[0x1E0D81590];
    v58[0] = v37;
    v58[1] = 3221225472;
    v58[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_3;
    v58[3] = &unk_1E4D57590;
    v41 = v38;
    v59 = v41;
    objc_msgSend(v40, "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", 25, v58);
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.HomeScreenSuggestion.xpc"));
    v43 = v41[2];
    v41[2] = (id)v42;

    objc_msgSend(v41[2], "setDelegate:", v41);
    objc_msgSend(v41[2], "resume");
    __atxlog_handle_home_screen();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v44, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: XPC listener resumed", buf, 2u);
    }

    v17 = v46;
  }

  return (ATXHomeScreenSuggestionClient *)v18;
}

uint64_t __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "runAsyncWithLockAcquired:", &__block_literal_global_41);
}

uint64_t __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 80), "removeAllObjects");
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v5[4];
  _QWORD *v6;
  uint8_t buf[16];

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: Received class C unlock event from ProactiveSupport", buf, 2u);
  }

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[3];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_74;
  v5[3] = &unk_1E4D59AF8;
  v6 = v3;
  objc_msgSend(v4, "runAsyncWithLockAcquired:", v5);

}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_74(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  ATXWidgetSuggestionDismissManager *v24;
  void *v25;
  ATXHomeScreenEventLogger *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int16 v36;
  _QWORD v37[4];
  _QWORD *v38;
  _QWORD v39[4];
  _QWORD *v40;
  _QWORD v41[4];
  _QWORD *v42;

  v3 = a2;
  v4 = v3;
  v5 = v3[19];
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_75;
    v41[3] = &unk_1E4D59210;
    v42 = v3;
    objc_msgSend(v7, "_writeHomeScreenPageConfigurations:guardedData:completionHandler:", v5, v42, v41);

  }
  v8 = v4[20];
  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    v39[0] = v6;
    v39[1] = 3221225472;
    v39[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_77;
    v39[3] = &unk_1E4D59210;
    v40 = v4;
    objc_msgSend(v9, "_writeDockAppList:guardedData:completionHandler:", v8, v40, v39);

  }
  v10 = v4[21];
  if (v10)
  {
    v11 = v4[22];
    if (v11)
    {
      v12 = *(void **)(a1 + 32);
      v37[0] = v6;
      v37[1] = 3221225472;
      v37[2] = __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_78;
      v37[3] = &unk_1E4D59210;
      v38 = v4;
      objc_msgSend(v12, "_writeTodayPageStacks:appPredictionPanels:guardedData:completionHandler:", v10, v11, v38, v37);

    }
  }
  __atxlog_handle_home_screen();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 0;
    _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: Device is Class C unlocked. Populating in-memory prediction cache with on-disk prediction cache.", (uint8_t *)&v36, 2u);
  }

  if (!v4[23])
  {
    v14 = objc_opt_new();
    v15 = (void *)v4[23];
    v4[23] = v14;

    if (!v4[23])
    {
      __atxlog_handle_home_screen();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_74_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);

    }
  }
  if (!v4[25] && v4[23])
  {
    v24 = -[ATXWidgetSuggestionDismissManager initWithStore:]([ATXWidgetSuggestionDismissManager alloc], "initWithStore:", v4[23]);
    v25 = (void *)v4[25];
    v4[25] = v24;

  }
  if (!v4[24])
  {
    v26 = [ATXHomeScreenEventLogger alloc];
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v28 = (void *)objc_opt_new();
    v29 = (void *)objc_opt_new();
    v30 = -[ATXHomeScreenEventLogger initWithHomeScreenConfigCache:biomeUIStream:PETEventTracker:defaults:](v26, "initWithHomeScreenConfigCache:biomeUIStream:PETEventTracker:defaults:", v27, v28, v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    v31 = (void *)v4[24];
    v4[24] = v30;

    objc_msgSend((id)v4[24], "setDelegate:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadKnownHomeScreenProactiveWidgetUniqueIds");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v4[5];
  v4[5] = v32;

  objc_msgSend(*(id *)(a1 + 32), "_loadKnownTodayPageProactiveWidgetUniqueIds");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v4[7];
  v4[7] = v34;

  objc_msgSend(*(id *)(a1 + 32), "_readCachedSuggestionsFromDiskAndUpdateGuardedData:", v4);
  +[ATXDemoStackAndWidgetProvider startYourEngines](ATXDemoStackAndWidgetProvider, "startYourEngines");

}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_75_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: successfully wrote staged home screen page configurations post-class C unlock", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = 0;

}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_77_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: successfully wrote staged dock app list post-class C unlock", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = 0;

}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_78_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: successfully wrote staged today page stacks and panels post-class C unlock", v10, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 176);
  *(_QWORD *)(v8 + 176) = 0;

}

- (void)dealloc
{
  int v3;
  int v4;
  objc_super v5;

  v3 = self->_notifyObservers[0];
  if (v3)
    notify_cancel(v3);
  v4 = self->_notifyObservers[1];
  if (v4)
    notify_cancel(v4);
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", self);
  v5.receiver = self;
  v5.super_class = (Class)ATXHomeScreenSuggestionClient;
  -[ATXHomeScreenSuggestionClient dealloc](&v5, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATXHomeScreenSuggestionClient_registerObserver___block_invoke;
  v7[3] = &unk_1E4D59AF8;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

uint64_t __50__ATXHomeScreenSuggestionClient_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXHomeScreenSuggestionClient *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATXHomeScreenSuggestionClient_removeObserver___block_invoke;
  v7[3] = &unk_1E4D59B20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

void __48__ATXHomeScreenSuggestionClient_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id *v3;

  v3 = a2;
  objc_msgSend(v3[1], "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v3[1], "count"))
    objc_msgSend(*(id *)(a1 + 40), "_cleanupGuardedData:", v3);

}

- (void)startSuppressingRotationForTimeInterval:(double)a3 leeway:(double)a4
{
  _PASQueueLock *lock;
  _QWORD v5[7];

  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__ATXHomeScreenSuggestionClient_startSuppressingRotationForTimeInterval_leeway___block_invoke;
  v5[3] = &unk_1E4D59B48;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v5);
}

uint64_t __80__ATXHomeScreenSuggestionClient_startSuppressingRotationForTimeInterval_leeway___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSuppressingRotationForTimeInterval:leeway:guardedData:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_startSuppressingRotationForTimeInterval:(double)a3 leeway:(double)a4 guardedData:(id)a5
{
  dispatch_object_t *v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_source_t v12;
  dispatch_object_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  Boolean keyExistsAndHasValidFormat[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (dispatch_object_t *)a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v9 = (const __CFString *)*MEMORY[0x1E0CF9598];
    keyExistsAndHasValidFormat[0] = 0;
    if (CFPreferencesGetAppBooleanValue(v9, (CFStringRef)*MEMORY[0x1E0CF9510], keyExistsAndHasValidFormat))
    {
      a4 = 0.01;
      a3 = 1.0;
    }
  }
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)keyExistsAndHasValidFormat = 134218240;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: start suppressing rotation for %f seconds with %f leeway seconds", keyExistsAndHasValidFormat, 0x16u);
  }

  v11 = v8[2];
  if (!v11)
  {
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_outputQueue);
    v13 = v8[2];
    v8[2] = v12;

    objc_initWeak((id *)keyExistsAndHasValidFormat, self);
    v14 = v8[2];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __93__ATXHomeScreenSuggestionClient__startSuppressingRotationForTimeInterval_leeway_guardedData___block_invoke;
    handler[3] = &unk_1E4D579D8;
    objc_copyWeak(&v16, (id *)keyExistsAndHasValidFormat);
    dispatch_source_set_event_handler(v14, handler);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)keyExistsAndHasValidFormat);
    v11 = v8[2];
  }
  dispatch_source_set_timer(v11, objc_msgSend(MEMORY[0x1E0D81598], "dispatchTimeWithSecondsFromNow:", a3), 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
  dispatch_activate(v8[2]);

}

void __93__ATXHomeScreenSuggestionClient__startSuppressingRotationForTimeInterval_leeway_guardedData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rotationSuppressionTimerFired");

}

- (void)_rotationSuppressionTimerFired
{
  _PASQueueLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__ATXHomeScreenSuggestionClient__rotationSuppressionTimerFired__block_invoke;
  v3[3] = &unk_1E4D59AF8;
  v3[4] = self;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v3);
}

void __63__ATXHomeScreenSuggestionClient__rotationSuppressionTimerFired__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearRotationSuppressionTimerWithGuardedData:", v3);
  v4 = v3[9];
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: rotation suppression lifted, updating states with suppressed suggestion update.", buf, 2u);
    }

    v7 = (void *)v3[9];
    v3[9] = 0;
    v5 = v7;

    objc_msgSend(*(id *)(a1 + 32), "_updateGuardedData:withCachedSuggestions:updateProactiveWidgetLayoutsOnly:", v3, v5, 0);
  }
  else if (v6)
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: rotation suppression lifted, no suppressed suggestion.", v8, 2u);
  }

}

- (void)_startSuppressingSystemInitiatedLayoutUpdateForTimeInterval:(double)a3 leeway:(double)a4 guardedData:(id)a5
{
  dispatch_object_t *v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_source_t v12;
  dispatch_object_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  Boolean keyExistsAndHasValidFormat[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (dispatch_object_t *)a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v9 = (const __CFString *)*MEMORY[0x1E0CF9598];
    keyExistsAndHasValidFormat[0] = 0;
    if (CFPreferencesGetAppBooleanValue(v9, (CFStringRef)*MEMORY[0x1E0CF9510], keyExistsAndHasValidFormat))
    {
      a4 = 0.01;
      a3 = 1.0;
    }
  }
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)keyExistsAndHasValidFormat = 134218240;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: start suppressing layout update for %f seconds with %f leeway seconds", keyExistsAndHasValidFormat, 0x16u);
  }

  v11 = v8[3];
  if (!v11)
  {
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_outputQueue);
    v13 = v8[3];
    v8[3] = v12;

    objc_initWeak((id *)keyExistsAndHasValidFormat, self);
    v14 = v8[3];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __112__ATXHomeScreenSuggestionClient__startSuppressingSystemInitiatedLayoutUpdateForTimeInterval_leeway_guardedData___block_invoke;
    handler[3] = &unk_1E4D579D8;
    objc_copyWeak(&v16, (id *)keyExistsAndHasValidFormat);
    dispatch_source_set_event_handler(v14, handler);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)keyExistsAndHasValidFormat);
    v11 = v8[3];
  }
  dispatch_source_set_timer(v11, objc_msgSend(MEMORY[0x1E0D81598], "dispatchTimeWithSecondsFromNow:", a3), 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
  dispatch_activate(v8[3]);

}

void __112__ATXHomeScreenSuggestionClient__startSuppressingSystemInitiatedLayoutUpdateForTimeInterval_leeway_guardedData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutUpdateSuppressionTimerFired");

}

- (void)_layoutUpdateSuppressionTimerFired
{
  _PASQueueLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__ATXHomeScreenSuggestionClient__layoutUpdateSuppressionTimerFired__block_invoke;
  v3[3] = &unk_1E4D59AF8;
  v3[4] = self;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v3);
}

void __67__ATXHomeScreenSuggestionClient__layoutUpdateSuppressionTimerFired__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_cancelAndReleaseLayoutUpdateSuppressionTimer:", v3);
  v4 = v3[9];
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layout update suppression lifted, updating states with suppressed suggestion update.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_updateGuardedData:withCachedSuggestions:updateProactiveWidgetLayoutsOnly:", v3, v3[9], 0);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layout update suppression lifted, no suppressed suggestion.", v7, 2u);
    }

  }
}

- (void)_cancelAndReleaseLayoutUpdateSuppressionTimer:(id)a3
{
  NSObject *v3;
  id v5;
  id v6;

  v3 = *((_QWORD *)a3 + 3);
  if (v3)
  {
    v5 = a3;
    dispatch_source_cancel(v3);
    v6 = (id)*((_QWORD *)a3 + 3);
    *((_QWORD *)a3 + 3) = 0;

  }
}

- (BOOL)_isSystemInitiatedLayoutUpdateAllowed:(id)a3
{
  return !*((_BYTE *)a3 + 32) && *((_QWORD *)a3 + 3) == 0;
}

- (id)_loadKnownHomeScreenProactiveWidgetUniqueIds
{
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v10;

  homeScreenConfigCache = self->_homeScreenConfigCache;
  v10 = 0;
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsWithError:](homeScreenConfigCache, "loadHomeScreenPageConfigurationsWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenSuggestionClient _loadKnownHomeScreenProactiveWidgetUniqueIds].cold.1();

  }
  else if (v4)
  {
    -[ATXHomeScreenSuggestionClient _knownProactiveWidgetUniqueIdentifiersInPages:](self, "_knownProactiveWidgetUniqueIdentifiersInPages:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = objc_opt_new();
LABEL_8:
  v8 = (void *)v7;

  return v8;
}

- (id)_loadKnownTodayPageProactiveWidgetUniqueIds
{
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  homeScreenConfigCache = self->_homeScreenConfigCache;
  v10 = 0;
  -[ATXHomeScreenConfigCache loadTodayStacksAndPanelsAsHomeScreenPageWithError:](homeScreenConfigCache, "loadTodayStacksAndPanelsAsHomeScreenPageWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenSuggestionClient _loadKnownTodayPageProactiveWidgetUniqueIds].cold.1();

  }
  else if (v4)
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenSuggestionClient _knownProactiveWidgetUniqueIdentifiersInPages:](self, "_knownProactiveWidgetUniqueIdentifiersInPages:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v7 = (void *)objc_opt_new();
LABEL_8:

  return v7;
}

- (id)_knownProactiveWidgetUniqueIdentifiersInPages:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[4];
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v3;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v49;
    v5 = *MEMORY[0x1E0CF9480];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v6);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v30 = v7;
        v31 = v6;
        objc_msgSend(v7, "stacks");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        if (v34)
        {
          v33 = *(_QWORD *)v45;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v45 != v33)
                objc_enumerationMutation(v32);
              v35 = v8;
              v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              objc_msgSend(v9, "widgets");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v12; ++i)
                  {
                    if (*(_QWORD *)v41 != v13)
                      objc_enumerationMutation(v10);
                    v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                    objc_msgSend(v15, "extensionBundleId");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v16, "isEqualToString:", v5);

                    if (v17)
                    {
                      objc_msgSend(v15, "widgetUniqueId");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v18)
                      {
                        objc_msgSend(v15, "widgetUniqueId");
                        v19 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "addObject:", v19);
                      }
                      else
                      {
                        __atxlog_handle_home_screen();
                        v19 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
                          -[ATXHomeScreenSuggestionClient _knownProactiveWidgetUniqueIdentifiersInPages:].cold.1(v53, v9, &v54, v19);
                      }

                    }
                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
                }
                while (v12);
              }

              v8 = v35 + 1;
            }
            while (v35 + 1 != v34);
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          }
          while (v34);
        }

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v30, "panels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v25);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          }
          while (v22);
        }

        v6 = v31 + 1;
      }
      while (v31 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v29);
  }

  return v4;
}

- (void)_readCachedSuggestionsFromDiskAndUpdateGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v4 = a3;
  -[ATXUICacheManager cachedLayoutForConsumerSubType:expectedClass:](self->_uiCacheManager, "cachedLayoutForConsumerSubType:expectedClass:", 34, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ATXHomeScreenSuggestionClient _updateGuardedData:withCachedSuggestions:updateProactiveWidgetLayoutsOnly:](self, "_updateGuardedData:withCachedSuggestions:updateProactiveWidgetLayoutsOnly:", v4, v5, 1);
    -[ATXChronoServicesProvider resetToPrewarmWidgetsInSuggestions:](self->_chronoServicesProvider, "resetToPrewarmWidgetsInSuggestions:", v5);
  }
  else
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: Unable to read cached suggestions, set prediction data as empty.", v18, 2u);
    }

    v7 = (void *)v4[17];
    v4[17] = 0;

    v8 = (void *)v4[11];
    v4[11] = 0;

    v9 = objc_opt_new();
    v10 = (void *)v4[14];
    v4[14] = v9;

    v11 = objc_opt_new();
    v12 = (void *)v4[12];
    v4[12] = v11;

    v13 = objc_opt_new();
    v14 = (void *)v4[13];
    v4[13] = v13;

    v15 = objc_opt_new();
    v16 = (void *)v4[15];
    v4[15] = v15;

    v17 = (void *)v4[18];
    v4[18] = 0;

  }
}

- (void)_updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:(id)a3
{
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[ATXHomeScreenSuggestionClient _isSystemInitiatedLayoutUpdateAllowed:](self, "_isSystemInitiatedLayoutUpdateAllowed:", v4))
  {
    if (*((_BYTE *)v4 + 64))
    {
      __atxlog_handle_home_screen();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updating known today page widget unique ids", buf, 2u);
      }

      -[ATXHomeScreenSuggestionClient _loadKnownTodayPageProactiveWidgetUniqueIds](self, "_loadKnownTodayPageProactiveWidgetUniqueIds");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v4[7];
      v4[7] = v6;

      *((_BYTE *)v4 + 64) = 0;
    }
    if (*((_BYTE *)v4 + 48))
    {
      __atxlog_handle_home_screen();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updating known Home Screen widget unique ids", v11, 2u);
      }

      -[ATXHomeScreenSuggestionClient _loadKnownHomeScreenProactiveWidgetUniqueIds](self, "_loadKnownHomeScreenProactiveWidgetUniqueIds");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v4[5];
      v4[5] = v9;

      *((_BYTE *)v4 + 48) = 0;
    }
  }

}

- (id)_computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData:(id)a3 cachedSuggestions:(id)a4
{
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5[12], "allKeys");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C9AA60];
  if (v8)
    v11 = v8;
  else
    v11 = MEMORY[0x1E0C9AA60];
  v12 = (void *)objc_msgSend(v7, "initWithArray:", v11);

  v13 = objc_alloc(MEMORY[0x1E0C99E60]);
  v34 = v6;
  objc_msgSend(v6, "cachedSuggestionWidgetLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = v15;
  else
    v17 = v10;
  v18 = objc_msgSend(v13, "initWithArray:", v17);

  v33 = (void *)v18;
  objc_msgSend(v12, "minusSet:", v18);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __115__ATXHomeScreenSuggestionClient__computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData_cachedSuggestions___block_invoke;
  v39[3] = &unk_1E4D59B70;
  v19 = v5;
  v40 = v19;
  objc_msgSend(v12, "objectsPassingTest:", v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19[11], "mutableCopy");
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_opt_new();
  v24 = v23;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v20;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v5[12], "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v27);
  }

  return v24;
}

uint64_t __115__ATXHomeScreenSuggestionClient__computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData_cachedSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNPlusOne");

  return v3;
}

- (void)_updateGuardedData:(id)a3 withCachedSuggestions:(id)a4 updateProactiveWidgetLayoutsOnly:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *outputQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[ATXHomeScreenSuggestionClient _isSystemInitiatedLayoutUpdateAllowed:](self, "_isSystemInitiatedLayoutUpdateAllowed:", v8)&& !*((_QWORD *)v8 + 2))
  {
    v11 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = 0;
  }
  else
  {
    v10 = v9;
    v11 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v10;
  }

  if (-[ATXHomeScreenSuggestionClient _isSystemInitiatedLayoutUpdateAllowed:](self, "_isSystemInitiatedLayoutUpdateAllowed:", v8))
  {
    -[ATXHomeScreenSuggestionClient _computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData:cachedSuggestions:](self, "_computePreviousSuggestedSuggestionWidgetLayoutsWithGuardedData:cachedSuggestions:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v8 + 11);
    *((_QWORD *)v8 + 11) = v12;

    if (objc_msgSend(*((id *)v8 + 11), "count"))
    {
      __atxlog_handle_home_screen();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*((id *)v8 + 11), "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: keeping around previously-removed suggested suggestion widget layouts: %@", buf, 0xCu);

      }
      -[ATXHomeScreenSuggestionClient _clearRotationSuppressionTimerWithGuardedData:](self, "_clearRotationSuppressionTimerWithGuardedData:", v8);
    }
    objc_msgSend(v9, "cachedSuggestionWidgetLayouts");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v8 + 12);
    *((_QWORD *)v8 + 12) = v16;

    objc_msgSend(v9, "cachedAppPredictionPanelLayouts");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v8 + 13);
    *((_QWORD *)v8 + 13) = v18;

    objc_msgSend(v9, "fallbackSuggestions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    v22 = (void *)*((_QWORD *)v8 + 15);
    *((_QWORD *)v8 + 15) = v21;

    __atxlog_handle_home_screen();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updated Proactive widget layouts", buf, 2u);
    }

    -[ATXHomeScreenSuggestionClient _notifyObserversAboutLayoutUpdateWithGuardedData:](self, "_notifyObserversAboutLayoutUpdateWithGuardedData:", v8);
    if (!a5)
    {
      if (*((_QWORD *)v8 + 2)
        || -[NSUserDefaults BOOLForKey:](self->_atxDefaults, "BOOLForKey:", CFSTR("ATXStopAllStackRotation")))
      {
        __atxlog_handle_home_screen();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A49EF000, v24, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: not pushing suggestions to UI clients due to rotation suppression", buf, 2u);
        }

      }
      else
      {
        if (objc_msgSend(*((id *)v8 + 14), "count"))
          -[ATXHomeScreenSuggestionClient _refreshInferredEngagementStatusForWidgetSuggestions:](self, "_refreshInferredEngagementStatusForWidgetSuggestions:", v8);
        objc_msgSend(v9, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)*((_QWORD *)v8 + 17);
        *((_QWORD *)v8 + 17) = v26;

        +[ATXHomeScreenStackSuggestion stackSuggestionsFromCachedSuggestions:](ATXHomeScreenStackSuggestion, "stackSuggestionsFromCachedSuggestions:", v9);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)*((_QWORD *)v8 + 14);
        *((_QWORD *)v8 + 14) = v28;

        v30 = (void *)*((_QWORD *)v8 + 18);
        *((_QWORD *)v8 + 18) = 0;

        __atxlog_handle_home_screen();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: updated stack suggestions", buf, 2u);
        }

        -[ATXHomeScreenSuggestionClient _notifyObserversAboutSuggestionRefreshWithGuardedData:](self, "_notifyObserversAboutSuggestionRefreshWithGuardedData:", v8);
        -[ATXHomeScreenSuggestionClient _handleStackSuggestionDidUpdate:](self, "_handleStackSuggestionDidUpdate:", v8);
        outputQueue = self->_outputQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke;
        block[3] = &unk_1E4D57590;
        block[4] = self;
        dispatch_async(outputQueue, block);
      }
    }
  }

}

void __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke_2;
  block[3] = &unk_1E4D57590;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "runWithLockAcquired:", &__block_literal_global_100);
}

void __107__ATXHomeScreenSuggestionClient__updateGuardedData_withCachedSuggestions_updateProactiveWidgetLayoutsOnly___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a2 + 88);
  *(_QWORD *)(a2 + 88) = 0;

}

- (void)_refreshInferredEngagementStatusForWidgetSuggestions:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  ATXEngagementRecordManager *engagementRecordManager;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  ATXEngagementRecordManager *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  id obja;
  id *v52;
  ATXHomeScreenSuggestionClient *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v52 = (id *)a3;
  v53 = self;
  -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "RAS: >>>>>>>>>> checking currently engaged executables for removing engagement <<<<<<<<<<", buf, 2u);
  }

  v47 = v4;
  if (objc_msgSend(v4, "count"))
  {
    obj = (id)objc_opt_new();
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -300.0);
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -6000.0);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v60 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if (objc_msgSend(v11, "type") == 3)
          {
            objc_msgSend(v11, "object");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "suggestionIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "widgetBundleIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "widgetKind");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[ATXHomeScreenSuggestionClient _isWidgetEngaged:kind:afterMostRecentProactiveRotationToSuggestionWithIdentifier:guardedData:](v53, "_isWidgetEngaged:kind:afterMostRecentProactiveRotationToSuggestionWithIdentifier:guardedData:", v14, v15, v13, v52);

            if (!v16)
            {
              __atxlog_handle_home_screen();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v18 = objc_msgSend(v12, "confidenceLevel");
                objc_msgSend(v12, "widgetBundleIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v65 = v13;
                v66 = 2050;
                v67 = v18;
                v68 = 2112;
                v69 = v19;
                _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "RAS:     [TRYING TO REMOVE ENGAGEMENT] infoSuggestionId %{public}@, confidence %{public}ld, widgetExtBundleId %@", buf, 0x20u);

              }
              v20 = objc_msgSend(v12, "confidenceLevel");
              if (v20 >= objc_msgSend(obj, "minInfoConfidenceLevelForBlendingConfidenceCategory:", 3))
                v21 = v49;
              else
                v21 = v48;
              -[ATXEngagementRecordManager removeEngagementForExecutableIdentifier:recordType:abortingRemovalIfEngagementDateIsLaterThanDate:](v53->_engagementRecordManager, "removeEngagementForExecutableIdentifier:recordType:abortingRemovalIfEngagementDateIsLaterThanDate:", v11, 4, v21);
            }
            objc_msgSend(v54, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v8);
    }

  }
  __atxlog_handle_home_screen();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "RAS: ========== checking current stack suggestions for adding engagement ==========", buf, 2u);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v52[14], "allValues");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v56 != v25)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v27, "topWidgetProactiveSuggestion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v27, "topWidgetProactiveSuggestion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "executableSpecification");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "executableIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v54, "containsObject:", v31))
          {
            __atxlog_handle_home_screen();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v31;
              _os_log_impl(&dword_1A49EF000, v32, OS_LOG_TYPE_DEFAULT, "RAS:     Skipping infoSuggestionId %{public}@ becaues it was already processed", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v27, "topWidget");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "extensionBundleId");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "topWidget");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "widgetKind");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[ATXHomeScreenSuggestionClient _isWidgetEngaged:kind:afterMostRecentProactiveRotationToSuggestionWithIdentifier:guardedData:](v53, "_isWidgetEngaged:kind:afterMostRecentProactiveRotationToSuggestionWithIdentifier:guardedData:", v34, v36, v31, v52);

            if (v37)
            {
              engagementRecordManager = v53->_engagementRecordManager;
              objc_msgSend(v27, "topWidgetProactiveSuggestion");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(engagementRecordManager) = -[ATXEngagementRecordManager hasReferenceForSuggestion:](engagementRecordManager, "hasReferenceForSuggestion:", v39);

              __atxlog_handle_home_screen();
              v40 = objc_claimAutoreleasedReturnValue();
              v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)engagementRecordManager)
              {
                if (v41)
                {
                  objc_msgSend(v27, "topWidget");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "extensionBundleId");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v65 = v31;
                  v66 = 2112;
                  v67 = (uint64_t)v43;
                  _os_log_impl(&dword_1A49EF000, v40, OS_LOG_TYPE_DEFAULT, "RAS:     [ADDING ENGAGEMENT] infoSuggestionId %{public}@, widgetExtBundleId %@", buf, 0x16u);

                }
                v44 = v53->_engagementRecordManager;
                objc_msgSend(v27, "topWidgetProactiveSuggestion");
                v40 = objc_claimAutoreleasedReturnValue();
                -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](v44, "addEngagedSuggestion:engagementRecordType:", v40, 4);
              }
              else if (v41)
              {
                objc_msgSend(v27, "topWidget");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "extensionBundleId");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v65 = v31;
                v66 = 2112;
                v67 = (uint64_t)v46;
                _os_log_impl(&dword_1A49EF000, v40, OS_LOG_TYPE_DEFAULT, "RAS:     Skipping infoSuggestionId %{public}@ because ERM doesn't contain a reference, widgetExtBundleId %@", buf, 0x16u);

              }
              objc_msgSend(v54, "addObject:", v31);
            }
          }

        }
      }
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v24);
  }

}

- (BOOL)_isWidgetEngaged:(id)a3 kind:(id)a4 afterMostRecentProactiveRotationToSuggestionWithIdentifier:(id)a5 guardedData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  BOOL v35;
  const char *v36;
  void *v38;
  NSObject *log;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  NSObject *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (id *)a6;
  objc_msgSend(v12[23], "mostRecentRotationRecordForSuggestionIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rotationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v12[23], "mostRecentEngagementOfWidget:kind:ofType:", v9, v10, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12[23], "mostRecentEngagementOfWidget:kind:ofType:", v9, v10, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject date](v16, "date");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17
      && (v18 = (void *)v17,
          -[NSObject date](v15, "date"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v18,
          v19))
    {
      -[NSObject date](v16, "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject date](v15, "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "laterDate:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_17;
    }
    else
    {
      -[NSObject date](v16, "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = v16;
      }
      else
      {
        -[NSObject date](v15, "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_17;
        v24 = v15;
      }
      -[NSObject date](v24, "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_17;
    }
    objc_msgSend(v13, "rotationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "earlierDate:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 != v22)
    {
      objc_msgSend(v12[23], "mostRecentTimelineUpdateDateOfWidget:kind:", v9, v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      v31 = v30;

      objc_msgSend(v22, "laterDate:", v31);
      v33 = objc_claimAutoreleasedReturnValue();

      __atxlog_handle_home_screen();
      log = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      v35 = v33 == v31;
      v25 = v33 != v31;
      if (v35)
      {
        if (v34)
        {
          objc_msgSend(v13, "rotationDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v41 = v9;
          v42 = 2114;
          v43 = v11;
          v44 = 2114;
          v45 = v38;
          v46 = 2114;
          v47 = v22;
          v48 = 2114;
          v49 = v31;
          v36 = "RAS:     NO <= _isWidgetEngaged: %@, suggestionId: %{public}@ (mostRecentRotation %{public}@, mostRecent"
                "Engagement %{public}@, mostRecentTimelineUpdate %{public}@)";
          goto LABEL_26;
        }
      }
      else if (v34)
      {
        objc_msgSend(v13, "rotationDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v41 = v9;
        v42 = 2114;
        v43 = v11;
        v44 = 2114;
        v45 = v38;
        v46 = 2114;
        v47 = v22;
        v48 = 2114;
        v49 = v31;
        v36 = "RAS:     YES <= _isWidgetEngaged: %@, suggestionId: %{public}@ (mostRecentRotation %{public}@, mostRecentE"
              "ngagement %{public}@, mostRecentTimelineUpdate %{public}@)";
LABEL_26:
        _os_log_impl(&dword_1A49EF000, log, OS_LOG_TYPE_DEFAULT, v36, buf, 0x34u);

      }
LABEL_28:

      goto LABEL_29;
    }
LABEL_17:
    __atxlog_handle_home_screen();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "rotationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v41 = v9;
      v42 = 2114;
      v43 = v11;
      v44 = 2114;
      v45 = v32;
      v46 = 2114;
      v47 = v22;
      _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "RAS:     NO <= _isWidgetEngaged: %@, suggestionId: %{public}@ (mostRecentRotation %{public}@, mostRecentEngagement %{public}@)", buf, 0x2Au);

    }
    v25 = 0;
    goto LABEL_28;
  }
  __atxlog_handle_home_screen();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v9;
    v42 = 2114;
    v43 = v11;
    _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "RAS:     NO <= _isWidgetEngaged: %@, suggestionId: %{public}@ (nil suggestion rotation date)", buf, 0x16u);
  }
  v25 = 0;
LABEL_29:

  return v25;
}

- (void)_notifyObserversAboutSuggestionRefreshWithGuardedData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *outputQueue;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        outputQueue = self->_outputQueue;
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __87__ATXHomeScreenSuggestionClient__notifyObserversAboutSuggestionRefreshWithGuardedData___block_invoke;
        v12[3] = &unk_1E4D57258;
        v12[4] = v10;
        v12[5] = self;
        dispatch_async(outputQueue, v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

uint64_t __87__ATXHomeScreenSuggestionClient__notifyObserversAboutSuggestionRefreshWithGuardedData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "suggestionClientDidRefreshSuggestions:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_notifyObserversAboutLayoutUpdateWithGuardedData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *outputQueue;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        outputQueue = self->_outputQueue;
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __82__ATXHomeScreenSuggestionClient__notifyObserversAboutLayoutUpdateWithGuardedData___block_invoke;
        v12[3] = &unk_1E4D57258;
        v12[4] = v10;
        v12[5] = self;
        dispatch_async(outputQueue, v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

uint64_t __82__ATXHomeScreenSuggestionClient__notifyObserversAboutLayoutUpdateWithGuardedData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "suggestionClientDidRefreshProactiveWidgetLayouts:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_cleanupGuardedData:(id)a3
{
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v4 = a3;
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: cleaning up guarded data", v14, 2u);
  }

  v6 = (void *)v4[11];
  v4[11] = 0;

  v7 = (void *)v4[17];
  v4[17] = 0;

  v8 = (void *)v4[12];
  v4[12] = 0;

  v9 = (void *)v4[13];
  v4[13] = 0;

  v10 = (void *)v4[14];
  v4[14] = 0;

  v11 = (void *)v4[15];
  v4[15] = 0;

  v12 = (void *)v4[18];
  v4[18] = 0;

  v13 = (void *)v4[9];
  v4[9] = 0;

  -[ATXHomeScreenSuggestionClient _clearRotationSuppressionTimerWithGuardedData:](self, "_clearRotationSuppressionTimerWithGuardedData:", v4);
}

- (void)_clearRotationSuppressionTimerWithGuardedData:(id)a3
{
  NSObject *v3;
  id v5;
  id v6;

  v3 = *((_QWORD *)a3 + 2);
  if (v3)
  {
    v5 = a3;
    dispatch_source_cancel(v3);
    v6 = (id)*((_QWORD *)a3 + 2);
    *((_QWORD *)a3 + 2) = 0;

  }
}

- (void)_handleStackSuggestionDidUpdate:(id)a3
{
  objc_msgSend(*((id *)a3 + 14), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_108);
}

void __65__ATXHomeScreenSuggestionClient__handleStackSuggestionDidUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "topWidgetInfoSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D81158], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topWidgetInfoSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stackDidRotateProactivelyForInfoSuggestion:isStalenessRotation:", v5, objc_msgSend(v6, "isLowConfidenceStackRotationForStaleStack"));

  }
}

- (void)_alertUserIfNeededOfStackChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
  BOOL v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[NSUserDefaults BOOLForKey:](self->_atxDefaults, "BOOLForKey:", CFSTR("ATXHomeScreenStackChangeAlert")))
    v10 = a5 > 9;
  else
    v10 = 1;
  if (!v10 && ((1 << a5) & 0x20C) != 0)
  {
    v36 = v9;
    -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsWithError:](self->_homeScreenConfigCache, "loadHomeScreenAndTodayPageConfigurationsWithError:", 0);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (!v34)
      goto LABEL_32;
    v33 = *(_QWORD *)v43;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(obj);
        v35 = v12;
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v13, "stacks");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v39 != v16)
                objc_enumerationMutation(v37);
              v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v8);

              if (v20)
              {
                v21 = (void *)objc_opt_new();
                if (a5 == 9)
                {
                  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v36, "extensionBundleId");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v25, "initWithFormat:", CFSTR("%@ (forced debug rotation)"), v23);
LABEL_23:
                  v26 = (void *)v24;
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("widget"));

                }
                else
                {
                  if (a5 == 3)
                  {
                    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
                    objc_msgSend(v36, "extensionBundleId");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("%@ (due to suggestion expiry)"), v23);
                    goto LABEL_23;
                  }
                  objc_msgSend(v36, "extensionBundleId");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("widget"));
                }

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "pageIndex"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("pageNumber"));

                objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("com.apple.duetexpertd.homeScreenStackChange"), 0, v21);

                __atxlog_handle_home_screen();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v18, "identifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v13, "pageIndex");
                  *(_DWORD *)buf = 136315650;
                  v47 = "-[ATXHomeScreenSuggestionClient _alertUserIfNeededOfStackChange:widgetOnTop:reason:]";
                  v48 = 2112;
                  v49 = v30;
                  v50 = 2048;
                  v51 = v31;
                  _os_log_impl(&dword_1A49EF000, v29, OS_LOG_TYPE_DEFAULT, "%s: sent notification about stackID: %@ on page: %lu", buf, 0x20u);

                }
                continue;
              }
            }
            v15 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          }
          while (v15);
        }

        v12 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (!v34)
      {
LABEL_32:

        v9 = v36;
        break;
      }
    }
  }

}

- (void)layoutForSuggestionsWidget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke;
  v11[3] = &unk_1E4D59BF8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

void __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*((_QWORD *)v3 + 12);
  if (!v4)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layoutForSuggestionWidgetWithIdentifier fallback to read from DisplayCache", (uint8_t *)&v23, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_readCachedSuggestionsFromDiskAndUpdateGuardedData:", v3);
    v4 = (void *)*((_QWORD *)v3 + 12);
  }
  v6 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (v9)
    goto LABEL_9;
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*v6, "widgetUniqueId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v11;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: using previous suggested SG widget layout: %{public}@", (uint8_t *)&v23, 0xCu);

  }
  v12 = (void *)*((_QWORD *)v3 + 11);
  objc_msgSend(*v6, "widgetUniqueId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v14, "copy");

  if (v9)
    goto LABEL_9;
  objc_msgSend(*v6, "widgetUniqueId");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  v16 = v15;
  v17 = (void *)*((_QWORD *)v3 + 5);
  objc_msgSend(*v6, "widgetUniqueId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "containsObject:", v18))
  {

LABEL_14:
    goto LABEL_16;
  }
  v19 = (void *)*((_QWORD *)v3 + 7);
  objc_msgSend(*v6, "widgetUniqueId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v19, "containsObject:", v20);

  if ((_DWORD)v19)
    goto LABEL_16;
  if (objc_msgSend(*v6, "size"))
  {
    if (objc_msgSend(*v6, "size") == 1)
    {
      v21 = (_QWORD *)MEMORY[0x1E0CF9490];
    }
    else
    {
      if (objc_msgSend(*v6, "size") != 2)
      {
        __atxlog_handle_home_screen();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke_cold_1((id *)(a1 + 40));
        goto LABEL_14;
      }
      v21 = (_QWORD *)MEMORY[0x1E0CF9498];
    }
  }
  else
  {
    v21 = (_QWORD *)MEMORY[0x1E0CF9488];
  }
  objc_msgSend(*((id *)v3 + 12), "objectForKeyedSubscript:", *v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v22, "copy");

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_10:
}

- (void)layoutForAppPredictionPanel:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke;
  v11[3] = &unk_1E4D59BF8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

void __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = (void *)v3[13];
  if (!v5 || !v3[12])
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: layoutForSuggestionWidgetWithIdentifier fallback to read from DisplayCache", (uint8_t *)&v22, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_readCachedSuggestionsFromDiskAndUpdateGuardedData:", v4);
    v5 = (void *)*((_QWORD *)v4 + 13);
  }
  v7 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v10)
    goto LABEL_7;
  objc_msgSend(*v7, "widgetUniqueId");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_12;
  v12 = (void *)v11;
  v13 = (void *)*((_QWORD *)v4 + 5);
  objc_msgSend(*v7, "widgetUniqueId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "containsObject:", v14))
  {

    goto LABEL_12;
  }
  v15 = (void *)*((_QWORD *)v4 + 7);
  objc_msgSend(*v7, "widgetUniqueId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

  if ((_DWORD)v15)
  {
LABEL_12:
    __atxlog_handle_home_screen();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v7, "widgetUniqueId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: expecting layout for %{public}@ but did not have one", (uint8_t *)&v22, 0xCu);

    }
LABEL_14:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  if (objc_msgSend(*v7, "size") != 1)
  {
    __atxlog_handle_home_screen();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke_cold_1((id *)(a1 + 40));
    goto LABEL_14;
  }
  objc_msgSend(*((id *)v4 + 13), "objectForKeyedSubscript:", *MEMORY[0x1E0CF9390]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v19, "copy");

  __atxlog_handle_home_screen();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*v7, "widgetUniqueId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v21;
    _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: returning preview layout for %{public}@", (uint8_t *)&v22, 0xCu);

  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_15:
}

- (int64_t)_layoutTypeOfSuggestion:(id)a3 inLayout:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  int64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  int v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "oneByOneSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "oneByTwoSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

    if ((v11 & 1) != 0)
    {
      v9 = 2;
    }
    else
    {
      objc_msgSend(v6, "twoByTwoSuggestions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v5);

      if ((v13 & 1) != 0)
      {
        v9 = 3;
      }
      else
      {
        objc_msgSend(v6, "oneByFourSuggestions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v5);

        if ((v15 & 1) != 0)
        {
          v9 = 5;
        }
        else
        {
          objc_msgSend(v6, "twoByFourSuggestions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v5);

          if ((v17 & 1) != 0)
          {
            v9 = 4;
          }
          else
          {
            objc_msgSend(v6, "fourByFourSuggestions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsObject:", v5);

            if ((v19 & 1) != 0)
            {
              v9 = 6;
            }
            else
            {
              objc_msgSend(v6, "fourByEightSuggestions");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "containsObject:", v5);

              if (v21)
                v9 = 7;
              else
                v9 = 0;
            }
          }
        }
      }
    }
  }

  return v9;
}

- (BOOL)isSuggestionReplacementAvailableForSuggestion:(id)a3 inLayout:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  _PASQueueLock *lock;
  NSObject *v10;
  int v11;
  BOOL v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[ATXHomeScreenSuggestionClient _layoutTypeOfSuggestion:inLayout:](self, "_layoutTypeOfSuggestion:inLayout:", v6, v7);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke;
  v14[3] = &unk_1E4D59C48;
  v14[5] = &v15;
  v14[6] = v8;
  v14[4] = self;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *((unsigned __int8 *)v16 + 24);
    *(_DWORD *)buf = 67109120;
    v20 = v11;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: %d", buf, 8u);
  }

  v12 = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)v3[15];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2;
  v8[3] = &unk_1E4D59C20;
  v5 = a1[5];
  v8[4] = a1[4];
  v9 = v3;
  v6 = a1[6];
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_msgSend(v6, "isValidForSuggestionsWidget") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isFallbackSuggestionUsed:guardedData:", v6, *(_QWORD *)(a1 + 40)))
    {
      __atxlog_handle_home_screen();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_1(v6);
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v6, "uiSpecification", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredLayoutConfigs");
      v7 = objc_claimAutoreleasedReturnValue();

      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v7);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "applicableLayoutType") == *(_QWORD *)(a1 + 56))
            {
              __atxlog_handle_home_screen();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_2(v6);

              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
              *a4 = 1;
              goto LABEL_19;
            }
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v10)
            continue;
          break;
        }
      }
    }
  }
  else
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_3(v6);
  }
LABEL_19:

}

- (BOOL)_isFallbackSuggestionUsed:(id)a3 guardedData:(id)a4
{
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a4;
  objc_msgSend(a3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5[16], "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "containsObject:", v7) & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)unusedFallbackAppSuggestionsForPage:(int64_t)a3
{
  void *v5;
  _PASQueueLock *lock;
  id v7;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v5 = (void *)objc_opt_new();
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke;
  v9[3] = &unk_1E4D59C98;
  v11 = a3;
  v7 = v5;
  v10 = v7;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

  return v7;
}

void __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = (void *)a2[16];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v4, "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)v6[15];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2;
  v11[3] = &unk_1E4D59C70;
  v12 = v8;
  v13 = *(id *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

}

void __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "executableType") == 1)
  {

    goto LABEL_4;
  }
  objc_msgSend(v3, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executableType");

  if (v6 == 5)
  {
LABEL_4:
    objc_msgSend(v3, "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) != 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v3, "uiSpecification", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredLayoutConfigs");
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "applicableLayoutType") == 1)
            {
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
              goto LABEL_18;
            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v12)
            continue;
          break;
        }
      }
    }
    else
    {
      __atxlog_handle_home_screen();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2_cold_1(v10, v15, v16, v17, v18, v19, v20, v21);
    }
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:

}

- (void)markFallbackAppSuggestion:(id)a3 asUnusedForPage:(int64_t)a4
{
  id v6;
  _PASQueueLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUnusedForPage___block_invoke;
  v9[3] = &unk_1E4D59C98;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __75__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUnusedForPage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a2 + 128);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)markFallbackAppSuggestion:(id)a3 asUsedForPage:(int64_t)a4
{
  id v6;
  _PASQueueLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUsedForPage___block_invoke;
  v9[3] = &unk_1E4D59C98;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __73__ATXHomeScreenSuggestionClient_markFallbackAppSuggestion_asUsedForPage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v8 = a2;
  v3 = (void *)v8[16];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)v8[16];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)didFinishExecutingTappedSuggestion:(id)a3 fromWidget:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ATXHomeScreenSuggestionClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__ATXHomeScreenSuggestionClient_didFinishExecutingTappedSuggestion_fromWidget___block_invoke;
  v11[3] = &unk_1E4D59CC0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

void __79__ATXHomeScreenSuggestionClient_didFinishExecutingTappedSuggestion_fromWidget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D811A8];
    objc_msgSend(*(id *)(a1 + 32), "executableSpecification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForExecutableType:", objc_msgSend(v10, "executableType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: handling didFinishExecutingTappedSuggestion for suggestion with uuid: %{public}@ executable description: %@ executable type: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addEngagedSuggestion:engagementRecordType:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeActionPredictionNotificationsMatchingSuggestion:reply:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "_replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v3);

}

- (void)setIsUserInteractingWithProactiveWidget:(BOOL)a3
{
  _PASQueueLock *lock;
  _QWORD v4[5];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__ATXHomeScreenSuggestionClient_setIsUserInteractingWithProactiveWidget___block_invoke;
  v4[3] = &unk_1E4D59CE8;
  v5 = a3;
  v4[4] = self;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v4);
}

void __73__ATXHomeScreenSuggestionClient_setIsUserInteractingWithProactiveWidget___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;

  v3 = a2;
  v4 = v3;
  if (v3[32] != *(unsigned __int8 *)(a1 + 40))
  {
    v5 = v3;
    if (*(_BYTE *)(a1 + 40))
    {
      v3[32] = 1;
      objc_msgSend(*(id *)(a1 + 32), "_cancelAndReleaseLayoutUpdateSuppressionTimer:", v3);
    }
    else
    {
      v3[32] = 0;
      objc_msgSend(*(id *)(a1 + 32), "_startSuppressingSystemInitiatedLayoutUpdateForTimeInterval:leeway:guardedData:", v3, *(double *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 120));
    }
    v4 = v5;
  }

}

- (id)homeScreenPrediction
{
  _PASQueueLock *lock;
  ATXHomeScreenPrediction *v3;
  ATXHomeScreenPrediction *v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ATXHomeScreenSuggestionClient_homeScreenPrediction__block_invoke;
  v6[3] = &unk_1E4D59D10;
  v6[4] = self;
  v6[5] = &v19;
  v6[6] = &v13;
  v6[7] = &v7;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  if (v20[5] && v14[5])
  {
    v3 = [ATXHomeScreenPrediction alloc];
    v4 = -[ATXHomeScreenPrediction initWithBlendingCacheIdentifier:widgetSuggestions:stacksAffectedByDebugRotation:](v3, "initWithBlendingCacheIdentifier:widgetSuggestions:stacksAffectedByDebugRotation:", v20[5], v14[5], v8[5]);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v4;
}

void __53__ATXHomeScreenSuggestionClient_homeScreenPrediction__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = (void *)*((_QWORD *)v13 + 17);
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_readCachedSuggestionsFromDiskAndUpdateGuardedData:", v13);
    v3 = (void *)*((_QWORD *)v13 + 17);
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_msgSend(*((id *)v13 + 14), "copy");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = objc_msgSend(*((id *)v13 + 18), "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (void)homeScreenPredictionWithReply:(id)a3
{
  id v4;
  NSObject *outputQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  outputQueue = self->_outputQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke;
  v7[3] = &unk_1E4D58780;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(outputQueue, v7);

}

void __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke_cold_1(v2);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "homeScreenPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (void)userDidRemoveSuggestedWidget:(id)a3 fromStackWithIdentifier:(id)a4 prediction:(id)a5
{
  -[ATXHomeScreenSuggestionClient logSupplementaryActionInContextMenu:stackId:widgetOnTop:prediction:](self, "logSupplementaryActionInContextMenu:stackId:widgetOnTop:prediction:", 1, a4, a3, a5);
}

- (void)chronoServiceProvider:(id)a3 finishedPrewarmingSuggestions:(id)a4
{
  id v5;
  _PASQueueLock *lock;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__ATXHomeScreenSuggestionClient_chronoServiceProvider_finishedPrewarmingSuggestions___block_invoke;
  v8[3] = &unk_1E4D59B20;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v8);

}

void __85__ATXHomeScreenSuggestionClient_chronoServiceProvider_finishedPrewarmingSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: chornoServiceProvider finished preparing suggestions, starting suggestion update.", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateKnownWidgetUniqueIdsIfNecessaryWithGuardedData:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_updateGuardedData:withCachedSuggestions:updateProactiveWidgetLayoutsOnly:", v3, *(_QWORD *)(a1 + 40), 0);

}

- (void)chronoServiceProvider:(id)a3 reloadDidCompleteForWidget:(id)a4 success:(BOOL)a5 widgetIsReadyForDisplay:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  _PASQueueLock *lock;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v11 = a4;
  v12 = a7;
  lock = self->_lock;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__ATXHomeScreenSuggestionClient_chronoServiceProvider_reloadDidCompleteForWidget_success_widgetIsReadyForDisplay_error___block_invoke;
  v16[3] = &unk_1E4D59D38;
  v19 = a5;
  v17 = v11;
  v18 = v12;
  v20 = a6;
  v14 = v12;
  v15 = v11;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v16);

}

void __120__ATXHomeScreenSuggestionClient_chronoServiceProvider_reloadDidCompleteForWidget_success_widgetIsReadyForDisplay_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("reloadDidSuccess");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = v9;
  v16[1] = CFSTR("widget");
  v16[2] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
  v13 = (void *)v5[23];

  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordWidgetReloadForSuggestion:date:readyForDisplay:", v14, v15, *(unsigned __int8 *)(a1 + 49));

}

- (void)_updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  +[ATXHomeScreenStackSuggestion stackSuggestionsFromCachedSuggestions:](ATXHomeScreenStackSuggestion, "stackSuggestionsFromCachedSuggestions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke;
  v12[3] = &unk_1E4D59D60;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
  lock = self->_lock;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke_2;
  v10[3] = &unk_1E4D59AF8;
  v11 = v7;
  v9 = v7;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v10);

}

void __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "suggestedWidgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "suggestedWidgets", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "widgetUniqueId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

uint64_t __102__ATXHomeScreenSuggestionClient__updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "notifySuggestedWidgetsToStacksChanged:", *(_QWORD *)(a1 + 32));
}

- (void)blendingLayerDidUpdateHomeScreenCachedSuggestions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *outputQueue;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  __atxlog_handle_home_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: received update from duetexpertd", buf, 2u);
  }

  -[ATXChronoServicesProvider resetToPrewarmWidgetsInSuggestions:](self->_chronoServicesProvider, "resetToPrewarmWidgetsInSuggestions:", v7);
  -[ATXHomeScreenSuggestionClient _updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions:](self, "_updateLoggerStacksToStackSuggestionsFromHomeScreenCachedSuggestions:", v7);

  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__ATXHomeScreenSuggestionClient_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion___block_invoke;
  block[3] = &unk_1E4D59D88;
  v12 = v6;
  v10 = v6;
  dispatch_async(outputQueue, block);

}

uint64_t __94__ATXHomeScreenSuggestionClient_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__ATXHomeScreenSuggestionClient_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4D59DB0;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

uint64_t __110__ATXHomeScreenSuggestionClient_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:(id)a3
{
  _PASQueueLock *lock;
  void (**v4)(id, _QWORD);

  lock = self->_lock;
  v4 = (void (**)(id, _QWORD))a3;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", &__block_literal_global_132);
  v4[2](v4, 0);

}

void __112__ATXHomeScreenSuggestionClient_synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  id v5;

  v3 = (void *)a2[23];
  v4 = a2;
  objc_msgSend(v3, "close");
  v5 = (id)a2[23];
  a2[23] = 0;

}

- (void)forceDebugRotationForStack:(id)a3 extensionBundleId:(id)a4 kind:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASQueueLock *lock;
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
  lock = self->_lock;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__ATXHomeScreenSuggestionClient_forceDebugRotationForStack_extensionBundleId_kind_completion___block_invoke;
  v19[3] = &unk_1E4D59DF8;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v19);

}

void __94__ATXHomeScreenSuggestionClient_forceDebugRotationForStack_extensionBundleId_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  ATXHomeScreenStackSuggestion *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id *v49;
  id obj;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;
  const __CFString *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v65 = 0;
  objc_msgSend(v4, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v65);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v65;
  if (!v6)
  {
    v48 = v5;
    v49 = v3;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
    if (v9)
    {
      v10 = v9;
      v51 = *(_QWORD *)v62;
      v52 = 0;
      obj = v8;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v62 != v51)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v12, "stacks");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v58;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v58 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
                objc_msgSend(v18, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqualToString:", *(_QWORD *)(a1 + 40));

                if (v20)
                {
                  v21 = v18;

                  v52 = v21;
                  goto LABEL_18;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
              if (v15)
                continue;
              break;
            }
          }
LABEL_18:

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
      }
      while (v10);

      if (v52)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v52, "widgets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v54;
LABEL_23:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v26);
            objc_msgSend(v27, "extensionBundleId");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v28, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) != 0)
            {
              objc_msgSend(v27, "widgetKind");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqualToString:", *(_QWORD *)(a1 + 56));

              if ((v30 & 1) != 0)
              {
                v34 = v27;

                v31 = v52;
                if (v34)
                  goto LABEL_37;
                goto LABEL_36;
              }
            }
            else
            {

            }
            if (v24 == ++v26)
            {
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
              if (v24)
                goto LABEL_23;
              break;
            }
          }
        }

        v31 = v52;
LABEL_36:
        v34 = (id)objc_opt_new();
        objc_msgSend(v34, "setExtensionBundleId:", *(_QWORD *)(a1 + 48));
        objc_msgSend(v34, "setWidgetKind:", *(_QWORD *)(a1 + 56));
        objc_msgSend(v34, "setSize:", objc_msgSend(v31, "stackLayoutSize"));
LABEL_37:
        v35 = (void *)objc_msgSend(v49[14], "mutableCopy");
        v36 = [ATXHomeScreenStackSuggestion alloc];
        v37 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v35, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "suggestedWidgets");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[ATXHomeScreenStackSuggestion initForDebuggingWithStackIdentifier:topWidget:suggestedWidgets:](v36, "initForDebuggingWithStackIdentifier:topWidget:suggestedWidgets:", v37, v34, v39);

        objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, *(_QWORD *)(a1 + 40));
        objc_storeStrong(v49 + 14, v35);
        v41 = v49[18];
        if (!v41)
        {
          v42 = objc_opt_new();
          v43 = v49[18];
          v49[18] = (id)v42;

          v41 = v49[18];
        }
        objc_msgSend(v41, "addObject:", *(_QWORD *)(a1 + 40));
        __atxlog_handle_home_screen();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *(_QWORD *)(a1 + 40);
          v46 = *(_QWORD *)(a1 + 48);
          v47 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412802;
          v67 = v45;
          v68 = 2112;
          v69 = v46;
          v70 = 2112;
          v71 = v47;
          _os_log_impl(&dword_1A49EF000, v44, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: forcing debug rotation for stack %@, widget %@, kind %@. Notifying observers.", buf, 0x20u);
        }

        v3 = v49;
        objc_msgSend(*(id *)(a1 + 32), "_notifyObserversAboutSuggestionRefreshWithGuardedData:", v49);
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

        v7 = 0;
        goto LABEL_42;
      }
    }
    else
    {

    }
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v73 = *MEMORY[0x1E0CB2D50];
    v74 = CFSTR("Specified stack not found in home screen config.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", CFSTR("ATXHomeScreenSuggestionClientErrorDomain"), -1, v33);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v3 = v49;
LABEL_42:
    v5 = v48;
    goto LABEL_43;
  }
  v7 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_43:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.proactive.HomeScreenSuggestion.xpc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    ATXHomeScreenSuggestionServerXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v9);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "setInterruptionHandler:", &__block_literal_global_141);
    objc_initWeak(&location, self);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __68__ATXHomeScreenSuggestionClient_listener_shouldAcceptNewConnection___block_invoke_142;
    v18 = &unk_1E4D579D8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "setInvalidationHandler:", &v15);
    ATXHomeScreenSuggestionClientXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v10, v15, v16, v17, v18);

    -[ATXHomeScreenSuggestionClient setXpcConnection:](self, "setXpcConnection:", v7);
    objc_msgSend(v7, "resume");
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: accepts XPC connection: %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v12 = 1;
  }
  else
  {
    __atxlog_handle_home_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenSuggestionClient listener:shouldAcceptNewConnection:].cold.1();

    v12 = 0;
  }

  return v12;
}

void __68__ATXHomeScreenSuggestionClient_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_home_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: XPC connection interrupted.", v1, 2u);
  }

}

void __68__ATXHomeScreenSuggestionClient_listener_shouldAcceptNewConnection___block_invoke_142(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: XPC connection invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

- (void)logWidgetAddedFeaturesInCoreAnalytics:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[ATXHomeScreenSuggestionClient xpcConnection](self, "xpcConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_143);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logWidgetAddedFeaturesInCoreAnalytics:rankOfWidgetInGallery:galleryItems:", v9, a4, v8);

}

void __106__ATXHomeScreenSuggestionClient_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __106__ATXHomeScreenSuggestionClient_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems___block_invoke_cold_1();

}

- (BOOL)hasWidgetBeenSeen:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ATXHomeScreenSuggestionClient_hasWidgetBeenSeen___block_invoke;
  v8[3] = &unk_1E4D59E60;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __51__ATXHomeScreenSuggestionClient_hasWidgetBeenSeen___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a2 + 184), "mostRecentEngagementOfWidget:ofType:", *(_QWORD *)(a1 + 32), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 != 0;

}

- (BOOL)hasWidgetBeenTapped:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ATXHomeScreenSuggestionClient_hasWidgetBeenTapped___block_invoke;
  v8[3] = &unk_1E4D59E60;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __53__ATXHomeScreenSuggestionClient_hasWidgetBeenTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a2 + 184), "mostRecentEngagementOfWidget:ofType:", *(_QWORD *)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 != 0;

}

- (unint64_t)pageIndexOfAppPredictionPanelWithIdentifier:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__ATXHomeScreenSuggestionClient_pageIndexOfAppPredictionPanelWithIdentifier___block_invoke;
  v9[3] = &unk_1E4D59E88;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __77__ATXHomeScreenSuggestionClient_pageIndexOfAppPredictionPanelWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;

  v7 = a2;
  objc_msgSend(v7[10], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    v5 = (void *)objc_opt_new();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "pageIndexOfAppPredictionPanelWithIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7[10], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));

  }
}

- (void)loadHomeScreenPageConfigurationsWithCompletionHandler:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__ATXHomeScreenSuggestionClient_loadHomeScreenPageConfigurationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4D59EB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

void __87__ATXHomeScreenSuggestionClient_loadHomeScreenPageConfigurationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v5 = 0;
  objc_msgSend(v2, "loadHomeScreenPageConfigurationsWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)loadHomeScreenPageConfigurationsWithError:(id *)a3
{
  return -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsWithError:](self->_homeScreenConfigCache, "loadHomeScreenPageConfigurationsWithError:", a3);
}

- (void)writeHomeScreenPageConfigurations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__ATXHomeScreenSuggestionClient_writeHomeScreenPageConfigurations_completionHandler___block_invoke;
  v11[3] = &unk_1E4D59BF8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __85__ATXHomeScreenSuggestionClient_writeHomeScreenPageConfigurations_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeHomeScreenPageConfigurations:guardedData:completionHandler:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

- (void)_writeHomeScreenPageConfigurations:(id)a3 guardedData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  void *v12;
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  BOOL v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)*((_QWORD *)v9 + 19);
    *((_QWORD *)v9 + 19) = v11;

    v10[2](v10, 0);
  }
  else
  {
    homeScreenConfigCache = self->_homeScreenConfigCache;
    v35 = 0;
    v14 = -[ATXHomeScreenConfigCache writeHomeScreenPageConfigurations:error:](homeScreenConfigCache, "writeHomeScreenPageConfigurations:error:", v8, &v35);
    v15 = v35;
    v16 = v15;
    if (v14)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v17 = v8;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v22, "isHidden", (_QWORD)v31) & 1) == 0)
            {
              objc_msgSend(v22, "stacks");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[ATXHomeScreenSuggestionClient _recordSuggestedWidgetIfNecessaryInStacks:guardedData:](self, "_recordSuggestedWidgetIfNecessaryInStacks:guardedData:", v23, v9);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v19);
      }

      objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("Wrote home screen page configurations"));
      *((_BYTE *)v9 + 48) = 1;
      objc_msgSend(*((id *)v9 + 24), "homeScreenOrTodayPageConfigDidChange");
      v24 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_148);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = v25;
      else
        v27 = MEMORY[0x1E0C9AA60];
      v28 = (void *)objc_msgSend(v24, "initWithArray:", v27, (_QWORD)v31);

      v29 = (void *)objc_opt_new();
      objc_msgSend(v29, "removePagesWithIdentifiersNotInSet:", v28);
      v10[2](v10, 0);

    }
    else
    {
      if (v15)
      {
        __atxlog_handle_home_screen();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[ATXHomeScreenSuggestionClient _writeHomeScreenPageConfigurations:guardedData:completionHandler:].cold.1();

      }
      ((void (**)(id, void *))v10)[2](v10, v16);
    }

  }
}

uint64_t __98__ATXHomeScreenSuggestionClient__writeHomeScreenPageConfigurations_guardedData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)writeDockAppList:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ATXHomeScreenSuggestionClient_writeDockAppList_completionHandler___block_invoke;
  v11[3] = &unk_1E4D59BF8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __68__ATXHomeScreenSuggestionClient_writeDockAppList_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeDockAppList:guardedData:completionHandler:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

- (void)_writeDockAppList:(id)a3 guardedData:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  BOOL v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = (void *)MEMORY[0x1E0D81590];
  v11 = a3;
  if (objc_msgSend(v10, "isClassCLocked"))
  {
    v12 = objc_msgSend(v11, "copy");

    v13 = (void *)*((_QWORD *)v8 + 20);
    *((_QWORD *)v8 + 20) = v12;

    v9[2](v9, 0);
  }
  else
  {
    homeScreenConfigCache = self->_homeScreenConfigCache;
    v20 = 0;
    v15 = -[ATXHomeScreenConfigCache writeDockAppList:error:](homeScreenConfigCache, "writeDockAppList:error:", v11, &v20);

    v16 = v20;
    v17 = v16;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("Wrote Dock apps"));
      objc_msgSend(*((id *)v8 + 24), "dockAppListDidChange");
      v18 = 0;
    }
    else
    {
      v18 = v16;
      if (v16)
      {
        __atxlog_handle_home_screen();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[ATXHomeScreenSuggestionClient _writeDockAppList:guardedData:completionHandler:].cold.1();

        v18 = v17;
      }
    }
    ((void (**)(id, id))v9)[2](v9, v18);

  }
}

- (void)writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__ATXHomeScreenSuggestionClient_writeTodayPageStacks_appPredictionPanels_completionHandler___block_invoke;
  v15[3] = &unk_1E4D59F18;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __92__ATXHomeScreenSuggestionClient_writeTodayPageStacks_appPredictionPanels_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeTodayPageStacks:appPredictionPanels:guardedData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));
}

- (void)_writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 guardedData:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)*((_QWORD *)v12 + 21);
    *((_QWORD *)v12 + 21) = v14;

    v16 = objc_msgSend(v11, "copy");
    v17 = (void *)*((_QWORD *)v12 + 22);
    *((_QWORD *)v12 + 22) = v16;

    v13[2](v13, 0);
  }
  else
  {
    homeScreenConfigCache = self->_homeScreenConfigCache;
    v24 = 0;
    v19 = -[ATXHomeScreenConfigCache writeTodayPageStacks:appPredictionPanels:error:](homeScreenConfigCache, "writeTodayPageStacks:appPredictionPanels:error:", v10, v11, &v24);
    v20 = v24;
    v21 = v20;
    if (v19)
    {
      -[ATXHomeScreenSuggestionClient _recordSuggestedWidgetIfNecessaryInStacks:guardedData:](self, "_recordSuggestedWidgetIfNecessaryInStacks:guardedData:", v10, v12);
      objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("Wrote Today page configuration"));
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setPageIndex:", 20000);
      objc_msgSend(v22, "setStacks:", v10);
      objc_msgSend(v22, "setPanels:", v11);
      *((_BYTE *)v12 + 64) = 1;
      objc_msgSend(*((id *)v12 + 24), "homeScreenOrTodayPageConfigDidChange");
      v13[2](v13, 0);

    }
    else
    {
      if (v20)
      {
        __atxlog_handle_home_screen();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[ATXHomeScreenSuggestionClient _writeTodayPageStacks:appPredictionPanels:guardedData:completionHandler:].cold.1();

      }
      ((void (**)(id, void *))v13)[2](v13, v21);
    }

  }
}

- (void)_recordSuggestedWidgetIfNecessaryInStacks:(id)a3 guardedData:(id)a4
{
  id v5;
  _QWORD *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "widgets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (objc_msgSend(v14, "isSuggestedWidget"))
              {
                objc_msgSend(v14, "widgetUniqueId");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15)
                {
                  v16 = (void *)v6[23];
                  objc_msgSend(v14, "widgetUniqueId");
                  v17 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "recordSuggestedWidgetUniqueIdIfNotExist:", v17);
                }
                else
                {
                  __atxlog_handle_home_screen();
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v8, "identifier");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315650;
                    v31 = "-[ATXHomeScreenSuggestionClient _recordSuggestedWidgetIfNecessaryInStacks:guardedData:]";
                    v32 = 2112;
                    v33 = v14;
                    v34 = 2114;
                    v35 = v18;
                    _os_log_fault_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_FAULT, "%s: Suggested widget %@ in stack %{public}@ does not have widgetUniqueId", buf, 0x20u);

                  }
                }

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
          }
          while (v11);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v21);
  }

}

- (void)logWidgetDidAppear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__ATXHomeScreenSuggestionClient_logWidgetDidAppear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E4D59F40;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

void __71__ATXHomeScreenSuggestionClient_logWidgetDidAppear_stackId_prediction___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v4 = *(void **)(a1[4] + 64);
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetDidAppear:date:", v3, v7);

  v8 = (void *)v6[23];
  v9 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEngagementRecordForWidget:date:engagementType:", v9, v10, 3);

  v11 = (void *)v6[24];
  objc_msgSend(v11, "logWidgetDidAppear:stackId:prediction:", a1[5], a1[6], a1[7]);
  objc_msgSend((id)a1[5], "widgetUniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[4];
    v17[0] = CFSTR("uniqueID");
    v17[1] = CFSTR("stackID");
    v15 = a1[6];
    v18[0] = v12;
    v18[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("ATXHomeScreenSuggestionClientTopWidgetDidAppearNotification"), v14, v16);

  }
}

- (void)logStackVisibilityChanged:(id)a3 visibleRect:(CGRect)a4 topWidget:(id)a5 prediction:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  _PASQueueLock *lock;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  lock = self->_lock;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__ATXHomeScreenSuggestionClient_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke;
  v20[3] = &unk_1E4D59F68;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v21 = v13;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v20);

}

uint64_t __92__ATXHomeScreenSuggestionClient_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logStackVisibilityChanged:visibleRect:topWidget:prediction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)logStackDidDisappear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4)
  {
    -[ATXHomeScreenSuggestionClient logWidgetDidDisappear:stackId:prediction:](self, "logWidgetDidDisappear:stackId:prediction:", a4, a3, a5);
  }
  else
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenSuggestionClient logStackDidDisappear:topWidget:prediction:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)logStackDidAppear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4)
  {
    -[ATXHomeScreenSuggestionClient logWidgetDidAppear:stackId:prediction:](self, "logWidgetDidAppear:stackId:prediction:", a4, a3, a5);
  }
  else
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenSuggestionClient logStackDidAppear:topWidget:prediction:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)logHomeScreenDidDisappearWithReason:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ATXHomeScreenSuggestionClient_logHomeScreenDidDisappearWithReason___block_invoke;
  v7[3] = &unk_1E4D59AF8;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

uint64_t __69__ATXHomeScreenSuggestionClient_logHomeScreenDidDisappearWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logHomeScreenDidDisappearWithReason:", *(_QWORD *)(a1 + 32));
}

- (void)logSpecialPageDidAppear:(unint64_t)a3 widgetsByStackId:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  _PASQueueLock *lock;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__ATXHomeScreenSuggestionClient_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke;
  v13[3] = &unk_1E4D59F90;
  v15 = v9;
  v16 = a3;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v13);

}

uint64_t __85__ATXHomeScreenSuggestionClient_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logSpecialPageDidAppear:widgetsByStackId:prediction:", a1[6], a1[4], a1[5]);
}

- (void)logSpecialPageDidDisappear:(unint64_t)a3
{
  _PASQueueLock *lock;
  _QWORD v4[5];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__ATXHomeScreenSuggestionClient_logSpecialPageDidDisappear___block_invoke;
  v4[3] = &__block_descriptor_40_e50_v16__0__ATXHomeScreenSuggestionClientGuardedData_8l;
  v4[4] = a3;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v4);
}

uint64_t __60__ATXHomeScreenSuggestionClient_logSpecialPageDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logSpecialPageDidDisappear:", *(_QWORD *)(a1 + 32));
}

- (void)logStackStatusDidChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5 prediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  _PASQueueLock *lock;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__ATXHomeScreenSuggestionClient_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke;
  v17[3] = &unk_1E4D59FD8;
  v20 = v11;
  v21 = a5;
  v17[4] = self;
  v18 = v12;
  v19 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v17);

}

void __87__ATXHomeScreenSuggestionClient_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v5;
  int v6;
  uint64_t v7;
  id *v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 64);
  if (v3 <= 8 && ((1 << v3) & 0x182) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startSuppressingRotationForTimeInterval:leeway:", *(double *)(*(_QWORD *)(a1 + 32) + 104), *(double *)(*(_QWORD *)(a1 + 32) + 120));
    v3 = *(_QWORD *)(a1 + 64);
  }
  objc_msgSend(*(id *)(a1 + 40), "stacksAffectedByDebugRotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 48));

  if (v6)
    v7 = 9;
  else
    v7 = v3;
  objc_msgSend(v8[24], "logStackStatusDidChange:widgetOnTop:reason:prediction:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_alertUserIfNeededOfStackChange:widgetOnTop:reason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7);

}

- (void)logStackDidTap:(id)a3 engagedUrl:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASQueueLock *lock;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__ATXHomeScreenSuggestionClient_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke;
  v19[3] = &unk_1E4D59F40;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v19);

}

uint64_t __82__ATXHomeScreenSuggestionClient_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;

  v3 = (void *)a2[23];
  v4 = a1[4];
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMostRecentTapOfWidget:date:", v4, v7);

  v8 = (void *)v6[24];
  return objc_msgSend(v8, "logStackDidTap:engagedUrl:widgetOnTop:prediction:", a1[5], a1[6], a1[4], a1[7]);
}

- (void)logStackDidTap:(id)a3 widgetOnTop:(id)a4 prediction:(id)a5
{
  -[ATXHomeScreenSuggestionClient logStackDidTap:engagedUrl:widgetOnTop:prediction:](self, "logStackDidTap:engagedUrl:widgetOnTop:prediction:", a3, 0, a4, a5);
}

- (void)logSupplementaryActionInContextMenu:(unint64_t)a3 stackId:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  _PASQueueLock *lock;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke;
  v17[3] = &unk_1E4D59FD8;
  v20 = v12;
  v21 = a3;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v17);

}

void __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke_2;
  v30[3] = &unk_1E4D57590;
  v30[4] = *(_QWORD *)(a1 + 32);
  v4 = (void (**)(_QWORD))MEMORY[0x1A85A511C](v30);
  v5 = *(_QWORD *)(a1 + 64);
  switch(v5)
  {
    case 3:
LABEL_7:
      v4[2](v4);
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "extensionBundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CF9480]);

      if (v15)
      {
        v16 = (void *)*((_QWORD *)v3 + 12);
        objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "minSuggestionListInLayout");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_dismissSuggestions:guardedData:fromSuggestionsWidget:dismissFromAllUIs:duration:", v19, v3, *(_QWORD *)(a1 + 40), 0, 604800.0);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "appBundleId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        v21 = (objc_class *)MEMORY[0x1E0C99E20];
        v22 = v20;
        v23 = [v21 alloc];
        v24 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
        v25 = v24;
        if (v24)
          v26 = v24;
        else
          v26 = (id)objc_opt_new();
        v27 = v26;

        v28 = (void *)objc_msgSend(v23, "initWithArray:", v27);
        objc_msgSend(v28, "addObject:", v22);

        CFPreferencesSetAppValue(CFSTR("SBSearchDisabledShortcuts"), (CFPropertyListRef)objc_msgSend(v28, "allObjects"), CFSTR("com.apple.spotlightui"));
        CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.spotlightui.prefschanged"), 0, 0, 1u);

      }
      v4[2](v4);

      break;
    case 1:
      __atxlog_handle_home_screen();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "extensionBundleId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *((_QWORD *)v3 + 25);
        *(_DWORD *)buf = 138412546;
        v32 = v7;
        v33 = 2048;
        v34 = v8;
        _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "Recording dismiss once for %@ with widget dismiss manager: %p", buf, 0x16u);

      }
      v9 = (void *)*((_QWORD *)v3 + 25);
      objc_msgSend(*(id *)(a1 + 40), "extensionBundleId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "widgetKind");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "intent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userDidDismissSuggestionForWidget:kind:intent:atDate:duration:", v10, v11, v12, v13, 0.0);

      goto LABEL_7;
  }
  objc_msgSend(*((id *)v3 + 24), "logSupplementaryActionInContextMenu:stackId:widgetOnTop:prediction:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

uint64_t __100__ATXHomeScreenSuggestionClient_logSupplementaryActionInContextMenu_stackId_widgetOnTop_prediction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSuppressingRotationForTimeInterval:leeway:", *(double *)(*(_QWORD *)(a1 + 32) + 104), *(double *)(*(_QWORD *)(a1 + 32) + 120));
}

- (void)logUserDidChangeStackConfiguration:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ATXHomeScreenSuggestionClient_logUserDidChangeStackConfiguration___block_invoke;
  v7[3] = &unk_1E4D59AF8;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

uint64_t __68__ATXHomeScreenSuggestionClient_logUserDidChangeStackConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidChangeStackConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)logUserDidAddApp:(id)a3 page:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__ATXHomeScreenSuggestionClient_logUserDidAddApp_page___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __55__ATXHomeScreenSuggestionClient_logUserDidAddApp_page___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidAddApp:page:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logUserDidRemoveApp:(id)a3 page:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ATXHomeScreenSuggestionClient_logUserDidRemoveApp_page___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __58__ATXHomeScreenSuggestionClient_logUserDidRemoveApp_page___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidRemoveApp:page:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logUserDidAddPinnedWidget:(id)a3 page:(id)a4 defaultsComparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__ATXHomeScreenSuggestionClient_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke;
  v15[3] = &unk_1E4D59CC0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __83__ATXHomeScreenSuggestionClient_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidAddPinnedWidget:page:defaultsComparator:", a1[4], a1[5], a1[6]);
}

- (void)logUserDidDeletePinnedWidget:(id)a3 stackLocation:(unint64_t)a4 page:(id)a5
{
  id v8;
  id v9;
  _PASQueueLock *lock;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__ATXHomeScreenSuggestionClient_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke;
  v13[3] = &unk_1E4D59F90;
  v15 = v9;
  v16 = a4;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v13);

}

uint64_t __81__ATXHomeScreenSuggestionClient_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidDeletePinnedWidget:stackLocation:page:", a1[4], a1[6], a1[5]);
}

- (void)logUserDidAddWidgetToStack:(id)a3 stackIdentifier:(id)a4 isSuggestion:(BOOL)a5
{
  id v8;
  id v9;
  _PASQueueLock *lock;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__ATXHomeScreenSuggestionClient_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke;
  v13[3] = &unk_1E4D5A000;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v13);

}

uint64_t __89__ATXHomeScreenSuggestionClient_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidAddWidgetToStack:stackIdentifier:isSuggestion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)logUserDidDeleteWidgetOnStack:(id)a3 stackIdentifier:(id)a4 stackKind:(unint64_t)a5 stackLocation:(unint64_t)a6
{
  id v10;
  id v11;
  _PASQueueLock *lock;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a4;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__ATXHomeScreenSuggestionClient_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke;
  v15[3] = &unk_1E4D5A028;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __103__ATXHomeScreenSuggestionClient_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidDeleteWidgetOnStack:stackIdentifier:stackKind:stackLocation:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)logUserDidCreateStack:(id)a3 page:(id)a4 isSuggestion:(BOOL)a5
{
  id v8;
  id v9;
  _PASQueueLock *lock;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__ATXHomeScreenSuggestionClient_logUserDidCreateStack_page_isSuggestion___block_invoke;
  v13[3] = &unk_1E4D5A050;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v13);

}

uint64_t __73__ATXHomeScreenSuggestionClient_logUserDidCreateStack_page_isSuggestion___block_invoke(uint64_t a1, void *a2)
{
  double *v3;
  double v4;
  double v5;
  _QWORD *v6;
  void *v7;

  v3 = *(double **)(a1 + 32);
  v4 = v3[13];
  v5 = v3[15];
  v6 = a2;
  objc_msgSend(v3, "startSuppressingRotationForTimeInterval:leeway:", v4, v5);
  v7 = (void *)v6[24];

  return objc_msgSend(v7, "logUserDidCreateStack:page:isSuggestion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)logUserDidDeleteStack:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 page:(id)a6
{
  id v10;
  id v11;
  _PASQueueLock *lock;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a6;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__ATXHomeScreenSuggestionClient_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke;
  v15[3] = &unk_1E4D5A028;
  v18 = a4;
  v19 = a5;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __84__ATXHomeScreenSuggestionClient_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidDeleteStack:stackKind:stackLocation:page:", a1[4], a1[6], a1[7], a1[5]);
}

- (void)logDeviceLock
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke_2;
  v4[3] = &unk_1E4D59AF8;
  v4[4] = v1;
  return objc_msgSend(v2, "runAsyncWithLockAcquired:", v4);
}

uint64_t __46__ATXHomeScreenSuggestionClient_logDeviceLock__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_refreshInferredEngagementStatusForWidgetSuggestions:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "resetAllTracking");
  v5 = (void *)v4[24];

  return objc_msgSend(v5, "logDeviceLock");
}

- (void)logDeviceUnlock
{
  -[_PASQueueLock runAsyncWithLockAcquired:](self->_lock, "runAsyncWithLockAcquired:", &__block_literal_global_157_0);
}

uint64_t __48__ATXHomeScreenSuggestionClient_logDeviceUnlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logDeviceUnlock");
}

- (void)logWidgetInsertionDidFailInStack:(id)a3 prediction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  objc_msgSend(a4, "suggestionForStackIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[ATXHomeScreenSuggestionClient logWidgetInsertionDidFailInStack:prediction:].cold.1(v7, (uint64_t)v5, v8);

}

- (void)logWidgetDidAppear:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ATXHomeScreenSuggestionClient_logWidgetDidAppear_blendingCacheId___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __68__ATXHomeScreenSuggestionClient_logWidgetDidAppear_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logWidgetDidAppear:blendingCacheId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logWidgetDidDisappear:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_blendingCacheId___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __71__ATXHomeScreenSuggestionClient_logWidgetDidDisappear_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logWidgetDidDisappear:blendingCacheId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logSuggestionsDidAppear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__ATXHomeScreenSuggestionClient_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D59CC0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __80__ATXHomeScreenSuggestionClient_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logSuggestionsDidAppear:widget:blendingCacheId:", a1[4], a1[5], a1[6]);
}

- (void)logSuggestionsDidDisappear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__ATXHomeScreenSuggestionClient_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D59CC0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __83__ATXHomeScreenSuggestionClient_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logSuggestionsDidDisappear:widget:blendingCacheId:", a1[4], a1[5], a1[6]);
}

- (void)logWidgetOccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__ATXHomeScreenSuggestionClient_logWidgetOccluded_blendingCacheId___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __67__ATXHomeScreenSuggestionClient_logWidgetOccluded_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logWidgetOccluded:blendingCacheId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logWidgetUnoccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ATXHomeScreenSuggestionClient_logWidgetUnoccluded_blendingCacheId___block_invoke;
  v11[3] = &unk_1E4D59B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

uint64_t __69__ATXHomeScreenSuggestionClient_logWidgetUnoccluded_blendingCacheId___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logWidgetUnoccluded:blendingCacheId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logDidTapSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__ATXHomeScreenSuggestionClient_logDidTapSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D59CC0;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __76__ATXHomeScreenSuggestionClient_logDidTapSuggestion_widget_blendingCacheId___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;

  v3 = (void *)a2[23];
  v4 = a1[4];
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMostRecentTapOfWidget:date:", v4, v7);

  v8 = (void *)v6[24];
  return objc_msgSend(v8, "logDidTapSuggestion:widget:blendingCacheId:", a1[5], a1[4], a1[6]);
}

- (void)_dismissSuggestions:(id)a3 guardedData:(id)a4 fromSuggestionsWidget:(id)a5 dismissFromAllUIs:(BOOL)a6 duration:(double)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v8 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = (void *)*((_QWORD *)a4 + 25);
  objc_msgSend(v13, "extensionBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widgetKind");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  objc_msgSend(v13, "intent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userDidDismissSuggestionForWidget:kind:intent:atDate:duration:", v15, v16, v17, v18, a7);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    if (v8)
      v23 = 120;
    else
      v23 = 8;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v25, "executableSpecification");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "executableType");

        if (v27 == 1)
          v28 = 8;
        else
          v28 = v23;
        -[ATXEngagementRecordManager addHiddenSuggestion:duration:engagementRecordType:](self->_engagementRecordManager, "addHiddenSuggestion:duration:engagementRecordType:", v25, v28, 691200.0);
        -[ATXActionPredictionClient removeActionPredictionNotificationsMatchingSuggestion:reply:](self->_actionPredictionClient, "removeActionPredictionNotificationsMatchingSuggestion:reply:", v25, 0);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

}

- (void)logContextMenuDismissOnceForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ATXHomeScreenSuggestionClient *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__ATXHomeScreenSuggestionClient_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D59F40;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __95__ATXHomeScreenSuggestionClient_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D811A8];
    objc_msgSend(*(id *)(a1 + 32), "executableSpecification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForExecutableType:", objc_msgSend(v10, "executableType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: handling dismiss once for suggestion with uuid: %{public}@ executable description: %@ executable type: %{public}@", buf, 0x20u);

  }
  v12 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_dismissSuggestions:guardedData:fromSuggestionsWidget:dismissFromAllUIs:duration:", v13, v3, *(_QWORD *)(a1 + 48), 1, 3600.0);

  objc_msgSend(*(id *)(a1 + 40), "_replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v3);
  v14 = (void *)v3[24];

  return objc_msgSend(v14, "logContextMenuDismissOnceForSuggestion:widget:blendingCacheId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)logContextMenuNeverShowAgainForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ATXHomeScreenSuggestionClient *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__ATXHomeScreenSuggestionClient_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D59F40;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

uint64_t __98__ATXHomeScreenSuggestionClient_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D811A8];
    objc_msgSend(*(id *)(a1 + 32), "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForExecutableType:", objc_msgSend(v8, "executableType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: handling never show again for suggestion with uuid: %{public}@ executable type: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addHiddenSuggestion:duration:engagementRecordType:", *(_QWORD *)(a1 + 32), 120, 86400.0);
  objc_msgSend(*(id *)(a1 + 40), "_toggleSiriSearchSettingsOffForAppSuggestion:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v3);
  v10 = (void *)v3[24];

  return objc_msgSend(v10, "logContextMenuNeverShowAgainForSuggestion:widget:blendingCacheId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)logUserDidStartWidgetOnboarding
{
  -[_PASQueueLock runAsyncWithLockAcquired:](self->_lock, "runAsyncWithLockAcquired:", &__block_literal_global_158);
}

uint64_t __64__ATXHomeScreenSuggestionClient_logUserDidStartWidgetOnboarding__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidStartWidgetOnboarding");
}

- (void)logUserDidAcceptWidgetOnboardingSuggestion:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__ATXHomeScreenSuggestionClient_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke;
  v7[3] = &unk_1E4D59AF8;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

uint64_t __76__ATXHomeScreenSuggestionClient_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidAcceptWidgetOnboardingSuggestion:", *(_QWORD *)(a1 + 32));
}

- (void)logUserDidRejectWidgetOnboardingSuggestion:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__ATXHomeScreenSuggestionClient_logUserDidRejectWidgetOnboardingSuggestion___block_invoke;
  v7[3] = &unk_1E4D59AF8;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

uint64_t __76__ATXHomeScreenSuggestionClient_logUserDidRejectWidgetOnboardingSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidRejectWidgetOnboardingSuggestion:", *(_QWORD *)(a1 + 32));
}

- (void)logUserDidEnterEditModeForWidgetOnboarding
{
  -[_PASQueueLock runAsyncWithLockAcquired:](self->_lock, "runAsyncWithLockAcquired:", &__block_literal_global_159);
}

uint64_t __75__ATXHomeScreenSuggestionClient_logUserDidEnterEditModeForWidgetOnboarding__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidEnterEditModeForWidgetOnboarding");
}

- (void)logUserDidSwitchHomeScreenExperience:(unint64_t)a3
{
  _PASQueueLock *lock;
  _QWORD v4[5];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__ATXHomeScreenSuggestionClient_logUserDidSwitchHomeScreenExperience___block_invoke;
  v4[3] = &__block_descriptor_40_e50_v16__0__ATXHomeScreenSuggestionClientGuardedData_8l;
  v4[4] = a3;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v4);
}

uint64_t __70__ATXHomeScreenSuggestionClient_logUserDidSwitchHomeScreenExperience___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 192), "logUserDidSwitchHomeScreenExperience:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_replaceSuggestionIfNeeded:(id)a3 fromProactiveWidget:(id)a4 guardedData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "extensionBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  if ((v12 & 1) != 0)
  {
    v13 = 11;
  }
  else
  {
    objc_msgSend(v9, "extensionBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

    if ((v15 & 1) != 0)
    {
      v13 = 19;
    }
    else
    {
      __atxlog_handle_home_screen();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[ATXHomeScreenSuggestionClient _replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

      v13 = 3;
    }
  }
  v24 = -[ATXEngagementRecordManager hasEngagedWithSuggestion:engagementRecordType:](self->_engagementRecordManager, "hasEngagedWithSuggestion:engagementRecordType:", v8, v13);
  __atxlog_handle_home_screen();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 136315650;
    v32 = "-[ATXHomeScreenSuggestionClient _replaceSuggestionIfNeeded:fromProactiveWidget:guardedData:]";
    v33 = 2114;
    v34 = v27;
    v35 = 1024;
    v36 = v24;
    _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "%s: suggestionID %{public}@, isSuggestionReplacementNeeded %{BOOL}u", (uint8_t *)&v31, 0x1Cu);

  }
  if (v24)
  {
    objc_msgSend(v8, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenSuggestionClient _replaceSuggestionForAllProactiveWidgets:guardedData:](self, "_replaceSuggestionForAllProactiveWidgets:guardedData:", v29, v10);

  }
  return v24;
}

- (void)_replaceSuggestionForAllProactiveWidgets:(id)a3 guardedData:(id)a4
{
  double rotationSuppressionInterval;
  double timerLeeway;
  id v8;
  id v9;

  rotationSuppressionInterval = self->_rotationSuppressionInterval;
  timerLeeway = self->_timerLeeway;
  v8 = a4;
  v9 = a3;
  -[ATXHomeScreenSuggestionClient _startSuppressingRotationForTimeInterval:leeway:guardedData:](self, "_startSuppressingRotationForTimeInterval:leeway:guardedData:", v8, rotationSuppressionInterval, timerLeeway);
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:shouldSuggestionsBeDisjoint:guardedData:", v9, 0, v8);

  -[ATXHomeScreenSuggestionClient _notifyObserversAboutLayoutUpdateWithGuardedData:](self, "_notifyObserversAboutLayoutUpdateWithGuardedData:", v8);
  objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("Replaced suggestion for all widgets"));
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  objc_msgSend(v3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0C99E20]);
    v10 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v11 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v12 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = (id)objc_opt_new();
    v15 = v14;

    v16 = (void *)objc_msgSend(v9, "initWithArray:", v15);
    objc_msgSend(v16, "addObject:", v8);
    CFPreferencesSetAppValue(CFSTR("SBSearchSuggestAppDisabled"), (CFPropertyListRef)objc_msgSend(v16, "allObjects"), CFSTR("com.apple.spotlightui"));
    CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), v10, v11);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.spotlightui.prefschanged"), 0, 0, 1u);

    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "toggled siri & search settings for spotlight OFF for app prediction: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenSuggestionClient _toggleSiriSearchSettingsOffForAppSuggestion:].cold.1(v3, (uint64_t)v7, v8);
  }

}

- (id)_newSuggestionLayoutForOldLayout:(id)a3 replacedSuggestionId:(id)a4 shouldSuggestionsBeDisjoint:(BOOL)a5 usedFallbackIndexSet:(id)a6 guardedData:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "oneByOneSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v16, 1, v13, v8, v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "oneByTwoSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v17, 2, v13, v8, v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "twoByTwoSuggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v18, 3, v13, v8, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "oneByFourSuggestions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v19, 5, v13, v8, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "twoByFourSuggestions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v21, 4, v13, v8, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "fourByFourSuggestions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v23, 6, v13, v8, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "fourByEightSuggestions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenSuggestionClient _replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:](self, "_replaceSuggestionWithId:fromSuggestionsArray:suggestionLayoutType:usedFallbackIndexSet:shouldSuggestionsBeDisjoint:guardedData:", v14, v25, 7, v13, v8, v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81220]), "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", objc_msgSend(v15, "layoutType"), v33, v32, v31, v20, v22, v24, v26);
  objc_msgSend(v15, "layoutScore");
  objc_msgSend(v27, "setLayoutScore:");
  objc_msgSend(v15, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUuid:", v28);

  objc_msgSend(v27, "setIsValidForSuggestionsWidget:", objc_msgSend(v15, "isValidForSuggestionsWidget"));
  objc_msgSend(v27, "setConfidenceWarrantsSnappingOrNPlusOne:", objc_msgSend(v15, "confidenceWarrantsSnappingOrNPlusOne"));
  objc_msgSend(v27, "setIsNPlusOne:", objc_msgSend(v15, "isNPlusOne"));
  objc_msgSend(v15, "widgetUniqueId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setWidgetUniqueId:", v29);
  return v27;
}

- (void)_replaceSuggestionWithId:(id)a3 shouldSuggestionsBeDisjoint:(BOOL)a4 guardedData:(id)a5
{
  id v6;
  id *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v26[5];
  id v27;
  id *v28;
  id v29;
  uint64_t *v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;
  id *v34;
  id v35;
  uint64_t *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a5;
  v8 = v7 + 12;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7[12], "count"));
  v10 = v7 + 13;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7[13], "count"));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  v43 = (id)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v13 = v7[12];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke;
  v32[3] = &unk_1E4D5A0B8;
  v32[4] = self;
  v14 = v6;
  v37 = a4;
  v33 = v14;
  v36 = &v38;
  v15 = v7;
  v34 = v15;
  v16 = v9;
  v23 = v9;
  v35 = v23;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v32);
  v17 = *v10;
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2;
  v26[3] = &unk_1E4D5A0B8;
  v26[4] = self;
  v18 = v14;
  v31 = a4;
  v27 = v18;
  v30 = &v38;
  v19 = v15;
  v28 = v19;
  v20 = v11;
  v29 = v20;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v26);
  objc_storeStrong(v8, v16);
  objc_storeStrong(v10, v11);
  objc_msgSend(v19[15], "removeObjectsAtIndexes:", v39[5]);
  __atxlog_handle_home_screen();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*v8, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v22;
    _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenSuggestionClient: setting new suggestion widget layouts after replacement: %{public}@", buf, 0xCu);

  }
  _Block_object_dispose(&v38, 8);

}

void __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = a2;
  v11 = (id)objc_msgSend(v5, "_newSuggestionLayoutForOldLayout:replacedSuggestionId:shouldSuggestionsBeDisjoint:usedFallbackIndexSet:guardedData:", a3, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v10);

}

void __98__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = a2;
  v11 = (id)objc_msgSend(v5, "_newSuggestionLayoutForOldLayout:replacedSuggestionId:shouldSuggestionsBeDisjoint:usedFallbackIndexSet:guardedData:", a3, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v10);

}

- (id)_replaceSuggestionWithId:(id)a3 fromSuggestionsArray:(id)a4 suggestionLayoutType:(int64_t)a5 usedFallbackIndexSet:(id)a6 shouldSuggestionsBeDisjoint:(BOOL)a7 guardedData:(id)a8
{
  id v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  id *v27;
  id v28;
  uint64_t *v29;
  int64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = (id *)a8;
  if (v15)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v42 = objc_msgSend(v15, "count");
    v18 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke;
    v36[3] = &unk_1E4D5A0E0;
    v37 = v14;
    v38 = &v39;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v36);
    v19 = v40[3];
    if (v19 == objc_msgSend(v15, "count"))
    {
      v20 = v15;
    }
    else
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v35 = objc_msgSend(v17[15], "count");
      v21 = v17[15];
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2;
      v26[3] = &unk_1E4D5A108;
      v26[4] = self;
      v27 = v17;
      v31 = a7;
      v22 = v16;
      v29 = &v32;
      v30 = a5;
      v28 = v22;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v26);
      v23 = v33[3];
      if (v23 == objc_msgSend(v17[15], "count"))
      {
        v20 = v15;
      }
      else
      {
        objc_msgSend(v17[15], "objectAtIndexedSubscript:", v33[3]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addIndex:", v33[3]);
        v20 = (id)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v20, "replaceObjectAtIndex:withObject:", v40[3], v24);

      }
      _Block_object_dispose(&v32, 8);
    }

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __161__ATXHomeScreenSuggestionClient__replaceSuggestionWithId_fromSuggestionsArray_suggestionLayoutType_usedFallbackIndexSet_shouldSuggestionsBeDisjoint_guardedData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (objc_msgSend(v7, "isValidForSuggestionsWidget")
    && (objc_msgSend(*(id *)(a1 + 32), "_isFallbackSuggestionUsed:guardedData:", v7, *(_QWORD *)(a1 + 40)) & 1) == 0
    && (!*(_BYTE *)(a1 + 72) || (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a3) & 1) == 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v7, "uiSpecification", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLayoutConfigs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "applicableLayoutType") == *(_QWORD *)(a1 + 64))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
            *a4 = 1;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (double)rotationSuppressionInterval
{
  return self->_rotationSuppressionInterval;
}

- (void)setRotationSuppressionInterval:(double)a3
{
  self->_rotationSuppressionInterval = a3;
}

- (double)layoutUpdateSuppressionInterval
{
  return self->_layoutUpdateSuppressionInterval;
}

- (void)setLayoutUpdateSuppressionInterval:(double)a3
{
  self->_layoutUpdateSuppressionInterval = a3;
}

- (double)timerLeeway
{
  return self->_timerLeeway;
}

- (void)setTimerLeeway:(double)a3
{
  self->_timerLeeway = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsafeXPCConnection, 0);
  objc_storeStrong((id *)&self->_atxDefaults, 0);
  objc_storeStrong((id *)&self->_chronoServicesProvider, 0);
  objc_storeStrong((id *)&self->_actionPredictionClient, 0);
  objc_storeStrong((id *)&self->_widgetDwellTracker, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_uiCacheManager, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_74_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "ATXHomeScreenSuggestionClient: Device is Class-C unlocked, but still could not access ATXInformationStore.", a5, a6, a7, a8, 0);
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_2_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write staged home screen page configurations post-class C unlock with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write staged dock app list post-class C unlock with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __201__ATXHomeScreenSuggestionClient_initWithHomeScreenConfigCache_engagementRecordManager_widgetDwellTracker_widgetDismissManager_uiCacheManager_actionPredictionClient_chronoServicesProvider_store_logger___block_invoke_78_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write staged today page stacks and panels post-class C unlock with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadKnownHomeScreenProactiveWidgetUniqueIds
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: Unable to load known HomeScreen proactive widget unique IDs - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadKnownTodayPageProactiveWidgetUniqueIds
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: Unable to load known TodayPage proactive widget unique IDs - %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_knownProactiveWidgetUniqueIdentifiersInPages:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl(&dword_1A49EF000, a4, OS_LOG_TYPE_FAULT, "ATXHomeScreenSuggestionClient: Proactive widget in stack %{public}@ does not have widget unique ID.", a1, 0xCu);

}

void __78__ATXHomeScreenSuggestionClient_layoutForSuggestionsWidget_completionHandler___block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_10_0(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v1, v2, "%s: unsupported layout size %lu", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

void __79__ATXHomeScreenSuggestionClient_layoutForAppPredictionPanel_completionHandler___block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_10_0(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v1, v2, "%s: unsupported layout size %lu", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "uiSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_4(&dword_1A49EF000, v3, v4, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: %@ is already marked as used", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "uiSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_4(&dword_1A49EF000, v3, v4, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: found %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __88__ATXHomeScreenSuggestionClient_isSuggestionReplacementAvailableForSuggestion_inLayout___block_invoke_2_cold_3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "uiSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_4(&dword_1A49EF000, v3, v4, "ATXHomeScreenSuggestionClient: isSuggestionReplacementAvailableForSuggestion: %@ is not valid", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __69__ATXHomeScreenSuggestionClient_unusedFallbackAppSuggestionsForPage___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "We have an app prediction fallback without a valid executable object", a5, a6, a7, a8, 0);
}

void __63__ATXHomeScreenSuggestionClient_homeScreenPredictionWithReply___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXHomeScreenSuggestionClient homeScreenPredictionWithReply:]_block_invoke";
  _os_log_debug_impl(&dword_1A49EF000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v1, (uint64_t)v1, "ATXHomeScreenSuggestionClient: Rejecting connection %{public}@ without entitlement %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __106__ATXHomeScreenSuggestionClient_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXHomeScreenSuggestionClient logWidgetAddedFeaturesInCoreAnalytics:rankOfWidgetInGallery:galleryItems:]_block_invoke";
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v0, v1, "%s: error with xpc connection to logWidgetAddedFeaturesInCoreAnalytics: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)_writeHomeScreenPageConfigurations:guardedData:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write home screen page configurations with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_writeDockAppList:guardedData:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write dock app list with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_writeTodayPageStacks:appPredictionPanels:guardedData:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXHomeScreenSuggestionClient: failed to write today page stacks and panels with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)logStackDidDisappear:(uint64_t)a3 topWidget:(uint64_t)a4 prediction:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a1, a3, "%s: invoked with nil top widget", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logStackDidAppear:(uint64_t)a3 topWidget:(uint64_t)a4 prediction:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a1, a3, "%s: invoked with nil top widget", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logWidgetInsertionDidFailInStack:(NSObject *)a3 prediction:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "widgetUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extensionBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v6;
  OUTLINED_FUNCTION_9_2();
  v10 = 2114;
  v11 = a2;
  _os_log_fault_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_FAULT, "ATXHomeScreenSuggestionClient: Failed to insert N+1 widget %{public}@ (extensionBundleId %@) for stack %{public}@", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_2_5();
}

- (void)_replaceSuggestionIfNeeded:(uint64_t)a3 fromProactiveWidget:(uint64_t)a4 guardedData:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a1, a3, "%s: widget not Suggestions Widget or App Prediction Panel. New proactive widget needs to be explicitly handled.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D811A8];
  objc_msgSend(a1, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForExecutableType:", objc_msgSend(v5, "executableType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[ATXHomeScreenSuggestionClient _toggleSiriSearchSettingsOffForAppSuggestion:]";
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_ERROR, "%s: attempted to toggle siri & search settings off for non-app executable type: %{public}@ class: %{public}@", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_2_5();
}

@end
