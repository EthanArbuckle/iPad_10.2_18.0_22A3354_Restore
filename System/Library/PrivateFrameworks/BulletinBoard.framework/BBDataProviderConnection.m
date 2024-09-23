@implementation BBDataProviderConnection

- (BBDataProviderConnection)initWithServiceName:(id)a3 onQueue:(id)a4
{
  id v7;
  id v8;
  BBDataProviderConnection *v9;
  BBDataProviderConnection *v10;
  OS_dispatch_queue *v11;
  NSObject *clientCalloutQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *connectionQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  BBDataProviderConnectionResolver *connectionResolver;
  NSMutableDictionary *v22;
  NSMutableDictionary *dataProvidersBySectionID;
  NSMutableDictionary *v24;
  NSMutableDictionary *parentFactoriesBySectionID;
  void *v27;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProviderConnection.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

  }
  v9 = -[BBDataProviderConnection init](self, "init");
  v10 = v9;
  if (v9)
  {
    -[BBDataProviderConnection setServiceName:](v9, "setServiceName:", v7);
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      clientCalloutQueue = v10->_clientCalloutQueue;
      v10->_clientCalloutQueue = v11;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      clientCalloutQueue = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("BBRemoteDataProvider.clientQueue", clientCalloutQueue);
      v14 = v10->_clientCalloutQueue;
      v10->_clientCalloutQueue = (OS_dispatch_queue *)v13;

    }
    v15 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderConnection.connectionQueue", 0);
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)v15;

    dispatch_suspend((dispatch_object_t)v10->_connectionQueue);
    v10->_connected = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderConnection.queue", v17);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v18;

    dispatch_set_target_queue((dispatch_object_t)v10->_connectionQueue, (dispatch_queue_t)v10->_queue);
    +[BBDataProviderConnectionResolver resolverForConnection:](BBDataProviderConnectionResolver, "resolverForConnection:", v10);
    v20 = objc_claimAutoreleasedReturnValue();
    connectionResolver = v10->_connectionResolver;
    v10->_connectionResolver = (BBDataProviderConnectionResolver *)v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProvidersBySectionID = v10->_dataProvidersBySectionID;
    v10->_dataProvidersBySectionID = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parentFactoriesBySectionID = v10->_parentFactoriesBySectionID;
    v10->_parentFactoriesBySectionID = v24;

  }
  return v10;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BBDataProviderConnection_dealloc__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)BBDataProviderConnection;
  -[BBDataProviderConnection dealloc](&v4, sel_dealloc);
}

uint64_t __35__BBDataProviderConnection_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)setServerProxy:(id)a3
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
  v7[2] = __43__BBDataProviderConnection_setServerProxy___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __43__BBDataProviderConnection_setServerProxy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setServerProxy:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_setServerProxy:(id)a3
{
  BBDataProviderConnectionServerProxy *v5;
  BBDataProviderConnectionServerProxy *serverProxy;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *queue;
  id v26;
  BOOL v27;
  BBDataProviderConnectionServerProxy *v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  BOOL v33;
  _QWORD v34[5];
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id from;
  id location;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = (BBDataProviderConnectionServerProxy *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  serverProxy = self->_serverProxy;
  if (serverProxy != v5)
  {
    v28 = v5;
    v27 = serverProxy != 0;
    objc_storeStrong((id *)&self->_serverProxy, a3);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v7 = self->_dataProvidersBySectionID;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary objectForKey:](self->_dataProvidersBySectionID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setServerProxy:", 0);

        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v8);
    }

    if (v28)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[NSMutableDictionary allValues](self->_parentFactoriesBySectionID, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v46 != v14)
              objc_enumerationMutation(v12);
            -[BBDataProviderConnectionServerProxy addParentSectionFactory:](self->_serverProxy, "addParentSectionFactory:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v13);
      }

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_serverProxy);
      v16 = dispatch_group_create();
      v17 = (void *)-[NSMutableDictionary copy](self->_dataProvidersBySectionID, "copy");
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v40;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v40 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
            dispatch_group_enter(v16);
            objc_msgSend(v18, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = MEMORY[0x24BDAC760];
            v34[1] = 3221225472;
            v34[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke;
            v34[3] = &unk_24C562EA0;
            objc_copyWeak(&v37, &location);
            objc_copyWeak(&v38, &from);
            v34[4] = v22;
            v24 = v23;
            v35 = v24;
            v36 = v16;
            objc_msgSend(v24, "updateIdentity:", v34);

            objc_destroyWeak(&v38);
            objc_destroyWeak(&v37);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        }
        while (v19);
      }

      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_3;
      block[3] = &unk_24C562EC8;
      objc_copyWeak(&v31, &location);
      objc_copyWeak(&v32, &from);
      v33 = v27;
      v30 = v18;
      v26 = v18;
      dispatch_group_notify(v16, queue, block);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      v5 = v28;
    }
    else
    {
      v5 = 0;
      if (serverProxy)
        dispatch_suspend((dispatch_object_t)self->_connectionQueue);
    }
  }

}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = v5;
  if (WeakRetained && v5 && (id)WeakRetained[4] == v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_2;
    v9[3] = &unk_24C562E78;
    v10 = v7;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "addDataProviderWithSectionID:clientProxy:identity:completion:", v8, v10, v3, v9);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setServerProxy:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_3(uint64_t a1)
{
  dispatch_object_t *WeakRetained;
  dispatch_object_t v3;
  dispatch_object_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  dispatch_object_t v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (dispatch_object_t)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (WeakRetained && v3 && WeakRetained[4] == v3)
  {
    if (!*(_BYTE *)(a1 + 56))
      dispatch_resume(WeakRetained[5]);
    *((_BYTE *)WeakRetained + 48) = 1;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *(id *)(a1 + 32);
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
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dataProviderDidLoad");

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = WeakRetained[4];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_4;
    v12[3] = &unk_24C562E28;
    v12[4] = WeakRetained;
    -[NSObject clientIsReady:](v11, "clientIsReady:", v12);
  }

}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ CONNECTED", (uint8_t *)&v7, 0x16u);

  }
}

