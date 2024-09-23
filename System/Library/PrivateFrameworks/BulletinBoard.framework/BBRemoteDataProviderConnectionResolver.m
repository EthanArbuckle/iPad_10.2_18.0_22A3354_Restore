@implementation BBRemoteDataProviderConnectionResolver

void __67__BBRemoteDataProviderConnectionResolver_dataProviderForSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataProviderForSectionID:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dataProviderForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__BBRemoteDataProviderConnectionResolver_dataProviderForSectionID___block_invoke;
  block[3] = &unk_24C563C98;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)resolverWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:", v3);

  return v4;
}

- (BBRemoteDataProviderConnectionResolver)initWithDelegate:(id)a3
{
  id v5;
  BBRemoteDataProviderConnectionResolver *v6;
  BBRemoteDataProviderConnectionResolver *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *dataProviderConnectionsByService;
  NSMutableDictionary *v10;
  NSMutableDictionary *dataProviderConnectionsBySectionID;
  NSMutableDictionary *v12;
  NSMutableDictionary *dataProviderConnectionsByUniversalSectionID;
  NSMutableDictionary *v14;
  NSMutableDictionary *xpcConnectionsByService;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  dispatch_queue_t v19;
  OS_dispatch_queue *registerQueue;
  uint64_t v21;
  NSXPCListener *listener;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BBRemoteDataProviderConnectionResolver;
  v6 = -[BBRemoteDataProviderConnectionResolver init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProviderConnectionsByService = v7->_dataProviderConnectionsByService;
    v7->_dataProviderConnectionsByService = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProviderConnectionsBySectionID = v7->_dataProviderConnectionsBySectionID;
    v7->_dataProviderConnectionsBySectionID = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProviderConnectionsByUniversalSectionID = v7->_dataProviderConnectionsByUniversalSectionID;
    v7->_dataProviderConnectionsByUniversalSectionID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    xpcConnectionsByService = v7->_xpcConnectionsByService;
    v7->_xpcConnectionsByService = v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProviderConnectionResolver", v16);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProviderConnectionResolver.registerQueue", 0);
    registerQueue = v7->_registerQueue;
    v7->_registerQueue = (OS_dispatch_queue *)v19;

    dispatch_set_target_queue((dispatch_object_t)v7->_registerQueue, (dispatch_queue_t)v7->_queue);
    dispatch_suspend((dispatch_object_t)v7->_registerQueue);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletinboard.dataproviderconnection"));
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v21;

    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_listener, "resume");
    -[BBRemoteDataProviderConnectionResolver _registerForPublicationNotification](v7, "_registerForPublicationNotification");
  }

  return v7;
}

- (void)_registerForPublicationNotification
{
  NSObject *queue;
  _QWORD handler[5];

  queue = self->_queue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __77__BBRemoteDataProviderConnectionResolver__registerForPublicationNotification__block_invoke;
  handler[3] = &unk_24C563BB0;
  handler[4] = self;
  notify_register_dispatch(BBServerListeningForConnectionsKey, &self->_listeningToken, queue, handler);
}

void __77__BBRemoteDataProviderConnectionResolver__registerForPublicationNotification__block_invoke(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 1)
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  notify_cancel(self->_listeningToken);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_xpcConnectionsByService;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_xpcConnectionsByService, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v9.receiver = self;
  v9.super_class = (Class)BBRemoteDataProviderConnectionResolver;
  -[BBRemoteDataProviderConnectionResolver dealloc](&v9, sel_dealloc);
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  unint64_t v18;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C5686F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("    "));
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%@: %p>"), v5, v9, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BBRemoteDataProviderConnectionResolver_debugDescriptionWithChildren___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v12 = v10;
  v17 = v12;
  v18 = a3;
  dispatch_sync(queue, block);
  v13 = v17;
  v14 = v12;

  return v14;
}

void __71__BBRemoteDataProviderConnectionResolver_debugDescriptionWithChildren___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1[4] + 32), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1[4] + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)a1[5];
          objc_msgSend(v7, "debugDescriptionWithChildren:", a1[6] + 2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendFormat:", CFSTR("\n%@"), v9);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
}

