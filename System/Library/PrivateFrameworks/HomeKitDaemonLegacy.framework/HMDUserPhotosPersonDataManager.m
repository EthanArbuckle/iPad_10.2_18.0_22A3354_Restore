@implementation HMDUserPhotosPersonDataManager

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 localZone:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HMDUserPhotosPersonDataManager *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsFaceClassification");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCloudPhotosSettingObserver sharedInstance](HMDCloudPhotosSettingObserver, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDUserPhotosPersonDataManager initWithUser:messageDispatcher:localZone:workQueue:supportsFaceClassification:notificationCenter:cloudPhotosSettingObserver:](self, "initWithUser:messageDispatcher:localZone:workQueue:supportsFaceClassification:notificationCenter:cloudPhotosSettingObserver:", v13, v12, v11, v10, v15, v16, v17);

  return v18;
}

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 localZone:(id)a5 workQueue:(id)a6 supportsFaceClassification:(BOOL)a7 notificationCenter:(id)a8 cloudPhotosSettingObserver:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDUserPhotosPersonDataManager *v19;
  HMDUserPhotosPersonDataManager *v20;
  uint64_t v21;
  NSUUID *userUUID;
  void *v23;
  uint64_t v24;
  NSUUID *homeUUID;
  HMDPhotosPersonManagerSettingsModel *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HMDPhotosPersonManagerSettingsModel *settingsModel;
  id personManagerFactory;
  HMDUserPhotosPersonDataManager *v33;
  SEL v34;
  void *v36;
  id v37;
  objc_super v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v37 = a8;
  v18 = a9;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    v33 = (HMDUserPhotosPersonDataManager *)_HMFPreconditionFailure();
    return (HMDUserPhotosPersonDataManager *)-[HMDUserPhotosPersonDataManager settings](v33, v34);
  }
  v36 = v18;
  v38.receiver = self;
  v38.super_class = (Class)HMDUserPhotosPersonDataManager;
  v19 = -[HMDUserPhotosPersonDataManager init](&v38, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a6);
    objc_msgSend(v14, "uuid");
    v21 = objc_claimAutoreleasedReturnValue();
    userUUID = v20->_userUUID;
    v20->_userUUID = (NSUUID *)v21;

    objc_msgSend(v14, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uuid");
    v24 = objc_claimAutoreleasedReturnValue();
    homeUUID = v20->_homeUUID;
    v20->_homeUUID = (NSUUID *)v24;

    objc_storeStrong((id *)&v20->_messageDispatcher, a4);
    objc_storeStrong((id *)&v20->_localZone, a5);
    objc_storeWeak((id *)&v20->_user, v14);
    v20->_supportsFaceClassification = a7;
    objc_storeStrong((id *)&v20->_notificationCenter, a8);
    objc_storeStrong((id *)&v20->_cloudPhotosSettingObserver, a9);
    v26 = [HMDPhotosPersonManagerSettingsModel alloc];
    objc_msgSend((id)objc_opt_class(), "settingsModelUUIDWithUUID:", v20->_userUUID);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID](HMDPhotosPersonManagerSettingsModel, "sentinelParentUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMBModel initWithModelID:parentModelID:](v26, "initWithModelID:parentModelID:", v27, v28);
    settingsModel = v20->_settingsModel;
    v20->_settingsModel = (HMDPhotosPersonManagerSettingsModel *)v29;

    personManagerFactory = v20->_personManagerFactory;
    v20->_personManagerFactory = &__block_literal_global_16106;

  }
  return v20;
}

