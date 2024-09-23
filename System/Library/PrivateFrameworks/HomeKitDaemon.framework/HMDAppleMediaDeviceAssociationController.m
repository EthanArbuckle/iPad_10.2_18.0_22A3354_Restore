@implementation HMDAppleMediaDeviceAssociationController

- (HMDAppleMediaDeviceAssociationController)initWithHome:(id)a3 accessory:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAppleMediaDeviceAssociationController *v25;
  HMDAppleMediaDeviceAssociationController *v27;
  SEL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v11 = v10;
  objc_msgSend(v8, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  objc_msgSend(v8, "residentSyncManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  objc_msgSend(v8, "backingStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  objc_msgSend(v8, "backingStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v9)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  objc_msgSend(v9, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "workQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "residentSyncManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backingStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDAppleMediaDeviceAssociationController initWithQueue:homeUUID:accessoryUUID:residentSyncManager:backingStore:notificationCenter:dataSource:](self, "initWithQueue:homeUUID:accessoryUUID:residentSyncManager:backingStore:notificationCenter:dataSource:", v19, v20, v21, v22, v23, v24, v11);

    return v25;
  }
LABEL_17:
  v27 = (HMDAppleMediaDeviceAssociationController *)_HMFPreconditionFailure();
  return -[HMDAppleMediaDeviceAssociationController initWithQueue:homeUUID:accessoryUUID:residentSyncManager:backingStore:notificationCenter:dataSource:](v27, v28, v29, v30, v31, v32, v33, v34, v35);
}

- (HMDAppleMediaDeviceAssociationController)initWithQueue:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 residentSyncManager:(id)a6 backingStore:(id)a7 notificationCenter:(id)a8 dataSource:(id)a9
{
  id v16;
  id v17;
  HMDAppleMediaDeviceAssociationController *v18;
  HMDAppleMediaDeviceAssociationController *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HMDAppleMediaDeviceAssociationController;
  v18 = -[HMDAppleMediaDeviceAssociationController init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_homeUUID, a4);
    objc_storeStrong((id *)&v19->_accessoryUUID, a5);
    objc_storeStrong((id *)&v19->_residentSyncManager, a6);
    objc_storeStrong((id *)&v19->_backingStore, a7);
    objc_storeStrong((id *)&v19->_notificationCenter, a8);
    objc_storeStrong((id *)&v19->_dataSource, a9);
  }

  return v19;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDAppleMediaDeviceAssociationController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaDeviceAssociationController homeUUID](v10, "homeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaDeviceAssociationController accessoryUUID](v10, "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@ accessory: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAppleMediaDeviceAssociationController _registerForMessages:messageDispatcher:](v10, "_registerForMessages:messageDispatcher:", v6, v8);
  -[HMDAppleMediaDeviceAssociationController _registerForNotifications:](v10, "_registerForNotifications:", v6);
  -[HMDAppleMediaDeviceAssociationController queue](v10, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDAppleMediaDeviceAssociationController_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v10;
  dispatch_async(v15, block);

}

- (void)_registerForMessages:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaDeviceAssociationController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    v18 = v11;
    v19 = 2112;
    v20 = CFSTR("HMDAM.p");
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Register for message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRoles:", objc_msgSend(v12, "roles") | 8);
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("HMDAM.p"), v9, v15, sel__handleHMDAppleMediaDeviceAssociationPushMessage_);
}

- (void)_registerForNotifications:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaDeviceAssociationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Register for notifications", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaDeviceAssociationController notificationCenter](v6, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerResolved"), 0);

  -[HMDAppleMediaDeviceAssociationController notificationCenter](v6, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__handleAppleAccountManagerResolvedNotification_, CFSTR("HMDAppleAccountManagerResolved"), 0);

  -[HMDAppleMediaDeviceAssociationController notificationCenter](v6, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", v6, CFSTR("HMDDeviceUpdatedNotification"), 0);

  -[HMDAppleMediaDeviceAssociationController notificationCenter](v6, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__handleDeviceUpdatedNotification_, CFSTR("HMDDeviceUpdatedNotification"), 0);

  -[HMDAppleMediaDeviceAssociationController notificationCenter](v6, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:name:object:", v6, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

  -[HMDAppleMediaDeviceAssociationController notificationCenter](v6, "notificationCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel__handlePrimaryChange_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v15);

}

- (void)_handleAppleAccountManagerResolvedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaDeviceAssociationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaDeviceAssociationController queue](v6, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__HMDAppleMediaDeviceAssociationController__handleAppleAccountManagerResolvedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v10, block);

}