- (NSString)debugDescription
{
  return (NSString *)-[BBRemoteDataProviderConnectionResolver debugDescriptionWithChildren:](self, "debugDescriptionWithChildren:", 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  NSObject *queue;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  BBRemoteDataProviderConnectionResolver *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = a4;
  v8 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received connection request from %{public}@", buf, 0x16u);

  }
  if (self->_listener == v6)
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.bulletinboard.dataprovider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      queue = self->_queue;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __77__BBRemoteDataProviderConnectionResolver_listener_shouldAcceptNewConnection___block_invoke;
      v21[3] = &unk_24C562E50;
      v22 = v7;
      v23 = self;
      dispatch_async(queue, v21);

      v12 = 1;
      goto LABEL_9;
    }
    v16 = (void *)BBLogConnection;
    v12 = 0;
    if (!os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v17 = v16;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling incoming data provider connection because it lacks proper entitlement: %{public}@", buf, 0x16u);

  }
  v12 = 0;
LABEL_9:

  return v12;
}

uint64_t __77__BBRemoteDataProviderConnectionResolver_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  BBDataProviderConnectionCheckinServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

- (void)registerServiceName:(id)a3 appBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[BBRemoteDataProviderConnectionResolver _registerServiceName:appBundleID:completion:](self, "_registerServiceName:appBundleID:completion:", v8, v9, v10);
  }
  else
  {
    v11 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to register for app bundle identifier %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)_registerServiceName:(id)a3 appBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *registerQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  registerQueue = self->_registerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke;
  block[3] = &unk_24C563608;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  v16 = v8;
  dispatch_async(registerQueue, block);

}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke(uint64_t a1)
{
  BBRemoteDataProviderConnection *v2;
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id from;
  id location;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (BBRemoteDataProviderConnection *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)BBLogConnection;
  v4 = os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = v3;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v7;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received checkin from %{public}@ [KNOWN]", buf, 0x16u);

    }
  }
  else
  {
    if (v4)
    {
      v9 = v3;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received checkin from %{public}@ [NEW]", buf, 0x16u);

    }
    v2 = -[BBRemoteDataProviderConnection initWithServiceName:bundleID:delegate:]([BBRemoteDataProviderConnection alloc], "initWithServiceName:bundleID:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 56));
  objc_initWeak(&from, v2);
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_17;
  v19[3] = &unk_24C563C20;
  v20 = *(id *)(a1 + 40);
  objc_copyWeak(&v21, (id *)buf);
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v14 = (void *)MEMORY[0x212B949C0](v19);
  objc_msgSend(*(id *)(a1 + 56), "setInvalidationHandler:", v14);
  objc_msgSend(*(id *)(a1 + 56), "setInterruptionHandler:", v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_2;
  v16[3] = &unk_24C563C48;
  v17 = *(id *)(a1 + 64);
  objc_copyWeak(&v18, &from);
  -[BBRemoteDataProviderConnection setConnected:completion:](v2, "setConnected:completion:", 1, v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_17(id *a1)
{
  NSObject *v2;
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "Remote data provider XPC connection for service '%{public}@' has been interrupted or invalidated", buf, 0xCu);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_18;
    v7[3] = &unk_24C563BF8;
    objc_copyWeak(&v9, a1 + 6);
    v7[4] = v5;
    v8 = a1[4];
    objc_copyWeak(&v10, a1 + 7);
    dispatch_async(v6, v7);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&v9);
  }

}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v5 == v3)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v4, "setConnected:completion:", 0, 0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      WeakRetained = v5;
    }
  }

}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

+ (id)xpcInterface
{
  if (xpcInterface_onceToken != -1)
    dispatch_once(&xpcInterface_onceToken, &__block_literal_global_6);
  return (id)xpcInterface___interface;
}

void __54__BBRemoteDataProviderConnectionResolver_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A1A78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface___interface;
  xpcInterface___interface = v0;

}

- (void)remoteDataProviderNeedsToWakeClient:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataProviderConnectionsBySectionID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v5, "serviceName");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBRemoteDataProviderConnectionResolver wakeService:bundleID:](self, "wakeService:bundleID:", v13, v14);