- (void)addDataProvider:(id)a3 withCompletion:(id)a4
{
  id v4;

  v4 = -[BBDataProviderConnection _addDataProvider:withCompletionHandler:](self, "_addDataProvider:withCompletionHandler:", a3, a4);
}

- (id)addDataProvider:(id)a3
{
  return -[BBDataProviderConnection addDataProvider:withCompletionHandler:](self, "addDataProvider:withCompletionHandler:", a3, 0);
}

- (id)addDataProvider:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__BBDataProviderConnection_addDataProvider_withCompletionHandler___block_invoke;
  v10[3] = &unk_24C562EF0;
  v11 = v6;
  v7 = v6;
  -[BBDataProviderConnection _addDataProvider:withCompletionHandler:](self, "_addDataProvider:withCompletionHandler:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __66__BBDataProviderConnection_addDataProvider_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_addDataProvider:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  BBDataProviderConnection *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke;
  v13[3] = &unk_24C562F90;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BBDataProviderProxy *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  id v16;
  id v17;
  id from;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKey:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v6 = -[BBDataProviderProxy initWithDataProvider:clientReplyQueue:]([BBDataProviderProxy alloc], "initWithDataProvider:clientReplyQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v2);
  }
  objc_initWeak(&location, *(id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_initWeak(&from, *(id *)(*(_QWORD *)(a1 + 40) + 32));
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_24C562F68;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v10 = v2;
  v14 = v10;
  v12 = *(_OWORD *)(a1 + 48);
  v11 = (id)v12;
  v15 = v12;
  objc_msgSend(v9, "updateIdentity:", v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_3;
    block[3] = &unk_24C562F40;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = v5;
    v11 = v6;
    v9 = v3;
    v10 = *(id *)(a1 + 40);
    dispatch_async(WeakRetained, block);

    objc_destroyWeak(&v12);
  }

}

void __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_4;
  v8[3] = &unk_24C562F18;
  v10 = v3;
  v9 = v4;
  objc_msgSend(WeakRetained, "addDataProviderWithSectionID:clientProxy:identity:completion:", v7, v5, v6, v8);

}

uint64_t __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setServerProxy:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "dataProviderDidLoad");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5
{
  -[BBDataProviderConnection addParentSectionInfo:displayName:icon:universalSectionID:](self, "addParentSectionInfo:displayName:icon:universalSectionID:", a3, a4, a5, 0);
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 unversalSectionID:(id)a6
{
  -[BBDataProviderConnection addParentSectionInfo:displayName:icon:universalSectionID:](self, "addParentSectionInfo:displayName:icon:universalSectionID:", a3, a4, a5, 0);
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 universalSectionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *connectionQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BBDataProviderConnection *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__BBDataProviderConnection_addParentSectionInfo_displayName_icon_universalSectionID___block_invoke;
  block[3] = &unk_24C562FB8;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = self;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(connectionQueue, block);

}

void __85__BBDataProviderConnection_addParentSectionInfo_displayName_icon_universalSectionID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v5, "setDisplayName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setIcon:", *(_QWORD *)(a1 + 48));
  +[BBParentSectionDataProviderFactory factoryFromSectionInfo:](BBParentSectionDataProviderFactory, "factoryFromSectionInfo:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUniversalSectionIdentifier:", *(_QWORD *)(a1 + 56));
  v3 = *(void **)(*(_QWORD *)(a1 + 64) + 64);
  objc_msgSend(v2, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 32), "addParentSectionFactory:", v2);
}

- (void)removeDataProviderWithSectionID:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__BBDataProviderConnection_removeDataProviderWithSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

void __60__BBDataProviderConnection_removeDataProviderWithSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setServerProxy:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeDataProviderWithSectionID:", *(_QWORD *)(a1 + 40));

}

- (void)_invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  BBDataProviderConnectionServerProxy *serverProxy;
  NSObject *v11;
  NSString *serviceName;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  NSString *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_dataProvidersBySectionID, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataProvidersBySectionID, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setServerProxy:", 0);
        -[BBDataProviderConnectionServerProxy removeDataProviderWithSectionID:](self->_serverProxy, "removeDataProviderWithSectionID:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_dataProvidersBySectionID, "removeAllObjects");
  serverProxy = self->_serverProxy;
  self->_serverProxy = 0;

  -[BBDataProviderConnectionResolver invalidate](self->_connectionResolver, "invalidate");
  self->_connected = 0;
  v11 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543362;
    v18 = serviceName;
    _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ has been invalidated", buf, 0xCu);
  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BBDataProviderConnection_invalidate__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__BBDataProviderConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)ping:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_parentFactoriesBySectionID, 0);
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_connectionResolver, 0);
}

@end
