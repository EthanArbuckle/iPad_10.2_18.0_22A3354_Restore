@implementation COTimerManager

- (COTimerManager)initWithConnectionProvider:(id)a3 distributedTimersClient:(id)a4
{
  id v7;
  id v8;
  COTimerManager *v9;
  COTimerManager *v10;
  __CFString *v11;
  id cluster;
  COObserverSet *v13;
  COObserverSet *observers;
  void *v15;
  uint64_t v16;
  NSUUID *instanceID;
  NSObject *v18;
  NSUUID *v19;
  objc_class *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  COTimerManager *v25;
  __int16 v26;
  NSUUID *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)COTimerManager;
  v9 = -[COTimerManager init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
    {
      +[COCluster homeCluster](COCluster, "homeCluster");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFSTR("COClusterHome");
    }
    cluster = v10->_cluster;
    v10->_cluster = v11;

    v13 = objc_alloc_init(COObserverSet);
    observers = v10->_observers;
    v10->_observers = v13;

    objc_storeStrong((id *)&v10->_provider, a3);
    objc_storeStrong((id *)&v10->_dtClient, a4);
    objc_msgSend(v8, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_canDispatch = v15 == 0;

    v30[0] = 0;
    v30[1] = 0;
    if (xpc_get_instance())
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v30);
      instanceID = v10->_instanceID;
      v10->_instanceID = (NSUUID *)v16;

    }
    COLogForCategory(1);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v10->_instanceID;
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v25 = v10;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_21214B000, v18, OS_LOG_TYPE_DEFAULT, "%p manager created for %@ with %@ provider", buf, 0x20u);

    }
  }

  return v10;
}

- (COTimerManager)initWithConnectionProvider:(id)a3
{
  id v4;
  void *v5;
  COTimerManager *v6;

  v4 = a3;
  MakeDTTimerClient_0(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COTimerManager initWithConnectionProvider:distributedTimersClient:](self, "initWithConnectionProvider:distributedTimersClient:", v4, v5);

  return v6;
}

- (id)initForAccessory:(id)a3 withConnectionProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  COTimerManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *cluster;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  COHomeKitAccessoryMemento *v20;
  COHomeKitAccessoryMemento *memento;
  uint8_t buf[4];
  COTimerManager *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MakeDTTimerClient_0(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[COTimerManager initWithConnectionProvider:distributedTimersClient:](self, "initWithConnectionProvider:distributedTimersClient:", v7, v9);
  if (v10)
  {
    COLogForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HMAccessory uniqueIdentifier](v10->_accessory, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v24 = v10;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_21214B000, v11, OS_LOG_TYPE_DEFAULT, "%p manager set accessory %@", buf, 0x16u);

    }
    if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
    {
      objc_msgSend(v6, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[COCluster homeClusterForHomeKitHome:](COCluster, "homeClusterForHomeKitHome:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      cluster = v10->_cluster;
      v10->_cluster = (id)v14;
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueIdentifier");
      cluster = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(cluster, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("com.apple.%@-home-mesh"), v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v10->_cluster;
      v10->_cluster = (id)v18;

    }
    v20 = -[COHomeKitAccessoryMemento initWithHomeKitAccessory:]([COHomeKitAccessoryMemento alloc], "initWithHomeKitAccessory:", v6);
    memento = v10->_memento;
    v10->_memento = v20;

  }
  return v10;
}

- (COTimerManager)init
{
  _COTimerManagerConnectionProvider *v3;
  COTimerManager *v4;

  v3 = objc_alloc_init(_COTimerManagerConnectionProvider);
  v4 = -[COTimerManager initWithConnectionProvider:](self, "initWithConnectionProvider:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__COTimerManager_dealloc__block_invoke;
  v4[3] = &unk_24CD3EFE8;
  v4[4] = self;
  -[COTimerManager _withLock:](self, "_withLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)COTimerManager;
  -[COTimerManager dealloc](&v3, sel_dealloc);
}

void __25__COTimerManager_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "co_originalInterruptionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterruptionHandler:", v1);

  objc_msgSend(v3, "co_originalInvalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", v2);

  objc_msgSend(v3, "invalidate");
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_24CD3EEA8;
  v7[4] = self;
  v7[5] = &v8;
  -[COTimerManager _withLock:](self, "_withLock:", v7);
  objc_msgSend((id)v9[5], "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  COTimerManagerMediator *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerManagerServiceConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = (void *)MEMORY[0x24BDD1990];
    v9 = &unk_254B4C2D8;
    objc_msgSend(v8, "interfaceWithProtocol:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_postNotificationName_withUserInfo_callback_, 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedInterface:", v10);
    v36 = -[COTimerManagerMediator initWithTimerManager:]([COTimerManagerMediator alloc], "initWithTimerManager:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedObject:");
    v18 = &unk_254B4FB58;

    v35 = v18;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_timersAsAccessory_asInstance_withCallback_, 0, 1);
    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_timersAsAccessory_forAccessories_callback_, 0, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRemoteObjectInterface:", v19);
    objc_initWeak(location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "interruptionHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidationHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v28);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v29);
    v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v31 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v40[3] = &unk_24CD3F498;
    v32 = v28;
    v41 = v32;
    objc_copyWeak(&v42, location);
    objc_msgSend(v30, "setInterruptionHandler:", v40);
    v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v37[0] = v31;
    v37[1] = 3221225472;
    v37[2] = __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_113;
    v37[3] = &unk_24CD3F498;
    v34 = v29;
    v38 = v34;
    objc_copyWeak(&v39, location);
    objc_msgSend(v33, "setInvalidationHandler:", v37);
    objc_msgSend(*(id *)(a1 + 32), "setLastConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resume");
    objc_destroyWeak(&v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);

  }
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();

  }
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_113(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_113_cold_1();

  }
}

