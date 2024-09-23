@implementation HMDCompanionManager

- (HMDCompanionManager)init
{
  HMDCompanionManager *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  void *v8;
  uint64_t v9;
  HMDIDSService *service;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDCompanionManager;
  v2 = -[HMDCompanionManager init](&v12, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "proxyService");
    v9 = objc_claimAutoreleasedReturnValue();
    service = v2->_service;
    v2->_service = (HMDIDSService *)v9;

    -[HMDIDSService addDelegate:queue:](v2->_service, "addDelegate:queue:", v2, v2->_queue);
    -[HMDCompanionManager __initializeConnectedDevices](v2, "__initializeConnectedDevices");
  }
  return v2;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompanionManager companion](self, "companion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Companion"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)__initializeConnectedDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDCompanionManager service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "isConnected", (_QWORD)v12))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  __HMDCompanionManagerUpdateWithConnectedDevices(self, v5);
}

- (HMDDevice)companion
{
  os_unfair_lock_s *p_lock;
  HMDDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_companion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDCompanionManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCompanionManager service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Devices changed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v19, "isConnected", (_QWORD)v20))
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    __HMDCompanionManagerUpdateWithConnectedDevices(v10, v13);
  }

}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDCompanionManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCompanionManager service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Connected devices changed: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    __HMDCompanionManagerUpdateWithConnectedDevices(v10, v7);
  }

}

- (HMDIDSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)sharedManager
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productPlatform");

  if (v4 == 3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HMDCompanionManager_sharedManager__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedManager_onceToken_66906 != -1)
      dispatch_once(&sharedManager_onceToken_66906, block);
    v5 = (id)sharedManager_companionManager;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)isCompatibleCompanionDevice:(id)a3
{
  return 0;
}

+ (id)shortDescription
{
  return CFSTR("Companion Manager");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_66898 != -1)
    dispatch_once(&logCategory__hmf_once_t6_66898, &__block_literal_global_66899);
  return (id)logCategory__hmf_once_v7_66900;
}

void __34__HMDCompanionManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_66900;
  logCategory__hmf_once_v7_66900 = v0;

}

void __36__HMDCompanionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_companionManager;
  sharedManager_companionManager = (uint64_t)v1;

}

@end