- (HMPhotosPersonManagerSettings)settings
{
  void *v2;
  void *v3;

  -[HMDUserPhotosPersonDataManager settingsModel](self, "settingsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMPhotosPersonManagerSettings *)v3;
}

- (NSUUID)zoneUUID
{
  void *v2;
  void *v3;

  -[HMDUserPhotosPersonDataManager settingsModel](self, "settingsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDUserPhotosPersonDataManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  HMDUserPhotosPersonDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDUserPhotosPersonDataManager *v29;
  NSObject *v30;
  void *v31;
  HMDUserPhotosPersonDataManager *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserPhotosPersonDataManager user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v31;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      goto LABEL_16;
    }
    -[HMDUserPhotosPersonDataManager messageDispatcher](self, "messageDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CBA060];
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v9;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 8197);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v10;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v8, self, v12, sel_handleUpdatePersonManagerSettingsMessage_);

    -[HMDUserPhotosPersonDataManager notificationCenter](self, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_handleUserCamerasAccessLevelDidChangeNotification_, CFSTR("HMDUserCamerasAccessLevelDidChangeNotification"), v5);

    -[HMDUserPhotosPersonDataManager notificationCenter](self, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_handleUserRemoteAccessDidChangeNotification_, CFSTR("HMDUserRemoteAccessDidChangeNotification"), v5);

    -[HMDUserPhotosPersonDataManager notificationCenter](self, "notificationCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_handleHomePersonManagerSettingsDidChangeNotification_, CFSTR("HMDHomePersonManagerSettingsDidChangeNotification"), v6);

    -[HMDUserPhotosPersonDataManager persistedSettingsModel](self, "persistedSettingsModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0](-[HMDUserPhotosPersonDataManager setSettingsModel:](self, "setSettingsModel:", v16));
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPhotosPersonDataManager settingsModel](v18, "settingsModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v20;
        v35 = 2112;
        v36 = v22;
        v23 = "%{public}@Initialized photos person data manager with settings: %@";
LABEL_14:
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v33, 0x16u);

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPhotosPersonDataManager settingsModel](v32, "settingsModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v20;
        v35 = 2112;
        v36 = v22;
        v23 = "%{public}@Initialized photos person data manager with default settings: %@";
        goto LABEL_14;
      }
    }

    objc_autoreleasePoolPop(v17);
    -[HMDUserPhotosPersonDataManager configurePhotosPersonManagerWithSettingsModel:](self, "configurePhotosPersonManagerWithSettingsModel:", v16);

LABEL_16:
    goto LABEL_17;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v27;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
LABEL_17:

}