- (void)_lostConnectionToService
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  COTimerManager *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[COTimerManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registeredNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[COTimerManager _registerObserverWithName:](self, "_registerObserverWithName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v6);
  }

  COLogForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p posting reset notification", buf, 0xCu);
  }

  -[COTimerManager postNotificationName:withUserInfo:callback:](self, "postNotificationName:withUserInfo:callback:", CFSTR("COTimerManagerStateReset"), 0, &__block_literal_global_8);
}

- (id)_sendRequestWithName:(id)a3 forTimer:(id)a4 distributedTimers:(id)a5 coordination:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *, void *);
  id v13;
  id v14;
  uint32_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint32_t v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint32_t v45;
  uint8_t buf[4];
  COTimerManager *v47;
  __int16 v48;
  uint32_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *, void *))a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v15 = arc4random();
  COLogForCategory(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "timerID");
    v33 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[COTimerManager dtClient](self, "dtClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v47 = self;
    v48 = 1024;
    v49 = v15;
    v50 = 2114;
    v51 = v10;
    v52 = 2114;
    v53 = v17;
    v54 = 2048;
    v55 = v18;
    _os_log_impl(&dword_21214B000, v16, OS_LOG_TYPE_DEFAULT, "%p (%u) %{public}@ timer %{public}@ [DT: %p]", buf, 0x30u);

    v11 = v33;
  }

  v19 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke;
  v41[3] = &unk_24CD3F620;
  v45 = v15;
  v20 = v10;
  v42 = v20;
  v21 = v11;
  v43 = v21;
  v22 = v14;
  v44 = v22;
  v38[0] = v19;
  v38[1] = 3221225472;
  v38[2] = __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_116;
  v38[3] = &unk_24CD3F648;
  v38[4] = self;
  v23 = (id)MEMORY[0x212BE9A2C](v41);
  v39 = v23;
  v24 = v13;
  v40 = v24;
  v34[0] = v19;
  v34[1] = 3221225472;
  v34[2] = __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_2;
  v34[3] = &unk_24CD3F670;
  v37 = v15;
  v25 = (void (**)(_QWORD))(id)MEMORY[0x212BE9A2C](v38);
  v35 = v25;
  v26 = v23;
  v36 = v26;
  v27 = (void *)MEMORY[0x212BE9A2C](v34);
  -[COTimerManager dtClient](self, "dtClient");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D5A0]), "initWithMTTimer:", v21);
    -[COTimerManager dtClient](self, "dtClient");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v30, v29, v27);

  }
  else
  {
    v25[2](v25);
  }
  v31 = v22;

  return v31;
}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_cold_1(a1, (uint64_t)v3, v5);

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "timerID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = 67109634;
      v9[1] = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%u: %{public}@ timer %{public}@ done", (uint8_t *)v9, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_116(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_remoteInterfaceWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = v3;
  }

}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "code") != 8)
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DTError"));

  if (!v6)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  COLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_DWORD *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

- (void)_updateCanDispatch
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[COTimerManager dtClient](self, "dtClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 == 0) == -[COTimerManager canDispatch](self, "canDispatch"))
    return;
  v5 = -[COTimerManager canDispatch](self, "canDispatch");
  if (v4)
  {
    if (!v5)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!v5)
LABEL_4:
    -[COTimerManager setCanDispatch:](self, "setCanDispatch:", v4 == 0);
LABEL_5:
  -[COTimerManager observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registeredNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("COTimerManagerCanDispatchDidUpdate"));

  if (v8)
  {
    -[COTimerManager accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[COTimerManager accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = CFSTR("COAccessoryDispatchabilityKey");
      v16 = v11;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[COTimerManager canDispatch](self, "canDispatch"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COTimerManagerCanDispatchDidUpdate"), self, v14);
    -[COTimerManager _handleNotification:](self, "_handleNotification:", v15);

  }
}

- (void)_emitNotificationForName:(id)a3 timer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = *MEMORY[0x24BE67800];
    v20 = v7;
    v21 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[COTimerManager observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registeredNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v6);

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", v6, self, v11);
    -[COTimerManager _handleNotification:](self, "_handleNotification:", v15);

  }
  -[COTimerManager observers](self, "observers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registeredNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", CFSTR("COTimerManagerTimersChanged"));

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COTimerManagerTimersChanged"), self, v11);
    -[COTimerManager _handleNotification:](self, "_handleNotification:", v19);

  }
}

