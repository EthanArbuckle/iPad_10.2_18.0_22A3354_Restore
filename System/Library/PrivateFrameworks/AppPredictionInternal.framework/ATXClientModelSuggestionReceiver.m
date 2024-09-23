@implementation ATXClientModelSuggestionReceiver

- (BOOL)rerouteSuggestions:(id)a3 clientModelId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ATXClientModelSuggestionRouter shouldRouteClientToInfoSuggestionEngine:](self->_router, "shouldRouteClientToInfoSuggestionEngine:", v9);
  if (v11)
    -[ATXClientModelSuggestionReceiver routeSuggestionsToInfoSuggestionEngine:clientModelId:completion:](self, "routeSuggestionsToInfoSuggestionEngine:clientModelId:completion:", v8, v9, v10);

  return v11;
}

+ (ATXClientModelSuggestionReceiver)sharedInstance
{
  if (sharedInstance__pasOnceToken6_27 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_27, &__block_literal_global_150);
  return (ATXClientModelSuggestionReceiver *)(id)sharedInstance__pasExprOnceResult_35;
}

- (ATXUniversalBlendingLayerServer)blendingLayerServer
{
  return self->_blendingLayerServer;
}

void __50__ATXClientModelSuggestionReceiver_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_35;
  sharedInstance__pasExprOnceResult_35 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXClientModelSuggestionReceiver)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ATXClientModelSuggestionReceiver *v13;

  v3 = objc_alloc(MEMORY[0x1E0D81250]);
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "layoutSelectorsForConsumerSubTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithSuggestionPreprocessor:delegate:layoutSelectorsForConsumerSubTypes:blendingSessionLogger:hyperParameters:", v4, self, v5, v6, v7);

  v9 = objc_alloc(MEMORY[0x1E0D81258]);
  objc_msgSend(MEMORY[0x1E0CF8DF8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithBlendingLayer:engagementRecordsManager:hyperParameters:serverDelegate:", v8, v10, v11, self);

  v13 = -[ATXClientModelSuggestionReceiver initWithBlendingLayerServer:](self, "initWithBlendingLayerServer:", v12);
  return v13;
}

- (ATXClientModelSuggestionReceiver)initWithBlendingLayerServer:(id)a3
{
  id v5;
  ATXClientModelSuggestionReceiver *v6;
  ATXClientModelSuggestionReceiver *v7;
  uint64_t v8;
  ATXClientModelCacheManagerProtocol *clientModelCacheManager;
  uint64_t v10;
  ATXAppSwitcherSuggestionSender *appSwitcherSuggestionSender;
  uint64_t v12;
  ATXHomeScreenSuggestionSender *homeScreenSuggestionSender;
  uint64_t v14;
  ATXLockscreenSuggestionSender *lockscreenSuggestionSender;
  uint64_t v16;
  ATXWatchSmartStacksSender *watchSmartStacksSender;
  uint64_t v18;
  ATXSpotlightActionsSuggestionSender *spotlightActionsSuggestionSender;
  uint64_t v20;
  ATXClientModelSuggestionRouter *router;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXClientModelSuggestionReceiver;
  v6 = -[ATXClientModelSuggestionReceiver init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_blendingLayerServer, a3);
    objc_msgSend(v5, "clientModelCacheManager");
    v8 = objc_claimAutoreleasedReturnValue();
    clientModelCacheManager = v7->_clientModelCacheManager;
    v7->_clientModelCacheManager = (ATXClientModelCacheManagerProtocol *)v8;

    v10 = objc_opt_new();
    appSwitcherSuggestionSender = v7->_appSwitcherSuggestionSender;
    v7->_appSwitcherSuggestionSender = (ATXAppSwitcherSuggestionSender *)v10;

    v12 = objc_opt_new();
    homeScreenSuggestionSender = v7->_homeScreenSuggestionSender;
    v7->_homeScreenSuggestionSender = (ATXHomeScreenSuggestionSender *)v12;

    v14 = objc_opt_new();
    lockscreenSuggestionSender = v7->_lockscreenSuggestionSender;
    v7->_lockscreenSuggestionSender = (ATXLockscreenSuggestionSender *)v14;

    v16 = objc_opt_new();
    watchSmartStacksSender = v7->_watchSmartStacksSender;
    v7->_watchSmartStacksSender = (ATXWatchSmartStacksSender *)v16;

    v18 = objc_opt_new();
    spotlightActionsSuggestionSender = v7->_spotlightActionsSuggestionSender;
    v7->_spotlightActionsSuggestionSender = (ATXSpotlightActionsSuggestionSender *)v18;

    v20 = objc_opt_new();
    router = v7->_router;
    v7->_router = (ATXClientModelSuggestionRouter *)v20;

  }
  return v7;
}

