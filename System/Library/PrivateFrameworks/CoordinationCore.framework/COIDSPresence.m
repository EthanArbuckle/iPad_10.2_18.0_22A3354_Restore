@implementation COIDSPresence

+ (id)presenceForMesh:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  COIDSPresence *v7;
  COIDSPresence *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  COIDSPresence *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&presenceForMesh__lock);
  v4 = (void *)presenceForMesh__registries;
  if (!presenceForMesh__registries)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)presenceForMesh__registries;
    presenceForMesh__registries = v5;

    v4 = (void *)presenceForMesh__registries;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (COIDSPresence *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = [COIDSPresence alloc];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __33__COIDSPresence_presenceForMesh___block_invoke;
    v12[3] = &unk_24D4B1B98;
    v9 = v3;
    v13 = v9;
    v7 = -[COIDSPresence initWithPresenceProvider:](v8, "initWithPresenceProvider:", v12);
    objc_msgSend((id)presenceForMesh__registries, "setObject:forKey:", v7, v9);

  }
  COCoreLogForCategory(14);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ returned for mesh %{public}@", buf, 0x16u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&presenceForMesh__lock);
  return v7;
}

id __33__COIDSPresence_presenceForMesh___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1060]), "initWithServiceIdentifier:", v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.statuskit.coordination.messaging"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1050]), "initWithPresenceIdentifier:options:", v5, v4);
  v7 = (void *)IDSCopyLocalDeviceUniqueID();
  objc_msgSend(v6, "co_SetIDSIdentifier:", v7);

  return v6;
}

- (COIDSPresence)initWithPresenceProvider:(id)a3
{
  void (**v4)(_QWORD);
  COIDSPresence *v5;
  uint64_t v6;
  NSMutableSet *devices;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  SKPresence *presenceChannel;
  void *v13;
  void *v14;
  uint64_t v15;
  SKPresencePayload *presencePayload;
  uint64_t v17;
  NSMapTable *observers;
  objc_super v20;

  v4 = (void (**)(_QWORD))a3;
  v20.receiver = self;
  v20.super_class = (Class)COIDSPresence;
  v5 = -[COIDSPresence init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    devices = v5->_devices;
    v5->_devices = (NSMutableSet *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.COBrowserRegistry", v8);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    v4[2](v4);
    v11 = objc_claimAutoreleasedReturnValue();
    presenceChannel = v5->_presenceChannel;
    v5->_presenceChannel = (SKPresence *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPresence co_IDSIdentifier](v5->_presenceChannel, "co_IDSIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("ids"));
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1078]), "initWithDictionary:", v13);
    presencePayload = v5->_presencePayload;
    v5->_presencePayload = (SKPresencePayload *)v15;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSMapTable *)v17;

    -[COIDSPresence _start](v5, "_start");
  }

  return v5;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[COIDSPresence presenceChannel](self, "presenceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)addObserver:(id)a3 queue:(id)a4
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
  -[COIDSPresence workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__COIDSPresence_addObserver_queue___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __35__COIDSPresence_addObserver_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2048;
    v22 = v7;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ observer '%p' added", buf, 0x16u);
  }

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_synchronizeInitiate");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "devices", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "_recordForDevice:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(*(id *)(a1 + 32), "_informObserver:aboutRecord:added:", *(_QWORD *)(a1 + 48), v13, 1);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COIDSPresence workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__COIDSPresence_removeObserver___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __32__COIDSPresence_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ observer '%p' removed", (uint8_t *)&v10, 0x16u);
  }

  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      objc_msgSend(*(id *)(a1 + 32), "_synchronizeInitiate");
  }
}

- (void)setRetryTimer:(id)a3
{
  OS_dispatch_source *v5;
  NSObject *v6;
  OS_dispatch_source **p_retryTimer;
  OS_dispatch_source *retryTimer;
  OS_dispatch_source *v9;

  v5 = (OS_dispatch_source *)a3;
  retryTimer = self->_retryTimer;
  p_retryTimer = &self->_retryTimer;
  v6 = retryTimer;
  v9 = v5;
  if (retryTimer != v5)
  {
    if (v6)
      dispatch_source_cancel(v6);
    objc_storeStrong((id *)p_retryTimer, a3);
    if (*p_retryTimer)
      dispatch_resume((dispatch_object_t)*p_retryTimer);
  }

}