- (void)_handleDTTimerClientEvent:(int64_t)a3 dtTimer:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  const __CFString *v17;
  _BYTE v18[22];
  __int16 v19;
  id v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  COLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = -[COTimerManager dtMonitoring](self, "dtMonitoring");
    v12 = "no";
    *(_DWORD *)v18 = 134218754;
    *(_WORD *)&v18[12] = 2048;
    *(_QWORD *)&v18[4] = self;
    if (v11)
      v12 = "yes";
    *(_QWORD *)&v18[14] = a3;
    v19 = 2112;
    v20 = v6;
    v21 = 2080;
    v22 = v12;
    _os_log_debug_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEBUG, "%p got Distributed Timers event: %ld [%@] (dtMonitoring: %s)", v18, 0x2Au);
  }

  if (a3 != 11)
  {
    if (v6)
    {
      objc_msgSend(v6, "mtTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        COLogForCategory(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[COTimerManager _handleDTTimerClientEvent:dtTimer:].cold.2();

        v8 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      v8 = 0;
    }
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
        COLogForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v18 = 134218240;
          *(_QWORD *)&v18[4] = self;
          *(_WORD *)&v18[12] = 2048;
          *(_QWORD *)&v18[14] = a3;
          _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p ignored DistributedTimers event %ld", v18, 0x16u);
        }
        goto LABEL_24;
      case 3:
        -[COTimerManager observers](self, "observers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "registeredNames");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", CFSTR("COTimerManagerStateReset"));

        if (v15)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COTimerManagerStateReset"), self, 0);
          -[COTimerManager _handleNotification:](self, "_handleNotification:", v16);

        }
        goto LABEL_28;
      case 4:
        -[COTimerManager _updateCanDispatch](self, "_updateCanDispatch");
        goto LABEL_28;
      case 5:
        v17 = CFSTR("COTimerManagerTimersAdded");
        goto LABEL_27;
      case 6:
        v17 = CFSTR("COTimerManagerTimersUpdated");
        goto LABEL_27;
      case 7:
        v17 = CFSTR("COTimerManagerTimersRemoved");
        goto LABEL_27;
      case 9:
        v17 = CFSTR("COTimerManagerFiringTimerDismissed");
        goto LABEL_27;
      case 10:
        v17 = CFSTR("COTimerManagerTimerFired");
LABEL_27:
        -[COTimerManager _emitNotificationForName:timer:](self, "_emitNotificationForName:timer:", v17, v8, *(_OWORD *)v18);
        break;
      default:
        COLogForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[COAlarmManager _handleDTTimerClientEvent:dtTimer:].cold.1();
LABEL_24:

        break;
    }
    goto LABEL_28;
  }
  -[COTimerManager _updateMonitoring](self, "_updateMonitoring");
LABEL_29:

}

- (void)_activateDistributedTimersMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  id v15;
  id location;
  uint8_t buf[4];
  COTimerManager *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[COTimerManager dtClient](self, "dtClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[COTimerManager dtClient](self, "dtClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(&location, self);
      v14 = MEMORY[0x24BDAC760];
      objc_copyWeak(&v15, &location);
      -[COTimerManager dtClient](self, "dtClient", v14, 3221225472, __54__COTimerManager__activateDistributedTimersMonitoring__block_invoke, &unk_24CD3F698);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEventHandler:", &v14);

      COLogForCategory(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[COAlarmManager _activateDistributedTimersMonitoring].cold.1();

      -[COTimerManager dtClient](self, "dtClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activate");

      -[COTimerManager setDtMonitoring:](self, "setDtMonitoring:", +[COFeatureStatus isDistributedTimersForHH1Enabled](COFeatureStatus, "isDistributedTimersForHH1Enabled"));
      if (!-[COTimerManager dtMonitoring](self, "dtMonitoring"))
      {
        v9 = objc_msgSend(MEMORY[0x24BE2D5B0], "statusFlags");
        COLogForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v18 = self;
          v19 = 2048;
          v20 = v9;
          _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p DTTimerClientStatusFlags: %ld", buf, 0x16u);
        }

        -[COTimerManager setDtMonitoring:](self, "setDtMonitoring:", (v9 >> 1) & 1);
      }
      COLogForCategory(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[COTimerManager dtMonitoring](self, "dtMonitoring");
        v13 = "no";
        if (v12)
          v13 = "yes";
        *(_DWORD *)buf = 134218242;
        v18 = self;
        v19 = 2080;
        v20 = (unint64_t)v13;
        _os_log_impl(&dword_21214B000, v11, OS_LOG_TYPE_DEFAULT, "%p activated DTTimerClient, using Distribued Timers for events: %s", buf, 0x16u);
      }

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __54__COTimerManager__activateDistributedTimersMonitoring__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleDTTimerClientEvent:dtTimer:", a2, v5);

}

