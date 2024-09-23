@implementation ATXAppDirectoryClient

- (void)predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:(unint64_t)a3 shouldUseDefaultCategories:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, id);
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  ATXProactiveSuggestionClient *blendingClient;
  ATXProactiveSuggestionClient *v15;
  ATXProactiveSuggestionClient *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id *v25;
  id *v26;
  id v27;
  id v28;
  _QWORD block[4];
  void (**v30)(id, id);
  void *v31;
  _QWORD v32[4];
  void (**v33)(id, id);
  void *v34;
  _QWORD v35[4];
  id v36;
  ATXAppDirectoryClient *v37;
  unint64_t v38;
  uint8_t buf[4];
  _BOOL4 v40;
  uint64_t v41;

  v5 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, id))a5;
  __atxlog_handle_app_library();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v40 = v5;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Starting loading predicted app with shouldUseDefaultCategories: %{BOOL}d", buf, 8u);
  }

  v10 = +[ATXDemoAppLibraryProvider isAppLibraryDemoModeEnabled](ATXDemoAppLibraryProvider, "isAppLibraryDemoModeEnabled");
  __atxlog_handle_app_library();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: Using Demo suggestions and recents", buf, 2u);
    }

    if (v8)
    {
      +[ATXDemoAppLibraryProvider demoSuggestionsAndRecents](ATXDemoAppLibraryProvider, "demoSuggestionsAndRecents");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v13);
      goto LABEL_23;
    }
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: Using non-demo suggestions and recents", buf, 2u);
    }

  }
  blendingClient = self->_blendingClient;
  if (!blendingClient)
  {
    v15 = -[ATXProactiveSuggestionClient initWithConsumerSubType:]([ATXProactiveSuggestionClient alloc], "initWithConsumerSubType:", 35);
    v16 = self->_blendingClient;
    self->_blendingClient = v15;

    blendingClient = self->_blendingClient;
  }
  -[ATXProactiveSuggestionClient suggestionLayoutFromCache](blendingClient, "suggestionLayoutFromCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Read suggestion layout from cache", buf, 2u);
  }

  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke;
  v35[3] = &unk_1E4D57E18;
  v13 = v17;
  v36 = v13;
  v37 = self;
  v38 = a3;
  v20 = (void *)MEMORY[0x1A85A511C](v35);
  -[ATXAppDirectoryClient topAppsVisible](self, "topAppsVisible");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_app_library();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Top apps are visible, will send reply", buf, 2u);
    }

    dispatch_get_global_queue(21, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_28;
    block[3] = &unk_1E4D57E68;
    v25 = (id *)&v30;
    v26 = &v31;
    v30 = v8;
    v31 = v20;
    v27 = v20;
    dispatch_async(v24, block);

  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:shouldUseDefaultCategories:reply:].cold.1();

    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_27;
    v32[3] = &unk_1E4D57E40;
    v25 = (id *)&v33;
    v26 = &v34;
    v33 = v8;
    v34 = v20;
    v28 = v20;
    -[ATXAppDirectoryClient categoriesWithShouldUseDefault:reply:](self, "categoriesWithShouldUseDefault:reply:", v5, v32);
  }

LABEL_23:
}

ATXAppDirectoryResponse *__113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  ATXAppDirectoryResponse *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  ATXAppDirectoryResponse *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v23[8];
  id v24;
  uint8_t buf[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Starting to process recent apps", buf, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0CF94C0]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXAppDirectoryRecentsCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCacheFilePath:loggingHandle:debugName:", v4, v5, CFSTR("recent apps"));

  v7 = (void *)MEMORY[0x1A85A4F90]();
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  v24 = 0;
  objc_msgSend(v6, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v10, &v24, -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;

  if (!v11)
  {
    __atxlog_handle_app_library();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_cold_1();

    v11 = (void *)objc_opt_new();
  }
  v14 = [ATXAppDirectoryResponse alloc];
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hiddenAppsFromCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAppsVisible");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXAppDirectoryResponse initWithSuggestionLayout:recentApps:hiddenApps:otherAppsOnScreen:numAppsToPredict:error:](v14, "initWithSuggestionLayout:recentApps:hiddenApps:otherAppsOnScreen:numAppsToPredict:error:", v15, v11, v16, v17, *(_QWORD *)(a1 + 48), v12);

  v19 = *(void **)(a1 + 40);
  -[ATXAppDirectoryResponse recentAppsVisible](v18, "recentAppsVisible");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRecentAppsVisible:", v20);

  __atxlog_handle_app_library();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Finished processing recent apps", v23, 2u);
  }

  return v18;
}

- (NSArray)topAppsVisible
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRecentAppsVisible:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)predictedAppsAndRecentAppsWithShouldUseDefaultCategories:(BOOL)a3 reply:(id)a4
{
  -[ATXAppDirectoryClient predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:shouldUseDefaultCategories:reply:](self, "predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:shouldUseDefaultCategories:reply:", 10000, a3, a4);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_2, &__block_literal_global_7);
  return (id)sharedInstance__pasExprOnceResult_3;
}

void __39__ATXAppDirectoryClient_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = -[ATXAppDirectoryClient _init]([ATXAppDirectoryClient alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  sharedInstance__pasExprOnceResult_3 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_init
{
  ATXAppDirectoryClient *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *loggingQueue;
  uint64_t v9;
  NSXPCConnection *xpcConnection;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXAppDirectoryClient;
  v2 = -[ATXAppDirectoryClient init](&v13, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.appDirectory"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v9;

    ATXAppDirectoryInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v11);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_7);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_9);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __30__ATXAppDirectoryClient__init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_app_library();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __30__ATXAppDirectoryClient__init__block_invoke_cold_1();

}