- (void)recoverDueToUUIDChangeFromOldUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUserPhotosPersonDataManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDPhotosPersonManagerSettingsModel *v13;
  void *v14;
  void *v15;
  HMDPhotosPersonManagerSettingsModel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HMDUserPhotosPersonDataManager *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
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
    v28 = 138543362;
    v29 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Migrating photos person manager settings to use new user UUID", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend((id)objc_opt_class(), "settingsModelUUIDWithUUID:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPhotosPersonDataManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchModelWithModelID:ofType:error:", v10, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [HMDPhotosPersonManagerSettingsModel alloc];
    -[HMDUserPhotosPersonDataManager settingsModelUUID](v7, "settingsModelUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID](HMDPhotosPersonManagerSettingsModel, "sentinelParentUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMBModel initWithModelID:parentModelID:](v13, "initWithModelID:parentModelID:", v14, v15);

    -[HMBModel hmbMergeSetPropertiesFromModel:](v16, "hmbMergeSetPropertiesFromModel:", v12);
    -[HMDUserPhotosPersonDataManager localZone](v7, "localZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v12, "hmbModelID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Migrate photos person manager settings"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v17, "addModels:andRemoveModelIDs:options:", v18, v21, v22);

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v7;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@No old settings model exists to migrate", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)removeCloudDataDueToUserRemoval
{
  NSObject *v3;
  id v4;

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserPhotosPersonDataManager zoneUUID](self, "zoneUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDUserPhotosPersonDataManager removeCloudDataForZoneUUID:isDueToHomeGraphObjectRemoval:](self, "removeCloudDataForZoneUUID:isDueToHomeGraphObjectRemoval:", v4, 1);

}

- (id)updateSettingsModelWithSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUserPhotosPersonDataManager *v7;
  NSObject *v8;
  void *v9;
  HMDPhotosPersonManagerSettingsModel *v10;
  void *v11;
  HMDPhotosPersonManagerSettingsModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUserPhotosPersonDataManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDUserPhotosPersonDataManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDUserPhotosPersonDataManager *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HMDUserPhotosPersonDataManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
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
    v42 = 138543618;
    v43 = v9;
    v44 = 2112;
    v45 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating photos person manager settings: %@", (uint8_t *)&v42, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v10 = [HMDPhotosPersonManagerSettingsModel alloc];
  -[HMDUserPhotosPersonDataManager settingsModelUUID](v7, "settingsModelUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDPhotosPersonManagerSettingsModel initWithModelID:settings:](v10, "initWithModelID:settings:", v11, v4);

  -[HMDUserPhotosPersonDataManager settingsModel](v7, "settingsModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isImportingFromPhotoLibraryEnabled"))
  {
    objc_msgSend(v13, "zoneUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[HMDUserPhotosPersonDataManager photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser](v7, "photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = v7;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543618;
          v43 = v28;
          v44 = 2112;
          v45 = v24;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Using existing Photo Library person manager zone UUID for current user from another home: %@", (uint8_t *)&v42, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v29 = -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", v24);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", v30);

      }
      v31 = (void *)MEMORY[0x1D17BA0A0](v29);
      v32 = v7;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPhotosPersonManagerSettingsModel zoneUUID](v12, "zoneUUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138543618;
        v43 = v34;
        v44 = 2112;
        v45 = v35;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now enabled. Updating settings with new photos person manager zone UUID: %@", (uint8_t *)&v42, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      goto LABEL_21;
    }
  }
  if ((objc_msgSend(v4, "isImportingFromPhotoLibraryEnabled") & 1) != 0
    || (objc_msgSend(v13, "zoneUUID"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543362;
      v43 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library has not changed. Not changing zone UUID", (uint8_t *)&v42, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v13, "zoneUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", v24);
LABEL_21:

    goto LABEL_22;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = v7;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543362;
    v43 = v19;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now disabled. Updating settings to remove zone UUID", (uint8_t *)&v42, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", 0);
LABEL_22:
  -[HMDUserPhotosPersonDataManager localZone](v7, "localZone");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Update photos person manager settings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addModels:options:", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "flatMap:", &__block_literal_global_33_16083);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (void)handleUpdatedSettingsModel:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserPhotosPersonDataManager _handleUpdatedSettingsModel:](self, "_handleUpdatedSettingsModel:", v5);
}

- (id)settingsModelUUID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HMDUserPhotosPersonDataManager userUUID](self, "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingsModelUUIDWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)persistedSettingsModel
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDUserPhotosPersonDataManager localZone](self, "localZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPhotosPersonDataManager settingsModelUUID](self, "settingsModelUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchModelWithModelID:ofType:error:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  HMDUserPhotosPersonDataManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDUserPhotosPersonDataManager *v24;
  NSObject *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserPhotosPersonDataManager user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "home", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "currentUser");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) == 0)
          {
            objc_msgSend(v13, "photosPersonDataManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "zoneUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v23 = (void *)MEMORY[0x1D17BA0A0]();
              v24 = self;
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v33 = v26;
                v34 = 2112;
                v35 = v13;
                v36 = 2112;
                v37 = v18;
                _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Found current user %@ using photos person manager zone UUID: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v23);

              goto LABEL_19;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (void)configurePhotosPersonManagerWithSettingsModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  HMDUserPhotosPersonDataManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDUserPhotosPersonDataManager *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  void *v26;
  HMDUserPhotosPersonDataManager *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  _WORD v33[9];

  *(_QWORD *)&v33[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserPhotosPersonDataManager user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v21;
      v22 = "%{public}@User reference is nil";
      v23 = v20;
      v24 = OS_LOG_TYPE_DEFAULT;
      v25 = 12;
LABEL_16:
      _os_log_impl(&dword_1CD062000, v23, v24, v22, (uint8_t *)&v30, v25);

    }
LABEL_17:

    objc_autoreleasePoolPop(v18);
    goto LABEL_18;
  }
  if (!-[HMDUserPhotosPersonDataManager supportsFaceClassification](self, "supportsFaceClassification")
    && (objc_msgSend(v6, "isCurrentUser") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543874;
      v31 = v21;
      v32 = 1024;
      *(_DWORD *)v33 = -[HMDUserPhotosPersonDataManager supportsFaceClassification](v19, "supportsFaceClassification");
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = objc_msgSend(v6, "isCurrentUser");
      v22 = "%{public}@Not configuring photos person manager because self.supportsFaceClassification=%d and user.isCurrentUser=%d";
      v23 = v20;
      v24 = OS_LOG_TYPE_DEBUG;
      v25 = 24;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(v4, "zoneUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDUserPhotosPersonDataManager personManagerFactory](self, "personManagerFactory");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v8)[2](v8, v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPhotosPersonDataManager setPersonManager:](self, "setPersonManager:", v10);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPhotosPersonDataManager personManager](v12, "personManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v14;
      v32 = 2112;
      *(_QWORD *)v33 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring photos person manager: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDUserPhotosPersonDataManager personManager](v12, "personManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configureWithHome:", v17);

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Not configuring photos person manager because zoneUUID is nil", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }

LABEL_18:
}

- (void)updateSettingsForCurrentCameraClipsAccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDUserPhotosPersonDataManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDUserPhotosPersonDataManager *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserPhotosPersonDataManager user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "hasCameraClipsAccess") & 1) == 0)
    {
      -[HMDUserPhotosPersonDataManager settings](self, "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "defaultSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) == 0)
      {
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543618;
          v20 = v12;
          v21 = 2112;
          v22 = v5;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since user does not have access to camera clips: %@", (uint8_t *)&v19, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend((id)objc_opt_class(), "defaultSettings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HMDUserPhotosPersonDataManager updateSettingsModelWithSettings:](v10, "updateSettingsModelWithSettings:", v13);

      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)removeCloudDataForZoneUUID:(id)a3 isDueToHomeGraphObjectRemoval:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  HMDUserPhotosPersonDataManager *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserPhotosPersonDataManager personManager](self, "personManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CBA768]);
  objc_msgSend(v8, "handleUpdatedSettings:", v9);

  if (v6)
  {
    -[HMDUserPhotosPersonDataManager photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser](self, "photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if ((v11 & 1) != 0)
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v16;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Not removing user photos person cloud data for zone UUID %@ because another home current user exists that is still using the zone", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }
    else
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v17;
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing user photos person cloud data for zone UUID: %@ isDueToHomeGraphObjectRemoval: %@", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDUserPhotosPersonDataManager personManager](v13, "personManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "removeAllAssociatedDataDueToHomeGraphObjectRemoval:", v4);

    }
  }
  -[HMDUserPhotosPersonDataManager setPersonManager:](self, "setPersonManager:", 0);

}