- (void)_updateMonitoring
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint8_t v24[128];
  uint8_t buf[4];
  COTimerManager *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!-[COTimerManager dtMonitoring](self, "dtMonitoring"))
  {
    v3 = objc_msgSend(MEMORY[0x24BE2D5B0], "statusFlags");
    COLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v26 = self;
      v27 = 2048;
      v28 = v3;
      _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%p DTTimerClientStatusFlags update, now: %ld", buf, 0x16u);
    }

    COLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v3 & 2) != 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v26 = self;
        _os_log_impl(&dword_21214B000, v6, OS_LOG_TYPE_DEFAULT, "%p switching observers to Distributed Timers", buf, 0xCu);
      }

      -[COTimerManager setDtMonitoring:](self, "setDtMonitoring:", 1);
      -[COTimerManager observers](self, "observers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registeredNames");
      v6 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v6, "count"))
      {
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __35__COTimerManager__updateMonitoring__block_invoke;
        v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v23[4] = self;
        -[COTimerManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v23);
        v8 = objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v17 = v6;
        v9 = v6;
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
              COLogForCategory(1);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                v26 = self;
                v27 = 2112;
                v28 = v14;
                _os_log_debug_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEBUG, "%p removing observer %@ from coordinated", buf, 0x16u);
              }

              -[COTimerManager memento](self, "memento");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v18[0] = MEMORY[0x24BDAC760];
              v18[1] = 3221225472;
              v18[2] = __35__COTimerManager__updateMonitoring__block_invoke_124;
              v18[3] = &unk_24CD3F6E0;
              v18[4] = v14;
              v18[5] = self;
              -[NSObject removeObserverForNotificationName:asAccessory:withCallback:](v8, "removeObserverForNotificationName:asAccessory:withCallback:", v14, v16, v18);

              ++v13;
            }
            while (v11 != v13);
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          }
          while (v11);
        }

        v6 = v17;
      }
      else
      {
        COLogForCategory(1);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[COAlarmManager _updateMonitoring].cold.2();
      }

    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[COAlarmManager _updateMonitoring].cold.1();
    }

  }
}

void __35__COTimerManager__updateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__COTimerManager__updateMonitoring__block_invoke_cold_1();

}

void __35__COTimerManager__updateMonitoring__block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v13 = 134218498;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v3;
      v8 = "%p failed to remove observer for %@ from coordinated: %@";
      v9 = v4;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v5)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = 134218242;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v8 = "%p removed observer for %@ from coordinated";
    v9 = v4;
    v10 = 22;
    goto LABEL_6;
  }

}

- (id)_timersForAccessory:(id)a3
{
  id v4;
  id v5;
  uint32_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  id v25;
  id v26;
  uint32_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint32_t v34;
  _QWORD v35[4];
  id v36;
  uint32_t v37;
  uint8_t buf[4];
  COTimerManager *v39;
  __int16 v40;
  uint32_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v6 = arc4random();
  COLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[COTimerManager dtClient](self, "dtClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v39 = self;
    v40 = 1024;
    v41 = v6;
    v42 = 2114;
    v43 = v8;
    v44 = 2048;
    v45 = v9;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p (%u) retrieving timers for %{public}@ [DT: %p]", buf, 0x26u);

  }
  v10 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __38__COTimerManager__timersForAccessory___block_invoke;
  v35[3] = &unk_24CD3F708;
  v37 = v6;
  v11 = v5;
  v36 = v11;
  v12 = (void *)MEMORY[0x212BE9A2C](v35);
  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __38__COTimerManager__timersForAccessory___block_invoke_125;
  v32[3] = &unk_24CD40280;
  v34 = v6;
  v13 = v11;
  v33 = v13;
  v14 = (void *)MEMORY[0x212BE9A2C](v32);
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __38__COTimerManager__timersForAccessory___block_invoke_127;
  v28[3] = &unk_24CD3F7C0;
  v28[4] = self;
  v15 = v12;
  v30 = v15;
  v16 = v4;
  v29 = v16;
  v17 = v14;
  v31 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x212BE9A2C](v28);
  -[COTimerManager dtClient](self, "dtClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[COTimerManager dtClient](self, "dtClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __38__COTimerManager__timersForAccessory___block_invoke_3;
    v23[3] = &unk_24CD3F7E8;
    v27 = v6;
    v24 = v18;
    v25 = v15;
    v26 = v17;
    objc_msgSend(v20, "fetchTimersWithCompletionHandler:", v23);

  }
  else
  {
    v18[2](v18);
  }
  v21 = v13;

  return v21;
}

