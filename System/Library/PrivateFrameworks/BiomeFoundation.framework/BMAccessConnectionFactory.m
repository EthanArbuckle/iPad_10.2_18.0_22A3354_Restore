@implementation BMAccessConnectionFactory

+ (id)connectionToFileServerInDomain:(unint64_t)a3 user:(unsigned int)a4 useCase:(id)a5
{
  uint64_t v5;
  id v7;
  BMAccessConnectionFactory *v8;
  void *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = -[BMAccessConnectionFactory initWithType:domain:user:useCase:]([BMAccessConnectionFactory alloc], "initWithType:domain:user:useCase:", 1, a3, v5, v7);

  -[BMAccessConnectionFactory makeConnection](v8, "makeConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)connectionToAccessServerInDomain:(unint64_t)a3 user:(unsigned int)a4 useCase:(id)a5
{
  uint64_t v5;
  id v7;
  BMAccessConnectionFactory *v8;
  void *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = -[BMAccessConnectionFactory initWithType:domain:user:useCase:]([BMAccessConnectionFactory alloc], "initWithType:domain:user:useCase:", 0, a3, v5, v7);

  -[BMAccessConnectionFactory makeConnection](v8, "makeConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BMAccessConnectionFactory)initWithType:(unint64_t)a3 domain:(unint64_t)a4 user:(unsigned int)a5 useCase:(id)a6
{
  id v11;
  BMAccessConnectionFactory *v12;
  BMAccessConnectionFactory *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BMAccessConnectionFactory;
  v12 = -[BMAccessConnectionFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_serviceType = a3;
    v12->_domain = a4;
    v12->_user = a5;
    objc_storeStrong((id *)&v12->_useCase, a6);
  }

  return v13;
}

+ (id)globalWeakConnectionCache
{
  if (globalWeakConnectionCache_onceToken != -1)
    dispatch_once(&globalWeakConnectionCache_onceToken, &__block_literal_global_10);
  return (id)globalWeakConnectionCache_cache;
}

uint64_t __54__BMAccessConnectionFactory_globalWeakConnectionCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BMCache weakCache](BMCache, "weakCache");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)globalWeakConnectionCache_cache;
  globalWeakConnectionCache_cache = v0;

  return objc_msgSend((id)globalWeakConnectionCache_cache, "setIsExpiredBlock:", &__block_literal_global_3);
}

uint64_t __54__BMAccessConnectionFactory_globalWeakConnectionCache__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid") ^ 1;
}