void __30__ATXAppDirectoryClient__init__block_invoke_8()
{
  NSObject *v0;

  __atxlog_handle_app_library();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __30__ATXAppDirectoryClient__init__block_invoke_8_cold_1();

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXAppDirectoryClient;
  -[ATXAppDirectoryClient dealloc](&v3, sel_dealloc);
}

- (void)categoriesWithReply:(id)a3
{
  -[ATXAppDirectoryClient categoriesWithShouldUseDefault:reply:](self, "categoriesWithShouldUseDefault:reply:", 0, a3);
}

- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  id *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSXPCConnection *xpcConnection;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  BOOL v27;
  uint8_t buf[4];
  _BOOL4 v29;
  uint64_t v30;

  v4 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  __atxlog_handle_app_library();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v29 = v4;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Starting requesting for categorization with shouldUseDefault: %{BOOL}d", buf, 8u);
  }

  if (v4
    && !+[ATXDemoAppLibraryProvider isAppLibraryDemoModeEnabled](ATXDemoAppLibraryProvider, "isAppLibraryDemoModeEnabled"))
  {
    __atxlog_handle_app_library();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Using default categories", buf, 2u);
    }

    xpcConnection = self->_xpcConnection;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke;
    v25[3] = &unk_1E4D57DC8;
    v27 = v4;
    v26 = v6;
    v16 = (void (**)(id, void *, _QWORD))v6;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestNotificationWhenCategoriesAreReady");

    objc_msgSend((id)objc_opt_class(), "_sortedDefaultCategories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_app_library();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v29 = v18 != 0;
      _os_log_impl(&dword_1A49EF000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Obtained non-nil categories: %{BOOL}d", buf, 8u);
    }

    if (v18)
      -[ATXAppDirectoryClient _updateTopAppsVisibilityWithCategories:](self, "_updateTopAppsVisibilityWithCategories:", v18);
    v10 = &v26;
    __atxlog_handle_app_library();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Sending reply with default categories", buf, 2u);
    }

    v16[2](v16, v18, 0);
  }
  else
  {
    v8 = self->_xpcConnection;
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_14;
    v23[3] = &unk_1E4D571E0;
    v10 = &v24;
    v11 = v6;
    v24 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_15;
    v21[3] = &unk_1E4D57DF0;
    v21[4] = self;
    v22 = v11;
    v13 = v11;
    objc_msgSend(v12, "categoriesWithReply:", v21);

  }
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_cold_1();

  if (!*(_BYTE *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_14_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  __atxlog_handle_app_library();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Start of categories reply", buf, 2u);
  }

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_updateTopAppsVisibilityWithCategories:", v5);
  v8 = +[ATXDemoAppLibraryProvider isAppLibraryDemoModeEnabled](ATXDemoAppLibraryProvider, "isAppLibraryDemoModeEnabled");
  __atxlog_handle_app_library();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: Using Demo app categories", v14, 2u);
    }

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      +[ATXDemoAppLibraryProvider demoAppCategoriesForRealAppCategories:](ATXDemoAppLibraryProvider, "demoAppCategoriesForRealAppCategories:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Received successful categorization response from server", v13, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3 != 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Received reply for categories: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryClient: Top apps are visible, did send reply", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)appLaunchDatesWithReply:(id)a3
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
  v8[2] = __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLaunchDatesWithReply:", v6);

}

void __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_app_library();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)notifyBookmarksDidChange
{
  id v2;

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_29_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyBookmarksDidChange");

}

void __49__ATXAppDirectoryClient_notifyBookmarksDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1();

}

- (void)requestNotificationWhenCategoriesAreReady
{
  id v2;

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_30);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestNotificationWhenCategoriesAreReady");

}

void __66__ATXAppDirectoryClient_requestNotificationWhenCategoriesAreReady__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1();

}

- (id)_suggestionsPodDedupableBundleIds
{
  void *v3;
  void *v4;
  void *v5;

  -[ATXAppDirectoryClient topAppsVisible](self, "topAppsVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_opt_new();
  -[ATXAppDirectoryClient recentAppsVisible](self, "recentAppsVisible");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateTopAppsVisibilityWithCategories:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v4 = (void *)MEMORY[0x1E0D81588];
  v5 = a3;
  LOBYTE(v4) = objc_msgSend(v4, "isiPad");
  v6 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke;
  v8[3] = &unk_1E4D57EB8;
  v7 = v6;
  v9 = v7;
  v10 = (char)v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  if (v7)
    -[ATXAppDirectoryClient setTopAppsVisible:](self, "setTopAppsVisible:", v7);

}

void __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v11 = a2;
  objc_msgSend(v11, "appBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") > 4)
  {
    v9 = 3;
  }
  else
  {
    objc_msgSend(v11, "appBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

  }
  objc_msgSend(v11, "appBundleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke_2;
  v12[3] = &unk_1E4D57E90;
  v13 = *(id *)(a1 + 32);
  v14 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  if (a3 >= 5 && !*(_BYTE *)(a1 + 40))
    *a4 = 1;

}

uint64_t __64__ATXAppDirectoryClient__updateTopAppsVisibilityWithCategories___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (*(_QWORD *)(a1 + 40) - 1 <= a3)
    *a4 = 1;
  return result;
}

- (id)_hiddenAppsFromCache
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  id v16;

  v2 = objc_alloc(MEMORY[0x1E0CF94C0]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXAppDirectoryHiddenAppsCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithCacheFilePath:loggingHandle:debugName:", v3, v4, CFSTR("hidden apps"));

  v6 = (void *)MEMORY[0x1A85A4F90]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  v16 = 0;
  objc_msgSend(v5, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v9, &v16, -1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    __atxlog_handle_app_library();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient _hiddenAppsFromCache].cold.1();

    v14 = objc_opt_new();
    v10 = (void *)v14;
  }

  return v10;
}