- (void)start
{
  void *v3;
  _ATXInternalUninstallNotification *v4;
  _ATXInternalUninstallNotification *uninstallNotificationListener;
  _ATXInternalUninstallNotification *v6;
  id v7;
  UNUserNotificationCenter *v8;
  UNUserNotificationCenter *notificationCenter;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[ATXUniversalBlendingLayerServer start](self->_blendingLayerServer, "start");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sendStackChangeDebugNotification_, *MEMORY[0x1E0CF9318], 0);

  v4 = (_ATXInternalUninstallNotification *)objc_opt_new();
  uninstallNotificationListener = self->_uninstallNotificationListener;
  self->_uninstallNotificationListener = v4;

  v6 = self->_uninstallNotificationListener;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __41__ATXClientModelSuggestionReceiver_start__block_invoke;
  v13 = &unk_1E82DAE98;
  objc_copyWeak(&v14, &location);
  -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v6, "registerForNotificationsWithUninstallBlock:", &v10);
  if (_PASIsInternalDevice())
  {
    v7 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    v8 = (UNUserNotificationCenter *)objc_msgSend(v7, "initWithBundleIdentifier:", CFSTR("com.apple.ATXDebugNotifications"), v10, v11, v12, v13);
    notificationCenter = self->_notificationCenter;
    self->_notificationCenter = v8;

    -[UNUserNotificationCenter setDelegate:](self->_notificationCenter, "setDelegate:", self);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_notificationCenter, "setWantsNotificationResponsesDelivered");
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](self->_notificationCenter, "requestAuthorizationWithOptions:completionHandler:", 6, &__block_literal_global_32);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[14], "refreshBlendingLayer");
  }
  else
  {
    __atxlog_handle_blending();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __41__ATXClientModelSuggestionReceiver_start__block_invoke_cold_1(v3);

  }
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke_30(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "StackChangeDebugNotification: notification authorized = %d", (uint8_t *)v13, 8u);
  }

  if (v4)
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__ATXClientModelSuggestionReceiver_start__block_invoke_30_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)dealloc
{
  int homeScreenStackChangeDarwinNotificationObserver;
  objc_super v4;

  homeScreenStackChangeDarwinNotificationObserver = self->_homeScreenStackChangeDarwinNotificationObserver;
  if (homeScreenStackChangeDarwinNotificationObserver)
  {
    notify_cancel(homeScreenStackChangeDarwinNotificationObserver);
    self->_homeScreenStackChangeDarwinNotificationObserver = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXClientModelSuggestionReceiver;
  -[ATXClientModelSuggestionReceiver dealloc](&v4, sel_dealloc);
}

+ (id)layoutSelectorsForConsumerSubTypes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ATXSpotlightLayoutSelector *v9;
  void *v10;
  void *v11;
  ATXSpotlightLayoutSelector *v12;
  void *v13;
  _QWORD v15[13];
  _QWORD v16[14];

  v16[13] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0D81170]);
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSuggestionDeduplicator:hyperParameters:", v6, v7);

  v9 = [ATXSpotlightLayoutSelector alloc];
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXSpotlightLayoutSelector initWithSuggestionDeduplicator:hyperParameters:](v9, "initWithSuggestionDeduplicator:hyperParameters:", v10, v11);

  v15[0] = &unk_1E83CD468;
  v15[1] = &unk_1E83CD480;
  v16[0] = v4;
  v16[1] = v8;
  v15[2] = &unk_1E83CD498;
  v15[3] = &unk_1E83CD4B0;
  v16[2] = v12;
  v16[3] = v8;
  v15[4] = &unk_1E83CD4C8;
  v15[5] = &unk_1E83CD4E0;
  v16[4] = v8;
  v16[5] = v8;
  v15[6] = &unk_1E83CD4F8;
  v15[7] = &unk_1E83CD510;
  v16[6] = v8;
  v16[7] = v8;
  v15[8] = &unk_1E83CD528;
  v15[9] = &unk_1E83CD540;
  v16[8] = v8;
  v16[9] = v8;
  v15[10] = &unk_1E83CD558;
  v15[11] = &unk_1E83CD570;
  v16[10] = v8;
  v16[11] = v2;
  v15[12] = &unk_1E83CD588;
  v16[12] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_sendStackChangeDebugNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (self->_notificationCenter)
  {
    v4 = a3;
    v25 = (id)objc_opt_new();
    objc_msgSend(v25, "setTitle:", CFSTR("Widget Stack Change Alert"));
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *MEMORY[0x1E0CF9320];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9320]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0CF9338]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

    v10 = (void *)MEMORY[0x1E0CB3940];
    if (v9)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9328]);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("unknown");
      if (v11)
        v13 = (const __CFString *)v11;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("The suggested widget on the Today page changed to %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBody:", v14);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v15;
      if (v15)
        v16 = (const __CFString *)v15;
      else
        v16 = CFSTR("unknown");
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9328]);
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v17;
      if (v17)
        v18 = (const __CFString *)v17;
      else
        v18 = CFSTR("unknown");
      objc_msgSend(v10, "stringWithFormat:", CFSTR("The suggested widget on page %@ changed to %@"), v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBody:", v19);

    }
    objc_msgSend(MEMORY[0x1E0CEC790], "triggerWithTimeInterval:repeats:", 0, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CEC740];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requestWithIdentifier:content:trigger:", v23, v25, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_notificationCenter, "addNotificationRequest:withCompletionHandler:", v24, &__block_literal_global_70_0);
  }
}

