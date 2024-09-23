@implementation HMDIDSServiceManager

- (HMDIDSServiceManager)initWithDefaults
{
  uint64_t v3;
  void *v4;
  HMDIDSServiceManager *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDIDSServiceManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDIDSServiceManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDIDSServiceManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDIDSServiceManager *v30;
  void *v32;
  HMDIDSServiceManager *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  +[HMDIDSServiceManager sharedIDSServiceName](HMDIDSServiceManager, "sharedIDSServiceName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v7;
    v41 = 2112;
    v42 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Using IDS service %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v38 = (void *)v3;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", v3);
  if (_os_feature_enabled_impl())
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.alarms-timers"));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.energykit"));
  }
  else
  {
    v9 = 0;
    v36 = 0;
  }
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.willow"));
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v17 = (void *)v8;
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v5;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine current product info, this may limit available IDS services", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "productPlatform") == 3
    || +[HMDDeviceCapabilities isCompanionCapable](HMDDeviceCapabilities, "isCompanionCapable"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v5;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting proxy service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.willow.proxy"));
  }
  else
  {
    v16 = 0;
  }
  v23 = objc_msgSend(v11, "productPlatform");
  v17 = (void *)v8;
  if ((unint64_t)(v23 - 1) < 5)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v5;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Starting stream service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.willow.stream"));
    goto LABEL_20;
  }
  if (v23)
  {
    v22 = 0;
LABEL_20:
    v28 = (void *)v36;
    goto LABEL_21;
  }
  v32 = (void *)MEMORY[0x227676638]();
  v33 = v5;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v36;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v35;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine platform, this may limit available IDS services", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v32);
  v22 = 0;
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HMDIDSServiceManager initWithMainService:legacyService:hmmmService:hmmmEnergyService:proxyService:streamService:notificationCenter:](v5, "initWithMainService:legacyService:hmmmService:hmmmEnergyService:proxyService:streamService:notificationCenter:", v17, v37, v28, v9, v16, v22, v29);

  return v30;
}

- (HMDIDSServiceManager)initWithMainService:(id)a3 legacyService:(id)a4 hmmmService:(id)a5 hmmmEnergyService:(id)a6 proxyService:(id)a7 streamService:(id)a8 notificationCenter:(id)a9
{
  id v16;
  HMDIDSServiceManager *v17;
  void *v18;
  void *v19;
  HMDIDSServiceManager *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSMutableSet *applicationBundleIdentifiersThatNeedWakingMessages;
  HMDIDSActivityMonitor *v25;
  void *v26;
  uint64_t v27;
  HMDIDSActivityMonitor *activityMonitor;
  HMDIDSActivityMonitorBroadcaster *v29;
  HMDIDSActivityMonitorBroadcaster *activityBroadcaster;
  HMDIDSActivityMonitorObserver *v31;
  HMDIDSActivityMonitorObserver *activityObserver;
  id v33;
  const char *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *workQueue;
  void *v39;
  id v40;
  id obj;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v16 = a4;
  v46 = a5;
  obj = a6;
  v45 = a6;
  v44 = a7;
  v43 = a8;
  v42 = a9;
  v48.receiver = self;
  v48.super_class = (Class)HMDIDSServiceManager;
  v17 = -[HMDIDSServiceManager init](&v48, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v40 = v16;
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v17;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Unable to determine current product info, this may limit available IDS services", buf, 0xCu);

        v19 = v39;
      }

      objc_autoreleasePoolPop(v19);
      v18 = 0;
      v16 = v40;
    }
    objc_storeStrong((id *)&v17->_notificationCenter, a9);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifiersThatNeedWakingMessages = v17->_applicationBundleIdentifiersThatNeedWakingMessages;
    v17->_applicationBundleIdentifiersThatNeedWakingMessages = (NSMutableSet *)v23;

    objc_storeStrong((id *)&v17->_service, a3);
    objc_storeStrong((id *)&v17->_legacyService, a4);
    objc_storeStrong((id *)&v17->_proxyService, a7);
    objc_storeStrong((id *)&v17->_streamService, a8);
    v25 = [HMDIDSActivityMonitor alloc];
    +[HMDIDSServiceManager sharedIDSServiceName](HMDIDSServiceManager, "sharedIDSServiceName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HMDIDSActivityMonitor initWithActivity:serviceIdentifier:](v25, "initWithActivity:serviceIdentifier:", CFSTR("com.apple.HomeKit"), v26);
    activityMonitor = v17->_activityMonitor;
    v17->_activityMonitor = (HMDIDSActivityMonitor *)v27;

    v29 = -[HMDIDSActivityMonitorBroadcaster initWithActivityMonitor:]([HMDIDSActivityMonitorBroadcaster alloc], "initWithActivityMonitor:", v17->_activityMonitor);
    activityBroadcaster = v17->_activityBroadcaster;
    v17->_activityBroadcaster = v29;

    v31 = -[HMDIDSActivityMonitorObserver initWithActivityMonitor:]([HMDIDSActivityMonitorObserver alloc], "initWithActivityMonitor:", v17->_activityMonitor);
    activityObserver = v17->_activityObserver;
    v17->_activityObserver = v31;

    HMDispatchQueueNameString();
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = (const char *)objc_msgSend(v33, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create(v34, v35);
    workQueue = v17->_workQueue;
    v17->_workQueue = (OS_dispatch_queue *)v36;

    objc_storeStrong((id *)&v17->_hmmmService, a5);
    objc_storeStrong((id *)&v17->_hmmmEnergyService, obj);

  }
  return v17;
}

