@implementation HMDUserPhotosPersonDataManager

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 backingStoreContext:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDUserPhotosPersonDataManager *v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMDCoreDataCloudTransform sharedInstance](HMDCoreDataCloudTransform, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "supportsFaceClassification");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCloudPhotosSettingObserver sharedInstance](HMDCloudPhotosSettingObserver, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDUserPhotosPersonDataManager initWithUser:messageDispatcher:backingStoreContext:cloudTransform:workQueue:supportsFaceClassification:notificationCenter:cloudPhotosSettingObserver:](self, "initWithUser:messageDispatcher:backingStoreContext:cloudTransform:workQueue:supportsFaceClassification:notificationCenter:cloudPhotosSettingObserver:", v13, v12, v11, v14, v10, v16, v17, v18);

  return v19;
}

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 backingStoreContext:(id)a5 cloudTransform:(id)a6 workQueue:(id)a7 supportsFaceClassification:(BOOL)a8 notificationCenter:(id)a9 cloudPhotosSettingObserver:(id)a10
{
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
  id v38;
  id v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v39 = a5;
  v38 = a6;
  v17 = a7;
  v37 = a9;
  v18 = a10;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v39)
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
  v40.receiver = self;
  v40.super_class = (Class)HMDUserPhotosPersonDataManager;
  v19 = -[HMDUserPhotosPersonDataManager init](&v40, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a7);
    objc_msgSend(v15, "uuid");
    v21 = objc_claimAutoreleasedReturnValue();
    userUUID = v20->_userUUID;
    v20->_userUUID = (NSUUID *)v21;

    objc_msgSend(v15, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uuid");
    v24 = objc_claimAutoreleasedReturnValue();
    homeUUID = v20->_homeUUID;
    v20->_homeUUID = (NSUUID *)v24;

    objc_storeStrong((id *)&v20->_messageDispatcher, a4);
    objc_storeStrong((id *)&v20->_backingStoreContext, a5);
    objc_storeStrong((id *)&v20->_cloudTransform, a6);
    objc_storeWeak((id *)&v20->_user, v15);
    v20->_supportsFaceClassification = a8;
    objc_storeStrong((id *)&v20->_notificationCenter, a9);
    objc_storeStrong((id *)&v20->_cloudPhotosSettingObserver, a10);
    v26 = [HMDPhotosPersonManagerSettingsModel alloc];
    objc_msgSend((id)objc_opt_class(), "settingsModelUUIDWithUUID:", v20->_userUUID);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID](HMDPhotosPersonManagerSettingsModel, "sentinelParentUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMBModel initWithModelID:parentModelID:](v26, "initWithModelID:parentModelID:", v27, v28);
    settingsModel = v20->_settingsModel;
    v20->_settingsModel = (HMDPhotosPersonManagerSettingsModel *)v29;

    personManagerFactory = v20->_personManagerFactory;
    v20->_personManagerFactory = &__block_literal_global_22685;

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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDUserPhotosPersonDataManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  HMDUserPhotosPersonDataManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDUserPhotosPersonDataManager *v37;
  NSObject *v38;
  void *v39;
  HMDUserPhotosPersonDataManager *v40;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  void *v45;
  _QWORD v46[3];
  _QWORD v47[4];

  v47[3] = *MEMORY[0x24BDAC8D0];
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
      v36 = (void *)MEMORY[0x227676638]();
      v37 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543362;
        v42 = v39;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", (uint8_t *)&v41, 0xCu);

      }
      objc_autoreleasePoolPop(v36);
      goto LABEL_18;
    }
    -[HMDUserPhotosPersonDataManager messageDispatcher](self, "messageDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDD71D8];
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v9;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 8197);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v10;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v8, self, v12, sel_handleUpdatePersonManagerSettingsMessage_);

    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRoles:", objc_msgSend(v13, "roles") | 4);
    -[HMDUserPhotosPersonDataManager messageDispatcher](self, "messageDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v15;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v16;
    v46[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", CFSTR("HMDUPPM.m.updateOwnerSettings"), self, v17, sel_handleUpdatePersonManagerOwnerSettingsMessage_);

    -[HMDUserPhotosPersonDataManager notificationCenter](self, "notificationCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_handleUserCamerasAccessLevelDidChangeNotification_, CFSTR("HMDUserCamerasAccessLevelDidChangeNotification"), v5);

    -[HMDUserPhotosPersonDataManager notificationCenter](self, "notificationCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_handleUserRemoteAccessDidChangeNotification_, CFSTR("HMDUserRemoteAccessDidChangeNotification"), v5);

    -[HMDUserPhotosPersonDataManager notificationCenter](self, "notificationCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_handleHomePersonManagerSettingsDidChangeNotification_, CFSTR("HMDHomePersonManagerSettingsDidChangeNotification"), v6);

    if (!-[HMDUserPhotosPersonDataManager shouldUseUserModelForSettings](self, "shouldUseUserModelForSettings"))
    {
      -[HMDUserPhotosPersonDataManager cloudTransform](self, "cloudTransform");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "registerCloudChangeListener:forEntities:", self, v23);

    }
    -[HMDUserPhotosPersonDataManager persistedSettingsModel](self, "persistedSettingsModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)MEMORY[0x227676638](-[HMDUserPhotosPersonDataManager setSettingsModel:](self, "setSettingsModel:", v24));
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPhotosPersonDataManager settingsModel](v26, "settingsModel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "createSettings");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543618;
        v42 = v28;
        v43 = 2112;
        v44 = v30;
        v31 = "%{public}@Initialized photos person data manager with settings: %@";
LABEL_16:
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, v31, (uint8_t *)&v41, 0x16u);

      }
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v40 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPhotosPersonDataManager settingsModel](v40, "settingsModel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "createSettings");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543618;
        v42 = v28;
        v43 = 2112;
        v44 = v30;
        v31 = "%{public}@Initialized photos person data manager with default settings: %@";
        goto LABEL_16;
      }
    }

    objc_autoreleasePoolPop(v25);
    -[HMDUserPhotosPersonDataManager configurePhotosPersonManagerWithSettingsModel:](self, "configurePhotosPersonManagerWithSettingsModel:", v24);

LABEL_18:
    goto LABEL_19;
  }
  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543362;
    v42 = v35;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v41, 0xCu);

  }
  objc_autoreleasePoolPop(v32);
