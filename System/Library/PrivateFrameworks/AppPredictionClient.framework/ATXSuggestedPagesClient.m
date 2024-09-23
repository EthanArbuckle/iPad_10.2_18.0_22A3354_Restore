@implementation ATXSuggestedPagesClient

- (ATXSuggestedPagesClient)init
{
  ATXSuggestedPagesClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXSuggestedPagesClient;
  v2 = -[ATXSuggestedPagesClient init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.SuggestedPages"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = v2->_xpcConnection;
    ATXSuggestedPagesInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_5);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_3);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("ATXSuggestedPagesClient.queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

void __31__ATXSuggestedPagesClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __31__ATXSuggestedPagesClient_init__block_invoke_cold_1(v0);

}

void __31__ATXSuggestedPagesClient_init__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_INFO, "ATXSuggestedPagesClient: invalidation handler called", v1, 2u);
  }

}

- (void)suggestedPagesWithFilter:(id)a3 layoutOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ATXSuggestedPagesClient *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke;
  v15[3] = &unk_1E4D57D00;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "cachedSuggestedPagesForPageType:", objc_msgSend(*(id *)(a1 + 32), "pageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesClient: Shortcircuiting call to duetexpertd and returning cached pages", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_6;
    v7[3] = &unk_1E4D571E0;
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestedPagesWithFilter:layoutOptions:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_6_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSuggestedPagesWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__ATXSuggestedPagesClient_updateSuggestedPagesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSuggestedPagesWithCompletionHandler:", v6);

}

uint64_t __69__ATXSuggestedPagesClient_updateSuggestedPagesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)allowsSuggestionsForModeUUID:(id)a3
{
  id v4;
  ATXHomeScreenConfigCache *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  -[ATXSuggestedPagesClient _createInstalledPagesTrackerIfNeeded](self, "_createInstalledPagesTrackerIfNeeded");
  v5 = objc_alloc_init(ATXHomeScreenConfigCache);
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](v5, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 15)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Not allowing suggested pages; the user is already at the page limit",
        buf,
        2u);
    }

    v8 = 0;
  }
  else
  {
    -[ATXInstalledSuggestedPagesTracker identifierOfSuggestedPageForModeUUID:](self->_tracker, "identifierOfSuggestedPageForModeUUID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__ATXSuggestedPagesClient_allowsSuggestionsForModeUUID___block_invoke;
      v14[3] = &unk_1E4D57D28;
      v15 = v9;
      objc_msgSend(v6, "bs_firstObjectPassingTest:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "associatedModeUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "count") == 0;

      }
      else
      {
        v8 = 1;
      }

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

uint64_t __56__ATXSuggestedPagesClient_allowsSuggestionsForModeUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (CGImage)cachedSnapshotForSuggestedPageWithIdentifier:(id)a3
{
  return 0;
}

- (void)didInstallSuggestedPage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ATXInstalledSuggestedPagesTracker *tracker;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[ATXSuggestedPagesClient _createInstalledPagesTrackerIfNeeded](self, "_createInstalledPagesTrackerIfNeeded");
    tracker = self->_tracker;
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "associatedModeUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInstalledSuggestedPagesTracker storePageIdentifier:modeUUID:forPageType:](tracker, "storePageIdentifier:modeUUID:forPageType:", v8, v10, objc_msgSend(v4, "suggestedPageType"));

  }
  else
  {
    __atxlog_handle_modes();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXSuggestedPagesClient didInstallSuggestedPage:].cold.1(v11);

  }
}

- (void)didAddAppsWithBundleIds:(id)a3 suggestedPage:(id)a4
{
  ATXInstalledSuggestedPagesTracker *tracker;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  tracker = self->_tracker;
  v7 = a4;
  v10 = a3;
  v8 = objc_msgSend(v7, "suggestedPageType");
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInstalledSuggestedPagesTracker trackSuggestedHomePageWithAction:pageType:identifier:](tracker, "trackSuggestedHomePageWithAction:pageType:identifier:", 2, v8, v9);

  -[ATXSuggestedPagesClient sendModificationMetricsToCoreAnalyticsWithBundleIds:suggestedPage:isAdded:](self, "sendModificationMetricsToCoreAnalyticsWithBundleIds:suggestedPage:isAdded:", v10, v7, 1);
}

