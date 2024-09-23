@implementation _ATXAppInstallMonitor

- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _ATXAppInstallMonitor *v8;

  v4 = a3;
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = -[_ATXAppInstallMonitor initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:](self, "initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:", v4, v5, v6, v7, 1);

  return v8;
}

- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3 shouldSynchronousUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _ATXAppInstallMonitor *v10;

  v4 = a4;
  v6 = a3;
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = -[_ATXAppInstallMonitor initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:](self, "initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:", v6, v7, v8, v9, v4);

  return v10;
}

- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3 histogramBundleIdTable:(id)a4 appIconState:(id)a5 webClipDataStore:(id)a6 shouldSynchronousUpdate:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  _ATXAppInstallMonitor *v17;
  _ATXAppInstallMonitor *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *installQueue;
  uint64_t v22;
  NSDictionary *assetData;
  id v24;
  void *v25;
  uint64_t v26;
  NSSet *preInstalledNewSystemApps;
  void *v28;
  NSObject *v29;
  objc_super v31;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v31.receiver = self;
  v31.super_class = (Class)_ATXAppInstallMonitor;
  v17 = -[_ATXAppInstallMonitor init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_appInfoManager, a3);
    objc_storeStrong((id *)&v18->_histogramBundleIdTable, a4);
    objc_storeStrong((id *)&v18->_appIconState, a5);
    objc_storeStrong((id *)&v18->_webClipDataStore, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.duetexpertd._ATXAppInstallMonitor.installQueue", v19);
    installQueue = v18->_installQueue;
    v18->_installQueue = (OS_dispatch_queue *)v20;

    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v22 = objc_claimAutoreleasedReturnValue();
    assetData = v18->_assetData;
    v18->_assetData = (NSDictionary *)v22;

    v24 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v25 = (void *)objc_msgSend(v24, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    if (objc_msgSend(v25, "BOOLForKey:", CFSTR("crystalMigration")))
    {
      v26 = objc_msgSend((id)objc_opt_class(), "newPreInstalledAppSet");
      preInstalledNewSystemApps = v18->_preInstalledNewSystemApps;
      v18->_preInstalledNewSystemApps = (NSSet *)v26;

    }
    objc_msgSend(v13, "allAppsWithInstallDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v28, "count") && v7)
      -[_ATXAppInstallMonitor synchronousUpdateAndBackdate:](v18, "synchronousUpdateAndBackdate:", 1);
    __atxlog_handle_default();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[_ATXAppInstallMonitor initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:].cold.1();

  }
  return v18;
}

- (void)start
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_receivedInstallNotification_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_receivedUninstallNotification_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

}

- (void)stop
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

}

- (void)dealloc
{
  objc_super v3;

  -[_ATXAppInstallMonitor stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppInstallMonitor;
  -[_ATXAppInstallMonitor dealloc](&v3, sel_dealloc);
}

- (void)train
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v9 = 136446210;
    v10 = "_ATXInstallMonitor";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v9, 0xCu);
  }

  -[_ATXAppInstallMonitor synchronousUpdateAndBackdate:](self, "synchronousUpdateAndBackdate:", 0);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = 136446210;
    v10 = "_ATXInstallMonitor";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v8, OS_SIGNPOST_INTERVAL_END, v4, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v9, 0xCu);
  }

}

- (BOOL)restoreInProgress
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0CF76B0], "sessionsWithSessionTypeIdentifier:", *MEMORY[0x1E0CF7658]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      -[_ATXAppInstallMonitor restoreInProgress].cold.1();
  }
  else if (v5)
  {
    -[_ATXAppInstallMonitor restoreInProgress].cold.2();
  }

  return v3 != 0;
}

- (void)synchronousUpdateWithUninstallWaitTime:(unint64_t)a3 andBackdate:(BOOL)a4
{
  NSObject *installQueue;
  _QWORD block[6];
  BOOL v6;

  installQueue = self->_installQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76___ATXAppInstallMonitor_synchronousUpdateWithUninstallWaitTime_andBackdate___block_invoke;
  block[3] = &unk_1E82DD3E0;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_sync(installQueue, block);
}

