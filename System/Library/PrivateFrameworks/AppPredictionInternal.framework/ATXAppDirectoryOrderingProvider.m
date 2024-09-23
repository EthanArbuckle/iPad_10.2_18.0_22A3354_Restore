@implementation ATXAppDirectoryOrderingProvider

void __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", *(_QWORD *)(a1 + 40));

  if (v7 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 48)) == -1)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

      v9 = v11;
      if (v10 >= 8)
      {
        *a4 = 1;
        goto LABEL_8;
      }
    }
    else
    {

      v9 = v11;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  else
  {
    *a4 = 1;
    v9 = v11;
  }
LABEL_8:

}

- (void)_postPredictedAppsAndRecentsUpdateNotificationWithReason:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("Unknown");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  __atxlog_handle_app_library();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: posted predicted/recents update notification with reason %@", (uint8_t *)&v7, 0xCu);
  }

  -[ATXAppDirectoryOrderingProvider _createHomeScreenServiceIfNecessary](self, "_createHomeScreenServiceIfNecessary");
  -[SBSHomeScreenService requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:](self->_sbsHomeScreenService, "requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:", v5, 0);

}

- (void)_createHomeScreenServiceIfNecessary
{
  SBSHomeScreenService *v3;
  SBSHomeScreenService *sbsHomeScreenService;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sbsHomeScreenService)
  {
    objc_msgSend(MEMORY[0x1E0DAAE90], "atx_sharedInstance");
    v3 = (SBSHomeScreenService *)objc_claimAutoreleasedReturnValue();
    sbsHomeScreenService = self->_sbsHomeScreenService;
    self->_sbsHomeScreenService = v3;

  }
}

uint64_t __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v7);
  if (!v9)
    v9 = objc_msgSend(v5, "compare:", v6);

  return v9;
}

- (void)_updateRecents
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: App Clip is disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)_writeRecentsToDisk
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend((id)objc_opt_class(), "_reorderedRecentApps:", self->_recentApps);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Writing recents pod with:\n%@", (uint8_t *)&v7, 0xCu);
  }

  v5 = -[ATXAppDirectoryOrderingProvider _writeToDisk:cache:logIdentifier:](self, "_writeToDisk:cache:logIdentifier:", v3, self->_recentsCache, CFSTR("recent apps"));
  return v5;
}

- (BOOL)_writeToDisk:(id)a3 cache:(id)a4 logIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  if (v8 && v9)
  {
    if (objc_msgSend(v9, "storeSecureCodedObject:error:", v8, 0))
    {
      __atxlog_handle_app_library();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Write %@ to disk succeeded", (uint8_t *)&v14, 0xCu);
      }

      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)_updateAppClipSinceDate:(id)a3 installDates:(id)a4
{
  id v6;
  id v7;
  ATXAppClipUsageDuetDataProvider *appClipDataProvider;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  appClipDataProvider = self->_appClipDataProvider;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  -[ATXDuetDataProvider fetchEventsBetweenStartDate:andEndDate:withPredicates:limit:ascending:](appClipDataProvider, "fetchEventsBetweenStartDate:andEndDate:withPredicates:limit:ascending:", v6, v9, 0, 1000, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "webClipBundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          __atxlog_handle_app_library();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v16;
            _os_log_fault_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_FAULT, "ATXAppDirectoryOrderingProvider: webAppBundleId should not be nil for an ATXAppClipUsageDuetEvent. Event: %@", buf, 0xCu);
          }
          goto LABEL_12;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v16, "launchDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v16, "launchDate");
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v17);
LABEL_12:

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v13);
  }

}

- (void)updateRecents
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ATXAppDirectoryOrderingProvider_updateRecents__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_23);
  return (id)sharedInstance_provider;
}

+ (id)_reorderedRecentApps:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke;
  v27[3] = &unk_1E82DC570;
  v7 = v3;
  v28 = v7;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke_2;
  v18[3] = &unk_1E82DC598;
  v11 = v7;
  v19 = v11;
  v12 = v10;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v23;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
  v14 = v24[3];
  if (v14 == objc_msgSend(v8, "count"))
  {
    v15 = v8;
  }
  else
  {
    objc_msgSend(v8, "subarrayWithRange:", 0, v24[3]);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  _Block_object_dispose(&v23, 8);
  objc_autoreleasePoolPop(v4);

  return v16;
}

- (void)_updateCategoriesForDownweightedAppSet:(id)a3
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v20, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Updating for downweighted apps: %@", buf, 0xCu);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_categories;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "appBundleIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __74__ATXAppDirectoryOrderingProvider__updateCategoriesForDownweightedAppSet___block_invoke;
        v21[3] = &unk_1E82DC5E8;
        v22 = v20;
        v14 = v12;
        v23 = v14;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);

        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v11, "appBundleIDs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          v8 |= -[ATXAppDirectoryOrderingProvider _shiftAppIndices:category:](self, "_shiftAppIndices:category:", v14, v16);
          objc_msgSend(v11, "updateAppBundleIDs:", v16);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);

    if ((v8 & 1) != 0)
    {
      __atxlog_handle_app_library();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: There're differences. Refreshing cache for downeighted apps", buf, 2u);
      }

      -[ATXAppDirectoryOrderingProvider _writeCategoriesToDisk](self, "_writeCategoriesToDisk");
      -[ATXAppDirectoryOrderingProvider _postUpdateNotificationWithReason:](self, "_postUpdateNotificationWithReason:", CFSTR("Apps offloaded or disallowed changed"));
      goto LABEL_20;
    }
  }
  else
  {

  }
  __atxlog_handle_app_library();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: There's no handled downweighted apps", buf, 2u);
  }

LABEL_20:
}

uint64_t __74__ATXAppDirectoryOrderingProvider__updateCategoriesForDownweightedAppSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  return result;
}

uint64_t __48__ATXAppDirectoryOrderingProvider_updateRecents__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateRecents");
  return objc_msgSend(*(id *)(a1 + 32), "_postPredictedAppsAndRecentsUpdateNotificationWithReason:", CFSTR("Recents update requested"));
}

uint64_t __49__ATXAppDirectoryOrderingProvider_sharedInstance__block_invoke()
{
  ATXAppDirectoryOrderingProvider *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v0 = [ATXAppDirectoryOrderingProvider alloc];
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0CF94C0]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXAppDirectoryCache"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v1, "initWithCacheFilePath:loggingHandle:debugName:", v21, v20, CFSTR("App Library categories cache"));
  +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0CF94C0]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", *MEMORY[0x1E0CF92E8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "initWithCacheFilePath:loggingHandle:debugName:", v19, v18, CFSTR("App Library recents cache"));
  v4 = objc_alloc(MEMORY[0x1E0CF94C0]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", *MEMORY[0x1E0CF92A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCacheFilePath:loggingHandle:debugName:", v5, v6, CFSTR("App Library hidden apps cache"));
  v8 = (void *)objc_opt_new();
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXAppDirectoryOrderingProvider initWithAppInfoManager:cache:blacklist:recentsCache:hiddenAppsCache:appClipDataProvider:appIconState:appClipChangeListener:histogramManager:](v0, "initWithAppInfoManager:cache:blacklist:recentsCache:hiddenAppsCache:appClipDataProvider:appIconState:appClipChangeListener:histogramManager:", v15, v17, v16, v3, v7, v8, v9, v10, v11);
  v13 = (void *)sharedInstance_provider;
  sharedInstance_provider = v12;

  return objc_msgSend((id)sharedInstance_provider, "setUp");
}

