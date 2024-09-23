@implementation HMDCameraProfileSettingsManager

- (HMDCameraProfileSettingsManager)initWithUniqueIdentifier:(id)a3 hapAccessory:(id)a4 workQueue:(id)a5 coreDataAdapter:(id)a6 notificationCenter:(id)a7 bulletinBoard:(id)a8 characteristicsAvailabilityListener:(id)a9 featuresDataSource:(id)a10
{
  id v17;
  id v18;
  HMDCameraProfileSettingsManager *v19;
  HMDCameraProfileSettingsManager *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *clientIdentifier;
  NSOperationQueue *v26;
  NSOperationQueue *accessModeOperationQueue;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v17 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v18 = a10;
  v35.receiver = self;
  v35.super_class = (Class)HMDCameraProfileSettingsManager;
  v19 = -[HMDCameraProfileSettingsManager init](&v35, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a3);
    objc_storeWeak((id *)&v20->_hapAccessory, v17);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    objc_storeStrong((id *)&v20->_coreDataAdapter, a6);
    objc_storeStrong((id *)&v20->_notificationCenter, a7);
    objc_storeStrong((id *)&v20->_bulletinBoard, a8);
    objc_storeStrong((id *)&v20->_characteristicsAvailabilityListener, a9);
    objc_storeStrong((id *)&v20->_featuresDataSource, a10);
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.HMDCameraProfileSettingsManager.%@"), CFSTR("com.apple.HomeKitDaemon.Local"), v23, v29, v30, v31, v32, v33, v34);
    v24 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v24;

    v26 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    accessModeOperationQueue = v20->_accessModeOperationQueue;
    v20->_accessModeOperationQueue = v26;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_accessModeOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v20->_accessModeOperationQueue, "setUnderlyingQueue:", v20->_workQueue);
  }

  return v20;
}

- (HMDCameraProfileSettingsManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraProfileSettingsCoreDataAdapter *v14;
  HMDFeaturesDataSource *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCharacteristicsAvailabilityListener *v19;
  void *v20;
  void *v21;
  HMDCameraProfileSettingsManager *v22;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("HMDCameraProfileSettingsUUIDSalt");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hm_deriveUUIDFromBaseUUID:withSalts:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD1880];
  v27 = CFSTR("2b32a3ee-3908-406e-890d-74f9c410ef2b");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hm_deriveUUIDFromBaseUUID:withSalts:", v11, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HMDCameraProfileSettingsCoreDataAdapter initWithHAPAccessory:cameraProfileSettingsModelID:derivedPropertiesModelID:]([HMDCameraProfileSettingsCoreDataAdapter alloc], "initWithHAPAccessory:cameraProfileSettingsModelID:derivedPropertiesModelID:", v8, v11, v24);
  v15 = objc_alloc_init(HMDFeaturesDataSource);
  v25[0] = *MEMORY[0x24BDD6C18];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDD5918]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = *MEMORY[0x24BDD6BA0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDD58F0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HMDCharacteristicsAvailabilityListener initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:]([HMDCharacteristicsAvailabilityListener alloc], "initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:", v8, v7, v18);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMDCameraProfileSettingsManager initWithUniqueIdentifier:hapAccessory:workQueue:coreDataAdapter:notificationCenter:bulletinBoard:characteristicsAvailabilityListener:featuresDataSource:](self, "initWithUniqueIdentifier:hapAccessory:workQueue:coreDataAdapter:notificationCenter:bulletinBoard:characteristicsAvailabilityListener:featuresDataSource:", v11, v8, v7, v14, v20, v21, v19, v15);

  return v22;
}

- (void)dealloc
{
  void *v3;
  HMDCameraProfileSettingsManager *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating camera profile settings manager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraProfileSettingsManager _setManuallyDisabledCharacteristicNotificationsEnabled:](v4, "_setManuallyDisabledCharacteristicNotificationsEnabled:", 0);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraProfileSettingsManager;
  -[HMDCameraProfileSettingsManager dealloc](&v7, sel_dealloc);
}

- (void)configureWithMessageDispatcher:(id)a3 adminMessageDispatcher:(id)a4 deviceIsResidentCapable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  HMDCameraProfileSettingsManager *v10;
  NSObject *v11;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraProfileSettingsManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDCameraProfileSettingsManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v5 = a5;
  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v52 = a4;
  v49 = v8;
  -[HMDCameraProfileSettingsManager setMsgDispatcher:](self, "setMsgDispatcher:", v8);
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638](objc_msgSend(v50, "setRoles:", 4));
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v10, "isCurrentDeviceConfirmedPrimaryResident");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v12;
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Configured with deviceIsResidentCapable=%@ and isCurrentDevicePrimaryResident=%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCameraProfileSettingsManager hapAccessory](v10, "hapAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v16, 4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v53;
  v57[1] = v51;
  v57[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD56B0], v10, v18, sel__handleUpdateAccessModeMessage_);
  objc_msgSend(v52, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD56D0], v10, v18, sel__handleUpdateRecordingTriggerEventsMessage_);
  objc_msgSend(v52, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD56B8], v10, v18, sel__handleUpdateActivityZonesMessage_);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v16, 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v19;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCameraSettingsDidChangeMessage"), v10, v21, sel__handleCameraSettingsDidChangeMessage_);

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v16, 3, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v22;
  v55[1] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCameraProfileSettingsSynchronizeCloudStorageWithRecordingAccessModesMessage"), v10, v23, sel__handleSynchronizeCloudStorageWithRecordingAccessModesMessage_);

  v54[0] = v53;
  v54[1] = v51;
  v24 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7C10], v10, v25, sel__handleBulletinBoardNotificationCommitMessage_);
  objc_msgSend(v49, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD56A8], v10, v25, sel__handleUpdateAccessModeChangeNotificationEnabledMessage_);
  objc_msgSend(v49, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD56C8], v10, v25, sel__handleUpdateReachabilityEventNotificationEnabledMessage_);

  -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeObserver:", v10);

  -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentUser");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", v10, sel_handleUserRemoteAccessDidChangeNotification_, CFSTR("HMDUserRemoteAccessDidChangeNotification"), v28);

  if (v5)
  {
    -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "residentDeviceManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v10, sel_handlePrimaryResidentUpdatedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v30);

    -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v10, sel_handlePrimaryResidentUpdatedNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

    -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presenceMonitor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v10, sel_handleHomePresenceEvaluatedNotification_, CFSTR("HMDHomePresenceEvaluatedNotification"), v33);

    -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v10, sel_handleAccessoryConfiguredNotification_, CFSTR("HMDAccessoryConnectedNotification"), v24);

    -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v10, sel_handleRecordingManagementServiceDidUpdateNotification_, CFSTR("HMDRecordingManagementServiceDidUpdateNotification"), v24);

    -[HMDCameraProfileSettingsManager notificationCenter](v10, "notificationCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v10, sel_handleCharacteristicsValueUpdatedNotification_, CFSTR("HMDNotificationCharacteristicValueUpdated"), v24);

    if (objc_msgSend(v24, "isReachable"))
      -[HMDCameraProfileSettingsManager _setManuallyDisabledCharacteristicNotificationsEnabled:](v10, "_setManuallyDisabledCharacteristicNotificationsEnabled:", 1);
    objc_msgSend(v16, "presenceMonitor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "currentHomePresence");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[HMDCameraProfileSettingsManager _isAnyUserAtHomeForPresence:](v10, "_isAnyUserAtHomeForPresence:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager setAnyUserAtHome:](v10, "setAnyUserAtHome:", v39);

      v40 = (void *)MEMORY[0x227676638]();
      v41 = v10;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfileSettingsManager isAnyUserAtHome](v41, "isAnyUserAtHome");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v43;
        v60 = 2112;
        v61 = v44;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Initial isAnyUserAtHome is %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
    }
    else
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = v10;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v59 = v48;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Current home presence is unavailable", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      -[HMDCameraProfileSettingsManager setAnyUserAtHome:](v46, "setAnyUserAtHome:", 0);
    }

  }
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraProfileSettingsManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting settings manager for camera profile %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCameraProfileSettingsManager _start](v8, "_start");

}

- (void)remove
{
  NSObject *v3;
  void *v4;
  HMDCameraProfileSettingsManager *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Deleting camera settings", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

- (_HMCameraUserSettings)currentSettings
{
  void *v3;
  void *v4;

  -[HMDCameraProfileSettingsManager currentSettingsModel](self, "currentSettingsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _settingsFromSettingsModel:](self, "_settingsFromSettingsModel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_HMCameraUserSettings *)v4;
}

- (id)currentNotificationSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[HMDCameraProfileSettingsManager cameraBulletinNotificationManager](self, "cameraBulletinNotificationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraUserNotificationSettingsForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BDD75A8]);
  v8 = v7;

  return v8;
}

- (id)currentSettingsModel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager coreDataAdapter](self, "coreDataAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "fetchCameraProfileSettingsModelWithError:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (!v4)
  {
    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        v18 = 2112;
        v19 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentSettings: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting unavailable, using default values", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraProfileSettingsManager defaultSettingsModel](v11, "defaultSettingsModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDCameraProfileSettingsManager _updateDerivedPropertiesOnSettingsModel:](self, "_updateDerivedPropertiesOnSettingsModel:", v4);

  return v4;
}

- (HMDCameraProfileSettingsModel)defaultSettingsModel
{
  void *v3;
  void *v4;

  -[HMDCameraProfileSettingsManager _settingsModelForUpdate](self, "_settingsModelForUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVersion:", 1);
  objc_msgSend(v3, "setAccessModeAtHome:", 1);
  objc_msgSend(v3, "setAccessModeNotAtHome:", 1);
  objc_msgSend(v3, "setRecordingEventTriggers:", 14);
  -[HMDCameraProfileSettingsManager doorbellInputEventCharacteristic](self, "doorbellInputEventCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "setRecordingEventTriggers:", objc_msgSend(v3, "recordingEventTriggers") | 0x10);
  return (HMDCameraProfileSettingsModel *)v3;
}

- (unint64_t)supportedFeatures
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v35;
    v8 = *MEMORY[0x24BDD6B68];
    v9 = *MEMORY[0x24BDD6B70];
    v32 = *MEMORY[0x24BDD6B60];
    v30 = *MEMORY[0x24BDD57B0];
    v29 = *MEMORY[0x24BDD5930];
    v28 = *MEMORY[0x24BDD58A8];
    v10 = *MEMORY[0x24BDD5770];
    v31 = *MEMORY[0x24BDD5980];
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "serviceType", v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v8);

        if (v14)
        {
          objc_msgSend(v12, "findCharacteristicWithType:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v6 |= v15 != 0;
          continue;
        }
        objc_msgSend(v12, "serviceType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if (v17)
        {
          objc_msgSend(v12, "findCharacteristicWithType:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = 6;
          if (!v18)
            v19 = 2;
          v20 = v19 | v6;
          objc_msgSend(v12, "findCharacteristicWithType:", v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v20 | 0x40;
        }
        else
        {
          objc_msgSend(v12, "serviceType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v32);

          if (!v24)
            continue;
          objc_msgSend(v12, "findCharacteristicWithType:", v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            v20 = v6 | 0x10;
          else
            v20 = v6;
          objc_msgSend(v12, "findCharacteristicWithType:", v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            v20 |= 8uLL;
          objc_msgSend(v12, "findCharacteristicWithType:", v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v20 | 0x20;
        }
        if (v21)
          v6 = v22;
        else
          v6 = v20;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v5)
        goto LABEL_26;
    }
  }
  v6 = 0;
LABEL_26:

  return v6;
}

- (void)performAccessModeOperationWithBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(id *);
  void *v11;
  HMDCameraProfileSettingsManager *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE3F148]);
  objc_initWeak(&location, v5);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __71__HMDCameraProfileSettingsManager_performAccessModeOperationWithBlock___block_invoke;
  v11 = &unk_24E78C1B0;
  objc_copyWeak(&v14, &location);
  v12 = self;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "addExecutionBlock:", &v8);
  -[HMDCameraProfileSettingsManager accessModeOperationQueue](self, "accessModeOperationQueue", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)disableRecordingAccessModes
{
  NSObject *v3;
  _QWORD v4[5];

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__HMDCameraProfileSettingsManager_disableRecordingAccessModes__block_invoke;
  v4[3] = &unk_24E790E20;
  v4[4] = self;
  -[HMDCameraProfileSettingsManager performAccessModeOperationWithBlock:](self, "performAccessModeOperationWithBlock:", v4);
}

- (void)synchronizeCloudStorageWithRecordingAccessModes
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDCameraProfileSettingsManager *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDCameraProfileSettingsManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;
  void *v20;
  void *v21;
  HMDRemoteDeviceMessageDestination *v22;
  HMDRemoteMessage *v23;
  void *v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryResident");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "isCurrentDevice");
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Locally synchronizing cloud storage with recording access modes because we are the primary resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __82__HMDCameraProfileSettingsManager_synchronizeCloudStorageWithRecordingAccessModes__block_invoke;
      v25[3] = &unk_24E790E20;
      v25[4] = v9;
      -[HMDCameraProfileSettingsManager performAccessModeOperationWithBlock:](v9, "performAccessModeOperationWithBlock:", v25);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Forwarding request to synchronize cloud storage with recording access modes to primary resident: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v19 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDCameraProfileSettingsManager messageTargetUUID](v9, "messageTargetUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v19, "initWithTarget:device:", v20, v21);

      v23 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDCameraProfileSettingsSynchronizeCloudStorageWithRecordingAccessModesMessage"), v22, 0, 3, 1, 0.0);
      -[HMDCameraProfileSettingsManager msgDispatcher](v9, "msgDispatcher");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendMessage:", v23);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot find primary resident to synchronize cloud storage with recording access modes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (BOOL)isRecordingEnabled
{
  void *v3;
  char v4;
  void *v5;

  -[HMDCameraProfileSettingsManager currentSettingsModel](self, "currentSettingsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessModeAtHome");
  if ((HMIsRecordingAllowedForCameraAccessMode() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HMDCameraProfileSettingsManager currentSettingsModel](self, "currentSettingsModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessModeNotAtHome");
    v4 = HMIsRecordingAllowedForCameraAccessMode();

  }
  return v4;
}

- (HMDCameraBulletinNotificationManager)cameraBulletinNotificationManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraBulletinNotificationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCameraBulletinNotificationManager *)v4;
}

- (void)synchronizeSettingsToCameraWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDCameraProfileSettingsManager_synchronizeSettingsToCameraWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleUpdateAccessModeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  HMDCameraProfileSettingsManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  HMDCameraProfileSettingsManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  HMDCameraProfileSettingsManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  HMDCameraProfileSettingsManager *v39;
  NSObject *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  unint64_t v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v47 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change access mode", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD5670]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD5690]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v17;
      v48 = 2112;
      v49 = (unint64_t)v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot find required parameters in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 20;
    goto LABEL_26;
  }
  v21 = objc_msgSend(v10, "unsignedIntegerValue");
  v22 = objc_msgSend(v12, "unsignedIntegerValue");
  if (v21 >= 4)
  {
    v31 = MEMORY[0x227676638](v22);
    v32 = v7;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v34;
      v48 = 2048;
      v49 = v21;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Invalid access mode enum value received: %ld", buf, 0x16u);

    }
    v35 = (void *)v31;
  }
  else
  {
    v23 = v22;
    if (HMIsRecordingAllowedForCameraAccessMode()
      && (-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 2) == 0)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfileSettingsManager supportedFeatures](v25, "supportedFeatures");
        HMCameraSupportedFeaturesAsString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v27;
        v48 = 2112;
        v49 = (unint64_t)v28;
        v50 = 2112;
        v51 = v29;
        v30 = "%{public}@Requested access mode %@ enables recording but supported features do not include recording: %@";
LABEL_24:
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);

        goto LABEL_25;
      }
      goto LABEL_25;
    }
    if (HMIsStreamingAllowedForCameraAccessMode()
      && (-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 1) == 0)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfileSettingsManager supportedFeatures](v25, "supportedFeatures");
        HMCameraSupportedFeaturesAsString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v27;
        v48 = 2112;
        v49 = (unint64_t)v28;
        v50 = 2112;
        v51 = v29;
        v30 = "%{public}@Requested access mode %@ enables streaming but supported features do not include streaming: %@";
        goto LABEL_24;
      }
LABEL_25:

      objc_autoreleasePoolPop(v24);
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = 48;
      goto LABEL_26;
    }
    if (v23 == 3)
    {
      v37 = 1;
      goto LABEL_32;
    }
    if (v23 == 4)
    {
      v37 = 0;
LABEL_32:
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke;
      v42[3] = &unk_24E783870;
      v42[4] = v7;
      v44 = v21;
      v45 = v37;
      v43 = v4;
      -[HMDCameraProfileSettingsManager performAccessModeOperationWithBlock:](v7, "performAccessModeOperationWithBlock:", v42);

      goto LABEL_27;
    }
    v38 = MEMORY[0x227676638]();
    v39 = v7;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v41;
      v48 = 2048;
      v49 = v23;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Invalid presence type enum value received: %ld", buf, 0x16u);

    }
    v35 = (void *)v38;
  }
  objc_autoreleasePoolPop(v35);
  v19 = (void *)MEMORY[0x24BDD1540];
  v20 = 3;
LABEL_26:
  objc_msgSend(v19, "hmErrorWithCode:", v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v36);

LABEL_27:
}

- (void)_handleSynchronizeCloudStorageWithRecordingAccessModesMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to synchronize cloud storage with recording access modes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __97__HMDCameraProfileSettingsManager__handleSynchronizeCloudStorageWithRecordingAccessModesMessage___block_invoke;
  v10[3] = &unk_24E790E20;
  v10[4] = v7;
  -[HMDCameraProfileSettingsManager performAccessModeOperationWithBlock:](v7, "performAccessModeOperationWithBlock:", v10);

}

- (void)_handleUpdateRecordingTriggerEventsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraProfileSettingsManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCameraProfileSettingsManager *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v28 = 138543362;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change recording trigger events", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if ((-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 2) != 0)
  {
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD56A0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[HMDCameraProfileSettingsManager currentSettingsModel](v7, "currentSettingsModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x227676638](objc_msgSend(v16, "setRecordingEventTriggers:", objc_msgSend(v16, "recordingEventTriggers") & 0xFFFFFFFFFFFFFFE0 | objc_msgSend(v15, "unsignedIntegerValue") & 0x1F));
      v18 = v7;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraSignificantEventTypesAsString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v20;
        v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating recordingTriggerEvents to %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDCameraProfileSettingsManager coreDataAdapter](v18, "coreDataAdapter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager _coreDataUpdateCompletionForMessage:](v18, "_coreDataUpdateCompletionForMessage:", v4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateCameraProfileSettingsModel:completion:", v16, v23);

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v27;
        v30 = 2112;
        v31 = 0;
        v32 = 2112;
        v33 = v4;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid parameter: %@ for message: %@", (uint8_t *)&v28, 0x20u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager supportedFeatures](v11, "supportedFeatures");
      HMCameraSupportedFeaturesAsString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)_handleUpdateAccessModeChangeNotificationEnabledMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDCameraProfileSettingsManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDCameraProfileSettingsManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v26 = 138543362;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change access mode change notification enabled", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraProfileSettingsManager hapAccessory](v7, "hapAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bulletinNotificationsSupported");

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Access mode change notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v26, 0xCu);
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);
    goto LABEL_15;
  }
  if ((-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 1) == 0
    && (-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 4) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager supportedFeatures](v14, "supportedFeatures");
      HMCameraSupportedFeaturesAsString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ support neither streaming nor recording access control.", (uint8_t *)&v26, 0x16u);

LABEL_10:
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v19 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BDD5668]);
  v20 = (void *)MEMORY[0x227676638]();
  v21 = v7;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v23;
    v28 = 2112;
    v29 = v24;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating access mode change notification enabled to %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDCameraProfileSettingsManager currentNotificationSettings](v21, "currentNotificationSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v18, "setAccessModeChangeNotificationEnabled:", v19);
  -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](v21, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v18, v4);
LABEL_15:

}

- (void)_handleBulletinBoardNotificationCommitMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDCameraProfileSettingsManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCameraProfileSettingsManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  HMDCameraProfileSettingsManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDCameraProfileSettingsManager *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v37 = 138543362;
    v38 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change bulletin board", (uint8_t *)&v37, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraProfileSettingsManager hapAccessory](v7, "hapAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bulletinNotificationsSupported");

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v37, 0xCu);
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);
    goto LABEL_24;
  }
  if ((-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 2) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager supportedFeatures](v14, "supportedFeatures");
      HMCameraSupportedFeaturesAsString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v16;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", (uint8_t *)&v37, 0x16u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v19 = (void *)*MEMORY[0x24BDD7C20];
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD7C20]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v4, "predicateForKey:", *MEMORY[0x24BDD7C18]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543874;
      v38 = v24;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating smart bulletin board notification to enabled: %@, condition: %@", (uint8_t *)&v37, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDCameraProfileSettingsManager currentNotificationSettings](v22, "currentNotificationSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v26, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v26, "setSmartBulletinBoardNotificationCondition:", v20);
    -[HMDCameraProfileSettingsManager currentNotificationSettings](v22, "currentNotificationSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (v28)
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v22;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v32;
        v39 = 2112;
        v40 = v26;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Requested changes match existing notification settings: %@", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(v4, "respondWithSuccess");
    }
    else
    {
      -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](v22, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v26, v4);
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v7;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v36;
      v39 = 2112;
      v40 = v19;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board commit message missing key: %@", (uint8_t *)&v37, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);
  }

LABEL_24:
}

- (void)_updateCameraBulletinNotificationManagerWithSettings:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMDCameraProfileSettingsManager doorbellInputEventCharacteristic](self, "doorbellInputEventCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bulletinBoardNotification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEnabled");
  objc_initWeak(&location, self);
  -[HMDCameraProfileSettingsManager cameraBulletinNotificationManager](self, "cameraBulletinNotificationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke;
  v16[3] = &unk_24E796418;
  objc_copyWeak(&v19, &location);
  v14 = v7;
  v17 = v14;
  v15 = v6;
  v18 = v15;
  objc_msgSend(v12, "updateNotificationRegistrationsWithSettings:accessory:doorbellPressNotificationEnabled:completion:", v15, v13, v11, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_handleUpdateActivityZonesMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMDCameraProfileSettingsManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDCameraProfileSettingsManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCameraProfileSettingsManager *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v42 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to update activity zones", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if ((-[HMDCameraProfileSettingsManager supportedFeatures](v7, "supportedFeatures") & 2) != 0)
  {
    objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD56C0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD1620];
      v17 = (void *)MEMORY[0x24BDBCF20];
      v47[0] = objc_opt_class();
      v47[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v16, "unarchivedObjectOfClasses:fromData:error:", v19, v15, &v40);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v40;

      if (v20)
      {
        v22 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BDD5678]);
        -[HMDCameraProfileSettingsManager currentSettingsModel](v7, "currentSettingsModel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActivityZones:", v20);
        v24 = (void *)MEMORY[0x227676638](objc_msgSend(v23, "setActivityZonesIncludedForSignificantEventDetection:", v22));
        v25 = v7;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v27;
          v43 = 2112;
          v44 = v20;
          v45 = 2112;
          v46 = v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating activity zones: %@ activityZonesIncludedForSignificantEventDetection: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v24);
        -[HMDCameraProfileSettingsManager coreDataAdapter](v25, "coreDataAdapter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfileSettingsManager _coreDataUpdateCompletionForMessage:](v25, "_coreDataUpdateCompletionForMessage:", v4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "updateCameraProfileSettingsModel:completion:", v23, v30);

      }
      else
      {
        v36 = (void *)MEMORY[0x227676638]();
        v37 = v7;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v39;
          v43 = 2112;
          v44 = v21;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize activity zones: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v23);
      }

    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = v7;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        v43 = 2112;
        v44 = v35;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find activity zones in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v21);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager supportedFeatures](v11, "supportedFeatures");
      HMCameraSupportedFeaturesAsString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v13;
      v43 = 2112;
      v44 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)_handleUpdateReachabilityEventNotificationEnabledMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDCameraProfileSettingsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraProfileSettingsManager *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v26 = 138543362;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change reachability event notification enabled", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraProfileSettingsManager hapAccessory](v7, "hapAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bulletinNotificationsSupported");

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v4, "messagePayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hmf_BOOLForKey:", *MEMORY[0x24BDD5698]);

    v15 = (void *)MEMORY[0x227676638]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMFEnabledStatusToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Registering reachability event notifications as %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCameraProfileSettingsManager currentNotificationSettings](v16, "currentNotificationSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(v21, "setReachabilityEventNotificationEnabled:", v14);
    -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](v16, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v21, v4);
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Camera reachability notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);
  }

}

- (void)_handleCameraSettingsDidChangeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  HMDCameraAccessModeChangedBulletin *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  HMDCameraAccessModeChangedBulletin *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  HMDCameraAccessModeChangedBulletin *v24;
  void *v25;
  HMDCameraProfileSettingsManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCameraProfileSettingsManager *v31;
  NSObject *v32;
  void *v33;
  HMDCameraAccessModeChangedBulletin *v34;
  HMDCameraProfileSettingsManager *v35;
  NSObject *v36;
  void *v37;
  HMDCameraAccessModeChangedBulletin *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *contexta;
  void *context;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  HMDCameraAccessModeChangedBulletin *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v9;
    v53 = 2112;
    v54 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received camera settings did change message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("HMDCS.AccessModeChange"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmf_numberForKey:", CFSTR("HMDCS.amu.value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmf_numberForKey:", CFSTR("HMDCS.amu.changeReason"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmf_dateForKey:", CFSTR("HMDCS.amu.changeDate"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 && v50 && v13)
  {
    -[HMDCameraProfileSettingsManager hapAccessory](v7, "hapAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cameraProfiles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "home");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager currentNotificationSettings](v7, "currentNotificationSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isAccessModeChangeNotificationEnabled");

    if (v19
      && v17
      && v49
      && -[HMDCameraProfileSettingsManager canRevealCurrentAccessMode](v7, "canRevealCurrentAccessMode"))
    {
      v20 = [HMDCameraAccessModeChangedBulletin alloc];
      v45 = v17;
      v21 = objc_msgSend(v12, "unsignedIntegerValue");
      v22 = objc_msgSend(v50, "integerValue");
      v23 = v21;
      v17 = v45;
      v24 = -[HMDCameraAccessModeChangedBulletin initWithAccessMode:camera:home:changeReason:changeDate:](v20, "initWithAccessMode:camera:home:changeReason:changeDate:", v23, v45, v49, v22, v14);
      if (v24)
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = v7;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          contexta = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v28;
          v53 = 2112;
          v54 = v24;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Posting camera access mode changed bulletin based upon notification: %@", buf, 0x16u);

          v25 = contexta;
        }

        objc_autoreleasePoolPop(v25);
        -[HMDCameraProfileSettingsManager bulletinBoard](v26, "bulletinBoard");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "insertCameraAccessModeChangedBulletin:", v24);

        v17 = v45;
      }

    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v35 = v7;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v38 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
        v42 = v12;
        if (v17)
          v39 = CFSTR("<not nil>");
        else
          v39 = CFSTR("<nil>");
        v46 = v17;
        if (v49)
          v40 = CFSTR("<not nil>");
        else
          v40 = CFSTR("<nil>");
        -[HMDCameraProfileSettingsManager canRevealCurrentAccessMode](v35, "canRevealCurrentAccessMode", v42);
        HMFBooleanToString();
        v44 = v14;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v52 = v37;
        v53 = 2112;
        v54 = v38;
        v55 = 2112;
        v56 = v39;
        v12 = v43;
        v57 = 2112;
        v58 = v40;
        v17 = v46;
        v59 = 2112;
        v60 = v41;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Not posting access mode change bulletin due to settings change message because accessModeChangeNotificationEnabled=%@ cameraProfile=%@ home=%@ canRevealCurrentAccessMode=%@", buf, 0x34u);

        v14 = v44;
      }

      objc_autoreleasePoolPop(context);
    }
    objc_msgSend(v4, "respondWithSuccess");

  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v7;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v34 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v33;
      v53 = 2112;
      v54 = v34;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid access mode change payload %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)handlePrimaryResidentUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraProfileSettingsManager_handlePrimaryResidentUpdatedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHomePresenceEvaluatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident", a3))
  {
    -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__HMDCameraProfileSettingsManager_handleHomePresenceEvaluatedNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (void)_evaluateHomePresence
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraProfileSettingsManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDCameraProfileSettingsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCameraProfileSettingsManager *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentHomePresence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v11;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    -[HMDCameraProfileSettingsManager _isAnyUserAtHomeForPresence:](v9, "_isAnyUserAtHomeForPresence:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager isAnyUserAtHome](v9, "isAnyUserAtHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v9;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraProfileSettingsManager isAnyUserAtHome](v16, "isAnyUserAtHome");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        v29 = 2112;
        v30 = v12;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating isAnyUserAtHome from %@ to %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDCameraProfileSettingsManager setAnyUserAtHome:](v16, "setAnyUserAtHome:", v12);
      -[HMDCameraProfileSettingsManager currentSettingsModel](v16, "currentSettingsModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager _updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:](v16, "_updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:", v20, 0, CFSTR("Presence changed"));

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Presence is unavailable; setting isAnyUserAtHome to nil",
        (uint8_t *)&v25,
        0xCu);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDCameraProfileSettingsManager setAnyUserAtHome:](v22, "setAnyUserAtHome:", 0);
  }

}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMDCameraProfileSettingsManager_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleRecordingManagementServiceDidUpdateNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__HMDCameraProfileSettingsManager_handleRecordingManagementServiceDidUpdateNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__HMDCameraProfileSettingsManager_handleCharacteristicsValueUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDCameraProfileSettingsManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleBulletinNotificationEnableStateDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDCameraProfileSettingsManager *v9;

  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__HMDCameraProfileSettingsManager_handleBulletinNotificationEnableStateDidChangeNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleConnectedToAccessory
{
  NSObject *v3;
  void *v4;
  HMDCameraProfileSettingsManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraProfileSettingsManager _setManuallyDisabledCharacteristicNotificationsEnabled:](v5, "_setManuallyDisabledCharacteristicNotificationsEnabled:", 1);
  if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v5, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDCameraProfileSettingsManager currentSettingsModel](v5, "currentSettingsModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager _updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:](v5, "_updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:", v8, 0, CFSTR("Accessory became reachable"));

    -[HMDCameraProfileSettingsManager _synchronizeCurrentAccessModeSettingToCameraWithCompletion:](v5, "_synchronizeCurrentAccessModeSettingToCameraWithCompletion:", 0);
    if (-[HMDCameraProfileSettingsManager needsInitialSettingsCharacteristicSynchronization](v5, "needsInitialSettingsCharacteristicSynchronization"))
    {
      -[HMDCameraProfileSettingsManager _writeInitialSettingsCharacteristicsToCamera](v5, "_writeInitialSettingsCharacteristicsToCamera");
    }
  }
}

- (HMDCameraProfileSettingsDerivedPropertiesModel)derivedPropertiesModel
{
  void *v3;
  HMDCameraProfileSettingsDerivedPropertiesModel *v4;
  id v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  HMDCameraProfileSettingsDerivedPropertiesModel *v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager coreDataAdapter](self, "coreDataAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "fetchDerivedPropertiesModelWithError:", &v14);
  v4 = (HMDCameraProfileSettingsDerivedPropertiesModel *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (!v4)
  {
    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v9;
        v17 = 2112;
        v18 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error fetching derived properties: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
    v10 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
    -[HMDCameraProfileSettingsManager derivedPropertiesModelID](self, "derivedPropertiesModelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager uniqueIdentifier](self, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HMBModel initWithModelID:parentModelID:](v10, "initWithModelID:parentModelID:", v11, v12);

    -[HMDCameraProfileSettingsDerivedPropertiesModel setCurrentAccessModeChangeReason:](v4, "setCurrentAccessModeChangeReason:", 0);
    -[HMDCameraProfileSettingsDerivedPropertiesModel setCurrentAccessMode:](v4, "setCurrentAccessMode:", 1);
  }

  return v4;
}

- (id)_coreDataUpdateCompletionForMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke;
  v9[3] = &unk_24E79BCC8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = _Block_copy(v9);

  return v7;
}

- (void)_initializeNotificationSettingsUsingSettingsModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDCameraProfileSettingsManager cameraBulletinNotificationManager](self, "cameraBulletinNotificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraUserNotificationSettingsForAccessory:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (v9)
    {
      if (-[HMDCameraProfileSettingsManager _migrateNotificationSettings:](self, "_migrateNotificationSettings:", v9))
        -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](self, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v9, 0);
    }
    else
    {
      -[HMDCameraProfileSettingsManager _createNotificationSettingsUsingSettingsModel:](self, "_createNotificationSettingsUsingSettingsModel:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](self, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v14, 0);

    }
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
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference is nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)_createNotificationSettingsUsingSettingsModel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  void *v8;
  HMDCameraProfileSettingsManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraProfileSettingsManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraProfileSettingsManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCameraProfileSettingsManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDD7828]);
  v7 = objc_msgSend(v4, "hasAnyNotificationFieldsSet");
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "smartBulletinBoardNotification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = v12;
      v37 = 2112;
      v38 = v13;
      v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Migrating notification settings from settings model: %@, smart bulletin board notification: %@", (uint8_t *)&v35, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "setVersion:", *MEMORY[0x24BDD5660]);
    objc_msgSend(v6, "setAccessModeChangeNotificationEnabled:", objc_msgSend(v4, "accessModeChangeNotificationEnabled"));
    objc_msgSend(v6, "setReachabilityEventNotificationEnabled:", objc_msgSend(v4, "reachabilityEventNotificationEnabled"));
    objc_msgSend(v4, "smartBulletinBoardNotification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v15, "isEnabled"));

    objc_msgSend(v4, "smartBulletinBoardNotification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "condition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSmartBulletinBoardNotificationCondition:", v17);

    if (isHomePod())
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v9;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Forcing all notification settings to disabled on HomePod", (uint8_t *)&v35, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v6, "setAccessModeChangeNotificationEnabled:", 0);
      objc_msgSend(v6, "setReachabilityEventNotificationEnabled:", 0);
      objc_msgSend(v6, "setSmartBulletinBoardNotificationEnabled:", 0);
      v22 = objc_msgSend(v6, "setSmartBulletinBoardNotificationCondition:", 0);
    }
    else
    {
      v22 = isAppleTV();
      if ((_DWORD)v22)
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = v9;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138543362;
          v36 = v28;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Forcing access mode and reachability notification settings to disabled on AppleTV", (uint8_t *)&v35, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(v6, "setAccessModeChangeNotificationEnabled:", 0);
        v22 = objc_msgSend(v6, "setReachabilityEventNotificationEnabled:", 0);
      }
    }
    v29 = (void *)MEMORY[0x227676638](v22);
    v30 = v9;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v32;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Migrated to new notification settings: %@", (uint8_t *)&v35, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v23;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating new notification settings using default values", (uint8_t *)&v35, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "setVersion:", *MEMORY[0x24BDD5660]);
    if (!isTVOSDevice())
    {
      objc_msgSend(v6, "setAccessModeChangeNotificationEnabled:", 1);
      objc_msgSend(v6, "setReachabilityEventNotificationEnabled:", 1);
    }
    -[HMDCameraProfileSettingsManager doorbellInputEventCharacteristic](v9, "doorbellInputEventCharacteristic");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (isAppleTV() && v24)
      -[HMDCameraProfileSettingsManager _enablePackageNotificationsOnSettings:](v9, "_enablePackageNotificationsOnSettings:", v6);
    else
      objc_msgSend(v6, "setSmartBulletinBoardNotificationEnabled:", 0);
  }
  v33 = (void *)objc_msgSend(v6, "copy");

  return v33;
}