+ (id)hardcodedAppCategoryMappings
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("AppDirectoryDefaultCategories"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXAppDirectoryClient hardcodedAppCategoryMappings].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (id)_sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__ATXAppDirectoryClient__sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings___block_invoke;
  v18[3] = &unk_1E4D57EE0;
  v6 = v5;
  v19 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_44);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(v4);
  return v7;
}

void __84__ATXAppDirectoryClient__sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);
    v6 = (id)v9;
  }

}

uint64_t __84__ATXAppDirectoryClient__sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_sortedDefaultCategories
{
  void *v3;
  void *v4;
  void *v5;
  double Current;
  id v7;
  NSObject *v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  CFAbsoluteTime v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  void *v26;
  NSObject *v27;
  CFAbsoluteTime v28;
  void *v29;
  ATXAppDirectoryCategory *v30;
  id v31;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  CFAbsoluteTime v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A85A4F90](a1, a2);
  objc_msgSend(a1, "hardcodedAppCategoryMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  Current = CFAbsoluteTimeGetCurrent();
  v7 = objc_alloc_init(MEMORY[0x1E0DAAE90]);
  __atxlog_handle_app_library();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v41 = CFAbsoluteTimeGetCurrent() - Current;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Time to initialize home screen service: %f seconds", buf, 0xCu);
  }

  v9 = CFAbsoluteTimeGetCurrent();
  +[ATXAppDisplayIdentifiers appIdentifiers](ATXAppDisplayIdentifiers, "appIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    __atxlog_handle_app_library();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    objc_msgSend(v7, "allHomeScreenApplicationBundleIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  __atxlog_handle_app_library();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v41 = v15 - v9;
    _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "Time to copy app identifiers: %f seconds", buf, 0xCu);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v5, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v21) & 1) == 0)
          objc_msgSend(v5, "removeObjectForKey:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_opt_new();
  objc_msgSend(a1, "_sortedBundleIDsByCategoryWithHardcodedAppCategoryMappings:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __49__ATXAppDirectoryClient__sortedDefaultCategories__block_invoke;
  v33[3] = &unk_1E4D57F28;
  v24 = v22;
  v34 = v24;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v33);

  objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_50);
  v25 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(a1, "_allPlaceholderBundleIdsFromHomeScreenService:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v41 = v28 - v25;
    _os_log_impl(&dword_1A49EF000, v27, OS_LOG_TYPE_DEFAULT, "Time to retrieve app placeholders: %f seconds", buf, 0xCu);
  }

  objc_msgSend(a1, "_sortedAllOtherBundleIDsFromAllBundleIDs:allPlaceholderBundleIDs:hardcodedAppCategoryMappings:", v10, v26, v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:]([ATXAppDirectoryCategory alloc], "initWithCategoryID:appBundleIDs:", 1008, v29);
  objc_msgSend(v24, "addObject:", v30);
  v31 = v24;

  objc_autoreleasePoolPop(v3);
  return v31;
}

void __49__ATXAppDirectoryClient__sortedDefaultCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ATXAppDirectoryCategory *v7;
  uint64_t v8;
  ATXAppDirectoryCategory *v9;

  v5 = a3;
  v6 = a2;
  v7 = [ATXAppDirectoryCategory alloc];
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  v9 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:](v7, "initWithCategoryID:appBundleIDs:", v8, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

uint64_t __49__ATXAppDirectoryClient__sortedDefaultCategories__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  +[ATXAppDirectoryCategory localizedStringForCategoryID:](ATXAppDirectoryCategory, "localizedStringForCategoryID:", objc_msgSend(a2, "categoryID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "categoryID");

  +[ATXAppDirectoryCategory localizedStringForCategoryID:](ATXAppDirectoryCategory, "localizedStringForCategoryID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

+ (id)_allPlaceholderBundleIdsFromHomeScreenService:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "allHomeScreenApplicationPlaceholderBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);
  return v7;
}

+ (id)_sortedAllOtherBundleIDsFromAllBundleIDs:(id)a3 allPlaceholderBundleIDs:(id)a4 hardcodedAppCategoryMappings:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *context;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  context = (void *)MEMORY[0x1A85A4F90]();
  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v10, "unionSet:", v8);
  v11 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_51);
  objc_autoreleasePoolPop(context);

  return v11;
}

uint64_t __119__ATXAppDirectoryClient__sortedAllOtherBundleIDsFromAllBundleIDs_allPlaceholderBundleIDs_hardcodedAppCategoryMappings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_addEngagedSuggestionToERM:(id)a3
{
  void *v4;
  ATXEngagementRecordManager *engagementRecordManager;
  ATXEngagementRecordManager *v6;
  ATXEngagementRecordManager *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  v4 = v8;
  if (v8)
  {
    engagementRecordManager = self->_engagementRecordManager;
    if (!engagementRecordManager)
    {
      +[ATXEngagementRecordManager sharedInstance](ATXEngagementRecordManager, "sharedInstance");
      v6 = (ATXEngagementRecordManager *)objc_claimAutoreleasedReturnValue();
      v7 = self->_engagementRecordManager;
      self->_engagementRecordManager = v6;

      engagementRecordManager = self->_engagementRecordManager;
    }
    -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](engagementRecordManager, "addEngagedSuggestion:engagementRecordType:", v8, 1);
    v4 = v8;
  }

}