- (void)synchronousUpdateAndBackdate:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_assetData, "objectForKeyedSubscript:", CFSTR("Wait time after notification before data deletion"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInstallMonitor synchronousUpdateWithUninstallWaitTime:andBackdate:](self, "synchronousUpdateWithUninstallWaitTime:andBackdate:", objc_msgSend(v5, "unsignedIntegerValue"), v3);

}

- (void)noSyncUpdateWithWaitTime:(unint64_t)a3 andBackdate:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void (**updateCompletionBlock)(void);
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  OS_dispatch_queue *installQueue;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(id, uint64_t, uint64_t, uint64_t);
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[8];
  _QWORD aBlock[5];

  v4 = a4;
  v7 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[_ATXAppInstallMonitor _fetchAllAppsWithInstallDateFromDatastore](self, "_fetchAllAppsWithInstallDateFromDatastore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInstallMonitor _fetchAllApps](self, "_fetchAllApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = +[_ATXAppInstallMonitor removeIntersectionBetweenSet:set:](_ATXAppInstallMonitor, "removeIntersectionBetweenSet:set:", v10, v8);
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInstallMonitor handleInstallationOfApps:isFromNotification:andBackdate:](self, "handleInstallationOfApps:isFromNotification:andBackdate:", v12, 0, v4);

  if (-[_ATXAppInstallMonitor restoreInProgress](self, "restoreInProgress"))
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_ATXAppInstallMonitor noSyncUpdateWithWaitTime:andBackdate:].cold.1();

    updateCompletionBlock = (void (**)(void))self->_updateCompletionBlock;
    if (updateCompletionBlock)
      updateCompletionBlock[2]();
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke;
    aBlock[3] = &unk_1E82DD408;
    aBlock[4] = self;
    v16 = _Block_copy(aBlock);
    if (a3 && objc_msgSend(v8, "count"))
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Requesting async app removal", buf, 2u);
      }

      v18 = (void *)MEMORY[0x1E0D81598];
      installQueue = self->_installQueue;
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke_33;
      v24[3] = &unk_1E82DB0F0;
      v26 = v16;
      v25 = v8;
      objc_msgSend(v18, "runAsyncOnQueue:afterDelaySeconds:block:", installQueue, v24, (double)a3);

    }
    else if (objc_msgSend(v8, "count"))
    {
      (*((void (**)(void *, void *, void *))v16 + 2))(v16, v8, v9);
    }
    v23 = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_updateCompletionBlock;
    if (v23)
      v23[2](v23, v20, v21, v22);

  }
  objc_autoreleasePoolPop(v7);
}

- (void)receivedStateChangeNotification:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "app install monitor got LS state change notification", v4, 2u);
  }

  ATXUpdatePredictionsImmediatelyWithReason(17);
}

- (void)receivedInstallNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_ATXAppInstallMonitor receivedInstallNotification:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  if (v6)
    -[_ATXAppInstallMonitor _receivedInstallNotificationWithApps:placeholderInstallNotification:](self, "_receivedInstallNotificationWithApps:placeholderInstallNotification:", v6, v8);

}

- (void)_receivedInstallNotificationWithApps:(id)a3 placeholderInstallNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  int v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[ATXInternalAppRegistrationNotification postNotificationWithInstallDictionary:](ATXInternalAppRegistrationNotification, "postNotificationWithInstallDictionary:", v6);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInstallMonitor _fetchAllAppsWithInstallDateFromDatastore](self, "_fetchAllAppsWithInstallDateFromDatastore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);
  v9 = objc_msgSend(v7, "count");
  if (v4)
  {
    if (v9)
    {
      v28 = v8;
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v7;
        v40 = 1024;
        v41 = 1;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Applications Installed: %@; isPlaceholder: %{BOOL}u",
          buf,
          0x12u);
      }

      v11 = (void *)objc_opt_new();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            if (objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstallingForBundle:", v17))
              objc_msgSend(v11, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v14);
      }

      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v7, "allObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXAppInstallMonitor _appInfoDictWithBackDate:isFromNotification:newApps:](self, "_appInfoDictWithBackDate:isFromNotification:newApps:", 0, 1, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        +[ATXInternalAppsInstallStartNotification postNotificationWithInstallStartDictionary:](ATXInternalAppsInstallStartNotification, "postNotificationWithInstallStartDictionary:", v19);
      }
      v8 = v28;
    }
    else
    {
      v11 = (void *)objc_opt_new();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v21 = v6;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (objc_msgSend(MEMORY[0x1E0CF8CE8], "isOffloadedForBundle:", v26))
              objc_msgSend(v11, "addObject:", v26);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v23);
      }

      if (objc_msgSend(v11, "count"))
      {
        +[ATXInternalOffloadAppsNotification postNotificationWithOffloadSet:](ATXInternalOffloadAppsNotification, "postNotificationWithOffloadSet:", v11);
        __atxlog_handle_default();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "app install monitor got app offload notification", buf, 2u);
        }

      }
    }