- (void)_handleUpdatedSettingsModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDUserPhotosPersonDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUserPhotosPersonDataManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDUserPhotosPersonDataManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserPhotosPersonDataManager settingsModel](self, "settingsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmbIsDifferentFromModel:differingFields:", v6, 0))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543874;
      v39 = v10;
      v40 = 2112;
      v41 = v11;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@ previous model: %@", (uint8_t *)&v38, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDUserPhotosPersonDataManager setSettingsModel:](v8, "setSettingsModel:", v4);
    objc_msgSend(v4, "zoneUUID");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v6, "zoneUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "zoneUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) == 0)
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = v8;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "zoneUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "zoneUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543874;
          v39 = v24;
          v40 = 2112;
          v41 = v25;
          v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID changed from %@ to %@. Configuring photos person manager", (uint8_t *)&v38, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(v6, "zoneUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPhotosPersonDataManager removeCloudDataForZoneUUID:isDueToHomeGraphObjectRemoval:](v22, "removeCloudDataForZoneUUID:isDueToHomeGraphObjectRemoval:", v27, 0);

        -[HMDUserPhotosPersonDataManager configurePhotosPersonManagerWithSettingsModel:](v22, "configurePhotosPersonManagerWithSettingsModel:", v4);
        goto LABEL_16;
      }
    }
    objc_msgSend(v4, "zoneUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

    }
    else
    {
      objc_msgSend(v6, "zoneUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = v8;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543362;
          v39 = v32;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID is now nil. Removing photos person manager", (uint8_t *)&v38, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v6, "zoneUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPhotosPersonDataManager removeCloudDataForZoneUUID:isDueToHomeGraphObjectRemoval:](v30, "removeCloudDataForZoneUUID:isDueToHomeGraphObjectRemoval:", v33, 0);

        goto LABEL_16;
      }
    }
    -[HMDUserPhotosPersonDataManager personManager](v8, "personManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleUpdatedSettings:", v20);

LABEL_16:
    -[HMDUserPhotosPersonDataManager user](v8, "user");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "home");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "homeManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPhotosPersonDataManager userUUID](v8, "userUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Photos Person Manager Settings Updated"), v37, 1);

  }
}