- (void)_logCaptureRateDiversionWithType:(int)a3
{
  uint64_t v3;
  ATXPETEventTracker2Protocol *tracker;
  ATXPETEventTracker2Protocol *v6;
  ATXPETEventTracker2Protocol *v7;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  tracker = self->_tracker;
  if (!tracker)
  {
    v6 = (ATXPETEventTracker2Protocol *)objc_opt_new();
    v7 = self->_tracker;
    self->_tracker = v6;

    tracker = self->_tracker;
  }
  +[ATXBlendingCaptureRateTracker logAppDirectoryDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logAppDirectoryDiversionWithCaptureType:tracker:", v3, tracker);
}

- (void)_logCaptureRateCapture
{
  ATXPETEventTracker2Protocol *tracker;
  ATXPETEventTracker2Protocol *v4;
  ATXPETEventTracker2Protocol *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  tracker = self->_tracker;
  if (!tracker)
  {
    v4 = (ATXPETEventTracker2Protocol *)objc_opt_new();
    v5 = self->_tracker;
    self->_tracker = v4;

    tracker = self->_tracker;
  }
  +[ATXBlendingCaptureRateTracker logAppDirectoryCaptureWithTracker:](ATXBlendingCaptureRateTracker, "logAppDirectoryCaptureWithTracker:", tracker);
}

- (void)_logToBiomeWithEventType:(unint64_t)a3 date:(id)a4 blendingCacheUUID:(id)a5 shownSuggestionIds:(id)a6 engagedSuggestionIds:(id)a7 categoryID:(id)a8 categoryIndex:(id)a9 bundleId:(id)a10 bundleIndex:(id)a11 searchQueryLength:(id)a12 searchTab:(id)a13 bundleIdInTopAppsVisible:(id)a14 userLaunchedAppBeforeLeaving:(id)a15
{
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  ATXAppDirectoryEventMetadata *v27;
  ATXUniversalBiomeUIStream *uiStream;
  uint64_t v29;
  ATXUniversalBiomeUIStream *v30;
  void *v31;
  NSObject *v32;
  NSObject *queue;
  id v36;
  id v37;
  id v38;
  ATXAppDirectoryEvent *v40;
  ATXAppDirectoryEventMetadata *v42;
  ATXAppDirectoryClient *v43;
  void *v44;

  v18 = (unint64_t)a14;
  v19 = (unint64_t)a15;
  v43 = self;
  queue = self->_loggingQueue;
  v38 = a13;
  v37 = a12;
  v36 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  dispatch_assert_queue_V2(queue);
  v44 = (void *)v18;
  if (v18 | v19)
    v27 = -[ATXAppDirectoryEventMetadata initWithBundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:]([ATXAppDirectoryEventMetadata alloc], "initWithBundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", v18, v19);
  else
    v27 = 0;
  v42 = v27;
  v40 = -[ATXAppDirectoryEvent initWithDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:]([ATXAppDirectoryEvent alloc], "initWithDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:", v26, a3, v22, v21, v20, v36, v37, v38, v25, v24, v23, v27);

  uiStream = v43->_uiStream;
  if (!uiStream)
  {
    v29 = objc_opt_new();
    v30 = v43->_uiStream;
    v43->_uiStream = (ATXUniversalBiomeUIStream *)v29;

    uiStream = v43->_uiStream;
  }
  +[ATXUIEvent uiEventWithAppDirectoryEvent:](ATXUIEvent, "uiEventWithAppDirectoryEvent:", v40);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBiomeUIStream donateGenericUIEvent:](uiStream, "donateGenericUIEvent:", v31);

  __atxlog_handle_app_library();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[ATXAppDirectoryClient _logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:].cold.1(v40, v32);

}

- (void)_logToBiome:(unint64_t)a3 metadata:(id)a4
{
  NSObject *loggingQueue;
  id v7;
  void *v8;
  ATXUniversalBiomeUIStream *uiStream;
  ATXUniversalBiomeUIStream *v10;
  ATXUniversalBiomeUIStream *v11;
  void *v12;
  id v13;

  loggingQueue = self->_loggingQueue;
  v7 = a4;
  dispatch_assert_queue_V2(loggingQueue);
  +[ATXAppDirectoryEvent appDirectoryEventWithEventType:metadata:](ATXAppDirectoryEvent, "appDirectoryEventWithEventType:metadata:", a3, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v13)
  {
    uiStream = self->_uiStream;
    if (!uiStream)
    {
      v10 = (ATXUniversalBiomeUIStream *)objc_opt_new();
      v11 = self->_uiStream;
      self->_uiStream = v10;

      uiStream = self->_uiStream;
    }
    +[ATXUIEvent uiEventWithAppDirectoryEvent:](ATXUIEvent, "uiEventWithAppDirectoryEvent:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXUniversalBiomeUIStream donateGenericUIEvent:](uiStream, "donateGenericUIEvent:", v12);

    v8 = v13;
  }

}

- (void)_logToDuet:(unint64_t)a3 metadata:(id)a4
{
  id v6;
  _DKKnowledgeSaving *v7;
  _DKKnowledgeSaving *v8;
  _DKEventStream *knowledgeStream;
  _DKEventStream *v10;
  _DKEventStream *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _DKKnowledgeSaving *knowledgeStore;
  void *v20;
  _DKKnowledgeSaving *v21;
  _DKEventStream *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  if (self->_knowledgeStore
    || (objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore"),
        v7 = (_DKKnowledgeSaving *)objc_claimAutoreleasedReturnValue(),
        v8 = self->_knowledgeStore,
        self->_knowledgeStore = v7,
        v8,
        self->_knowledgeStore))
  {
    knowledgeStream = self->_knowledgeStream;
    if (knowledgeStream
      || (objc_msgSend(MEMORY[0x1E0D15AF8], "appDirectoryInteractionStream"),
          v10 = (_DKEventStream *)objc_claimAutoreleasedReturnValue(),
          v11 = self->_knowledgeStream,
          self->_knowledgeStream = v10,
          v11,
          (knowledgeStream = self->_knowledgeStream) != 0))
    {
      v12 = (void *)MEMORY[0x1E0D159F8];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kATXAppDirectoryLoggingDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kATXAppDirectoryLoggingDate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D159C8];
      objc_msgSend(MEMORY[0x1E0D15978], "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "categoryWithInteger:type:", a3, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "eventWithStream:startDate:endDate:value:metadata:", knowledgeStream, v13, v14, v17, v6);
      v18 = objc_claimAutoreleasedReturnValue();

      knowledgeStore = self->_knowledgeStore;
      v23[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKKnowledgeSaving saveObjects:responseQueue:withCompletion:](knowledgeStore, "saveObjects:responseQueue:withCompletion:", v20, 0, &__block_literal_global_65);

      if (ATXIsSessionEndedByEvent(a3))
      {
        v21 = self->_knowledgeStore;
        self->_knowledgeStore = 0;

        v22 = self->_knowledgeStream;
        self->_knowledgeStream = 0;

      }
    }
    else
    {
      __atxlog_handle_app_library();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXAppDirectoryClient _logToDuet:metadata:].cold.2();
    }
  }
  else
  {
    __atxlog_handle_app_library();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient _logToDuet:metadata:].cold.1();
  }

}