LABEL_34:

    goto LABEL_35;
  }
  if (v9)
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v7;
      v40 = 1024;
      v41 = 0;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "Applications Installed: %@; isPlaceholder: %{BOOL}u",
        buf,
        0x12u);
    }

    objc_msgSend(v7, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppInstallMonitor handleInstallationOfApps:isFromNotification:andBackdate:](self, "handleInstallationOfApps:isFromNotification:andBackdate:", v11, 1, 0);
    goto LABEL_34;
  }
LABEL_35:

}

- (void)receivedUninstallNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_ATXAppInstallMonitor receivedUninstallNotification:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  if (v6)
    -[_ATXAppInstallMonitor _receivedUninstallNotificationWithApps:placeholderUninstallNotification:](self, "_receivedUninstallNotificationWithApps:placeholderUninstallNotification:", v6, v8);

}

- (void)_receivedUninstallNotificationWithApps:(id)a3 placeholderUninstallNotification:(BOOL)a4
{
  if (!a4)
    -[_ATXAppInstallMonitor handleUninstallationOfApps:](self, "handleUninstallationOfApps:", a3);
}

+ (id)newPreInstalledAppSet
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1CAA48B6C](a1, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.GenerativePlaygroundApp"), CFSTR("com.apple.printcenter"), CFSTR("com.apple.TVRemoteUIService"), CFSTR("com.apple.Passwords"), CFSTR("com.apple.calculator"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

+ (id)appDirectoryAppCategoryMappings
{
  return (id)objc_msgSend(MEMORY[0x1E0CF8CA0], "hardcodedAppCategoryMappings");
}

- (id)_appInfoDictWithBackDate:(BOOL)a3 isFromNotification:(BOOL)a4 newApps:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "appInfoDictWithBackDate:assetData:newPreInstalledAppSet:isFromNotification:newApps:", v6, self->_assetData, self->_preInstalledNewSystemApps, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)appInfoDictWithBackDate:(BOOL)a3 assetData:(id)a4 newPreInstalledAppSet:(id)a5 isFromNotification:(BOOL)a6 newApps:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  int *v40;
  NSObject *v41;
  const char *v42;
  id v44;
  uint64_t v45;
  id v46;
  id v48;
  id v49;
  _BOOL4 v50;
  uint8_t v51;
  char v52[15];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  NSObject *v58;
  __int16 v59;
  NSObject *v60;
  _BYTE v61[128];
  uint64_t v62;

  v50 = a6;
  v62 = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v49 = a5;
  v9 = a7;
  v48 = (id)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v11)
  {
    v12 = v11;
    v13 = &dword_1C9A3B000;
    v14 = *(_QWORD *)v54;
    v15 = 0x1E0CF8000uLL;
    v45 = *(_QWORD *)v54;
    v46 = v10;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v10);
        v17 = *(NSObject **)(*((_QWORD *)&v53 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1CAA48B6C]();
        __atxlog_handle_app_install();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          _os_log_impl(v13, v19, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: Adding install date for recently installed app: %@", buf, 0xCu);
        }

        if (objc_msgSend(*(id *)(v15 + 3304), "isAppClipForBundleId:", v17))
        {
          __atxlog_handle_app_install();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            goto LABEL_41;
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          v21 = v13;
          v22 = v20;
          v23 = "ATXAppInstallMonitor: Not adding app clip to appInfoDict: %@";
LABEL_14:
          _os_log_impl(v21, v22, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
          goto LABEL_41;
        }
        if (objc_msgSend(*(id *)(v15 + 3304), "isLaunchProhibitedForBundle:", v17))
        {
          __atxlog_handle_app_install();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            goto LABEL_41;
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          v21 = v13;
          v22 = v20;
          v23 = "ATXAppInstallMonitor: Launch prohibited for bundle: %@";
          goto LABEL_14;
        }
        objc_msgSend(*(id *)(v15 + 3304), "registrationDateForBundle:", v17);
        v24 = objc_claimAutoreleasedReturnValue();
        __atxlog_handle_app_install();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v58 = v24;
          v59 = 2112;
          v60 = v17;
          _os_log_impl(v13, v25, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: LS install date: %{public}@ for: %@", buf, 0x16u);
        }

        if (!v24 && v50)
        {
          __atxlog_handle_app_install();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            +[_ATXAppInstallMonitor appInfoDictWithBackDate:assetData:newPreInstalledAppSet:isFromNotification:newApps:].cold.1(&v51, v52, v26);

          v24 = objc_opt_new();
        }
        if (a3 || objc_msgSend(*(id *)(v15 + 3304), "isRestoreInstallTypeForBundle:", v17))
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("Backdate time for backup restore apps"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject dateByAddingTimeInterval:](v24, "dateByAddingTimeInterval:", (double)-objc_msgSend(v27, "integerValue"));
          v20 = objc_claimAutoreleasedReturnValue();

          __atxlog_handle_app_install();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v17;
            v59 = 2114;
            v60 = v20;
            _os_log_impl(v13, v28, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: Backdating install date for: %@ to: %{public}@", buf, 0x16u);
          }

        }
        else
        {
          v20 = v24;
        }
        v29 = v13;
        objc_msgSend((id)objc_opt_class(), "appDirectoryAppCategoryMappings");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        v32 = (void *)MEMORY[0x1E0C99E60];
        if (v31)
        {
          objc_msgSend(v30, "allKeys");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setWithArray:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v34 = (void *)objc_opt_new();
        }
        v35 = objc_msgSend(v49, "containsObject:", v17);
        v36 = objc_msgSend(v34, "containsObject:", v17);
        v37 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isInternalOrSystemAppForBundleId:", v17) ^ 1 | v35;
        if (v50)
        {
          v10 = v46;
          if (((v37 | v36) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1.0);
            v38 = objc_claimAutoreleasedReturnValue();

            __atxlog_handle_app_install();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v17;
              v40 = v29;
              v41 = v39;
              v42 = "ATXAppInstallMonitor: LS notification: Backdating install date for system or internal app that is no"
                    "t approved or new in Azul, Crystal - %@";
              goto LABEL_38;
            }
            goto LABEL_39;
          }
        }
        else
        {
          v10 = v46;
          if ((v37 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1.0);
            v38 = objc_claimAutoreleasedReturnValue();

            __atxlog_handle_app_install();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v17;
              v40 = v29;
              v41 = v39;
              v42 = "ATXAppInstallMonitor: No LS notification: Backdating install date for system or internal app that is"
                    " not new in Azul, Crystal - %@";
LABEL_38:
              _os_log_impl(v40, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
            }
LABEL_39:

            v20 = v38;
          }
        }
        v13 = v29;
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v20, v17);

        v14 = v45;
        v15 = 0x1E0CF8000;