void __38__COTimerManager__timersForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__COTimerManager__timersForAccessory___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

void __38__COTimerManager__timersForAccessory___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%u: retrieving timers done: %@", (uint8_t *)v6, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
}

void __38__COTimerManager__timersForAccessory___block_invoke_127(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_remoteInterfaceWithErrorHandler:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__COTimerManager__timersForAccessory___block_invoke_2;
  v5[3] = &unk_24CD3F798;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "timersAsAccessory:asInstance:withCallback:", v3, v4, v5);

}

uint64_t __38__COTimerManager__timersForAccessory___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __38__COTimerManager__timersForAccessory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 8
      && (objc_msgSend(v7, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DTError")),
          v8,
          v9))
    {
      COLogForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_DWORD *)(a1 + 56);
        v13[0] = 67109120;
        v13[1] = v11;
        _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", (uint8_t *)v13, 8u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    TimersForDTTimers(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (BOOL)_canDispatchForAssociatedAccessory
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;

  COLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[COTimerManager _canDispatchForAssociatedAccessory].cold.5(self, v3);

  -[COTimerManager dtClient](self, "dtClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_9;
  v5 = objc_msgSend(MEMORY[0x24BE2D5B0], "statusFlags");
  if ((v5 & 1) != 0)
  {
    COLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      -[COAlarmManager _canDispatchForAssociatedAccessory].cold.4();
    v9 = 0;
  }
  else
  {
    if ((v5 & 2) == 0)
    {
      COLogForCategory(1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[COAlarmManager _canDispatchForAssociatedAccessory].cold.2();

LABEL_9:
      -[COTimerManager accessory](self, "accessory");
      v7 = objc_claimAutoreleasedReturnValue();
      -[COTimerManager instanceID](self, "instanceID");
      v8 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = (v7 | v8) == 0;
      if (v7 | v8)
      {
        COLogForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[COAlarmManager _canDispatchForAssociatedAccessory].cold.1();

        -[COTimerManager provider](self, "provider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timerManagerServiceConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[COTimerManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &__block_literal_global_129);
        v14 = MEMORY[0x24BDAC760];
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_2;
        v21[3] = &unk_24CD3F9A0;
        v21[4] = &v22;
        v21[5] = self;
        objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[COTimerManager memento](self, "memento");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v14;
        v20[1] = 3221225472;
        v20[2] = __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_130;
        v20[3] = &unk_24CD3F9C8;
        v20[4] = &v22;
        objc_msgSend(v15, "canDispatchAsAccessory:asInstance:reply:", v16, v8, v20);

        v9 = *((_BYTE *)v23 + 24) != 0;
      }
      else
      {
        v9 = 1;
      }
      _Block_object_dispose(&v22, 8);

      goto LABEL_20;
    }
    -[COTimerManager dtClient](self, "dtClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18 == 0;

    COLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
      -[COAlarmManager _canDispatchForAssociatedAccessory].cold.3();
  }
LABEL_20:

  return v9;
}

void __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_130(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_handleNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  COTimerManager *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p forwarding notification %@: %@", (uint8_t *)&v9, 0x20u);

  }
  -[COTimerManager observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v4);

}

- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5
{
  objc_class *v8;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x24BDD16C8];
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithName:object:userInfo:", v11, self, v10);

  -[COTimerManager _handleNotification:](self, "_handleNotification:", v12);
  v9[2](v9, 0);

}

- (id)timers
{
  void *v3;
  void *v4;

  -[COTimerManager memento](self, "memento");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COTimerManager _timersForAccessory:](self, "_timersForAccessory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timersForAccessory:(id)a3
{
  id v4;
  COHomeKitAccessoryMemento *v5;
  void *v6;

  v4 = a3;
  v5 = -[COHomeKitAccessoryMemento initWithHomeKitAccessory:]([COHomeKitAccessoryMemento alloc], "initWithHomeKitAccessory:", v4);

  -[COTimerManager _timersForAccessory:](self, "_timersForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)timersForAccessories:(id)a3
{
  id v4;
  id v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  void (**v25)(_QWORD);
  id v26;
  id v27;
  uint32_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint32_t v35;
  _QWORD v36[4];
  id v37;
  uint32_t v38;
  uint8_t buf[4];
  COTimerManager *v40;
  __int16 v41;
  uint32_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v6 = arc4random();
  COLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "count");
    -[COTimerManager dtClient](self, "dtClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v40 = self;
    v41 = 1024;
    v42 = v6;
    v43 = 2048;
    v44 = v8;
    v45 = 2114;
    v46 = v4;
    v47 = 2048;
    v48 = v9;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p (%u) retrieving timers for %ld:%{public}@ [DT: %p]", buf, 0x30u);

  }
  v10 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __39__COTimerManager_timersForAccessories___block_invoke;
  v36[3] = &unk_24CD3F708;
  v38 = v6;
  v11 = v5;
  v37 = v11;
  v12 = (void *)MEMORY[0x212BE9A2C](v36);
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __39__COTimerManager_timersForAccessories___block_invoke_132;
  v33[3] = &unk_24CD3F810;
  v35 = v6;
  v13 = v11;
  v34 = v13;
  v14 = (void *)MEMORY[0x212BE9A2C](v33);
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __39__COTimerManager_timersForAccessories___block_invoke_134;
  v29[3] = &unk_24CD3F7C0;
  v29[4] = self;
  v15 = v12;
  v31 = v15;
  v16 = v4;
  v30 = v16;
  v17 = v14;
  v32 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x212BE9A2C](v29);
  -[COTimerManager dtClient](self, "dtClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[COTimerManager dtClient](self, "dtClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __39__COTimerManager_timersForAccessories___block_invoke_5;
    v23[3] = &unk_24CD3F8C8;
    v28 = v6;
    v25 = v18;
    v26 = v15;
    v24 = v16;
    v27 = v17;
    objc_msgSend(v20, "fetchTimersWithCompletionHandler:", v23);

  }
  else
  {
    v18[2](v18);
  }
  v21 = v13;

  return v21;
}

void __39__COTimerManager_timersForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__COTimerManager__timersForAccessory___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

void __39__COTimerManager_timersForAccessories___block_invoke_132(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%u: retrieving timers done: %@", (uint8_t *)v6, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
}

void __39__COTimerManager_timersForAccessories___block_invoke_134(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "_remoteInterfaceWithErrorHandler:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "na_map:", &__block_literal_global_136);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "memento");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__COTimerManager_timersForAccessories___block_invoke_3;
  v5[3] = &unk_24CD3F8A0;
  v7 = a1[6];
  v6 = a1[5];
  v8 = a1[7];
  objc_msgSend(v2, "timersAsAccessory:forAccessories:callback:", v4, v3, v5);

}

COHomeKitAccessoryMemento *__39__COTimerManager_timersForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  COHomeKitAccessoryMemento *v3;

  v2 = a2;
  v3 = -[COHomeKitAccessoryMemento initWithHomeKitAccessory:]([COHomeKitAccessoryMemento alloc], "initWithHomeKitAccessory:", v2);

  return v3;
}

void __39__COTimerManager_timersForAccessories___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)a1[4];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__COTimerManager_timersForAccessories___block_invoke_4;
    v9[3] = &unk_24CD3F878;
    v10 = v8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