- (void)handleUpdatePersonManagerSettingsMessage:(id)a3
{
  id v4;
  void *v5;
  HMDUserPhotosPersonDataManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMDUserPhotosPersonDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDUserPhotosPersonDataManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMDUserPhotosPersonDataManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDUserPhotosPersonDataManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMDUserPhotosPersonDataManager *v45;
  NSObject *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v8;
    v55 = 2112;
    v56 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager settings message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUserPhotosPersonDataManager user](v6, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (objc_msgSend(v11, "isCurrentUser") && (objc_msgSend(v11, "hasCameraClipsAccess") & 1) != 0)
      {
        v13 = *MEMORY[0x1E0CB9FC0];
        v52 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (!objc_msgSend(v15, "isImportingFromPhotoLibraryEnabled")
            || (-[HMDUserPhotosPersonDataManager cloudPhotosSettingObserver](v6, "cloudPhotosSettingObserver"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "isCloudPhotosEnabled"),
                v16,
                (v17 & 1) != 0))
          {
            -[HMDUserPhotosPersonDataManager updateSettingsModelWithSettings:](v6, "updateSettingsModelWithSettings:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = MEMORY[0x1E0C809B0];
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke;
            v50[3] = &unk_1E89C21E8;
            v20 = v4;
            v51 = v20;
            objc_msgSend(v18, "addSuccessBlock:", v50);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = v19;
            v48[1] = 3221225472;
            v48[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2;
            v48[3] = &unk_1E89C2350;
            v49 = v20;
            v22 = (id)objc_msgSend(v21, "addFailureBlock:", v48);

            v23 = v51;
LABEL_30:

            goto LABEL_21;
          }
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v6;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v47;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot enable importing from Photo Library because cloud photos is not enabled", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v44);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2007);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = (void *)MEMORY[0x1D17BA0A0]();
          v39 = v6;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "messagePayload");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v41;
            v55 = 2112;
            v56 = v42;
            _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not find photos person manager settings in message payload: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v38);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        v23 = (void *)v43;
        objc_msgSend(v4, "respondWithError:", v43);
        goto LABEL_30;
      }
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v6;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v31;
        v55 = 2112;
        v56 = v11;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Person manager settings cannot be updated for user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = 17;
    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = v6;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = 48;
    }
    objc_msgSend(v32, "hmErrorWithCode:", v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
LABEL_21:

    goto LABEL_22;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v27;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v12);
LABEL_22:

}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDUserPhotosPersonDataManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDUserPhotosPersonDataManager userUUID](self, "userUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDPhotosPersonManager)personManager
{
  return (HMDPhotosPersonManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersonManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)supportsFaceClassification
{
  return self->_supportsFaceClassification;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver
{
  return (HMDCloudPhotosSettingObserver *)objc_getProperty(self, a2, 72, 1);
}

- (HMDUser)user
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_user);
}

- (void)setUser:(id)a3
{
  objc_storeWeak((id *)&self->_user, a3);
}

- (HMDPhotosPersonManagerSettingsModel)settingsModel
{
  return (HMDPhotosPersonManagerSettingsModel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSettingsModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (id)personManagerFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setPersonManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personManagerFactory, 0);
  objc_storeStrong((id *)&self->_settingsModel, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_cloudPhotosSettingObserver, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

void __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "isCurrentUser"))
    {
      objc_msgSend(v3, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "personManagerSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && (objc_msgSend(v5, "isFaceClassificationEnabled") & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1D17BA0A0]();
        v7 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v9;
          _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since Face Classification was disabled", (uint8_t *)&v17, 0xCu);

        }
        objc_autoreleasePoolPop(v6);
        v10 = *(void **)(a1 + 32);
        objc_msgSend((id)objc_opt_class(), "defaultSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v10, "updateSettingsModelWithSettings:", v11);

      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

uint64_t __78__HMDUserPhotosPersonDataManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSettingsForCurrentCameraClipsAccess");
}

uint64_t __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSettingsForCurrentCameraClipsAccess");
}

uint64_t __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

HMDPhotosPersonManager *__158__HMDUserPhotosPersonDataManager_initWithUser_messageDispatcher_localZone_workQueue_supportsFaceClassification_notificationCenter_cloudPhotosSettingObserver___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  HMDPhotosPersonManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = -[HMDPhotosPersonManager initWithUser:zoneUUID:workQueue:]([HMDPhotosPersonManager alloc], "initWithUser:zoneUUID:workQueue:", v8, v7, v6);

  return v9;
}

+ (HMPhotosPersonManagerSettings)defaultSettings
{
  return (HMPhotosPersonManagerSettings *)objc_alloc_init(MEMORY[0x1E0CBA768]);
}

+ (id)settingsModelUUIDWithUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("F378F892-E6AD-4A6E-927A-C04D01A75448"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32 != -1)
    dispatch_once(&logCategory__hmf_once_t32, &__block_literal_global_43_16121);
  return (id)logCategory__hmf_once_v33;
}

void __45__HMDUserPhotosPersonDataManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33;
  logCategory__hmf_once_v33 = v0;

}

@end
