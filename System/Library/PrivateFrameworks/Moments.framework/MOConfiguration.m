@implementation MOConfiguration

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MOConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_shared_0;
}

void __33__MOConfiguration_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_shared_0;
  sharedInstance_shared_0 = (uint64_t)v1;

}

- (MOConfiguration)init
{
  MOConfiguration *v2;
  uint64_t v3;
  NSMutableDictionary *cachedEventStreamPermissions;
  uint64_t v5;
  NSMutableDictionary *cachedResourceStreamPermissions;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  MOConnection *v25;
  MOConnection *connectionProxy;
  uint64_t v27;
  NSXPCConnection *connection;
  void *v29;
  uint64_t v30;
  MOConfigurationXPCProtocol *syncProxy;
  NSObject *v32;
  uint8_t buf[16];
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)MOConfiguration;
  v2 = -[MOConfiguration init](&v35, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedEventStreamPermissions = v2->cachedEventStreamPermissions;
    v2->cachedEventStreamPermissions = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    cachedResourceStreamPermissions = v2->cachedResourceStreamPermissions;
    v2->cachedResourceStreamPermissions = (NSMutableDictionary *)v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)onEventStreamsUpdated_bounce, CFSTR("com.apple.momentsd.event-streams-updated"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF99CCC8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_isAllowedToPromptEventCategory_withReply_, 0, 0);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_isAllowedToPromptEventCategory_withReply_, 0, 1);

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_isAllowedToPromptResourceType_withReply_, 0, 0);

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_isAllowedToPromptResourceType_withReply_, 0, 1);

    v25 = -[MOConnection initWithName:]([MOConnection alloc], "initWithName:", CFSTR("MOConfiguration"));
    connectionProxy = v2->connectionProxy;
    v2->connectionProxy = v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.momentsd"), 0);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v27;

    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v8);
    -[MOConnection onConnectionInterrupted](v2->connectionProxy, "onConnectionInterrupted");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setInterruptionHandler:](v2->connection, "setInterruptionHandler:", v29);

    -[NSXPCConnection setInvalidationHandler:](v2->connection, "setInvalidationHandler:", &__block_literal_global_5);
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v2->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_83);
    v30 = objc_claimAutoreleasedReturnValue();
    syncProxy = v2->syncProxy;
    v2->syncProxy = (MOConfigurationXPCProtocol *)v30;

    -[NSXPCConnection resume](v2->connection, "resume");
  }
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAE42000, v32, OS_LOG_TYPE_DEFAULT, "initiate client", buf, 2u);
  }

  return v2;
}

void __23__MOConfiguration_init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_DEFAULT, "Invalidated", v1, 2u);
  }

}

void __23__MOConfiguration_init__block_invoke_81(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = CFSTR("Error on remote object proxy");
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1CAE42000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MOConfiguration;
  -[MOConfiguration dealloc](&v3, sel_dealloc);
}

- (void)onEventStreamsUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAE42000, v3, OS_LOG_TYPE_INFO, "onEventStreamsUpdated", v4, 2u);
  }

  -[MOConfiguration reset](self, "reset");
}

- (void)reset
{
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *cachedEventStreamPermissions;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedResourceStreamPermissions;
  uint8_t v8[16];

  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CAE42000, v3, OS_LOG_TYPE_INFO, "clearing cache", v8, 2u);
  }

  v4 = (NSMutableDictionary *)objc_opt_new();
  cachedEventStreamPermissions = self->cachedEventStreamPermissions;
  self->cachedEventStreamPermissions = v4;

  v6 = (NSMutableDictionary *)objc_opt_new();
  cachedResourceStreamPermissions = self->cachedResourceStreamPermissions;
  self->cachedResourceStreamPermissions = v6;

}

- (BOOL)isAllowedToPromptEventCategory:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MOConnection *connectionProxy;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  if (self->syncProxy)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->cachedEventStreamPermissions, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    if (v7)
    {
      v9 = objc_msgSend(v7, "BOOLValue");
      *((_BYTE *)v23 + 24) = v9;
    }
    else
    {
      connectionProxy = self->connectionProxy;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke;
      v21[3] = &unk_1E8542B18;
      v21[5] = &v22;
      v21[6] = a3;
      v21[4] = self;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_90;
      v20[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v20[4] = a3;
      -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v21, v20);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v23 + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->cachedEventStreamPermissions, "setObject:forKeyedSubscript:", v18, v6);

      v9 = *((_BYTE *)v23 + 24) != 0;
    }
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOConfiguration isAllowedToPromptEventCategory:].cold.1(v6, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = a1[5];
  v5 = *(void **)(a1[4] + 16);
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_2;
  v8[3] = &unk_1E8542AF0;
  v10 = v4;
  v11 = v6;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "isAllowedToPromptEventCategory:withReply:", v6, v8);

}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1CAE42000, v6, OS_LOG_TYPE_DEBUG, "isAllowedToPrompt event category: %@ %@, %@", (uint8_t *)&v9, 0x20u);

  }
  if (!v5)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  (*(void (**)(void))(a1[4] + 16))();

}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_90_cold_1(a1);

}

- (BOOL)isAllowedToPromptResourceType:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MOConnection *connectionProxy;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  if (self->syncProxy)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->cachedResourceStreamPermissions, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    if (v7)
    {
      v9 = objc_msgSend(v7, "BOOLValue");
      *((_BYTE *)v23 + 24) = v9;
    }
    else
    {
      connectionProxy = self->connectionProxy;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke;
      v21[3] = &unk_1E8542B18;
      v21[5] = &v22;
      v21[6] = a3;
      v21[4] = self;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_92;
      v20[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v20[4] = a3;
      -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v21, v20);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v23 + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->cachedResourceStreamPermissions, "setObject:forKeyedSubscript:", v18, v6);

      v9 = *((_BYTE *)v23 + 24) != 0;
    }
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOConfiguration isAllowedToPromptEventCategory:].cold.1(v6, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = a1[5];
  v5 = *(void **)(a1[4] + 16);
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_2;
  v8[3] = &unk_1E8542AF0;
  v10 = v4;
  v11 = v6;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "isAllowedToPromptResourceType:withReply:", v6, v8);

}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1CAE42000, v6, OS_LOG_TYPE_DEBUG, "isAllowedToPrompt resource type: %@ %@, %@", (uint8_t *)&v9, 0x20u);

  }
  if (!v5)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  (*(void (**)(void))(a1[4] + 16))();

}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_92_cold_1(a1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedResourceStreamPermissions, 0);
  objc_storeStrong((id *)&self->cachedEventStreamPermissions, 0);
  objc_storeStrong((id *)&self->connectionProxy, 0);
  objc_storeStrong((id *)&self->syncProxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

- (void)isAllowedToPromptEventCategory:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid remote syncProxy", a5, a6, a7, a8, 0);
}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_90_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_7(&dword_1CAE42000, v2, v3, "isAllowedToPrompt event category: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_92_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_7(&dword_1CAE42000, v2, v3, "isAllowedToPrompt resource type: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

@end