- (id)makeConnection
{
  _BMXPCConnectionCacheKey *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = -[_BMXPCConnectionCacheKey initWithServiceType:domain:user:useCase:flags:]([_BMXPCConnectionCacheKey alloc], "initWithServiceType:domain:user:useCase:flags:", self->_serviceType, self->_domain, self->_user, self->_useCase, -[BMAccessConnectionFactory _connectionFlags](self, "_connectionFlags"));
  objc_msgSend((id)objc_opt_class(), "globalWeakConnectionCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__BMAccessConnectionFactory_makeConnection__block_invoke;
  v7[3] = &unk_1E5E3D0C0;
  v7[4] = self;
  objc_msgSend(v4, "cachedObjectWithKey:missHandler:", v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__BMAccessConnectionFactory_makeConnection__block_invoke(uint64_t a1)
{
  BMXPCConnectionWrapper *v2;
  void *v3;
  id v4;

  v2 = [BMXPCConnectionWrapper alloc];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newConnection");
  v4 = -[BMXPCConnectionWrapper _initWithConnection:](v2, "_initWithConnection:", v3);

  return v4;
}

- (id)_newConnection
{
  unint64_t v3;

  v3 = -[BMAccessConnectionFactory _connectionFlags](self, "_connectionFlags");
  if ((v3 & 1) != 0)
  {
    -[BMAccessConnectionFactory _requestConnectionFromCaller](self, "_requestConnectionFromCaller");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((v3 & 2) != 0)
  {
    -[BMAccessConnectionFactory _proxyConnectionThroughCoreDuet](self, "_proxyConnectionThroughCoreDuet");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v3 & 0x10000) != 0)
      -[BMAccessConnectionFactory _legacyUserDomainConnection](self, "_legacyUserDomainConnection");
    else
      -[BMAccessConnectionFactory _regularConnection](self, "_regularConnection");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)machServiceName
{
  __CFString **v2;

  if (self->_serviceType > 1)
    return 0;
  v2 = &BMMachServiceNameSystemAccessService;
  if (self->_domain != 1)
    v2 = &BMMachServiceNameUserAccessService;
  return *v2;
}

- (id)coreDuetMachService
{
  get_DKMachServiceName();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)remoteObjectInterface
{
  unint64_t serviceType;
  id *v3;
  id v4;
  void *v5;

  serviceType = self->_serviceType;
  if (serviceType)
  {
    if (serviceType != 1)
    {
      v5 = 0;
      return v5;
    }
    v3 = (id *)&protocolRef_BMFileServer;
  }
  else
  {
    v3 = (id *)&protocolRef_BMAccessServer;
  }
  v4 = *v3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)connectionIsCrossUser
{
  unsigned int user;

  if (self->_domain)
    return 0;
  user = self->_user;
  return user != geteuid();
}

- (unsigned)user
{
  if (self->_domain == 1)
    return 0;
  else
    return self->_user;
}

- (BOOL)currentProcessCanDirectlyConnectCrossUser
{
  void *v2;
  char v3;

  if (!getuid())
    return 1;
  +[BMProcess current](BMProcess, "current");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForEntitlement:", CFSTR("com.apple.private.xpc.launchd.per-user-lookup"));

  return v3;
}

- (unint64_t)_connectionFlags
{
  void *v3;
  unint64_t v4;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  int v13;

  +[BMProcess current](BMProcess, "current");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "processType") == 4 || objc_msgSend(v3, "processType") == 5)
  {
    v4 = 1;
    goto LABEL_4;
  }
  v6 = -[NSString isEqual:](self->_useCase, "isEqual:", CFSTR("__coreduet__"));
  -[BMAccessConnectionFactory machServiceName](self, "machServiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "canPerformGlobalMachLookup:report:", v7, 1);
  if (v6)
  {
    if (!v8)
    {
      -[BMAccessConnectionFactory coreDuetMachService](self, "coreDuetMachService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "canPerformGlobalMachLookup:report:", v9, 0);

      v11 = v10 == 0;
      v12 = 2;
      goto LABEL_11;
    }
LABEL_9:

    v4 = 0;
    goto LABEL_4;
  }
  if ((v8 & 1) != 0)
    goto LABEL_9;
  v13 = objc_msgSend(v3, "canPerformGlobalMachLookup:report:", CFSTR("com.apple.biome.PublicStreamAccessService"), 0);

  v11 = v13 == 0;
  v12 = 0x10000;
LABEL_11:
  if (v11)
    v4 = 0;
  else
    v4 = v12;
LABEL_4:

  return v4;
}

- (id)_proxyConnectionThroughCoreDuet
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id result;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_1AEB31000, "Proxying connection through CoreDuet", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  get_DKMachServiceName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 4096);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v6 = get_DKDaemonInterfaceSymbolLoc_ptr;
  v22 = (uint64_t (*)(uint64_t, uint64_t))get_DKDaemonInterfaceSymbolLoc_ptr;
  if (!get_DKDaemonInterfaceSymbolLoc_ptr)
  {
    v7 = (void *)CoreDuetLibrary();
    v6 = dlsym(v7, "_DKDaemonInterface");
    v20[3] = (uint64_t)v6;
    get_DKDaemonInterfaceSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v19, 8);
  if (v6)
  {
    ((void (*)(void))v6)();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v8);

    objc_msgSend(v5, "resume");
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__3;
    v23 = __Block_byref_object_dispose__3;
    v24 = 0;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_79);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_domain == 1;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_80;
    v18[3] = &unk_1E5E3D108;
    v18[4] = &v19;
    objc_msgSend(v9, "requestBiomeEndpoint:reply:", v10, v18);

    v11 = v20[5];
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3B38];
      objc_msgSend((id)objc_opt_class(), "defaultQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bm_connectionWithListenerEndpoint:queue:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[BMAccessConnectionFactory _configureConnection:](self, "_configureConnection:", v14);
      objc_msgSend(v5, "invalidate");
    }
    else
    {
      objc_msgSend(v5, "invalidate");
      v14 = 0;
    }
    _Block_object_dispose(&v19, 8);

    os_activity_scope_leave(&state);
    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSXPCInterface *__softlink__DKDaemonInterface(void)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("BMAccessConnectionFactory.m"), 25, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __biome_log_for_category(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_cold_1();

}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __biome_log_for_category(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_80_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)_requestConnectionFromCaller
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t domain;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_1AEB31000, "Proxying connection through caller", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    __biome_log_for_category(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BMAccessConnectionFactory _requestConnectionFromCaller].cold.1(v5);

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_82);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  domain = self->_domain;
  v8 = -[BMAccessConnectionFactory user](self, "user");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_83;
  v15[3] = &unk_1E5E3D108;
  v15[4] = &v16;
  objc_msgSend(v6, "requestBiomeEndpointForAppScopedService:user:reply:", domain, v8, v15);

  v9 = (void *)v17[5];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3B38];
    objc_msgSend((id)objc_opt_class(), "defaultQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bm_connectionWithListenerEndpoint:queue:", v9, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_class();
    -[BMAccessConnectionFactory remoteObjectInterface](self, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_configureConnection:interface:useCase:", v9, v13, self->_useCase);

  }
  _Block_object_dispose(&v16, 8);

  os_activity_scope_leave(&state);
  return v9;
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __biome_log_for_category(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_cold_1();

}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __biome_log_for_category(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_83_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)_legacyUserDomainConnection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3B38];
  objc_msgSend((id)objc_opt_class(), "defaultQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bm_connectionWithMachServiceName:queue:options:", CFSTR("com.apple.biome.PublicStreamAccessService"), v4, 4096);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAccessConnectionFactory _configureConnection:](self, "_configureConnection:", v5);
  return v5;
}

