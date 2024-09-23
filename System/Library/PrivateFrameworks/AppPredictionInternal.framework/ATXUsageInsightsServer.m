@implementation ATXUsageInsightsServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_7 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_7, &__block_literal_global_64);
  return (id)sharedInstance__pasExprOnceResult_9;
}

void __40__ATXUsageInsightsServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9;
  sharedInstance__pasExprOnceResult_9 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXUsageInsightsServer)init
{
  ATXUsageInsightsServer *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCListener *listener;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)ATXUsageInsightsServer;
  v2 = -[ATXUsageInsightsServer init](&v8, sel_init);
  if (v2)
  {
    __atxlog_handle_usage_insights();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXUsageInsightsServer: launched", buf, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.UsageInsights"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    __atxlog_handle_usage_insights();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[ATXUsageInsightsServer init]";
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s: Listening for connections", buf, 0xCu);
    }

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_usage_insights();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[ATXUsageInsightsServer listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "%s: Connection attempted", buf, 0xCu);
  }

  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.proactive.UsageInsights"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    __atxlog_handle_usage_insights();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ATXUsageInsightsServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "%s: Connection established", buf, 0xCu);
    }

    ATXUsageInsightsInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v11);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak((id *)buf, v7);
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke;
    v27[3] = &unk_1E82DB988;
    objc_copyWeak(&v28, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", v27);
    v22 = v12;
    v23 = 3221225472;
    v24 = __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_13;
    v25 = &unk_1E82DB988;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", &v22);
    objc_msgSend(v7, "resume", v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
    v13 = 1;
  }
  else
  {
    __atxlog_handle_usage_insights();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXUsageInsightsServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);

    v13 = 0;
  }

  return v13;
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_usage_insights();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_usage_insights();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_13_cold_1();

}

- (void)fetchAllDeliveredNotificationsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "successfullyAccumulatedNotificationEvents");
  v4 = objc_alloc(MEMORY[0x1E0CF8DE8]);
  objc_msgSend(v8, "allDeliveredNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAllDeliveredNotifications:allInterruptingAppSessions:", v5, 0);

  objc_msgSend(v6, "allDeliveredNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v7, 0);

}

- (void)fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__ATXUsageInsightsServer_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke;
  v6[3] = &unk_1E82DF120;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "suggestedBundleIDsForAllowListWithCompletion:", v6);

}

uint64_t __87__ATXUsageInsightsServer_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__ATXUsageInsightsServer_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke;
  v6[3] = &unk_1E82DF120;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "suggestedBundleIDsForDenyListWithCompletion:", v6);

}

uint64_t __86__ATXUsageInsightsServer_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchUsageInsightsInferredATXModeEventsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "usageInsightsInferredATXModeEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

}

- (void)fetchAllInterruptingAppSessionsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "successfullyAccumulatedInterruptingSessions");
  v4 = objc_alloc(MEMORY[0x1E0CF8DE8]);
  objc_msgSend(v8, "allInterruptingAppSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAllDeliveredNotifications:allInterruptingAppSessions:", 0, v5);

  objc_msgSend(v6, "allInterruptingAppSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v7, 0);

}

- (void)fetchAllPhubbingSessionsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "successfullyAccumulatedPhubbingEvents");
  v4 = objc_alloc(MEMORY[0x1E0CF9038]);
  objc_msgSend(v8, "phubbingSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPhubbingSessions:", v5);

  objc_msgSend(v6, "phubbingSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v7, 0);

}

- (void)fetchAllMindlessCyclingSessionsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "accumulateMindlessCyclingEvents");
  v4 = objc_alloc(MEMORY[0x1E0CF8DA0]);
  objc_msgSend(v8, "mindlessCyclingEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContinuousDeviceUsageEvent:mindlessCyclingEvents:", 0, v5);

  objc_msgSend(v6, "mindlessCyclingEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v7, 0);

}

- (void)fetchAllContinuousUsageSessionsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "successfullyAccumulatedContinuousUseEvents");
  v4 = objc_alloc(MEMORY[0x1E0CF8DA0]);
  objc_msgSend(v8, "continuousUseSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContinuousDeviceUsageEvent:mindlessCyclingEvents:", v5, 0);

  objc_msgSend(v6, "continuousDeviceUsageEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, a2, a3, "ATXUsageInsightsServer: Rejecting connection %@ without entitlement %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Unexpected Interruption: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Connection invalidated: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
