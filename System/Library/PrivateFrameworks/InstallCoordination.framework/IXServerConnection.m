@implementation IXServerConnection

+ (id)sharedConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__IXServerConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, block);
  return (id)sharedConnection_shared;
}

void __38__IXServerConnection_sharedConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedConnection_shared;
  sharedConnection_shared = (uint64_t)v0;

}

- (void)_onQueue_scanForAndRemoveEmptyHashTables
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_3(&dword_1A4BF6000, v0, v1, "%s: Detected orphaned promises %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __62__IXServerConnection__onQueue_scanForAndRemoveEmptyHashTables__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (!objc_msgSend(a3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  *a4 = 0;

}

void __62__IXServerConnection__onQueue_scanForAndRemoveEmptyHashTables__block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (!objc_msgSend(a3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  *a4 = 0;

}

- (void)_onQueue_reSetupObserversAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  -[IXServerConnection _onQueue_scanForAndRemoveEmptyHashTables](self, "_onQueue_scanForAndRemoveEmptyHashTables");
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[IXServerConnection promiseInstances](self, "promiseInstances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke;
    v24[3] = &unk_1E4DC44F8;
    v25 = v4;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_remote_addObserversForDataPromisesWithUUIDs:", v8);

  }
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[IXServerConnection coordinatorInstances](self, "coordinatorInstances");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v20 = 3221225472;
    v21 = __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke_24;
    v22 = &unk_1E4DC44F8;
    v23 = v4;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", &v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:", v16, 1, v19, v20, v21, v22);

  }
}

void __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXServerConnection _onQueue_reSetupObserversAfter:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to re-enable promise observers after %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXServerConnection _onQueue_reSetupObserversAfter:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to re-enable coordinator observers after %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)_onQueue_doCleanupForCoordinatorWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IXServerConnection coordinatorInstances](self, "coordinatorInstances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXServerConnection _onQueue_doCleanupForCoordinatorWithUUID:].cold.1();
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v7, "setCount:", objc_msgSend(v7, "count") - 1);
  if (!objc_msgSend(v7, "count"))
  {
    -[IXServerConnection coordinatorInstances](self, "coordinatorInstances");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v4);
LABEL_8:

  }
}

- (void)_onQueue_doCleanupForPromiseWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IXServerConnection promiseInstances](self, "promiseInstances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXServerConnection _onQueue_doCleanupForPromiseWithUUID:].cold.1();
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v7, "setCount:", objc_msgSend(v7, "count") - 1);
  if (!objc_msgSend(v7, "count"))
  {
    -[IXServerConnection promiseInstances](self, "promiseInstances");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v4);
LABEL_8:

  }
}

- (BOOL)_onQueue_createXPCConnectionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _BYTE location[12];
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[IXServerConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.installcoordinationd"), 4096);
  -[IXServerConnection setXpcConnection:](self, "setXpcConnection:", v4);

  -[IXServerConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[IXClientProtocolInterface interface](IXClientProtocolInterface, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v6);

    +[IXClientDelegateProtocolInterface interface](IXClientDelegateProtocolInterface, "interface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v8);

    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedObject:", self);

    objc_initWeak((id *)location, self);
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke;
    v19[3] = &unk_1E4DC5388;
    objc_copyWeak(&v20, (id *)location);
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInterruptionHandler:", v19);

    objc_copyWeak(&v18, (id *)location);
    -[IXServerConnection xpcConnection](self, "xpcConnection", v11, 3221225472, __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2, &unk_1E4DC5388);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInvalidationHandler:", &v17);

    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    -[IXServerConnection _onQueue_reSetupObserversAfter:](self, "_onQueue_reSetupObserversAfter:", CFSTR("connection setup"));
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
    return 1;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[IXServerConnection _onQueue_createXPCConnectionIfNecessary]";
    v22 = 2112;
    v23 = CFSTR("com.apple.installcoordinationd");
    _os_log_impl(&dword_1A4BF6000, v16, OS_LOG_TYPE_DEFAULT, "%s: Failed to create NSXPCConnection for service %@", location, 0x16u);
  }

  return 0;
}

void __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[IXServerConnection _onQueue_createXPCConnectionIfNecessary]_block_invoke";
    _os_log_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection interrupted to installcoordinationd", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_29;
    block[3] = &unk_1E4DC4890;
    block[4] = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reSetupObserversAfter:", CFSTR("connection interruption"));
}