LABEL_41:

        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v12 != v16);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v12);
  }

  return v48;
}

- (void)handleInstallationOfApps:(id)a3 isFromNotification:(BOOL)a4 andBackdate:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  id v8;

  -[_ATXAppInstallMonitor _appInfoDictWithBackDate:isFromNotification:newApps:](self, "_appInfoDictWithBackDate:isFromNotification:newApps:", a5, a4, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    -[_ATXAppInstallMonitor notifyInstallationOfAppsWithInstallDictionary:](self, "notifyInstallationOfAppsWithInstallDictionary:", v8);

}

- (void)handleUninstallationOfApps:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_ATXAppInstallMonitor webClipsForRemovedApps:](self, "webClipsForRemovedApps:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Removing data for uninstalled app(s): %@ and app clip(s): %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[_ATXAppInstallMonitor notifyUninstallationOfAppsWithBundleIdsToRemoveSet:](self, "notifyUninstallationOfAppsWithBundleIdsToRemoveSet:", v8);

}

- (void)notifyInstallationOfAppsWithInstallDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_app_install();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: Received app install notification: %@", (uint8_t *)&v6, 0xCu);
  }

  +[_ATXInternalInstallNotification postNotificationWithInstallDictionary:](_ATXInternalInstallNotification, "postNotificationWithInstallDictionary:", v4);
  -[_ATXAppInfoManager handleAppInstallWithInstallDict:](self->_appInfoManager, "handleAppInstallWithInstallDict:", v4);
  ATXUpdatePredictionsImmediatelyWithReason(16);

}