- (void)setActivityMonitorDataSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDIDSServiceManager activityObserver](self, "activityObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithDataSource:", v4);

  -[HMDIDSServiceManager activityBroadcaster](self, "activityBroadcaster");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithDataSource:", v4);

}

- (void)configure
{
  HMDIDSServiceManager *v2;

  v2 = self;
  if (self)
    self = (HMDIDSServiceManager *)self->_notificationCenter;
  -[HMDIDSServiceManager addObserver:selector:name:object:](self, "addObserver:selector:name:object:", v2, sel_handleProcessInfoStateChanged_, CFSTR("HMDProcessInfoStateDidChangeNotification"), 0);
}

- (void)unconfigure
{
  HMDIDSServiceManager *v2;

  v2 = self;
  if (self)
    self = (HMDIDSServiceManager *)self->_notificationCenter;
  -[HMDIDSServiceManager removeObserver:](self, "removeObserver:", v2);
}

- (void)addProxyServiceLinkPreferencesAssertionHolder:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)handleProcessInfoStateChanged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDIDSServiceManager *v9;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)retrieveFirewallWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[HMDIDSServiceManager service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HMDIDSServiceManager_retrieveFirewallWithQueue_completion___block_invoke;
  v10[3] = &unk_24E7748F0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "retrieveFirewallWithQueue:completion:", v7, v10);

}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 16, 1);
}

- (HMDIDSService)hmmmService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (HMDIDSService)hmmmEnergyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSService)legacyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 40, 1);
}

- (HMDIDSService)proxyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 48, 1);
}

- (HMDIDSService)streamService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 56, 1);
}

- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster
{
  return (HMDIDSActivityMonitorBroadcaster *)objc_getProperty(self, a2, 64, 1);
}

- (HMDIDSActivityMonitorObserver)activityObserver
{
  return (HMDIDSActivityMonitorObserver *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_proxyLinkPreferenceAssertion);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activityObserver, 0);
  objc_storeStrong((id *)&self->_activityBroadcaster, 0);
  objc_storeStrong((id *)&self->_streamService, 0);
  objc_storeStrong((id *)&self->_proxyService, 0);
  objc_storeStrong((id *)&self->_legacyService, 0);
  objc_storeStrong((id *)&self->_hmmmEnergyService, 0);
  objc_storeStrong((id *)&self->_hmmmService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifiersThatNeedWakingMessages, 0);
}

uint64_t __61__HMDIDSServiceManager_retrieveFirewallWithQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  const char *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  void *v42;
  int v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  const char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint32_t v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v11;
        v61 = 2112;
        v62 = (uint64_t)v4;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info notification: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      v14 = *(_QWORD *)(a1 + 40);
      v15 = v4;
      v16 = v15;
      if (v14)
      {
        v17 = objc_msgSend(v15, "state");
        if (v17 == -1)
        {
          LODWORD(v14) = objc_msgSend(v16, "isEntitledForSPIAccess");
        }
        else if (v17 == 2)
        {
          objc_msgSend(v16, "applicationInfo");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = v26 == 0;

        }
        else if (v17)
        {
          LODWORD(v14) = 0;
        }
        else
        {
          objc_msgSend(v16, "applicationIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(&unk_24E970B38, "containsObject:", v18) & 1) != 0)
          {
            LODWORD(v14) = 0;
          }
          else
          {
            objc_msgSend(v16, "bundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v14) = objc_msgSend(&unk_24E970B38, "containsObject:", v27) ^ 1;

          }
        }
      }

      -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if ((_DWORD)v14)
      {
        objc_msgSend(v28, "addObject:", v5);

        v30 = (void *)MEMORY[0x227676638]();
        v31 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v60 = v33;
        v61 = 2160;
        v62 = 1752392040;
        v63 = 2112;
        v64 = (uint64_t)v5;
        v65 = 2112;
        v66 = v34;
        v35 = "%{public}@Added '%{mask.hash}@' to waking message priority list: %@";
        goto LABEL_31;
      }
      v36 = objc_msgSend(v28, "containsObject:", v5);

      if (v36)
      {
        -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeObject:", v5);

        v30 = (void *)MEMORY[0x227676638]();
        v31 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v60 = v33;
        v61 = 2160;
        v62 = 1752392040;
        v63 = 2112;
        v64 = (uint64_t)v5;
        v65 = 2112;
        v66 = v34;
        v35 = "%{public}@Removed '%{mask.hash}@' from waking message priority list: %@";
LABEL_31:
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, v35, buf, 0x2Au);

LABEL_32:
        objc_autoreleasePoolPop(v30);
        -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v39)
          v40 = 1;
        else
          v40 = v13 == 0;
        if (v13 == 0 && v39 != 0)
          v41 = 2;
        else
          v41 = 1;
        if ((v13 != 0 || v39 == 0) && v40)
          goto LABEL_51;
        objc_msgSend(*(id *)(a1 + 40), "service");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        v43 = objc_msgSend(v42, "setWakingPushPriority:error:", v41, &v58);
        v44 = v58;

        v45 = (void *)MEMORY[0x227676638]();
        v46 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v43)
        {
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "sharedIDSServiceName");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v49;
            v61 = 2114;
            v62 = (uint64_t)v50;
            v63 = 2048;
            v64 = v41;
            v51 = "%{public}@Set waking push priority for service '%{public}@' to %ld";
            v52 = v48;
            v53 = OS_LOG_TYPE_INFO;
            v54 = 32;