void __70__ATXClientModelSuggestionReceiver__sendStackChangeDebugNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__ATXClientModelSuggestionReceiver__sendStackChangeDebugNotification___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)blendingLayerRerankedSuggestions:(id)a3 consumerSubType:(unsigned __int8)a4
{
  id v4;
  id v5;

  if (a4 == 34)
  {
    v4 = a3;
    +[ATXContextualEngine sharedInstance](ATXContextualEngine, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "donateRerankedBlendingSuggestions:", v4);

  }
}

- (void)blendingLayerUpdatedUICache:(id)a3 consumerSubType:(unsigned __int8)a4
{
  int v4;
  id v7;
  void *v8;
  ATXAppDirectoryOrderingProvider *appDirectoryOrderingProvider;
  ATXAppDirectoryOrderingProvider *v10;
  ATXAppDirectoryOrderingProvider *v11;
  id v12;
  ATXHomeScreenSuggestionSender *homeScreenSuggestionSender;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  uint8_t buf[8];
  _QWORD v34[5];

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if (v4 <= 33)
  {
    switch(v4)
    {
      case 21:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v8;
        else
          v14 = 0;
        -[ATXSpotlightActionsSuggestionSender blendingLayerDidUpdateSpotlightUICache:](self->_spotlightActionsSuggestionSender, "blendingLayerDidUpdateSpotlightUICache:", v14);

        break;
      case 22:
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXClientModelSuggestionReceiver.m"), 259, CFSTR("Expected cache update being pushed to lockscreen to be of type %@, but got an object of another type instead %@"), v30, v32);

          }
          v15 = v8;
        }
        -[ATXLockscreenSuggestionSender blendingLayerDidUpdateLockscreenUICache:](self->_lockscreenSuggestionSender, "blendingLayerDidUpdateLockscreenUICache:", v8);
        goto LABEL_31;
      case 31:
        -[ATXAppSwitcherSuggestionSender blendingLayerDidUpdateAppSwitcherUICache](self->_appSwitcherSuggestionSender, "blendingLayerDidUpdateAppSwitcherUICache");
        break;
    }
  }
  else
  {
    if (v4 <= 45)
    {
      if (v4 == 34)
      {
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXClientModelSuggestionReceiver.m"), 228, CFSTR("Expected cache update being pushed to homescreen to be of type %@, but got an object of another type instead %@"), v25, v27);

          }
          homeScreenSuggestionSender = self->_homeScreenSuggestionSender;
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke;
          v34[3] = &unk_1E82E6638;
          v34[4] = self;
          -[ATXHomeScreenSuggestionSender blendingLayerDidUpdateHomeScreenCachedSuggestions:completion:](homeScreenSuggestionSender, "blendingLayerDidUpdateHomeScreenCachedSuggestions:completion:", v8, v34);
        }
      }
      else if (v4 == 35 && v7)
      {
        appDirectoryOrderingProvider = self->_appDirectoryOrderingProvider;
        if (!appDirectoryOrderingProvider)
        {
          +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
          v10 = (ATXAppDirectoryOrderingProvider *)objc_claimAutoreleasedReturnValue();
          v11 = self->_appDirectoryOrderingProvider;
          self->_appDirectoryOrderingProvider = v10;

          appDirectoryOrderingProvider = self->_appDirectoryOrderingProvider;
        }
        -[ATXAppDirectoryOrderingProvider postPredictedAppsAndRecentsUpdateNotificationWithReason:](appDirectoryOrderingProvider, "postPredictedAppsAndRecentsUpdateNotificationWithReason:", CFSTR("Suggestions Cache Updated"));
      }
      goto LABEL_37;
    }
    if (v4 != 46)
    {
      if (v4 != 47)
        goto LABEL_37;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXClientModelSuggestionReceiver.m"), 270, CFSTR("Expected cache update being pushed to Watch to be of type %@, but got an object of another type instead %@"), v20, v22);

        }
        v12 = v8;
      }
      -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:](self->_watchSmartStacksSender, "blendingLayerDidUpdateUICache:", v8);
