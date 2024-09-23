@implementation NTKBundleComplicationMigrationServiceClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_87);
  return (id)sharedInstance__instance;
}

void __61__NTKBundleComplicationMigrationServiceClient_sharedInstance__block_invoke()
{
  NTKBundleComplicationMigrationServiceClient *v0;
  void *v1;

  v0 = objc_alloc_init(NTKBundleComplicationMigrationServiceClient);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (NTKBundleComplicationMigrationServiceClient)init
{
  NTKBundleComplicationMigrationServiceClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *requestToCompletion;
  uint64_t v8;
  NSMutableDictionary *cachedResults;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKBundleComplicationMigrationServiceClient;
  v2 = -[NTKBundleComplicationMigrationServiceClient init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.nanotimekit.NTKBundleComplicationMigrationServiceClient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    requestToCompletion = v2->_requestToCompletion;
    v2->_requestToCompletion = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    cachedResults = v2->_cachedResults;
    v2->_cachedResults = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (void)serviceRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NTKBundleComplicationMigrationServiceClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NTKBundleComplicationMigrationServiceClient_serviceRequest_completion___block_invoke;
  block[3] = &unk_1E6BCD820;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __73__NTKBundleComplicationMigrationServiceClient_serviceRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Received request %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = _Block_copy(*(const void **)(a1 + 48));
      objc_msgSend(v6, "addObject:", v7);

    }
    else
    {
      v6 = (void *)objc_opt_new();
      v8 = _Block_copy(*(const void **)(a1 + 48));
      objc_msgSend(v6, "addObject:", v8);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queue_serviceRequest:retryBudget:", *(_QWORD *)(a1 + 32), 3);
    }

  }
}

- (void)generateTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Requesting type lookup...", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__NTKBundleComplicationMigrationServiceClient_generateTypeLookupForDevice_completion___block_invoke;
  block[3] = &unk_1E6BCD820;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __86__NTKBundleComplicationMigrationServiceClient_generateTypeLookupForDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadTypeLookupForDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setupConnectionIfNeeded
{
  void (**connectionProvider)(void);
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    connectionProvider = (void (**)(void))self->_connectionProvider;
    if (connectionProvider)
    {
      connectionProvider[2]();
      v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.BundleComplicationMigrationService"));
    }
    connection = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E72D58);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = self->_connection;
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke;
    v12[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
    v9 = self->_connection;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12;
    v10[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2;
    block[3] = &unk_1E6BCD5F0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

}

uint64_t __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetConnection:", 0);
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2_13;
    block[3] = &unk_1E6BCD5F0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

}

uint64_t __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetConnection:", 0);
}

- (void)_queue_resetConnection:(BOOL)a3
{
  _BOOL4 v3;
  NSXPCConnection *connection;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)_queue_serviceRequest:(id)a3 retryBudget:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSXPCConnection *connection;
  id v12;
  void *v13;
  id v14;
  dispatch_time_t v15;
  NSObject *queue;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  id v28[2];
  _QWORD aBlock[5];
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  -[NTKBundleComplicationMigrationServiceClient _queue_incrementTransactionCount](self, "_queue_incrementTransactionCount");
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke;
  aBlock[3] = &unk_1E6BD3E90;
  aBlock[4] = self;
  v31 = v32;
  v8 = v6;
  v30 = v8;
  v9 = _Block_copy(aBlock);
  if (a4)
  {
    -[NTKBundleComplicationMigrationServiceClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v8;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Servicing request %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    connection = self->_connection;
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_21;
    v25[3] = &unk_1E6BD3EE0;
    objc_copyWeak(v28, (id *)buf);
    v27 = v32;
    v12 = v8;
    v26 = v12;
    v28[1] = (id)a4;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_2;
    v22[3] = &unk_1E6BD3F08;
    objc_copyWeak(&v24, (id *)buf);
    v14 = v9;
    v23 = v14;
    objc_msgSend(v13, "processRequest:completion:", v12, v22);

    v15 = dispatch_time(0, 300000000000);
    queue = self->_queue;
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_4;
    v20[3] = &unk_1E6BCDF60;
    v21 = v14;
    dispatch_after(v15, queue, v20);

    objc_destroyWeak(&v24);
    objc_destroyWeak(v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("Request exceeded maximum retry count");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.bundleComplicationMigrationProvider"), 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void *, _QWORD, void *))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(v32, 8);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
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
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 48));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_queue_decrementTransactionCount");
  }

}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_21_cold_1((uint64_t)v3, v4);

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_22;
    block[3] = &unk_1E6BD3EB8;
    block[4] = WeakRetained;
    v9 = *(_OWORD *)(a1 + 32);
    v8 = (id)v9;
    v11 = v9;
    v12 = *(_QWORD *)(a1 + 56);
    dispatch_async(v7, block);

  }
}