- (void)_handleDeviceUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaDeviceAssociationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  HMDAppleMediaDeviceAssociationController *v20;
  NSObject *v21;
  void *v22;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  -[HMDAppleMediaDeviceAssociationController dataSource](v6, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && v14
    && (objc_msgSend(v14, "identifier"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "identifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "hmf_isEqualToUUID:", v16),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    -[HMDAppleMediaDeviceAssociationController queue](v6, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__HMDAppleMediaDeviceAssociationController__handleDeviceUpdatedNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v6;
    dispatch_async(v18, block);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Not the current device, do not process", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)handleTransactionObjectUpdated
{
  void *v3;
  HMDAppleMediaDeviceAssociationController *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Handle transaction object updated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaDeviceAssociationController queue](v4, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDAppleMediaDeviceAssociationController_handleTransactionObjectUpdated__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (void)_handlePrimaryChange:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaDeviceAssociationController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handle notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaDeviceAssociationController queue](v6, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDAppleMediaDeviceAssociationController__handlePrimaryChange___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v10, block);

}

- (void)_process
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  HMDAppleMediaDeviceAssociationController *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAppleMediaDeviceAssociationController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "homeHasConfirmedPrimaryResident");

  if ((v5 & 1) != 0)
  {
    if (-[HMDAppleMediaDeviceAssociationController _currentDeviceHasDeviceAddress](self, "_currentDeviceHasDeviceAddress"))
    {
      -[HMDAppleMediaDeviceAssociationController _pushDeviceAddressIfNeeded](self, "_pushDeviceAddressIfNeeded");
      return;
    }
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
      v10 = "%{public}@Do not process: current device has no IDS address";
      goto LABEL_8;
    }
  }
  else
  {
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
      v10 = "%{public}@Do not process: home has no primary";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v6);
}

- (BOOL)_currentDeviceHasDeviceAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[HMDAppleMediaDeviceAssociationController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "deviceAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "deviceAddress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idsIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v3, "deviceAddress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "idsDestination");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 != 0;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_pushDeviceAddressIfNeeded
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke;
  v4[3] = &unk_24E782920;
  objc_copyWeak(&v5, &location);
  -[HMDAppleMediaDeviceAssociationController _shouldPushDeviceAddressWithCompletion:](self, "_shouldPushDeviceAddressWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_shouldPushDeviceAddressWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  HMDAppleMediaDeviceAssociationController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAppleMediaDeviceAssociationController *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, _QWORD);
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDAppleMediaDeviceAssociationController _statusBusy](self, "_statusBusy"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Controller busy: do not push", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v4[2](v4, 0);
  }
  else
  {
    -[HMDAppleMediaDeviceAssociationController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (objc_msgSend(v11, "deviceAddress"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      objc_initWeak((id *)buf, self);
      -[HMDAppleMediaDeviceAssociationController backingStore](self, "backingStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __83__HMDAppleMediaDeviceAssociationController__shouldPushDeviceAddressWithCompletion___block_invoke;
      v19[3] = &unk_24E78C1B0;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v4;
      v20 = v11;
      objc_msgSend(v14, "performBlock:", v19);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Current device has no IDS address: do not push", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v4[2](v4, 0);
    }

  }
}

- (void)_pushDeviceAddress
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  HMDAppleMediaDeviceAssociationController *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDDeviceAssociationInfoProto *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDDeviceAssociationInfoProto *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  HMDAppleMediaDeviceAssociationController *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAppleMediaDeviceAssociationController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCurrentDeviceConfirmedPrimary"))
  {
    -[HMDAppleMediaDeviceAssociationController _handlePrimaryResidentDeviceAddressUpdate](self, "_handlePrimaryResidentDeviceAddressUpdate");
  }
  else
  {
    v5 = -[HMDAppleMediaDeviceAssociationController _statusBusy](self, "_statusBusy");
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Controller is busy: do not send push message", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      if (v9)
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaDeviceAssociationController messageTargetUUID](v7, "messageTargetUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v11;
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending remote message with target: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDAppleMediaDeviceAssociationController _setStatusBusy:](v7, "_setStatusBusy:", 1);
      objc_msgSend(v4, "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x24BE3F1B8]);
      -[HMDAppleMediaDeviceAssociationController messageTargetUUID](v7, "messageTargetUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

      v18 = [HMDDeviceAssociationInfoProto alloc];
      -[HMDAppleMediaDeviceAssociationController accessoryUUID](v7, "accessoryUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "idsIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "idsDestination");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDDeviceAssociationInfoProto initWithAccessoryUUID:idsIdentifier:idsDestination:](v18, "initWithAccessoryUUID:idsIdentifier:idsDestination:", v19, v20, v21);

      v33 = CFSTR("HMDAppleMediaDeviceAssociationInfoProtoKey");
      -[HMDDeviceAssociationInfoProto protoData](v22, "protoData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1D0]), "initWithName:destination:payload:", CFSTR("HMDAM.p"), v17, v24);
      objc_initWeak((id *)buf, v25);
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __62__HMDAppleMediaDeviceAssociationController__pushDeviceAddress__block_invoke;
      v30 = &unk_24E798D90;
      objc_copyWeak(&v32, (id *)buf);
      v31 = v7;
      objc_msgSend(v25, "setResponseHandler:", &v27);
      -[HMDAppleMediaDeviceAssociationController residentSyncManager](v7, "residentSyncManager", v27, v28, v29, v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "performResidentRequest:options:", v25, 0);

      -[HMDAppleMediaDeviceAssociationController _startRetryTimer](v7, "_startRetryTimer");
      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (void)_startRetryTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  HMDAppleMediaDeviceAssociationController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAppleMediaDeviceAssociationController backoffTimer](self, "backoffTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDAppleMediaDeviceAssociationController backoffTimer](self, "backoffTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suspend");

    -[HMDAppleMediaDeviceAssociationController setBackoffTimer:](self, "setBackoffTimer:", 0);
  }
  v6 = -[HMDAppleMediaDeviceAssociationController nextInterval](self, "nextInterval");
  v8 = v7;
  v9 = (void *)MEMORY[0x227676638](v6);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v12;
    v20 = 2048;
    v21 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting timer with interval: %f", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAppleMediaDeviceAssociationController timerWithTimeInterval:options:](v10, "timerWithTimeInterval:options:", 8, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceAssociationController setBackoffTimer:](v10, "setBackoffTimer:", v13);

  -[HMDAppleMediaDeviceAssociationController backoffTimer](v10, "backoffTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v10);

  -[HMDAppleMediaDeviceAssociationController queue](v10, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceAssociationController backoffTimer](v10, "backoffTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegateQueue:", v15);

  -[HMDAppleMediaDeviceAssociationController backoffTimer](v10, "backoffTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

}

- (void)_handlePrimaryResidentDeviceAddressUpdate
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  HMDAppleMediaDeviceAssociationController *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDAppleMediaDeviceAssociationController _statusBusy](self, "_statusBusy");
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Controller is busy: do not update primary locally", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident: update device IDS address locally", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAppleMediaDeviceAssociationController _setStatusBusy:](v6, "_setStatusBusy:", 1);
    -[HMDAppleMediaDeviceAssociationController dataSource](v6, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaDeviceAssociationController accessoryUUID](v6, "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "idsDestination");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke;
    v17[3] = &unk_24E79BD80;
    v17[4] = v6;
    -[HMDAppleMediaDeviceAssociationController _updateIdsAddressWithAccessoryUUID:idsIdentifier:idsDestination:completion:](v6, "_updateIdsAddressWithAccessoryUUID:idsIdentifier:idsDestination:completion:", v14, v15, v16, v17);

  }
}

- (void)_updateIdsAddressWithAccessoryUUID:(id)a3 idsIdentifier:(id)a4 idsDestination:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HMDAppleMediaDeviceAssociationController backingStore](self, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __119__HMDAppleMediaDeviceAssociationController__updateIdsAddressWithAccessoryUUID_idsIdentifier_idsDestination_completion___block_invoke;
  v20[3] = &unk_24E796798;
  objc_copyWeak(&v25, &location);
  v16 = v10;
  v21 = v16;
  v17 = v13;
  v24 = v17;
  v18 = v11;
  v22 = v18;
  v19 = v12;
  v23 = v19;
  objc_msgSend(v15, "performBlock:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_handleHMDAppleMediaDeviceAssociationPushMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAppleMediaDeviceAssociationController *v9;

  v4 = a3;
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_deviceAssociationInfoFromProtoData:(id)a3
{
  id v4;
  NSObject *v5;
  HMDDeviceAssociationInfoProto *v6;
  HMDDeviceAssociationInfoProto *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HMDAppleMediaDeviceAssociationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDDeviceAssociationInfoProto initWithProtoData:]([HMDDeviceAssociationInfoProto alloc], "initWithProtoData:", v4);
  if (!v6)
    goto LABEL_7;
  -[HMDDeviceAssociationInfoProto accessoryUUID](v6, "accessoryUUID");
  v7 = (HMDDeviceAssociationInfoProto *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDDeviceAssociationInfoProto idsIdentifier](v6, "idsIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[HMDDeviceAssociationInfoProto idsDestination](v6, "idsDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v7 = v6;
        goto LABEL_8;
      }
    }
    else
    {

    }
LABEL_7:
    v7 = 0;
  }
LABEL_8:

  return v7;
}

