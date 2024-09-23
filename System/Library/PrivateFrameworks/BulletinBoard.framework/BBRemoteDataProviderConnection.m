@implementation BBRemoteDataProviderConnection

void __59__BBRemoteDataProviderConnection_dataProviderForSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__BBRemoteDataProviderConnection_dataProviderForSectionID___block_invoke;
  block[3] = &unk_24C5631B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BBRemoteDataProviderConnection)initWithServiceName:(id)a3 bundleID:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  BBRemoteDataProviderConnection *v12;
  BBRemoteDataProviderConnection *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v17;
  NSMutableDictionary *dataProvidersBySectionID;
  NSMutableDictionary *v19;
  NSMutableDictionary *dataProvidersByUniversalSectionID;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProviderConnection.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

  }
  v12 = -[BBRemoteDataProviderConnection init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a5);
    v13->_connected = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProviderConnection.queue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProvidersBySectionID = v13->_dataProvidersBySectionID;
    v13->_dataProvidersBySectionID = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataProvidersByUniversalSectionID = v13->_dataProvidersByUniversalSectionID;
    v13->_dataProvidersByUniversalSectionID = v19;

    -[BBRemoteDataProviderConnection setServiceName:](v13, "setServiceName:", v9);
    -[BBRemoteDataProviderConnection setBundleID:](v13, "setBundleID:", v10);
    v13->_clientReady = 0;
  }

  return v13;
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *queue;
  id v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v18;
  unint64_t v19;

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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%@: %p> (%@"), v5, v9, self, self->_serviceName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_bundleID)
    objc_msgSend(v10, "appendFormat:", CFSTR(", %@"), self->_bundleID);
  objc_msgSend(v10, "appendString:", CFSTR(")"));
  if (self->_connected)
    v11 = CFSTR(" [CONNECTED]");
  else
    v11 = CFSTR(" [DISCONNECTED]");
  objc_msgSend(v10, "appendString:", v11);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BBRemoteDataProviderConnection_debugDescriptionWithChildren___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v13 = v10;
  v18 = v13;
  v19 = a3;
  dispatch_sync(queue, block);
  v14 = v18;
  v15 = v13;

  return v15;
}

void __63__BBRemoteDataProviderConnection_debugDescriptionWithChildren___block_invoke(_QWORD *a1)
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
          objc_msgSend(v7, "debugDescriptionWithChildren:", a1[6] + 1);
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
  return (NSString *)-[BBRemoteDataProviderConnection debugDescriptionWithChildren:](self, "debugDescriptionWithChildren:", 0);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BBRemoteDataProviderConnection_setConnected_completion___block_invoke;
  block[3] = &unk_24C564768;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __58__BBRemoteDataProviderConnection_setConnected_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(v2 + 8) == v3)
    goto LABEL_19;
  *(_BYTE *)(v2 + 8) = v3;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = (void *)BBLogConnection;
  v6 = os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_19;
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ CONNECTED", buf, 0x16u);

  }
  else
  {
    if (v6)
    {
      v11 = v5;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ DISCONNECTED", buf, 0x16u);

    }
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v15 + 48))
    {
      v16 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 138543362;
        v30 = v17;
        _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending access queue", buf, 0xCu);
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      v15 = *(_QWORD *)(a1 + 32);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = *(id *)(v15 + 32);
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21), (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setClientProxy:completion:", 0, 0);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }
  }

LABEL_19:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_removeDataProvider:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setClientProxy:completion:", 0, 0);
    -[NSMutableDictionary removeObjectForKey:](self->_dataProvidersBySectionID, "removeObjectForKey:", v5);
    objc_msgSend(v4, "universalSectionIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](self->_dataProvidersByUniversalSectionID, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v4);
      if (!objc_msgSend(v7, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_dataProvidersByUniversalSectionID, "removeObjectForKey:", v6);

    }
    -[BBRemoteDataProviderStoreDelegate dataProviderStore:didRemoveDataProvider:](self->_delegate, "dataProviderStore:didRemoveDataProvider:", self, v4);
    goto LABEL_9;
  }
  v8 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v8;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Asked to remove a data provider (%@) without a sectionID. Ignoring.", (uint8_t *)&v11, 0x16u);

LABEL_9:
  }

}

