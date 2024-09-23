@implementation HMDPrimaryResidentDiscoveryManager

- (HMDPrimaryResidentDiscoveryManager)initWithQueue:(id)a3
{
  id v4;
  HMDPrimaryResidentDiscoveryManagerDefaultDataSource *v5;
  HMDPrimaryResidentDiscoveryManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDPrimaryResidentDiscoveryManagerDefaultDataSource);
  v6 = -[HMDPrimaryResidentDiscoveryManager initWithQueue:dataSource:](self, "initWithQueue:dataSource:", v4, v5);

  return v6;
}

- (HMDPrimaryResidentDiscoveryManager)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  HMDPrimaryResidentDiscoveryManager *v9;
  HMDPrimaryResidentDiscoveryManager *v10;
  NSString *logIdentifier;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDPrimaryResidentDiscoveryManager;
  v9 = -[HMDPrimaryResidentDiscoveryManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    logIdentifier = v10->_logIdentifier;
    v10->_logIdentifier = (NSString *)CFSTR("<unconfigured>");

    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

- (void)configureWithContext:(id)a3
{
  HMDResidentDeviceManagerContext **p_context;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *logIdentifier;
  HMDPrimaryResidentDiscoveryManagerDataSource *v10;
  void *v11;
  id v12;

  p_context = &self->_context;
  v5 = a3;
  objc_storeWeak((id *)p_context, v5);
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v8;

  -[HMDPrimaryResidentDiscoveryManagerDataSource remoteDeviceMonitorFromContext:](self->_dataSource, "remoteDeviceMonitorFromContext:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = self->_dataSource;
  -[HMDPrimaryResidentDiscoveryManagerDataSource notificationCenter](v10, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleDeviceMonitorReachableNotification_, CFSTR("HMDRemoteDeviceMonitorReachableNotification"), v12);

}

- (void)discoverPrimaryResident
{
  HMDPrimaryResidentDiscoveryManager *v2;

  v2 = self;
  if (self)
    self = (HMDPrimaryResidentDiscoveryManager *)self->_queue;
  dispatch_assert_queue_V2(&self->super);
  -[HMDPrimaryResidentDiscoveryManager _discoverPrimaryResident](v2, "_discoverPrimaryResident");
}

- (void)cancel
{
  SEL v3;
  const char *v4;
  void *v5;
  HMDPrimaryResidentDiscoveryManager *v6;
  NSObject *v7;
  void *v8;
  SEL v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (objc_getProperty(self, v3, 48, 1))
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v12 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling primary resident discovery operation.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(objc_getProperty(v6, v9, 48, 1), "cancel");
    }
    else if (objc_getProperty(self, v4, 56, 1))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDPrimaryResidentDiscoveryManager completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:](self, "completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:", 0, 0);

    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
}