- (void)_start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  COIDSPresence *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (+[CODeviceClass isAudioAccessory](CODeviceClass, "isAudioAccessory"))
  {
    COCoreLogForCategory(14);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = self;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered notification for home user changes", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__usersChangedInHomeNotification_, CFSTR("COHomeKitAdapterUsersChangedInHome"), 0);

    +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[COIDSPresence _usersChangedInHome:](self, "_usersChangedInHome:", v7);

  }
  COCoreLogForCategory(14);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[COIDSPresence presenceChannel](self, "presenceChannel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "co_IDSIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ local IDS Identifier: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  -[COIDSPresence presenceChannel](self, "presenceChannel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSPresence workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDelegate:queue:", self, v12);

  -[COIDSPresence _retrainSubscriptionWithRetryCounter:](self, "_retrainSubscriptionWithRetryCounter:", 1);
}

- (id)_recordForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  COIDSDiscoveryRecord *v8;
  NSObject *v9;

  v3 = a3;
  objc_msgSend(v3, "presencePayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "deviceTokenURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("ids"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[COIDSDiscoveryRecord initWithIdsIdentifier:deviceTokenURI:]([COIDSDiscoveryRecord alloc], "initWithIdsIdentifier:deviceTokenURI:", v7, v6);

  }
  else
  {
    COCoreLogForCategory(14);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[COIDSPresence _recordForDevice:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (void)_informObserver:(id)a3 aboutRecord:(id)a4 added:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[COIDSPresence workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[COIDSPresence observers](self, "observers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__COIDSPresence__informObserver_aboutRecord_added___block_invoke;
    block[3] = &unk_24D4B1BC0;
    v16 = a5;
    v14 = v8;
    v15 = v9;
    dispatch_async(v12, block);

  }
}

uint64_t __51__COIDSPresence__informObserver_aboutRecord_added___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "didAddDevice:", v4);
  else
    return objc_msgSend(v3, "didRemoveDevice:", v4);
}

- (void)_informObserversAboutDevice:(id)a3 added:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  COIDSPresence *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[COIDSPresence _recordForDevice:](self, "_recordForDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    COCoreLogForCategory(14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "lost";
      *(_DWORD *)buf = 138544130;
      v22 = 2080;
      v21 = self;
      if (v4)
        v9 = "found";
      v23 = v9;
      v24 = 2114;
      v25 = v7;
      v26 = 2048;
      v27 = v6;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ device %s: %{public}@ (for %p)", buf, 0x2Au);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[COIDSPresence observers](self, "observers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[COIDSPresence _informObserver:aboutRecord:added:](self, "_informObserver:aboutRecord:added:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v7, v4);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)_retrainSubscriptionWithRetryCounter:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15[2];
  _QWORD v16[4];
  id v17[2];
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke;
  v16[3] = &unk_24D4B1BE8;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  v6 = (void *)MEMORY[0x2199F3D40](v16);
  v10 = v5;
  v11 = 3221225472;
  v12 = __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2;
  v13 = &unk_24D4B1C10;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  v7 = v6;
  v14 = v7;
  v8 = (void *)MEMORY[0x2199F3D40](&v10);
  -[COIDSPresence presenceChannel](self, "presenceChannel", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retainTransientSubscriptionAssertionWithCompletion:", v8);

  objc_destroyWeak(v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_retrainSubscriptionWithRetryCounter:", *(_QWORD *)(a1 + 40) + 1);
    WeakRetained = v3;
  }

}

void __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (!v5)
        __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2_cold_1();
      if (v5 >= 0xE)
        v5 = 14;
      v6 = nextRetryTimeInterval_times[v5 - 1];
      COCoreLogForCategory(14);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = *(void **)(a1 + 48);
        v12 = 138544130;
        v13 = WeakRetained;
        v14 = 2048;
        v15 = v11;
        v16 = 2048;
        v17 = v6;
        v18 = 2114;
        v19 = v3;
        _os_log_error_impl(&dword_215E92000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to start: attempt %llu, delay %llu, %{public}@", (uint8_t *)&v12, 0x2Au);
      }

      v8 = dispatch_time(0, 1000000 * v6);
      objc_msgSend(WeakRetained, "workQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v8, v9, *(dispatch_block_t *)(a1 + 32));
    }
    else
    {
      COCoreLogForCategory(14);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = WeakRetained;
        v14 = 2114;
        v15 = v10;
        _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ started successfully, id: '%{public}@'", (uint8_t *)&v12, 0x16u);

      }
    }

  }
}