LABEL_31:

      goto LABEL_37;
    }
    __atxlog_handle_settings_actions();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Posting distributed notification about settings action suggestions refresh", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", *MEMORY[0x1E0CF8AF8], 0);

  }
LABEL_37:

}

void __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = (id)objc_opt_self();
  if (v2)
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)routeSuggestionsToInfoSuggestionEngine:(id)a3 clientModelId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Blending: route suggestions to the info engine", buf, 2u);
  }

  +[ATXInfoSuggestionServer sharedInstance](ATXInfoSuggestionServer, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__ATXClientModelSuggestionReceiver_routeSuggestionsToInfoSuggestionEngine_clientModelId_completion___block_invoke;
  v16[3] = &unk_1E82E6660;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v12, "overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:", v14, v15, v16);

}

void __100__ATXClientModelSuggestionReceiver_routeSuggestionsToInfoSuggestionEngine_clientModelId_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v5 && objc_msgSend(*(id *)(a1[4] + 8), "shouldPersistCacheForClientModel:", a1[5]))
  {
    v6 = (void *)objc_opt_class();
    if (v9)
    {
      v7 = *(_QWORD *)(a1[4] + 72);
      v8 = v9;
    }
    else
    {
      v8 = (id)a1[6];
      v7 = *(_QWORD *)(a1[4] + 72);
    }
    objc_msgSend(v6, "_updateCacheForClientModel:withSuggestions:cacheManager:", a1[5], v8, v7);
  }
  (*(void (**)(void))(a1[7] + 16))();

}

+ (void)_updateCacheForClientModel:(id)a3 withSuggestions:(id)a4 cacheManager:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0D81130];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_msgSend([v7 alloc], "initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:", v10, v9, 0, 0);

  objc_msgSend(v8, "updateCachedSuggestions:", v11);
}

+ (void)clearPreviouslyPersistedCachesForCardSuggestionClientsIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.photos"), CFSTR("com.apple.news"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "shouldRouteClientToInfoSuggestionEngine:", v11))
        {
          objc_msgSend(v3, "lastCacheUpdateDateForClientModel:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend((id)objc_opt_class(), "_updateCacheForClientModel:withSuggestions:cacheManager:", v11, v9, v3);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingLayerServer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_coalescedBlendingLayerRefreshOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientModelCacheManager, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_spotlightActionsSuggestionSender, 0);
  objc_storeStrong((id *)&self->_watchSmartStacksSender, 0);
  objc_storeStrong((id *)&self->_lockscreenSuggestionSender, 0);
  objc_storeStrong((id *)&self->_homeScreenSuggestionSender, 0);
  objc_storeStrong((id *)&self->_appSwitcherSuggestionSender, 0);
  objc_storeStrong((id *)&self->_appDirectoryOrderingProvider, 0);
  objc_storeStrong((id *)&self->_router, 0);
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXClientModelSuggestionReceiver: couldn't perform refresh operation because swelf is nil in uninstall handler in -[ATXClientModelSuggestionReceiver start].", v1, 2u);
}

void __41__ATXClientModelSuggestionReceiver_start__block_invoke_30_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "StackChangeDebugNotification: error while requesting notification auth - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __70__ATXClientModelSuggestionReceiver__sendStackChangeDebugNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "StackChangeDebugNotification: error while adding notification request - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __80__ATXClientModelSuggestionReceiver_blendingLayerUpdatedUICache_consumerSubType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Blending: failed to push update to home screen - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