- (ATXAppDirectoryOrderingProvider)initWithAppInfoManager:(id)a3 cache:(id)a4 blacklist:(id)a5 recentsCache:(id)a6 hiddenAppsCache:(id)a7 appClipDataProvider:(id)a8 appIconState:(id)a9 appClipChangeListener:(id)a10 histogramManager:(id)a11
{
  id v17;
  id v18;
  id v19;
  ATXAppDirectoryOrderingProvider *v20;
  objc_class *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  uint64_t v27;
  _ATXInternalInstallNotification *installNotification;
  uint64_t v29;
  _ATXInternalUninstallNotification *uninstallNotification;
  uint64_t v31;
  ATXInternalOffloadAppsNotification *offloadNotification;
  uint64_t v33;
  ATXInternalAppsInstallStartNotification *installingNotification;
  uint64_t v35;
  ATXInternalLockedOrHiddenAppNotification *hiddenAppNotification;
  uint64_t v37;
  ATXInternalUnLockedOrUnHiddenAppNotification *unhiddenAppNotification;
  uint64_t v39;
  NSDate *lastUpdatePostTime;
  id v41;
  uint64_t v42;
  NSUserDefaults *atxDefaults;
  _ATXInternalInstallNotification *v44;
  uint64_t v45;
  ATXInternalUnLockedOrUnHiddenAppNotification *v46;
  ATXInternalAppsInstallStartNotification *v47;
  _ATXInternalUninstallNotification *v48;
  ATXInternalLockedOrHiddenAppNotification *v49;
  ATXInternalOffloadAppsNotification *v50;
  ATXAppClipUsageDuetContextUpdateListener *appClipChangeListener;
  NSObject *v52;
  uint64_t v53;
  NSSet *blacklistedBundleIds;
  ATXAppPredictionBlacklist *blacklist;
  uint64_t v56;
  NSSet *v57;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v60;
  id v61;
  id v62;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD handler[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id location;
  objc_super v91;

  v17 = a3;
  v64 = a4;
  v18 = a4;
  v62 = a5;
  v19 = a5;
  v71 = a6;
  v70 = a7;
  v69 = a8;
  v68 = a9;
  v67 = a10;
  v66 = a11;
  v91.receiver = self;
  v91.super_class = (Class)ATXAppDirectoryOrderingProvider;
  v20 = -[ATXAppDirectoryOrderingProvider init](&v91, sel_init);
  if (v20)
  {
    v65 = v19;
    v60 = v18;
    v61 = v17;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const char *)objc_msgSend(v22, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create(v23, v24);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v25;

    objc_storeStrong((id *)&v20->_infoManager, a3);
    v27 = objc_opt_new();
    installNotification = v20->_installNotification;
    v20->_installNotification = (_ATXInternalInstallNotification *)v27;

    v29 = objc_opt_new();
    uninstallNotification = v20->_uninstallNotification;
    v20->_uninstallNotification = (_ATXInternalUninstallNotification *)v29;

    v31 = objc_opt_new();
    offloadNotification = v20->_offloadNotification;
    v20->_offloadNotification = (ATXInternalOffloadAppsNotification *)v31;

    v33 = objc_opt_new();
    installingNotification = v20->_installingNotification;
    v20->_installingNotification = (ATXInternalAppsInstallStartNotification *)v33;

    v35 = objc_opt_new();
    hiddenAppNotification = v20->_hiddenAppNotification;
    v20->_hiddenAppNotification = (ATXInternalLockedOrHiddenAppNotification *)v35;

    v37 = objc_opt_new();
    unhiddenAppNotification = v20->_unhiddenAppNotification;
    v20->_unhiddenAppNotification = (ATXInternalUnLockedOrUnHiddenAppNotification *)v37;

    objc_storeStrong((id *)&v20->_cache, v64);
    objc_storeStrong((id *)&v20->_recentsCache, a6);
    objc_storeStrong((id *)&v20->_hiddenAppsCache, a7);
    objc_storeStrong((id *)&v20->_appClipDataProvider, a8);
    objc_storeStrong((id *)&v20->_appIconState, a9);
    objc_storeStrong((id *)&v20->_appLaunchHistogramManager, a11);
    objc_storeStrong((id *)&v20->_appClipChangeListener, a10);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v39 = objc_claimAutoreleasedReturnValue();
    lastUpdatePostTime = v20->_lastUpdatePostTime;
    v20->_lastUpdatePostTime = (NSDate *)v39;

    v41 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v42 = objc_msgSend(v41, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    atxDefaults = v20->_atxDefaults;
    v20->_atxDefaults = (NSUserDefaults *)v42;

    -[ATXAppDirectoryOrderingProvider _registerForManagedAppsOrgInfoChangedNotification](v20, "_registerForManagedAppsOrgInfoChangedNotification");
    -[ATXAppDirectoryOrderingProvider _registerForManagedAppsChangedNotification](v20, "_registerForManagedAppsChangedNotification");
    objc_initWeak(&location, v20);
    v44 = v20->_installNotification;
    v45 = MEMORY[0x1E0C809B0];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke;
    v88[3] = &unk_1E82DC438;
    objc_copyWeak(&v89, &location);
    -[_ATXInternalInstallNotification registerForNotificationsWithInstallBlock:](v44, "registerForNotificationsWithInstallBlock:", v88);
    v46 = v20->_unhiddenAppNotification;
    v86[0] = v45;
    v86[1] = 3221225472;
    v86[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_62;
    v86[3] = &unk_1E82DC460;
    objc_copyWeak(&v87, &location);
    -[ATXInternalUnLockedOrUnHiddenAppNotification registerForNotificationsWithUnLockedOrUnHiddenAppBlock:](v46, "registerForNotificationsWithUnLockedOrUnHiddenAppBlock:", v86);
    v47 = v20->_installingNotification;
    v84[0] = v45;
    v84[1] = 3221225472;
    v84[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_67;
    v84[3] = &unk_1E82DC438;
    objc_copyWeak(&v85, &location);
    -[ATXInternalAppsInstallStartNotification registerForNotificationsWithInstallStartBlock:](v47, "registerForNotificationsWithInstallStartBlock:", v84);
    v48 = v20->_uninstallNotification;
    v82[0] = v45;
    v82[1] = 3221225472;
    v82[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_71;
    v82[3] = &unk_1E82DAE98;
    objc_copyWeak(&v83, &location);
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v48, "registerForNotificationsWithUninstallBlock:", v82);
    v49 = v20->_hiddenAppNotification;
    v80[0] = v45;
    v80[1] = 3221225472;
    v80[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_74;
    v80[3] = &unk_1E82DC488;
    objc_copyWeak(&v81, &location);
    -[ATXInternalLockedOrHiddenAppNotification registerForNotificationsWithLockedOrHiddenAppBlock:](v49, "registerForNotificationsWithLockedOrHiddenAppBlock:", v80);
    v50 = v20->_offloadNotification;
    v78[0] = v45;
    v78[1] = 3221225472;
    v78[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_79;
    v78[3] = &unk_1E82DAE98;
    objc_copyWeak(&v79, &location);
    -[ATXInternalOffloadAppsNotification registerForNotificationWithOffloadBlock:](v50, "registerForNotificationWithOffloadBlock:", v78);
    appClipChangeListener = v20->_appClipChangeListener;
    v76[0] = v45;
    v76[1] = 3221225472;
    v76[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_81;
    v76[3] = &unk_1E82DC4B0;
    objc_copyWeak(&v77, &location);
    -[ATXAppClipUsageDuetContextUpdateListener startListeningWithCallback:clientId:](appClipChangeListener, "startListeningWithCallback:clientId:", v76, CFSTR("ATXAppDirectoryOrderingProvider"));
    v52 = v20->_queue;
    handler[0] = v45;
    handler[1] = 3221225472;
    handler[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_3;
    handler[3] = &unk_1E82DC4D8;
    objc_copyWeak(&v75, &location);
    notify_register_dispatch("com.apple.suggestions.settingsChanged", &v20->_settingsChangedToken, v52, handler);
    if (v65)
    {
      objc_storeStrong((id *)&v20->_blacklist, v62);
      -[ATXAppPredictionBlacklist disabledBundleIds](v20->_blacklist, "disabledBundleIds");
      v53 = objc_claimAutoreleasedReturnValue();
      blacklistedBundleIds = v20->_blacklistedBundleIds;
      v20->_blacklistedBundleIds = (NSSet *)v53;

      blacklist = v20->_blacklist;
      v72[0] = v45;
      v72[1] = 3221225472;
      v72[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_90;
      v72[3] = &unk_1E82DB988;
      objc_copyWeak(&v73, &location);
      -[ATXAppPredictionBlacklist registerPrefsChangeHandler:](blacklist, "registerPrefsChangeHandler:", v72);
      objc_destroyWeak(&v73);
    }
    else
    {
      v56 = objc_opt_new();
      v57 = v20->_blacklistedBundleIds;
      v20->_blacklistedBundleIds = (NSSet *)v56;

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v20, (CFNotificationCallback)updateCache, CFSTR("com.apple.Proactive.UpdateAppLibraryCache"), 0, CFNotificationSuspensionBehaviorDrop);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v81);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&v85);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&location);
    v18 = v60;
    v17 = v61;
    v19 = v65;
  }

  return v20;
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v3, "count"))
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2;
    v6[3] = &unk_1E82DACB0;
    v7 = WeakRetained;
    v8 = v3;
    dispatch_async(v5, v6);

  }
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = +[ATXBackupService isBackupRestore](ATXBackupService, "isBackupRestore");
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Install finish notification received; isRestore=%{BOOL}d",
      (uint8_t *)v6,
      8u);
  }

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_updateRecentsForInstalledApps:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateCategoriesForInstalledApps:", v5);

}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_62(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  _QWORD *v9;
  id v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "unHiddenApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained && objc_msgSend(v6, "count"))
  {
    v7 = WeakRetained[3];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_63;
    v8[3] = &unk_1E82DACB0;
    v9 = WeakRetained;
    v10 = v6;
    dispatch_async(v7, v8);

  }
}

uint64_t __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_63(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Unhidden app notification received", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateRecentsForUnhiddenApps:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateCategoriesForUnhiddenApps:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateHiddenAppsPodWithNotification:", CFSTR("App un-hidden"));
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v3, "count"))
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_68;
    v6[3] = &unk_1E82DACB0;
    v7 = WeakRetained;
    v8 = v3;
    dispatch_async(v5, v6);

  }
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_68(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = +[ATXBackupService isBackupRestore](ATXBackupService, "isBackupRestore");
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Install start notification received; isRestore=%{BOOL}d",
      (uint8_t *)v4,
      8u);
  }

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateRecentsForInstalledApps:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_postUpdateNotificationWithReason:", CFSTR("App install initiated"));
  }
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v3, "count"))
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_72;
    v6[3] = &unk_1E82DACB0;
    v7 = WeakRetained;
    v8 = v3;
    dispatch_async(v5, v6);

  }
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_72(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Uninstall notification received", v7, 2u);
  }

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsForKeys:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_writeRecentsToDisk");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateCategoriesForUninstalledApps:", v6);

}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_74(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "hiddenApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained && objc_msgSend(v6, "count"))
  {
    v7 = WeakRetained[3];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_75;
    v8[3] = &unk_1E82DACB0;
    v9 = v6;
    v10 = WeakRetained;
    dispatch_async(v7, v8);

  }
}

uint64_t __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_75(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Hidden app notification received", buf, 2u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "_writeRecentsToDisk");
  objc_msgSend(*(id *)(a1 + 40), "_updateCategoriesForHiddenApps:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_updateHiddenAppsPodWithNotification:", CFSTR("App hidden"));
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v3, "count"))
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_80;
    v6[3] = &unk_1E82DACB0;
    v7 = WeakRetained;
    v8 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_80(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Offload notification received", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateCategoriesForDownweightedAppSet:", *(_QWORD *)(a1 + 40));
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_82;
    v7[3] = &unk_1E82DACB0;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_82(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecentsForAppClipUsageEvent:", *(_QWORD *)(a1 + 40));
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_app_library();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_3_cold_1();

    objc_msgSend(WeakRetained, "_postPredictedAppsAndRecentsUpdateNotificationWithReason:", CFSTR("Suggestions Settings Changed"));
  }

}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_90(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_91;
    block[3] = &unk_1E82DAC38;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_2_91(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t v7[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Blacklist update notification received", v7, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "disabledBundleIds");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_updateCategoriesForDownweightedAppSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
}

- (void)setUp
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATXAppDirectoryOrderingProvider_setUp__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__ATXAppDirectoryOrderingProvider_setUp__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_initCategories");
  objc_msgSend(*(id *)(a1 + 32), "_updateRecents");
  return objc_msgSend(*(id *)(a1 + 32), "_updateHiddenAppsPodWithNotification:", CFSTR("Hidden apps pod initialized"));
}

- (void)updateCacheWithActivity:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  ATXAppDirectoryOrderingProvider *v12;
  void (**v13)(id, _QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v6, "didDefer"))
  {
    __atxlog_handle_app_library();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Deferring XPC update", buf, 2u);
    }

    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__ATXAppDirectoryOrderingProvider_updateCacheWithActivity_completionHandler___block_invoke;
    block[3] = &unk_1E82DC500;
    v11 = v6;
    v12 = self;
    v13 = v7;
    dispatch_async(queue, block);

  }
}

void __77__ATXAppDirectoryOrderingProvider_updateCacheWithActivity_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;

  v2 = (void *)os_transaction_create();
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_app_library();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v10 = 0;
    v4 = (uint8_t *)&v10;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateAppLaunchCounts");
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_app_library();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v9 = 0;
    v4 = (uint8_t *)&v9;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateRecents");
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_app_library();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v8 = 0;
    v4 = (uint8_t *)&v8;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateCategoriesWithRetries:", 2);
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_app_library();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v7 = 0;
    v4 = (uint8_t *)&v7;
LABEL_13:
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Deferring XPC update", v4, 2u);
LABEL_14:

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateHiddenAppsPodWithNotification:", CFSTR("Hidden apps pod updated"));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);
LABEL_16:

}