- (void)_synchronizeInitiate
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  COIDSPresence *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[COIDSPresence workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[COIDSPresence retryAttempts](self, "retryAttempts"))
  {
    -[COIDSPresence observers](self, "observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    COCoreLogForCategory(14);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v7 = "assert";
      else
        v7 = "release";
      -[COIDSPresence identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = self;
      v11 = 2080;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize initiated: target '%s', id: '%{public}@'", (uint8_t *)&v9, 0x20u);

    }
    -[COIDSPresence setRetryAttempts:](self, "setRetryAttempts:", 1);
    -[COIDSPresence _synchronizePresence:](self, "_synchronizePresence:", v5 != 0);
  }
}

- (void)_synchronizePresence:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id location;
  uint8_t buf[4];
  COIDSPresence *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  -[COIDSPresence workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __38__COIDSPresence__synchronizePresence___block_invoke;
  v27[3] = &unk_24D4B1C38;
  objc_copyWeak(&v28, &location);
  v7 = (void *)MEMORY[0x2199F3D40](v27);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __38__COIDSPresence__synchronizePresence___block_invoke_35;
  v23[3] = &unk_24D4B1C88;
  objc_copyWeak(&v25, &location);
  v26 = v3;
  v23[4] = self;
  v8 = v7;
  v24 = v8;
  v9 = (void *)MEMORY[0x2199F3D40](v23);
  v17 = v6;
  v18 = 3221225472;
  v19 = __38__COIDSPresence__synchronizePresence___block_invoke_2;
  v20 = &unk_24D4B0DD8;
  objc_copyWeak(&v22, &location);
  v10 = v9;
  v21 = v10;
  v11 = (void *)MEMORY[0x2199F3D40](&v17);
  v12 = -[COIDSPresence retryAttempts](self, "retryAttempts", v17, v18, v19, v20);
  COCoreLogForCategory(14);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "release";
    *(_DWORD *)buf = 138543874;
    v31 = self;
    if (v3)
      v14 = "assert";
    v32 = 2048;
    v33 = v12;
    v34 = 2080;
    v35 = v14;
    _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize attempt: %llu, target '%s'", buf, 0x20u);
  }

  if (v3)
  {
    -[COIDSPresence presencePayload](self, "presencePayload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[COIDSPresence presenceChannel](self, "presenceChannel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "assertPresenceWithPresencePayload:completion:", v15, v11);

  }
  else
  {
    -[COIDSPresence presenceChannel](self, "presenceChannel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "releasePresenceWithCompletion:", v11);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __38__COIDSPresence__synchronizePresence___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  _BOOL8 v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if ((v6 != 0) == a2)
    {
      v9 = v6 != 0;
      objc_msgSend(v4, "retryTimer");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      objc_msgSend(v4, "_synchronizePresence:", v9);
    }
    else
    {
      COCoreLogForCategory(14);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = "release";
        if (v6)
          v8 = "assert";
        v11 = 138543618;
        v12 = v4;
        v13 = 2080;
        v14 = v8;
        _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize cancelled: target changed to '%s'", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(v4, "setRetryAttempts:", 0);
      objc_msgSend(v4, "setRetryTimer:", 0);
    }
  }

}

void __38__COIDSPresence__synchronizePresence___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  dispatch_time_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = v7 != 0;

    v9 = *(unsigned __int8 *)(a1 + 56);
    COCoreLogForCategory(14);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __38__COIDSPresence__synchronizePresence___block_invoke_35_cold_3();

      if (v9 != v8)
      {
        COCoreLogForCategory(14);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v25 = "release";
          if (v7)
            v25 = "assert";
          *(_DWORD *)buf = 138543618;
          v40 = v5;
          v41 = 2080;
          v42 = v25;
          v19 = "%{public}@ synchronize cancelled: target changed to '%s'";
          v20 = v17;
          v21 = 22;
          goto LABEL_25;
        }
LABEL_26:

