@implementation HMDHomePersonManager

- (HMDHomePersonManager)initWithHome:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeAIHomePersonDataInterface *v15;
  int v16;
  HMDHomeAIHomePersonDataInterface *v17;
  void *v18;
  HMDHomeKitPersonDataInterface *v19;
  void *v20;
  HMDHomeKitPersonDataInterface *v21;
  HMDRemotePersonDataMessenger *v22;
  void *v23;
  HMDDatabaseZoneManager *v24;
  void *v25;
  HMDDatabaseZoneManager *v26;
  void *v27;
  void *v28;
  HMDHomeKitVersion *v29;
  HMDHomePersonManager *v30;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CBA560];
  v11 = a4;
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personManagerUUIDFromHomeUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v15 = (HMDHomeAIHomePersonDataInterface *)objc_claimAutoreleasedReturnValue();
  if (!-[HMDHomeAIHomePersonDataInterface supportsFaceClassification](v15, "supportsFaceClassification"))
    goto LABEL_4;
  v16 = objc_msgSend(v8, "isOwnerUser");

  if (v16)
  {
    v17 = [HMDHomeAIHomePersonDataInterface alloc];
    objc_msgSend(v8, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDHomeAIHomePersonDataInterface initWithPersonManagerUUID:homeUUID:workQueue:](v17, "initWithPersonManagerUUID:homeUUID:workQueue:", v13, v18, v9);

    objc_msgSend(v14, "addObject:", v15);
LABEL_4:

  }
  v19 = [HMDHomeKitPersonDataInterface alloc];
  objc_msgSend(v8, "msgDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDHomeKitPersonDataInterface initWithUUID:messageDispatcher:workQueue:](v19, "initWithUUID:messageDispatcher:workQueue:", v13, v20, v9);
  objc_msgSend(v14, "addObject:", v21);

  v22 = -[HMDRemotePersonDataMessenger initWithUUID:home:workQueue:]([HMDRemotePersonDataMessenger alloc], "initWithUUID:home:workQueue:", v13, v8, v9);
  objc_msgSend(v14, "addObject:", v22);

  +[HMDHomePersonManager zoneNameForZoneUUID:](HMDHomePersonManager, "zoneNameForZoneUUID:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [HMDDatabaseZoneManager alloc];
  +[HMDDatabase cameraClipsDatabase](HMDDatabase, "cameraClipsDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:messageTargetUUID:workQueue:](v24, "initWithDatabase:zoneName:home:messageTargetUUID:workQueue:", v25, v23, v8, v13, v9);

  -[HMDDatabaseZoneManager defaultConfiguration](v26, "defaultConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(v28, "setZoneOwner:", objc_msgSend(v8, "isOwnerUser"));
  v29 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0"));
  objc_msgSend(v28, "setMinimumHomeKitVersion:", v29);

  -[HMDDatabaseZoneManager setDefaultConfiguration:](v26, "setDefaultConfiguration:", v28);
  v30 = -[HMDHomePersonManager initWithUUID:zoneManager:dataInterfaces:workQueue:home:](self, "initWithUUID:zoneManager:dataInterfaces:workQueue:home:", v13, v26, v14, v9, v8);

  return v30;
}

- (HMDHomePersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 dataInterfaces:(id)a5 workQueue:(id)a6 home:(id)a7
{
  id v11;
  HMDHomePersonManager *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMDHomePersonManager;
  v11 = a7;
  v12 = -[HMDPersonManager initWithUUID:zoneManager:dataInterfaces:workQueue:](&v14, sel_initWithUUID_zoneManager_dataInterfaces_workQueue_, a3, a4, a5, a6);
  objc_storeWeak((id *)&v12->_home, v11);

  return v12;
}

- (BOOL)syncsPersonData
{
  return 1;
}

- (BOOL)sharesFaceClassifications
{
  return 1;
}

- (HMIHomePersonManager)hmiPersonManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDPersonManager dataInterfaces](self, "dataInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_74991);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMIHomePersonManager *)v4;
}

- (HMHomePersonManagerSettings)settings
{
  void *v2;
  void *v3;

  -[HMDHomePersonManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personManagerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHomePersonManagerSettings *)v3;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomePersonManager *v8;
  SEL v9;
  id v10;
  objc_super v11;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDHomePersonManager;
    -[HMDPersonManager configureWithHome:](&v11, sel_configureWithHome_, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleUserCamerasAccessLevelDidChangeNotification_, CFSTR("HMDUserCamerasAccessLevelDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleUserRemoteAccessDidChangeNotification_, CFSTR("HMDUserRemoteAccessDidChangeNotification"), 0);

  }
  else
  {
    v8 = (HMDHomePersonManager *)_HMFPreconditionFailure();
    -[HMDHomePersonManager handleUpdatedSettings:](v8, v9, v10);
  }
}

- (void)handleUpdatedSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomePersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Home person manager settings changed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonManager _createOrRemoveZonesForSettings:](v7, "_createOrRemoveZonesForSettings:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDPersonManager dataInterfaces](v7, "dataInterfaces", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "handleUpdatedSettings:mirrorOutputFuture:", v4, 0);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDPersonManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HMDHomePersonManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDPersonManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HMDHomePersonManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "hasCameraClipsAccess");
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldGrantWriteAccessToUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isAdministrator");
  return (char)v6;
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isOwner");
  return (char)v6;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

void __68__HMDHomePersonManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateShareParticipants");

}

void __74__HMDHomePersonManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateShareParticipants");

}

id __40__HMDHomePersonManager_hmiPersonManager__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "homePersonManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("home-person-data-"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_75010 != -1)
    dispatch_once(&logCategory__hmf_once_t1_75010, &__block_literal_global_25_75011);
  return (id)logCategory__hmf_once_v2_75012;
}

void __35__HMDHomePersonManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_75012;
  logCategory__hmf_once_v2_75012 = v0;

}

@end
