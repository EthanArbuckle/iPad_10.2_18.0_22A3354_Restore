@implementation ATXUsageInsightsClient

- (ATXUsageInsightsClient)init
{
  ATXUsageInsightsClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXUsageInsightsClient;
  v2 = -[ATXUsageInsightsClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.UsageInsights"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    ATXUsageInsightsInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v2);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_43);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_3_2);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __30__ATXUsageInsightsClient_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_usage_insights();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __30__ATXUsageInsightsClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __30__ATXUsageInsightsClient_init__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_usage_insights();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __30__ATXUsageInsightsClient_init__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)fetchAllDeliveredNotificationsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__ATXUsageInsightsClient_fetchAllDeliveredNotificationsWithCompletion___block_invoke;
    v16[3] = &unk_1E4D57A00;
    v18 = a2;
    v16[4] = self;
    v8 = v5;
    v17 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAllDeliveredNotificationsWithCompletion:", v8);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("No completion handler provided for %@ in %@"), v13, v15);

  }
}

void __71__ATXUsageInsightsClient_fetchAllDeliveredNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__ATXUsageInsightsClient_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke;
    v16[3] = &unk_1E4D57A00;
    v18 = a2;
    v16[4] = self;
    v8 = v5;
    v17 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:", v8);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("No completion handler provided for %@ in %@"), v13, v15);

  }
}

void __87__ATXUsageInsightsClient_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__ATXUsageInsightsClient_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke;
    v16[3] = &unk_1E4D57A00;
    v18 = a2;
    v16[4] = self;
    v8 = v5;
    v17 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:", v8);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("No completion handler provided for %@ in %@"), v13, v15);

  }
}

void __86__ATXUsageInsightsClient_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchUsageInsightsInferredATXModeEventsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__ATXUsageInsightsClient_fetchUsageInsightsInferredATXModeEventsWithCompletion___block_invoke;
    v16[3] = &unk_1E4D57A00;
    v18 = a2;
    v16[4] = self;
    v8 = v5;
    v17 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchUsageInsightsInferredATXModeEventsWithCompletion:", v8);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("No completion handler provided for %@ in %@"), v13, v15);

  }
}

void __80__ATXUsageInsightsClient_fetchUsageInsightsInferredATXModeEventsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchAllInterruptingAppSessionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke;
    v19[3] = &unk_1E4D57A00;
    v21 = a2;
    v19[4] = self;
    v9 = v5;
    v20 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke_8;
    v17[3] = &unk_1E4D57208;
    v18 = v9;
    objc_msgSend(v10, "fetchAllInterruptingAppSessionsWithCompletion:", v17);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No completion handler provided for %@ in %@"), v14, v16);

  }
}

void __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllPhubbingSessionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke;
    v19[3] = &unk_1E4D57A00;
    v21 = a2;
    v19[4] = self;
    v9 = v5;
    v20 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke_10;
    v17[3] = &unk_1E4D57208;
    v18 = v9;
    objc_msgSend(v10, "fetchAllPhubbingSessionsWithCompletion:", v17);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No completion handler provided for %@ in %@"), v14, v16);

  }
}

void __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllMindlessCyclingSessionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke;
    v19[3] = &unk_1E4D57A00;
    v21 = a2;
    v19[4] = self;
    v9 = v5;
    v20 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke_11;
    v17[3] = &unk_1E4D57208;
    v18 = v9;
    objc_msgSend(v10, "fetchAllMindlessCyclingSessionsWithCompletion:", v17);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No completion handler provided for %@ in %@"), v14, v16);

  }
}

void __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllContinuousUsageSessionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *xpcConnection;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke;
    v19[3] = &unk_1E4D57A00;
    v21 = a2;
    v19[4] = self;
    v9 = v5;
    v20 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke_12;
    v17[3] = &unk_1E4D57208;
    v18 = v9;
    objc_msgSend(v10, "fetchAllContinuousUsageSessionsWithCompletion:", v17);

  }
  else
  {
    __atxlog_handle_usage_insights();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("No completion handler provided for %@ in %@"), v14, v16);

  }
}

void __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_usage_insights();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __30__ATXUsageInsightsClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Interruption handler called", a5, a6, a7, a8, 2u);
}

void __30__ATXUsageInsightsClient_init__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Invalidation handler called", a5, a6, a7, a8, 2u);
}

@end