LABEL_19:

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
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  void *v18;
  HMDUserPhotosPersonDataManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDUserPhotosPersonDataManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDUserPhotosPersonDataManager *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  HMDUserPhotosPersonDataManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  HMDPhotosPersonManagerSettingsModel *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v50[6];
  _QWORD v51[5];
  HMDPhotosPersonManagerSettingsModel *v52;
  id v53;
  _BYTE *v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
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
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating photos person manager settings: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v10 = [HMDPhotosPersonManagerSettingsModel alloc];
  -[HMDUserPhotosPersonDataManager settingsModelUUID](v7, "settingsModelUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDPhotosPersonManagerSettingsModel initWithModelID:settings:](v10, "initWithModelID:settings:", v11, v4);

  -[HMDUserPhotosPersonDataManager settingsModel](v7, "settingsModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isImportingFromPhotoLibraryEnabled")
    && (objc_msgSend(v13, "zoneUUID"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v15))
  {
    -[HMDUserPhotosPersonDataManager photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser](v7, "photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v7;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v27;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Using existing Photo Library person manager zone UUID for current user from another home: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v32 = -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", v27);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", v33);

    }
    v34 = (void *)MEMORY[0x227676638](v32);
    v35 = v7;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPhotosPersonManagerSettingsModel zoneUUID](v12, "zoneUUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v38;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now enabled. Updating settings with new photos person manager zone UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);

  }
  else if ((objc_msgSend(v4, "isImportingFromPhotoLibraryEnabled") & 1) != 0
         || (objc_msgSend(v13, "zoneUUID"),
             v16 = (void *)objc_claimAutoreleasedReturnValue(),
             v17 = v16 == 0,
             v16,
             v17))
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library has not changed. Not changing zone UUID", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v13, "zoneUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", v26);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now disabled. Updating settings to remove zone UUID", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v12, "setZoneUUID:", 0);
  }
  v39 = objc_alloc_init(MEMORY[0x24BE6B608]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__22662;
  v57 = __Block_byref_object_dispose__22663;
  v58 = 0;
  -[HMDUserPhotosPersonDataManager backingStoreContext](v7, "backingStoreContext");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke;
  v51[3] = &unk_24E79B5F8;
  v51[4] = v7;
  v42 = v12;
  v52 = v42;
  v54 = buf;
  v43 = v39;
  v53 = v43;
  objc_msgSend(v40, "performBlock:", v51);

  v44 = (void *)MEMORY[0x24BE6B628];
  -[HMDUserPhotosPersonDataManager workQueue](v7, "workQueue");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "schedulerWithDispatchQueue:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "reschedule:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v41;
  v50[1] = 3221225472;
  v50[2] = __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke_37;
  v50[3] = &unk_24E778478;
  v50[4] = v7;
  v50[5] = buf;
  objc_msgSend(v47, "flatMap:", v50);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v48;
}

