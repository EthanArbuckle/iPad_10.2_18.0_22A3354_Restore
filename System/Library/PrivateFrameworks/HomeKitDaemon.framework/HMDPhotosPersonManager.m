@implementation HMDPhotosPersonManager

- (HMDPhotosPersonManager)initWithUser:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HMDHomeAIPhotosPersonDataInterface *v17;
  void *v18;
  HMDHomeAIPhotosPersonDataInterface *v19;
  HMDPhotoLibraryPersonImporter *v20;
  HMDHomeKitPersonDataInterface *v21;
  void *v22;
  HMDHomeKitPersonDataInterface *v23;
  HMDRemotePersonDataMessenger *v24;
  void *v25;
  HMDDatabaseZoneManager *v26;
  void *v27;
  HMDDatabaseZoneManager *v28;
  void *v29;
  void *v30;
  HMDHomeKitVersion *v31;
  void *v32;
  HMDPersonCoreDataManager *v33;
  void *v34;
  HMDPersonCoreDataManager *v35;
  HMDPhotosPersonManager *v36;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD78B8];
  v10 = a4;
  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personManagerUUIDFromUserUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "supportsFaceClassification");

  if (v16)
  {
    v17 = [HMDHomeAIPhotosPersonDataInterface alloc];
    objc_msgSend(v13, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDHomeAIPhotosPersonDataInterface initWithPersonManagerUUID:homeUUID:workQueue:](v17, "initWithPersonManagerUUID:homeUUID:workQueue:", v12, v18, v8);

    objc_msgSend(v14, "addObject:", v19);
  }
  if (objc_msgSend(v7, "isCurrentUser"))
  {
    v20 = -[HMDPhotoLibraryPersonImporter initWithUUID:]([HMDPhotoLibraryPersonImporter alloc], "initWithUUID:", v12);
    objc_msgSend(v14, "addObject:", v20);

  }
  v21 = [HMDHomeKitPersonDataInterface alloc];
  objc_msgSend(v13, "msgDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMDHomeKitPersonDataInterface initWithUUID:messageDispatcher:workQueue:](v21, "initWithUUID:messageDispatcher:workQueue:", v12, v22, v8);
  objc_msgSend(v14, "addObject:", v23);

  v24 = -[HMDRemotePersonDataMessenger initWithUUID:home:workQueue:]([HMDRemotePersonDataMessenger alloc], "initWithUUID:home:workQueue:", v12, v13, v8);
  objc_msgSend(v14, "addObject:", v24);

  +[HMDPhotosPersonManager zoneNameForZoneUUID:](HMDPhotosPersonManager, "zoneNameForZoneUUID:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = [HMDDatabaseZoneManager alloc];
  +[HMDDatabase cameraClipsDatabase](HMDDatabase, "cameraClipsDatabase");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:messageTargetUUID:workQueue:](v26, "initWithDatabase:zoneName:home:messageTargetUUID:workQueue:", v27, v25, v13, v12, v8);

  -[HMDDatabaseZoneManager defaultConfiguration](v28, "defaultConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  objc_msgSend(v30, "setZoneOwner:", objc_msgSend(v7, "isCurrentUser"));
  v31 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0"));
  objc_msgSend(v30, "setMinimumHomeKitVersion:", v31);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24E96A670);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRequiredSupportedFeatures:", v32);

  -[HMDDatabaseZoneManager setDefaultConfiguration:](v28, "setDefaultConfiguration:", v30);
  v33 = [HMDPersonCoreDataManager alloc];
  objc_msgSend(v7, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[HMDPersonCoreDataManager initWithUUID:workQueue:home:userUUID:](v33, "initWithUUID:workQueue:home:userUUID:", v12, v8, v13, v34);

  v36 = -[HMDPhotosPersonManager initWithUUID:zoneManager:coreDataManager:dataInterfaces:workQueue:user:](self, "initWithUUID:zoneManager:coreDataManager:dataInterfaces:workQueue:user:", v12, v28, v35, v14, v8, v7);
  return v36;
}

- (HMDPhotosPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7 user:(id)a8
{
  id v13;
  HMDPhotosPersonManager *v14;
  HMPhotosPersonManagerSettings *v15;
  HMPhotosPersonManagerSettings *dataUnavailableExternalSettings;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDPhotosPersonManager;
  v13 = a8;
  v14 = -[HMDPersonManager initWithUUID:zoneManager:coreDataManager:dataInterfaces:workQueue:](&v18, sel_initWithUUID_zoneManager_coreDataManager_dataInterfaces_workQueue_, a3, a4, a5, a6, a7);
  objc_storeWeak((id *)&v14->_user, v13);

  v15 = (HMPhotosPersonManagerSettings *)objc_alloc_init(MEMORY[0x24BDD78C0]);
  dataUnavailableExternalSettings = v14->_dataUnavailableExternalSettings;
  v14->_dataUnavailableExternalSettings = v15;

  return v14;
}

- (BOOL)sharesFaceClassifications
{
  void *v2;
  char v3;

  -[HMDPhotosPersonManager settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharingFaceClassificationsEnabled");

  return v3;
}

- (HMIExternalPersonManager)hmiPersonManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDPersonManager dataInterfaces](self, "dataInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_15507);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMIExternalPersonManager *)v4;
}

- (HMPhotosPersonManagerSettings)settings
{
  void *v2;
  void *v3;

  -[HMDPhotosPersonManager user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosPersonManagerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMPhotosPersonManagerSettings *)v3;
}

- (void)handleUpdatedSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPhotosPersonManager *v7;
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

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings changed: %@", buf, 0x16u);

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

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
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

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;

  -[HMDPersonManager workQueue](self, "workQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager zoneManager](self, "zoneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isOwnerUser");

  return v8;
}

- (HMPhotosPersonManagerSettings)dataUnavailableExternalSettings
{
  return (HMPhotosPersonManagerSettings *)objc_getProperty(self, a2, 104, 1);
}

- (HMDUser)user
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_user);
}

- (void)setUser:(id)a3
{
  objc_storeWeak((id *)&self->_user, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_dataUnavailableExternalSettings, 0);
}

id __42__HMDPhotosPersonManager_hmiPersonManager__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "photosPersonManager");
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
  objc_msgSend(CFSTR("photos-person-data-"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_15533 != -1)
    dispatch_once(&logCategory__hmf_once_t1_15533, &__block_literal_global_21_15534);
  return (id)logCategory__hmf_once_v2_15535;
}

void __37__HMDPhotosPersonManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_15535;
  logCategory__hmf_once_v2_15535 = v0;

}

@end
