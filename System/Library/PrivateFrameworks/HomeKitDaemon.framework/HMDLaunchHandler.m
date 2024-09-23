@implementation HMDLaunchHandler

- (HMDLaunchHandler)init
{
  void *v3;
  id v4;
  void *v5;
  HMDFileManager *v6;
  HMDLaunchHandler *v7;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = (id)launchdAssertionPlistPath;
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(HMDFileManager);
  v7 = -[HMDLaunchHandler initWithRelaunchPlistFileURL:fileManager:jetsamPriorityHandler:](self, "initWithRelaunchPlistFileURL:fileManager:jetsamPriorityHandler:", v5, v6, &__block_literal_global_174173);

  return v7;
}

- (HMDLaunchHandler)initWithRelaunchPlistFileURL:(id)a3 fileManager:(id)a4 jetsamPriorityHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDLaunchHandler *v11;
  uint64_t v12;
  NSURL *relaunchPlistFileURL;
  void *v14;
  id jetsamPriorityHandler;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *handlerQueue;
  uint64_t v19;
  NSMutableSet *registeredRelaunchClients;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDLaunchHandler;
  v11 = -[HMDLaunchHandler init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    relaunchPlistFileURL = v11->_relaunchPlistFileURL;
    v11->_relaunchPlistFileURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_fileManager, a4);
    v14 = _Block_copy(v10);
    jetsamPriorityHandler = v11->_jetsamPriorityHandler;
    v11->_jetsamPriorityHandler = v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.homed.HMDLaunchHandler", v16);
    handlerQueue = v11->_handlerQueue;
    v11->_handlerQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    registeredRelaunchClients = v11->_registeredRelaunchClients;
    v11->_registeredRelaunchClients = (NSMutableSet *)v19;

  }
  return v11;
}

- (void)removePersistentRelaunchRegistrationsIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDLaunchHandler handlerQueue](self, "handlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDLaunchHandler_removePersistentRelaunchRegistrationsIfNecessary__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)registerRelaunchClientWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[HMDLaunchHandler handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDLaunchHandler_registerRelaunchClientWithUUID___block_invoke;
  block[3] = &unk_24E79C268;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)deregisterRelaunchClientWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDLaunchHandler handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMDLaunchHandler_deregisterRelaunchClientWithUUID___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateOrRemoveRelaunchPlist
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  HMDLaunchHandler *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  HMDLaunchHandler *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[HMDLaunchHandler handlerQueue](self, "handlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLaunchHandler registeredRelaunchClients](self, "registeredRelaunchClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[HMDLaunchHandler fileManager](self, "fileManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLaunchHandler relaunchPlistFileURL](self, "relaunchPlistFileURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "fileExistsAtURL:", v24);

    if (!v25)
      return;
    -[HMDLaunchHandler fileManager](self, "fileManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLaunchHandler relaunchPlistFileURL](self, "relaunchPlistFileURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v28 = objc_msgSend(v26, "removeItemAtURL:error:", v27, &v40);
    v8 = v40;

    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v28)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLaunchHandler relaunchPlistFileURL](v30, "relaunchPlistFileURL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        v45 = 2112;
        v46 = v34;
        v35 = "%{public}@Successfully removed relaunch plist file at %@";
        v36 = v32;
        v37 = OS_LOG_TYPE_INFO;
        v38 = 22;
LABEL_15:
        _os_log_impl(&dword_2218F0000, v36, v37, v35, buf, v38);

      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLaunchHandler relaunchPlistFileURL](v30, "relaunchPlistFileURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v33;
      v45 = 2112;
      v46 = v34;
      v47 = 2112;
      v48 = v8;
      v35 = "%{public}@Failed to remove relaunch plist file at %@: %@";
      v36 = v32;
      v37 = OS_LOG_TYPE_ERROR;
      v38 = 32;
      goto LABEL_15;
    }

    objc_autoreleasePoolPop(v29);
    goto LABEL_17;
  }
  v41 = CFSTR("KeepAliveClients");
  -[HMDLaunchHandler registeredRelaunchClients](self, "registeredRelaunchClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDLaunchHandler fileManager](self, "fileManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLaunchHandler relaunchPlistFileURL](self, "relaunchPlistFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v11 = objc_msgSend(v9, "writeDictionary:toURL:error:", v8, v10, &v39);
  v12 = v39;

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLaunchHandler relaunchPlistFileURL](v14, "relaunchPlistFileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v17;
      v45 = 2112;
      v46 = v18;
      v19 = "%{public}@Successfully wrote relaunch plist file at %@";
      v20 = v16;
      v21 = OS_LOG_TYPE_INFO;
      v22 = 22;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v20, v21, v19, buf, v22);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLaunchHandler relaunchPlistFileURL](v14, "relaunchPlistFileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v17;
    v45 = 2112;
    v46 = v18;
    v47 = 2112;
    v48 = v12;
    v19 = "%{public}@Failed to write relaunch plist file at %@: %@";
    v20 = v16;
    v21 = OS_LOG_TYPE_ERROR;
    v22 = 32;
    goto LABEL_11;
  }

  objc_autoreleasePoolPop(v13);
