@implementation TKSmartCardSlotManager

+ (TKSmartCardSlotManager)defaultManager
{
  id v2;
  TKSmartCardSlotManager *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!defaultManager_manager)
  {
    v3 = objc_alloc_init(TKSmartCardSlotManager);
    v4 = (void *)defaultManager_manager;
    defaultManager_manager = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (TKSmartCardSlotManager *)(id)defaultManager_manager;
}

- (TKSmartCardSlotManager)init
{
  return -[TKSmartCardSlotManager initWithServer:](self, "initWithServer:", &__block_literal_global_2);
}

id __30__TKSmartCardSlotManager_init__block_invoke()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ctkd.slot-client"), 4096);
}

- (TKSmartCardSlotManager)initWithServer:(id)a3
{
  id v4;
  TKSmartCardSlotManager *v5;
  uint64_t v6;
  NSMutableDictionary *endpoints;
  dispatch_queue_t v8;
  OS_dispatch_queue *slotNamesQueue;
  uint64_t v10;
  id connectionToServer;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TKSmartCardSlotManager;
  v5 = -[TKSmartCardSlotManager init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    endpoints = v5->_endpoints;
    v5->_endpoints = (NSMutableDictionary *)v6;

    v8 = dispatch_queue_create(0, 0);
    slotNamesQueue = v5->_slotNamesQueue;
    v5->_slotNamesQueue = (OS_dispatch_queue *)v8;

    v10 = MEMORY[0x1BCCC4AEC](v4);
    connectionToServer = v5->_connectionToServer;
    v5->_connectionToServer = (id)v10;

    if (!-[TKSmartCardSlotManager setupConnection](v5, "setupConnection"))
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TKSmartCardSlotManager;
  -[TKSmartCardSlotManager dealloc](&v4, sel_dealloc);
}

- (BOOL)setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  id location;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  (*((void (**)(void))self->_connectionToServer + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF237BD8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF230808);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "resume");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke;
  v15[3] = &unk_1E7089238;
  v7 = v3;
  v16 = v7;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_14;
  v14[3] = &unk_1E7089260;
  v14[4] = &v17;
  objc_msgSend(v8, "reportChangesForSlotType:reply:", CFSTR("smartcard"), v14);

  objc_initWeak(&location, self);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_2;
  v11[3] = &unk_1E70892B0;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend(v7, "setInterruptionHandler:", v11);
  if (*((_BYTE *)v18 + 24))
  {
    objc_storeWeak((id *)&self->_connection, v7);
    v9 = *((_BYTE *)v18 + 24) != 0;
  }
  else
  {
    v9 = 0;
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TK_LOG_smartcard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __41__TKSmartCardSlotManager_setupConnection__block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __41__TKSmartCardSlotManager_setupConnection__block_invoke_14(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  const char *v11;
  int *v12;
  NSObject *v13;
  id *v14;
  uint64_t v15;
  uint32_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD handler[4];
  id *v27;
  uint64_t v28;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (id *)WeakRetained;
    objc_sync_enter(v4);
    NSStringFromSelector(sel_slotNames);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willChangeValueForKey:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(NSObject **)(v6 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_3;
    block[3] = &unk_1E70891E8;
    block[4] = v6;
    dispatch_sync(v8, block);
    NSStringFromSelector(sel_slotNames);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeValueForKey:", v9);

    v10 = objc_loadWeakRetained(v4 + 1);
    objc_msgSend(v10, "invalidate");

    objc_storeWeak(v4 + 1, 0);
    v11 = (const char *)objc_msgSend(CFSTR("com.apple.ctkd.slot-server-started"), "UTF8String");
    v12 = (int *)(*(_QWORD *)(a1 + 32) + 48);
    v13 = dispatch_queue_create("server-start-notify-q", 0);
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_4;
    handler[3] = &unk_1E7089288;
    v14 = v4;
    v15 = *(_QWORD *)(a1 + 32);
    v27 = v14;
    v28 = v15;
    v16 = notify_register_dispatch(v11, v12, v13, handler);

    if (v16)
    {
      TK_LOG_smartcard();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_2(v16, v17);

    }
    objc_sync_exit(v14);

  }
  TK_LOG_smartcard();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);

}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

uint64_t __41__TKSmartCardSlotManager_setupConnection__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setupConnection");
  return notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 48));
}