- (id)description
{
  NSObject *queue;
  __CFString *v3;
  __CFString *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__ATXAppDirectoryOrderingProvider_description__block_invoke;
  v6[3] = &unk_1E82DC528;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (__CFString *)v8[5];
  if (!v3)
    v3 = &stru_1E82FDC98;
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__ATXAppDirectoryOrderingProvider_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_postUpdateNotificationWithReason:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  NSDate *v7;
  NSDate *lastUpdatePostTime;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("Unknown");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  __atxlog_handle_app_library();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: posted category update notification with reason %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdatePostTime = self->_lastUpdatePostTime;
  self->_lastUpdatePostTime = v7;

  -[ATXAppDirectoryOrderingProvider _createHomeScreenServiceIfNecessary](self, "_createHomeScreenServiceIfNecessary");
  -[SBSHomeScreenService requestAppLibraryUpdateWithReason:completionHandler:](self->_sbsHomeScreenService, "requestAppLibraryUpdateWithReason:completionHandler:", v5, 0);

}

- (void)postPredictedAppsAndRecentsUpdateNotificationWithReason:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__ATXAppDirectoryOrderingProvider_postPredictedAppsAndRecentsUpdateNotificationWithReason___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __91__ATXAppDirectoryOrderingProvider_postPredictedAppsAndRecentsUpdateNotificationWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postPredictedAppsAndRecentsUpdateNotificationWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_postHiddenAppsUpdateNotificationWithReason:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("Unknown");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  __atxlog_handle_app_library();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: posted hidden apps update notification with reason %@", (uint8_t *)&v7, 0xCu);
  }

  -[ATXAppDirectoryOrderingProvider _createHomeScreenServiceIfNecessary](self, "_createHomeScreenServiceIfNecessary");
  -[SBSHomeScreenService requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:](self->_sbsHomeScreenService, "requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:", v5, 0);

}

- (void)dealloc
{
  int settingsChangedToken;
  objc_super v4;

  settingsChangedToken = self->_settingsChangedToken;
  if (settingsChangedToken)
    notify_cancel(settingsChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)ATXAppDirectoryOrderingProvider;
  -[ATXAppDirectoryOrderingProvider dealloc](&v4, sel_dealloc);
}

- (void)waitForPendingTasks
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_107);
}

- (BOOL)_readCategoriesFromDisk
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  char v20;
  void *v21;
  NSUInteger v22;
  NSObject *v24;
  void *v26;
  uint8_t buf[4];
  NSUInteger v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:](self->_cache, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v11, 0, 604800.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("version"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("version"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        v18 = v17 == 10;
        if (v17 != 10)
        {
          __atxlog_handle_app_library();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("version"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v28 = (NSUInteger)v26;
            v29 = 2048;
            v30 = 10;
            _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Cache version %@ doesn't match current version %lu", buf, 0x16u);

          }
LABEL_18:

          goto LABEL_14;
        }
        -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("categories"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v20 = objc_opt_isKindOfClass();

        if ((v20 & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("categories"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXAppDirectoryOrderingProvider setCategories:](self, "setCategories:", v21);

          if (-[NSArray count](self->_categories, "count"))
          {
            __atxlog_handle_app_library();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v22 = -[NSArray count](self->_categories, "count");
              *(_DWORD *)buf = 134217984;
              v28 = v22;
              _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Read from disk succeeded, got %lu categories", buf, 0xCu);
            }
            goto LABEL_18;
          }
        }
      }
    }
    else
    {
      __atxlog_handle_app_library();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXAppDirectoryOrderingProvider _readCategoriesFromDisk].cold.1();
    }
    v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)_writeCategoriesToDisk
{
  NSArray *categories;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("categories");
  categories = self->_categories;
  v4 = categories;
  if (!categories)
    v4 = (void *)objc_opt_new();
  v9[1] = CFSTR("version");
  v10[0] = v4;
  if (self->_currentCacheDueForRefresh)
    v5 = &unk_1E83CBC20;
  else
    v5 = &unk_1E83CBC38;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!categories)

  v7 = -[ATXAppDirectoryOrderingProvider _writeToDisk:cache:logIdentifier:](self, "_writeToDisk:cache:logIdentifier:", v6, self->_cache, CFSTR("categories"));
  return v7;
}

- (id)_reorderedHiddenApps:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[ATXAppDirectoryOrderingProvider _appBundleIDLaunchCountComparator](self, "_appBundleIDLaunchCountComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_writeHiddenAppsToDisk:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[ATXAppDirectoryOrderingProvider _reorderedHiddenApps:](self, "_reorderedHiddenApps:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_app_library();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Writing hidden apps pod with:\n%@", (uint8_t *)&v10, 0xCu);
  }

  v8 = -[ATXAppDirectoryOrderingProvider _writeToDisk:cache:logIdentifier:](self, "_writeToDisk:cache:logIdentifier:", v6, self->_hiddenAppsCache, CFSTR("hidden apps"));
  return v8;
}

- (void)_initCategories
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[ATXAppDirectoryOrderingProvider _readCategoriesFromDisk](self, "_readCategoriesFromDisk")
    || -[ATXAppDirectoryOrderingProvider _shouldInvalidateCachedCategoriesForDemoMode](self, "_shouldInvalidateCachedCategoriesForDemoMode"))
  {
    -[ATXAppDirectoryOrderingProvider _updateCategories](self, "_updateCategories");
    return;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_categories;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(MEMORY[0x1E0CF8C98], "isCategoryScreenTime:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "categoryID", (_QWORD)v9));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      -[ATXAppDirectoryOrderingProvider _ensureCategoryConsistency](self, "_ensureCategoryConsistency");
      return;
    }
  }
  else
  {

  }
  -[ATXAppDirectoryOrderingProvider _updateCategories](self, "_updateCategories", (_QWORD)v9);
}

- (BOOL)_shouldInvalidateCachedCategoriesForDemoMode
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  _BOOL4 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "isStoreDemoMode") & 1) != 0
    || -[ATXAppDirectoryOrderingProvider isMarketingDemoMode](self, "isMarketingDemoMode"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_categories;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "categoryID", (_QWORD)v12) == 1 || objc_msgSend(v8, "categoryID") == 6)
          {
            v9 = 1;
            goto LABEL_15;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
        v9 = 0;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }
LABEL_15:

  }
  else
  {
    v9 = 0;
  }
  __atxlog_handle_app_library();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v9;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: should invalidate cached categories for demo mode: %{BOOL}u", buf, 8u);
  }

  return v9;
}

- (id)positionScreenTimeOtherAtTheEndOfCategories:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_msgSend(v4, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "categoryID") == 1008)
        {
          v12 = v11;

          objc_msgSend(v4, "removeObject:", v12);
          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);

    if (v8)
      objc_msgSend(v4, "addObject:", v8);
  }
  else
  {

    v8 = 0;
  }

  return v4;
}

- (void)setCategories:(id)a3
{
  NSArray *v4;
  NSArray *categories;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_categories != a3)
  {
    -[ATXAppDirectoryOrderingProvider positionScreenTimeOtherAtTheEndOfCategories:](self, "positionScreenTimeOtherAtTheEndOfCategories:");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    categories = self->_categories;
    self->_categories = v4;

    __atxlog_handle_app_library();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Setting categories", buf, 2u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_categories;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          __atxlog_handle_app_library();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "localizedStringForCategoryID:", objc_msgSend(v12, "categoryID"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appBundleIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");
            objc_msgSend(v12, "appBundleIDs");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v23 = v14;
            v24 = 2048;
            v25 = v16;
            v26 = 2112;
            v27 = v17;
            _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: >>> Category %{public}@, app count: %ld, apps: %@", buf, 0x20u);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v9);
    }

  }
}

- (void)_updateCategories
{
  -[ATXAppDirectoryOrderingProvider _updateCategoriesWithRetries:](self, "_updateCategoriesWithRetries:", 2);
}

- (void)_updateCategoriesWithRetries:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Recategorizing from scratch", v8, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXAppDirectoryOrderingProvider _updateMDMStatus](self, "_updateMDMStatus");
  -[ATXAppDirectoryOrderingProvider _computeCategoriesWithRetries:](self, "_computeCategoriesWithRetries:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppDirectoryOrderingProvider _sortCategories:](self, "_sortCategories:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppDirectoryOrderingProvider setCategories:](self, "setCategories:", v7);

  -[ATXAppDirectoryOrderingProvider _writeCategoriesToDisk](self, "_writeCategoriesToDisk");
  -[ATXAppDirectoryOrderingProvider _postUpdateNotificationWithReason:](self, "_postUpdateNotificationWithReason:", CFSTR("Full recategorization requested"));
}

- (id)_categoryChangesDictionaryForChangedApps:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138543362;
    v21 = v6;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:](self, "_genreIdFromBundleId:", v8, v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "unsignedIntegerValue") != 1008)
        {
          while ((objc_msgSend(MEMORY[0x1E0CF8C98], "shouldCategoryNeverMergeWithParent:", objc_msgSend(v9, "unsignedIntegerValue")) & 1) == 0)
          {
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v10 = self->_categories;
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v26;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v26 != v13)
                    objc_enumerationMutation(v10);
                  v15 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "categoryID");
                  if (v15 == objc_msgSend(v9, "unsignedIntegerValue"))
                  {

                    goto LABEL_21;
                  }
                }
                v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
                if (v12)
                  continue;
                break;
              }
            }

            __atxlog_handle_app_library();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v34 = v9;
              _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Didn't find category %{public}@ in existing categories, trying parent category", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0CF8C98], "parentCategoryForCategory:", objc_msgSend(v9, "unsignedIntegerValue")));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v17;
            if (objc_msgSend(v17, "unsignedIntegerValue") == 1008)
              goto LABEL_22;
          }
        }
LABEL_21:
        v17 = v9;
LABEL_22:
        objc_msgSend(v5, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v17);
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v24);
  }

  return v5;
}

- (void)_updateRecentsForInstalledApps:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ATXAppDirectoryOrderingProvider__updateRecentsForInstalledApps___block_invoke;
  v8[3] = &unk_1E82DC5C0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update recents cache after installation notification", v7, 2u);
    }

    -[ATXAppDirectoryOrderingProvider _writeRecentsToDisk](self, "_writeRecentsToDisk");
  }
  else
  {
    __atxlog_handle_app_library();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: No recents pod change", v7, 2u);
    }

  }
  _Block_object_dispose(&v9, 8);

}

void __66__ATXAppDirectoryOrderingProvider__updateRecentsForInstalledApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if (shouldConsiderAppForRecents(v7))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", v5, v7);
  }

}

- (void)_updateRecentsForUnhiddenApps:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v6)
  {

    goto LABEL_18;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_recentApps, "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
      }
      else
      {
        if (!shouldConsiderAppForRecents(v11))
          continue;
        -[ATXAppDirectoryOrderingProvider _getInstallDateForUnhiddenApp:](self, "_getInstallDateForUnhiddenApp:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentApps, "setObject:forKeyedSubscript:", v13, v11);
        v8 = 1;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v7);

  if ((v8 & 1) != 0)
  {
    __atxlog_handle_app_library();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update recents cache after unhidden app notification", v16, 2u);
    }

    -[ATXAppDirectoryOrderingProvider _writeRecentsToDisk](self, "_writeRecentsToDisk");
    goto LABEL_21;
  }