- (BOOL)_migrateNotificationSettings:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDCameraProfileSettingsManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCameraProfileSettingsManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDCameraProfileSettingsManager *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  HMDCameraProfileSettingsManager *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMDCameraProfileSettingsManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMDCameraProfileSettingsManager *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  HMDCameraProfileSettingsManager *v48;
  NSObject *v49;
  void *v50;
  int v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "version");
  v7 = 0;
  if (v6 == 1)
    goto LABEL_22;
  if (v6)
    goto LABEL_41;
  -[HMDCameraProfileSettingsManager doorbellInputEventCharacteristic](self, "doorbellInputEventCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "smartBulletinBoardNotificationCondition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (isAppleTV())
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138543362;
          v53 = v26;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera but there is no notification condition; enabling significant even"
            "t notifications for HMCameraSignificantEventTypePackages only",
            (uint8_t *)&v52,
            0xCu);

        }
        objc_autoreleasePoolPop(v23);
        -[HMDCameraProfileSettingsManager _enablePackageNotificationsOnSettings:](v24, "_enablePackageNotificationsOnSettings:", v4);
        v7 = 1;
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_21;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7528]), "initWithPredicate:", v9);
    objc_msgSend(v10, "significantEventReasonCondition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "significantEventTypes");

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
        objc_msgSend(v10, "significantEventReasonCondition");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543618;
        v53 = v16;
        v54 = 2112;
        v55 = (uint64_t)v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera; adding HMCameraSignificantEventTypePackages to existing significan"
          "t event notification condition: %@",
          (uint8_t *)&v52,
          0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v10, "significantEventReasonCondition");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "significantEventTypes") | 0x10;

      v20 = (void *)objc_msgSend(v10, "mutableCopy");
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7598]), "initWithSignificantEventTypes:", v19);
      objc_msgSend(v20, "setSignificantEventReasonCondition:", v21);

      objc_msgSend(v20, "predicate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSmartBulletinBoardNotificationCondition:", v22);

    }
    else
    {
      if (!isAppleTV())
      {
        v7 = 0;
        goto LABEL_19;
      }
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera but there are no significantEventTypes in the condition; enabling s"
          "ignificant event notifications for HMCameraSignificantEventTypePackages only",
          (uint8_t *)&v52,
          0xCu);

      }
      objc_autoreleasePoolPop(v27);
      -[HMDCameraProfileSettingsManager _enablePackageNotificationsOnSettings:](v28, "_enablePackageNotificationsOnSettings:", v4);
    }
    v7 = 1;
LABEL_19:

LABEL_21:
    goto LABEL_22;
  }
  v7 = 0;
LABEL_22:
  v31 = objc_msgSend(v4, "version");
  v32 = *MEMORY[0x24BDD5660];
  if (v31 != *MEMORY[0x24BDD5660])
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v4, "version");
      v52 = 138543874;
      v53 = v36;
      v54 = 2048;
      v55 = v37;
      v56 = 2048;
      v57 = 1;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating notification settings version from %ld to %ld", (uint8_t *)&v52, 0x20u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(v4, "setVersion:", v32);
    v7 = 1;
  }
  if (isAppleTV())
  {
    if (objc_msgSend(v4, "isAccessModeChangeNotificationEnabled"))
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = v41;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Forcing access mode notification to disabled during settings migration on Apple TV", (uint8_t *)&v52, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(v4, "setAccessModeChangeNotificationEnabled:", 0);
      v7 = 1;
    }
    if (objc_msgSend(v4, "isReachabilityEventNotificationEnabled"))
    {
      v42 = (void *)MEMORY[0x227676638]();
      v43 = self;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = v45;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Forcing reachability notification to disabled during settings migration on Apple TV", (uint8_t *)&v52, 0xCu);

      }
      objc_autoreleasePoolPop(v42);
      objc_msgSend(v4, "setReachabilityEventNotificationEnabled:", 0);
      v7 = 1;
    }
  }
  if (isHomePod())
  {
    v46 = objc_alloc_init(MEMORY[0x24BDD7828]);
    if ((objc_msgSend(v4, "isEqual:", v46) & 1) == 0)
    {
      v47 = (void *)MEMORY[0x227676638]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = v50;
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Forcing all notification settings to disabled during settings migration on HomePod", (uint8_t *)&v52, 0xCu);

      }
      objc_autoreleasePoolPop(v47);
      objc_msgSend(v4, "setAccessModeChangeNotificationEnabled:", 0);
      objc_msgSend(v4, "setReachabilityEventNotificationEnabled:", 0);
      objc_msgSend(v4, "setSmartBulletinBoardNotificationEnabled:", 0);
      objc_msgSend(v4, "setSmartBulletinBoardNotificationCondition:", 0);
      v7 = 1;
    }

  }
LABEL_41:

  return v7;
}

- (BOOL)_migrateSettingsModel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMDCameraProfileSettingsManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraProfileSettingsManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  HMDCameraProfileSettingsManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "version");
  if (v5 != 1)
  {
    if (v5)
    {
LABEL_12:
      v17 = 0;
      goto LABEL_16;
    }
    -[HMDCameraProfileSettingsManager doorbellInputEventCharacteristic](self, "doorbellInputEventCharacteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordingEventTriggers");
        HMCameraSignificantEventTypesAsString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v10;
        v26 = 2112;
        v27 = (uint64_t)v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera; adding HMCameraSignificantEventTypePackages to existing recording "
          "event triggers: %@",
          (uint8_t *)&v24,
          0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v4, "setRecordingEventTriggers:", objc_msgSend(v4, "recordingEventTriggers") | 0x10);
    }
    if ((objc_msgSend(v4, "recordingEventTriggers") & 1) != 0)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordingEventTriggers");
        HMCameraSignificantEventTypesAsString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v15;
        v26 = 2112;
        v27 = (uint64_t)v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Settings have Any Motion recording trigger; adding all significant event types to existing recording"
          " event triggers: %@",
          (uint8_t *)&v24,
          0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v4, "setRecordingEventTriggers:", objc_msgSend(v4, "recordingEventTriggers") | 0x1F);
    }
  }
  if (objc_msgSend(v4, "version") == 1)
    goto LABEL_12;
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v4, "version");
    v24 = 138543874;
    v25 = v21;
    v26 = 2048;
    v27 = v22;
    v28 = 2048;
    v29 = 1;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating settings model version from %ld to %ld", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v17 = 1;
  objc_msgSend(v4, "setVersion:", 1);
LABEL_16:

  return v17;
}

- (id)manuallyDisabledCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicType:forServiceType:", CFSTR("00000227-0000-1000-8000-0026BB765291"), *MEMORY[0x24BDD6B60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)doorbellInputEventCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD58F0], *MEMORY[0x24BDD6BA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCameraManuallyDisabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraProfileSettingsManager manuallyDisabledCharacteristic](self, "manuallyDisabledCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = objc_msgSend(v8, "BOOLValue");
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
        v15 = 138543874;
        v16 = v13;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = 0;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has unhandled value type: %@", (uint8_t *)&v15, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_isAnyUserAtHomeForPresence:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasPresenceRegionForAllUsers"))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = objc_msgSend(v3, "isAnyUserAtHome");

    objc_msgSend(v4, "numberWithBool:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v3, "isAnyUserAtHome");

    if (v7)
      v6 = (void *)MEMORY[0x24BDBD1C8];
    else
      v6 = 0;
  }
  return v6;
}

- (void)_updateDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDCameraProfileSettingsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating derived properties with userInitiated=%@ due to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  buf[0] = 0;
  -[HMDCameraProfileSettingsManager _updatedDerivedPropertiesModelWithSettingsModel:userInitiated:didCreateModel:](v12, "_updatedDerivedPropertiesModelWithSettingsModel:userInitiated:didCreateModel:", v8, v6, buf);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[HMDCameraProfileSettingsManager coreDataAdapter](v12, "coreDataAdapter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __103__HMDCameraProfileSettingsManager__updateDerivedPropertiesModelWithSettingsModel_userInitiated_reason___block_invoke;
    v18[3] = &unk_24E79BD80;
    v18[4] = v12;
    objc_msgSend(v17, "updateDerivedPropertiesModel:completion:", v16, v18);

  }
}

- (id)_updatedDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 didCreateModel:(BOOL *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDCameraProfileSettingsDerivedPropertiesModel *v12;
  void *v13;
  HMDCameraProfileSettingsManager *v14;
  NSObject *v15;
  void *v16;
  HMDCameraProfileSettingsDerivedPropertiesModel *v17;
  void *v18;
  void *v19;
  HMDCameraProfileSettingsDerivedPropertiesModel *v20;
  HMDCameraProfileSettingsDerivedPropertiesModel *v21;
  HMDCameraProfileSettingsDerivedPropertiesModel *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (a5)
    *a5 = 0;
  -[HMDCameraProfileSettingsManager coreDataAdapter](self, "coreDataAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchDerivedPropertiesModelWithError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating a new derived properties model because one doesn't exist already", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
    -[HMDCameraProfileSettingsManager derivedPropertiesModelID](v14, "derivedPropertiesModelID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager uniqueIdentifier](v14, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMBModel initWithModelID:parentModelID:](v17, "initWithModelID:parentModelID:", v18, v19);

    v21 = v20;
    v11 = v21;
    if (a5)
      *a5 = 1;
    v12 = v21;
  }
  LOBYTE(v24) = 0;
  -[HMDCameraProfileSettingsManager _populateCurrentAccessModeFieldForDerivedProperties:currentSettings:userInitiated:didUpdateField:](self, "_populateCurrentAccessModeFieldForDerivedProperties:currentSettings:userInitiated:didUpdateField:", v11, v8, v6, &v24);
  if ((_BYTE)v24)
  {
    v22 = v11;

    v12 = v22;
  }

  return v12;
}

- (void)_populateCurrentAccessModeFieldForDerivedProperties:(id)a3 currentSettings:(id)a4 userInitiated:(BOOL)a5 didUpdateField:(BOOL *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDCameraProfileSettingsManager *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  HMDCameraProfileSettingsManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  HMDCameraProfileSettingsManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDCameraProfileSettingsManager *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDCameraProfileSettingsManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDCameraProfileSettingsManager *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  HMDCameraProfileSettingsManager *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  HMDCameraProfileSettingsManager *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDCameraProfileSettingsManager *v67;
  void *v68;
  void *v69;
  void *context;
  void *contexta;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v7 = a5;
  v88 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (a6)
    *a6 = 0;
  if (objc_msgSend(v11, "hmbPropertyWasSet:", CFSTR("accessModeAtHomeField"))
    && (objc_msgSend(v11, "hmbPropertyWasSet:", CFSTR("accessModeNotAtHomeField")) & 1) != 0)
  {
    v13 = objc_msgSend(v11, "accessModeAtHome");
    v14 = objc_msgSend(v11, "accessModeNotAtHome");
    -[HMDCameraProfileSettingsManager isAnyUserAtHome](self, "isAnyUserAtHome");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v15;
    if (-[HMDCameraProfileSettingsManager isCameraManuallyDisabled](self, "isCameraManuallyDisabled"))
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Camera is manually disabled, setting current access mode to off", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v20 = 0;
      v21 = 5;
    }
    else if (v15)
    {
      v27 = objc_msgSend(v15, "BOOLValue");
      v28 = 1;
      if (!v27)
        v28 = 2;
      v72 = v28;
      if (v27)
        v20 = v13;
      else
        v20 = v14;
      context = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "BOOLValue");
        HMFBooleanToString();
        v67 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v79 = v69;
        v80 = 2112;
        v81 = v68;
        v82 = 2112;
        v83 = v31;
        v84 = 2112;
        v85 = (uint64_t)v32;
        v86 = 2112;
        v87 = v33;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Determined expected access mode of %@ based on isAnyUserAtHome = %@, accessModeAtHome = %@, accessModeNotAtHome = %@", buf, 0x34u);

        v29 = v67;
      }

      objc_autoreleasePoolPop(context);
      if (v7)
        v21 = 4;
      else
        v21 = v72;
    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
      if (v13 != v14)
      {
        if (v37)
        {
          HMFGetLogIdentifier();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v79 = v66;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Presence is unavailable; not updating current access mode",
            buf,
            0xCu);

        }
        objc_autoreleasePoolPop(v34);
        goto LABEL_49;
      }
      if (v37)
      {
        HMFGetLogIdentifier();
        contexta = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v34;
        HMCameraAccessModeAsString();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138544130;
        v79 = contexta;
        v80 = 2112;
        v81 = v38;
        v82 = 2112;
        v83 = v39;
        v84 = 2112;
        v85 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v85;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Determined expected access mode of %@ because accessModeAtHome (%@) and accessModeNotAtHome (%@) are the same", buf, 0x2Au);

        v34 = v73;
      }

      objc_autoreleasePoolPop(v34);
      v21 = 4;
      v20 = v13;
    }
    if ((objc_msgSend(v10, "hmbPropertyWasSet:", CFSTR("currentAccessModeField"), v67) & 1) == 0)
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v74 = v21;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v44;
        v80 = 2112;
        v81 = v45;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting initial currentAccessMode to %@", buf, 0x16u);

        v21 = v74;
      }

      objc_autoreleasePoolPop(v41);
      objc_msgSend(v10, "setCurrentAccessMode:", v20);
      if (a6)
        *a6 = 1;
    }
    if ((objc_msgSend(v10, "hmbPropertyWasSet:", CFSTR("currentAccessModeChangeReasonField")) & 1) == 0)
    {
      v46 = (void *)MEMORY[0x227676638]();
      v47 = self;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
        v75 = v20;
        v50 = v21;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v49;
        v80 = 2112;
        v81 = v51;
        _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting initial currentAccessModeChangeReason to %@", buf, 0x16u);

        v21 = v50;
        v20 = v75;

      }
      objc_autoreleasePoolPop(v46);
      objc_msgSend(v10, "setCurrentAccessModeChangeReason:", v21);
      if (a6)
        *a6 = 1;
    }
    if (objc_msgSend(v10, "currentAccessMode") != v20)
    {
      v52 = (void *)MEMORY[0x227676638]();
      v53 = self;
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentAccessMode");
        HMCameraAccessModeAsString();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v76 = v52;
        v57 = v20;
        v58 = v21;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v55;
        v80 = 2112;
        v81 = v56;
        v82 = 2112;
        v83 = v59;
        _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Changing currentAccessMode field from %@ to %@", buf, 0x20u);

        v21 = v58;
        v20 = v57;
        v52 = v76;

      }
      objc_autoreleasePoolPop(v52);
      objc_msgSend(v10, "setCurrentAccessMode:", v20);
      if (objc_msgSend(v10, "currentAccessModeChangeReason") != v21)
      {
        v60 = (void *)MEMORY[0x227676638]();
        v61 = v53;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "currentAccessModeChangeReason"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v79 = v63;
          v80 = 2112;
          v81 = v64;
          v82 = 2112;
          v83 = v65;
          _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Changing currentAccessModeChangeReason from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v60);
        objc_msgSend(v10, "setCurrentAccessModeChangeReason:", v21);
      }
      if (a6)
        *a6 = 1;
    }