- (NSArray)slotNames
{
  TKSmartCardSlotManager *v2;
  id WeakRetained;
  NSObject *slotNamesQueue;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);

  if (!WeakRetained)
    -[TKSmartCardSlotManager setupConnection](v2, "setupConnection");
  objc_sync_exit(v2);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  slotNamesQueue = v2->_slotNamesQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__TKSmartCardSlotManager_slotNames__block_invoke;
  v7[3] = &unk_1E70892D8;
  v7[4] = v2;
  v7[5] = &v8;
  dispatch_sync(slotNamesQueue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __35__TKSmartCardSlotManager_slotNames__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v2 + 16), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++), (_QWORD)v13);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  TKSmartCardSlotManager *v15;
  void *v16;
  NSMutableDictionary *endpoints;
  NSObject *slotNamesQueue;
  void *v19;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  TK_LOG_smartcard();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardSlotManager setSlotWithName:endpoint:type:reply:].cold.1((uint64_t)v10);

  v15 = self;
  objc_sync_enter(v15);
  NSStringFromSelector(sel_slotNames);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSlotManager willChangeValueForKey:](v15, "willChangeValueForKey:", v16);

  endpoints = v15->_endpoints;
  if (v11)
    -[NSMutableDictionary setObject:forKey:](endpoints, "setObject:forKey:", v11, v10);
  else
    -[NSMutableDictionary removeObjectForKey:](endpoints, "removeObjectForKey:", v10);
  slotNamesQueue = v15->_slotNamesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__TKSmartCardSlotManager_setSlotWithName_endpoint_type_reply___block_invoke;
  block[3] = &unk_1E70891E8;
  block[4] = v15;
  dispatch_sync(slotNamesQueue, block);
  NSStringFromSelector(sel_slotNames);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSlotManager didChangeValueForKey:](v15, "didChangeValueForKey:", v19);

  objc_sync_exit(v15);
  v13[2](v13);

}

void __62__TKSmartCardSlotManager_setSlotWithName_endpoint_type_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)getSlotWithName:(NSString *)name reply:(void *)reply
{
  NSString *v6;
  void *v7;
  TKSmartCardSlotManager *v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  id v12;
  NSString *v13;
  _QWORD block[5];
  NSString *v15;
  id v16;

  v6 = name;
  v7 = reply;
  v8 = self;
  objc_sync_enter(v8);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_connection);

  if (!WeakRetained)
    -[TKSmartCardSlotManager setupConnection](v8, "setupConnection");
  objc_sync_exit(v8);

  v10 = objc_loadWeakRetained((id *)&v8->_connection);
  objc_msgSend(v10, "_queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke;
  block[3] = &unk_1E7089328;
  block[4] = v8;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

}

void __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke(uint64_t a1)
{
  void *v2;
  TKSmartCardSlot *v3;
  id v4;
  TKSmartCardSlot *v5;
  _QWORD v6[4];
  TKSmartCardSlot *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(TKSmartCardSlot);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke_2;
    v6[3] = &unk_1E7089300;
    v4 = *(id *)(a1 + 48);
    v7 = v3;
    v8 = v4;
    v5 = v3;
    -[TKSmartCardSlot connectToEndpoint:synchronous:reply:](v5, "connectToEndpoint:synchronous:reply:", v2, 0, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = 0;
  else
    v4 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (TKSmartCardSlot)slotNamed:(NSString *)name
{
  NSString *v4;
  TKSmartCardSlotManager *v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  NSString *v9;
  TKSmartCardSlot *v10;
  TKSmartCardSlot *v11;
  _QWORD block[5];
  NSString *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = name;
  v5 = self;
  objc_sync_enter(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_connection);

  if (!WeakRetained)
    -[TKSmartCardSlotManager setupConnection](v5, "setupConnection");
  objc_sync_exit(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v7 = objc_loadWeakRetained((id *)&v5->_connection);
  objc_msgSend(v7, "_queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__TKSmartCardSlotManager_slotNamed___block_invoke;
  block[3] = &unk_1E7089350;
  v15 = &v16;
  block[4] = v5;
  v9 = v4;
  v14 = v9;
  dispatch_sync(v8, block);

  if (v17[5])
  {
    v10 = [TKSmartCardSlot alloc];
    v11 = -[TKSmartCardSlot initWithEndpoint:error:](v10, "initWithEndpoint:error:", v17[5], 0);
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __36__TKSmartCardSlotManager_slotNamed___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionToServer, 0);
  objc_storeStrong((id *)&self->_slotNamesQueue, 0);
  objc_storeStrong((id *)&self->_slotNames, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_destroyWeak((id *)&self->_connection);
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138543618;
  v4 = v1;
  OUTLINED_FUNCTION_10_1();
  _os_log_error_impl(&dword_1B9768000, v2, OS_LOG_TYPE_ERROR, "ctk: connecting to slot registration server (%{public}@) failed, error %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B9768000, a1, a3, "connection to slot registration server was interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_2(int a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("com.apple.ctkd.slot-server-started");
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "registering notification '%@' failed with status %u", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)setSlotWithName:(uint64_t)a1 endpoint:type:reply:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v1, (uint64_t)v1, "got notification for new slot: name=%{public}@, ep=%{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

@end