uint64_t __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_22(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequest:retryBudget:", *(_QWORD *)(a1 + 40), v1 - 1);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_3;
    block[3] = &unk_1E6BD00D8;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Request timed out");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.bundleComplicationMigrationProvider"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_queue_loadTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSXPCConnection *connection;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[3];
  char v25;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NTKBundleComplicationMigrationServiceClient _setupConnectionIfNeeded](self, "_setupConnectionIfNeeded");
  -[NTKBundleComplicationMigrationServiceClient _queue_incrementTransactionCount](self, "_queue_incrementTransactionCount");
  objc_initWeak(&location, self);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke;
  aBlock[3] = &unk_1E6BCFEA8;
  v22 = v24;
  objc_copyWeak(&v23, &location);
  v9 = v7;
  v21 = v9;
  v10 = _Block_copy(aBlock);
  connection = self->_connection;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_3;
  v18[3] = &unk_1E6BD3F30;
  v12 = v10;
  v19 = v12;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4;
  v16[3] = &unk_1E6BD3F30;
  v15 = v12;
  v17 = v15;
  objc_msgSend(v13, "generateComplicationTypeLookupForDevice:completion:", v14, v16);

  objc_destroyWeak(&v23);
  _Block_object_dispose(v24, 8);
  objc_destroyWeak(&location);

}

void __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD block[5];

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    *(_BYTE *)(v4 + 24) = 1;
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = WeakRetained[6];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_2;
      block[3] = &unk_1E6BCD5F0;
      block[4] = v6;
      dispatch_async(v7, block);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_decrementTransactionCount");
}

uint64_t __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);

  v3 = a2;
  if (v3)
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4_cold_1((uint64_t)v3, v4);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

- (void)_queue_updateInvalidationTimer
{
  NSObject *v3;
  void *v4;
  NSTimer *v5;
  void *v6;
  NSTimer *invalidationTimer;
  _QWORD v8[4];
  id v9;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NTKBundleComplicationMigrationServiceClient _queue_clearInvalidationTimer](self, "_queue_clearInvalidationTimer");
  if (!self->_transactionCount)
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Beginning invalidation timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v4 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke;
    v8[3] = &unk_1E6BCDE70;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v4, "timerWithTimeInterval:repeats:block:", 0, v8, 30.0);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    -[NSTimer setTolerance:](v5, "setTolerance:", 3.0);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTimer:forMode:", v5, *MEMORY[0x1E0C99860]);

    invalidationTimer = self->_invalidationTimer;
    self->_invalidationTimer = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = 30;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Connection has been inactive for %lus, closing connection", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    v6 = v4[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke_27;
    block[3] = &unk_1E6BCD5F0;
    block[4] = v4;
    dispatch_async(v6, block);
  }

}

uint64_t __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetConnection:", 1);
}

- (void)_queue_clearInvalidationTimer
{
  NSObject *v3;
  NSTimer *invalidationTimer;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidationTimer)
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Cancelled invalidation timer", v5, 2u);
    }

    -[NSTimer invalidate](self->_invalidationTimer, "invalidate");
    invalidationTimer = self->_invalidationTimer;
    self->_invalidationTimer = 0;

  }
}

- (void)_queue_incrementTransactionCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_transactionCount;
  -[NTKBundleComplicationMigrationServiceClient _queue_clearInvalidationTimer](self, "_queue_clearInvalidationTimer");
}

- (void)_queue_decrementTransactionCount
{
  unint64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_transactionCount - 1;
  self->_transactionCount = v3;
  if (!v3)
    -[NTKBundleComplicationMigrationServiceClient _queue_updateInvalidationTimer](self, "_queue_updateInvalidationTimer");
}

- (id)connectionProvider
{
  return self->_connectionProvider;
}

- (void)setConnectionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_requestToCompletion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "NTKBundleComplicationMigrationServiceClient: Interrupted", a5, a6, a7, a8, 0);
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "NTKBundleComplicationMigrationServiceClient: Invalidated", a5, a6, a7, a8, 0);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_21_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "NTKBundleComplicationMigrationServiceClient: Remote object proxy error %@", (uint8_t *)&v2, 0xCu);
}

void __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_FAULT, "Request to generate type lookup failed: %@", (uint8_t *)&v2, 0xCu);
}

@end