- (BOOL)_statusBusy
{
  HMDAppleMediaDeviceAssociationController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_busy;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setStatusBusy:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_busy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDAppleMediaDeviceAssociationController *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAppleMediaDeviceAssociationController backoffTimer](self, "backoffTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Backoff timer fired, retry", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAppleMediaDeviceAssociationController backoffTimer](v7, "backoffTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suspend");

    -[HMDAppleMediaDeviceAssociationController setBackoffTimer:](v7, "setBackoffTimer:", 0);
    -[HMDAppleMediaDeviceAssociationController queue](v7, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__HMDAppleMediaDeviceAssociationController_timerDidFire___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v7;
    dispatch_async(v13, block);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Wrong timer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (double)nextInterval
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;

  objc_msgSend(&unk_24E970DC0, "objectAtIndexedSubscript:", -[HMDAppleMediaDeviceAssociationController timerIntervalIndex](self, "timerIntervalIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = -[HMDAppleMediaDeviceAssociationController timerIntervalIndex](self, "timerIntervalIndex");
  if (v6 < objc_msgSend(&unk_24E970DC0, "count") - 1)
    -[HMDAppleMediaDeviceAssociationController setTimerIntervalIndex:](self, "setTimerIntervalIndex:", -[HMDAppleMediaDeviceAssociationController timerIntervalIndex](self, "timerIntervalIndex") + 1);
  return v5;
}

- (id)mkfAppleMediaAccessoryWithModelIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  HMDAppleMediaDeviceAssociationController *v10;
  SEL v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[HMDAppleMediaDeviceAssociationController mkfAppleMediaModelFinder](self, "mkfAppleMediaModelFinder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HMDAppleMediaDeviceAssociationController mkfAppleMediaModelFinder](self, "mkfAppleMediaModelFinder");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v7)[2](v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[HMCContext findAppleMediaAccessoryWithModelID:](HMCContext, "findAppleMediaAccessoryWithModelID:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v8;
  }
  else
  {
    v10 = (HMDAppleMediaDeviceAssociationController *)_HMFPreconditionFailure();
    return -[HMDAppleMediaDeviceAssociationController logIdentifier](v10, v11);
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaDeviceAssociationController homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMDResidentSyncManager)residentSyncManager
{
  return (HMDResidentSyncManager *)objc_getProperty(self, a2, 40, 1);
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAppleMediaDeviceAssociationControllerDataSource)dataSource
{
  return (HMDAppleMediaDeviceAssociationControllerDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (HMDTimerProvider)timerProvider
{
  return (HMDTimerProvider *)objc_loadWeakRetained((id *)&self->_timerProvider);
}

- (void)setTimerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_timerProvider, a3);
}

- (HMFTimer)backoffTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBackoffTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)timerIntervalIndex
{
  return self->_timerIntervalIndex;
}

- (void)setTimerIntervalIndex:(int64_t)a3
{
  self->_timerIntervalIndex = a3;
}

- (id)mkfAppleMediaModelFinder
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setMkfAppleMediaModelFinder:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mkfAppleMediaModelFinder, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_residentSyncManager, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __57__HMDAppleMediaDeviceAssociationController_timerDidFire___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process");
}