LABEL_49:
            _os_log_impl(&dword_2218F0000, v52, v53, v51, buf, v54);

          }
        }
        else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "sharedIDSServiceName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v60 = v49;
          v61 = 2114;
          v62 = (uint64_t)v50;
          v63 = 2048;
          v64 = v41;
          v65 = 2112;
          v66 = v44;
          v51 = "%{public}@Failed to set waking push priority for service '%{public}@' to %ld: %@";
          v52 = v48;
          v53 = OS_LOG_TYPE_ERROR;
          v54 = 42;
          goto LABEL_49;
        }

        objc_autoreleasePoolPop(v45);
        goto LABEL_51;
      }
      v7 = (void *)MEMORY[0x227676638]();
      v55 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = v57;
        v61 = 2160;
        v62 = 1752392040;
        v63 = 2112;
        v64 = (uint64_t)v5;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_DEBUG, "%{public}@No changes to waking priority list for '%{mask.hash}@'", buf, 0x20u);

      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v60 = v24;
        v61 = 2112;
        v62 = v25;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", buf, 0x16u);

      }
    }
    objc_autoreleasePoolPop(v7);
LABEL_51:

    goto LABEL_52;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v60 = v22;
    v61 = 2112;
    v62 = v23;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Bad process info notification object: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_52:

}

- (dispatch_queue_t)applicationBundleIdentifiersThatNeedWakingMessages
{
  dispatch_queue_t *v1;

  if (a1)
  {
    v1 = a1;
    dispatch_assert_queue_V2(a1[10]);
    a1 = v1[1];
  }
  return a1;
}

void __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _HMDIDSProxyLinkPreferenceAssertion *WeakRetained;
  _HMDIDSProxyLinkPreferenceAssertion *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3 || (WeakRetained = (_HMDIDSProxyLinkPreferenceAssertion *)objc_loadWeakRetained((id *)(v3 + 96))) == 0)
  {
    v5 = [_HMDIDSProxyLinkPreferenceAssertion alloc];
    objc_msgSend(*(id *)(a1 + 32), "proxyService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = -[_HMDIDSProxyLinkPreferenceAssertion initWithIDSProxyService:](v5, "initWithIDSProxyService:", v6);

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      objc_storeWeak((id *)(v7 + 96), WeakRetained);
  }
  objc_setAssociatedObject(*(id *)(a1 + 40), "HMD.ProxyIDSServiceAssertion", WeakRetained, (void *)1);

  objc_autoreleasePoolPop(v2);
}

+ (HMDIDSServiceManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDIDSServiceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (HMDIDSServiceManager *)(id)sharedManager_sharedIDSServiceManager;
}

+ (NSString)sharedIDSServiceName
{
  return (NSString *)CFSTR("com.apple.private.alloy.home");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1)
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_5827);
  return (id)logCategory__hmf_once_v19;
}

void __35__HMDIDSServiceManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19;
  logCategory__hmf_once_v19 = v0;

}

uint64_t __37__HMDIDSServiceManager_sharedManager__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating a sharedIDSServiceManager", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithDefaults");
  v7 = (void *)sharedManager_sharedIDSServiceManager;
  sharedManager_sharedIDSServiceManager = v6;

  return objc_msgSend((id)sharedManager_sharedIDSServiceManager, "configure");
}

@end