void __39__COTimerManager_timersForAccessories___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);

}

void __39__COTimerManager_timersForAccessories___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 8
      && (objc_msgSend(v7, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DTError")),
          v8,
          v9))
    {
      COLogForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        v23 = v11;
        _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", buf, 8u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    TimersForDTTimers(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __39__COTimerManager_timersForAccessories___block_invoke_140;
    v19[3] = &unk_24CD3F878;
    v20 = v13;
    v21 = v12;
    v15 = v12;
    v16 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v16, v17, v18);

  }
}

uint64_t __39__COTimerManager_timersForAccessories___block_invoke_140(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

- (id)timersForAccessoryMementos:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  COTimerManager *v23;
  _QWORD v24[4];
  id v25;
  COTimerManager *v26;
  uint8_t buf[4];
  COTimerManager *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[COTimerManager dtClient](self, "dtClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, MEMORY[0x24BDBD1B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v7);
    v8 = v5;

  }
  else
  {
    COLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "na_map:", &__block_literal_global_143);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[COTimerManager cluster](self, "cluster");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v28 = self;
      v29 = 2048;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p retrieving timers for %ld:%@ in %@...", buf, 0x2Au);

    }
    v13 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __45__COTimerManager_timersForAccessoryMementos___block_invoke_144;
    v24[3] = &unk_24CD3F6E0;
    v26 = self;
    v14 = v5;
    v25 = v14;
    -[COTimerManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[COTimerManager memento](self, "memento");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __45__COTimerManager_timersForAccessoryMementos___block_invoke_145;
    v20[3] = &unk_24CD3F958;
    v23 = self;
    v21 = v4;
    v17 = v14;
    v22 = v17;
    objc_msgSend(v15, "timersAsAccessory:forAccessories:callback:", v16, v21, v20);

    v18 = v17;
  }

  return v5;
}

