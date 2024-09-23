@implementation HMDPhotosPersonManager

- (HMDPhotosPersonManager)initWithUser:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  HMDHomeAIPhotosPersonDataInterface *v18;
  void *v19;
  HMDHomeAIPhotosPersonDataInterface *v20;
  HMDPhotoLibraryPersonImporter *v21;
  HMDHomeKitPersonDataInterface *v22;
  void *v23;
  HMDHomeKitPersonDataInterface *v24;
  HMDRemotePersonDataMessenger *v25;
  void *v26;
  HMDDatabaseZoneManager *v27;
  void *v28;
  HMDDatabaseZoneManager *v29;
  void *v30;
  void *v31;
  HMDHomeKitVersion *v32;
  void *v33;
  HMDPhotosPersonManager *v34;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CBA760];
  v11 = a4;
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personManagerUUIDFromUserUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "supportsFaceClassification");

  if (v17)
  {
    v18 = [HMDHomeAIPhotosPersonDataInterface alloc];
    objc_msgSend(v14, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMDHomeAIPhotosPersonDataInterface initWithPersonManagerUUID:homeUUID:workQueue:](v18, "initWithPersonManagerUUID:homeUUID:workQueue:", v13, v19, v9);

    objc_msgSend(v15, "addObject:", v20);
  }
  if (objc_msgSend(v8, "isCurrentUser"))
  {
    v21 = -[HMDPhotoLibraryPersonImporter initWithUUID:]([HMDPhotoLibraryPersonImporter alloc], "initWithUUID:", v13);
    objc_msgSend(v15, "addObject:", v21);

  }
  v22 = [HMDHomeKitPersonDataInterface alloc];
  objc_msgSend(v14, "msgDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMDHomeKitPersonDataInterface initWithUUID:messageDispatcher:workQueue:](v22, "initWithUUID:messageDispatcher:workQueue:", v13, v23, v9);
  objc_msgSend(v15, "addObject:", v24);

  v25 = -[HMDRemotePersonDataMessenger initWithUUID:home:workQueue:]([HMDRemotePersonDataMessenger alloc], "initWithUUID:home:workQueue:", v13, v14, v9);
  objc_msgSend(v15, "addObject:", v25);

  +[HMDPhotosPersonManager zoneNameForZoneUUID:](HMDPhotosPersonManager, "zoneNameForZoneUUID:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [HMDDatabaseZoneManager alloc];
  +[HMDDatabase cameraClipsDatabase](HMDDatabase, "cameraClipsDatabase");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:messageTargetUUID:workQueue:](v27, "initWithDatabase:zoneName:home:messageTargetUUID:workQueue:", v28, v26, v14, v13, v9);

  -[HMDDatabaseZoneManager defaultConfiguration](v29, "defaultConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  objc_msgSend(v31, "setZoneOwner:", objc_msgSend(v8, "isCurrentUser"));
  v32 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0"));
  objc_msgSend(v31, "setMinimumHomeKitVersion:", v32);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E8B328F8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRequiredSupportedFeatures:", v33);

  -[HMDDatabaseZoneManager setDefaultConfiguration:](v29, "setDefaultConfiguration:", v31);
  v34 = -[HMDPhotosPersonManager initWithUUID:zoneManager:dataInterfaces:workQueue:user:](self, "initWithUUID:zoneManager:dataInterfaces:workQueue:user:", v13, v29, v15, v9, v8);

  return v34;
}

- (HMDPhotosPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 dataInterfaces:(id)a5 workQueue:(id)a6 user:(id)a7
{
  id v11;
  HMDPhotosPersonManager *v12;
  HMPhotosPersonManagerSettings *v13;
  HMPhotosPersonManagerSettings *dataUnavailableExternalSettings;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMDPhotosPersonManager;
  v11 = a7;
  v12 = -[HMDPersonManager initWithUUID:zoneManager:dataInterfaces:workQueue:](&v16, sel_initWithUUID_zoneManager_dataInterfaces_workQueue_, a3, a4, a5, a6);
  objc_storeWeak((id *)&v12->_user, v11);

  v13 = (HMPhotosPersonManagerSettings *)objc_alloc_init(MEMORY[0x1E0CBA768]);
  dataUnavailableExternalSettings = v12->_dataUnavailableExternalSettings;
  v12->_dataUnavailableExternalSettings = v13;

  return v12;
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
  objc_msgSend(v2, "na_map:", &__block_literal_global_11538);
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
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings changed: %@", buf, 0x16u);

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
  return (HMPhotosPersonManagerSettings *)objc_getProperty(self, a2, 96, 1);
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
  if (logCategory__hmf_once_t1_11562 != -1)
    dispatch_once(&logCategory__hmf_once_t1_11562, &__block_literal_global_20);
  return (id)logCategory__hmf_once_v2_11563;
}

void __37__HMDPhotosPersonManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_11563;
  logCategory__hmf_once_v2_11563 = v0;

}

@end