LABEL_49:

    goto LABEL_50;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v79 = v25;
    v80 = 2112;
    v81 = v26;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot update currentAccessMode, settings model does not include accessMode values: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
LABEL_50:

}

- (void)_synchronizeCurrentAccessModeSettingToCameraWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing current access mode settings to camera", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraProfileSettingsManager currentSettingsModel](v7, "currentSettingsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addAccessModeCharacteristicWriteRequestsToArray:currentAccessMode:](v7, "_addAccessModeCharacteristicWriteRequestsToArray:currentAccessMode:", v11, objc_msgSend(v10, "currentAccessMode"));
  -[HMDCameraProfileSettingsManager _addHomeKitCameraActiveCharacteristicWriteRequestToArray:currentAccessMode:](v7, "_addHomeKitCameraActiveCharacteristicWriteRequestToArray:currentAccessMode:", v11, objc_msgSend(v10, "currentAccessMode"));
  -[HMDCameraProfileSettingsManager _handleCharacteristicWriteRequests:completion:](v7, "_handleCharacteristicWriteRequests:completion:", v11, v4);

}

- (id)_settingsModelForUpdate
{
  HMDCameraProfileSettingsModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCameraProfileSettingsModel *v7;

  v3 = [HMDCameraProfileSettingsModel alloc];
  -[HMDCameraProfileSettingsManager uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](v3, "initWithModelID:parentModelID:", v4, v6);

  return v7;
}

- (NSUUID)derivedPropertiesModelID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1880];
  -[HMDCameraProfileSettingsManager uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("2b32a3ee-3908-406e-890d-74f9c410ef2b");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hm_deriveUUIDFromBaseUUID:withSalts:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v5;
}

- (id)_settingsFromSettingsModel:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x24BDD7AE0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "hmbModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUID:", v7);

  objc_msgSend(v8, "setSupportedFeatures:", -[HMDCameraProfileSettingsManager supportedFeatures](self, "supportedFeatures"));
  objc_msgSend(v8, "setAccessModeAtHome:", objc_msgSend(v5, "accessModeAtHome"));
  objc_msgSend(v8, "setAccessModeNotAtHome:", objc_msgSend(v5, "accessModeNotAtHome"));
  objc_msgSend(v8, "setRecordingEventTriggers:", objc_msgSend(v5, "recordingEventTriggers"));
  objc_msgSend(v8, "setCameraManuallyDisabled:", objc_msgSend(v5, "cameraManuallyDisabled"));
  -[HMDCameraProfileSettingsManager currentNotificationSettings](self, "currentNotificationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationSettings:", v9);

  objc_msgSend(v5, "activityZones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivityZones:", v10);

  objc_msgSend(v8, "setActivityZonesIncludedForSignificantEventDetection:", objc_msgSend(v5, "activityZonesIncludedForSignificantEventDetection"));
  if (-[HMDCameraProfileSettingsManager canRevealCurrentAccessMode](self, "canRevealCurrentAccessMode"))
    v11 = objc_msgSend(v5, "currentAccessMode");
  else
    v11 = objc_msgSend(v5, "mostPrivateAccessMode");
  v12 = v11;

  objc_msgSend(v8, "setCurrentAccessMode:", v12);
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (id)_payloadForSettings:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD5688];
  encodeRootObjectForSPIClients(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_notifySubscribersOfUpdatedSettings:(id)a3 previousSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDCameraProfileSettingsManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraProfileSettingsManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCameraProfileSettingsManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[4];
  _QWORD v41[4];
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "home");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
      {
        v36 = (void *)v11;
        v42 = CFSTR("HMDCS.AccessModeChange");
        v40[0] = CFSTR("kAccessoryUUID");
        objc_msgSend(v10, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v34;
        v40[1] = CFSTR("HMDCS.amu.value");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "currentAccessMode"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v13;
        v40[2] = CFSTR("HMDCS.amu.changeReason");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "currentAccessModeChangeReason"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v14;
        v40[3] = CFSTR("HMDCS.amu.changeDate");
        objc_msgSend(v6, "currentAccessModeChangeDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v41[3] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        v12 = v36;
        objc_msgSend(v36, "cameraBulletinNotificationManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "devicesToNotifyForAccessModeChangeForAccessory:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __88__HMDCameraProfileSettingsManager__notifySubscribersOfUpdatedSettings_previousSettings___block_invoke;
        v37[3] = &unk_24E783898;
        v37[4] = self;
        v38 = v18;
        v39 = v6;
        v21 = v18;
        objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v37);

      }
      else
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v33;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Home is nil when attempting to notify subscribers of updated camera settings", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory is nil when attempting to notify subscribers of updated camera settings", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Skip since this is the first time setting is created", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }

}

- (void)_notifyClientsOfCurrentSettings
{
  NSObject *v3;
  id v4;

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraProfileSettingsManager currentSettings](self, "currentSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _notifyClientsOfChangedSettings:isInitialSettingsUpdate:](self, "_notifyClientsOfChangedSettings:isInitialSettingsUpdate:", v4, 0);

}

- (void)_notifyClientsOfChangedSettingsModel:(id)a3 isInitialSettingsUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDCameraProfileSettingsManager _settingsFromSettingsModel:](self, "_settingsFromSettingsModel:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDCameraProfileSettingsManager _notifyClientsOfChangedSettings:isInitialSettingsUpdate:](self, "_notifyClientsOfChangedSettings:isInitialSettingsUpdate:", v8, v4);
}

- (void)_notifyClientsOfChangedSettings:(id)a3 isInitialSettingsUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  HMDCameraProfileSettingsManager *v9;
  NSObject *v10;
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
  HMDCameraProfileSettingsManager *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v11;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of changed settings: %@ isInitialSettingsUpdate: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraProfileSettingsManager _payloadForSettings:](v9, "_payloadForSettings:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD5680], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager messageDestination](v9, "messageDestination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDestination:", v15);

  -[HMDCameraProfileSettingsManager msgDispatcher](v9, "msgDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:completionHandler:", v14, 0);

  -[HMDCameraProfileSettingsManager hapAccessory](v9, "hapAccessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "homeManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager uniqueIdentifier](v9, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Camera Settings Updated"), v21, 1);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, CFSTR("HMDCameraProfileSettingsNotificationKey"), CFSTR("HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey"), v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraProfileSettingsManager notificationCenter](v9, "notificationCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v18, v23);

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v9;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory reference was nil while notifying clients of changed settings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)_updateNotificationSettings:(id)a3 forMessage:(id)a4
{
  id v5;

  v5 = a4;
  -[HMDCameraProfileSettingsManager _notifyClientsOfCurrentSettings](self, "_notifyClientsOfCurrentSettings");
  objc_msgSend(v5, "respondWithSuccess");

}

- (void)_writeInitialSettingsCharacteristicsToCamera
{
  NSObject *v3;
  void *v4;
  HMDCameraProfileSettingsManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Writing initial settings characteristics to camera", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraProfileSettingsManager setNeedsInitialSettingsCharacteristicSynchronization:](v5, "setNeedsInitialSettingsCharacteristicSynchronization:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addOperatingModeIndicatorCharacteristicWriteRequestToArray:accessModeIndicatorEnabled:](v5, "_addOperatingModeIndicatorCharacteristicWriteRequestToArray:accessModeIndicatorEnabled:", v8, 1);
  -[HMDCameraProfileSettingsManager _addNightVisionCharacteristicWriteRequestToArray:nightVisionEnabled:](v5, "_addNightVisionCharacteristicWriteRequestToArray:nightVisionEnabled:", v8, 1);
  -[HMDCameraProfileSettingsManager _addSnapshotsActiveCharacteristicWriteRequestToArray:snapshotsAllowed:](v5, "_addSnapshotsActiveCharacteristicWriteRequestToArray:snapshotsAllowed:", v8, 1);
  -[HMDCameraProfileSettingsManager _addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:periodicSnapshotsAllowed:](v5, "_addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:periodicSnapshotsAllowed:", v8, 1);
  -[HMDCameraProfileSettingsManager _addRecordingAudioEnabledWriteRequestToArray:recordingAudioEnabled:](v5, "_addRecordingAudioEnabledWriteRequestToArray:recordingAudioEnabled:", v8, 1);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__HMDCameraProfileSettingsManager__writeInitialSettingsCharacteristicsToCamera__block_invoke;
  v9[3] = &unk_24E79BD80;
  v9[4] = v5;
  -[HMDCameraProfileSettingsManager _handleCharacteristicWriteRequests:completion:](v5, "_handleCharacteristicWriteRequests:completion:", v8, v9);

}