void __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[IXServerConnection _onQueue_createXPCConnectionIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection invalidated to installcoordinationd", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_32;
    block[3] = &unk_1E4DC4890;
    block[4] = v4;
    dispatch_async(v5, block);

  }
}

void __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_scanForAndRemoveEmptyHashTables");
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "promiseInstances");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      return;
  }
  v5 = dispatch_time(0, 1000000000);
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2_33;
  block[3] = &unk_1E4DC4890;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v5, v6, block);

}

uint64_t __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_createXPCConnectionIfNecessary");
}

- (IXServerConnection)init
{
  IXServerConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  uint64_t v6;
  NSMutableDictionary *coordinatorInstances;
  uint64_t v8;
  NSMutableDictionary *promiseInstances;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IXServerConnection;
  v2 = -[IXServerConnection init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.installcoordination.IXServerConnection.internal", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    coordinatorInstances = v2->_coordinatorInstances;
    v2->_coordinatorInstances = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    promiseInstances = v2->_promiseInstances;
    v2->_promiseInstances = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (id)_onQueue_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[IXServerConnection _onQueue_createXPCConnectionIfNecessary](self, "_onQueue_createXPCConnectionIfNecessary"))
  {
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IXQueueForConcurrentOperations();
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke;
    v10[3] = &unk_1E4DC3E68;
    v11 = v4;
    IXDispatchAsyncWithAutoreleasePool(v8, v10);

    v7 = 0;
  }

  return v7;
}

void __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();

  _CreateError((uint64_t)"-[IXServerConnection _onQueue_remoteObjectProxyWithErrorHandler:]_block_invoke", 243, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Unable to get remote object proxy for installcoordinationd connection"), v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__IXServerConnection_remoteObjectProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E4DC53B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__IXServerConnection_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_onQueue_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[IXServerConnection _onQueue_createXPCConnectionIfNecessary](self, "_onQueue_createXPCConnectionIfNecessary"))
  {
    -[IXServerConnection xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXServerConnection _onQueue_synchronousRemoteObjectProxyWithErrorHandler:].cold.1();

    _CreateError((uint64_t)"-[IXServerConnection _onQueue_synchronousRemoteObjectProxyWithErrorHandler:]", 266, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Unable to get synchronous remote object proxy for installcoordinationd connection"), v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v10);

    v7 = 0;
  }
  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__IXServerConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E4DC53B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __67__IXServerConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_synchronousRemoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)retrySynchronousIPC:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  uint64_t i;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))a3;
  v4 = 0;
  v5 = *MEMORY[0x1E0CB28A8];
  for (i = 6; i; --i)
  {
    if (v4)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "+[IXServerConnection retrySynchronousIPC:]";
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Retrying IPC because of error %@", buf, 0x16u);
      }

      sleep(1u);
    }
    v3[2](v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v5) || objc_msgSend(v8, "code") != 4097)
    {

      break;
    }

    v4 = v8;
  }

  return v8;
}

- (void)registerAppInstallCoordinatorForUpdates:(id)a3 notifyDaemon:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IXServerConnection internalQueue](self, "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke;
    v11[3] = &unk_1E4DC53D8;
    v11[4] = self;
    v9 = v7;
    v12 = v9;
    v13 = v6;
    v14 = a4;
    dispatch_sync(v8, v11);

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[IXServerConnection registerAppInstallCoordinatorForUpdates:notifyDaemon:]";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: Tracking coordinator with UUID %@", buf, 0x16u);
    }

  }
}