void __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataForKey:", CFSTR("HMDAppleMediaDeviceAssociationInfoProtoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_deviceAssociationInfoFromProtoData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "accessoryUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling remote message: %@ accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(*(id *)(a1 + 40), "residentSyncManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_47;
      v23[3] = &unk_24E795E50;
      v12 = *(_QWORD *)(a1 + 32);
      v23[4] = *(_QWORD *)(a1 + 40);
      v13 = v3;
      v24 = v13;
      objc_msgSend(v11, "interceptRemoteResidentRequest:proceed:", v12, v23);

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v20;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device association info object", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      v21 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "respondWithError:", v22);

      v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing proto data from the message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v19 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "respondWithError:", v13);
  }

}

void __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Intercepting remote resident request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessoryUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "idsDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_48;
  v13[3] = &unk_24E79BCC8;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v12 = v3;
  objc_msgSend(v8, "_updateIdsAddressWithAccessoryUUID:idsIdentifier:idsDestination:completion:", v9, v10, v11, v13);

}

void __93__HMDAppleMediaDeviceAssociationController__handleHMDAppleMediaDeviceAssociationPushMessage___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Remote message update failed: error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Remote message update succeeded", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }

}

void __119__HMDAppleMediaDeviceAssociationController__updateIdsAddressWithAccessoryUUID_idsIdentifier_idsDestination_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  void (*v21)(uint64_t, id);
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "mkfAppleMediaAccessoryWithModelIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "resident");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = WeakRetained;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v30 = v9;
        v31 = 2112;
        v32 = v10;
        v33 = 2112;
        v34 = v11;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Update IDS identifier: %@ destination: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v4, "setIdsIdentifier:", *(_QWORD *)(a1 + 40));
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "resident");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIdsIdentifier:", v12);

      objc_msgSend(v4, "setIdsDestination:", *(_QWORD *)(a1 + 48));
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v4, "resident");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIdsDestination:", v14);

      objc_msgSend(v7, "backingStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v18 = objc_msgSend(v17, "save:", &v28);
      v19 = v28;

      v20 = *(_QWORD *)(a1 + 56);
      v21 = *(void (**)(uint64_t, id))(v20 + 16);
      if (v18)
        v22 = 0;
      else
        v22 = v19;
      goto LABEL_12;
    }
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = WeakRetained;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@MKF models do not exist for media accessory and resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(v24, "_setStatusBusy:", 0);
  v27 = *(_QWORD *)(a1 + 56);
  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = *(void (**)(uint64_t, id))(v27 + 16);
    v20 = v27;
    v22 = v19;
LABEL_12:
    v21(v20, v22);

  }
}