- (void)didRemoveAppsWithBundleIds:(id)a3 suggestedPage:(id)a4
{
  ATXInstalledSuggestedPagesTracker *tracker;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  tracker = self->_tracker;
  v7 = a4;
  v10 = a3;
  v8 = objc_msgSend(v7, "suggestedPageType");
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInstalledSuggestedPagesTracker trackSuggestedHomePageWithAction:pageType:identifier:](tracker, "trackSuggestedHomePageWithAction:pageType:identifier:", 2, v8, v9);

  -[ATXSuggestedPagesClient sendModificationMetricsToCoreAnalyticsWithBundleIds:suggestedPage:isAdded:](self, "sendModificationMetricsToCoreAnalyticsWithBundleIds:suggestedPage:isAdded:", v10, v7, 0);
}

- (void)sendModificationMetricsToCoreAnalyticsWithBundleIds:(id)a3 suggestedPage:(id)a4 isAdded:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__ATXSuggestedPagesClient_sendModificationMetricsToCoreAnalyticsWithBundleIds_suggestedPage_isAdded___block_invoke;
  block[3] = &unk_1E4D57D50;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

}

void __101__ATXSuggestedPagesClient_sendModificationMetricsToCoreAnalyticsWithBundleIds_suggestedPage_isAdded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setSource:", 0);
        NSStringFromATXSuggestedPageType(objc_msgSend(*(id *)(a1 + 40), "suggestedPageType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSuggestedPageType:", v8);

        if (*(_BYTE *)(a1 + 48))
          v9 = CFSTR("AppAdded");
        else
          v9 = CFSTR("AppRemoved");
        objc_msgSend(v7, "setEventType:", v9);
        objc_msgSend(v7, "setAppBundleId:", v6);
        objc_msgSend(v7, "logToCoreAnalytics");

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

- (void)_createInstalledPagesTrackerIfNeeded
{
  ATXInstalledSuggestedPagesTracker *v3;
  ATXInstalledSuggestedPagesTracker *tracker;

  if (!self->_tracker)
  {
    v3 = objc_alloc_init(ATXInstalledSuggestedPagesTracker);
    tracker = self->_tracker;
    self->_tracker = v3;

  }
}

+ (BOOL)shouldShowInternalFeedbackUI
{
  return objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
}

+ (id)tapToRadarURLForModeName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D81590], "currentOsBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81588], "internalDeviceCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v5)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("💬 %@ Page Suggestion Feedback"), v3, v18, v19);
  else
    v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("💬 %@/%@: %@ Page Suggestion Feedback"), v5, v4, v3);
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("= = = Provide %@ Suggestion Feedback = = =\n\nAre there any apps or widgets that are missing that you would expect to see? If so, which ones?\n- - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n\nAre there any apps or widgets that should not be there? If so, which ones?\n- - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n\nAdditional Notes\n- - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n"), v3);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tap-to-radar://new?ComponentID=1153724&ComponentName=Proactive%%20Mode%%20Intelligence&ComponentVersion=All&Classification=Enhancement&Reproducibility=Not%%20Applicable&Title=%@&Description=%@"), v11, v14);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __31__ATXSuggestedPagesClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesClient: interruption handler called", v1, 2u);
}

void __84__ATXSuggestedPagesClient_suggestedPagesWithFilter_layoutOptions_completionHandler___block_invoke_6_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesClient: XPC failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)didInstallSuggestedPage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "A suggested page was installed but we did not get a unique identifier back in feedback.", v1, 2u);
}

@end