uint64_t __45__COTimerManager_timersForAccessoryMementos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__COTimerManager_timersForAccessoryMementos___block_invoke_144_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  COLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__COTimerManager_timersForAccessoryMementos___block_invoke_145_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v20 = v9;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_21214B000, v8, OS_LOG_TYPE_DEFAULT, "%p returned %@", buf, 0x16u);
    }

    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = *(void **)(a1 + 32);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __45__COTimerManager_timersForAccessoryMementos___block_invoke_147;
    v16 = &unk_24CD3F930;
    v17 = v5;
    v18 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v13);
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v12, v13, v14, v15, v16);

  }
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_147(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

- (id)addTimer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  COTimerManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__COTimerManager_addTimer___block_invoke_2;
  v8[3] = &unk_24CD40328;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[COTimerManager _sendRequestWithName:forTimer:distributedTimers:coordination:](self, "_sendRequestWithName:forTimer:distributedTimers:coordination:", CFSTR("add"), v5, &__block_literal_global_152, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __27__COTimerManager_addTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addTimer:completionHandler:");
}

void __27__COTimerManager_addTimer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "memento");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:asAccessory:asInstance:withCallback:", v5, v10, v9, v7);

}

- (id)updateTimer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  COTimerManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__COTimerManager_updateTimer___block_invoke_2;
  v8[3] = &unk_24CD40328;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[COTimerManager _sendRequestWithName:forTimer:distributedTimers:coordination:](self, "_sendRequestWithName:forTimer:distributedTimers:coordination:", CFSTR("update"), v5, &__block_literal_global_156_0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __30__COTimerManager_updateTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTimer:completionHandler:");
}

void __30__COTimerManager_updateTimer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "memento");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateTimer:asAccessory:withCallback:", v4, v8, v6);

}

- (id)removeTimer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  COTimerManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__COTimerManager_removeTimer___block_invoke_2;
  v8[3] = &unk_24CD40328;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[COTimerManager _sendRequestWithName:forTimer:distributedTimers:coordination:](self, "_sendRequestWithName:forTimer:distributedTimers:coordination:", CFSTR("remove"), v5, &__block_literal_global_159, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __30__COTimerManager_removeTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeTimer:completionHandler:");
}

void __30__COTimerManager_removeTimer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "memento");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTimer:asAccessory:withCallback:", v4, v8, v6);

}

- (id)dismissTimerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  COTimerManager *v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67868]), "initWithIdentifier:", v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__COTimerManager_dismissTimerWithIdentifier___block_invoke_2;
  v10[3] = &unk_24CD40328;
  v11 = v4;
  v12 = self;
  v7 = v4;
  -[COTimerManager _sendRequestWithName:forTimer:distributedTimers:coordination:](self, "_sendRequestWithName:forTimer:distributedTimers:coordination:", CFSTR("dismiss"), v6, &__block_literal_global_162, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __45__COTimerManager_dismissTimerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dismissTimer:completionHandler:");
}

void __45__COTimerManager_dismissTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "memento");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissTimerWithIdentifier:asAccessory:withCallback:", v4, v8, v6);

}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  int v20;
  COTimerManager *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  COLogForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134218242;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_21214B000, v11, OS_LOG_TYPE_DEFAULT, "%p adding observer for %@", (uint8_t *)&v20, 0x16u);
  }

  -[COTimerManager observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registeredNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserverForName:observable:queue:usingBlock:", v8, self, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[COTimerManager _activateDistributedTimersMonitoring](self, "_activateDistributedTimersMonitoring");
  if (!-[COTimerManager dtMonitoring](self, "dtMonitoring"))
  {
    COLogForCategory(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134218242;
      v21 = self;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%p using Coordination for observer %@", (uint8_t *)&v20, 0x16u);
    }

    v16 = objc_msgSend(v13, "containsObject:", v8);
    COLogForCategory(1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
        -[COTimerManager addObserverForName:queue:usingBlock:].cold.1((uint64_t)self);

    }
    else
    {
      if (v18)
        -[COTimerManager addObserverForName:queue:usingBlock:].cold.2((uint64_t)self);

      -[COTimerManager _registerObserverWithName:](self, "_registerObserverWithName:", v8);
    }
  }

  return v14;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  COTimerManager *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  COTimerManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = self;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p removing observer...", buf, 0xCu);
  }

  -[COTimerManager observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", v4);
  if (!-[COTimerManager dtMonitoring](self, "dtMonitoring"))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registeredNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
    {
      COLogForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[COTimerManager removeObserver:].cold.1((uint64_t)self);

      v11 = MEMORY[0x24BDAC760];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __33__COTimerManager_removeObserver___block_invoke;
      v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v17[4] = self;
      -[COTimerManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[COTimerManager memento](self, "memento");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __33__COTimerManager_removeObserver___block_invoke_163;
      v14[3] = &unk_24CD3F6E0;
      v16 = self;
      v15 = v7;
      objc_msgSend(v12, "removeObserverForNotificationName:asAccessory:withCallback:", v15, v13, v14);

    }
  }

}

