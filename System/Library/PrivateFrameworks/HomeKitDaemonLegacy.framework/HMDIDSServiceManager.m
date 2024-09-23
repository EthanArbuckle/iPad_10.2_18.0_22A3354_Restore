@implementation HMDIDSServiceManager

- (HMDIDSServiceManager)initWithDefaults
{
  void *v3;
  void *v4;
  HMDIDSServiceManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDIDSServiceManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDIDSServiceManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDIDSServiceManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDIDSServiceManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDIDSServiceManager *v36;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[HMDIDSServiceManager sharedIDSServiceName](HMDIDSServiceManager, "sharedIDSServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v7;
    v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Using IDS service %@", (uint8_t *)&v38, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", v3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.home"));
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "productPlatform") == 3
      || +[HMDDeviceCapabilities isCompanionCapable](HMDDeviceCapabilities, "isCompanionCapable"))
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = v5;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting proxy service", (uint8_t *)&v38, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.willow.proxy"));
    }
    else
    {
      v16 = 0;
    }
    v22 = objc_msgSend(v11, "productPlatform");
    if ((unint64_t)(v22 - 1) >= 5)
    {
      if (!v22)
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v5;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = v3;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543362;
          v39 = v34;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine platform, this may limit available IDS services", (uint8_t *)&v38, 0xCu);

          v3 = v33;
        }

        objc_autoreleasePoolPop(v30);
      }
      v21 = 0;
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v5;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = v9;
        v27 = v8;
        v28 = v3;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v29;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Starting stream service", (uint8_t *)&v38, 0xCu);

        v3 = v28;
        v8 = v27;
        v9 = v26;
      }

      objc_autoreleasePoolPop(v23);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.willow.stream"));
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v5;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543362;
      v39 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine current product info, this may limit available IDS services", (uint8_t *)&v38, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = 0;
    v16 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[HMDIDSServiceManager initWithMainService:modernService:proxyService:streamService:notificationCenter:](v5, "initWithMainService:modernService:proxyService:streamService:notificationCenter:", v8, v9, v16, v21, v35);

  return v36;
}

- (HMDIDSServiceManager)initWithMainService:(id)a3 modernService:(id)a4 proxyService:(id)a5 streamService:(id)a6 notificationCenter:(id)a7
{
  id v13;
  id v14;
  id v15;
  HMDIDSServiceManager *v16;
  void *v17;
  HMDIDSServiceManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSMutableSet *applicationBundleIdentifiersThatNeedWakingMessages;
  HMDIDSActivityMonitor *v23;
  void *v24;
  uint64_t v25;
  HMDIDSActivityMonitor *activityMonitor;
  HMDIDSActivityMonitorBroadcaster *v27;
  HMDIDSActivityMonitorBroadcaster *activityBroadcaster;
  HMDIDSActivityMonitorObserver *v29;
  HMDIDSActivityMonitorObserver *activityObserver;
  id v31;
  const char *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *workQueue;
  id v37;
  void *context;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v42 = a6;
  v41 = a7;
  v43.receiver = self;
  v43.super_class = (Class)HMDIDSServiceManager;
  v16 = -[HMDIDSServiceManager init](&v43, sel_init);
  if (v16)
  {
    v40 = v15;
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v39 = v14;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v16;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = v13;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Unable to determine current product info, this may limit available IDS services", buf, 0xCu);

        v13 = v37;
      }

      objc_autoreleasePoolPop(context);
      v14 = v39;
    }
    objc_storeStrong((id *)&v16->_notificationCenter, a7);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifiersThatNeedWakingMessages = v16->_applicationBundleIdentifiersThatNeedWakingMessages;
    v16->_applicationBundleIdentifiersThatNeedWakingMessages = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v16->_service, a3);
    objc_storeStrong((id *)&v16->_modernService, a4);
    objc_storeStrong((id *)&v16->_proxyService, a5);
    objc_storeStrong((id *)&v16->_streamService, a6);
    v23 = [HMDIDSActivityMonitor alloc];
    +[HMDIDSServiceManager sharedIDSServiceName](HMDIDSServiceManager, "sharedIDSServiceName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDIDSActivityMonitor initWithActivity:serviceIdentifier:](v23, "initWithActivity:serviceIdentifier:", CFSTR("com.apple.HomeKit"), v24);
    activityMonitor = v16->_activityMonitor;
    v16->_activityMonitor = (HMDIDSActivityMonitor *)v25;

    v27 = -[HMDIDSActivityMonitorBroadcaster initWithActivityMonitor:]([HMDIDSActivityMonitorBroadcaster alloc], "initWithActivityMonitor:", v16->_activityMonitor);
    activityBroadcaster = v16->_activityBroadcaster;
    v16->_activityBroadcaster = v27;

    v29 = -[HMDIDSActivityMonitorObserver initWithActivityMonitor:]([HMDIDSActivityMonitorObserver alloc], "initWithActivityMonitor:", v16->_activityMonitor);
    activityObserver = v16->_activityObserver;
    v16->_activityObserver = v29;

    HMDispatchQueueNameString();
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = (const char *)objc_msgSend(v31, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create(v32, v33);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v34;

    v15 = v40;
  }

  return v16;
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke;
  v7[3] = &unk_1E89C2328;
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke;
  v7[3] = &unk_1E89C2328;
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
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HMDIDSServiceManager_retrieveFirewallWithQueue_completion___block_invoke;
  v10[3] = &unk_1E89A33B8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "retrieveFirewallWithQueue:completion:", v7, v10);

}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 16, 1);
}

