@implementation HMDHomePrimaryResidentInitialReachabilityManager

- (HMDHomePrimaryResidentInitialReachabilityManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDHomePrimaryResidentInitialReachabilityManagerDataSource *v10;
  HMDHomePrimaryResidentInitialReachabilityManager *v11;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HMDHomePrimaryResidentInitialReachabilityManagerDataSource);
  v11 = -[HMDHomePrimaryResidentInitialReachabilityManager initWithUUID:workQueue:notificationCenter:dataSource:](self, "initWithUUID:workQueue:notificationCenter:dataSource:", v8, v7, v9, v10);

  return v11;
}

- (HMDHomePrimaryResidentInitialReachabilityManager)initWithUUID:(id)a3 workQueue:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDHomePrimaryResidentInitialReachabilityManager *v15;
  HMDHomePrimaryResidentInitialReachabilityManager *v16;
  void *v17;
  uint64_t v18;
  NSString *key;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDHomePrimaryResidentInitialReachabilityManager;
  v15 = -[HMDHomePrimaryResidentInitialReachabilityManager init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a6);
    objc_storeStrong((id *)&v16->_uuid, a3);
    objc_msgSend(v11, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("-primary-resident-reachability-state"));
    v18 = objc_claimAutoreleasedReturnValue();
    key = v16->_key;
    v16->_key = (NSString *)v18;

    objc_storeStrong((id *)&v16->_notificationCenter, a5);
    objc_storeStrong((id *)&v16->_workQueue, a4);
  }

  return v16;
}

- (NSNumber)initialReachability
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomePrimaryResidentInitialReachabilityManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDHomePrimaryResidentInitialReachabilityManager *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomePrimaryResidentInitialReachabilityManager persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDHomePrimaryResidentInitialReachabilityManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "residentDeviceManager");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "primaryResidentUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "residentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);

    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isReachable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v17;
        v21 = 2112;
        v22 = v7;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Returning reachability as nil, primary resident UUID: %@ not found in persisted state: %@", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v9 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Returning reachability as nil, no persisted state", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return (NSNumber *)v9;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHomePrimaryResidentInitialReachabilityManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomePrimaryResidentInitialReachabilityManager setHome:](self, "setHome:", v4);
  -[HMDHomePrimaryResidentInitialReachabilityManager notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v7);

  -[HMDHomePrimaryResidentInitialReachabilityManager notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleResidentDeviceManagerUpdateResidentNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v9);

  -[HMDHomePrimaryResidentInitialReachabilityManager notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleResidentDeviceEnabledStateChangeNotification_, CFSTR("HMDResidentDeviceEnabledStateChangedNotification"), 0);

  -[HMDHomePrimaryResidentInitialReachabilityManager notificationCenter](self, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), v12);

  objc_msgSend(v4, "residentDeviceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isCurrentDeviceAvailableResident") & 1) != 0)
  {
    -[HMDHomePrimaryResidentInitialReachabilityManager persistedState](self, "persistedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted state since current device this device is enabled as a resident", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDHomePrimaryResidentInitialReachabilityManager clearPersistedState](v16, "clearPersistedState");
    }
  }
  else
  {
    objc_msgSend(v13, "primaryResidentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePrimaryResidentInitialReachabilityManager handlePrimaryResidentUpdated:reason:](self, "handlePrimaryResidentUpdated:reason:", v19, CFSTR("Configure"));

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomePrimaryResidentInitialReachabilityManager uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDHomePrimaryResidentInitialReachabilityManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255855600))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (objc_msgSend(v8, "isCurrentDeviceAvailableResident"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling primary resident updated notification because current device is a resident", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    -[HMDHomePrimaryResidentInitialReachabilityManager handlePrimaryResidentUpdated:reason:](self, "handlePrimaryResidentUpdated:reason:", v16, CFSTR("Notification"));
  }

}

- (void)handleResidentDeviceManagerUpdateResidentNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDHomePrimaryResidentInitialReachabilityManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDResidentReachabilityState *v16;
  void *v17;
  char v18;
  HMDResidentReachabilityState *v19;
  void *v20;
  HMDResidentReachabilityState *v21;
  void *v22;
  int v23;
  void *v24;
  HMDHomePrimaryResidentInitialReachabilityManager *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  HMDResidentReachabilityState *v29;
  void *v30;
  HMDHomePrimaryResidentInitialReachabilityManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  HMDResidentReachabilityState *v38;
  __int16 v39;
  HMDResidentReachabilityState *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255855600))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (objc_msgSend(v8, "isCurrentDeviceAvailableResident"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling resident update notification because current device is a resident", (uint8_t *)&v35, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v8, "primaryResidentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", v16);

    if ((v18 & 1) != 0)
    {
      v19 = [HMDResidentReachabilityState alloc];
      -[HMDResidentReachabilityState identifier](v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HMDResidentReachabilityState initWithResidentDeviceIdentifier:isReachable:](v19, "initWithResidentDeviceIdentifier:isReachable:", v20, -[HMDResidentReachabilityState isReachable](v16, "isReachable"));

      -[HMDHomePrimaryResidentInitialReachabilityManager persistedState](self, "persistedState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqual:", v21);

      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v27)
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomePrimaryResidentInitialReachabilityManager persistedState](v25, "persistedState");
          v29 = (HMDResidentReachabilityState *)objc_claimAutoreleasedReturnValue();
          v35 = 138543874;
          v36 = v28;
          v37 = 2112;
          v38 = v29;
          v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Not handling resident update notification because peristed state: %@ is equal to state: %@", (uint8_t *)&v35, 0x20u);

        }
        objc_autoreleasePoolPop(v24);
      }
      else
      {
        if (v27)
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138543618;
          v36 = v34;
          v37 = 2112;
          v38 = v21;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Persisting primary resident reachability state: %@", (uint8_t *)&v35, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        -[HMDHomePrimaryResidentInitialReachabilityManager persistState:](v25, "persistState:", v21);
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v33;
        v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Not handling resident update notification because it is for non-primary resident device: %@", (uint8_t *)&v35, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
    }

  }
}

- (void)handleResidentDeviceEnabledStateChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomePrimaryResidentInitialReachabilityManager *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_msgSend(v7, "isCurrentDevice") & 1) != 0)
  {
    if (objc_msgSend(v7, "isEnabled"))
    {
      -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __103__HMDHomePrimaryResidentInitialReachabilityManager_handleResidentDeviceEnabledStateChangeNotification___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = self;
      dispatch_async(v8, block);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling resident enabled state change, because it is not for current device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDHomePrimaryResidentInitialReachabilityManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDHomePrimaryResidentInitialReachabilityManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomePrimaryResidentInitialReachabilityManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCurrentDeviceAvailableResident");

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not handling home removed notification because current device is a resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("HMDHomeNotificationKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification home removed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v5, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (v22)
    {
      -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](v17, "workQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__HMDHomePrimaryResidentInitialReachabilityManager_handleHomeRemovedNotification___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = v17;
      dispatch_async(v23, block);

    }
  }

}

- (void)handlePrimaryResidentUpdated:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HMDResidentReachabilityState *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDHomePrimaryResidentInitialReachabilityManager *v14;
  NSObject *v15;
  void *v16;
  HMDResidentReachabilityState *v17;
  void *v18;
  HMDResidentReachabilityState *v19;
  void *v20;
  HMDHomePrimaryResidentInitialReachabilityManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHomePrimaryResidentInitialReachabilityManager *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  HMDResidentReachabilityState *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomePrimaryResidentInitialReachabilityManager persistedState](self, "persistedState");
  v9 = (HMDResidentReachabilityState *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentReachabilityState residentDeviceIdentifier](v9, "residentDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v16;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping primary resident update for reason: %@, because resident device identifier found in peristed state: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else if (v6)
  {
    v17 = [HMDResidentReachabilityState alloc];
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDResidentReachabilityState initWithResidentDeviceIdentifier:isReachable:](v17, "initWithResidentDeviceIdentifier:isReachable:", v18, objc_msgSend(v6, "isReachable"));

    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v23;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Persisting primary resident reachability state for reason %@:%@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDHomePrimaryResidentInitialReachabilityManager persistState:](v21, "persistState:", v19);

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v27;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted reachability state for reason: %@ because primary resident is nil", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    -[HMDHomePrimaryResidentInitialReachabilityManager clearPersistedState](v25, "clearPersistedState");
  }

}

- (HMDResidentReachabilityState)persistedState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HMDHomePrimaryResidentInitialReachabilityManager *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomePrimaryResidentInitialReachabilityManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePrimaryResidentInitialReachabilityManager key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataValueFromNoBackupStoreWithKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v13;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode primary resident reachability state: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return (HMDResidentReachabilityState *)v7;
}

- (void)persistState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomePrimaryResidentInitialReachabilityManager *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    -[HMDHomePrimaryResidentInitialReachabilityManager dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePrimaryResidentInitialReachabilityManager key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistDataValueToNoBackupStore:withKey:", v6, v9);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist primary resident reachability state, encoding failed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)clearPersistedState
{
  NSObject *v3;
  void *v4;
  id v5;

  -[HMDHomePrimaryResidentInitialReachabilityManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomePrimaryResidentInitialReachabilityManager dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomePrimaryResidentInitialReachabilityManager key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistDataValueToNoBackupStore:withKey:", 0, v4);

}

- (HMDHomePrimaryResidentInitialReachabilityManagerDataSource)dataSource
{
  return (HMDHomePrimaryResidentInitialReachabilityManagerDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

uint64_t __82__HMDHomePrimaryResidentInitialReachabilityManager_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted reachability state because home was removed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "clearPersistedState");
}

uint64_t __103__HMDHomePrimaryResidentInitialReachabilityManager_handleResidentDeviceEnabledStateChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted reachability state because current device became resident", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "clearPersistedState");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_230044 != -1)
    dispatch_once(&logCategory__hmf_once_t4_230044, &__block_literal_global_230045);
  return (id)logCategory__hmf_once_v5_230046;
}

void __63__HMDHomePrimaryResidentInitialReachabilityManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_230046;
  logCategory__hmf_once_v5_230046 = v0;

}

@end