- (void)addDataProviderWithSectionID:(id)a3 clientProxy:(id)a4 identity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSString *serviceName;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543618;
    v27 = serviceName;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_20CCB9000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating data provider proxy for section %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke;
  block[3] = &unk_24C563608;
  block[4] = self;
  v22 = v10;
  v23 = v12;
  v24 = v11;
  v25 = v13;
  v17 = v13;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  dispatch_async(queue, block);

}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BBRemoteDataProvider *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    objc_msgSend(*(id *)(v2 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
    v4 = (BBRemoteDataProvider *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;
    v6 = BBLogConnection;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
        __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_cold_1();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(*(_QWORD *)v3 + 56);
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v19 = v7;
        v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ adding new data provider proxy for section %{public}@", buf, 0x16u);
      }
      v4 = -[BBRemoteDataProvider initWithSectionID:delegate:]([BBRemoteDataProvider alloc], "initWithSectionID:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "universalSectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(*(id *)(*(_QWORD *)v3 + 40), "objectForKey:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend(v10, "addObject:", v4);
        objc_msgSend(*(id *)(*(_QWORD *)v3 + 40), "setObject:forKey:", v10, v9);

      }
    }
    -[BBDataProvider setIdentity:](v4, "setIdentity:", *(_QWORD *)(a1 + 48));
    objc_initWeak((id *)buf, v4);
    v11 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_27;
    v13[3] = &unk_24C564790;
    objc_copyWeak(&v16, (id *)buf);
    v17 = v5;
    v12 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v15 = *(id *)(a1 + 64);
    -[BBRemoteDataProvider setClientProxy:completion:](v4, "setClientProxy:completion:", v11, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 64))
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (!v4
    && (objc_msgSend(*(id *)(a1 + 32), "dataProviderForSectionID:", *(_QWORD *)(a1 + 40)),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == v3))
  {
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEBUG))
      __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_27_cold_1();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_28;
    v8[3] = &unk_24C563518;
    v9 = v3;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v7, "dataProviderStore:didAddDataProvider:performMigration:completion:", v6, v9, 0, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_28(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setServerIsReady:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)remoteDataProviderNeedsToWakeClient:(id)a3
{
  -[BBRemoteDataProviderStoreDelegate remoteDataProviderNeedsToWakeClient:](self->_delegate, "remoteDataProviderNeedsToWakeClient:", a3);
}

- (void)removeDataProviderWithSectionID:(id)a3
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
  v7[2] = __66__BBRemoteDataProviderConnection_removeDataProviderWithSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __66__BBRemoteDataProviderConnection_removeDataProviderWithSectionID___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_removeDataProvider:", v2);

}

- (void)addParentSectionFactory:(id)a3
{
  id v4;
  void *v5;
  NSString *serviceName;
  NSObject *v7;
  void *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    v7 = v5;
    objc_msgSend(v4, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = serviceName;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ adding parent section factory for section %{public}@", (uint8_t *)&v9, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BBRemoteDataProviderStoreDelegate dataProviderStore:didAddParentSectionFactory:](self->_delegate, "dataProviderStore:didAddParentSectionFactory:", self, v4);

}

- (void)clientIsReady:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSString *serviceName;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if (!self->_clientReady)
  {
    v5 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      v7 = 138543362;
      v8 = serviceName;
      _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ told client is ready", (uint8_t *)&v7, 0xCu);
    }
    self->_clientReady = 1;
  }
  v4[2](v4);

}

- (id)dataProvidersForUniversalSectionID:(id)a3
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__BBRemoteDataProviderConnection_dataProvidersForUniversalSectionID___block_invoke;
  block[3] = &unk_24C5631B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __69__BBRemoteDataProviderConnection_dataProvidersForUniversalSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeDataProvider:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProviderConnection.m"), 247, CFSTR("BBRemoteDataProviderConnection was asked to remove a data provider that isn't a BBRemoteDataProvider"));

  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__BBRemoteDataProviderConnection_removeDataProvider___block_invoke;
  v9[3] = &unk_24C562E50;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, v9);

}

uint64_t __53__BBRemoteDataProviderConnection_removeDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProvider:", *(_QWORD *)(a1 + 40));
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBRemoteDataProviderConnection.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBRemoteDataProviderConnection_performBlockOnDataProviders___block_invoke;
  block[3] = &unk_24C563518;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

void __62__BBRemoteDataProviderConnection_performBlockOnDataProviders___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v2;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dataProvidersByUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_0();
  v3 = v0;
  _os_log_error_impl(&dword_20CCB9000, v1, OS_LOG_TYPE_ERROR, "%{public}@ already have data provider for section %{public}@; using existing one",
    v2,
    0x16u);
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_27_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_0();
  v3 = v0;
  _os_log_debug_impl(&dword_20CCB9000, v1, OS_LOG_TYPE_DEBUG, "ADDING REMOTE %{public}@, %{public}@", v2, 0x16u);
}

@end