void __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke(uint64_t a1)
{
  void *v2;
  IXAppInstallObjectsMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (IXAppInstallObjectsMetadata *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v3 = objc_alloc_init(IXAppInstallObjectsMetadata);
    objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  -[IXAppInstallObjectsMetadata addObject:](v3, "addObject:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke_2;
    v8[3] = &unk_1E4DC44F8;
    v5 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_onQueue_remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:", v7, 0);

    objc_msgSend(*(id *)(a1 + 48), "setIsRegisteredWithDaemon:", 1);
  }

}

void __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXServerConnection registerAppInstallCoordinatorForUpdates:notifyDaemon:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to register coordinator with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)unregisterForUpdatesForAppInstallCoordinatorWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[IXServerConnection internalQueue](self, "internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke;
    v6[3] = &unk_1E4DC4728;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_doCleanupForCoordinatorWithUUID:", *(_QWORD *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke_2;
  v6[3] = &unk_1E4DC44F8;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_onQueue_remoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remote_removeObserverForCoordinatorWithUUID:", *(_QWORD *)(a1 + 40));

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v9 = "-[IXServerConnection unregisterForUpdatesForAppInstallCoordinatorWithUUID:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: No longer tracking coordinator with UUID %@", buf, 0x16u);
  }

}

void __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXServerConnection unregisterForUpdatesForAppInstallCoordinatorWithUUID:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to unregister coordinator with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)registerDataPromiseForUpdates:(id)a3 notifyDaemon:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IXServerConnection internalQueue](self, "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke;
    v11[3] = &unk_1E4DC53D8;
    v11[4] = self;
    v9 = v7;
    v12 = v9;
    v13 = v6;
    v14 = a4;
    dispatch_sync(v8, v11);

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[IXServerConnection registerDataPromiseForUpdates:notifyDaemon:]";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: Tracking data promise with UUID %@", buf, 0x16u);
    }

  }
}

void __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke(uint64_t a1)
{
  void *v2;
  IXAppInstallObjectsMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "promiseInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (IXAppInstallObjectsMetadata *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v3 = objc_alloc_init(IXAppInstallObjectsMetadata);
    objc_msgSend(*(id *)(a1 + 32), "promiseInstances");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  -[IXAppInstallObjectsMetadata addObject:](v3, "addObject:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke_2;
    v8[3] = &unk_1E4DC44F8;
    v5 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_onQueue_remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_remote_addObserversForDataPromisesWithUUIDs:", v7);

  }
}

void __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXServerConnection registerDataPromiseForUpdates:notifyDaemon:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to register promise with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)unregisterForUpdatesForDataPromiseWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[IXServerConnection internalQueue](self, "internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke;
    v6[3] = &unk_1E4DC4728;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_doCleanupForPromiseWithUUID:", *(_QWORD *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke_2;
  v6[3] = &unk_1E4DC44F8;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_onQueue_remoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remote_removeObserverForDataPromiseWithUUID:", *(_QWORD *)(a1 + 40));

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v9 = "-[IXServerConnection unregisterForUpdatesForDataPromiseWithUUID:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: No longer tracking data promise with UUID %@", buf, 0x16u);
  }

}

