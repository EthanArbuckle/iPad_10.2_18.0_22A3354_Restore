@implementation HAPPowerManager

- (HAPPowerManager)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  io_connect_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HAPPowerManager *v14;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HAPPowerManager;
  v2 = -[HAPPowerManager init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("HAPPowerManager", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v6;

    v8 = IORegisterForSystemPower(v2, (IONotificationPortRef *)v2 + 3, (IOServiceInterestCallback)PowerChangedCallback, (io_object_t *)v2 + 5);
    *((_DWORD *)v2 + 4) = v8;
    if (v8)
    {
      IONotificationPortSetDispatchQueue((IONotificationPortRef)objc_msgSend(v2, "systemPowerPort"), *((dispatch_queue_t *)v2 + 1));
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = v2;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error registering for system power", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
  }
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = (HAPPowerManager *)v2;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v16;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Initialized Power Manager.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  return v14;
}

- (void)dealloc
{
  unsigned int *p_systemPowerNotifier;
  IOReturn v4;
  IOReturn v5;
  void *v6;
  HAPPowerManager *v7;
  NSObject *v8;
  void *v9;
  IONotificationPort *systemPowerPort;
  io_connect_t systemPowerMgr;
  kern_return_t v12;
  kern_return_t v13;
  void *v14;
  HAPPowerManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HAPPowerManager *v19;
  NSObject *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  IOReturn v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_systemPowerNotifier = &self->_systemPowerNotifier;
  if (self->_systemPowerNotifier)
  {
    v4 = IODeregisterForSystemPower(&self->_systemPowerNotifier);
    if (v4)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1D17B7244]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v9;
        v25 = 1024;
        v26 = v5;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to deregister from system power with error: %d", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v6);
    }
    *p_systemPowerNotifier = 0;
  }
  systemPowerPort = self->_systemPowerPort;
  if (systemPowerPort)
  {
    IONotificationPortDestroy(systemPowerPort);
    self->_systemPowerPort = 0;
  }
  systemPowerMgr = self->_systemPowerMgr;
  if (systemPowerMgr)
  {
    v12 = IOServiceClose(systemPowerMgr);
    if (v12)
    {
      v13 = v12;
      v14 = (void *)MEMORY[0x1D17B7244]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        v25 = 1024;
        v26 = v13;
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to close power IO Service with error: %d", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v14);
    }
    self->_systemPowerMgr = 0;
  }
  v18 = (void *)MEMORY[0x1D17B7244]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Deallocating Power Manager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v22.receiver = v19;
  v22.super_class = (Class)HAPPowerManager;
  -[HAPPowerManager dealloc](&v22, sel_dealloc);
}

- (void)registerForSleepWake:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HAPPowerManager_registerForSleepWake_queue___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)deRegisterFromSleepWake:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HAPPowerManager_deRegisterFromSleepWake___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  uint64_t v5;
  void *v7;
  HAPPowerManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  IOReturn v21;
  IOReturn v22;
  void *v23;
  HAPPowerManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  _QWORD block[4];
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  IOReturn v38;
  uint64_t v39;

  v5 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17B7244](self, a2);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    StringForSystemPowerChangedMessage(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@System power changed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  switch((_DWORD)v5)
  {
    case 0xE0000270:
      goto LABEL_14;
    case 0xE0000320:
      v12 = 2;
      -[HAPPowerManager delegatesMap](v8, "delegatesMap", 0, a4);
      break;
    case 0xE0000280:
      v12 = 1;
      -[HAPPowerManager delegatesMap](v8, "delegatesMap", 1, a4);
      break;
    default:
      return;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "nextObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      -[HAPPowerManager delegatesMap](v8, "delegatesMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v16);
      v19 = objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        block[0] = v17;
        block[1] = 3221225472;
        block[2] = __53__HAPPowerManager_systemPowerChanged_notificationID___block_invoke;
        block[3] = &unk_1E894D3B0;
        v31 = v16;
        v32 = v12;
        dispatch_async(v19, block);

      }
      objc_msgSend(v14, "nextObject");
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v20;
    }
    while (v20);
  }

  a4 = v29;
  if (v28)
  {
LABEL_14:
    v21 = IOAllowPowerChange(-[HAPPowerManager systemPowerMgr](v8, "systemPowerMgr"), (intptr_t)a4);
    if (v21)
    {
      v22 = v21;
      v23 = (void *)MEMORY[0x1D17B7244]();
      v24 = v8;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        StringForSystemPowerChangedMessage(v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v26;
        v35 = 2112;
        v36 = v27;
        v37 = 1024;
        v38 = v22;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to allow for %@ with error: %d", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v23);
    }
  }
}

- (unsigned)systemPowerMgr
{
  return self->_systemPowerMgr;
}

- (IONotificationPort)systemPowerPort
{
  return self->_systemPowerPort;
}

- (unsigned)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (NSMapTable)delegatesMap
{
  return self->_delegatesMap;
}

- (void)setDelegatesMap:(id)a3
{
  objc_storeStrong((id *)&self->_delegatesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __53__HAPPowerManager_systemPowerChanged_notificationID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "devicePowerStateChanged:", *(_QWORD *)(a1 + 40));
}

void __43__HAPPowerManager_deRegisterFromSleepWake___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegatesMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __46__HAPPowerManager_registerForSleepWake_queue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegatesMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegatesMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

+ (HAPPowerManager)sharedInstance
{
  if (sharedInstance_onceToken_14639 != -1)
    dispatch_once(&sharedInstance_onceToken_14639, &__block_literal_global_14640);
  return (HAPPowerManager *)(id)sharedInstance_powerManager;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1)
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_5);
  return (id)logCategory__hmf_once_v8;
}

void __30__HAPPowerManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8;
  logCategory__hmf_once_v8 = v0;

}

void __33__HAPPowerManager_sharedInstance__block_invoke()
{
  HAPPowerManager *v0;
  void *v1;

  v0 = objc_alloc_init(HAPPowerManager);
  v1 = (void *)sharedInstance_powerManager;
  sharedInstance_powerManager = (uint64_t)v0;

}

@end