void __33__COTimerManager_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__COTimerManager__updateMonitoring__block_invoke_cold_1();

}

void __33__COTimerManager_removeObserver___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __33__COTimerManager_removeObserver___block_invoke_163_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p removed last observer for %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_registerObserverWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  COTimerManager *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  COTimerManager *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v22 = self;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p registering observer with service for %@", buf, 0x16u);
  }

  -[COTimerManager accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    _COAssociatedAccessories(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __44__COTimerManager__registerObserverWithName___block_invoke;
    v19[3] = &unk_24CD3FAD8;
    v10 = v8;
    v20 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);

  }
  else
  {
    v10 = 0;
  }
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __44__COTimerManager__registerObserverWithName___block_invoke_2;
  v18[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v18[4] = self;
  -[COTimerManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COTimerManager memento](self, "memento");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COTimerManager instanceID](self, "instanceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __44__COTimerManager__registerObserverWithName___block_invoke_166;
  v15[3] = &unk_24CD3F6E0;
  v16 = v4;
  v17 = self;
  v14 = v4;
  objc_msgSend(v11, "addObserverForNotificationName:asAccessory:asInstance:constraints:withCallback:", v14, v12, v13, v10, v15);

}

void __44__COTimerManager__registerObserverWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __44__COTimerManager__registerObserverWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__COTimerManager__registerObserverWithName___block_invoke_2_cold_1();

}

void __44__COTimerManager__registerObserverWithName___block_invoke_166(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__COTimerManager__registerObserverWithName___block_invoke_166_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p added timer observer for %@", (uint8_t *)&v8, 0x16u);
  }

}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSXPCConnection)lastConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_lastConnection);
}

- (void)setLastConnection:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnection, a3);
}

- (DTTimerClient)dtClient
{
  return self->_dtClient;
}

- (void)setDtClient:(id)a3
{
  objc_storeStrong((id *)&self->_dtClient, a3);
}

- (BOOL)dtMonitoring
{
  return self->_dtMonitoring;
}

- (void)setDtMonitoring:(BOOL)a3
{
  self->_dtMonitoring = a3;
}

- (BOOL)canDispatch
{
  return self->_canDispatch;
}

- (void)setCanDispatch:(BOOL)a3
{
  self->_canDispatch = a3;
}

- (COTimerManagerConnectionProvider)provider
{
  return self->_provider;
}

- (COObserverSet)observers
{
  return self->_observers;
}

- (id)cluster
{
  return self->_cluster;
}

- (COHomeKitAccessoryMemento)memento
{
  return self->_memento;
}

- (NSUUID)instanceID
{
  return self->_instanceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_memento, 0);
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_dtClient, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_accessory, 0);
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to timer service interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_113_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to timer service invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109890;
  v8[1] = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2112;
  v14 = a2;
  _os_log_error_impl(&dword_21214B000, a3, OS_LOG_TYPE_ERROR, "%u: %{public}@ timer %{public}@ failed: %@", (uint8_t *)v8, 0x26u);

  OUTLINED_FUNCTION_9();
}

- (void)_handleDTTimerClientEvent:dtTimer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21214B000, v0, v1, "%p ignoring Distributed Timers non-timer event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __35__COTimerManager__updateMonitoring__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get remote proxy - %@");
  OUTLINED_FUNCTION_1();
}

void __38__COTimerManager__timersForAccessory___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_21214B000, v0, v1, "%u: retrieving timers failed: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_canDispatchForAssociatedAccessory
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dtClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dtClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = "yes";
  v8 = 134218498;
  v9 = a1;
  if (!v6)
    v7 = "no";
  v10 = 2048;
  v11 = v4;
  v12 = 2080;
  v13 = v7;
  _os_log_debug_impl(&dword_21214B000, a2, OS_LOG_TYPE_DEBUG, "%p _canDispatchForAssociatedAccessory: %p, %s", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_9();
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_144_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to retrieve timers (%@)");
  OUTLINED_FUNCTION_1();
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_145_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p retrieving timers failed (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)addObserverForName:(uint64_t)a1 queue:usingBlock:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v1, v2, "%p repeated add observer for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)addObserverForName:(uint64_t)a1 queue:usingBlock:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v1, v2, "%p is getting a new observer for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)removeObserver:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v1, v2, "%p removing last observer for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __33__COTimerManager_removeObserver___block_invoke_163_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_21214B000, v0, v1, "%p failed to remove observer for %@ - %@");
}

void __44__COTimerManager__registerObserverWithName___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get timer remote proxy for add - %@");
  OUTLINED_FUNCTION_1();
}

void __44__COTimerManager__registerObserverWithName___block_invoke_166_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_21214B000, v0, v1, "%p failed to add timer observer for %@ - %@");
}

@end