void __45__ATXAppDirectoryClient__logToDuet_metadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    __atxlog_handle_app_library();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__ATXAppDirectoryClient__logToDuet_metadata___block_invoke_cold_1();

  }
}

- (void)_resetSessionState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_loggingQueue);
  self->_didSendFeedbackDuringSession = 0;
}

- (void)logDidEnterAppDirectoryWithDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *loggingQueue;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  ATXAppDirectoryClient *v17;

  v4 = a3;
  if (v4)
  {
    +[ATXHomeScreenSuggestionClient sharedInstance](ATXHomeScreenSuggestionClient, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logSpecialPageDidAppear:widgetsByStackId:prediction:", 1, 0, 0);

    loggingQueue = self->_loggingQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__ATXAppDirectoryClient_logDidEnterAppDirectoryWithDate___block_invoke;
    v15[3] = &unk_1E4D57258;
    v16 = v4;
    v17 = self;
    dispatch_async(loggingQueue, v15);
    v7 = v16;
  }
  else
  {
    __atxlog_handle_app_library();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logDidEnterAppDirectoryWithDate:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

void __57__ATXAppDirectoryClient_logDidEnterAppDirectoryWithDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ATXAppDirectoryClient logDidEnterAppDirectoryWithDate:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  v4 = CFSTR("kATXAppDirectoryLoggingDate");
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_logToDuet:metadata:", 0, v3);
  objc_msgSend(*(id *)(a1 + 40), "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 0, *(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "_resetSessionState");

}

- (void)logCategoryExpansionWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *loggingQueue;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  unint64_t v21;
  unint64_t v22;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    loggingQueue = self->_loggingQueue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__ATXAppDirectoryClient_logCategoryExpansionWithDate_categoryID_categoryIndex___block_invoke;
    v19[3] = &unk_1E4D57F90;
    v21 = a4;
    v22 = a5;
    v19[4] = self;
    v20 = v8;
    dispatch_async(loggingQueue, v19);

  }
  else
  {
    __atxlog_handle_app_library();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logCategoryExpansionWithDate:categoryID:categoryIndex:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __79__ATXAppDirectoryClient_logCategoryExpansionWithDate_categoryID_categoryIndex___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[6];
    v4 = a1[7];
    *(_DWORD *)buf = 136315650;
    v16 = "-[ATXAppDirectoryClient logCategoryExpansionWithDate:categoryID:categoryIndex:]_block_invoke";
    v17 = 2048;
    v18 = v3;
    v19 = 2048;
    v20 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %tu, categoryIndex: %tu", buf, 0x20u);
  }

  v5 = (void *)a1[4];
  v14[0] = a1[5];
  v13[0] = CFSTR("kATXAppDirectoryLoggingDate");
  v13[1] = CFSTR("kATXAppDirectoryLoggingCategoryID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("kATXAppDirectoryLoggingCategoryIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_logToDuet:metadata:", 1, v8);

  v9 = (void *)a1[4];
  v10 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 1, v10, 0, 0, 0, v11, v12, 0, 0, 0, 0, 0, 0);

}

- (void)logCategoryExitWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *loggingQueue;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  unint64_t v21;
  unint64_t v22;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    loggingQueue = self->_loggingQueue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__ATXAppDirectoryClient_logCategoryExitWithDate_categoryID_categoryIndex___block_invoke;
    v19[3] = &unk_1E4D57F90;
    v21 = a4;
    v22 = a5;
    v19[4] = self;
    v20 = v8;
    dispatch_async(loggingQueue, v19);

  }
  else
  {
    __atxlog_handle_app_library();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logCategoryExitWithDate:categoryID:categoryIndex:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __74__ATXAppDirectoryClient_logCategoryExitWithDate_categoryID_categoryIndex___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[6];
    v4 = a1[7];
    *(_DWORD *)buf = 136315650;
    v16 = "-[ATXAppDirectoryClient logCategoryExitWithDate:categoryID:categoryIndex:]_block_invoke";
    v17 = 2048;
    v18 = v3;
    v19 = 2048;
    v20 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %tu, categoryIndex: %tu", buf, 0x20u);
  }

  v5 = (void *)a1[4];
  v14[0] = a1[5];
  v13[0] = CFSTR("kATXAppDirectoryLoggingDate");
  v13[1] = CFSTR("kATXAppDirectoryLoggingCategoryID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("kATXAppDirectoryLoggingCategoryIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_logToDuet:metadata:", 2, v8);

  v9 = (void *)a1[4];
  v10 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 2, v10, 0, 0, 0, v11, v12, 0, 0, 0, 0, 0, 0);

}

- (void)logLaunchFromExpandedCategoryWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5 bundleID:(id)a6 bundleIndex:(unint64_t)a7 appDirectoryResponse:(id)a8
{
  id v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  NSObject *loggingQueue;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[4];
  __CFString *v28;
  id v29;
  ATXAppDirectoryClient *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v14 = a3;
  v15 = (__CFString *)a6;
  v16 = a8;
  if (v14)
  {
    if (!v15)
    {
      __atxlog_handle_app_library();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXAppDirectoryClient logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:].cold.2();

      v15 = CFSTR("nil");
    }
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __130__ATXAppDirectoryClient_logLaunchFromExpandedCategoryWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E4D57FB8;
    v32 = a4;
    v33 = a5;
    v15 = v15;
    v28 = v15;
    v34 = a7;
    v29 = v16;
    v30 = self;
    v31 = v14;
    dispatch_async(loggingQueue, block);

    v19 = v28;
  }
  else
  {
    __atxlog_handle_app_library();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

void __130__ATXAppDirectoryClient_logLaunchFromExpandedCategoryWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    v39 = "-[ATXAppDirectoryClient logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:ap"
          "pDirectoryResponse:]_block_invoke";
    v40 = 2048;
    v41 = v3;
    v42 = 2048;
    v43 = v4;
    v44 = 2112;
    v45 = v6;
    v46 = 2048;
    v47 = v5;
    v48 = 2112;
    v49 = v7;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %lu, categoryIndex: %lu, bundleId: %@, bundleIndex: %lu, response: %@", buf, 0x3Eu);
  }

  objc_msgSend(*(id *)(a1 + 40), "predictedApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "predictedApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 4)
    v11 = 4;
  else
    v11 = v10;
  objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "_suggestionsPodDedupableBundleIds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 32)));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 48);
  v37[0] = *(_QWORD *)(a1 + 56);
  v36[0] = CFSTR("kATXAppDirectoryLoggingDate");
  v36[1] = CFSTR("kATXAppDirectoryLoggingCategoryID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v16;
  v36[2] = CFSTR("kATXAppDirectoryLoggingCategoryIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v37[2] = v17;
  v37[3] = v18;
  v36[3] = CFSTR("kATXAppDirectoryLoggingBundleID");
  v36[4] = CFSTR("kATXAppDirectoryLoggingBundleIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_logToDuet:metadata:", 3, v20);

  v22 = *(void **)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "suggestionLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v12;
  objc_msgSend(*(id *)(a1 + 40), "uuidsForBundleIds:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 3, v21, v24, v25, 0, v26, v27, v28, v29, 0, 0, v34, 0);

  if (objc_msgSend(v34, "BOOLValue"))
    v30 = 4006;
  else
    v30 = 4002;
  if (*(_QWORD *)(a1 + 64) == 4)
  {
    if (objc_msgSend(v34, "BOOLValue"))
      v30 = 4007;
    else
      v30 = 4003;
  }
  v31 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  if (!v31 || (v32 = v31, v33 = objc_msgSend(v31, "BOOLValue"), v32, v33))
    objc_msgSend(*(id *)(a1 + 48), "_logCaptureRateDiversionWithType:", v30);
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 72) = 1;

}

- (void)logLaunchFromCategoryPreviewWithDate:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(unint64_t)a5 bundleID:(id)a6 bundleIndex:(unint64_t)a7 appDirectoryResponse:(id)a8
{
  id v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  NSObject *loggingQueue;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[4];
  __CFString *v28;
  id v29;
  ATXAppDirectoryClient *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v14 = a3;
  v15 = (__CFString *)a6;
  v16 = a8;
  if (v14)
  {
    if (!v15)
    {
      __atxlog_handle_app_library();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXAppDirectoryClient logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:].cold.2();

      v15 = CFSTR("nil");
    }
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E4D57FB8;
    v32 = a4;
    v33 = a5;
    v15 = v15;
    v28 = v15;
    v34 = a7;
    v29 = v16;
    v30 = self;
    v31 = v14;
    dispatch_async(loggingQueue, block);

    v19 = v28;
  }
  else
  {
    __atxlog_handle_app_library();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

void __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[5];
  _QWORD v48[5];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    v50 = "-[ATXAppDirectoryClient logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:app"
          "DirectoryResponse:]_block_invoke";
    v51 = 2048;
    v52 = v3;
    v53 = 2048;
    v54 = v4;
    v55 = 2112;
    v56 = v6;
    v57 = 2048;
    v58 = v5;
    v59 = 2112;
    v60 = v7;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, categoryId: %lu, categoryIndex: %lu, bundleId: %@, bundleIndex: %lu, response: %@", buf, 0x3Eu);
  }

  objc_msgSend(*(id *)(a1 + 40), "predictedApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "predictedApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 4)
    v11 = 4;
  else
    v11 = v10;
  objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "_suggestionsPodDedupableBundleIds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 32)));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 32)));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 64);
  v48[0] = *(_QWORD *)(a1 + 56);
  v47[0] = CFSTR("kATXAppDirectoryLoggingDate");
  v47[1] = CFSTR("kATXAppDirectoryLoggingCategoryID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v16;
  v47[2] = CFSTR("kATXAppDirectoryLoggingCategoryIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v48[2] = v17;
  v48[3] = v18;
  v47[3] = CFSTR("kATXAppDirectoryLoggingBundleID");
  v47[4] = CFSTR("kATXAppDirectoryLoggingBundleIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v20 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v20;
  objc_msgSend(*(id *)(a1 + 48), "_logToDuet:metadata:", 4, v20);
  v38 = *(void **)(a1 + 48);
  v39 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "suggestionLayout");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "uuid");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuidsForBundleIds:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v15;
  v23 = v15 == 3;
  v45 = v12;
  v24 = (void *)v21;
  if (v23)
  {
    v25 = *(void **)(a1 + 40);
    v46 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uuidsForBundleIds:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 4, v39, v24, v22, v26, v27, v28, v29, v30, 0, 0, v44, 0);

  if (v41 == 3)
  {

    v31 = v43;
    v32 = v45;
    if ((objc_msgSend(v43, "BOOLValue") & 1) == 0)
    {
      __atxlog_handle_app_library();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke_cold_1();

    }
    objc_msgSend(*(id *)(a1 + 48), "_logCaptureRateCapture");
    v34 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "proactiveSuggestionForBundleId:", *(_QWORD *)(a1 + 32));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_addEngagedSuggestionToERM:", v35);

  }
  else
  {

    if (objc_msgSend(v44, "BOOLValue"))
      v36 = 4005;
    else
      v36 = 4001;
    v32 = v45;
    v31 = v43;
    if (v41 == 4)
    {
      if (objc_msgSend(v44, "BOOLValue"))
        v36 = 4007;
      else
        v36 = 4003;
    }
    if (objc_msgSend(v45, "count"))
      objc_msgSend(*(id *)(a1 + 48), "_logCaptureRateDiversionWithType:", v36);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 72) = 1;

}

