@implementation ATXDefaultWidgetSuggesterServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_39 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_39, &__block_literal_global_215);
  return (id)sharedInstance__pasExprOnceResult_50;
}

void __49__ATXDefaultWidgetSuggesterServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_50;
  sharedInstance__pasExprOnceResult_50 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXDefaultWidgetSuggesterServer)init
{
  ATXDefaultWidgetSuggesterServer *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXDefaultWidgetSuggesterServer;
  v2 = -[ATXDefaultWidgetSuggesterServer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF92F0]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v18;

  v5 = a4;
  v6 = *MEMORY[0x1E0CF92F0];
  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0CF92F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ATXDefaultWidgetSuggesterServer listener:shouldAcceptNewConnection:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    ATXDefaultWidgetSuggesterInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v16);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_11_4);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_13_3);
    objc_msgSend(v5, "resume");
    v17 = 1;
  }
  else
  {
    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v6, v18);

    v17 = 0;
  }

  return v17;
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_home_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_home_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_12_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)shouldSuggestTVWithCompletionHandler:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  ATXDefaultWidgetSuggester *v4;
  void *v5;
  ATXDefaultWidgetSuggester *v6;

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = [ATXDefaultWidgetSuggester alloc];
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXDefaultWidgetSuggester initWithHistogramManager:](v4, "initWithHistogramManager:", v5);

  v3[2](v3, -[ATXDefaultWidgetSuggester shouldSuggestTV](v6, "shouldSuggestTV"), 0);
}

- (void)updateCachedValuesWithActivity:(id)a3
{
  ATXDefaultWidgetSuggester *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  ATXDefaultWidgetSuggester *v22;

  if ((objc_msgSend(a3, "didDefer") & 1) == 0)
  {
    v3 = [ATXDefaultWidgetSuggester alloc];
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ATXDefaultWidgetSuggester initWithHistogramManager:](v3, "initWithHistogramManager:", v4);

    -[ATXDefaultWidgetSuggester upcomingMediaCountForTVApp](v22, "upcomingMediaCountForTVApp");
    v6 = v5;
    -[ATXDefaultWidgetSuggester intentDonationCountForTVApp](v22, "intentDonationCountForTVApp");
    v8 = v7;
    -[ATXDefaultWidgetSuggester appLaunchCountForTVApp](v22, "appLaunchCountForTVApp");
    v10 = v9;
    LODWORD(v4) = objc_msgSend(MEMORY[0x1E0CF8D90], "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:");
    v11 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v12 = (void *)objc_msgSend(v11, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    v13 = (void *)MEMORY[0x1E0CF8D90];
    v14 = *MEMORY[0x1E0CF93F0];
    objc_msgSend(v12, "doubleForKey:", *MEMORY[0x1E0CF93F0]);
    v16 = v15;
    v17 = *MEMORY[0x1E0CF9400];
    objc_msgSend(v12, "doubleForKey:", *MEMORY[0x1E0CF9400]);
    v19 = v18;
    v20 = *MEMORY[0x1E0CF9408];
    objc_msgSend(v12, "doubleForKey:", *MEMORY[0x1E0CF9408]);
    LODWORD(v13) = objc_msgSend(v13, "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:", v16, v19, v21);
    objc_msgSend(v12, "setDouble:forKey:", v20, v6);
    objc_msgSend(v12, "setDouble:forKey:", v17, v8);
    objc_msgSend(v12, "setDouble:forKey:", v14, v10);
    if ((_DWORD)v4 != (_DWORD)v13)
      notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0CF8A08], "UTF8String"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "ATXDefaultWidgetSuggesterServer connection accepted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Unexpected interruption on default widget suggester interface", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __70__ATXDefaultWidgetSuggesterServer_listener_shouldAcceptNewConnection___block_invoke_12_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Connection invalidated on default widget suggester interface.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