- (void)notifyUninstallationOfAppsWithBundleIdsToRemoveSet:(id)a3
{
  ATXHistogramBundleIdTable *histogramBundleIdTable;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  histogramBundleIdTable = self->_histogramBundleIdTable;
  v5 = a3;
  +[_ATXInternalUninstallNotification postNotificationWithUninstallSet:histogramBundleIdTable:](_ATXInternalUninstallNotification, "postNotificationWithUninstallSet:histogramBundleIdTable:", v5, histogramBundleIdTable);
  -[_ATXAppInfoManager handleAppUninstallWithUninstalledAppSet:](self->_appInfoManager, "handleAppUninstallWithUninstalledAppSet:", v5);

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "App install monitor got app uninstall notification", v7, 2u);
  }

  ATXUpdatePredictionsImmediatelyWithReason(16);
}

- (id)webClipsForRemovedApps:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[ATXWebClipDataStore webClipBundleIdsForAppClip:](self->_webClipDataStore, "webClipBundleIdsForAppClip:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)_fetchAllApps
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[_ATXAppIconState allAppsKnownToSpringBoard](self->_appIconState, "allAppsKnownToSpringBoard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return v5;
}

- (id)_fetchAllAppsFromDatastore
{
  void *v2;
  void *v3;

  -[_ATXAppInfoManager allApps](self->_appInfoManager, "allApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (id)_fetchAllAppsWithInstallDateFromDatastore
{
  void *v2;
  void *v3;

  -[_ATXAppInfoManager allAppsWithInstallDate](self->_appInfoManager, "allAppsWithInstallDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)removeIntersectionBetweenSet:(id)a3 set:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v9 = objc_msgSend(v8, "count");
  v10 = v8;
  v11 = v7;
  if (v9 < objc_msgSend(v7, "count"))
  {

    v10 = v7;
    v11 = v8;
  }
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v12, "intersectSet:", v10);
  objc_msgSend(v7, "minusSet:", v12);
  objc_msgSend(v8, "minusSet:", v12);

  return v12;
}

- (void)setUpdateCompletionBlock:(id)a3
{
  void *v4;
  id updateCompletionBlock;

  v4 = _Block_copy(a3);
  updateCompletionBlock = self->_updateCompletionBlock;
  self->_updateCompletionBlock = v4;

}

- (NSSet)preInstalledNewSystemApps
{
  return self->_preInstalledNewSystemApps;
}

- (void)setPreInstalledNewSystemApps:(id)a3
{
  objc_storeStrong((id *)&self->_preInstalledNewSystemApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preInstalledNewSystemApps, 0);
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_histogramBundleIdTable, 0);
  objc_storeStrong((id *)&self->_webClipDataStore, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
}

- (void)initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "_ATXAppInfoManager initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)restoreInProgress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Restore not in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)noSyncUpdateWithWaitTime:andBackdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Recently restored. Won't purge data this time...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receivedInstallNotification:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "applications installed: %@", a5, a6, a7, a8, 2u);
}

- (void)receivedUninstallNotification:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "applications uninstalled: %@", a5, a6, a7, a8, 2u);
}

+ (void)appInfoDictWithBackDate:(os_log_t)log assetData:newPreInstalledAppSet:isFromNotification:newApps:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXAppInstallMonitor: LS app registration date shouldn't be nil, falling back to now", buf, 2u);
}

@end
