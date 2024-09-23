@implementation ATXLockScreenNotificationRankerServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_44 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_44, &__block_literal_global_255);
  return (id)sharedInstance__pasExprOnceResult_59;
}

void __55__ATXLockScreenNotificationRankerServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_59;
  sharedInstance__pasExprOnceResult_59 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXLockScreenNotificationRankerServer)init
{
  ATXLockScreenNotificationRankerServer *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXLockScreenNotificationRankerServer;
  v2 = -[ATXLockScreenNotificationRankerServer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF9348]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CF9348];
  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x1E0CF9348]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    ATXLockScreenNotificationRankerXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke;
    v20[3] = &unk_1E82DB988;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v20);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_11;
    v18[3] = &unk_1E82DB988;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v18);
    objc_msgSend(v7, "resume");
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_loadWeakRetained(&location);
      v14 = (void *)objc_opt_class();
      -[ATXLockScreenNotificationRankerServer listener:shouldAcceptNewConnection:].cold.2(v14, (uint64_t)v23, v12, v13);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v15 = 1;
  }
  else
  {
    __atxlog_handle_notification_management();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXLockScreenNotificationRankerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, v8, v16);

    v15 = 0;
  }

  return v15;
}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(a1);

}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_11(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_11_cold_1(a1);

}

- (void)rankNotificationArrays:(id)a3 reply:(id)a4
{
  void (**v7)(id, void *, id);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    v14 = 0;
    +[ATXLockScreenNotificationRanker rankNotificationArrays:error:](ATXLockScreenNotificationRanker, "rankNotificationArrays:error:", a3, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    v7[2](v7, v8, v9);

  }
  else
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXLockScreenNotificationRankerServer rankNotificationArrays:reply:].cold.1((uint64_t)self, a2, v10);

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = objc_opt_class();
    NSStringFromSelector(a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("[%@] No reply handler provided for %@"), v13, v9);
  }

}

- (void)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 reply:(id)a6
{
  void (**v11)(id, uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;

  v11 = (void (**)(id, uint64_t, uint64_t, void *))a6;
  if (v11)
  {
    v23 = 0;
    +[ATXLockScreenNotificationRanker rankNewNotificationIntoNotificationArrays:newNotification:notificationArrayIndex:error:](ATXLockScreenNotificationRanker, "rankNewNotificationIntoNotificationArrays:newNotification:notificationArrayIndex:error:", a3, a4, a5, &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v12, "first");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");
      objc_msgSend(v12, "second");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v16, objc_msgSend(v17, "unsignedIntegerValue"), v14);

    }
    else
    {
      if (!v13)
      {
        __atxlog_handle_notification_management();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[ATXLockScreenNotificationRankerServer rankNewNotificationIntoNotificationArrays:newNotification:notificationArrayIndex:reply:].cold.2((uint64_t)self, v22);

      }
      v11[2](v11, 0, 0, v14);
    }

  }
  else
  {
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXLockScreenNotificationRankerServer rankNotificationArrays:reply:].cold.1((uint64_t)self, a2, v18);

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99768];
    v21 = objc_opt_class();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", v20, CFSTR("[%@] No reply handler provided for %@"), v21, v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a3, (uint64_t)a3, "Rejecting connection %@ without entitlement %@", (uint8_t *)&v3);
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:(void *)a4 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v7;

  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  v7 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "[%@] Connection established", (uint8_t *)a2, 0xCu);

}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = OUTLINED_FUNCTION_5_9(a1);
  v2 = (void *)objc_opt_class();
  v3 = OUTLINED_FUNCTION_2_10(v2);
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v4, v5, "[%@] Connection interrupted", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_11_cold_1(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = OUTLINED_FUNCTION_5_9(a1);
  v2 = (void *)objc_opt_class();
  v3 = OUTLINED_FUNCTION_2_10(v2);
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v4, v5, "[%@] Connection invalidated", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)rankNotificationArrays:(NSObject *)a3 reply:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v5 = (id)OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a3, v7, "[%@] No reply handler provided for %@", v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)rankNewNotificationIntoNotificationArrays:(uint64_t)a1 newNotification:(NSObject *)a2 notificationArrayIndex:reply:.cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint8_t v5[24];

  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_2_10(v3);
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "[%@] Programming error. Both result and error are nil.", v5, 0xCu);

}

@end