- (void)_handleCharacteristicWriteRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Write settings characteristics"));
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v13;
      v25 = 2114;
      v26 = v15;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received request to write characteristics: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraProfileSettingsManager workQueue](v11, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke;
    v19[3] = &unk_24E798148;
    v19[4] = v11;
    v20 = v22;
    v21 = v7;
    objc_msgSend(v9, "writeCharacteristicValues:source:queue:completionHandler:", v6, 7, v16, v19);

    __HMFActivityScopeLeave();
  }
  else
  {
    v17 = _Block_copy(v7);
    v18 = v17;
    if (v17)
      (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);

  }
}

- (void)_addWriteRequestToArray:(id)a3 forCharacteristicWithType:(id)a4 ofServiceWithType:(id)a5 value:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "services");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v20, "serviceType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v11);

        if (v22)
        {
          objc_msgSend(v20, "findCharacteristicWithType:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "authorizationData");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v24, v12, v25, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "addObject:", v26);
          }

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

}

- (void)_addNightVisionCharacteristicWriteRequestToArray:(id)a3 nightVisionEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x24BDD5930];
  v9 = *MEMORY[0x24BDD6B60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v6, v8, v9, v10);

}

- (void)_addOperatingModeIndicatorCharacteristicWriteRequestToArray:(id)a3 accessModeIndicatorEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x24BDD57B0];
  v9 = *MEMORY[0x24BDD6B60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v6, v8, v9, v10);

}

- (void)_addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 periodicSnapshotsAllowed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x24BDD6B60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v6, CFSTR("00000225-0000-1000-8000-0026BB765291"), v8, v9);

}

- (void)_addSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 snapshotsAllowed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x24BDD58A8];
  v9 = *MEMORY[0x24BDD6B60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v6, v8, v9, v10);

}

- (void)_addHomeKitCameraActiveCharacteristicWriteRequestToArray:(id)a3 currentAccessMode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x24BDD6B60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4 != 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v6, CFSTR("0000021B-0000-1000-8000-0026BB765291"), v8, v9);

}

- (void)_addAccessModeCharacteristicWriteRequestsToArray:(id)a3 currentAccessMode:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = HMIsStreamingAllowedForCameraAccessMode();
  v8 = *MEMORY[0x24BDD5770];
  v9 = *MEMORY[0x24BDD6B68];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v5, v8, v9, v10);

  v11 = HMIsRecordingAllowedForCameraAccessMode();
  v12 = *MEMORY[0x24BDD6B70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v5, v8, v12, v13);

}

- (void)_addRecordingAudioEnabledWriteRequestToArray:(id)a3 recordingAudioEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:](self, "_addWriteRequestToArray:forCharacteristicWithType:ofServiceWithType:value:", v6, *MEMORY[0x24BDD5980], *MEMORY[0x24BDD6B70], v8);

}

- (void)_updateCloudStorageAndSettingsWithAccessMode:(unint64_t)a3 forIsAtHome:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  HMDCameraProfileSettingsManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(void *, uint64_t, _QWORD);
  void *v18;
  void *v19;
  HMDCameraProfileSettingsManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCameraProfileSettingsManager *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, char, void *);
  void *v30;
  HMDCameraProfileSettingsManager *v31;
  id v32;
  unint64_t v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v5 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMCameraAccessModeAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v13;
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = v15;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating access mode to %@ for isAtHome: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __103__HMDCameraProfileSettingsManager__updateCloudStorageAndSettingsWithAccessMode_forIsAtHome_completion___block_invoke;
  v30 = &unk_24E783908;
  v31 = v11;
  v16 = v8;
  v32 = v16;
  v33 = a3;
  v34 = v5;
  v17 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v27);
  -[HMDCameraProfileSettingsManager delegate](v11, "delegate", v27, v28, v29, v30, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDCameraProfileSettingsManager _shouldQueryCanEnableRecordingForAccessMode:](v11, "_shouldQueryCanEnableRecordingForAccessMode:", a3))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v11;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Querying for can enable recording", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v18, "cameraProfileSettingsManager:canEnableRecordingWithCompletion:", v20, v17);
  }
  else if (-[HMDCameraProfileSettingsManager _shouldQueryCanDisableRecordingForAccessMode:isAtHome:](v11, "_shouldQueryCanDisableRecordingForAccessMode:isAtHome:", a3, v5))
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v11;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Querying for can disable recording", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v18, "cameraProfileSettingsManager:canDisableRecordingWithCompletion:", v24, v17);
  }
  else
  {
    v17[2](v17, 1, 0);
  }

}

- (void)_updateSettingsWithAccessMode:(unint64_t)a3 forIsAtHome:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDCameraProfileSettingsManager currentSettingsModel](self, "currentSettingsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v5)
    objc_msgSend(v10, "setAccessModeAtHome:", a3);
  else
    objc_msgSend(v10, "setAccessModeNotAtHome:", a3);
  -[HMDCameraProfileSettingsManager coreDataAdapter](self, "coreDataAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateCameraProfileSettingsModel:completion:", v12, v8);

}

- (BOOL)_shouldQueryCanEnableRecordingForAccessMode:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;

  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    -[HMDCameraProfileSettingsManager currentSettings](self, "currentSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessModeAtHome");
    if ((HMIsRecordingAllowedForCameraAccessMode() & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      objc_msgSend(v5, "accessModeNotAtHome");
      v6 = HMIsRecordingAllowedForCameraAccessMode() ^ 1;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_shouldQueryCanDisableRecordingForAccessMode:(unint64_t)a3 isAtHome:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if ((HMIsRecordingAllowedForCameraAccessMode() & 1) == 0)
  {
    -[HMDCameraProfileSettingsManager currentSettings](self, "currentSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
    {
      objc_msgSend(v8, "accessModeAtHome");
      if (HMIsRecordingAllowedForCameraAccessMode())
      {
        objc_msgSend(v9, "accessModeNotAtHome");
LABEL_8:
        v7 = HMIsRecordingAllowedForCameraAccessMode() ^ 1;
LABEL_10:

        return v7;
      }
    }
    else
    {
      objc_msgSend(v8, "accessModeNotAtHome");
      if (HMIsRecordingAllowedForCameraAccessMode())
      {
        objc_msgSend(v9, "accessModeAtHome");
        goto LABEL_8;
      }
    }
    LOBYTE(v7) = 0;
    goto LABEL_10;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)_disableRecordingAccessModesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraProfileSettingsManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraProfileSettingsManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraProfileSettingsManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraProfileSettingsManager currentSettingsModel](self, "currentSettingsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessModeAtHome");
    HMCameraAccessModeAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessModeNotAtHome");
    HMCameraAccessModeAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Asked to disable recording access modes given current accessModeAtHome: %@ accessModeNotAtHome: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "accessModeAtHome");
  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    v13 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "setAccessModeAtHome:", 1));
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessModeAtHome");
      HMCameraAccessModeAsString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Disable recording access modes by updating at home access mode to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  objc_msgSend(v6, "accessModeNotAtHome");
  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    v18 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "setAccessModeNotAtHome:", 1));
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessModeNotAtHome");
      HMCameraAccessModeAsString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Disable recording access modes by updating not at home access mode to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  objc_msgSend(v6, "hmbSetProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    -[HMDCameraProfileSettingsManager coreDataAdapter](v8, "coreDataAdapter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __78__HMDCameraProfileSettingsManager__disableRecordingAccessModesWithCompletion___block_invoke;
    v26[3] = &unk_24E79B3A0;
    v26[4] = v8;
    v27 = v4;
    objc_msgSend(v25, "updateCameraProfileSettingsModel:completion:", v6, v26);

  }
}

- (void)_synchronizeCloudStorageWithRecordingAccessModesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing cloud storage with recording access modes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraProfileSettingsManager currentSettings](v7, "currentSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessModeAtHome");
  v11 = HMIsRecordingAllowedForCameraAccessMode();
  objc_msgSend(v10, "accessModeNotAtHome");
  v12 = HMIsRecordingAllowedForCameraAccessMode();
  -[HMDCameraProfileSettingsManager delegate](v7, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 1) != 0 || v12)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __98__HMDCameraProfileSettingsManager__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke;
    v19[3] = &unk_24E783930;
    v14 = &v20;
    v19[4] = v7;
    v20 = v4;
    v16 = v4;
    objc_msgSend(v13, "cameraProfileSettingsManager:canEnableRecordingWithCompletion:", v7, v19);
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __98__HMDCameraProfileSettingsManager__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_123;
    v17[3] = &unk_24E783930;
    v14 = &v18;
    v17[4] = v7;
    v18 = v4;
    v15 = v4;
    objc_msgSend(v13, "cameraProfileSettingsManager:canDisableRecordingWithCompletion:", v7, v17);
  }

}

- (void)_coordinateNotificationSettingsWithServiceBulletinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  HMDCameraProfileSettingsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD6C18]);

  if (v8)
  {
    -[HMDCameraProfileSettingsManager _coordinateSmartBulletinNotificationWithServiceBulletinNotification:](self, "_coordinateSmartBulletinNotificationWithServiceBulletinNotification:", v4);
  }
  else
  {
    objc_msgSend(v6, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD6BA0]);

    if (v10)
    {
      -[HMDCameraProfileSettingsManager _coordinateDoorbellServiceBulletinNotification:](self, "_coordinateDoorbellServiceBulletinNotification:", v4);
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "service");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v14;
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected bulletin board notification: %@ service: %@ when coordinating settings", (uint8_t *)&v16, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }

}

- (void)_coordinateDoorbellServiceBulletinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraProfileSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Coordinating notification settings for: %@ service: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraProfileSettingsManager currentSettings](v7, "currentSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](v7, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v12, 0);

}

- (void)_coordinateSmartBulletinNotificationWithServiceBulletinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDCameraProfileSettingsManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "isEnabled"))
  {
    -[HMDCameraProfileSettingsManager currentSettings](self, "currentSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSmartBulletinBoardNotificationEnabled");

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
        objc_msgSend(v4, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Bulletin board notification is enabled for service %@, so enabling smart bulletin board notification with empty significant event types", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v6, "notificationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "setSmartBulletinBoardNotificationEnabled:", 1);
      objc_msgSend(MEMORY[0x24BDD7530], "predicateForSignificantEventTypes:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSmartBulletinBoardNotificationCondition:", v16);

      -[HMDCameraProfileSettingsManager _updateCameraBulletinNotificationManagerWithSettings:forMessage:](v10, "_updateCameraBulletinNotificationManagerWithSettings:forMessage:", v15, 0);
    }

  }
}

- (void)_setManuallyDisabledCharacteristicNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager manuallyDisabledCharacteristic](self, "manuallyDisabledCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsManager clientIdentifier](self, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableNotification:forCharacteristics:message:clientIdentifier:", v3, v7, 0, v8);

  }
}

- (void)_enablePackageNotificationsOnSettings:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDD7820];
  v4 = a3;
  v7 = objc_alloc_init(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7598]), "initWithSignificantEventTypes:", 16);
  objc_msgSend(v7, "setSignificantEventReasonCondition:", v5);

  objc_msgSend(v4, "setSmartBulletinBoardNotificationEnabled:", 1);
  objc_msgSend(v7, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSmartBulletinBoardNotificationCondition:", v6);

}

- (BOOL)canRevealCurrentAccessMode
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRemoteAccessAllowed");

  return v5;
}

- (BOOL)canModifyCameraSettings
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    return 1;
  }
  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentEnabledDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "count") == 0;

  return v3;
}