LABEL_18:
  __atxlog_handle_app_library();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: No recents pod change", v16, 2u);
  }

LABEL_21:
}

- (void)_updateCategoriesForInstalledApps:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSArray *obj;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  ATXAppDirectoryOrderingProvider *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXAppDirectoryOrderingProvider _updateMDMStatus](self, "_updateMDMStatus");
  v53 = v4;
  -[ATXAppDirectoryOrderingProvider _categoryChangesDictionaryForChangedApps:](self, "_categoryChangesDictionaryForChangedApps:", v4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "allKeys");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v61 = self;
  obj = self->_categories;
  v57 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v81 != v55)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v56, "containsObject:", v7) & 1) != 0)
        {

        }
        else
        {
          v8 = objc_msgSend(v6, "categoryID");

          if (v8 != 1008)
          {
            objc_msgSend(v58, "addObject:", v6);
            continue;
          }
        }
        v59 = i;
        objc_msgSend(v6, "appBundleIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        if (objc_msgSend(v6, "categoryID") == 1008)
        {
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v11 = v60;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v77;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v77 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
                if (objc_msgSend(v16, "unsignedIntegerValue") != 1008)
                {
                  objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "removeObjectsInArray:", v17);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
            }
            while (v13);
          }

        }
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = v19;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v73 != v22)
                objc_enumerationMutation(v62);
              v24 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k);
              if (objc_msgSend(v6, "categoryID") == 1)
              {
                -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](v61, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v24, 0);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "localizedName");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = 0;
                if (!v26)
                  v27 = objc_msgSend(v25, "isEqualToString:", CFSTR("kATXEnterprise"));

                objc_msgSend(v6, "localizedName");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "isEqualToString:", v25);

                if (((v27 & 1) != 0 || v29) && (objc_msgSend(v10, "containsObject:", v24) & 1) == 0)
                  objc_msgSend(v10, "addObject:", v24);

              }
              else if ((objc_msgSend(v10, "containsObject:", v24) & 1) == 0)
              {
                objc_msgSend(v10, "addObject:", v24);
              }
            }
            v21 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
          }
          while (v21);
        }

        if (objc_msgSend(v6, "categoryID") == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeObjectsInArray:", v10);

        }
        objc_msgSend(v6, "updateAppBundleIDs:", v10);
        objc_msgSend(v58, "addObject:", v6);

        i = v59;
      }
      v57 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v57);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v63 = v56;
  v32 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v69 != v34)
          objc_enumerationMutation(v63);
        v36 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
        if (objc_msgSend(v36, "unsignedIntegerValue") == 1)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          if (!v38)
            continue;
          objc_msgSend(v60, "objectForKeyedSubscript:", v36);
          v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
          -[ATXAppDirectoryOrderingProvider _getEnterpriseCategoriesForApps:](v61, "_getEnterpriseCategoriesForApps:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObjectsFromArray:", v40);

        }
        else
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v39 = v61->_categories;
          v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v65;
LABEL_53:
            v44 = 0;
            while (1)
            {
              if (*(_QWORD *)v65 != v43)
                objc_enumerationMutation(v39);
              v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v44);
              v46 = objc_msgSend(v36, "unsignedIntegerValue");
              if (v46 == objc_msgSend(v45, "categoryID"))
                break;
              if (v42 == ++v44)
              {
                v42 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
                if (v42)
                  goto LABEL_53;
                goto LABEL_59;
              }
            }
          }
          else
          {
LABEL_59:

            if (objc_msgSend(v36, "unsignedIntegerValue") == 6)
            {
              objc_msgSend(v60, "objectForKeyedSubscript:", v36);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v47, "copy");
              -[ATXAppDirectoryOrderingProvider _mdmEnterpriseCategoriesForApps:](v61, "_mdmEnterpriseCategoriesForApps:", v48);
              v49 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v50 = objc_alloc(MEMORY[0x1E0CF8C98]);
              v51 = objc_msgSend(v36, "unsignedIntegerValue");
              objc_msgSend(v60, "objectForKeyedSubscript:", v36);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v47, "copy");
              v49 = objc_msgSend(v50, "initWithCategoryID:appBundleIDs:", v51, v48);
            }
            v39 = (NSArray *)v49;

            if (v39)
              objc_msgSend(v58, "addObject:", v39);
          }
        }

      }
      v33 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
    }
    while (v33);
  }

  v52 = (void *)objc_msgSend(v58, "copy");
  -[ATXAppDirectoryOrderingProvider setCategories:](v61, "setCategories:", v52);

  -[ATXAppDirectoryOrderingProvider _writeCategoriesToDisk](v61, "_writeCategoriesToDisk");
  -[ATXAppDirectoryOrderingProvider _postUpdateNotificationWithReason:](v61, "_postUpdateNotificationWithReason:", CFSTR("App installed"));

}

- (void)_updateCategoriesForUnhiddenApps:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  ATXAppDirectoryOrderingProvider *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXAppDirectoryOrderingProvider _updateMDMStatus](self, "_updateMDMStatus");
  -[ATXAppDirectoryOrderingProvider _updateScreenTimeMappingsForAppBundleIds:withRetries:](self, "_updateScreenTimeMappingsForAppBundleIds:withRetries:", v4, 2);
  v42 = (void *)objc_opt_new();
  v41 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:](self, "_genreIdFromBundleId:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v12, v10);

        -[ATXAppDirectoryOrderingProvider _screenTimeIdFromBundleId:](self, "_screenTimeIdFromBundleId:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v13, v10);

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v7);
  }

  v14 = (void *)-[NSArray mutableCopy](self->_categories, "mutableCopy");
  v15 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v47;
    v16 = 0x1E0CF8000uLL;
    v43 = v14;
    v37 = v15;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        v19 = +[ATXAppDirectoryHierarchyNode effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:](ATXAppDirectoryHierarchyNode, "effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:", v18, v42, v41);
        if (v19 != 1008 && (objc_msgSend(*(id *)(v16 + 3224), "shouldCategoryNeverMergeWithParent:", v19) & 1) == 0)
          v19 = objc_msgSend(*(id *)(v16 + 3224), "parentCategoryForCategory:", v19);
        if (!objc_msgSend(v14, "count"))
          goto LABEL_28;
        v40 = j;
        v20 = 0;
        v21 = 0;
        v44 = v19;
        v45 = v18;
        do
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "categoryID") == v19)
          {
            v23 = (void *)MEMORY[0x1E0C99DE8];
            objc_msgSend(v22, "appBundleIDs");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "arrayWithArray:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isOffloadedForBundle:", v18) & 1) != 0
              || -[NSSet containsObject:](self->_blacklistedBundleIds, "containsObject:", v18))
            {
              __atxlog_handle_app_library();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v55 = "-[ATXAppDirectoryOrderingProvider _updateCategoriesForUnhiddenApps:]";
                v56 = 2112;
                v57 = v18;
                _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "%s: Attempted to add un-hidden app: %@, but app is blacklisted or offloaded", buf, 0x16u);
              }

            }
            else
            {
              objc_msgSend(v25, "addObject:", v18);
            }
            v27 = objc_alloc(*(Class *)(v16 + 3224));
            v28 = objc_msgSend(v22, "categoryID");
            -[ATXAppDirectoryOrderingProvider _appBundleIDLaunchCountComparator](self, "_appBundleIDLaunchCountComparator");
            v29 = v16;
            v30 = self;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sortedArrayUsingComparator:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "localizedName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)objc_msgSend(v27, "initWithCategoryID:appBundleIDs:localizedName:", v28, v32, v33);

            self = v30;
            v16 = v29;
            v14 = v43;
            objc_msgSend(v43, "replaceObjectAtIndex:withObject:", v21, v34);

            v20 = 1;
            v19 = v44;
            v18 = v45;
          }

          ++v21;
        }
        while (v21 < objc_msgSend(v14, "count"));
        v15 = v37;
        j = v40;
        if ((v20 & 1) == 0)
LABEL_28:
          objc_msgSend(v15, "addObject:", v18);
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v39);
  }

  v35 = (void *)objc_msgSend(v14, "copy");
  -[ATXAppDirectoryOrderingProvider setCategories:](self, "setCategories:", v35);

  -[ATXAppDirectoryOrderingProvider _writeCategoriesToDisk](self, "_writeCategoriesToDisk");
  -[ATXAppDirectoryOrderingProvider _postUpdateNotificationWithReason:](self, "_postUpdateNotificationWithReason:", CFSTR("App un-hidden"));
  if (objc_msgSend(v15, "count"))
    -[ATXAppDirectoryOrderingProvider _updateCategoriesForInstalledApps:](self, "_updateCategoriesForInstalledApps:", v15);

}

- (void)_updateCategoriesForUninstalledApps:(id)a3
{
  -[ATXAppDirectoryOrderingProvider _updateCategoriesForRemovedApps:uninstalled:hidden:](self, "_updateCategoriesForRemovedApps:uninstalled:hidden:", a3, 1, 0);
}

- (void)_updateCategoriesForHiddenApps:(id)a3
{
  -[ATXAppDirectoryOrderingProvider _updateCategoriesForRemovedApps:uninstalled:hidden:](self, "_updateCategoriesForRemovedApps:uninstalled:hidden:", a3, 0, 1);
}

- (void)_updateCategoriesForRemovedApps:(id)a3 uninstalled:(BOOL)a4 hidden:(BOOL)a5
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v24 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)-[NSArray mutableCopy](self->_categories, "mutableCopy");
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v9, "appBundleIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = v6;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v12, "removeObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }

      v18 = objc_alloc(MEMORY[0x1E0CF8C98]);
      v19 = objc_msgSend(v9, "categoryID");
      objc_msgSend(v9, "localizedName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithCategoryID:appBundleIDs:localizedName:", v19, v12, v20);

      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v8, v21);
      ++v8;
    }
    while (v8 < objc_msgSend(v7, "count"));
  }
  v22 = (void *)objc_msgSend(v7, "copy");
  -[ATXAppDirectoryOrderingProvider setCategories:](self, "setCategories:", v22);

  -[ATXAppDirectoryOrderingProvider _writeCategoriesToDisk](self, "_writeCategoriesToDisk");
  if (v24)
    v23 = CFSTR("App hidden");
  else
    v23 = CFSTR("App uninstalled");
  -[ATXAppDirectoryOrderingProvider _postUpdateNotificationWithReason:](self, "_postUpdateNotificationWithReason:", v23);

}

