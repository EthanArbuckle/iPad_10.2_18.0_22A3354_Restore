@implementation ATXNotificationsLoggingClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_instance;
}

void __47__ATXNotificationsLoggingClient_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXNotificationsLoggingClient;
  -[ATXNotificationsLoggingClient dealloc](&v3, sel_dealloc);
}

- (ATXNotificationsLoggingClient)init
{
  ATXNotificationsLoggingClient *v2;
  uint64_t v3;
  NSMutableArray *activeSuggestionsRequests;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  id v8;
  OS_dispatch_queue *v9;
  uint64_t v10;
  _PASSimpleCoalescingTimer *coalescingTimer;
  id v12;
  uint64_t v13;
  NSXPCConnection *xpcConnection;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ATXNotificationsLoggingClient;
  v2 = -[ATXNotificationsLoggingClient init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    activeSuggestionsRequests = v2->_activeSuggestionsRequests;
    v2->_activeSuggestionsRequests = (NSMutableArray *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("ATXNotificationsLoggingClient.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_initWeak(&location, v2);
    v8 = objc_alloc(MEMORY[0x24BE7A638]);
    v9 = v2->_queue;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __37__ATXNotificationsLoggingClient_init__block_invoke;
    v20 = &unk_24F87B548;
    objc_copyWeak(&v21, &location);
    v10 = objc_msgSend(v8, "initWithQueue:operation:", v9, &v17);
    coalescingTimer = v2->_coalescingTimer;
    v2->_coalescingTimer = (_PASSimpleCoalescingTimer *)v10;

    v12 = objc_alloc(MEMORY[0x24BDD1988]);
    v13 = objc_msgSend(v12, "initWithMachServiceName:options:", CFSTR("com.apple.notifications.logging"), 0, v17, v18, v19, v20);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v13;

    ATXNotificationsLoggingInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v15);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_56_0);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_58_0);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__ATXNotificationsLoggingClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processActiveSuggestionsRequests");

}

void __37__ATXNotificationsLoggingClient_init__block_invoke_2()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __37__ATXNotificationsLoggingClient_init__block_invoke_2_cold_1();

}

void __37__ATXNotificationsLoggingClient_init__block_invoke_57()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22D2A5000, v0, OS_LOG_TYPE_INFO, "ATXNotificationsLoggingClient invalidation handler called", v1, 2u);
  }

}

- (void)_processActiveSuggestionsRequests
{
  uint64_t v3;
  void *v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[5];

  v3 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke;
  v13[3] = &unk_24F87B5D8;
  v13[4] = self;
  v4 = (void *)MEMORY[0x22E3109C8](v13, a2);
  xpcConnection = self->_xpcConnection;
  v8 = v3;
  v9 = 3221225472;
  v10 = __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_62;
  v11 = &unk_24F87B600;
  v12 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeSuggestionsWithReply:", v6, v8, v9, v10, v11);

}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2;
  v12[3] = &unk_24F87B5B0;
  v12[4] = v8;
  v11 = v5;
  v13 = v11;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");

  objc_sync_exit(v7);
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1[4] + 24), "count") - 1 == a3)
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, a1[5], a1[6]);
  }
  else
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", ATXNotificationsLoggingClientErrorDomain, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v7);

  }
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_62_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activeSuggestionsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  ATXNotificationsLoggingClient *v7;
  NSMutableArray *activeSuggestionsRequests;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22D2A5000, v6, OS_LOG_TYPE_DEFAULT, "activeSuggestionsWithReply: queued request", v10, 2u);
    }

    v7 = self;
    objc_sync_enter(v7);
    activeSuggestionsRequests = v7->_activeSuggestionsRequests;
    v9 = (void *)MEMORY[0x22E3109C8](v4);
    -[NSMutableArray addObject:](activeSuggestionsRequests, "addObject:", v9);

    objc_sync_exit(v7);
    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](v7->_coalescingTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, 0.5);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXNotificationsLoggingClient activeSuggestionsWithReply:].cold.1();

  }
}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5 interactionUI:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v10 = a4;
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_64_0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logNotificationEvent:notification:reason:interactionUI:", a3, v10, a5, a6);

  }
  else
  {
    __atxlog_handle_notification_management();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:].cold.1();

  }
}