LABEL_27:
        objc_msgSend(v5, "setRetryAttempts:", 0);
        objc_msgSend(v5, "setRetryTimer:", 0);
        goto LABEL_38;
      }
      v12 = objc_msgSend(v5, "retryAttempts");
      v13 = v3;
      objc_msgSend(v13, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB10C0]);

      if ((v15 & 1) != 0)
      {
        v16 = objc_msgSend(v13, "code");

        if (v16 == -7001 && v12 >= 2)
        {
          COCoreLogForCategory(14);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v40 = v18;
            v19 = "%{public}@ synchronize cancelled: maximum retries reached";
            v20 = v17;
            v21 = 12;
LABEL_25:
            _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
      }
      else
      {

      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v22 = "assert";
        if (!*(_BYTE *)(a1 + 56))
          v22 = "release";
        *(_DWORD *)buf = 138543618;
        v40 = v5;
        v41 = 2080;
        v42 = v22;
        _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize result: success, target '%s'", buf, 0x16u);
      }

      if (v9 == v8)
        goto LABEL_27;
      COCoreLogForCategory(14);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = "release";
        if (v7)
          v24 = "assert";
        *(_DWORD *)buf = 138543618;
        v40 = v5;
        v41 = 2080;
        v42 = v24;
        _os_log_impl(&dword_215E92000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize restart: target changed to '%s'", buf, 0x16u);
      }

      objc_msgSend(v5, "setRetryAttempts:", 1);
    }
    objc_msgSend(v5, "retryTimer");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26
      || (objc_msgSend(v5, "workQueue"),
          v27 = objc_claimAutoreleasedReturnValue(),
          v26 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v27),
          v27,
          v26))
    {
      v28 = objc_msgSend(v5, "retryAttempts");
      if (!v28)
        __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2_cold_1();
      v29 = 14;
      if (v28 < 0xE)
        v29 = v28;
      v30 = (const char *)nextRetryTimeInterval_times[v29 - 1];
      objc_msgSend(v5, "setRetryAttempts:", v28 + 1);
      COCoreLogForCategory(14);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v5;
        v41 = 2048;
        v42 = v30;
        _os_log_impl(&dword_215E92000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronize waiting: %llu ms", buf, 0x16u);
      }

      v32 = dispatch_walltime(0, 1000000 * (_QWORD)v30);
      dispatch_source_set_timer(v26, v32, 1000000 * (_QWORD)v30, 0);
      v33 = MEMORY[0x24BDAC760];
      v34 = 3221225472;
      v35 = __38__COIDSPresence__synchronizePresence___block_invoke_36;
      v36 = &unk_24D4B1C60;
      v37 = *(id *)(a1 + 40);
      v38 = v8;
      dispatch_source_set_event_handler(v26, &v33);
      objc_msgSend(v5, "setRetryTimer:", v26, v33, v34, v35, v36);

    }
    else
    {
      COCoreLogForCategory(14);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __38__COIDSPresence__synchronizePresence___block_invoke_35_cold_1();
    }

  }
LABEL_38:

}

uint64_t __38__COIDSPresence__synchronizePresence___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __38__COIDSPresence__synchronizePresence___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__COIDSPresence__synchronizePresence___block_invoke_3;
    v7[3] = &unk_24D4B0B68;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __38__COIDSPresence__synchronizePresence___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_usersChangedInHome:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  COIDSPresence *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  objc_msgSend(v27, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10), "userID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v8);
  }

  -[COIDSPresence presenceChannel](self, "presenceChannel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invitedHandles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v19), "handleString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v21, "minusSet:", v14);
  v22 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v22, "minusSet:", v5);
  COCoreLogForCategory(14);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v27, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138544130;
    v39 = self;
    v40 = 2114;
    v41 = v24;
    v42 = 2048;
    v43 = v25;
    v44 = 2112;
    v45 = v5;
    _os_log_impl(&dword_215E92000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ users changed in home '%{public}@'. List of Home users (%lu): %@", buf, 0x2Au);

  }
  v26 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __37__COIDSPresence__usersChangedInHome___block_invoke;
  v29[3] = &unk_24D4B1CD8;
  v29[4] = self;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v29);
  v28[0] = v26;
  v28[1] = 3221225472;
  v28[2] = __37__COIDSPresence__usersChangedInHome___block_invoke_40;
  v28[3] = &unk_24D4B1CD8;
  v28[4] = self;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v28);

}