- (void)logLaunchFromSearchWithDate:(id)a3 bundleID:(id)a4 bundleIndex:(unint64_t)a5 searchQueryLength:(unint64_t)a6 searchTab:(unint64_t)a7 appDirectoryResponse:(id)a8
{
  id v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  NSObject *loggingQueue;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[4];
  __CFString *v28;
  id v29;
  ATXAppDirectoryClient *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v14 = a3;
  v15 = (__CFString *)a4;
  v16 = a8;
  if (v14)
  {
    if (!v15)
    {
      __atxlog_handle_app_library();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:].cold.2();

      v15 = CFSTR("nil");
    }
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __123__ATXAppDirectoryClient_logLaunchFromSearchWithDate_bundleID_bundleIndex_searchQueryLength_searchTab_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E4D57FB8;
    v15 = v15;
    v28 = v15;
    v32 = a5;
    v33 = a6;
    v34 = a7;
    v29 = v16;
    v30 = self;
    v31 = v14;
    dispatch_async(loggingQueue, block);

    v19 = v28;
  }
  else
  {
    __atxlog_handle_app_library();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

void __123__ATXAppDirectoryClient_logLaunchFromSearchWithDate_bundleID_bundleIndex_searchQueryLength_searchTab_appDirectoryResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    v38 = "-[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirect"
          "oryResponse:]_block_invoke";
    v39 = 2112;
    v40 = v6;
    v41 = 2048;
    v42 = v3;
    v43 = 2048;
    v44 = v4;
    v45 = 2048;
    v46 = v5;
    v47 = 2112;
    v48 = v7;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s, bundleId: %@, bundleIndex: %lu, searchQueryLength: %lu, searchTab: %lu, response: %@", buf, 0x3Eu);
  }

  objc_msgSend(*(id *)(a1 + 40), "predictedApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "predictedApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 4)
    v11 = 4;
  else
    v11 = v10;
  objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "_suggestionsPodDedupableBundleIds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 32)));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v35[0] = CFSTR("kATXAppDirectoryLoggingDate");
  v35[1] = CFSTR("kATXAppDirectoryLoggingBundleID");
  v17 = *(_QWORD *)(a1 + 32);
  v36[0] = v15;
  v36[1] = v17;
  v35[2] = CFSTR("kATXAppDirectoryLoggingBundleIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v18;
  v35[3] = CFSTR("kATXAppDirectoryLoggingSearchQueryLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v19;
  v35[4] = CFSTR("kATXAppDirectoryLoggingSearchTab");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_logToDuet:metadata:", 6, v21);

  v22 = *(void **)(a1 + 48);
  v33 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "suggestionLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v12;
  objc_msgSend(*(id *)(a1 + 40), "uuidsForBundleIds:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 6, v33, v24, v26, 0, 0, 0, v27, v28, v29, v30, v34, 0);

  v31 = objc_msgSend(v34, "BOOLValue");
  if (objc_msgSend(v25, "count"))
  {
    if (v31)
      v32 = 4004;
    else
      v32 = 4000;
    objc_msgSend(*(id *)(a1 + 48), "_logCaptureRateDiversionWithType:", v32);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 72) = 1;

}

- (void)logOpenSearchWithDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *loggingQueue;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    loggingQueue = self->_loggingQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__ATXAppDirectoryClient_logOpenSearchWithDate___block_invoke;
    v15[3] = &unk_1E4D57258;
    v15[4] = self;
    v16 = v4;
    dispatch_async(loggingQueue, v15);

  }
  else
  {
    __atxlog_handle_app_library();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logOpenSearchWithDate:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

uint64_t __47__ATXAppDirectoryClient_logOpenSearchWithDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ATXAppDirectoryClient logOpenSearchWithDate:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = CFSTR("kATXAppDirectoryLoggingDate");
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_logToDuet:metadata:", 7, v5);

  return objc_msgSend(*(id *)(a1 + 32), "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 7, *(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (void)logDidLeaveAppDirectoryWithDate:(id)a3 appDirectoryResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *loggingQueue;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  NSObject *v19;
  ATXAppDirectoryClient *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[ATXHomeScreenSuggestionClient sharedInstance](ATXHomeScreenSuggestionClient, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logSpecialPageDidDisappear:", 1);

    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__ATXAppDirectoryClient_logDidLeaveAppDirectoryWithDate_appDirectoryResponse___block_invoke;
    block[3] = &unk_1E4D57FE0;
    v19 = v7;
    v20 = self;
    v21 = v6;
    dispatch_async(loggingQueue, block);

    v10 = v19;
  }
  else
  {
    __atxlog_handle_app_library();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logDidLeaveAppDirectoryWithDate:appDirectoryResponse:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __78__ATXAppDirectoryClient_logDidLeaveAppDirectoryWithDate_appDirectoryResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[ATXAppDirectoryClient logDidLeaveAppDirectoryWithDate:appDirectoryResponse:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "predictedApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predictedApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 4)
    v6 = 4;
  else
    v6 = v5;
  objc_msgSend(v3, "subarrayWithRange:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v17 = CFSTR("kATXAppDirectoryLoggingDate");
  v18 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_logToDuet:metadata:", 8, v10);

  v12 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "suggestionLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuidsForBundleIds:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 72));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 8, v11, v14, v15, 0, 0, 0, 0, 0, 0, 0, 0, v16);

  objc_msgSend(*(id *)(a1 + 40), "_resetSessionState");
}

- (void)logCloseSearchWithDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *loggingQueue;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    loggingQueue = self->_loggingQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__ATXAppDirectoryClient_logCloseSearchWithDate___block_invoke;
    v15[3] = &unk_1E4D57258;
    v15[4] = self;
    v16 = v4;
    dispatch_async(loggingQueue, v15);

  }
  else
  {
    __atxlog_handle_app_library();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryClient logCloseSearchWithDate:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

uint64_t __48__ATXAppDirectoryClient_logCloseSearchWithDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_app_library();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ATXAppDirectoryClient logCloseSearchWithDate:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "ATXAppDirectoryClient: %s", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = CFSTR("kATXAppDirectoryLoggingDate");
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_logToDuet:metadata:", 9, v5);

  return objc_msgSend(*(id *)(a1 + 32), "_logToBiomeWithEventType:date:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 9, *(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (void)setTopAppsVisible:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)recentAppsVisible
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)didSendFeedbackDuringSession
{
  return self->_didSendFeedbackDuringSession;
}

- (void)setDidSendFeedbackDuringSession:(BOOL)a3
{
  self->_didSendFeedbackDuringSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentAppsVisible, 0);
  objc_storeStrong((id *)&self->_topAppsVisible, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_uiStream, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_blendingClient, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_knowledgeStream, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __30__ATXAppDirectoryClient__init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Connection to App Directory server interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __30__ATXAppDirectoryClient__init__block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Connection to App Directory server invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Failed to request update notification from server: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__ATXAppDirectoryClient_categoriesWithShouldUseDefault_reply___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Received categorization response with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps:shouldUseDefaultCategories:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Requesting categories for deduplication", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __113__ATXAppDirectoryClient_predictedAppsAndRecentAppsWithMaxNumberOfPredictedApps_shouldUseDefaultCategories_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Recent apps deduplication failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__ATXAppDirectoryClient_appLaunchDatesWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hiddenAppsFromCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXAppDirectoryResponse: getting hidden apps from cache failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)hardcodedAppCategoryMappings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryOrderingProvider: Unable to find hardcoded mappings for iTunes categories", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_logToBiomeWithEventType:(void *)a1 date:(NSObject *)a2 blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:bundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryClient: logging event to Biome: %@", v4, 0xCu);

}

- (void)_logToDuet:metadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Failed to retrieve knowledge store, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_logToDuet:metadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Failed to retrieve knowledge stream, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45__ATXAppDirectoryClient__logToDuet_metadata___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: log to duet failed, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)logDidEnterAppDirectoryWithDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logCategoryExpansionWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logCategoryExitWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logLaunchFromExpandedCategoryWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 bundleID:(uint64_t)a6 bundleIndex:(uint64_t)a7 appDirectoryResponse:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Replacing with \"%@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logLaunchFromCategoryPreviewWithDate:(uint64_t)a3 categoryID:(uint64_t)a4 categoryIndex:(uint64_t)a5 bundleID:(uint64_t)a6 bundleIndex:(uint64_t)a7 appDirectoryResponse:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Replacing with \"%@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __129__ATXAppDirectoryClient_logLaunchFromCategoryPreviewWithDate_categoryID_categoryIndex_bundleID_bundleIndex_appDirectoryResponse___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2[3];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_6();
  v3 = v0;
  _os_log_fault_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_FAULT, "ATXAppDirectoryClient launch from suggestions category with bundleId: %@ not in shown bundleIds: %@", (uint8_t *)v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)logLaunchFromSearchWithDate:(uint64_t)a3 bundleID:(uint64_t)a4 bundleIndex:(uint64_t)a5 searchQueryLength:(uint64_t)a6 searchTab:(uint64_t)a7 appDirectoryResponse:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Replacing with \"%@\", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logOpenSearchWithDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logDidLeaveAppDirectoryWithDate:(uint64_t)a3 appDirectoryResponse:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logCloseSearchWithDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXAppDirectoryClient: Received nil value for non-nil field in %s. Dropping call and aborting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