void __88__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason_interactionUI___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __88__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason_interactionUI___block_invoke_cold_1();

}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v6 = a4;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_65);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logNotificationEvent:notification:reason:interactionUI:", a3, v6, 0, 5);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:].cold.1();

  }
}

void __67__ATXNotificationsLoggingClient_logNotificationEvent_notification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__ATXNotificationsLoggingClient_logNotificationEvent_notification___block_invoke_cold_1();

}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v8 = a4;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_66_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logNotificationEvent:notification:reason:interactionUI:", a3, v8, a5, 5);

  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:].cold.1();

  }
}

void __74__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __74__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason___block_invoke_cold_1();

}

- (void)logSuggestionEvent:(int64_t)a3 suggestionType:(int64_t)a4 suggestionIdentifier:(id)a5 timestamp:(id)a6
{
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;

  xpcConnection = self->_xpcConnection;
  v10 = a6;
  v11 = a5;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_67);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", a3, a4, v11, v10);

}

void __98__ATXNotificationsLoggingClient_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __98__ATXNotificationsLoggingClient_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp___block_invoke_cold_1();

}

- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4 timestamp:(id)a5
{
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  id v10;

  xpcConnection = self->_xpcConnection;
  v8 = a5;
  v9 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_68_0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logNotificationGroupEvent:eventIdentifier:timestamp:", a3, v9, v8);

}

void __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke_cold_1();

}

- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4
{
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  id v8;

  xpcConnection = self->_xpcConnection;
  v6 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_69);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logNotificationGroupEvent:eventIdentifier:timestamp:", a3, v6, v7);

}

void __75__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke_cold_1();

}

- (void)logNotificationDeliveryUI:(unint64_t)a3 notificationUUIDs:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXNotificationsLoggingClient logNotificationDeliveryUI:notificationUUIDs:].cold.1((uint64_t)v6, v8);

  }
  else
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_71);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logNotificationDeliveryUI:notificationUUIDs:", a3, v6);

  }
}

void __77__ATXNotificationsLoggingClient_logNotificationDeliveryUI_notificationUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__ATXNotificationsLoggingClient_logNotificationDeliveryUI_notificationUUIDs___block_invoke_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_activeSuggestionsRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __37__ATXNotificationsLoggingClient_init__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_22D2A5000, v0, v1, "ATXNotificationsLoggingClient interruption handler called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_22D2A5000, v0, v1, "activeSuggestionsWithReply: throttling request from client side", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "activeSuggestionsWithReply: XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)activeSuggestionsWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_22D2A5000, v0, v1, "activeSuggestionsWithReply: called with no callback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)logNotificationEvent:notification:reason:interactionUI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_22D2A5000, v0, v1, "Nullability violation: notification.uuid is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __88__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason_interactionUI___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "logNotificationEvent:notification:reason:interactionUI XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__ATXNotificationsLoggingClient_logNotificationEvent_notification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "logNotificationEvent:notification XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "logNotificationEvent:notification:reason XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __98__ATXNotificationsLoggingClient_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "logSuggestionEvent:suggestionType:suggestionType:timestamp XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "logNotificationGroupEvent:eventIdentifier:timestamp XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logNotificationDeliveryUI:(uint64_t)a1 notificationUUIDs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_22D2A5000, a2, OS_LOG_TYPE_FAULT, "-logNotificationDeliveryUI:notificationUUIDs: was passed an object that is not an array: %{public}@", v5, 0xCu);

}

void __77__ATXNotificationsLoggingClient_logNotificationDeliveryUI_notificationUUIDs___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D2A5000, v0, v1, "-logNotificationDeliveryUI:notificationUUIDs: XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
