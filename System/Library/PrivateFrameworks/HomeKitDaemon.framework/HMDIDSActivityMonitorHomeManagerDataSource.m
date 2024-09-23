@implementation HMDIDSActivityMonitorHomeManagerDataSource

- (HMDIDSActivityMonitorHomeManagerDataSource)initWithHomeManager:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  HMDIDSActivityMonitorHomeManagerDataSource *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *workQueue;
  HMDIDSActivityMonitorHomeManagerDataSource *result;
  HMDIDSActivityMonitorHomeManagerDataSource *v13;
  SEL v14;
  objc_super v15;

  v5 = a3;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (!self)
    goto LABEL_5;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDIDSActivityMonitorHomeManagerDataSource;
    v9 = -[HMDIDSActivityMonitorHomeManagerDataSource init](&v15, sel_init);
    self = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_homeManager, a3);
      objc_storeStrong((id *)&self->_appleAccountManager, v6);
      objc_msgSend(v7, "workQueue");
      v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
      workQueue = self->_workQueue;
      self->_workQueue = v10;

    }
LABEL_5:

    return self;
  }
  v13 = (HMDIDSActivityMonitorHomeManagerDataSource *)_HMFPreconditionFailure();
  -[HMDIDSActivityMonitorHomeManagerDataSource start](v13, v14);
  return result;
}

- (void)start
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDIDSActivityMonitorHomeManagerDataSource startWithNotificationCenter:](self, "startWithNotificationCenter:", v3);

}

- (void)startWithNotificationCenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDIDSActivityMonitorHomeManagerDataSource *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSActivityMonitorHomeManagerDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capabilitiesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentResidentCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isResidentCapable");

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if ((v8 & 1) != 0)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "addObserver:selector:name:object:", v10, sel__handleDeviceAdded_, CFSTR("HMDAccountAddedDeviceNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v10, sel__handleDeviceRemoved_, CFSTR("HMDAccountRemovedDeviceNotification"), 0);
    if (v10)
    {
      objc_msgSend(v4, "addObserver:selector:name:object:", v10, sel__handleCurrentDeviceOrAccountUpdated_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v10->_appleAccountManager);
      objc_msgSend(v4, "addObserver:selector:name:object:", v10, sel__handleCurrentDeviceOrAccountUpdated_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), v10->_appleAccountManager);
      objc_msgSend(v4, "addObserver:selector:name:object:", v10, sel__handleHomeAdded_, CFSTR("HMDHomeAddedNotification"), 0);
      -[HMDIDSActivityMonitorHomeManagerDataSource _startUpdateTask]((id *)&v10->super.isa);
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v10, 0);
    }
    else
    {
      objc_msgSend(v4, "addObserver:selector:name:object:", 0, sel__handleCurrentDeviceOrAccountUpdated_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), 0);
      objc_msgSend(v4, "addObserver:selector:name:object:", 0, sel__handleCurrentDeviceOrAccountUpdated_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), 0);
      objc_msgSend(v4, "addObserver:selector:name:object:", 0, sel__handleHomeAdded_, CFSTR("HMDHomeAddedNotification"), 0);
    }
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not starting on this non-resident-capable device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (v10)
      workQueue = v10->_workQueue;
    else
      workQueue = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__HMDIDSActivityMonitorHomeManagerDataSource_startWithNotificationCenter___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v10;
    dispatch_async(workQueue, block);
  }

}

- (void)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a5;
  v9 = a6;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, block);

}

- (void)_handleDeviceAdded:(id)a3
{
  id v4;
  HMDAppleAccountManager *appleAccountManager;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDIDSActivityMonitorHomeManagerDataSource *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    appleAccountManager = self->_appleAccountManager;
  else
    appleAccountManager = 0;
  -[HMDAppleAccountManager account](appleAccountManager, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Device added or updated on account, updating: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (self)
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v14, 0);

  }
}

- (void)_handleDeviceRemoved:(id)a3
{
  id v4;
  HMDAppleAccountManager *appleAccountManager;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDIDSActivityMonitorHomeManagerDataSource *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    appleAccountManager = self->_appleAccountManager;
  else
    appleAccountManager = 0;
  -[HMDAppleAccountManager account](appleAccountManager, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Device removed from account, updating: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (self)
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v14, 0);

  }
}

- (void)_handleCurrentDeviceOrAccountUpdated:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityMonitorHomeManagerDataSource *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Current device or account updated, updating", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
    -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v6, 0);

}

