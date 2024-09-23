@implementation ATXNotificationDigestRankerClient

- (ATXNotificationDigestRankerClient)init
{
  ATXNotificationDigestRankerClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)ATXNotificationDigestRankerClient;
  v2 = -[ATXNotificationDigestRankerClient init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.NotificationDigest.xpc"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B01E8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_generateDigestForNotificationStacks_reply_, 0, 0);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_generateDigestForNotificationStacks_reply_, 0, 1);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_appsSortedByNotificationsReceivedInPreviousNumDays_reply_, 0, 1);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_, 0, 0);

    v18 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_74);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_69);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");

  }
  return v2;
}

void __41__ATXNotificationDigestRankerClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __41__ATXNotificationDigestRankerClient_init__block_invoke_cold_1(v0);

}

void __41__ATXNotificationDigestRankerClient_init__block_invoke_68()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_INFO, "[ATXNotificationDigestRankerClient] Invalidation Handler Called", v1, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXNotificationDigestRankerClient;
  -[ATXNotificationDigestRankerClient dealloc](&v3, sel_dealloc);
}

- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6
{
  id v11;
  void (**v12)(id, _QWORD, void *);
  NSXPCConnection *xpcConnection;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (!v12)
  {
    __atxlog_handle_notification_management();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.1();

    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("[%@] No reply handler provided for %@"), v20, v21);

    goto LABEL_10;
  }
  if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.proactive.NotificationDigest.xpc"), 0) & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.2();

    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = *MEMORY[0x1E0CB2D98];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Missing entitlement for digest generation.  Not calling XPC service.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 1, v25);

    v12[2](v12, 0, v20);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke;
  v26[3] = &unk_1E4D57A00;
  v26[4] = self;
  v28 = a2;
  v14 = v12;
  v27 = v14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:", v11, a4, a5, v14);

LABEL_11:
}

void __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generateDigestForNotificationStacks:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSXPCConnection *xpcConnection;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (!v8)
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.1();

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("[%@] No reply handler provided for %@"), v16, v17);

    goto LABEL_10;
  }
  if ((objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.proactive.NotificationDigest.xpc"), 0) & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.2();

    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D98];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("Missing entitlement for digest generation.  Not calling XPC service.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 1, v21);

    v8[2](v8, 0, v16);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__ATXNotificationDigestRankerClient_generateDigestForNotificationStacks_reply___block_invoke;
  v22[3] = &unk_1E4D57A00;
  v22[4] = self;
  v24 = a2;
  v10 = v8;
  v23 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateDigestForNotificationStacks:reply:", v7, v10);

LABEL_11:
}

void __79__ATXNotificationDigestRankerClient_generateDigestForNotificationStacks_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(unint64_t)a3 reply:(id)a4
{
  id v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  NSXPCConnection *xpcConnection;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    __atxlog_handle_notification_management();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.1();

    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99768];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", v17, CFSTR("[%@] No reply handler provided for %@"), v19, v20);

    goto LABEL_12;
  }
  v8 = objc_msgSend(MEMORY[0x1E0D815A8], "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.proactive.NotificationDigest.xpc"), 0);
  __atxlog_handle_notification_management();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:].cold.2();

    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0CB2D98];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Missing entitlement for apps sorted by notifications.  Not calling XPC service.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v19);
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ATXNotificationDigestRankerClient appsSortedByNotificationsReceivedInPreviousNumDays:reply:].cold.2();

  xpcConnection = self->_xpcConnection;
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke;
  v26[3] = &unk_1E4D57A00;
  v26[4] = self;
  v28 = a2;
  v13 = v7;
  v27 = v13;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke_83;
  v24[3] = &unk_1E4D5BFA8;
  v25 = v13;
  objc_msgSend(v14, "appsSortedByNotificationsReceivedInPreviousNumDays:reply:", a3, v24);

LABEL_13:
}

void __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v5;
  NSXPCConnection *xpcConnection;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__ATXNotificationDigestRankerClient_numberOfActiveNotificationsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E4D57A00;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v7 = v5;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberOfActiveNotificationsWithCompletionHandler:", v7);

}

void __86__ATXNotificationDigestRankerClient_numberOfActiveNotificationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __41__ATXNotificationDigestRankerClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "[ATXNotificationDigestRankerClient] Interruption Handler Called", v1, 2u);
}

- (void)generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:.cold.1()
{
  NSObject *v0;
  const char *v1;
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_9();
  v2 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v0, v5, "[%@] No reply handler provided for %@", v6);

  OUTLINED_FUNCTION_5_0();
}

- (void)generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_1();
  v3 = CFSTR("com.apple.proactive.NotificationDigest.xpc");
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v0, v1, "Not attempting XPC service call on connection %@ without entitlement %@", v2);
  OUTLINED_FUNCTION_2();
}

void __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1()
{
  void *v0;
  objc_class *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (const char *)OUTLINED_FUNCTION_12_0();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v4, v5, "[%@] Error in %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_5();
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:reply:.cold.2()
{
  NSObject *v0;
  const char *v1;
  id v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9();
  v2 = (id)OUTLINED_FUNCTION_2_1();
  NSStringFromSelector(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEBUG, "[%@ %@] Fetching sorted apps", v4, 0x16u);

  OUTLINED_FUNCTION_5_0();
}

@end
