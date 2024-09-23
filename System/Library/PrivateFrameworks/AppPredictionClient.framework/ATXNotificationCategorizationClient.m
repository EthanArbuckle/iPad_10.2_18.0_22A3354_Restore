@implementation ATXNotificationCategorizationClient

- (ATXNotificationCategorizationClient)init
{
  ATXNotificationCategorizationClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXNotificationCategorizationClient;
  v2 = -[ATXNotificationCategorizationClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.personalization.notificationCategorization"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    ATXNotificationCategorizationXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v2);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_13);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_3_0);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __43__ATXNotificationCategorizationClient_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_categorization();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__ATXNotificationCategorizationClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __43__ATXNotificationCategorizationClient_init__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_categorization();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__ATXNotificationCategorizationClient_init__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)collectDynamicBreakthroughFeaturesForNotification:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]";
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke;
    v22[3] = &unk_1E4D57A00;
    v24 = a2;
    v22[4] = self;
    v12 = v8;
    v23 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_8;
    v20[3] = &unk_1E4D58100;
    v21 = v12;
    objc_msgSend(v13, "collectDynamicBreakthroughFeaturesForNotification:completion:", v7, v20);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No completion handler provided for %@ in %@"), v17, v19);

  }
}

void __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_categorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_notification_categorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)collectCoreAnalyticsJsonForNotification:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXNotificationCategorizationClient collectCoreAnalyticsJsonForNotification:completion:]";
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke;
    v22[3] = &unk_1E4D57A00;
    v24 = a2;
    v22[4] = self;
    v12 = v8;
    v23 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke_10;
    v20[3] = &unk_1E4D58128;
    v21 = v12;
    objc_msgSend(v13, "collectCoreAnalyticsJsonForNotification:completion:", v7, v20);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No completion handler provided for %@ in %@"), v17, v19);

  }
}

void __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_categorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_notification_categorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient collectCoreAnalyticsJsonForNotification:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rankUserNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXNotificationCategorizationClient rankUserNotificationWithRequest:completion:]";
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke;
    v22[3] = &unk_1E4D57A00;
    v24 = a2;
    v22[4] = self;
    v12 = v8;
    v23 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke_12;
    v20[3] = &unk_1E4D58150;
    v21 = v12;
    objc_msgSend(v13, "rankUserNotificationWithRequest:completion:", v7, v20);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No completion handler provided for %@ in %@"), v17, v19);

  }
}

void __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_categorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_notification_categorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient rankUserNotificationWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchContextForNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXNotificationCategorizationClient fetchContextForNotificationWithRequest:completion:]";
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Fetching notification context %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke;
    v22[3] = &unk_1E4D57A00;
    v24 = a2;
    v22[4] = self;
    v12 = v8;
    v23 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke_14;
    v20[3] = &unk_1E4D58178;
    v21 = v12;
    objc_msgSend(v13, "fetchContextForNotificationWithRequest:completion:", v7, v20);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No completion handler provided for %@ in %@"), v17, v19);

  }
}

void __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_categorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_notification_categorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient fetchContextForNotificationWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchContextForMailWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXNotificationCategorizationClient fetchContextForMailWithRequest:completion:]";
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Fetching mail context %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke;
    v22[3] = &unk_1E4D57A00;
    v24 = a2;
    v22[4] = self;
    v12 = v8;
    v23 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke_16;
    v20[3] = &unk_1E4D581A0;
    v21 = v12;
    objc_msgSend(v13, "fetchContextForMailWithRequest:completion:", v7, v20);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No completion handler provided for %@ in %@"), v17, v19);

  }
}

void __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_categorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_notification_categorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient fetchContextForMailWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchContextForMessageWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXNotificationCategorizationClient fetchContextForMessageWithRequest:completion:]";
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Fetching message context %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke;
    v22[3] = &unk_1E4D57A00;
    v24 = a2;
    v22[4] = self;
    v12 = v8;
    v23 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke_18;
    v20[3] = &unk_1E4D581C8;
    v21 = v12;
    objc_msgSend(v13, "fetchContextForMessageWithRequest:completion:", v7, v20);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("No completion handler provided for %@ in %@"), v17, v19);

  }
}

void __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_categorization();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_notification_categorization();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient fetchContextForMessageWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __43__ATXNotificationCategorizationClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Interruption handler called", a5, a6, a7, a8, 2u);
}

void __43__ATXNotificationCategorizationClient_init__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Invalidation handler called", a5, a6, a7, a8, 2u);
}

- (void)collectDynamicBreakthroughFeaturesForNotification:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v4, v5, "No completion handler provided for %@ in %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

void __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_8();
  v2 = (const char *)OUTLINED_FUNCTION_10(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_6_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v5, v6, "%@ in %@ xpc error:%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_5();
}

@end