- (void)handleUpdatedUserModel:(id)a3
{
  NSObject *v4;
  HMDPhotosPersonManagerSettingsModel *v5;
  void *v6;
  void *v7;
  HMDPhotosPersonManagerSettingsModel *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[HMDUserPhotosPersonDataManager shouldUseUserModelForSettings](self, "shouldUseUserModelForSettings"))
  {
    v5 = [HMDPhotosPersonManagerSettingsModel alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID](HMDPhotosPersonManagerSettingsModel, "sentinelParentUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v7);

    v9 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v13, "photosPersonDataZoneUUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
    -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v8, "setZoneUUID:", v11);

    objc_msgSend(v13, "sharePhotosFaceClassifications");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPhotosPersonManagerSettingsModel setSharingFaceClassificationsEnabled:](v8, "setSharingFaceClassificationsEnabled:", v12);

    -[HMDUserPhotosPersonDataManager _handleUpdatedSettingsModel:](self, "_handleUpdatedSettingsModel:", v8);
  }

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

- (BOOL)shouldUseUserModelForSettings
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDUserPhotosPersonDataManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDUserPhotosPersonDataManager user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isOwner") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "isOwnerUser");

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)persistedSettingsModel
{
  HMDPhotosPersonManagerSettingsModel *v3;
  void *v4;
  void *v5;
  HMDPhotosPersonManagerSettingsModel *v6;
  void *v7;
  HMDPhotosPersonManagerSettingsModel *v8;
  HMDPhotosPersonManagerSettingsModel *v9;
  HMDPhotosPersonManagerSettingsModel *v10;
  _QWORD v12[5];
  HMDPhotosPersonManagerSettingsModel *v13;

  v3 = [HMDPhotosPersonManagerSettingsModel alloc];
  -[HMDUserPhotosPersonDataManager settingsModelUUID](self, "settingsModelUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID](HMDPhotosPersonManagerSettingsModel, "sentinelParentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBModel initWithModelID:parentModelID:](v3, "initWithModelID:parentModelID:", v4, v5);

  -[HMDUserPhotosPersonDataManager backingStoreContext](self, "backingStoreContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__HMDUserPhotosPersonDataManager_persistedSettingsModel__block_invoke;
  v12[3] = &unk_24E79C268;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
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

  v39 = *MEMORY[0x24BDAC8D0];
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
              v23 = (void *)MEMORY[0x227676638]();
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
                _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Found current user %@ using photos person manager zone UUID: %@", buf, 0x20u);

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
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);

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

  *(_QWORD *)&v33[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserPhotosPersonDataManager user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v18 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v23, v24, v22, (uint8_t *)&v30, v25);

    }
