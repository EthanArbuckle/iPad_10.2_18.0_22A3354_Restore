@implementation HMDCHIPXPCListener

- (HMDCHIPXPCListener)initWithHomeManager:(id)a3
{
  id v4;
  HMDCHIPXPCListener *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  id v11;
  uint64_t v12;
  NSXPCListener *listener;
  uint64_t v14;
  NSXPCInterface *exportedInterface;
  uint64_t v16;
  NSXPCInterface *remoteObjectInterface;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDCHIPXPCListener;
  v5 = -[HMDCHIPXPCListener init](&v19, sel_init);
  if (v5)
  {
    HMDispatchQueueNameString();
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x24BDD1998]);
    v12 = objc_msgSend(v11, "initWithMachServiceName:", *MEMORY[0x24BDD72B8]);
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v12;

    -[NSXPCListener _setQueue:](v5->_listener, "_setQueue:", v5->_workQueue);
    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255881978);
    v14 = objc_claimAutoreleasedReturnValue();
    exportedInterface = v5->_exportedInterface;
    v5->_exportedInterface = (NSXPCInterface *)v14;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255908E70);
    v16 = objc_claimAutoreleasedReturnValue();
    remoteObjectInterface = v5->_remoteObjectInterface;
    v5->_remoteObjectInterface = (NSXPCInterface *)v16;

    objc_storeWeak((id *)&v5->_homeManager, v4);
  }

  return v5;
}

- (void)start
{
  void *v3;
  HMDCHIPXPCListener *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting CHIP XPC listener", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCHIPXPCListener listener](v4, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)stop
{
  id v2;

  -[HMDCHIPXPCListener listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (id)createClientConnectionWithRemoteObjectProxy:(id)a3 homeManager:(id)a4 pid:(int)a5
{
  uint64_t v5;
  id v7;
  HMDCHIPXPCClientConnection *v8;
  void *v9;
  void *v10;
  HMDCHIPXPCClientConnection *v11;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = [HMDCHIPXPCClientConnection alloc];
  -[HMDCHIPXPCListener homeManager](self, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPXPCListener workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCHIPXPCClientConnection initWithRemoteObjectProxy:homeManager:pid:workQueue:](v8, "initWithRemoteObjectProxy:homeManager:pid:workQueue:", v7, v9, v5, v10);

  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPXPCListener *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMDCHIPXPCListener *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDCHIPXPCListener *v29;
  NSObject *v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  int v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v11;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@New CHIP XPC connection requested: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    objc_msgSend(v7, "auditToken");
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
  }
  if (TCCAccessCheckAuditToken())
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.developer.homekit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = objc_msgSend(v14, "BOOLValue");
    if ((v15 & 1) != 0)
    {
      -[HMDCHIPXPCListener exportedInterface](v9, "exportedInterface");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExportedInterface:", v16);

      -[HMDCHIPXPCListener remoteObjectInterface](v9, "remoteObjectInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRemoteObjectInterface:", v17);

      v18 = objc_msgSend(v7, "processIdentifier");
      objc_msgSend(v7, "remoteObjectProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPXPCListener homeManager](v9, "homeManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPXPCListener createClientConnectionWithRemoteObjectProxy:homeManager:pid:](v9, "createClientConnectionWithRemoteObjectProxy:homeManager:pid:", v19, v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setExportedObject:", v21);
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __57__HMDCHIPXPCListener_listener_shouldAcceptNewConnection___block_invoke;
      v33[3] = &unk_24E774F38;
      v35 = v18;
      v33[4] = v9;
      v34 = v21;
      v22 = v21;
      objc_msgSend(v7, "setInvalidationHandler:", v33);
      -[HMDCHIPXPCListener workQueue](v9, "workQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setQueue:", v23);

      objc_msgSend(v7, "resume");
    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v9;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v31;
        v40 = 2112;
        v41 = v7;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@XPC connection does not have public HomeKit entitlement: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v9;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      v40 = 2112;
      v41 = v7;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@XPC connection has no permission to access Home data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v15 = 0;
  }

  return v15;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __57__HMDCHIPXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD *)(a1 + 48);
    v8 = 138543618;
    v9 = v5;
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@CHIP XPC client invalidated: %d", (uint8_t *)&v8, 0x12u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "deregisterReportHandlers");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1)
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_7781);
  return (id)logCategory__hmf_once_v7;
}

void __33__HMDCHIPXPCListener_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7;
  logCategory__hmf_once_v7 = v0;

}

@end