- (void)_handleHomeAdded:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityMonitorHomeManagerDataSource *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Home added, updating", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
    -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v6, 0);

}

- (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate)delegate
{
  return (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTask, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_pushTokens, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)_updateWithCompletionHandler:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__HMDIDSActivityMonitorHomeManagerDataSource__updateWithCompletionHandler___block_invoke;
  v6[3] = &unk_24E79C2B8;
  v6[4] = a1;
  v5 = v3;
  v7 = v5;
  dispatch_async(v4, v6);

}

void __75__HMDIDSActivityMonitorHomeManagerDataSource__updateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  id location;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int128 aBlock;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  void (*v44)(uint64_t, void *);
  void *v45;
  id v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    objc_msgSend(*(id *)(v1 + 32), "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v1, "homeManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v43 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v43 + 1) = 3221225472;
      v44 = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke;
      v45 = &unk_24E788BF0;
      v46 = v3;
      v8 = v4;
      v47 = v8;
      objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v43);

      if (objc_msgSend(v8, "count"))
      {
        objc_initWeak(&location, (id)v1);
        *(_QWORD *)&aBlock = v7;
        *((_QWORD *)&aBlock + 1) = 3221225472;
        v39 = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_26;
        v40 = &unk_24E786A38;
        objc_copyWeak(&v42, &location);
        v31 = v2;
        v41 = v31;
        v32 = _Block_copy(&aBlock);
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x227676638]();
        v11 = (id)v1;
        HMFGetOSLogHandle();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v13;
          v36 = 2112;
          v37 = v9;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Querying endpoints for these destinations: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(MEMORY[0x24BE4FC40], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDIDSServiceManager sharedIDSServiceName](HMDIDSServiceManager, "sharedIDSServiceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE4FC38], "refreshIDInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(id *)(v1 + 40);
        v18 = objc_msgSend(v14, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:", v9, v15, 1, v16, CFSTR("com.apple.homed.idsActivityMonitor"), v17, v32);

        if ((v18 & 1) == 0)
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = v11;
          HMFGetOSLogHandle();
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v22;
            v36 = 2112;
            v37 = v9;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to query somehow: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v20, 0, v31);
        }

        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);
      }
      else
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = (id)v1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(aBlock) = 138543362;
          *(_QWORD *)((char *)&aBlock + 4) = v30;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find any user destinations associated with the current device", (uint8_t *)&aBlock, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
        -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v28, 0, v2);
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = (id)v1;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = 138543362;
        *(_QWORD *)((char *)&v43 + 4) = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch tokens, currentDevice unavailable", (uint8_t *)&v43, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v24, 0, v2);
    }

  }
}

- (void)_updatePushTokens:(void *)a3 completionHandler:
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  char v9;
  intptr_t v10;
  NSObject *v11;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    -[HMDIDSActivityMonitorHomeManagerDataSource pushTokens]((dispatch_queue_t *)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v7);

    v5 = v7;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_storeStrong((id *)(a1 + 16), v7);

    if ((v9 & 1) == 0)
    {
      if (v6)
        v10 = 9;
      else
        v10 = 17;
      dispatch_get_global_queue(v10, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__HMDIDSActivityMonitorHomeManagerDataSource__updatePushTokens_completionHandler___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = a1;
      dispatch_async(v11, block);

    }
    if (v6)
      v6[2](v6, 1);
  }

}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_msgSend(v6, "residentEnabledDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(v6, "users");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_24E786A10;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

  }
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[5];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_27;
    v15[3] = &unk_24E79B3F0;
    v15[4] = WeakRetained;
    v16 = v5;
    v17 = v6;
    v18 = *(id *)(a1 + 32);
    dispatch_async(v9, v15);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@HMDIDSActivityMonitorHomeManagerDataSource died before IDS returned results", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
  }

}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  dispatch_queue_t *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  dispatch_queue_t *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _BYTE v16[24];
  void *v17;
  dispatch_queue_t *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  if (v1)
  {
    dispatch_assert_queue_V2(v1[5]);
    v7 = (void *)MEMORY[0x227676638]();
    v8 = v1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v16 = 138543618;
        *(_QWORD *)&v16[4] = v11;
        *(_WORD *)&v16[12] = 2112;
        *(_QWORD *)&v16[14] = v4;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received IDS info: %@", v16, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v16 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v16[8] = 3221225472;
      *(_QWORD *)&v16[16] = __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke;
      v17 = &unk_24E786A88;
      v18 = v8;
      v19 = v12;
      v13 = v12;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v16);
      v14 = (void *)objc_msgSend(v13, "copy");
      -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v8, v14, v6);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v16 = 138543618;
        *(_QWORD *)&v16[4] = v15;
        *(_WORD *)&v16[12] = 2112;
        *(_QWORD *)&v16[14] = v5;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch IDS info: %@", v16, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v8, 0, v6);
    }
  }

}