LABEL_13:
    goto LABEL_14;
  }
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v10 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v10;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_20CCB9000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ unable to wake client with no serviceName for sectionID %{public}@", (uint8_t *)&v15, 0x16u);

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)wakeService:(id)a3 bundleID:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *queue;
  id v32;
  void *v33;
  _QWORD block[4];
  id v35;
  BBRemoteDataProviderConnectionResolver *v36;
  uint64_t *v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  id obj;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProviderConnectionResolver.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

  }
  v9 = dispatch_group_create();
  v10 = v9;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5;
  v46 = __Block_byref_object_dispose__5;
  v47 = 0;
  if (v8)
  {
    dispatch_group_enter(v9);
    v11 = (void *)MEMORY[0x24BE80C78];
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v43;
    obj = 0;
    objc_msgSend(v11, "handleForPredicate:error:", v12, &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13 + 5, obj);

    if (v43[5])
    {
      v15 = (id)BBLogConnection;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v43[5];
        *(_DWORD *)buf = 138543874;
        v49 = v17;
        v50 = 2114;
        v51 = v8;
        v52 = 2114;
        v53 = v18;
        _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get process handle for %{public}@; %{public}@",
          buf,
          0x20u);

      }
      v19 = v43[5];
      v43[5] = 0;

      dispatch_group_leave(v10);
    }
    else
    {
      objc_msgSend(v14, "currentState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "process");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21 || objc_msgSend(v21, "pid") == -1)
      {
        v26 = (void *)MEMORY[0x24BDBCE70];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dictionaryWithObject:forKey:", v27, *MEMORY[0x24BE382B8]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke;
        v38[3] = &unk_24C563C70;
        v40 = &v42;
        v39 = v10;
        objc_msgSend(v30, "openApplication:withOptions:completion:", v8, v29, v38);

      }
      else
      {
        v22 = (id)BBLogConnection;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v21, "pid");
          *(_DWORD *)buf = 138543874;
          v49 = v24;
          v50 = 2114;
          v51 = v8;
          v52 = 1024;
          LODWORD(v53) = v25;
          _os_log_impl(&dword_20CCB9000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ will not launch %{public}@ because it is already running with a pid of %d", buf, 0x1Cu);

        }
        dispatch_group_leave(v10);
      }

    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_36;
  block[3] = &unk_24C5631B8;
  v36 = self;
  v37 = &v42;
  v35 = v7;
  v32 = v7;
  dispatch_group_notify(v10, queue, block);

  _Block_object_dispose(&v42, 8);
}

void __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_36(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = (void *)BBLogConnection;
    if (!os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      return;
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to wake %{public}@", buf, 0x16u);

  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend((id)objc_opt_class(), "xpcInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "resume");
    objc_msgSend(v7, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_2;
    v10[3] = &unk_24C562E28;
    v11 = v7;
    v3 = v7;
    objc_msgSend(v9, "ping:", v10);

  }
}

uint64_t __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)dataProvidersForUniversalSectionID:(id)a3
{
  id v4;
  id v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__BBRemoteDataProviderConnectionResolver_dataProvidersForUniversalSectionID___block_invoke;
  block[3] = &unk_24C563438;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync(queue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __77__BBRemoteDataProviderConnectionResolver_dataProvidersForUniversalSectionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "dataProvidersForUniversalSectionID:", *(_QWORD *)(a1 + 40));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "unionSet:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)removeDataProvider:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__BBRemoteDataProviderConnectionResolver_removeDataProvider___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__BBRemoteDataProviderConnectionResolver_removeDataProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeDataProvider:", *(_QWORD *)(a1 + 40));
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProviderConnectionResolver.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__BBRemoteDataProviderConnectionResolver_performBlockOnDataProviders___block_invoke;
  block[3] = &unk_24C563518;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

void __70__BBRemoteDataProviderConnectionResolver_performBlockOnDataProviders___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "performBlockOnDataProviders:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)dataProviderStore:(id)a3 didAddDataProvider:(id)a4 performMigration:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__BBRemoteDataProviderConnectionResolver_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke;
  block[3] = &unk_24C5636A8;
  block[4] = self;
  v18 = v11;
  v21 = a5;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(queue, block);

}

void __107__BBRemoteDataProviderConnectionResolver_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  objc_msgSend(*(id *)(a1 + 40), "universalSectionIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v6, v7);
    }
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "dataProviderStore:didAddDataProvider:performMigration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)dataProviderStore:(id)a3 didRemoveDataProvider:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__BBRemoteDataProviderConnectionResolver_dataProviderStore_didRemoveDataProvider___block_invoke;
  v8[3] = &unk_24C562E50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __82__BBRemoteDataProviderConnectionResolver_dataProviderStore_didRemoveDataProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_msgSend(*(id *)(a1 + 40), "universalSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);
    if (!objc_msgSend(v7, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", v6);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "dataProviderStore:didRemoveDataProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)dataProviderStore:(id)a3 didAddParentSectionFactory:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BBDataProviderStoreDelegate dataProviderStore:didAddParentSectionFactory:](self->_delegate, "dataProviderStore:didAddParentSectionFactory:", self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcConnectionsByService, 0);
  objc_storeStrong((id *)&self->_dataProviderConnectionsByUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_dataProviderConnectionsBySectionID, 0);
  objc_storeStrong((id *)&self->_dataProviderConnectionsByService, 0);
  objc_storeStrong((id *)&self->_registerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