LABEL_17:

    objc_autoreleasePoolPop(v18);
    goto LABEL_18;
  }
  if (!-[HMDUserPhotosPersonDataManager supportsFaceClassification](self, "supportsFaceClassification")
    && (objc_msgSend(v6, "isCurrentUser") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x227676638]();
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

    v11 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring photos person manager: %@", (uint8_t *)&v30, 0x16u);

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
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Not configuring photos person manager because zoneUUID is nil", (uint8_t *)&v30, 0xCu);

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

  v23 = *MEMORY[0x24BDAC8D0];
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
        v9 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since user does not have access to camera clips: %@", (uint8_t *)&v19, 0x16u);

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
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v19, 0xCu);

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
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserPhotosPersonDataManager personManager](self, "personManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD78C0]);
  objc_msgSend(v8, "handleUpdatedSettings:", v9);

  if (v6)
  {
    -[HMDUserPhotosPersonDataManager photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser](self, "photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);
    v12 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not removing user photos person cloud data for zone UUID %@ because another home current user exists that is still using the zone", (uint8_t *)&v21, 0x16u);

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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing user photos person cloud data for zone UUID: %@ isDueToHomeGraphObjectRemoval: %@", (uint8_t *)&v21, 0x20u);

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

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserPhotosPersonDataManager settingsModel](self, "settingsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmbIsDifferentFromModel:differingFields:", v6, 0))
  {
    v7 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@ previous model: %@", (uint8_t *)&v38, 0x20u);

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
        v21 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID changed from %@ to %@. Configuring photos person manager", (uint8_t *)&v38, 0x20u);

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
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v8;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543362;
          v39 = v32;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID is now nil. Removing photos person manager", (uint8_t *)&v38, 0xCu);

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
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    v55 = v8;
    v56 = 2112;
    v57 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager settings message: %@", buf, 0x16u);

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
        v13 = *MEMORY[0x24BDD7140];
        v53 = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
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
            if (objc_msgSend(v11, "isOwner")
              && (objc_msgSend(v12, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
            {
              v23 = (void *)objc_msgSend(v4, "mutableCopy");
              objc_msgSend(v23, "setName:", CFSTR("HMDUPPM.m.updateOwnerSettings"));
              objc_msgSend(v12, "residentSyncManager");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "performResidentRequest:options:", v23, 0);

            }
            else
            {
              -[HMDUserPhotosPersonDataManager updateSettingsModelWithSettings:](v6, "updateSettingsModelWithSettings:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = MEMORY[0x24BDAC760];
              v51[0] = MEMORY[0x24BDAC760];
              v51[1] = 3221225472;
              v51[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke;
              v51[3] = &unk_24E79BCF0;
              v20 = v4;
              v52 = v20;
              objc_msgSend(v18, "addSuccessBlock:", v51);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v49[0] = v19;
              v49[1] = 3221225472;
              v49[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2;
              v49[3] = &unk_24E79BD80;
              v50 = v20;
              v22 = (id)objc_msgSend(v21, "addFailureBlock:", v49);

              v23 = v52;
            }
            goto LABEL_32;
          }
          v44 = (void *)MEMORY[0x227676638]();
          v45 = v6;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v55 = v47;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot enable importing from Photo Library because cloud photos is not enabled", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v44);
          objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2007);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = (void *)MEMORY[0x227676638]();
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
            v55 = v41;
            v56 = 2112;
            v57 = v42;
            _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not find photos person manager settings in message payload: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v38);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        v23 = (void *)v43;
        objc_msgSend(v4, "respondWithError:", v43);
LABEL_32:

        goto LABEL_23;
      }
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v6;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v31;
        v56 = 2112;
        v57 = v11;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Person manager settings cannot be updated for user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v32 = (void *)MEMORY[0x24BDD1540];
      v33 = 17;
    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = v6;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v37;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      v32 = (void *)MEMORY[0x24BDD1540];
      v33 = 48;
    }
    objc_msgSend(v32, "hmErrorWithCode:", v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
LABEL_23:

    goto LABEL_24;
  }
  v24 = (void *)MEMORY[0x227676638]();
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v27;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v12);
LABEL_24:

}

- (void)handleUpdatePersonManagerOwnerSettingsMessage:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  HMDUserPhotosPersonDataManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDUserPhotosPersonDataManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager owner settings message: %@", buf, 0x16u);

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
      v13 = v12;
      objc_msgSend(v12, "residentSyncManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke;
      v24[3] = &unk_24E795E50;
      v24[4] = v6;
      v25 = v4;
      objc_msgSend(v14, "interceptRemoteResidentRequest:proceed:", v25, v24);

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v23);

      v13 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__HMDUserPhotosPersonDataManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserPhotosPersonDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDUserPhotosPersonDataManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "homeModelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPhotosPersonDataManager user](self, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqual:", v14);

    if (v15)
    {
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
        v28 = v10;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification about modified shared user data root: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend((id)objc_opt_class(), "settingsModelFromSharedUserDataRoot:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPhotosPersonDataManager workQueue](v17, "workQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __75__HMDUserPhotosPersonDataManager_didInsertOrUpdateModel_changedProperties___block_invoke;
      v23[3] = &unk_24E79C268;
      v23[4] = v17;
      v24 = v20;
      v22 = v20;
      dispatch_async(v21, v23);

    }
  }

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