- (void)_updateHiddenAppsPodWithNotification:(id)a3
{
  NSObject *queue;
  void *v5;
  void *v6;
  id v7;

  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(MEMORY[0x1E0CF8CD8], "hiddenBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[ATXAppDirectoryOrderingProvider _writeHiddenAppsToDisk:](self, "_writeHiddenAppsToDisk:", v6);

  -[ATXAppDirectoryOrderingProvider _postHiddenAppsUpdateNotificationWithReason:](self, "_postHiddenAppsUpdateNotificationWithReason:", v7);
}

- (BOOL)shouldUpdateMissingInstalledApps
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("crystalMigration"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))return 0;
  -[_ATXAppInfoManager appInfoForBundleId:](self->_infoManager, "appInfoForBundleId:", CFSTR("com.apple.GenerativePlaygroundApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[_ATXAppInfoManager appInfoForBundleId:](self->_infoManager, "appInfoForBundleId:", CFSTR("com.apple.printcenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[_ATXAppInfoManager appInfoForBundleId:](self->_infoManager, "appInfoForBundleId:", CFSTR("com.apple.Passwords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  v6 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad")
     ? CFSTR("com.apple.calculator")
     : CFSTR("com.apple.TVRemoteUIService");
  -[_ATXAppInfoManager appInfoForBundleId:](self->_infoManager, "appInfoForBundleId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return !v7;
}

- (id)_getInstallDateForUnhiddenApp:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8CE8], "registrationDateForBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: LS install date: %{public}@ for unhidden app: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!v4)
  {
    __atxlog_handle_app_library();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryOrderingProvider _getInstallDateForUnhiddenApp:].cold.1();

    v4 = (void *)objc_opt_new();
  }

  return v4;
}

- (void)_updateRecentsForAppClipUsageEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "webClipBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "launchDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentApps, "setObject:forKeyedSubscript:", v6, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentApps, "setObject:forKeyedSubscript:", v8, v5);

    }
    -[ATXAppDirectoryOrderingProvider _writeRecentsToDisk](self, "_writeRecentsToDisk");
  }
  else
  {
    __atxlog_handle_app_library();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryOrderingProvider _updateRecentsForAppClipUsageEvent:].cold.1();

  }
}

- (void)_ensureCategoryConsistency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  ATXAppDirectoryOrderingProvider *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_ATXAppIconState allAppsKnownToSpringBoard](self->_appIconState, "allAppsKnownToSpringBoard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CF8CD8], "hiddenBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

    v24 = v4;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = self;
    v7 = self->_categories;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v12, "appBundleIDs", v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v6, "containsObject:", v18))
                  objc_msgSend(v6, "removeObject:", v18);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            }
            while (v15);
          }

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v9);
    }

    v4 = v24;
    if (objc_msgSend(v6, "count"))
    {
      __atxlog_handle_app_library();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v6, "count");
        objc_msgSend(v6, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v34 = v20;
        v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Recategorizing %lu missed apps: %@", buf, 0x16u);

      }
      objc_msgSend(v6, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppDirectoryOrderingProvider _updateCategoriesForInstalledApps:](v23, "_updateCategoriesForInstalledApps:", v22);

    }
  }

}

- (id)_categoryIdFromBundleId:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[ATXAppDirectoryOrderingProvider _screenTimeIdFromBundleId:](self, "_screenTimeIdFromBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_genreIdFromBundleId:(id)a3
{
  id v4;
  NSDictionary *hardcodedAppCategoryMappings;
  NSDictionary *v6;
  NSDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  hardcodedAppCategoryMappings = self->_hardcodedAppCategoryMappings;
  if (!hardcodedAppCategoryMappings)
  {
    +[ATXAppDirectoryOverrideList iTunesOverridesFromMobileAsset](ATXAppDirectoryOverrideList, "iTunesOverridesFromMobileAsset");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hardcodedAppCategoryMappings;
    self->_hardcodedAppCategoryMappings = v6;

    hardcodedAppCategoryMappings = self->_hardcodedAppCategoryMappings;
  }
  -[NSDictionary objectForKeyedSubscript:](hardcodedAppCategoryMappings, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CF8CE8], "recordForBundleId:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isArcadeApp") & 1) != 0)
    {
      v9 = 0;
      v10 = &unk_1E83CBC50;
LABEL_28:

      goto LABEL_29;
    }
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "iTunesMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "genreIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ATXAppInfoManager appInfoForBundleId:](self->_infoManager, "appInfoForBundleId:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isEnterpriseApp"))
      goto LABEL_16;
    if (-[NSSet containsObject:](self->_managedAppIDs, "containsObject:", v4))
    {
      -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v4, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("Apple Inc.")))
      {
        __atxlog_handle_app_library();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          goto LABEL_14;
        goto LABEL_15;
      }

      v10 = &unk_1E83CBC68;
    }
    else
    {
      -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v4, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("Apple Inc.")))
      {
        __atxlog_handle_app_library();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
LABEL_14:
          -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:].cold.1();
LABEL_15:

LABEL_16:
        if (objc_msgSend(v14, "integerValue"))
        {
          v18 = v14;
        }
        else
        {
          objc_msgSend(v15, "genreId");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v9, "integerValue"))
          {
            __atxlog_handle_app_library();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v21 = 138412290;
              v22 = v4;
              _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: no app info or genre ID for: %@", (uint8_t *)&v21, 0xCu);
            }

            v10 = &unk_1E83CBC98;
            goto LABEL_27;
          }
          v18 = v9;
        }
        v9 = v18;
        v10 = v18;
LABEL_27:

        goto LABEL_28;
      }

      v10 = &unk_1E83CBC80;
    }
    v9 = v14;
    goto LABEL_27;
  }
  v9 = v8;
  v10 = v9;
LABEL_29:

  return v10;
}

- (id)_screenTimeIdFromBundleId:(id)a3
{
  id v4;
  NSObject *v5;
  NSDictionary *hardcodedAppCategoryScreenTimeMappings;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  __int128 *v37;
  _BYTE *v38;
  uint8_t v39[4];
  id v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Proactive is trying to categorize %@", buf, 0xCu);
  }

  hardcodedAppCategoryScreenTimeMappings = self->_hardcodedAppCategoryScreenTimeMappings;
  if (!hardcodedAppCategoryScreenTimeMappings)
  {
    +[ATXAppDirectoryOverrideList ScreenTimeOverridesFromMobileAsset](ATXAppDirectoryOverrideList, "ScreenTimeOverridesFromMobileAsset");
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_hardcodedAppCategoryScreenTimeMappings;
    self->_hardcodedAppCategoryScreenTimeMappings = v7;

    hardcodedAppCategoryScreenTimeMappings = self->_hardcodedAppCategoryScreenTimeMappings;
  }
  -[NSDictionary objectForKeyedSubscript:](hardcodedAppCategoryScreenTimeMappings, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    __atxlog_handle_app_library();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Providing a hardcoded value for %@", buf, 0xCu);
    }

    v11 = v9;
    goto LABEL_41;
  }
  if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isArcadeAppForBundle:", v4) & 1) != 0)
  {
    v11 = &unk_1E83CBC50;
    goto LABEL_41;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isStoreDemoMode") & 1) != 0
    || -[ATXAppDirectoryOrderingProvider isMarketingDemoMode](self, "isMarketingDemoMode"))
  {
    __atxlog_handle_app_library();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Ignore Enterprise categories due to product demo mode", buf, 2u);
    }
    goto LABEL_15;
  }
  -[_ATXAppInfoManager appInfoForBundleId:](self->_infoManager, "appInfoForBundleId:", v4);
  v12 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject isEnterpriseApp](v12, "isEnterpriseApp") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0CF8CE8], "isEnterpriseAppForBundle:", v4))
  {
    __atxlog_handle_app_library();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = -[NSObject isEnterpriseApp](v12, "isEnterpriseApp");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v26;
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got %@ as enterprise. isEnterpriseFromDB: %{BOOL}u", buf, 0x12u);
    }

    if (-[NSSet containsObject:](self->_managedAppIDs, "containsObject:", v4))
    {
      -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v4, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Apple Inc."));

      if ((v28 & 1) == 0)
      {
        v11 = &unk_1E83CBC68;
LABEL_43:

        goto LABEL_41;
      }
    }
    else
    {
      -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v4, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Apple Inc."));

      if (!v30)
      {
        v11 = &unk_1E83CBC80;
        goto LABEL_43;
      }
    }
    __atxlog_handle_app_library();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:].cold.1();

  }
LABEL_15:

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__7;
  v46 = __Block_byref_object_dispose__7;
  v47 = 0;
  -[NSDictionary objectForKeyedSubscript:](self->_appScreenTimeCategoryMappings, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    v18 = dispatch_semaphore_create(0);
    *(_QWORD *)&v41 = 0;
    *((_QWORD *)&v41 + 1) = &v41;
    v42 = 0x2020000000;
    v43 = 1;
    __atxlog_handle_app_library();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 138412290;
      v40 = v4;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Requesting CTCategory for app: %@", v39, 0xCu);
    }

    v20 = (void *)MEMORY[0x1E0D0D518];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke;
    v34[3] = &unk_1E82DC610;
    v37 = &v41;
    v21 = v4;
    v35 = v21;
    v38 = buf;
    v22 = v18;
    v36 = v22;
    objc_msgSend(v20, "categoryForBundleID:withCompletionHandler:", v21, v34);
    v17 = v22;
    v23 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v17, v23);

    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      if (*(_BYTE *)(*((_QWORD *)&v41 + 1) + 24))
      {
        __atxlog_handle_app_library();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[ATXAppDirectoryOrderingProvider _screenTimeIdFromBundleId:].cold.1();
      }
      else
      {
        __atxlog_handle_app_library();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138412290;
          v40 = v21;
          _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: CTCategories provided nil when requesting categorization for bundle %@", v39, 0xCu);
        }
      }

      v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = &unk_1E83CBCB0;

    }
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    __atxlog_handle_app_library();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v41) = 138412290;
      *(_QWORD *)((char *)&v41 + 4) = v4;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Using a cached CTCategory response rather than re-requesting for %@", (uint8_t *)&v41, 0xCu);
    }

    -[NSDictionary objectForKeyedSubscript:](self->_appScreenTimeCategoryMappings, "objectForKeyedSubscript:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v16;
  }

  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

LABEL_41:
  return v11;
}

void __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (v6)
  {
    __atxlog_handle_app_library();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke_cold_1();

  }
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_app_library();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got CTCategory: %@ for app: %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0CF8C98], "screenTimeCategoryIDForCategoryIdentifier:", v8));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    __atxlog_handle_app_library();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(NSObject **)(a1 + 32);
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got CTCategory: nil for app: %@", (uint8_t *)&v15, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_updateAppLaunchCounts
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *appLaunchCounts;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *libraryAppLaunchCounts;
  ATXAppDirectoryOrderingProvider *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_ATXAppIconState allAppsKnownToSpringBoard](self->_appIconState, "allAppsKnownToSpringBoard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)MEMORY[0x1E0CB37E8];
          v39 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "totalLaunchesForBundleIds:", v10);
          objc_msgSend(v9, "numberWithDouble:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v28, v4);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    appLaunchCounts = self->_appLaunchCounts;
    self->_appLaunchCounts = v12;

    v26 = self;
    -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 93);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)MEMORY[0x1E0CB37E8];
          v37 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "totalLaunchesForBundleIds:", v22);
          objc_msgSend(v21, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v15, v16);
    v24 = objc_claimAutoreleasedReturnValue();
    libraryAppLaunchCounts = v26->_libraryAppLaunchCounts;
    v26->_libraryAppLaunchCounts = (NSDictionary *)v24;

  }
}

