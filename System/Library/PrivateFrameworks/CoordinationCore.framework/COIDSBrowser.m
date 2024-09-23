@implementation COIDSBrowser

- (COIDSBrowser)initWithMeshName:(id)a3 idsServiceName:(id)a4
{
  id v6;
  id v7;
  COIDSBrowser *v8;
  uint64_t v9;
  NSString *meshName;
  COBrowserObserverSet *v11;
  COBrowserObserverSet *observerSet;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  uint64_t v18;
  uint64_t v19;
  id idsPresenceProvider;
  uint64_t v21;
  id idsServiceProvider;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)COIDSBrowser;
  v8 = -[COIDSBrowser init](&v31, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    meshName = v8->_meshName;
    v8->_meshName = (NSString *)v9;

    v11 = objc_alloc_init(COBrowserObserverSet);
    observerSet = v8->_observerSet;
    v8->_observerSet = v11;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.coordination.idsbrowser.%p"), v8);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v16;

    objc_initWeak(&location, v8);
    v18 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke;
    v27[3] = &unk_24D4B47B0;
    objc_copyWeak(&v29, &location);
    v28 = v6;
    v19 = MEMORY[0x2199F3D40](v27);
    idsPresenceProvider = v8->_idsPresenceProvider;
    v8->_idsPresenceProvider = (id)v19;

    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke_2;
    v24[3] = &unk_24D4B47D8;
    objc_copyWeak(&v26, &location);
    v25 = v7;
    v21 = MEMORY[0x2199F3D40](v24);
    idsServiceProvider = v8->_idsServiceProvider;
    v8->_idsServiceProvider = (id)v21;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[COIDSPresence presenceForMesh:](COIDSPresence, "presenceForMesh:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __48__COIDSBrowser_initWithMeshName_idsServiceName___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSBrowser meshName](self, "meshName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, mesh = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)addObserverUsingBlock:(id)a3
{
  id v4;
  COBrowserObserver *v5;
  void *v6;

  v4 = a3;
  v5 = -[COBrowserObserver initWithBlock:]([COBrowserObserver alloc], "initWithBlock:", v4);

  -[COIDSBrowser observerSet](self, "observerSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", v5);

  return v5;
}

- (id)registeredObservers
{
  void *v2;
  void *v3;

  -[COIDSBrowser observerSet](self, "observerSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[COIDSBrowser observerSet](self, "observerSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__COIDSBrowser_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D4B1428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __43__COIDSBrowser_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(void);
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  COIDSServiceDirector *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    *(_BYTE *)(v2 + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "idsPresenceProvider");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPresence:", v4);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:queue:", v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "idsServiceProvider");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [COIDSServiceDirector alloc];
    objc_msgSend(*(id *)(a1 + 32), "meshName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[COIDSServiceDirector initWithIDSService:meshName:](v9, "initWithIDSService:meshName:", v8, v10);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 64);
    *(_QWORD *)(v12 + 64) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDiscoveryDelegate:");
    objc_msgSend(*(id *)(a1 + 32), "serviceDirector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");

    COCoreLogForCategory(14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ IDS browser started", (uint8_t *)&v17, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)stop
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__COIDSBrowser_stop__block_invoke;
  block[3] = &unk_24D4B0C80;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __20__COIDSBrowser_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(14);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ IDS browser stopping", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 32), "presence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setPresence:", 0);
}

- (void)didAddDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  COIDSBrowser *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p IDS browser found device %{public}@", (uint8_t *)&v8, 0x16u);
  }

  -[COIDSBrowser serviceDirector](self, "serviceDirector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceDirector:", v6);

  -[COIDSBrowser observerSet](self, "observerSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "informObserverAboutDevice:added:", v4, 1);

}

- (void)didRemoveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  COIDSBrowser *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p IDS browser lost device %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[COIDSBrowser observerSet](self, "observerSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "informObserverAboutDevice:added:", v4, 0);

}

- (void)onDemandDiscoveryForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  COIDSDiscoveryRecord *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  COIDSBrowser *v12;
  __int16 v13;
  COIDSDiscoveryRecord *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromURIToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COIDSDiscoveryRecord initWithIdsIdentifier:deviceTokenURI:]([COIDSDiscoveryRecord alloc], "initWithIdsIdentifier:deviceTokenURI:", v5, v6);
  -[COIDSDiscoveryRecord setOnDemandRequest:](v7, "setOnDemandRequest:", v4);

  -[COIDSBrowser serviceDirector](self, "serviceDirector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSDiscoveryRecord setServiceDirector:](v7, "setServiceDirector:", v8);

  COCoreLogForCategory(14);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p IDS browser got demand node request %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[COIDSBrowser observerSet](self, "observerSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "informObserverAboutDevice:added:", v7, 1);

}

- (COBrowserObserverSet)observerSet
{
  return self->_observerSet;
}

- (NSString)meshName
{
  return self->_meshName;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSObject)idsRegistryObserver
{
  return self->_idsRegistryObserver;
}

- (void)setIdsRegistryObserver:(id)a3
{
  objc_storeStrong((id *)&self->_idsRegistryObserver, a3);
}

- (id)idsPresenceProvider
{
  return self->_idsPresenceProvider;
}

- (void)setIdsPresenceProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (COIDSPresence)presence
{
  return self->_presence;
}

- (void)setPresence:(id)a3
{
  objc_storeStrong((id *)&self->_presence, a3);
}

- (COIDSServiceDirector)serviceDirector
{
  return self->_serviceDirector;
}

- (void)setServiceDirector:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDirector, a3);
}

- (id)idsServiceProvider
{
  return self->_idsServiceProvider;
}

- (void)setIdsServiceProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idsServiceProvider, 0);
  objc_storeStrong((id *)&self->_serviceDirector, 0);
  objc_storeStrong((id *)&self->_presence, 0);
  objc_storeStrong(&self->_idsPresenceProvider, 0);
  objc_storeStrong((id *)&self->_idsRegistryObserver, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
}

@end