- (HMCContext)backingStoreContext
{
  return (HMCContext *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCoreDataCloudTransform)cloudTransform
{
  return (HMDCoreDataCloudTransform *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)supportsFaceClassification
{
  return self->_supportsFaceClassification;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver
{
  return (HMDCloudPhotosSettingObserver *)objc_getProperty(self, a2, 80, 1);
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
  return (HMDPhotosPersonManagerSettingsModel *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSettingsModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)personManagerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setPersonManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personManagerFactory, 0);
  objc_storeStrong((id *)&self->_settingsModel, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_cloudPhotosSettingObserver, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_backingStoreContext, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

uint64_t __75__HMDUserPhotosPersonDataManager_didInsertOrUpdateModel_changedProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedSettingsModel:", *(_QWORD *)(a1 + 40));
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

  v19 = *MEMORY[0x24BDAC8D0];
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
        v6 = (void *)MEMORY[0x227676638]();
        v7 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v9;
          _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since Face Classification was disabled", (uint8_t *)&v17, 0xCu);

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
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v17, 0xCu);

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

void __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BDD7140];
  v27[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectForKey:ofClasses:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateSettingsModelWithSettings:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_47;
    v21[3] = &unk_24E79BCF0;
    v9 = v3;
    v22 = v9;
    objc_msgSend(v7, "addSuccessBlock:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_2;
    v19[3] = &unk_24E79BD80;
    v20 = v9;
    v11 = (id)objc_msgSend(v10, "addFailureBlock:", v19);

    v12 = v22;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "messagePayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find photos person manager settings in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "respondWithError:", v12);
  }

}

uint64_t __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

void __56__HMDUserPhotosPersonDataManager_persistedSettingsModel__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldUseUserModelForSettings");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "userUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "backingStoreContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v4, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sharePhotosFaceClassifications");
  }
  else
  {
    objc_msgSend(v3, "homeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "backingStoreContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserDataRoot, "modelWithModelID:context:error:", v7, v9, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "sharePhotosFaceClassifications"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSharingFaceClassificationsEnabled:", v10);

  objc_msgSend(v12, "photosPersonDataZoneUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setZoneUUID:", v11);

}

void __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldUseUserModelForSettings");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "userUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "backingStoreContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "sharingFaceClassificationsEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSharePhotosFaceClassifications:", v8);

    objc_msgSend(*(id *)(a1 + 40), "zoneUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhotosPersonDataZoneUUID:", v9);
  }
  else
  {
    objc_msgSend(v3, "homeUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "backingStoreContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserDataRoot, "modelWithModelID:context:error:", v10, v12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "sharingFaceClassificationsEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSharePhotosFaceClassifications:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 40), "zoneUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhotosPersonDataZoneUUID:", v14);

    objc_msgSend((id)objc_opt_class(), "settingsModelFromSharedUserDataRoot:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;
  }

  objc_msgSend(*(id *)(a1 + 32), "backingStoreContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v18 = objc_msgSend(v17, "save:", &v24);
  v19 = v24;

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v23;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings model with settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v19);
  }

}

uint64_t __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke_37(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedSettingsModel:");
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

HMDPhotosPersonManager *__183__HMDUserPhotosPersonDataManager_initWithUser_messageDispatcher_backingStoreContext_cloudTransform_workQueue_supportsFaceClassification_notificationCenter_cloudPhotosSettingObserver___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  return (HMPhotosPersonManagerSettings *)objc_alloc_init(MEMORY[0x24BDD78C0]);
}

+ (id)settingsModelUUIDWithUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("F378F892-E6AD-4A6E-927A-C04D01A75448"));
  v6 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)settingsModelFromSharedUserDataRoot:(id)a3
{
  id v3;
  HMDPhotosPersonManagerSettingsModel *v4;
  void *v5;
  void *v6;
  HMDPhotosPersonManagerSettingsModel *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = [HMDPhotosPersonManagerSettingsModel alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID](HMDPhotosPersonManagerSettingsModel, "sentinelParentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, v6);

  objc_msgSend(v3, "photosPersonDataZoneUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotosPersonManagerSettingsModel setZoneUUID:](v7, "setZoneUUID:", v8);

  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(v3, "sharePhotosFaceClassifications");

  objc_msgSend(v9, "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotosPersonManagerSettingsModel setSharingFaceClassificationsEnabled:](v7, "setSharingFaceClassificationsEnabled:", v11);

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38 != -1)
    dispatch_once(&logCategory__hmf_once_t38, &__block_literal_global_49_22702);
  return (id)logCategory__hmf_once_v39;
}

void __45__HMDUserPhotosPersonDataManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39;
  logCategory__hmf_once_v39 = v0;

}

@end