- (id)_combinedLaunchCountForBundleId:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDictionary objectForKeyedSubscript:](self->_appLaunchCounts, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  -[NSDictionary objectForKeyedSubscript:](self->_libraryAppLaunchCounts, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v6, "numberWithDouble:", v9 + v11 * 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_totalLaunchCountsForCategory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "appBundleIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[NSDictionary objectForKeyedSubscript:](self->_appLaunchCounts, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v9 = v9 + v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_totalLibraryLaunchCountsForCategory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "appBundleIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[NSDictionary objectForKeyedSubscript:](self->_libraryAppLaunchCounts, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v9 = v9 + v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_totalCombinedLaunchCountsForCategory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "appBundleIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[ATXAppDirectoryOrderingProvider _combinedLaunchCountForBundleId:](self, "_combinedLaunchCountForBundleId:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v9 = v9 + v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_updateMissingInstalledApps
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update missing installed apps", (uint8_t *)&v22, 2u);
  }

  __atxlog_handle_app_install();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update missing installed apps", (uint8_t *)&v22, 2u);
  }

  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[_ATXAppInfoManager allAppsWithInstallDate](self->_infoManager, "allAppsWithInstallDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  -[_ATXAppIconState allAppsKnownToSpringBoard](self->_appIconState, "allAppsKnownToSpringBoard");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v14);
  v16 = +[_ATXAppInstallMonitor removeIntersectionBetweenSet:set:](_ATXAppInstallMonitor, "removeIntersectionBetweenSet:set:", v15, v10);
  __atxlog_handle_app_library();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v15;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Found missing installed apps:\n%@", (uint8_t *)&v22, 0xCu);
  }

  __atxlog_handle_app_install();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v15;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Found missing installed apps:\n%@", (uint8_t *)&v22, 0xCu);
  }

  if (objc_msgSend(v15, "count"))
  {
    LOBYTE(v22) = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("crystalMigration"), (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&v22))
      v19 = +[_ATXAppInstallMonitor newPreInstalledAppSet](_ATXAppInstallMonitor, "newPreInstalledAppSet");
    else
      v19 = 0;
    objc_msgSend(v15, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXAppInstallMonitor appInfoDictWithBackDate:assetData:newPreInstalledAppSet:isFromNotification:newApps:](_ATXAppInstallMonitor, "appInfoDictWithBackDate:assetData:newPreInstalledAppSet:isFromNotification:newApps:", 0, 0, v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ATXAppInfoManager addInstallForBundleInfoMap:](self->_infoManager, "addInstallForBundleInfoMap:", v21);
  }

  objc_autoreleasePoolPop(v5);
}

- (id)_categoryComparator
{
  _QWORD aBlock[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__ATXAppDirectoryOrderingProvider__categoryComparator__block_invoke;
  aBlock[3] = &unk_1E82DC638;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __54__ATXAppDirectoryOrderingProvider__categoryComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_totalCombinedLaunchCountsForCategory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_totalCombinedLaunchCountsForCategory:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!v9)
  {
    v10 = objc_msgSend(v5, "categoryID");
    if (v10 <= objc_msgSend(v6, "categoryID"))
    {
      v11 = objc_msgSend(v5, "categoryID");
      if (v11 >= objc_msgSend(v6, "categoryID"))
        v9 = 0;
      else
        v9 = -1;
    }
    else
    {
      v9 = 1;
    }
  }

  return v9;
}

- (id)_appBundleIDTotalLaunchComparator
{
  _QWORD aBlock[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__ATXAppDirectoryOrderingProvider__appBundleIDTotalLaunchComparator__block_invoke;
  aBlock[3] = &unk_1E82DC570;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __68__ATXAppDirectoryOrderingProvider__appBundleIDTotalLaunchComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_combinedLaunchCountForBundleId:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1E83CBC98;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "_combinedLaunchCountForBundleId:", v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1E83CBC98;
  v14 = v13;

  v15 = objc_msgSend(v14, "compare:", v10);
  if (!v15)
    v15 = objc_msgSend(v5, "compare:options:", v6, 1);

  return v15;
}

- (id)_appBundleIDRecencyComparatorForLastLaunchDates:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__ATXAppDirectoryOrderingProvider__appBundleIDRecencyComparatorForLastLaunchDates___block_invoke;
  aBlock[3] = &unk_1E82DC570;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  return v6;
}

uint64_t __83__ATXAppDirectoryOrderingProvider__appBundleIDRecencyComparatorForLastLaunchDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!v9)
    v9 = objc_msgSend(v5, "compare:options:", v6, 1);

  return v9;
}

- (id)_appBundleIDLaunchCountComparator
{
  _QWORD aBlock[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_appLaunchCounts)
    -[ATXAppDirectoryOrderingProvider _updateAppLaunchCounts](self, "_updateAppLaunchCounts");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__ATXAppDirectoryOrderingProvider__appBundleIDLaunchCountComparator__block_invoke;
  aBlock[3] = &unk_1E82DC570;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __68__ATXAppDirectoryOrderingProvider__appBundleIDLaunchCountComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1E83CBC98;
  v10 = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1E83CBC98;
  v14 = v13;

  v15 = objc_msgSend(v14, "compare:", v10);
  if (!v15)
    v15 = objc_msgSend(v5, "compare:options:", v6, 1);

  return v15;
}

- (void)_updateScreenTimeMappingsForAppBundleIds:(id)a3 withRetries:(unint64_t)a4
{
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  ATXTimer *currentTimer;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSDictionary *appScreenTimeCategoryMappings;
  NSObject *v36;
  void *context;
  ATXAppDirectoryOrderingProvider *val;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45[2];
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  context = (void *)MEMORY[0x1CAA48B6C]();
  val = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__7;
  v58 = __Block_byref_object_dispose__7;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  v6 = dispatch_semaphore_create(0);
  __atxlog_handle_app_library();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v39;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Request CTCategories for apps %@", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0D0D518];
  v9 = *MEMORY[0x1E0D0D4F8];
  v10 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke;
  v46[3] = &unk_1E82DC660;
  v48 = &v54;
  v49 = &v50;
  v11 = v6;
  v47 = v11;
  objc_msgSend(v8, "categoryForBundleIdentifiers:platform:withCompletionHandler:", v39, v9, v46);
  v12 = v11;
  v13 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v12, v13);
  v36 = v12;

  if (*((_BYTE *)v51 + 24))
  {
    __atxlog_handle_app_library();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryOrderingProvider _updateScreenTimeMappingsForAppBundleIds:withRetries:].cold.1();

    if (*((_BYTE *)v51 + 24))
      goto LABEL_9;
  }
  v15 = v55;
  if (!v55[5])
  {
LABEL_9:
    objc_initWeak((id *)buf, val);
    v16 = (void *)MEMORY[0x1E0CF9500];
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v36, context);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateByAddingTimeInterval:", 1200.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v10;
    v44[1] = 3221225472;
    v44[2] = __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_165;
    v44[3] = &unk_1E82DC6B0;
    objc_copyWeak(v45, (id *)buf);
    v45[1] = (id)a4;
    objc_msgSend(v16, "fireAtDate:block:", v18, v44);
    v19 = objc_claimAutoreleasedReturnValue();
    currentTimer = val->_currentTimer;
    val->_currentTimer = (ATXTimer *)v19;

    objc_destroyWeak(v45);
    objc_destroyWeak((id *)buf);
    v15 = v55;
  }
  else
  {
    val->_currentCacheDueForRefresh = 0;
  }
  if (v15[5])
  {
    __atxlog_handle_app_library();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)v55[5];
      *(_DWORD *)buf = 138412290;
      v61 = v22;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got %@", buf, 0xCu);
    }

    objc_msgSend((id)v55[5], "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v25 = v23;
    v26 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend((id)v55[5], "objectForKeyedSubscript:", v29, v36);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          __atxlog_handle_app_library();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v31;
            v62 = 2112;
            v63 = v29;
            _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got CTCategory: %@ for app: %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0CF8C98], "screenTimeCategoryIDForCategoryIdentifier:", v31));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v33);

        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
      }
      while (v26);
    }

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v24, v25);
    appScreenTimeCategoryMappings = val->_appScreenTimeCategoryMappings;
    val->_appScreenTimeCategoryMappings = (NSDictionary *)v34;

  }
  else
  {
    __atxlog_handle_app_library();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got nil CTCategory response", buf, 2u);
    }
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  objc_autoreleasePoolPop(context);
}

void __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (v7)
  {
    __atxlog_handle_app_library();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_165(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[6];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    __atxlog_handle_app_library();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Retrying category retrieval...", buf, 2u);
      }

      *((_BYTE *)WeakRetained + 264) = 1;
      v6 = *((_QWORD *)WeakRetained + 3);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_166;
      v8[3] = &unk_1E82DC688;
      v7 = *(_QWORD *)(a1 + 40);
      v8[4] = WeakRetained;
      v8[5] = v7;
      dispatch_async(v6, v8);
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_165_cold_1();

    }
  }

}

uint64_t __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_166(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCategoriesWithRetries:", *(_QWORD *)(a1 + 40) - 1);
}

- (void)_updateMDMStatus
{
  NSSet *v3;
  NSSet *managedAppIDs;
  NSString *v5;
  NSString *managingOrganizationName;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXAppDirectoryOrderingProvider _getManagedAppIDs](self, "_getManagedAppIDs");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  managedAppIDs = self->_managedAppIDs;
  self->_managedAppIDs = v3;

  -[ATXAppDirectoryOrderingProvider _getMDMOrgName](self, "_getMDMOrgName");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  managingOrganizationName = self->_managingOrganizationName;
  self->_managingOrganizationName = v5;

}

- (id)_getManagedAppIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedAppIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getMDMOrgName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managingOrganizationInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D47270]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateMDMAndEnterpriseCategories
{
  objc_class *v5;
  void *v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  v8 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "%@: Got new MDM and enterprise apps:\n%@", v7, 0x16u);

}

- (void)_splitEnterpriseCategoryWithAppsInCategory:(id)a3 appsByCategoryName:(id)a4 isMDMAppCategory:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  BOOL v31;
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __114__ATXAppDirectoryOrderingProvider__splitEnterpriseCategoryWithAppsInCategory_appsByCategoryName_isMDMAppCategory___block_invoke;
  v29[3] = &unk_1E82DC6D8;
  v31 = v5;
  v29[4] = self;
  v11 = v10;
  v30 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v29);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = v11;
  v24 = v8;
  objc_msgSend(v8, "objectsAtIndexes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    v16 = !v5;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v18, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v21 = (void *)objc_opt_new();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v19);

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v14);
  }

  objc_msgSend(v24, "removeObjectsAtIndexes:", v23);
}

void __114__ATXAppDirectoryOrderingProvider__splitEnterpriseCategoryWithAppsInCategory_appsByCategoryName_isMDMAppCategory___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  int v7;
  id v8;

  v5 = a2;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v8 = v5;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "containsObject:");
  if (!v6)
  {
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((v7 & 1) == 0)
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
LABEL_4:

}

