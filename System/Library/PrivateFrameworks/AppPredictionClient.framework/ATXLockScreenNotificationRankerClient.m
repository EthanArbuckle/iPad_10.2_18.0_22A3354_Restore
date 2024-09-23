@implementation ATXLockScreenNotificationRankerClient

- (ATXLockScreenNotificationRankerClient)init
{
  ATXLockScreenNotificationRankerClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)ATXLockScreenNotificationRankerClient;
  v2 = -[ATXLockScreenNotificationRankerClient init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.LockScreenNotificationRanking.xpc"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = v2->_xpcConnection;
    ATXLockScreenNotificationRankerXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, v2);
    v7 = v2->_xpcConnection;
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __45__ATXLockScreenNotificationRankerClient_init__block_invoke;
    v16[3] = &unk_1E4D579D8;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v16);
    v9 = v2->_xpcConnection;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __45__ATXLockScreenNotificationRankerClient_init__block_invoke_59;
    v14[3] = &unk_1E4D579D8;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v14);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_loadWeakRetained(&location);
      v12 = (void *)objc_opt_class();
      -[ATXLockScreenNotificationRankerClient init].cold.1(v12, (uint64_t)v20, v10, v11);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__ATXLockScreenNotificationRankerClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__ATXLockScreenNotificationRankerClient_init__block_invoke_cold_1(a1, v2);

}

void __45__ATXLockScreenNotificationRankerClient_init__block_invoke_59(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "[%@] Connection invalidated", (uint8_t *)&v5, 0xCu);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXLockScreenNotificationRankerClient;
  -[ATXLockScreenNotificationRankerClient dealloc](&v3, sel_dealloc);
}

- (void)rankNotificationArrays:(id)a3 reply:(id)a4
{
  id v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a4;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke;
  v12[3] = &unk_1E4D57A00;
  v13 = v7;
  v14 = a2;
  v12[4] = self;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rankNotificationArrays:reply:", v10, v9);

}

void __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke_cold_1((const char *)a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 reply:(id)a6
{
  id v11;
  NSXPCConnection *xpcConnection;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  SEL v19;

  v11 = a6;
  xpcConnection = self->_xpcConnection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __128__ATXLockScreenNotificationRankerClient_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply___block_invoke;
  v17[3] = &unk_1E4D57A00;
  v18 = v11;
  v19 = a2;
  v17[4] = self;
  v13 = v11;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rankNewNotificationIntoNotificationArrays:newNotification:notificationArrayIndex:reply:", v15, v14, a5, v13);

}

void __128__ATXLockScreenNotificationRankerClient_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke_cold_1((const char *)a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)init
{
  id v7;

  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  v7 = a1;
  _os_log_debug_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_DEBUG, "[%@] Connection established", (uint8_t *)a2, 0xCu);

}

void __45__ATXLockScreenNotificationRankerClient_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = 138412290;
  v6 = (id)objc_opt_class();
  v4 = v6;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "[%@] Connection interrupted", (uint8_t *)&v5, 0xCu);

}

void __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke_cold_1(const char *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)OUTLINED_FUNCTION_3_1();
  v3 = OUTLINED_FUNCTION_4_0(v2);
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v5, v6, "[%@] Error in %@: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

@end