void __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke_2;
  v7[3] = &unk_24E79C268;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __85__HMDAppleMediaDeviceAssociationController__handlePrimaryResidentDeviceAddressUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Primary local update failed: error %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "_startRetryTimer");
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Primary local update succeeded", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_setStatusBusy:", 0);
}

void __62__HMDAppleMediaDeviceAssociationController__pushDeviceAddress__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "_statusBusy") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Controller status set to idle prematurely", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v5;
      v18 = "%{public}@Remote message %@ failed with error: %@";
      v19 = v15;
      v20 = OS_LOG_TYPE_ERROR;
      v21 = 32;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v19, v20, v18, (uint8_t *)&v22, v21);

    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    v18 = "%{public}@Remote message %@ succeeded";
    v19 = v15;
    v20 = OS_LOG_TYPE_INFO;
    v21 = 22;
    goto LABEL_10;
  }

  objc_autoreleasePoolPop(v12);
  objc_msgSend(*(id *)(a1 + 32), "_setStatusBusy:", 0);

}

void __83__HMDAppleMediaDeviceAssociationController__shouldPushDeviceAddressWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  void (*v34)(void);
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mkfAppleMediaAccessoryWithModelIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (objc_msgSend(v4, "resident"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v30 = MEMORY[0x227676638]();
    v31 = WeakRetained;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v33;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@No MKF model: do not push", buf, 0xCu);

    }
    v29 = (void *)v30;
    goto LABEL_17;
  }
  objc_msgSend(v4, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!HMFEqualObjects())
    goto LABEL_20;
  objc_msgSend(v4, "idsDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "idsDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!HMFEqualObjects())
  {
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  objc_msgSend(v4, "resident");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "idsIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceAddress");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "idsIdentifier");
  v45 = (void *)v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!HMFEqualObjects())
  {

    goto LABEL_19;
  }
  objc_msgSend(v4, "resident");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "idsDestination");
  v40 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceAddress");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "idsDestination");
  v42 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = HMFEqualObjects();

  if (v43)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = WeakRetained;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idsIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idsDestination");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v19;
      v49 = 2112;
      v50 = v20;
      v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@IDS identifier: %@ destination: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v17, "backoffTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "backoffTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "suspend");

      v23 = objc_msgSend(v17, "setBackoffTimer:", 0);
    }
    v25 = MEMORY[0x227676638](v23);
    v26 = v17;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@MKF model IDS address already set: do not push", buf, 0xCu);

    }
    v29 = (void *)v25;
LABEL_17:
    objc_autoreleasePoolPop(v29);
    v34 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_24;
  }
LABEL_21:
  v35 = (void *)MEMORY[0x227676638]();
  v36 = WeakRetained;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v38;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@MKF model IDS not set: should push", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v35);
  v34 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_24:
  v34();

}

void __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke_2;
  v5[3] = &unk_24E7968C8;
  v6 = a2;
  v5[4] = WeakRetained;
  dispatch_async(v4, v5);

}

uint64_t __70__HMDAppleMediaDeviceAssociationController__pushDeviceAddressIfNeeded__block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_pushDeviceAddress");
  return result;
}

uint64_t __65__HMDAppleMediaDeviceAssociationController__handlePrimaryChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process");
}

uint64_t __74__HMDAppleMediaDeviceAssociationController_handleTransactionObjectUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process");
}

uint64_t __77__HMDAppleMediaDeviceAssociationController__handleDeviceUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process");
}

uint64_t __91__HMDAppleMediaDeviceAssociationController__handleAppleAccountManagerResolvedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process");
}

uint64_t __80__HMDAppleMediaDeviceAssociationController_configureWithHome_messageDispatcher___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_79459 != -1)
    dispatch_once(&logCategory__hmf_once_t39_79459, &__block_literal_global_79460);
  return (id)logCategory__hmf_once_v40_79461;
}

void __55__HMDAppleMediaDeviceAssociationController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40_79461;
  logCategory__hmf_once_v40_79461 = v0;

}

@end
