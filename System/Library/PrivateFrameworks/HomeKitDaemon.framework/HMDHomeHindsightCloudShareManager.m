@implementation HMDHomeHindsightCloudShareManager

- (HMDHomeHindsightCloudShareManager)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDatabaseZoneManager *v12;
  void *v13;
  HMDDatabaseZoneManager *v14;
  void *v15;
  void *v16;
  HMDHomeKitVersion *v17;
  id v18;
  HMDHomeHindsightCloudShareManager *v19;
  HMDHomeHindsightCloudShareManager *v21;
  SEL v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v6, "spiClientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMVConfigurationZoneUUIDForHomeIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      HMVConfigurationZoneNameForZoneUUID();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [HMDDatabaseZoneManager alloc];
      +[HMDDatabase hindsightDatabase](HMDDatabase, "hindsightDatabase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:messageTargetUUID:workQueue:](v12, "initWithDatabase:zoneName:home:messageTargetUUID:workQueue:", v13, v11, v6, v10, v8);

      -[HMDDatabaseZoneManager defaultConfiguration](v14, "defaultConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v16, "setZoneOwner:", objc_msgSend(v6, "isOwnerUser"));
      v17 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("11.1"));
      objc_msgSend(v16, "setMinimumHomeKitVersion:", v17);

      objc_msgSend(v16, "setShouldCreateZone:", 0);
      v18 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
      objc_msgSend(v18, "setShouldSkipCloudPulls:", 1);
      objc_msgSend(v16, "setCloudZoneConfiguration:", v18);
      -[HMDDatabaseZoneManager setDefaultConfiguration:](v14, "setDefaultConfiguration:", v16);
      v19 = -[HMDHomeHindsightCloudShareManager initWithUUID:workQueue:zoneManager:](self, "initWithUUID:workQueue:zoneManager:", v10, v8, v14);

      return v19;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v21 = (HMDHomeHindsightCloudShareManager *)_HMFPreconditionFailure();
  return -[HMDHomeHindsightCloudShareManager initWithUUID:workQueue:zoneManager:](v21, v22, v23, v24, v25);
}

- (HMDHomeHindsightCloudShareManager)initWithUUID:(id)a3 workQueue:(id)a4 zoneManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeHindsightCloudShareManager *v12;
  uint64_t v13;
  NSUUID *UUID;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *logIdentifier;
  HMDHomeHindsightCloudShareManager *result;
  HMDHomeHindsightCloudShareManager *v20;
  SEL v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v9)
  {
LABEL_9:
    v20 = (HMDHomeHindsightCloudShareManager *)_HMFPreconditionFailure();
    -[HMDHomeHindsightCloudShareManager configure](v20, v21);
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDHomeHindsightCloudShareManager;
  v12 = -[HMDHomeHindsightCloudShareManager init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_workQueue, a4);
    objc_storeStrong((id *)&v12->_zoneManager, a5);
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "zoneName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@"), v8, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v12->_logIdentifier;
    v12->_logIdentifier = (NSString *)v17;

  }
  return v12;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configure");

  -[HMDHomeHindsightCloudShareManager _startZoneManager](self, "_startZoneManager");
}

- (void)synchronize
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDHomeHindsightCloudShareManager_synchronize__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)removeZones
{
  NSObject *v3;
  void *v4;
  HMDHomeHindsightCloudShareManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing HomeKit events zone", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDHomeHindsightCloudShareManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "remove");

}

- (void)_synchronize
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDHomeHindsightCloudShareManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Synchronizing hindsight cloud share manager by performing cloud pull", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Synchronizing for hindsight cloud share manager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performCloudPullWithOptions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE6B628];
    -[HMDHomeHindsightCloudShareManager workQueue](v7, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "schedulerWithDispatchQueue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reschedule:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__HMDHomeHindsightCloudShareManager__synchronize__block_invoke;
    v19[3] = &unk_24E798920;
    v19[4] = v7;
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v19);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing hindsight cloud share manager by starting zone manager", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDHomeHindsightCloudShareManager _startZoneManager](v7, "_startZoneManager");
  }

}

- (void)_startZoneManager
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldCreateZone:", objc_msgSend(v7, "isEventLogEnabled"));

  -[HMDHomeHindsightCloudShareManager zoneManager](self, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startWithConfiguration:", v9);

}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isAllowedToAccessActivityHistory");
  return (char)v6;
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isOwner");
  return (char)v6;
}

- (void)zoneManagerDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeHindsightCloudShareManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeHindsightCloudShareManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@HomeKit events zone manager started", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startUp");

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __49__HMDHomeHindsightCloudShareManager__synchronize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished performing cloud pull for synchronization", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "_startZoneManager");

}

uint64_t __48__HMDHomeHindsightCloudShareManager_synchronize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronize");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_236803 != -1)
    dispatch_once(&logCategory__hmf_once_t5_236803, &__block_literal_global_236804);
  return (id)logCategory__hmf_once_v6_236805;
}

void __48__HMDHomeHindsightCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_236805;
  logCategory__hmf_once_v6_236805 = v0;

}

@end