- (id)_regularConnection
{
  __CFString **v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = &BMMachServiceNameUserAccessService;
  if (self->_domain)
    v3 = &BMMachServiceNameSystemAccessService;
  v4 = (void *)MEMORY[0x1E0CB3B38];
  v5 = *v3;
  objc_msgSend((id)objc_opt_class(), "defaultQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bm_connectionWithMachServiceName:queue:options:", v5, v6, 4096);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAccessConnectionFactory _configureConnection:](self, "_configureConnection:", v7);
  return v7;
}

- (void)_configureConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[BMAccessConnectionFactory remoteObjectInterface](self, "remoteObjectInterface");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureConnection:interface:useCase:", v4, v6, self->_useCase);

}

+ (id)defaultQueue
{
  if (defaultQueue_onceToken != -1)
    dispatch_once(&defaultQueue_onceToken, &__block_literal_global_84);
  return (id)defaultQueue_queue;
}

void __41__BMAccessConnectionFactory_defaultQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 2uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create_with_target_V2("com.apple.Biome.ResponseQueue", attr, v0);
  v2 = (void *)defaultQueue_queue;
  defaultQueue_queue = (uint64_t)v1;

}

+ (void)_configureConnection:(id)a3 interface:(id)a4 useCase:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  v10 = a3;
  objc_msgSend(v10, "setRemoteObjectInterface:", a4);
  objc_msgSend(a1, "defaultQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setQueue:", v9);

  objc_msgSend(v10, "activate");
  objc_msgSend(v10, "setBm_exportedUseCase:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0(&dword_1AEB31000, v0, v1, "Failed to connect to CoreDuet with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_80_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0(&dword_1AEB31000, v0, v1, "Proxy connection through CoreDuet with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_requestConnectionFromCaller
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AEB31000, log, OS_LOG_TYPE_FAULT, "Unable to determine current connection in write service", v1, 2u);
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0(&dword_1AEB31000, v0, v1, "Failed to connect to service client with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0(&dword_1AEB31000, v0, v1, "Proxy connection through service client with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