- (HMDIDSService)modernService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (HMDIDSService)proxyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSService)streamService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 40, 1);
}

- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster
{
  return (HMDIDSActivityMonitorBroadcaster *)objc_getProperty(self, a2, 48, 1);
}

- (HMDIDSActivityMonitorObserver)activityObserver
{
  return (HMDIDSActivityMonitorObserver *)objc_getProperty(self, a2, 56, 1);
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
  objc_storeStrong((id *)&self->_modernService, 0);
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

  v67 = *MEMORY[0x1E0C80C00];
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
    v7 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info notification: %@", buf, 0x16u);

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
          if ((objc_msgSend(&unk_1E8B31C08, "containsObject:", v18) & 1) != 0)
          {
            LODWORD(v14) = 0;
          }
          else
          {
            objc_msgSend(v16, "bundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v14) = objc_msgSend(&unk_1E8B31C08, "containsObject:", v27) ^ 1;

          }
        }
      }

      -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 40));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if ((_DWORD)v14)
      {
        objc_msgSend(v28, "addObject:", v5);

        v30 = (void *)MEMORY[0x1D17BA0A0]();
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

        v30 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, v35, buf, 0x2Au);

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

        v45 = (void *)MEMORY[0x1D17BA0A0]();
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
            _os_log_impl(&dword_1CD062000, v52, v53, v51, buf, v54);

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
      v7 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_DEBUG, "%{public}@No changes to waking priority list for '%{mask.hash}@'", buf, 0x20u);

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
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", buf, 0x16u);

      }
    }
    objc_autoreleasePoolPop(v7);
LABEL_51:

    goto LABEL_52;
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Bad process info notification object: %@", buf, 0x16u);

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
    dispatch_assert_queue_V2(a1[8]);
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

  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3 || (WeakRetained = (_HMDIDSProxyLinkPreferenceAssertion *)objc_loadWeakRetained((id *)(v3 + 80))) == 0)
  {
    v5 = [_HMDIDSProxyLinkPreferenceAssertion alloc];
    objc_msgSend(*(id *)(a1 + 32), "proxyService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = -[_HMDIDSProxyLinkPreferenceAssertion initWithIDSProxyService:](v5, "initWithIDSProxyService:", v6);

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      objc_storeWeak((id *)(v7 + 80), WeakRetained);
  }
  objc_setAssociatedObject(*(id *)(a1 + 40), "HMD.ProxyIDSServiceAssertion", WeakRetained, (void *)1);

  objc_autoreleasePoolPop(v2);
}

+ (HMDIDSServiceManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
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
  return (NSString *)CFSTR("com.apple.private.alloy.willow");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1)
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_4503);
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

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating a sharedIDSServiceManager", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithDefaults");
  v7 = (void *)sharedManager_sharedIDSServiceManager;
  sharedManager_sharedIDSServiceManager = v6;

  return objc_msgSend((id)sharedManager_sharedIDSServiceManager, "configure");
}

@end