void __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXServerConnection unregisterForUpdatesForDataPromiseWithUUID:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to unregister promise with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)resetDaemonConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[IXServerConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__IXServerConnection_resetDaemonConnection__block_invoke;
  block[3] = &unk_1E4DC4890;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __43__IXServerConnection_resetDaemonConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[IXServerConnection resetDaemonConnection]_block_invoke";
    _os_log_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_DEFAULT, "%s: Resetting daemon connection", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remote_fakeClientDeathWithCompletion:", &__block_literal_global_46);

  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "promiseInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

void __43__IXServerConnection_resetDaemonConnection__block_invoke_44(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[IXServerConnection resetDaemonConnection]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to request the daemon to fake our death: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __43__IXServerConnection_resetDaemonConnection__block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[IXServerConnection resetDaemonConnection]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to request the daemon to fake our death: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__IXServerConnection__client_coordinatorDidRegisterForObservationWithUUID___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __75__IXServerConnection__client_coordinatorDidRegisterForObservationWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_didRegisterForObservation", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__IXServerConnection__client_coordinatorShouldPrioritizeWithUUID___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__IXServerConnection__client_coordinatorShouldPrioritizeWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldPrioritize", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_coordinatorShouldResumeWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__IXServerConnection__client_coordinatorShouldResumeWithUUID___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__IXServerConnection__client_coordinatorShouldResumeWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldResume", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_coordinatorShouldPauseWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__IXServerConnection__client_coordinatorShouldPauseWithUUID___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__IXServerConnection__client_coordinatorShouldPauseWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldPause", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__IXServerConnection__client_coordinatorWithUUID_configuredPromiseDidBeginFulfillment___block_invoke;
  block[3] = &unk_1E4DC3EB8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __87__IXServerConnection__client_coordinatorWithUUID_configuredPromiseDidBeginFulfillment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_promiseDidBeginFulfillmentWithIdentifier:", *(_QWORD *)(a1 + 48), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__IXServerConnection__client_coordinatorShouldBeginRestoringUserDataWithUUID___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __78__IXServerConnection__client_coordinatorShouldBeginRestoringUserDataWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldBeginRestoringUserData", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__IXServerConnection__client_coordinatorDidInstallPlaceholderWithUUID_forRecordPromise___block_invoke;
  block[3] = &unk_1E4DC5420;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __88__IXServerConnection__client_coordinatorDidInstallPlaceholderWithUUID_forRecordPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "modifiesLocalLaunchServicesDatabase"))
  {
    IXApplicationRecordForRecordPromise(*(void **)(a1 + 48), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_clientDelegate_placeholderDidInstallForApplicationRecord:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__IXServerConnection__client_coordinatorShouldBeginPostProcessingWithUUID_forRecordPromise___block_invoke;
  block[3] = &unk_1E4DC5420;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __92__IXServerConnection__client_coordinatorShouldBeginPostProcessingWithUUID_forRecordPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "modifiesLocalLaunchServicesDatabase"))
  {
    IXApplicationRecordForRecordPromise(*(void **)(a1 + 48), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_clientDelegate_shouldBeginPostProcessingForApplicationRecord:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__IXServerConnection__client_coordinatorDidCompleteSuccessfullyWithUUID_forRecordPromise___block_invoke;
  block[3] = &unk_1E4DC5420;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __90__IXServerConnection__client_coordinatorDidCompleteSuccessfullyWithUUID_forRecordPromise___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "modifiesLocalLaunchServicesDatabase"))
  {
    IXApplicationRecordForRecordPromise(*(void **)(a1 + 48), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_clientDelegate_didCompleteForApplicationRecord:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__IXServerConnection__client_coordinatorWithUUID_didCancelWithReason_client___block_invoke;
  v13[3] = &unk_1E4DC5448;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __77__IXServerConnection__client_coordinatorWithUUID_didCancelWithReason_client___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    v19 = "-[IXServerConnection _client_coordinatorWithUUID:didCancelWithReason:client:]_block_invoke";
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2048;
    v25 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Messaged with uuid %@ to cancel with reason %@; found %lu coordinators to cancel",
      buf,
      0x2Au);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_clientDelegate_didCancelWithError:client:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  double v15;
  unint64_t v16;
  double v17;

  v10 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__IXServerConnection__client_coordinatorWithUUID_didUpdateProgress_forPhase_overallProgress___block_invoke;
  block[3] = &unk_1E4DC5470;
  block[4] = self;
  v14 = v10;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v12 = v10;
  dispatch_async(v11, block);

}

void __93__IXServerConnection__client_coordinatorWithUUID_didUpdateProgress_forPhase_overallProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coordinatorInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_didUpdateProgress:forPhase:overallProgress:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 48), *(double *)(a1 + 64), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__IXServerConnection__client_promiseDidCompleteSuccessfullyWithUUID___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__IXServerConnection__client_promiseDidCompleteSuccessfullyWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "promiseInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_didComplete", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  -[IXServerConnection internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__IXServerConnection__client_promiseWithUUID_didCancelWithReason_client___block_invoke;
  v13[3] = &unk_1E4DC5448;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __73__IXServerConnection__client_promiseWithUUID_didCancelWithReason_client___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "promiseInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_clientDelegate_didCancelWithError:client:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)coordinatorInstances
{
  return self->_coordinatorInstances;
}

- (NSMutableDictionary)promiseInstances
{
  return self->_promiseInstances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseInstances, 0);
  objc_storeStrong((id *)&self->_coordinatorInstances, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)_onQueue_doCleanupForCoordinatorWithUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: No entry existed for coordinator with UUID %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_onQueue_doCleanupForPromiseWithUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: No entry existed for promise with UUID %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Unable to get remote object proxy for installcoordinationd connection : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_onQueue_synchronousRemoteObjectProxyWithErrorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Unable to get synchronous remote object proxy for installcoordinationd connection : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

@end