void __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@IDS destination '%@' has endpoints: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "endpoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke_32;
  v13[3] = &unk_24E786A60;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

}

void __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke_32(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pushToken");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accountHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (dispatch_queue_t)pushTokens
{
  dispatch_queue_t *v1;

  if (a1)
  {
    v1 = a1;
    dispatch_assert_queue_V2(a1[5]);
    a1 = v1[2];
  }
  return a1;
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updatePushTokens_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceDidUpdate:", *(_QWORD *)(a1 + 32));

}

void __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  -[HMDIDSActivityMonitorHomeManagerDataSource pushTokens](*(dispatch_queue_t **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[4];
  v6 = v5;
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v8);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke_2;
  v12[3] = &unk_24E79C2B8;
  v9 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v13 = v4;
  v14 = v10;
  v11 = v4;
  dispatch_async(v9, v12);

}

void __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__HMDIDSActivityMonitorHomeManagerDataSource_startWithNotificationCenter___block_invoke(uint64_t a1)
{
  -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:](*(_QWORD *)(a1 + 32), 0, 0);
}

- (void)_startUpdateTask
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location[5];

  if (a1)
  {
    objc_opt_class();
    v2 = (void *)objc_opt_self();
    v3 = MEMORY[0x24BDAC760];
    location[0] = (id)MEMORY[0x24BDAC760];
    location[1] = (id)3221225472;
    location[2] = __64__HMDIDSActivityMonitorHomeManagerDataSource_updateTaskInterval__block_invoke;
    location[3] = &__block_descriptor_40_e5_v8__0l;
    location[4] = v2;
    if (updateTaskInterval_token != -1)
      dispatch_once(&updateTaskInterval_token, location);
    v4 = *(double *)&updateTaskInterval_updateTaskInterval;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1470]), "initWithIdentifier:", CFSTR("com.apple.homed.idsActivityMonitor.update"));
    objc_msgSend(v5, "setRepeats:", 1);
    objc_msgSend(v5, "setInterval:", v4);
    objc_msgSend(v5, "setTolerance:", v4 * 0.25);
    objc_storeStrong(a1 + 6, v5);
    objc_initWeak(location, v5);
    objc_initWeak(&from, a1);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __62__HMDIDSActivityMonitorHomeManagerDataSource__startUpdateTask__block_invoke;
    v6[3] = &unk_24E7869E8;
    objc_copyWeak(&v7, &from);
    objc_copyWeak(&v8, location);
    objc_msgSend(v5, "scheduleWithBlock:", v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

  }
}

void __62__HMDIDSActivityMonitorHomeManagerDataSource__startUpdateTask__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id WeakRetained;
  id v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = objc_msgSend(v5, "shouldDefer");
    v7 = (void *)MEMORY[0x227676638]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v10)
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Deferring background update", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v3[2](v3, 2);
    }
    else
    {
      if (v10)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Performing background update", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v8, v3);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@HMDIDSActivityMonitorHomeManagerDataSource died before scheduled activity could run", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v3[2](v3, 1);
  }

}

void __64__HMDIDSActivityMonitorHomeManagerDataSource_updateTaskInterval__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("idsActivityMonitorUpdateInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "doubleValue");
    v7 = *(_QWORD *)&v6;
    if (v6 > 2.22044605e-16)
    {
      v8 = (void *)MEMORY[0x227676638](v5);
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v11;
        v14 = 2048;
        v15 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding default update interval: %f", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      updateTaskInterval_updateTaskInterval = v7;
    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_127596 != -1)
    dispatch_once(&logCategory__hmf_once_t20_127596, &__block_literal_global_127597);
  return (id)logCategory__hmf_once_v21_127598;
}

void __57__HMDIDSActivityMonitorHomeManagerDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_127598;
  logCategory__hmf_once_v21_127598 = v0;

}

@end