- (void)_start
{
  NSObject *v3;
  void *v4;
  HMDCameraProfileSettingsManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  HMDCameraProfileSettingsManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCameraProfileSettingsManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCameraProfileSettingsManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDCameraProfileSettingsManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraProfileSettingsManager hasStarted](self, "hasStarted"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring request to start because we've already started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDCameraProfileSettingsManager setHasStarted:](self, "setHasStarted:", 1);
    -[HMDCameraProfileSettingsManager coreDataAdapter](self, "coreDataAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v8, "fetchCameraProfileSettingsModelWithError:", &v45);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v45;

    v11 = -[HMDCameraProfileSettingsManager _initializeNotificationSettingsUsingSettingsModel:](self, "_initializeNotificationSettingsUsingSettingsModel:", v9);
    if (v9)
    {
      -[HMDCameraProfileSettingsManager _updateDerivedPropertiesOnSettingsModel:](self, "_updateDerivedPropertiesOnSettingsModel:", v9);
      -[HMDCameraProfileSettingsManager setPreviousSettingsModel:](self, "setPreviousSettingsModel:", v9);
      -[HMDCameraProfileSettingsManager coreDataAdapter](self, "coreDataAdapter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchDerivedPropertiesModelWithError:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager setPreviousDerivedPropertiesModel:](self, "setPreviousDerivedPropertiesModel:", v13);

      v14 = 0;
      v15 = (id)v9;
    }
    else
    {
      if (v10)
      {
        v16 = (void *)MEMORY[0x227676638](v11);
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v19;
          v48 = 2112;
          v49 = v10;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentSettings: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
      }
      v20 = (void *)MEMORY[0x227676638](v11);
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Initializing with default settings values", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      -[HMDCameraProfileSettingsManager defaultSettingsModel](v21, "defaultSettingsModel");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager _updateDerivedPropertiesOnSettingsModel:](v21, "_updateDerivedPropertiesOnSettingsModel:", v15);
      v14 = (unint64_t)v15;
    }
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager _settingsFromSettingsModel:](v25, "_settingsFromSettingsModel:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v27;
      v48 = 2112;
      v49 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Initializing with current settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v25;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager previousDerivedPropertiesModel](v30, "previousDerivedPropertiesModel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "debugDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v32;
      v48 = 2112;
      v49 = v34;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Initializing with current derived properties model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    -[HMDCameraProfileSettingsManager characteristicsAvailabilityListener](v30, "characteristicsAvailabilityListener");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDelegate:", v30);

    -[HMDCameraProfileSettingsManager characteristicsAvailabilityListener](v30, "characteristicsAvailabilityListener");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "start");

    if (-[HMDCameraProfileSettingsManager canModifyCameraSettings](v30, "canModifyCameraSettings"))
    {
      if (-[HMDCameraProfileSettingsManager _migrateSettingsModel:](v30, "_migrateSettingsModel:", v15))
      {
        v37 = v15;

        v14 = (unint64_t)v37;
      }
      -[HMDCameraProfileSettingsManager _updatedDerivedPropertiesModelWithSettingsModel:userInitiated:didCreateModel:](v30, "_updatedDerivedPropertiesModelWithSettingsModel:userInitiated:didCreateModel:", v15, 0, 0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (v14 | v38)
      {
        v39 = (void *)v38;
        v40 = MEMORY[0x24BDAC760];
        if (v14)
        {
          -[HMDCameraProfileSettingsManager coreDataAdapter](v30, "coreDataAdapter");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v40;
          v44[1] = 3221225472;
          v44[2] = __41__HMDCameraProfileSettingsManager__start__block_invoke;
          v44[3] = &unk_24E79BD80;
          v44[4] = v30;
          objc_msgSend(v41, "updateCameraProfileSettingsModel:completion:", v14, v44);

        }
        if (!v9)
          -[HMDCameraProfileSettingsManager _writeInitialSettingsCharacteristicsToCamera](v30, "_writeInitialSettingsCharacteristicsToCamera");
        if (v39)
        {
          -[HMDCameraProfileSettingsManager coreDataAdapter](v30, "coreDataAdapter");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = v40;
          v43[1] = 3221225472;
          v43[2] = __41__HMDCameraProfileSettingsManager__start__block_invoke_126;
          v43[3] = &unk_24E79BD80;
          v43[4] = v30;
          objc_msgSend(v42, "updateDerivedPropertiesModel:completion:", v39, v43);

        }
      }
      else
      {
        -[HMDCameraProfileSettingsManager _notifyClientsOfChangedSettingsModel:isInitialSettingsUpdate:](v30, "_notifyClientsOfChangedSettingsModel:isInitialSettingsUpdate:", v15, 1);
        v14 = 0;
      }
    }
    else
    {
      -[HMDCameraProfileSettingsManager _notifyClientsOfChangedSettingsModel:isInitialSettingsUpdate:](v30, "_notifyClientsOfChangedSettingsModel:isInitialSettingsUpdate:", v15, 1);
    }

  }
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDCameraProfileSettingsManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  void *v2;
  void *v3;
  char v4;

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident");

  return v4;
}

- (void)handleUpdatedSettingsModel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDCameraProfileSettingsManager_handleUpdatedSettingsModel___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleUpdatedDerivedPropertiesModel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDCameraProfileSettingsManager_handleUpdatedDerivedPropertiesModel___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleUpdatedDerivedProperties:(id)a3 previousProperties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  void *v11;
  HMDCameraProfileSettingsManager *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDCameraAccessModeChangedBulletin *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDCameraProfileSettingsManager *v21;
  NSObject *v22;
  void *v23;
  HMDCameraAccessModeChangedBulletin *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v36;
  HMDCameraAccessModeChangedBulletin *v37;
  void *v38;
  HMDCameraAccessModeChangedBulletin *v39;
  uint64_t v40;
  void *v41;
  HMDCameraAccessModeChangedBulletin *v42;
  void *v43;
  HMDCameraProfileSettingsManager *v44;
  NSObject *v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDCameraProfileSettingsManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  HMDCameraAccessModeChangedBulletin *v59;
  void *v60;
  void *v61;
  void *v62;
  HMDCameraProfileSettingsManager *v63;
  void *v64;
  void *v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  HMDCameraAccessModeChangedBulletin *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v66 = 0;
  objc_msgSend(v6, "hmbIsDifferentFromModel:differingFields:", v7, &v66);
  v9 = (__CFString *)v66;
  v10 = -[__CFString hmf_isEmpty](v9, "hmf_isEmpty");
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No changed fields for updated derived properties model", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v17 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "debugDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v68 = v16;
      v69 = 2112;
      v70 = v17;
      v71 = 2112;
      v72 = v18;
      v73 = 2112;
      v74 = v9;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling updated derived properties model: %@\nprevious derived properties model: %@\nchanged fields: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraProfileSettingsManager _notifyClientsOfCurrentSettings](v12, "_notifyClientsOfCurrentSettings");
    v19 = objc_msgSend(v6, "currentAccessMode");
    if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident"))
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v12;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v24 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v23;
        v69 = 2112;
        v70 = v24;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Handling currentAccessMode of %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      -[HMDCameraProfileSettingsManager _synchronizeCurrentAccessModeSettingToCameraWithCompletion:](v21, "_synchronizeCurrentAccessModeSettingToCameraWithCompletion:", 0);
    }
    if (-[__CFString containsObject:](v9, "containsObject:", CFSTR("currentAccessModeField")))
    {
      -[HMDCameraProfileSettingsManager hapAccessory](v12, "hapAccessory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident"))
      {
        -[HMDCameraProfileSettingsManager _notifySubscribersOfUpdatedSettings:previousSettings:](v12, "_notifySubscribersOfUpdatedSettings:previousSettings:", v6, v7);
      }
      if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident")|| (objc_msgSend(v26, "enabledResidents"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "hmf_isEmpty"), v27, v28))
      {
        -[HMDCameraProfileSettingsManager currentNotificationSettings](v12, "currentNotificationSettings");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isAccessModeChangeNotificationEnabled");

        objc_msgSend(v25, "cameraProfiles");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "anyObject");
        v32 = objc_claimAutoreleasedReturnValue();

        v65 = (void *)v32;
        if (v7
          && (v32 ? (v33 = v30) : (v33 = 0),
              v33 == 1
           && v26
           && -[HMDCameraProfileSettingsManager canRevealCurrentAccessMode](v12, "canRevealCurrentAccessMode")))
        {
          v34 = (void *)MEMORY[0x227676638]();
          v63 = v12;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "currentAccessMode");
            HMCameraAccessModeAsString();
            v37 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
            HMCameraAccessModeAsString();
            v61 = v34;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v68 = v36;
            v69 = 2112;
            v70 = v37;
            v71 = 2112;
            v72 = v38;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Current access mode changed from %@ to %@", buf, 0x20u);

            v34 = v61;
          }

          objc_autoreleasePoolPop(v34);
          v39 = [HMDCameraAccessModeChangedBulletin alloc];
          v40 = objc_msgSend(v6, "currentAccessModeChangeReason");
          objc_msgSend(v6, "currentAccessModeChangeDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = -[HMDCameraAccessModeChangedBulletin initWithAccessMode:camera:home:changeReason:changeDate:](v39, "initWithAccessMode:camera:home:changeReason:changeDate:", v19, v65, v26, v40, v41);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = -[HMDCameraAccessModeChangedBulletin initWithAccessMode:camera:home:changeReason:changeDate:](v39, "initWithAccessMode:camera:home:changeReason:changeDate:", v19, v65, v26, v40, v52);

          }
          if (v42)
          {
            v53 = (void *)MEMORY[0x227676638]();
            v54 = v63;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v68 = v56;
              v69 = 2112;
              v70 = v42;
              _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Inserting camera access mode changed bulletin: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v53);
            -[HMDCameraProfileSettingsManager bulletinBoard](v54, "bulletinBoard");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "insertCameraAccessModeChangedBulletin:", v42);

          }
        }
        else
        {
          v43 = (void *)MEMORY[0x227676638]();
          v44 = v12;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v25;
            v64 = v26;
            v47 = CFSTR("<nil>");
            if (v7)
              v48 = CFSTR("<not nil>");
            else
              v48 = CFSTR("<nil>");
            v58 = v48;
            HMFBooleanToString();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v43;
            if (v65)
              v50 = CFSTR("<not nil>");
            else
              v50 = CFSTR("<nil>");
            if (v26)
              v47 = CFSTR("<not nil>");
            -[HMDCameraProfileSettingsManager canRevealCurrentAccessMode](v44, "canRevealCurrentAccessMode", v58);
            HMFBooleanToString();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v68 = v46;
            v69 = 2112;
            v70 = v59;
            v71 = 2112;
            v72 = v49;
            v73 = 2112;
            v74 = v50;
            v75 = 2112;
            v76 = v47;
            v43 = v60;
            v25 = v62;
            v77 = 2112;
            v78 = v51;
            _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Not posting access mode change notification because previousProperties=%@ accessModeChangeNotificationEnabled=%@ cameraProfile=%@ home=%@ canRevealCurrentAccessMode=%@", buf, 0x3Eu);

            v26 = v64;
          }

          objc_autoreleasePoolPop(v43);
        }

      }
    }
  }

}

- (void)_updateDerivedPropertiesOnSettingsModel:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  -[HMDCameraProfileSettingsManager derivedPropertiesModel](self, "derivedPropertiesModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentAccessMode:", objc_msgSend(v4, "currentAccessMode"));
  if (objc_msgSend(v4, "currentAccessMode"))
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "currentAccessModeChangeReason") == 5;
  objc_msgSend(v6, "setCameraManuallyDisabled:", v5);

}

