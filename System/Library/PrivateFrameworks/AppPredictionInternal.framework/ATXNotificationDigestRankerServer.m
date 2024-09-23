@implementation ATXNotificationDigestRankerServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_9 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_9, &__block_literal_global_74);
  return (id)sharedInstance__pasExprOnceResult_11;
}

void __51__ATXNotificationDigestRankerServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_11;
  sharedInstance__pasExprOnceResult_11 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXNotificationDigestRankerServer)init
{
  ATXNotificationDigestRankerServer *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXNotificationDigestRankerServer;
  v2 = -[ATXNotificationDigestRankerServer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF9350]);
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
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CF9350];
  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0CF9350]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF984098);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_generateDigestForNotificationStacks_reply_, 0, 0);

    v20 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    v21 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v16, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_generateDigestForNotificationStacks_reply_, 0, 1);

    v24 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v16, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_, 0, 0);

    v27 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v16, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_, 0, 1);

    v30 = (void *)MEMORY[0x1E0C99E60];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v16, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_appsSortedByNotificationsReceivedInPreviousNumDays_reply_, 0, 1);

    objc_msgSend(v5, "setExportedInterface:", v16);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_73_0);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_75);
    objc_msgSend(v5, "resume");
  }
  else
  {
    __atxlog_handle_notification_management();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v6, v16);
    v21 = 0;
  }

  return v21;
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_74_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *, id))a6;
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    v24 = 0;
    objc_msgSend(v12, "createDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:outError:", v10, a4, a5, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;

    __atxlog_handle_notification_management();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v17;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "[%@] Returning digest with UUID %@ and err %@", buf, 0x20u);

    }
    v11[2](v11, v13, v14);
  }
  else
  {
    __atxlog_handle_notification_management();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.1();

    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "raise:format:", v22, CFSTR("[%@] No reply handler provided for %@"), v14, v13);
  }

}

- (void)generateDigestForNotificationStacks:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v20 = 0;
    objc_msgSend(v8, "createDigestForNotificationStacks:outError:", v6, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;

    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "[%@] Returning digest with UUID %@ and err %@", buf, 0x20u);

    }
    v7[2](v7, v9, v10);
  }
  else
  {
    __atxlog_handle_notification_management();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.1();

    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("[%@] No reply handler provided for %@"), v10, v9);
  }

}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *, uint64_t, uint64_t, _QWORD);
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t, uint64_t, _QWORD))a4;
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ATXNotificationDigestRankerServer appsSortedByNotificationsReceivedInPreviousNumDays:reply:].cold.2();

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "appsSortedByNumOfNotificationsGivenNumOfDays:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "[%@] Returning apps sorted by number of notifications", buf, 0xCu);

    }
    v6[2](v6, v10, objc_msgSend(v9, "containsMessageAndTimeSensitiveData"), objc_msgSend(v9, "numDaysOfData"), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.1();

    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", v15, CFSTR("[%@] No reply handler provided for %@"), v9, v10);
  }

}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "numberOfActiveNotificationsWithCompletionHandler:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Rejecting connection %@ without entitlement %@", (uint8_t *)&v3, 0x16u);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "ATXNotificationDigestRankerServer Established connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Unexpected interruption on ATXNotificationDigestRankerServer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_74_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Connection invalidated on ATXNotificationDigestRankerServer. Client went away.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:.cold.1()
{
  const char *v0;
  objc_class *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v4, v5, "[%@] No reply handler provided for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:reply:.cold.2()
{
  NSObject *v0;
  const char *v1;
  id v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_0();
  v2 = (id)OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "[%@ %@] Fetching sorted apps", v4, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