- (void)_updateMDMCategoryName
{
  NSString *v3;
  NSString *managingOrganizationName;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXAppDirectoryOrderingProvider _getMDMOrgName](self, "_getMDMOrgName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  managingOrganizationName = self->_managingOrganizationName;
  self->_managingOrganizationName = v3;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_categories;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "categoryID", (_QWORD)v23) == 6)
        {
          objc_msgSend(v10, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", self->_managingOrganizationName);

          __atxlog_handle_app_library();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v16)
            {
              v17 = (objc_class *)objc_opt_class();
              NSStringFromClass(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v28 = v18;
              _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%@: MDM enterprise category name doesn't need any change", buf, 0xCu);

            }
          }
          else
          {
            if (v16)
            {
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "localizedName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = self->_managingOrganizationName;
              *(_DWORD *)buf = 138412802;
              v28 = v20;
              v29 = 2112;
              v30 = v21;
              v31 = 2112;
              v32 = v22;
              _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%@: MDM enterprise category updates its name from %@ to %@", buf, 0x20u);

            }
            objc_msgSend(v10, "updateCategoryLocalizedNameWithName:", self->_managingOrganizationName);
            -[ATXAppDirectoryOrderingProvider _writeCategoriesToDisk](self, "_writeCategoriesToDisk");
            -[ATXAppDirectoryOrderingProvider _postUpdateNotificationWithReason:](self, "_postUpdateNotificationWithReason:", CFSTR("MDM category name changed"));
          }
          goto LABEL_18;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v7)
        continue;
      break;
    }
  }

  __atxlog_handle_app_library();
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl(&dword_1C9A3B000, &v5->super, OS_LOG_TYPE_DEFAULT, "%@: Found NO MDM enterprise category changes", buf, 0xCu);

  }
LABEL_18:

}

- (id)_issuingOrganizationForEnterpriseAppBundleID:(id)a3 isMDM:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *managingOrganizationName;
  __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    managingOrganizationName = (__CFString *)self->_managingOrganizationName;
    if (!managingOrganizationName)
      managingOrganizationName = CFSTR("kATXMDM");
    v8 = managingOrganizationName;
  }
  else if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isBetaAppForBundle:", v6) & 1) != 0)
  {
    v8 = CFSTR("TestFlight");
  }
  else
  {
    __atxlog_handle_app_library();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:].cold.2();

    v8 = CFSTR("kATXEnterprise");
    if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isUPPValidatedForBundle:", v6) & 1) == 0)
    {
      __atxlog_handle_app_library();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:].cold.1();

      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "signerOrganization");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = v12;
      else
        v13 = CFSTR("kATXEnterprise");
      v8 = v13;

    }
  }

  return v8;
}

- (id)_groupEnterpriseAppsByIssuerWithBundleIDs:(id)a3 isMDM:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v13, v4, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v14);

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_mdmEnterpriseCategoriesForApps:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _OWORD v14[4];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXAppDirectoryOrderingProvider _groupEnterpriseAppsByIssuerWithBundleIDs:isMDM:](self, "_groupEnterpriseAppsByIssuerWithBundleIDs:isMDM:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    __atxlog_handle_app_library();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryOrderingProvider _mdmEnterpriseCategoriesForApps:].cold.1(v3, v4);

  }
  memset(v14, 0, sizeof(v14));
  v5 = v3;
  if (objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v14, v15, 16))
  {
    v6 = **((_QWORD **)&v14[0] + 1);
    v7 = objc_msgSend(**((id **)&v14[0] + 1), "isEqualToString:", CFSTR("kATXMDM"), *(_QWORD *)&v14[0]);
    v8 = objc_alloc(MEMORY[0x1E0CF8C98]);
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    if (v7)
      v11 = 0;
    else
      v11 = v6;
    v12 = (void *)objc_msgSend(v8, "initWithCategoryID:appBundleIDs:localizedName:", 6, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_getEnterpriseCategoriesForApps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v19 = v4;
  -[ATXAppDirectoryOrderingProvider _groupEnterpriseAppsByIssuerWithBundleIDs:isMDM:](self, "_groupEnterpriseAppsByIssuerWithBundleIDs:isMDM:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("kATXEnterprise"));
        v13 = objc_alloc(MEMORY[0x1E0CF8C98]);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copy");
        if (v12)
          v16 = 0;
        else
          v16 = v11;
        v17 = (void *)objc_msgSend(v13, "initWithCategoryID:appBundleIDs:localizedName:", 1, v15, v16);

        objc_msgSend(v5, "addObject:", v17);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_shiftAppIndices:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    objc_msgSend(v6, "objectsAtIndexes:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsAtIndexes:", v5);
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  return v7 != 0;
}

- (void)_reorderAndHideDupesForAppsInCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__ATXAppDirectoryOrderingProvider__reorderAndHideDupesForAppsInCategory___block_invoke;
  v11[3] = &unk_1E82DC700;
  v11[4] = self;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  -[ATXAppDirectoryOrderingProvider _shiftAppIndices:category:](self, "_shiftAppIndices:category:", v10, v4);
  -[ATXAppDirectoryOrderingProvider _shiftAppIndices:category:](self, "_shiftAppIndices:category:", v8, v4);
  -[ATXAppDirectoryOrderingProvider _shiftAppIndices:category:](self, "_shiftAppIndices:category:", v9, v4);

}

void __73__ATXAppDirectoryOrderingProvider__reorderAndHideDupesForAppsInCategory___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "containsObject:", v5);
    v5 = v10;
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      v5 = v10;
      if (v9 < 5.0)
      {
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
        v5 = v10;
      }
    }
  }
  if (objc_msgSend(MEMORY[0x1E0CF8CE8], "isOffloadedForBundle:", v5))
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", v10))
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);

}

- (id)_computeCategoriesWithRetries:(unint64_t)a3
{
  NSDictionary *appLaunchCounts;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSSet *v39;
  NSSet *homescreenAppsToDedupeAgainst;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  id obj;
  void *v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  appLaunchCounts = self->_appLaunchCounts;
  if (!appLaunchCounts)
  {
    -[ATXAppDirectoryOrderingProvider _updateAppLaunchCounts](self, "_updateAppLaunchCounts");
    appLaunchCounts = self->_appLaunchCounts;
  }
  -[NSDictionary allKeys](appLaunchCounts, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CF8CD8], "hiddenBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v8);

  -[ATXAppDirectoryOrderingProvider _updateScreenTimeMappingsForAppBundleIds:withRetries:](self, "_updateScreenTimeMappingsForAppBundleIds:withRetries:", v7, a3);
  __atxlog_handle_app_library();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ATXAppDirectoryOrderingProvider _computeCategoriesWithRetries:].cold.3((uint64_t)self, v9);

  v10 = (void *)objc_opt_new();
  v72 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v87 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:](self, "_genreIdFromBundleId:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v17, v15);

        -[ATXAppDirectoryOrderingProvider _screenTimeIdFromBundleId:](self, "_screenTimeIdFromBundleId:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v15);

        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    }
    while (v12);
  }

  if (objc_msgSend(obj, "count"))
  {
    +[ATXAppDirectoryHierarchyNode dynamicCategoriesForAppBundleIDs:screenTimeMappings:iTunesMappings:](ATXAppDirectoryHierarchyNode, "dynamicCategoriesForAppBundleIDs:screenTimeMappings:iTunesMappings:", obj, v10, v72);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (void *)objc_opt_new();
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v83 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAppDirectoryOrderingProvider _appBundleIDTotalLaunchComparator](self, "_appBundleIDTotalLaunchComparator");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sortUsingComparator:", v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    }
    while (v22);
  }
  v70 = v10;

  -[_ATXAppIconState nonFolderAppSetOnPages](self->_appIconState, "nonFolderAppSetOnPages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_ATXAppIconState getFirstVisiblePageIndex](self->_appIconState, "getFirstVisiblePageIndex"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
    v31 = v29;
  else
    v31 = (id)objc_opt_new();
  v32 = v31;

  __atxlog_handle_app_library();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[ATXAppDirectoryOrderingProvider _computeCategoriesWithRetries:].cold.2((id *)&self->_appIconState, v33);

  -[_ATXAppIconState allDockedApps](self->_appIconState, "allDockedApps");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  v36 = v70;
  if (v34)
    v37 = v34;
  else
    v37 = (id)objc_opt_new();
  v38 = v37;

  v66 = v38;
  v67 = v32;
  objc_msgSend(v32, "setByAddingObjectsFromSet:", v38);
  v39 = (NSSet *)objc_claimAutoreleasedReturnValue();
  homescreenAppsToDedupeAgainst = self->_homescreenAppsToDedupeAgainst;
  self->_homescreenAppsToDedupeAgainst = v39;

  __atxlog_handle_app_library();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[ATXAppDirectoryOrderingProvider _computeCategoriesWithRetries:].cold.1((uint64_t *)&self->_homescreenAppsToDedupeAgainst, v41, v42);

  v43 = (void *)objc_opt_new();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v44 = v20;
  v73 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v73)
  {
    v45 = *(_QWORD *)v79;
    v68 = *(_QWORD *)v79;
    v69 = v44;
    do
    {
      for (k = 0; k != v73; ++k)
      {
        if (*(_QWORD *)v79 != v45)
          objc_enumerationMutation(v44);
        v47 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
        if (objc_msgSend(v47, "unsignedIntegerValue") == 1)
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXAppDirectoryOrderingProvider _getEnterpriseCategoriesForApps:](self, "_getEnterpriseCategoriesForApps:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v50 = v49;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v75;
            do
            {
              for (m = 0; m != v52; ++m)
              {
                if (*(_QWORD *)v75 != v53)
                  objc_enumerationMutation(v50);
                v55 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * m);
                objc_msgSend(v55, "appBundleIDs");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = (void *)objc_msgSend(v56, "mutableCopy");

                -[ATXAppDirectoryOrderingProvider _reorderAndHideDupesForAppsInCategory:](self, "_reorderAndHideDupesForAppsInCategory:", v57);
                objc_msgSend(v55, "updateAppBundleIDs:", v57);
                objc_msgSend(v43, "addObject:", v55);

              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
            }
            while (v52);
            v58 = v50;
            v44 = v69;
            v36 = v70;
            v45 = v68;
          }
          else
          {
            v58 = v50;
          }
        }
        else
        {
          v59 = objc_msgSend(v47, "unsignedIntegerValue");
          objc_msgSend(v44, "objectForKeyedSubscript:", v47);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59 == 6)
          {
            -[ATXAppDirectoryOrderingProvider _mdmEnterpriseCategoriesForApps:](self, "_mdmEnterpriseCategoriesForApps:", v60);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v58)
              goto LABEL_52;
            objc_msgSend(v58, "appBundleIDs");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (id)objc_msgSend(v61, "mutableCopy");

            -[ATXAppDirectoryOrderingProvider _reorderAndHideDupesForAppsInCategory:](self, "_reorderAndHideDupesForAppsInCategory:", v50);
            objc_msgSend(v58, "updateAppBundleIDs:", v50);
            objc_msgSend(v43, "addObject:", v58);
          }
          else
          {
            -[ATXAppDirectoryOrderingProvider _reorderAndHideDupesForAppsInCategory:](self, "_reorderAndHideDupesForAppsInCategory:", v60);

            v62 = objc_alloc(MEMORY[0x1E0CF8C98]);
            v63 = objc_msgSend(v47, "unsignedIntegerValue");
            objc_msgSend(v44, "objectForKeyedSubscript:", v47);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (id)objc_msgSend(v58, "copy");
            v64 = (void *)objc_msgSend(v62, "initWithCategoryID:appBundleIDs:", v63, v50);
            objc_msgSend(v43, "addObject:", v64);

          }
        }