- (void)_discoverPrimaryResident
{
  SEL v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDPrimaryResidentDiscoveryManagerDataSource *v11;
  void *v12;
  SEL v13;
  SEL v14;
  void *v15;
  uint64_t v16;
  id v17;
  SEL v18;
  void *v19;
  id v20;
  void *v21;
  HMDPrimaryResidentDiscoveryManager *v22;
  NSObject *v23;
  void *v24;
  HMDPrimaryResidentDiscoveryManagerDataSource *v25;
  void *v26;
  id v27;
  void *v28;
  HMDPrimaryResidentDiscoveryManager *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!self)
  {
    dispatch_assert_queue_V2(0);
LABEL_8:
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform the operation because the resident manager context is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPrimaryResidentDiscoveryManager completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:](v29, "completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:", 0, 0, v6);
    goto LABEL_11;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_getProperty(self, v3, 48, 1))
    return;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (!WeakRetained)
    goto LABEL_8;
  v6 = WeakRetained;
  objc_msgSend(objc_getProperty(self, v5, 56, 1), "suspend");
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currentAccessorySetupMetricDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markSetupBeginStage:error:", 14, 0);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", self->_queue);
  v11 = self->_dataSource;
  -[HMDPrimaryResidentDiscoveryManagerDataSource createPrimaryResidentDiscoveryOperationWithContext:](v11, "createPrimaryResidentDiscoveryOperationWithContext:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(self, v13, v12, 48);

  objc_msgSend(objc_getProperty(self, v14, 48, 1), "completionFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v36[4] = self;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke;
  v37[3] = &unk_24E784C38;
  v37[4] = self;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_82;
  v36[3] = &unk_24E797A18;
  v17 = (id)objc_msgSend(v15, "inContext:then:orRecover:", v10, v37, v36);

  objc_msgSend(objc_getProperty(self, v18, 48, 1), "initialDiscoveryAttemptCompletionFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = self;
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_84;
  v35[3] = &unk_24E7979F0;
  v35[4] = self;
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_2;
  v34[3] = &unk_24E797A18;
  v20 = (id)objc_msgSend(v19, "inContext:then:orRecover:", v10, v35, v34);

  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v24;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling primary resident discovery operation", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
  objc_initWeak((id *)buf, v22);
  v25 = self->_dataSource;
  -[HMDPrimaryResidentDiscoveryManagerDataSource transportStartFutureFromContext:](v25, "transportStartFutureFromContext:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_86;
  v32[3] = &unk_24E796128;
  objc_copyWeak(&v33, (id *)buf);
  v27 = (id)objc_msgSend(v26, "inContext:then:", v10, v32);

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

LABEL_11:
}

- (void)sendCheckForResidentsInHomeNotification
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  HMDPrimaryResidentDiscoveryManagerDataSource *dataSource;
  HMDPrimaryResidentDiscoveryManagerDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDPrimaryResidentDiscoveryManager *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(WeakRetained, "availableResidentDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      if (self)
        dataSource = self->_dataSource;
      else
        dataSource = 0;
      v8 = dataSource;
      -[HMDPrimaryResidentDiscoveryManagerDataSource notificationCenter](v8, "notificationCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid", CFSTR("kHomeUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("HMDPrimaryResidentDiscoveryFindResidentsNotification"), 0, v12);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Home is nil. Not sending HMDPrimaryResidentDiscoveryFindResidentsNotification.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)completedDiscoveryWithPrimaryResident:(id)a3 primaryResidentGenerationID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDPrimaryResidentDiscoveryManager _removeRetryTimer](self, "_removeRetryTimer");
  -[HMDPrimaryResidentDiscoveryManager delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "discoveryManager:didCompleteDiscoveryWithPrimaryResidentDevice:primaryResidentGenerationID:error:", self, v10, v9, v8);

}

- (void)_startRetryTimer
{
  HMDPrimaryResidentDiscoveryManager *v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  SEL v7;
  OS_dispatch_queue *v8;
  SEL v9;
  id Property;
  id v11;

  v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 56, 1))
      goto LABEL_7;
    self = (HMDPrimaryResidentDiscoveryManager *)v2->_dataSource;
  }
  -[HMDPrimaryResidentDiscoveryManager createBackoffTimer](self, "createBackoffTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v2)
  {
    objc_setProperty_atomic(v2, v5, v4, 56);

    objc_msgSend(objc_getProperty(v2, v7, 56, 1), "setDelegate:", v2);
    v8 = v2->_queue;
    Property = objc_getProperty(v2, v9, 56, 1);
  }
  else
  {

    objc_msgSend(0, "setDelegate:", 0);
    v8 = 0;
    Property = 0;
  }
  objc_msgSend(Property, "setDelegateQueue:", v8);

  if (!v2)
  {
    v11 = 0;
    goto LABEL_8;
  }
LABEL_7:
  v11 = objc_getProperty(v2, v3, 56, 1);
LABEL_8:
  objc_msgSend(v11, "resume");
}

- (void)_removeRetryTimer
{
  SEL v3;

  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 56, 1), "suspend");
    objc_setProperty_atomic(self, v3, 0, 56);
  }
  else
  {
    objc_msgSend(0, "suspend");
  }
}

- (void)_handleDeviceMonitorReachableNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDPrimaryResidentDiscoveryManager__handleDeviceMonitorReachableNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  void *v7;
  HMDPrimaryResidentDiscoveryManager *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 56, 1);
  else
    Property = 0;
  if (Property == v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery retry timer fired", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDPrimaryResidentDiscoveryManager _discoverPrimaryResident](v8, "_discoverPrimaryResident");
  }

}

- (HMDPrimaryResidentDiscoveryManagerDelegate)delegate
{
  return (HMDPrimaryResidentDiscoveryManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_logIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryOperation, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __80__HMDPrimaryResidentDiscoveryManager__handleDeviceMonitorReachableNotification___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 40));
  else
    WeakRetained = 0;
  objc_msgSend(v3, "remoteDeviceMonitorFromContext:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9 = objc_getProperty(v8, v7, 56, 1);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v6, "isReachable");

      if (v11)
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543362;
          v17 = v15;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Current device is now reachable. Resetting retry timer and running discovery if it's not running already.", (uint8_t *)&v16, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(*(id *)(a1 + 32), "discoverPrimaryResident");
      }
    }
  }

}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  id Property;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "currentPrimaryResident");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrimaryResidentGenerationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v5, 48, 1);
  objc_msgSend(Property, "logEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  if (v10)
    objc_setProperty_atomic(v10, v8, 0, 48);
  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery operation completed with: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    v16 = *(void **)(v15 + 32);
  else
    v16 = 0;
  objc_msgSend(v16, "logEventSubmitter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "submitLogEvent:", v9);

  objc_msgSend(*(id *)(a1 + 32), "completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:", v4, v6, 0);
  return 1;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_82(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 48, 1);
  objc_msgSend(Property, "error");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  v11 = *(id *)(a1 + 32);
  if (v11)
    v11 = objc_getProperty(v11, v10, 48, 1);
  objc_msgSend(v11, "logEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  if (v14)
    objc_setProperty_atomic(v14, v12, 0, 48);
  if (objc_msgSend(v9, "isHMFError") && objc_msgSend(v9, "code") == 12)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Primary discovery operation canceled", (uint8_t *)&v34, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "completedDiscoveryWithPrimaryResident:primaryResidentGenerationID:error:", 0, 0, v9);
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "_startRetryTimer"));
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(id *)(a1 + 32);
      if (v24)
        v24 = objc_getProperty(v24, v22, 56, 1);
      objc_msgSend(v24, "fireDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceNow");
      v34 = 138543874;
      v35 = v23;
      v36 = 2112;
      v37 = v9;
      v38 = 2048;
      v39 = v26;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Primary discovery failed with error: %@, retrying after %.03f seconds", (uint8_t *)&v34, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v27 = *(_QWORD *)(a1 + 32);
    if (v27)
      v28 = *(void **)(v27 + 32);
    else
      v28 = 0;
    objc_msgSend(v28, "logEventSubmitter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "submitLogEvent:", v13);

    objc_msgSend(*(id *)(a1 + 32), "sendCheckForResidentsInHomeNotification");
  }
  v30 = v9;
  v31 = v30;
  if (v30)
  {
    v32 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_84(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveryManager:didCompleteInitialDiscoveryAttemptWithError:", *(_QWORD *)(a1 + 32), 0);

  return 1;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoveryManager:didCompleteInitialDiscoveryAttemptWithError:", *(_QWORD *)(a1 + 32), v3);

  v5 = v3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __62__HMDPrimaryResidentDiscoveryManager__discoverPrimaryResident__block_invoke_86(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
    WeakRetained = objc_getProperty(WeakRetained, v2, 48, 1);
  objc_msgSend(WeakRetained, "run");

  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_112579 != -1)
    dispatch_once(&logCategory__hmf_once_t9_112579, &__block_literal_global_112580);
  return (id)logCategory__hmf_once_v10_112581;
}

void __49__HMDPrimaryResidentDiscoveryManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_112581;
  logCategory__hmf_once_v10_112581 = v0;

}

@end