void __37__COIDSPresence__usersChangedInHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COCoreLogForCategory(14);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    v13 = 2160;
    v14 = 1752392040;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to invite user %{mask.hash}@", buf, 0x20u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1030]), "initWithString:", v3);
  objc_msgSend(*(id *)(a1 + 32), "presenceChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__COIDSPresence__usersChangedInHome___block_invoke_38;
  v9[3] = &unk_24D4B1CB0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "inviteHandleFromPrimaryAccountHandle:completion:", v6, v9);

}

void __37__COIDSPresence__usersChangedInHome___block_invoke_38(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(14);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37__COIDSPresence__usersChangedInHome___block_invoke_38_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2160;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully invited user %{mask.hash}@", (uint8_t *)&v8, 0x20u);
  }

}

void __37__COIDSPresence__usersChangedInHome___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COCoreLogForCategory(14);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    v13 = 2160;
    v14 = 1752392040;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to remove user %{mask.hash}@", buf, 0x20u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1030]), "initWithString:", v3);
  objc_msgSend(*(id *)(a1 + 32), "presenceChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__COIDSPresence__usersChangedInHome___block_invoke_41;
  v9[3] = &unk_24D4B1CB0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "removeInvitedHandle:completion:", v6, v9);

}

void __37__COIDSPresence__usersChangedInHome___block_invoke_41(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _BOOL4 v4;

  COCoreLogForCategory(14);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v4)
      __37__COIDSPresence__usersChangedInHome___block_invoke_41_cold_2();
  }
  else if (v4)
  {
    __37__COIDSPresence__usersChangedInHome___block_invoke_41_cold_1();
  }

}

- (void)_usersChangedInHomeNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[COIDSPresence _usersChangedInHomeNotification:].cold.2();

    -[COIDSPresence _usersChangedInHome:](self, "_usersChangedInHome:", v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[COIDSPresence _usersChangedInHomeNotification:].cold.1();

  }
}

- (void)presentDevicesChangedForPresence:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  COIDSPresence *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COIDSPresence workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  COCoreLogForCategory(14);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[COIDSPresence identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = self;
    v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ present devices changed for '%{public}@'", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "presentDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isSelfDevice") & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v14);
          -[COIDSPresence devices](self, "devices");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v14);

          if ((v16 & 1) == 0)
            -[COIDSPresence _informObserversAboutDevice:added:](self, "_informObserversAboutDevice:added:", v14, 1);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[COIDSPresence devices](self, "devices", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        if ((objc_msgSend(v8, "containsObject:", v22) & 1) == 0)
          -[COIDSPresence _informObserversAboutDevice:added:](self, "_informObserversAboutDevice:added:", v22, 0);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

  -[COIDSPresence setDevices:](self, "setDevices:", v8);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (SKPresence)presenceChannel
{
  return self->_presenceChannel;
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (SKPresencePayload)presencePayload
{
  return self->_presencePayload;
}

- (BOOL)presenceAsserted
{
  return self->_presenceAsserted;
}

- (void)setPresenceAsserted:(BOOL)a3
{
  self->_presenceAsserted = a3;
}

- (unint64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(unint64_t)a3
{
  self->_retryAttempts = a3;
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_presencePayload, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_presenceChannel, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_recordForDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%{public}@ unknown payload for device %p");
  OUTLINED_FUNCTION_2_0();
}

void __54__COIDSPresence__retrainSubscriptionWithRetryCounter___block_invoke_2_cold_1()
{
  __assert_rtn("nextRetryTimeInterval", "COIDSPresence.m", 294, "attempt > 0");
}

void __38__COIDSPresence__synchronizePresence___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%{public}@ synchronize failed, error creating timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__COIDSPresence__synchronizePresence___block_invoke_35_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%{public}@ synchronize result: error [%@]");
  OUTLINED_FUNCTION_2_0();
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_215E92000, v0, v1, "%{public}@ failed to invite user %{mask.hash}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_41_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_215E92000, v0, v1, "%{public}@ successfully removed user %{mask.hash}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

void __37__COIDSPresence__usersChangedInHome___block_invoke_41_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_215E92000, v0, v1, "%{public}@ failed to remove user %{mask.hash}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)_usersChangedInHomeNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%{public}@ user change notification without HMHome", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_usersChangedInHomeNotification:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_215E92000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ users changed in home notification fired", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