LABEL_17:

}

- (void)_setJetsamPriorityElevated:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  int v8;
  void *v9;
  HMDLaunchHandler *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDLaunchHandler handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v3)
    v6 = 14;
  else
    v6 = 15;
  -[HMDLaunchHandler jetsamPriorityHandler](self, "jetsamPriorityHandler");
  v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = v7[2](v7, v6);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to set jetsam priority elevated to %@: %d", (uint8_t *)&v17, 0x1Cu);

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully set jetsam priority elevated to %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
}

- (NSURL)relaunchPlistFileURL
{
  return self->_relaunchPlistFileURL;
}

- (HMDFileManager)fileManager
{
  return self->_fileManager;
}

- (id)jetsamPriorityHandler
{
  return self->_jetsamPriorityHandler;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (NSMutableSet)registeredRelaunchClients
{
  return self->_registeredRelaunchClients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredRelaunchClients, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_jetsamPriorityHandler, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_relaunchPlistFileURL, 0);
}

void __53__HMDLaunchHandler_deregisterRelaunchClientWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Deregistering client for relaunch: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v11);

    objc_msgSend(*(id *)(a1 + 32), "_updateOrRemoveRelaunchPlist");
    objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      objc_msgSend(*(id *)(a1 + 32), "_setJetsamPriorityElevated:", 0);
  }
}

void __51__HMDLaunchHandler_registerRelaunchClientWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Registering client for relaunch: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(*(id *)(a1 + 32), "_updateOrRemoveRelaunchPlist");
    objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 == 1)
      objc_msgSend(*(id *)(a1 + 32), "_setJetsamPriorityElevated:", 1);
  }
}

void __68__HMDLaunchHandler_removePersistentRelaunchRegistrationsIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removing persistent relaunch registrations if necessary", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "registeredRelaunchClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    objc_msgSend(*(id *)(a1 + 32), "_updateOrRemoveRelaunchPlist");
}

uint64_t __24__HMDLaunchHandler_init__block_invoke()
{
  getpid();
  return memorystatus_control();
}

+ (HMDLaunchHandler)sharedHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMDLaunchHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHandler_onceToken_174184 != -1)
    dispatch_once(&sharedHandler_onceToken_174184, block);
  return (HMDLaunchHandler *)(id)sharedHandler_sharedHandler;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_174179 != -1)
    dispatch_once(&logCategory__hmf_once_t9_174179, &__block_literal_global_7_174180);
  return (id)logCategory__hmf_once_v10_174181;
}

void __31__HMDLaunchHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_174181;
  logCategory__hmf_once_v10_174181 = v0;

}

void __33__HMDLaunchHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = (uint64_t)v1;

}

@end