LABEL_52:
      }
      v73 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    }
    while (v73);
  }

  return v43;
}

- (id)_sortCategories:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  if (!self->_appLaunchCounts)
    -[ATXAppDirectoryOrderingProvider _updateAppLaunchCounts](self, "_updateAppLaunchCounts");
  -[ATXAppDirectoryOrderingProvider _categoryComparator](self, "_categoryComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_postProcessCategories:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (!v8)
  {

    v11 = 0;
    v10 = 0;
LABEL_28:
    v29 = v30;
    (*((void (**)(id, id, _QWORD))v30 + 2))(v30, v7, 0);
    goto LABEL_29;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v39 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      if (objc_msgSend(v14, "categoryID", v30) == 6014 || objc_msgSend(v14, "categoryID") == 1000)
      {
        v15 = v14;

        v11 = v15;
      }
      if (objc_msgSend(v14, "categoryID") == 2)
      {
        v16 = v14;

        v10 = v16;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  }
  while (v9);

  if (!v11 || !v10)
    goto LABEL_28;
  v33 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v17)
  {
    v18 = v17;
    v32 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        if (objc_msgSend(v20, "categoryID") == 6014 || objc_msgSend(v20, "categoryID") == 1000)
        {
          v21 = objc_alloc(MEMORY[0x1E0CF8C98]);
          v22 = v7;
          v23 = objc_msgSend(v20, "categoryID");
          objc_msgSend(v20, "appBundleIDs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appBundleIDs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v23;
          v7 = v22;
          v28 = (void *)objc_msgSend(v21, "initWithCategoryID:appBundleIDs:", v27, v26);
          objc_msgSend(v33, "addObject:", v28);

        }
        else
        {
          objc_msgSend(v33, "addObject:", v20);
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v18);
  }

  v29 = v30;
  (*((void (**)(id, void *, _QWORD))v30 + 2))(v30, v33, 0);

LABEL_29:
}

- (void)categoriesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Scheduling categorization processing on the server's queue", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ATXAppDirectoryOrderingProvider_categoriesWithReply___block_invoke;
  v8[3] = &unk_1E82DA8E8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);

}

void __55__ATXAppDirectoryOrderingProvider_categoriesWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Will process categorization from server", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_postProcessCategories:withReply:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), *(_QWORD *)(a1 + 40));
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Did process categorization from server", v4, 2u);
  }

}

- (void)topAppsWithMaxNumberOfResults:(unint64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATXAppDirectoryOrderingProvider_topAppsWithMaxNumberOfResults_reply___block_invoke;
  block[3] = &unk_1E82DC728;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __71__ATXAppDirectoryOrderingProvider_topAppsWithMaxNumberOfResults_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8D28], "clientForConsumerType:", 15);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(a1[4] + 32);
  }
  if (a1[6] >= 0x7FFFFFFFuLL)
    v6 = 0x7FFFFFFFLL;
  else
    v6 = a1[6];
  objc_msgSend(v2, "appPredictionsForConsumerSubType:limit:", 35, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1[5];
  if (v7)
  {
    objc_msgSend(v10, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    objc_msgSend(v10, "predictedApps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);
  }

}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATXAppDirectoryOrderingProvider_appLaunchDatesWithReply___block_invoke;
  v7[3] = &unk_1E82DA8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __59__ATXAppDirectoryOrderingProvider_appLaunchDatesWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastLaunchDateForBundleId:", v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestNotificationWhenCategoriesAreReady
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ATXAppDirectoryOrderingProvider_requestNotificationWhenCategoriesAreReady__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

void __76__ATXAppDirectoryOrderingProvider_requestNotificationWhenCategoriesAreReady__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "timeIntervalSinceNow");
  v3 = v2;
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Last update interval %f", (uint8_t *)&v5, 0xCu);
  }

  if (v3 < -10.0)
    objc_msgSend(*(id *)(a1 + 32), "_postUpdateNotificationWithReason:", CFSTR("Defaults requested earlier - real categorization warmup complete"));
}

- (void)_registerForManagedAppsOrgInfoChangedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleManagedAppsOrgInfoChangedNotification, *MEMORY[0x1E0D471C8], 0);

}

- (void)_registerForManagedAppsChangedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleManagedAppsChangedNotification, *MEMORY[0x1E0D471C0], 0);

}

- (void)_handleManagedAppsOrgInfoChangedNotification
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@: MCManagingOrgInfo changed, refresh enterprise category name", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ATXAppDirectoryOrderingProvider__handleManagedAppsOrgInfoChangedNotification__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __79__ATXAppDirectoryOrderingProvider__handleManagedAppsOrgInfoChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMDMCategoryName");
}

- (void)_handleManagedAppsChangedNotification
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@: Managed apps changed, refresh enterprise category name", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ATXAppDirectoryOrderingProvider__handleManagedAppsChangedNotification__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __72__ATXAppDirectoryOrderingProvider__handleManagedAppsChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMDMAndEnterpriseCategories");
}

+ (BOOL)isStoreDemoMode
{
  return CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0) != 0;
}

- (BOOL)isMarketingDemoMode
{
  return -[NSUserDefaults BOOLForKey:](self->_atxDefaults, "BOOLForKey:", CFSTR("ATXMarketingDemoMode"));
}

- (void)appLaunchInformationWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ATXAppDirectoryOrderingProvider_appLaunchInformationWithReply___block_invoke;
  v7[3] = &unk_1E82DA8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __65__ATXAppDirectoryOrderingProvider_appLaunchInformationWithReply___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[1])
    objc_msgSend(v2, "_updateAppLaunchCounts");
  v3 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        v12 = v11;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v15 = v14;

        objc_msgSend(*(id *)(a1 + 32), "_combinedLaunchCountForBundleId:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("General Launch Counts: %f, Library Launch Counts: %f, Weighted Total Launch Counts: %f"), v12, v15, v18);
        objc_msgSend(v3, "addObject:", v19);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v20 = (void *)MEMORY[0x1E0C99D80];
  v21 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:", v3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v23, 0);

}

- (void)categoryLaunchInformationWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ATXAppDirectoryOrderingProvider_categoryLaunchInformationWithReply___block_invoke;
  v7[3] = &unk_1E82DA8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __70__ATXAppDirectoryOrderingProvider_categoryLaunchInformationWithReply___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  double v18;
  float v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[1])
    objc_msgSend(v2, "_updateAppLaunchCounts");
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 272);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "categoryID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        objc_msgSend(*(id *)(a1 + 32), "_totalLaunchCountsForCategory:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        objc_msgSend(*(id *)(a1 + 32), "_totalLibraryLaunchCountsForCategory:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v16 = v15;

        v17 = v13;
        v18 = v16;
        v19 = v17 + v18 * 10.0;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("General Launch Counts: %f, Library Launch Counts: %f, Weighted Total Launch Counts: %f"), *(_QWORD *)&v17, *(_QWORD *)&v18, v19);
        objc_msgSend(v4, "addObject:", v20);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v21 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v4, v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);

}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_atxDefaults, 0);
  objc_storeStrong((id *)&self->_lastUpdatePostTime, 0);
  objc_storeStrong((id *)&self->_sbsHomeScreenService, 0);
  objc_storeStrong((id *)&self->_managingOrganizationName, 0);
  objc_storeStrong((id *)&self->_managedAppIDs, 0);
  objc_storeStrong((id *)&self->_homescreenAppsToDedupeAgainst, 0);
  objc_storeStrong((id *)&self->_appScreenTimeCategoryMappings, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_appClipChangeListener, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_appClipDataProvider, 0);
  objc_storeStrong((id *)&self->_recentsCache, 0);
  objc_storeStrong((id *)&self->_hiddenAppsCache, 0);
  objc_storeStrong((id *)&self->_recentApps, 0);
  objc_storeStrong((id *)&self->_blacklistedBundleIds, 0);
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_hardcodedAppCategoryScreenTimeMappings, 0);
  objc_storeStrong((id *)&self->_hardcodedAppCategoryMappings, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_unhiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_hiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_installingNotification, 0);
  objc_storeStrong((id *)&self->_offloadNotification, 0);
  objc_storeStrong((id *)&self->_installNotification, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_infoManager, 0);
  objc_storeStrong((id *)&self->_atxClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_libraryAppLaunchCounts, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
}

void __175__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: Suggestions settings have changed - requesting refresh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_readCategoriesFromDisk
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "ATXAppDirectoryOrderingProvider: Deserialize categories failed: data is of incorrect format", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_getInstallDateForUnhiddenApp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: LS app registration date shouldn't be nil for unhidden app, falling back to now", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_updateRecentsForAppClipUsageEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: webAppBundleId should not be nil for an ATXAppClipUsageDuetEvent. Event: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_genreIdFromBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5_1(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: Enterprise/MDM app: %@ shouldn't have the signer as: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_screenTimeIdFromBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: CTCategories timed out when requesting categorization for bundle %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: Error when trying to request screen time categories for apps. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateScreenTimeMappingsForAppBundleIds:withRetries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: Timed out when requesting all app categories from CTCategory", v2);
  OUTLINED_FUNCTION_4();
}

void __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_165_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4(&dword_1C9A3B000, v0, v1, "ATXAppDirectoryOrderingProvider: Category retrieval hit maximum number of retries", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_issuingOrganizationForEnterpriseAppBundleID:isMDM:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "app - %@ is not UPP app", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_issuingOrganizationForEnterpriseAppBundleID:isMDM:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "app - %@ is not TestFlight app", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_mdmEnterpriseCategoriesForApps:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, v3, "Number of MDM categories should only be 1 while current is: %lu", v4);
  OUTLINED_FUNCTION_1();
}

- (void)_computeCategoriesWithRetries:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, a3, "ATXAppDirectoryOrderingProvider: Set to dedupe against: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_computeCategoriesWithRetries:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*a1, "getFirstVisiblePageIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v4, "ATXAppDirectoryOrderingProvider: first visible page: %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_computeCategoriesWithRetries:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 184), "getFirstVisiblePageIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v4, "ATXAppDirectoryOrderingProvider: first visible page: %@", v5);

  OUTLINED_FUNCTION_1();
}

@end