- (void)_handleUpdatedSettings:(id)a3 previousSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  void *v11;
  HMDCameraProfileSettingsManager *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v20 = 0;
  objc_msgSend(v6, "hmbIsDifferentFromModel:differingFields:", v7, &v20);
  v9 = v20;
  v10 = objc_msgSend(v9, "hmf_isEmpty");
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No changed fields for updated settings model", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "debugDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@, previous settings model: %@, changed fields: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraProfileSettingsManager _updateDerivedPropertiesOnSettingsModel:](v12, "_updateDerivedPropertiesOnSettingsModel:", v6);
    -[HMDCameraProfileSettingsManager _notifyClientsOfChangedSettingsModel:isInitialSettingsUpdate:](v12, "_notifyClientsOfChangedSettingsModel:isInitialSettingsUpdate:", v6, 0);
    if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident")&& ((objc_msgSend(v9, "containsObject:", CFSTR("accessModeAtHomeField")) & 1) != 0|| objc_msgSend(v9, "containsObject:", CFSTR("accessModeNotAtHomeField"))))
    {
      -[HMDCameraProfileSettingsManager currentSettingsModel](v12, "currentSettingsModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraProfileSettingsManager _updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:](v12, "_updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:", v19, 1, CFSTR("Settings model updated"));

    }
  }

}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMDCameraProfileSettingsManager *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraProfileSettingsManager *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v6 = a4;
  -[HMDCameraProfileSettingsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v11;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated available characteristics: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      v30 = v14;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
        objc_msgSend(v17, "service");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bulletinBoardNotification");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[HMDCameraProfileSettingsManager notificationCenter](v9, "notificationCenter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObserver:name:object:", v9, CFSTR("HMDBulletinBoardNotificationDidUpdateNotification"), v19);

          -[HMDCameraProfileSettingsManager notificationCenter](v9, "notificationCenter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObserver:selector:name:object:", v9, sel_handleBulletinNotificationEnableStateDidChangeNotification_, CFSTR("HMDBulletinBoardNotificationDidUpdateNotification"), v19);

          -[HMDCameraProfileSettingsManager _coordinateNotificationSettingsWithServiceBulletinNotification:](v9, "_coordinateNotificationSettingsWithServiceBulletinNotification:", v19);
        }
        else
        {
          v22 = (void *)MEMORY[0x227676638]();
          v23 = v9;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = v15;
            v26 = v12;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "service");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v27;
            v38 = 2112;
            v39 = v28;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Service unexpectedly does not have a bulletin board notification: %@", buf, 0x16u);

            v12 = v26;
            v15 = v25;
            v14 = v30;
          }

          objc_autoreleasePoolPop(v22);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDCameraProfileSettingsManager hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isInternalBuild() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraProfileSettingsManagerDelegate)delegate
{
  return (HMDCameraProfileSettingsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHAPAccessory)hapAccessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_hapAccessory);
}

- (void)setHapAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_hapAccessory, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 80, 1);
}

- (NSOperationQueue)accessModeOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraProfileSettingsCoreDataAdapter)coreDataAdapter
{
  return (HMDCameraProfileSettingsCoreDataAdapter *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (HMDCameraProfileSettingsModel)previousSettingsModel
{
  return (HMDCameraProfileSettingsModel *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPreviousSettingsModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (HMDCameraProfileSettingsDerivedPropertiesModel)previousDerivedPropertiesModel
{
  return (HMDCameraProfileSettingsDerivedPropertiesModel *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPreviousDerivedPropertiesModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMsgDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)needsInitialSettingsCharacteristicSynchronization
{
  return self->_needsInitialSettingsCharacteristicSynchronization;
}

- (void)setNeedsInitialSettingsCharacteristicSynchronization:(BOOL)a3
{
  self->_needsInitialSettingsCharacteristicSynchronization = a3;
}

- (NSNumber)isAnyUserAtHome
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnyUserAtHome:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyUserAtHome, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_previousDerivedPropertiesModel, 0);
  objc_storeStrong((id *)&self->_previousSettingsModel, 0);
  objc_storeStrong((id *)&self->_coreDataAdapter, 0);
  objc_storeStrong((id *)&self->_accessModeOperationQueue, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __71__HMDCameraProfileSettingsManager_handleUpdatedDerivedPropertiesModel___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasStarted") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "hmbSetProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hmf_isEmpty");

    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "previousDerivedPropertiesModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);
      v12 = v4;
      if (v4)
      {
        objc_msgSend(v4, "hmbModelByMergingSetPropertiesFromModel:", v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = v5;
      }
      v11 = v6;
      objc_msgSend(*(id *)(a1 + 32), "setPreviousDerivedPropertiesModel:", v6);
      objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedDerivedProperties:previousProperties:", v11, v12);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring derived properties model update because we haven't started yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

void __62__HMDCameraProfileSettingsManager_handleUpdatedSettingsModel___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasStarted") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "hmbSetProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hmf_isEmpty");

    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "previousSettingsModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);
      v12 = v4;
      if (v4)
      {
        objc_msgSend(v4, "hmbModelByMergingSetPropertiesFromModel:", v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = v5;
      }
      v11 = v6;
      objc_msgSend(*(id *)(a1 + 32), "setPreviousSettingsModel:", v6);
      objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedSettings:previousSettings:", v11, v12);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring settings model update because we haven't started yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

void __41__HMDCameraProfileSettingsManager__start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update Core Data with initial settings model: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __41__HMDCameraProfileSettingsManager__start__block_invoke_126(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update Core Data with initial derived properties: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __98__HMDCameraProfileSettingsManager__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "clientErrorFromCanUpdateAccessModeError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "code");
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7 == 2006)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable recording while synchronizing cloud storage due to quota exceeded error: %@", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 32), "_disableRecordingAccessModesWithCompletion:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v13;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable recording while synchronizing cloud storage: %@", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __98__HMDCameraProfileSettingsManager__synchronizeCloudStorageWithRecordingAccessModesWithCompletion___block_invoke_123(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully disabled recording while synchronizing cloud storage", (uint8_t *)&v12, 0xCu);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to disable recording while synchronizing cloud storage: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__HMDCameraProfileSettingsManager__disableRecordingAccessModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update camera profile settings model to disable recording access modes: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __103__HMDCameraProfileSettingsManager__updateCloudStorageAndSettingsWithAccessMode_forIsAtHome_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[2] = __103__HMDCameraProfileSettingsManager__updateCloudStorageAndSettingsWithAccessMode_forIsAtHome_completion___block_invoke_121;
    v15[3] = &unk_24E7838E0;
    v8 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v15[4] = *(_QWORD *)(a1 + 32);
    v17 = v7;
    v15[1] = 3221225472;
    v18 = *(_BYTE *)(a1 + 56);
    v16 = v8;
    dispatch_async(v6, v15);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot make access mode change: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "clientErrorFromCanUpdateAccessModeError:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
}

uint64_t __103__HMDCameraProfileSettingsManager__updateCloudStorageAndSettingsWithAccessMode_forIsAtHome_completion___block_invoke_121(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSettingsWithAccessMode:forIsAtHome:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_105169);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v10;
      v20 = 2114;
      v21 = v12;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to write settings to accessory: %@", (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully wrote settings to accessory", (uint8_t *)&v18, 0x16u);

    }
    v6 = 0;
  }

  objc_autoreleasePoolPop(v7);
  v16 = _Block_copy(*(const void **)(a1 + 48));
  v17 = v16;
  if (v16)
    (*((void (**)(void *, void *))v16 + 2))(v16, v6);

}

BOOL __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __79__HMDCameraProfileSettingsManager__writeInitialSettingsCharacteristicsToCamera__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
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
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to write initial settings characteristics: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully wrote initial settings characteristics", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setNeedsInitialSettingsCharacteristicSynchronization:", 0);
  }

}

void __88__HMDCameraProfileSettingsManager__notifySubscribersOfUpdatedSettings_previousSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDRemoteDeviceMessageDestination *v4;
  void *v5;
  HMDRemoteDeviceMessageDestination *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRemoteDeviceMessageDestination *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v4, "initWithTarget:device:", v5, v3);

  +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", CFSTR("HMDCameraSettingsDidChangeMessage"), v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "currentAccessMode");
    HMCameraAccessModeAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying device %@ for camera access mode change to %@ using message: %@", buf, 0x2Au);

    v6 = v16;
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "msgDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:", v7);

}

void __103__HMDCameraProfileSettingsManager__updateDerivedPropertiesModelWithSettingsModel_userInitiated_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating derived properties model failed: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke_2;
  block[3] = &unk_24E79BBD0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v14 = 138543874;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings for message %@: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v11);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated settings for message %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }
}

void __94__HMDCameraProfileSettingsManager_handleBulletinNotificationEnableStateDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_coordinateNotificationSettingsWithServiceBulletinNotification:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected notification object for %@: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

uint64_t __79__HMDCameraProfileSettingsManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Current user's remote access changed, so notifying clients of current settings", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfCurrentSettings");
}

void __81__HMDCameraProfileSettingsManager_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceConfirmedPrimaryResident"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v23;
      *(_QWORD *)&v7 = 138543618;
      v20 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "type", v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", CFSTR("00000227-0000-1000-8000-0026BB765291"));

          if (v13)
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v27 = v17;
              v28 = 2112;
              v29 = v11;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling Manually Disabled characteristic change: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v14);
            v18 = *(void **)(a1 + 32);
            objc_msgSend(v18, "currentSettingsModel");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:", v19, 1, CFSTR("Manually disabled characteristic"));

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v8);
    }

  }
}

void __89__HMDCameraProfileSettingsManager_handleRecordingManagementServiceDidUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReachable");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_handleConnectedToAccessory");
}

uint64_t __73__HMDCameraProfileSettingsManager_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectedToAccessory");
}

uint64_t __75__HMDCameraProfileSettingsManager_handleHomePresenceEvaluatedNotification___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received Home Presence Evaluated", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateHomePresence");
}

uint64_t __76__HMDCameraProfileSettingsManager_handlePrimaryResidentUpdatedNotification___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceConfirmedPrimaryResident");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@We are now the primary resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_evaluateHomePresence");
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "currentSettingsModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateDerivedPropertiesModelWithSettingsModel:userInitiated:reason:", v9, 0, CFSTR("Current device became primary resident"));

    return objc_msgSend(*(id *)(a1 + 32), "_synchronizeCurrentAccessModeSettingToCameraWithCompletion:", 0);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Another device is primary resident, clearing anyUserAtHome", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "setAnyUserAtHome:", 0);
  }
}

void __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke_2;
  v7[3] = &unk_24E79A910;
  v8 = v3;
  v9 = a1[4];
  v10 = WeakRetained;
  v11 = a1[5];
  v6 = v3;
  dispatch_async(v5, v7);

}

void __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v1 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "respondWithError:", v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_updateNotificationSettings:forMessage:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
}

uint64_t __97__HMDCameraProfileSettingsManager__handleSynchronizeCloudStorageWithRecordingAccessModesMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronizeCloudStorageWithRecordingAccessModesWithCompletion:", a2);
}

void __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_2;
  v8[3] = &unk_24E79AB68;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v9, "_updateCloudStorageAndSettingsWithAccessMode:forIsAtHome:completion:", v6, v4, v8);

}

void __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings for message %@: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updated settings for message: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v10();

}

uint64_t __77__HMDCameraProfileSettingsManager_synchronizeSettingsToCameraWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronizeCurrentAccessModeSettingToCameraWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __82__HMDCameraProfileSettingsManager_synchronizeCloudStorageWithRecordingAccessModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronizeCloudStorageWithRecordingAccessModesWithCompletion:", a2);
}

uint64_t __62__HMDCameraProfileSettingsManager_disableRecordingAccessModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableRecordingAccessModesWithCompletion:", a2);
}

void __71__HMDCameraProfileSettingsManager_performAccessModeOperationWithBlock___block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__HMDCameraProfileSettingsManager_performAccessModeOperationWithBlock___block_invoke_2;
    v4[3] = &unk_24E79C2B8;
    v6 = a1[5];
    v5 = WeakRetained;
    dispatch_async(v3, v4);

  }
}

void __71__HMDCameraProfileSettingsManager_performAccessModeOperationWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71__HMDCameraProfileSettingsManager_performAccessModeOperationWithBlock___block_invoke_3;
  v2[3] = &unk_24E79BD80;
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t __71__HMDCameraProfileSettingsManager_performAccessModeOperationWithBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "cancelWithError:", a2);
  else
    return objc_msgSend(v2, "finish");
}

+ (id)zoneNameForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("accessory-profile-data-"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)clientErrorFromCanUpdateAccessModeError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("HMDCameraClipsQuotaErrorDomain"));

  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    goto LABEL_5;
  }
  v6 = objc_msgSend(v3, "code");
  v7 = (void *)MEMORY[0x24BDD1540];
  if (v6 != 1)
  {
LABEL_5:
    objc_msgSend(v7, "hmErrorWithCode:", 48);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2006);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v8;

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t141_105351 != -1)
    dispatch_once(&logCategory__hmf_once_t141_105351, &__block_literal_global_132);
  return (id)logCategory__hmf_once_v142_105352;
}

void __46__HMDCameraProfileSettingsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v142_105352;
  logCategory__hmf_once_v142_105352 = v0;

}

@end
