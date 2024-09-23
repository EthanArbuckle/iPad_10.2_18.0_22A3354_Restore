@implementation HMDCameraBulletinNotificationManager

- (HMDCameraBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5 accountManager:(id)a6 faceClassificationResolver:(id)a7 doorbellPressTracker:(id)a8 evaluator:(id)a9 notificationCenter:(id)a10
{
  id v16;
  id v17;
  HMDCameraBulletinNotificationManager *v18;
  HMDCameraBulletinNotificationManager *v19;
  uint64_t v20;
  NSUUID *messageTargetUUID;
  uint64_t v22;
  NSMutableDictionary *observersByCameraIdentifier;
  id synchronizeWithPrimaryDebounceTimerFactory;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v16 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraBulletinNotificationManager;
  v18 = -[HMDCameraBulletinNotificationManager init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_home, v16);
    objc_storeStrong((id *)&v19->_workQueue, a4);
    objc_storeStrong((id *)&v19->_messageDispatcher, a5);
    objc_msgSend(v16, "uuid", v26, v27, v28, v29, v30, v31);
    v20 = objc_claimAutoreleasedReturnValue();
    messageTargetUUID = v19->_messageTargetUUID;
    v19->_messageTargetUUID = (NSUUID *)v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    observersByCameraIdentifier = v19->_observersByCameraIdentifier;
    v19->_observersByCameraIdentifier = (NSMutableDictionary *)v22;

    v19->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_accountManager, a6);
    objc_storeStrong((id *)&v19->_faceClassificationResolver, a7);
    objc_storeStrong((id *)&v19->_doorbellPressTracker, a8);
    objc_storeStrong((id *)&v19->_notificationCenter, a10);
    objc_storeStrong((id *)&v19->_evaluator, a9);
    synchronizeWithPrimaryDebounceTimerFactory = v19->_synchronizeWithPrimaryDebounceTimerFactory;
    v19->_synchronizeWithPrimaryDebounceTimerFactory = &__block_literal_global_53819;

  }
  return v19;
}

- (NSArray)cameraSignificantEventRegistrations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53677;
  v15 = __Block_byref_object_dispose__53678;
  v16 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke;
  v8[3] = &unk_24E79B698;
  v5 = v2;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "unsafeSynchronousBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

- (NSArray)cameraSignificantEventRegistrationsForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__53677;
  v17 = __Block_byref_object_dispose__53678;
  v18 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_24E79C0A8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

- (NSArray)cameraReachabilityRegistrations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53677;
  v15 = __Block_byref_object_dispose__53678;
  v16 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke;
  v8[3] = &unk_24E79B698;
  v5 = v2;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "unsafeSynchronousBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

- (NSArray)cameraReachabilityRegistrationsForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__53677;
  v17 = __Block_byref_object_dispose__53678;
  v18 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_24E79C0A8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

- (NSArray)cameraAccessModeRegistrations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53677;
  v15 = __Block_byref_object_dispose__53678;
  v16 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke;
  v8[3] = &unk_24E79B698;
  v5 = v2;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "unsafeSynchronousBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

- (NSArray)cameraAccessModeRegistrationsForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__53677;
  v17 = __Block_byref_object_dispose__53678;
  v18 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_24E79C0A8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

- (HMDBulletinNotificationRegistrationSource)source
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDBulletinNotificationRegistrationSource *v10;
  void *v11;
  HMDCameraBulletinNotificationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCameraBulletinNotificationManager *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraBulletinNotificationManager accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCameraBulletinNotificationManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v9, v6);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device user", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v10 = 0;
    }

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
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device address", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)configureWithDeviceIsResidentCapable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDCameraBulletinNotificationManager *v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  void (**v32)(_QWORD, _QWORD, double);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  HMDCameraBulletinNotificationManager *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  void *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  NSObject *v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  __int128 buf;
  void (*v52)(uint64_t, void *);
  void *v53;
  HMDCameraBulletinNotificationManager *v54;
  HMDCameraBulletinNotificationManager *v55;
  NSObject *v56;
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    -[HMDCameraBulletinNotificationManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "cameraNotificationSettingsMigrationFileExistsOnDisk"))
    {
      objc_msgSend(v5, "loadMigrationCameraNotificationSettingsFromDisk");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x227676638]();
      if (v6)
      {
        v8 = v6;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v52 = __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke;
        v53 = &unk_24E77D298;
        v54 = self;
        v10 = (HMDCameraBulletinNotificationManager *)v8;
        v55 = v10;
        v11 = v9;
        v56 = v11;
        -[HMDCameraBulletinNotificationManager hmf_enumerateWithAutoreleasePoolUsingBlock:](v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &buf);
        if (-[NSObject count](v11, "count"))
        {
          -[HMDCameraBulletinNotificationManager home](self, "home");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "backingStore");
          v13 = v3;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "context");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = v13;
          objc_msgSend(v15, "managedObjectContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_129;
          v46[3] = &unk_24E79BBD0;
          v46[4] = self;
          v47 = v11;
          v48 = v16;
          v17 = v16;
          objc_msgSend(v17, "performBlockAndWait:", v46);

        }
      }
      else
      {
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to load camera notification settings from migration file", (uint8_t *)&buf, 0xCu);

        }
      }

      objc_autoreleasePoolPop(v7);
    }

  }
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v19, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager messageDispatcher](self, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v21;
  v50[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", CFSTR("HMDBulletinNotificationCameraSignificantEventMessage"), self, v23, sel__handleCameraSignificantEventNotificationMessage_);

  -[HMDCameraBulletinNotificationManager messageDispatcher](self, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v21;
  v49[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerForMessage:receiver:policies:selector:", CFSTR("HMDBulletinNotificationNotifyPrimaryResidentOfCameraSignificantEventMessage"), self, v25, sel__handleCameraSignificantEventBulletinNotifyPrimaryResidentMessage_);

  -[HMDCameraBulletinNotificationManager notificationCenter](self, "notificationCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "residentDeviceManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v27);

  -[HMDCameraBulletinNotificationManager notificationCenter](self, "notificationCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager accountManager](self, "accountManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceOrAccountUpdatedNotification_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v29);

  -[HMDCameraBulletinNotificationManager notificationCenter](self, "notificationCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager accountManager](self, "accountManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceOrAccountUpdatedNotification_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), v31);

  -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimerFactory](self, "synchronizeWithPrimaryDebounceTimerFactory");
  v32 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v32[2](v32, 28, 5.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager setSynchronizeWithPrimaryDebounceTimer:](self, "setSynchronizeWithPrimaryDebounceTimer:", v33);

  -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDelegate:", self);

  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDelegateQueue:", v35);

  if (v3)
  {
    -[HMDCameraBulletinNotificationManager setCurrentPrimary:](self, "setCurrentPrimary:", 0);
    v37 = objc_msgSend(v19, "isCurrentDeviceConfirmedPrimaryResident");
    v38 = (void *)MEMORY[0x227676638]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
    if (v37)
    {
      if (v41)
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Configuring as primary resident", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      -[HMDCameraBulletinNotificationManager workQueue](v39, "workQueue");
      v43 = objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __77__HMDCameraBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke;
      v45[3] = &unk_24E79C240;
      v45[4] = v39;
      dispatch_async(v43, v45);

    }
    else
    {
      if (v41)
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v44;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Configuring as non-primary resident", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
    }
  }

}

- (id)cameraUserNotificationSettingsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _Unwind_Exception *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  HMDCameraBulletinNotificationManager *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  v4 = a3;
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v17 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);
    _Unwind_Resume(v17);
  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__53677;
  v46 = __Block_byref_object_dispose__53678;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v5, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __83__HMDCameraBulletinNotificationManager_cameraUserNotificationSettingsForAccessory___block_invoke;
  v21 = &unk_24E77CE18;
  v12 = v11;
  v22 = v12;
  v13 = v4;
  v25 = &v48;
  v26 = &v42;
  v27 = &v38;
  v28 = &v34;
  v29 = &v30;
  v23 = v13;
  v24 = self;
  objc_msgSend(v12, "unsafeSynchronousBlock:", &v18);
  if (*((_BYTE *)v31 + 24))
  {
    v14 = objc_alloc_init(MEMORY[0x24BDD7828]);
    objc_msgSend(v14, "setSmartBulletinBoardNotificationEnabled:", *((unsigned __int8 *)v49 + 24), v18, v19, v20, v21, v22);
    objc_msgSend(v14, "setSmartBulletinBoardNotificationCondition:", v43[5]);
    objc_msgSend(v14, "setReachabilityEventNotificationEnabled:", *((unsigned __int8 *)v39 + 24));
    objc_msgSend(v14, "setAccessModeChangeNotificationEnabled:", *((unsigned __int8 *)v35 + 24));
    v15 = (void *)objc_msgSend(v14, "copy");

  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v15;
}

- (void)updateNotificationRegistrationsWithSettings:(id)a3 accessory:(id)a4 doorbellPressNotificationEnabled:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  HMDCameraBulletinNotificationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  HMDCameraSignificantEventBulletinNotificationRegistration *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  HMDCameraBulletinNotificationManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDCameraReachabilityBulletinNotificationRegistration *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDCameraReachabilityBulletinNotificationRegistration *v44;
  char v45;
  void *v46;
  HMDCameraBulletinNotificationManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  HMDCameraAccessModeBulletinNotificationRegistration *v51;
  void *v52;
  void *v53;
  HMDCameraAccessModeBulletinNotificationRegistration *v54;
  char v55;
  void *v56;
  HMDCameraBulletinNotificationManager *v57;
  NSObject *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  HMDCameraAccessModeBulletinNotificationRegistration *v66;
  HMDCameraReachabilityBulletinNotificationRegistration *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  HMDCameraAccessModeBulletinNotificationRegistration *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  HMDCameraBulletinNotificationManager *v83;
  id v84;
  HMDCameraReachabilityBulletinNotificationRegistration *v85;
  HMDCameraAccessModeBulletinNotificationRegistration *v86;
  id v87;
  char v88;
  char v89;
  char v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  HMDCameraAccessModeBulletinNotificationRegistration *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v7 = a5;
  v99 = *MEMORY[0x24BDAC8D0];
  v79 = (HMDCameraAccessModeBulletinNotificationRegistration *)a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v92 = v15;
    v93 = 2112;
    v94 = v16;
    v95 = 2112;
    v96 = v79;
    v97 = 2112;
    v98 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating notification registrations for accessory: %@, settings: %@, doorbellPressNotificationEnabled: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDCameraBulletinNotificationManager home](v13, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) == 0)
    _HMFPreconditionFailure();
  v78 = v11;
  v71 = v18;
  if (v7)
    v23 = 2;
  else
    v23 = 0;
  v24 = v23 | -[HMDCameraAccessModeBulletinNotificationRegistration isSmartBulletinBoardNotificationEnabled](v79, "isSmartBulletinBoardNotificationEnabled");
  -[HMDCameraAccessModeBulletinNotificationRegistration smartBulletinBoardNotificationCondition](v79, "smartBulletinBoardNotificationCondition");
  v25 = objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager conditionsFromPredicate:](v13, "conditionsFromPredicate:", v25);
  v26 = v7;
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD78D8], "bitwiseAndValueWithKeyPath:inPredicate:validValues:", *MEMORY[0x24BDD55D0], v25, 31);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v75, "integerValue");
  v77 = (void *)v25;
  objc_msgSend(MEMORY[0x24BDD78D8], "bitwiseAndValueWithKeyPath:inPredicate:validValues:", *MEMORY[0x24BDD55D8], v25, 7);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v74, "integerValue");
  v30 = [HMDCameraSignificantEventBulletinNotificationRegistration alloc];
  v31 = v10;
  objc_msgSend(v10, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v27;
  v33 = -[HMDCameraSignificantEventBulletinNotificationRegistration initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:](v30, "initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:", v32, v24, v28, v29, v27);

  v34 = -[HMDCameraAccessModeBulletinNotificationRegistration isSmartBulletinBoardNotificationEnabled](v79, "isSmartBulletinBoardNotificationEnabled") | v26;
  v35 = (void *)MEMORY[0x227676638]();
  v36 = v13;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v92 = v38;
    v93 = 2112;
    v94 = v39;
    v95 = 2112;
    v96 = (HMDCameraAccessModeBulletinNotificationRegistration *)v33;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Setting significant event registration enabled to %@ for %@", buf, 0x20u);

  }
  v72 = v34;
  v73 = (void *)v33;

  objc_autoreleasePoolPop(v35);
  v40 = [HMDCameraReachabilityBulletinNotificationRegistration alloc];
  v41 = v31;
  objc_msgSend(v31, "uuid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[HMDCameraReachabilityBulletinNotificationRegistration initWithAccessoryUUID:conditions:](v40, "initWithAccessoryUUID:conditions:", v42, v43);

  v45 = -[HMDCameraAccessModeBulletinNotificationRegistration isReachabilityEventNotificationEnabled](v79, "isReachabilityEventNotificationEnabled");
  v46 = (void *)MEMORY[0x227676638]();
  v47 = v36;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v92 = v49;
    v93 = 2112;
    v94 = v50;
    v95 = 2112;
    v96 = (HMDCameraAccessModeBulletinNotificationRegistration *)v44;
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting reachability registration enabled to %@ for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v46);
  v51 = [HMDCameraAccessModeBulletinNotificationRegistration alloc];
  objc_msgSend(v31, "uuid");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[HMDCameraAccessModeBulletinNotificationRegistration initWithAccessoryUUID:conditions:](v51, "initWithAccessoryUUID:conditions:", v52, v53);

  v55 = -[HMDCameraAccessModeBulletinNotificationRegistration isAccessModeChangeNotificationEnabled](v79, "isAccessModeChangeNotificationEnabled");
  v56 = (void *)MEMORY[0x227676638]();
  v57 = v47;
  HMFGetOSLogHandle();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v60 = v45;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v92 = v59;
    v93 = 2112;
    v94 = v61;
    v95 = 2112;
    v96 = v54;
    _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Setting access mode registration enabled to %@ for %@", buf, 0x20u);

    v45 = v60;
  }

  objc_autoreleasePoolPop(v56);
  objc_msgSend(v71, "backingStore");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "context");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "managedObjectContext");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke;
  v80[3] = &unk_24E77CE40;
  v81 = v41;
  v82 = v64;
  v83 = v57;
  v84 = v73;
  v88 = v72;
  v89 = v45;
  v85 = v44;
  v86 = v54;
  v90 = v55;
  v87 = v78;
  v65 = v78;
  v66 = v54;
  v67 = v44;
  v68 = v73;
  v69 = v64;
  v70 = v41;
  objc_msgSend(v69, "performBlock:", v80);

}

- (id)_deviceToNotifyForRegistration:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDCameraBulletinNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDCameraBulletinNotificationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraBulletinNotificationManager *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userWithUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDCameraBulletinNotificationManager evaluator](self, "evaluator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conditions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "conditionsPass:registrationUser:", v12, v10);

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138544130;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 2112;
      v36 = v6;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Condition(s) passed: %@ for registration: %@ from source: %@", (uint8_t *)&v31, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v7, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v13 && (objc_msgSend(v19, "isCurrentDevice") & 1) == 0)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v15;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138544130;
        v32 = v29;
        v33 = 2112;
        v34 = v20;
        v35 = 2112;
        v36 = v7;
        v37 = 2112;
        v38 = v6;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Resolved remote device: %@ to notify from source %@ for registration %@", (uint8_t *)&v31, 0x2Au);

      }
      objc_autoreleasePoolPop(v26);
      v21 = v20;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v25;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to evaluate registration: %@, no matching user for source: %@", (uint8_t *)&v31, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

- (id)devicesToNotifyForCameraReachabilityForAccessory:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  HMDCameraBulletinNotificationManager *v13;
  id v14;

  -[HMDCameraBulletinNotificationManager _cameraReachabilityBulletinNotificationRegistrationsForAccessory:](self, "_cameraReachabilityBulletinNotificationRegistrationsForAccessory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __89__HMDCameraBulletinNotificationManager_devicesToNotifyForCameraReachabilityForAccessory___block_invoke;
  v12 = &unk_24E77CE68;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v4, "na_each:", &v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

- (id)devicesToNotifyForAccessModeChangeForAccessory:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  HMDCameraBulletinNotificationManager *v13;
  id v14;

  -[HMDCameraBulletinNotificationManager _cameraAccessModeBulletinNotificationRegistrationsForAccessory:](self, "_cameraAccessModeBulletinNotificationRegistrationsForAccessory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __87__HMDCameraBulletinNotificationManager_devicesToNotifyForAccessModeChangeForAccessory___block_invoke;
  v12 = &unk_24E77CE90;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v4, "na_each:", &v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

- (void)handleSignificantEvent:(id)a3 cameraProfile:(id)a4 homePresence:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__HMDCameraBulletinNotificationManager_handleSignificantEvent_cameraProfile_homePresence___block_invoke;
  v15[3] = &unk_24E79A910;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)addCameraSignificantEventNotificationObserver:(id)a3 cameraIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraBulletinNotificationManager *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    v16 = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding camera significant event notification observer: %@ for camera identifier: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraBulletinNotificationManager observersByCameraIdentifier](v9, "observersByCameraIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraBulletinNotificationManager observersByCameraIdentifier](v9, "observersByCameraIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v7);

  }
  objc_msgSend(v14, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeCameraSignificantEventNotificationObserver:(id)a3 cameraIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraBulletinNotificationManager *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
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
    v15 = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing camera significant event notification observer: %@ for camera identifier: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraBulletinNotificationManager observersByCameraIdentifier](v9, "observersByCameraIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "removeObject:", v6);
  os_unfair_lock_unlock(p_lock);

}

- (id)conditionsFromPredicate:(id)a3
{
  return +[HMDNotificationConditionConverter conditionsFromPredicate:](HMDNotificationConditionConverter, "conditionsFromPredicate:", a3);
}

- (void)handleRemovedCameraAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDCameraBulletinNotificationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMDCameraBulletinNotificationManager *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling removed camera: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraBulletinNotificationManager home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__HMDCameraBulletinNotificationManager_handleRemovedCameraAccessory___block_invoke;
  v15[3] = &unk_24E79BBD0;
  v16 = v4;
  v17 = v12;
  v18 = v6;
  v13 = v12;
  v14 = v4;
  objc_msgSend(v13, "performBlock:", v15);

}

- (id)_cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__53677;
  v18 = __Block_byref_object_dispose__53678;
  v19 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __116__HMDCameraBulletinNotificationManager__cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier___block_invoke;
  v11[3] = &unk_24E79B698;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)_cameraReachabilityBulletinNotificationRegistrationsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__53677;
  v18 = __Block_byref_object_dispose__53678;
  v19 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __105__HMDCameraBulletinNotificationManager__cameraReachabilityBulletinNotificationRegistrationsForAccessory___block_invoke;
  v11[3] = &unk_24E79B698;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)_cameraAccessModeBulletinNotificationRegistrationsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__53677;
  v18 = __Block_byref_object_dispose__53678;
  v19 = (id)MEMORY[0x24BDBD1A8];
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __103__HMDCameraBulletinNotificationManager__cameraAccessModeBulletinNotificationRegistrationsForAccessory___block_invoke;
  v11[3] = &unk_24E79B698;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)_handleSignificantEventWithUUID:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassifications:(id)a7 cameraProfile:(id)a8 homePresence:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  HMDCameraBulletinNotificationManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  HMDCameraBulletinNotificationManager *v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v33 = a9;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v44 = v23;
    v45 = 2112;
    v46 = v15;
    v47 = 2048;
    v48 = a4;
    v49 = 2112;
    v50 = v16;
    v51 = 2048;
    v52 = a6;
    v53 = 2112;
    v54 = v17;
    v55 = 2112;
    v56 = v18;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Handling significant event: [UUID: %@, Reason: %lu, DateOfOccurrence: %@, ConfidenceLevel: %lu, FaceClassifications: %@] from camera: %@", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDCameraBulletinNotificationManager home](v21, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hapAccessory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraBulletinNotificationManager _cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier:](v21, "_cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __159__HMDCameraBulletinNotificationManager__handleSignificantEventWithUUID_reason_dateOfOccurrence_confidenceLevel_faceClassifications_cameraProfile_homePresence___block_invoke;
  v34[3] = &unk_24E77CF18;
  v35 = v17;
  v36 = v24;
  v37 = v21;
  v38 = v15;
  v41 = a4;
  v42 = a6;
  v39 = v16;
  v40 = v18;
  v28 = v18;
  v29 = v16;
  v30 = v15;
  v31 = v24;
  v32 = v17;
  objc_msgSend(v27, "na_each:", v34);

}

- (void)_handleSignificantEvent:(id)a3 cameraProfile:(id)a4 homePresence:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  v9 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[HMDCameraBulletinNotificationManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCurrentDeviceConfirmedPrimaryResident");

  if (v12)
  {
    objc_msgSend(v9, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "reason");
    objc_msgSend(v9, "dateOfOccurrence");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "confidenceLevel");
    objc_msgSend(v9, "faceClassifications");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraBulletinNotificationManager _handleSignificantEventWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfile:homePresence:](self, "_handleSignificantEventWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfile:homePresence:", v13, v14, v15, v16, v17, v18, v8);
    v9 = (id)v15;
  }
  else
  {
    objc_msgSend(v18, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraBulletinNotificationManager _notifyPrimaryResidentOfSignificantEvent:withCameraProfileUUID:](self, "_notifyPrimaryResidentOfSignificantEvent:withCameraProfileUUID:", v9, v13);
  }

}

- (BOOL)_filterPassesForCameraSignificantEvent:(id)a3 registration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "reason") == 6)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMCameraSignificantEventTypesFromReasons();

  if ((objc_msgSend(v6, "significantEventTypes") & v10) == 0)
  {
    v15 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "reason") == 2 && objc_msgSend(v6, "personFamiliarityOptions"))
  {
    objc_msgSend(v5, "faceClassification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "person");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = 4;
    }
    else
    {
      objc_msgSend(v5, "faceClassification");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        v14 = 2;
      else
        v14 = 1;
    }
    v15 = (objc_msgSend(v6, "personFamiliarityOptions") & v14) != 0;
  }
  else
  {
LABEL_7:
    v15 = 1;
  }
LABEL_13:

  return v15;
}

- (void)_notifyPrimaryResidentOfSignificantEvent:(id)a3 withCameraProfileUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HMDCameraSignificantEventBulletinParams *v9;
  void *v10;
  id v11;
  void *v12;
  HMDCameraBulletinNotificationManager *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  HMDRemoteMessage *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[HMDCameraSignificantEventBulletinParams initWithSignificantEvent:cameraProfileUUID:]([HMDCameraSignificantEventBulletinParams alloc], "initWithSignificantEvent:cameraProfileUUID:", v6, v7);
  v30 = 0;
  +[HMDCameraSignificantEventBulletinParamsDictionaryTransformer transformedValue:error:](HMDCameraSignificantEventBulletinParamsDictionaryTransformer, "transformedValue:error:", v9, &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
  {
    v27 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying primary resident of significant event: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v31 = CFSTR("HMDBulletinNotificationSignificantEventParamsKey");
    v32 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraBulletinNotificationManager home](v13, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryResident");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDCameraBulletinNotificationManager messageTargetUUID](v13, "messageTargetUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v20, "initWithTarget:device:", v21, v22);

    v24 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDBulletinNotificationNotifyPrimaryResidentOfCameraSignificantEventMessage"), v23, v17, 3, 1, 60.0);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __103__HMDCameraBulletinNotificationManager__notifyPrimaryResidentOfSignificantEvent_withCameraProfileUUID___block_invoke;
    v28[3] = &unk_24E799400;
    v28[4] = v13;
    v29 = v6;
    -[HMDRemoteMessage setResponseHandler:](v24, "setResponseHandler:", v28);
    -[HMDCameraBulletinNotificationManager messageDispatcher](v13, "messageDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sendMessage:", v24);

    v11 = v27;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to transform significant event payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (BOOL)_shouldNotifyForDoorbellPressForSignificantEvent:(id)a3 registration:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraBulletinNotificationManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "notificationModes") & 2) != 0)
  {
    -[HMDCameraBulletinNotificationManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cameraAccessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __102__HMDCameraBulletinNotificationManager__shouldNotifyForDoorbellPressForSignificantEvent_registration___block_invoke;
    v23[3] = &unk_24E7928E0;
    v11 = v6;
    v24 = v11;
    objc_msgSend(v10, "na_firstObjectPassingTest:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dateOfOccurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraBulletinNotificationManager _recentDoorbellPressIntervalForSignificantEventDate:](self, "_recentDoorbellPressIntervalForSignificantEventDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraBulletinNotificationManager doorbellPressTracker](self, "doorbellPressTracker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v15, "doorbellPressInDateInterval:doorbellAccessory:", v14, v12);

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v22 = v12;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v19;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Doorbell press near significant event: %@, %@", buf, 0x20u);

      v12 = v22;
    }

    objc_autoreleasePoolPop(v16);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldNotifyForActivityForSignificantEvent:(id)a3 remoteRegistration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  HMDCameraBulletinNotificationManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraBulletinNotificationManager *v23;
  NSObject *v24;
  void *v25;
  HMDCameraBulletinNotificationManager *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "registration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "notificationModes") & 1) != 0)
  {
    if (-[HMDCameraBulletinNotificationManager _filterPassesForCameraSignificantEvent:registration:](self, "_filterPassesForCameraSignificantEvent:registration:", v6, v8))
    {
      -[HMDCameraBulletinNotificationManager home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userWithUUID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[HMDCameraBulletinNotificationManager evaluator](self, "evaluator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "conditions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "conditionsPass:registrationUser:", v14, v12);

        if ((v15 & 1) != 0)
        {
          v16 = 1;
LABEL_16:

          goto LABEL_17;
        }
        v22 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uniqueIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v25;
          v31 = 2114;
          v32 = v27;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Condition(s) did not pass for significant event: %{public}@", (uint8_t *)&v29, 0x16u);

          goto LABEL_14;
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543874;
          v30 = v25;
          v31 = 2112;
          v32 = v8;
          v33 = 2112;
          v34 = v9;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to evaluate registration: %@, no matching user for source: %@", (uint8_t *)&v29, 0x20u);
LABEL_14:

        }
      }

      objc_autoreleasePoolPop(v22);
      v16 = 0;
      goto LABEL_16;
    }
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v20;
      v31 = 2114;
      v32 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Filter did not pass for significant event: %{public}@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  v16 = 0;
LABEL_17:

  return v16;
}

- (void)_handleSignificantEvent:(id)a3 remoteRegistration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraBulletinNotificationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  HMDCameraBulletinNotificationManager *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v14;
    v36 = 2114;
    v37 = v15;
    v38 = 2112;
    v39 = v7;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Checking if significant event %{public}@ matches registration: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v7, "registration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDCameraBulletinNotificationManager _shouldNotifyForDoorbellPressForSignificantEvent:registration:](v12, "_shouldNotifyForDoorbellPressForSignificantEvent:registration:", v6, v16);
  v18 = -[HMDCameraBulletinNotificationManager _shouldNotifyForActivityForSignificantEvent:remoteRegistration:](v12, "_shouldNotifyForActivityForSignificantEvent:remoteRegistration:", v6, v7);
  if (v17 || v18)
  {
    v19 = 2;
    if (!v17)
      v19 = 0;
    v20 = v19 | v18;
    v21 = objc_msgSend(v10, "isCurrentDevice");
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v12;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v25)
      {
        HMFGetLogIdentifier();
        v33 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2114;
        v37 = v27;
        v38 = 2112;
        v39 = v28;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Notifying current device of significant event: %{public}@ notification reasons: %@", buf, 0x20u);

        v22 = v33;
      }

      objc_autoreleasePoolPop(v22);
      objc_msgSend(v6, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cameraProfileUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraBulletinNotificationManager _notifyObserversOfSignificantEventUUID:cameraProfileUUID:notificationReasons:](v23, "_notifyObserversOfSignificantEventUUID:cameraProfileUUID:notificationReasons:", v29, v30, v20);

    }
    else
    {
      if (v25)
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v35 = v31;
        v36 = 2112;
        v37 = v6;
        v38 = 2112;
        v39 = v32;
        v40 = 2112;
        v41 = v10;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Sending notification for significant event: %@ notification reasons: %@ to remote device: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDCameraBulletinNotificationManager _notifyDevice:aboutSignificantEvent:notificationReasons:](v23, "_notifyDevice:aboutSignificantEvent:notificationReasons:", v10, v6, v20);
    }
  }

}

- (void)_notifyDevice:(id)a3 aboutSignificantEvent:(id)a4 notificationReasons:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRemoteDeviceMessageDestination *v16;
  void *v17;
  HMDRemoteDeviceMessageDestination *v18;
  HMDRemoteMessage *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  HMDCameraBulletinNotificationManager *v27;
  id v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v30[0] = CFSTR("HMDBulletinNotificationCameraSignificantEventUUIDMessageKey");
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v11;
  v30[1] = CFSTR("HMDBulletinNotificationCameraProfileUUIDMessageKey");
  objc_msgSend(v9, "cameraProfileUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  v30[2] = CFSTR("HMDBulletinNotificationCameraSignificantEventModesMessageKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [HMDRemoteDeviceMessageDestination alloc];
  -[HMDCameraBulletinNotificationManager messageTargetUUID](self, "messageTargetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v16, "initWithTarget:device:", v17, v8);

  v19 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDBulletinNotificationCameraSignificantEventMessage"), v18, v15, 3, 1, 60.0);
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __96__HMDCameraBulletinNotificationManager__notifyDevice_aboutSignificantEvent_notificationReasons___block_invoke;
  v26 = &unk_24E795C28;
  v27 = self;
  v28 = v8;
  v29 = v9;
  v20 = v9;
  v21 = v8;
  -[HMDRemoteMessage setResponseHandler:](v19, "setResponseHandler:", &v23);
  -[HMDCameraBulletinNotificationManager messageDispatcher](self, "messageDispatcher", v23, v24, v25, v26, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendMessage:", v19);

}

- (void)_handleCameraSignificantEventBulletinNotificationRegistration:(id)a3 removed:(BOOL)a4
{
  id v6;
  void *v7;
  HMDCameraBulletinNotificationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraBulletinNotificationManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling Camera Significant Event Bulletin Notification Registration: %@, removed: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "registration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraBulletinNotificationManager home](v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cameraAccessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __110__HMDCameraBulletinNotificationManager__handleCameraSignificantEventBulletinNotificationRegistration_removed___block_invoke;
  v24[3] = &unk_24E7928E0;
  v15 = v12;
  v25 = v15;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD58F0], *MEMORY[0x24BDD6BA0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (!a4 && (objc_msgSend(v15, "notificationModes") & 2) != 0)
      {
        if ((objc_msgSend(v15, "notificationModes") & 2) == 0)
          goto LABEL_9;
        -[HMDCameraBulletinNotificationManager doorbellPressTracker](v8, "doorbellPressTracker");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "startTrackingPressesForDoorbellAccessory:registration:", v16, v15);
      }
      else
      {
        -[HMDCameraBulletinNotificationManager doorbellPressTracker](v8, "doorbellPressTracker");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stopTrackingPressesForDoorbellAccessory:registration:", v16, v15);
      }

    }
LABEL_9:

    goto LABEL_13;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = v8;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cameraIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v22;
    v28 = 2112;
    v29 = v23;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP Accessory with UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_13:

}

- (void)_handleDeviceBecamePrimary
{
  NSObject *v3;
  void *v4;
  HMDCameraBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became primary resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraBulletinNotificationManager setCurrentPrimary:](v5, "setCurrentPrimary:", 1);
  -[HMDCameraBulletinNotificationManager cameraSignificantEventRegistrations](v5, "cameraSignificantEventRegistrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HMDCameraBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke;
  v9[3] = &unk_24E77CF80;
  v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);

}

- (void)_handleDeviceBecameNotPrimary
{
  NSObject *v3;
  void *v4;
  HMDCameraBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became non-primary resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraBulletinNotificationManager setCurrentPrimary:](v5, "setCurrentPrimary:", 0);
  -[HMDCameraBulletinNotificationManager cameraSignificantEventRegistrations](v5, "cameraSignificantEventRegistrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__HMDCameraBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke;
  v9[3] = &unk_24E77CF80;
  v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);

}

- (id)_recentDoorbellPressIntervalForSignificantEventDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "dateWithTimeInterval:sinceDate:", v4, -60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v4, 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v5, v6);
  return v7;
}

- (void)_requestSynchronizeRegistrations
{
  void *v3;
  HMDCameraBulletinNotificationManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](v4, "synchronizeWithPrimaryDebounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isRunning");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting synchronize registrations, debounce timer running: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](v4, "synchronizeWithPrimaryDebounceTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)_synchronizeLocalRegistrationsWithPrimaryResident
{
  NSObject *v3;
  void *v4;
  HMDCameraBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  HMDCameraBulletinNotificationManager *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  HMDCameraBulletinNotificationManager *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  HMDCameraBulletinNotificationManager *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  HMDCameraBulletinNotificationManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDCameraBulletinNotificationManager *v46;
  NSObject *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  _QWORD v55[4];
  id v56;
  __int128 *v57;
  _QWORD v58[5];
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _QWORD v81[5];
  id v82;
  id v83;
  __int128 *p_buf;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint8_t v99[4];
  void *v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int128 buf;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
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
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronizing local registrations with primary resident", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraBulletinNotificationManager source](v5, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__53677;
    v108 = __Block_byref_object_dispose__53678;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v109 = (id)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    v94 = &v93;
    v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__53677;
    v97 = __Block_byref_object_dispose__53678;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v98 = (id)objc_claimAutoreleasedReturnValue();
    v87 = 0;
    v88 = &v87;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__53677;
    v91 = __Block_byref_object_dispose__53678;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v92 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCameraBulletinNotificationManager home](v5, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x24BDAC760];
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
    v81[3] = &unk_24E77D020;
    v81[4] = v5;
    v82 = v8;
    v13 = v11;
    v83 = v13;
    p_buf = &buf;
    v85 = &v93;
    v86 = &v87;
    objc_msgSend(v13, "unsafeSynchronousBlock:", v81);
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__53677;
    v79 = __Block_byref_object_dispose__53678;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v80 = (id)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__53677;
    v73 = __Block_byref_object_dispose__53678;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v74 = (id)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__53677;
    v67 = __Block_byref_object_dispose__53678;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v68 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v58[0] = v12;
    v58[1] = 3221225472;
    v58[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5;
    v58[3] = &unk_24E77D0C0;
    v58[4] = v5;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v59 = v14;
    v60 = &v75;
    v61 = &v69;
    v62 = &v63;
    v15 = (void *)MEMORY[0x227676638](objc_msgSend(v14, "performBlockAndWait:", v58));
    v16 = v5;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v76[5];
      v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v99 = 138543874;
      v100 = v18;
      v101 = 2112;
      v102 = v19;
      v103 = 2112;
      v104 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalSignificantEventRegistrations: %@ remoteSignificantEventRegistrations: %@", v99, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v16;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v70[5];
      v26 = v94[5];
      *(_DWORD *)v99 = 138543874;
      v100 = v24;
      v101 = 2112;
      v102 = v25;
      v103 = 2112;
      v104 = v26;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalReachabilityRegistrations: %@ remoteReachabilityRegistrations: %@", v99, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v22;
    HMFGetOSLogHandle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v64[5];
      v32 = v88[5];
      *(_DWORD *)v99 = 138543874;
      v100 = v30;
      v101 = 2112;
      v102 = v31;
      v103 = 2112;
      v104 = v32;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalAccessModeRegistrations: %@ remoteAccessModeRegistrations: %@", v99, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v76[5];
    v55[0] = v12;
    v55[1] = 3221225472;
    v55[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_101;
    v55[3] = &unk_24E77D110;
    v57 = &buf;
    v36 = v33;
    v56 = v36;
    objc_msgSend(v35, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v55);
    objc_msgSend(v34, "unionSet:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v37 = (void *)v70[5];
    v52[0] = v12;
    v52[1] = 3221225472;
    v52[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3_105;
    v52[3] = &unk_24E77D160;
    v54 = &v93;
    v38 = v36;
    v53 = v38;
    objc_msgSend(v37, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v52);
    objc_msgSend(v34, "unionSet:", v94[5]);
    v39 = (void *)v64[5];
    v49[0] = v12;
    v49[1] = 3221225472;
    v49[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5_109;
    v49[3] = &unk_24E77D1B0;
    v51 = &v87;
    v40 = v38;
    v50 = v40;
    objc_msgSend(v39, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v49);
    objc_msgSend(v34, "unionSet:", v88[5]);
    if (objc_msgSend(v40, "hmf_isEmpty") && objc_msgSend(v34, "hmf_isEmpty"))
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = v28;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543362;
        v100 = v44;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@No changes detected to sync with primary", v99, 0xCu);

      }
      objc_autoreleasePoolPop(v41);
    }
    else
    {
      -[HMDCameraBulletinNotificationManager _updateRegistrationsOnPrimaryWithEnabledRegistrations:disabledRegistrations:](v28, "_updateRegistrationsOnPrimaryWithEnabledRegistrations:disabledRegistrations:", v40, v34);
    }

    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v69, 8);

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v87, 8);

    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v45 = (void *)MEMORY[0x227676638]();
    v46 = v5;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v48;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when synchronizing registrations with primary", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v45);
  }

}

- (void)_handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraBulletinNotificationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  HMDCameraBulletinNotificationManager *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
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
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident update notification", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraBulletinNotificationManager _requestSynchronizeRegistrations](v7, "_requestSynchronizeRegistrations");
  -[HMDCameraBulletinNotificationManager home](v7, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCurrentDeviceConfirmedPrimaryResident");

  v12 = -[HMDCameraBulletinNotificationManager currentPrimary](v7, "currentPrimary");
  if (v11)
  {
    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v7;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@We are already the primary", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      -[HMDCameraBulletinNotificationManager _handleDeviceBecamePrimary](v7, "_handleDeviceBecamePrimary");
    }
  }
  else if (v12)
  {
    -[HMDCameraBulletinNotificationManager _handleDeviceBecameNotPrimary](v7, "_handleDeviceBecameNotPrimary");
  }

}

- (void)_handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraBulletinNotificationManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
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
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling current device or account updated notification", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraBulletinNotificationManager _requestSynchronizeRegistrations](v7, "_requestSynchronizeRegistrations");

}

- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraBulletinNotificationManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraBulletinNotificationManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCameraBulletinNotificationManager *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v12;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating registrations on primary resident, [enabled : %@], [disabled : %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCameraBulletinNotificationManager home](v10, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "bulletinNotificationsSupported") & 1) != 0)
  {
    -[HMDCameraBulletinNotificationManager source](v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __116__HMDCameraBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke;
      v24[3] = &unk_24E792CD8;
      v24[4] = v10;
      v25 = v14;
      v26 = v6;
      v27 = v7;
      objc_msgSend(v13, "updateBulletinRegistrationOnPrimaryResidentWithSource:enableRegistrations:disableRegistration:completionHandler:", v25, v26, v27, v24);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when updating notification registrations", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications are not supported, only modifying local registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (id)_currentHomeCameraAccessoryUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDCameraBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_115_53666);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDCameraBulletinNotificationManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager _currentHomeCameraAccessoryUUIDs](self, "_currentHomeCameraAccessoryUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraSignificantEventRegistration fetchRequest](MKFLocalBulletinCameraSignificantEventRegistration, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __109__HMDCameraBulletinNotificationManager__mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_24E77D1F8;
    v16 = v5;
    objc_msgSend(v7, "na_filter:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

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
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera significant event registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)_mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDCameraBulletinNotificationManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager _currentHomeCameraAccessoryUUIDs](self, "_currentHomeCameraAccessoryUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraReachabilityRegistration fetchRequest](MKFLocalBulletinCameraReachabilityRegistration, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __105__HMDCameraBulletinNotificationManager__mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_24E77D220;
    v16 = v5;
    objc_msgSend(v7, "na_filter:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

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
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera reachability registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)_mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDCameraBulletinNotificationManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager _currentHomeCameraAccessoryUUIDs](self, "_currentHomeCameraAccessoryUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraAccessModeRegistration fetchRequest](MKFLocalBulletinCameraAccessModeRegistration, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __103__HMDCameraBulletinNotificationManager__mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_24E77D248;
    v16 = v5;
    objc_msgSend(v7, "na_filter:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

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
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera access mode registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (BOOL)_updateLocalStoreWithCameraSignificantEventBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  id v26;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!v10)
  {
    v16 = (void *)MEMORY[0x24BDBB658];
    +[MKFLocalBulletinCameraSignificantEventRegistration entity](MKFLocalBulletinCameraSignificantEventRegistration, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertNewObjectForEntityForName:inManagedObjectContext:", v18, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "cameraIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryModelID:", v19);

    objc_msgSend(v10, "setEnabled:", v7);
    objc_msgSend(v10, "setNotificationModes:", objc_msgSend(v9, "notificationModes"));
    objc_msgSend(v10, "setSignificantEventTypes:", objc_msgSend(v9, "significantEventTypes"));
LABEL_11:
    objc_msgSend(v10, "setPersonFamiliarityOptions:", objc_msgSend(v9, "personFamiliarityOptions"));
    LOBYTE(v12) = 1;
    goto LABEL_12;
  }
  v12 = objc_msgSend(v10, "enabled") ^ v7;
  if (v12 == 1)
    objc_msgSend(v10, "setEnabled:", v7);
  v13 = objc_msgSend(v10, "notificationModes");
  if (v13 != objc_msgSend(v9, "notificationModes"))
  {
    objc_msgSend(v10, "setNotificationModes:", objc_msgSend(v9, "notificationModes"));
    LOBYTE(v12) = 1;
  }
  v14 = objc_msgSend(v10, "significantEventTypes");
  if (v14 != objc_msgSend(v9, "significantEventTypes"))
  {
    objc_msgSend(v10, "setSignificantEventTypes:", objc_msgSend(v9, "significantEventTypes"));
    LOBYTE(v12) = 1;
  }
  v15 = objc_msgSend(v10, "personFamiliarityOptions");
  if (v15 != objc_msgSend(v9, "personFamiliarityOptions"))
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v10, "conditions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:](HMDBulletinNotificationRegistrationUtilities, "conditionsFromLocalConditions:", v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  objc_msgSend(v9, "conditions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "isEqualToSet:", v23);

  if ((v24 & 1) == 0)
  {
    if (v20)
      objc_msgSend(v10, "removeConditions:", v20);
    objc_msgSend(v9, "conditions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v10, v11, v25);

    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)_updateLocalStoreWithCameraReachabilityBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!v10)
  {
    v13 = (void *)MEMORY[0x24BDBB658];
    +[MKFLocalBulletinCameraReachabilityRegistration entity](MKFLocalBulletinCameraReachabilityRegistration, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertNewObjectForEntityForName:inManagedObjectContext:", v15, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "accessoryUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryModelID:", v16);

    goto LABEL_5;
  }
  if (objc_msgSend(v10, "enabled") != v7)
  {
LABEL_5:
    objc_msgSend(v10, "setEnabled:", v7);
    v12 = 1;
    goto LABEL_6;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (BOOL)_updateLocalStoreWithCameraAccessModeBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!v10)
  {
    v13 = (void *)MEMORY[0x24BDBB658];
    +[MKFLocalBulletinCameraAccessModeRegistration entity](MKFLocalBulletinCameraAccessModeRegistration, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertNewObjectForEntityForName:inManagedObjectContext:", v15, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "accessoryUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryModelID:", v16);

    goto LABEL_5;
  }
  if (objc_msgSend(v10, "enabled") != v7)
  {
LABEL_5:
    objc_msgSend(v10, "setEnabled:", v7);
    v12 = 1;
    goto LABEL_6;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (void)_notifyObserversOfSignificantEventUUID:(id)a3 cameraProfileUUID:(id)a4 notificationReasons:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock_with_options();
  -[HMDCameraBulletinNotificationManager observersByCameraIdentifier](self, "observersByCameraIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __117__HMDCameraBulletinNotificationManager__notifyObserversOfSignificantEventUUID_cameraProfileUUID_notificationReasons___block_invoke;
  v15[3] = &unk_24E77D270;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = a5;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v14, "na_each:", v15);

}

- (void)_handleCameraSignificantEventNotificationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraBulletinNotificationManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDCameraBulletinNotificationManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCameraBulletinNotificationManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraBulletinNotificationManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDCameraBulletinNotificationManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "uuidForKey:", CFSTR("HMDBulletinNotificationCameraSignificantEventUUIDMessageKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "uuidForKey:", CFSTR("HMDBulletinNotificationCameraProfileUUIDMessageKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "remoteSourceDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "numberForKey:", CFSTR("HMDBulletinNotificationCameraSignificantEventModesMessageKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v10 = (void *)MEMORY[0x227676638]();
          v11 = self;
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "messagePayload");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v13;
            v38 = 2112;
            v39 = v14;
            _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Notification reasons missing from payload: %@, populating with hard-coded value", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          v9 = &unk_24E96ACE8;
        }
        v15 = objc_msgSend(v9, "unsignedIntegerValue");
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSPrintF();
          v35 = v16;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v37 = v19;
          v38 = 2112;
          v39 = v6;
          v40 = 2112;
          v41 = v7;
          v42 = 2112;
          v43 = v20;
          v44 = 2112;
          v45 = v8;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Received message for camera significant event with UUID: %@ cameraProfileUUID: %@ notificationReasons: %@ from device: %@", buf, 0x34u);

          v16 = v35;
        }

        objc_autoreleasePoolPop(v16);
        -[HMDCameraBulletinNotificationManager _notifyObserversOfSignificantEventUUID:cameraProfileUUID:notificationReasons:](v17, "_notifyObserversOfSignificantEventUUID:cameraProfileUUID:notificationReasons:", v6, v7, v15);
        objc_msgSend(v4, "respondWithSuccess");
      }
      else
      {
        v31 = (void *)MEMORY[0x227676638]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v34;
          v38 = 2112;
          v39 = v4;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote device for message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v9);
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
        objc_msgSend(v4, "messagePayload");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        v38 = 2112;
        v39 = v30;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera profile UUID in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v8);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera significant event UUID in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);
  }

}

- (id)_cameraProfileWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDCameraBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v7 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "cameraProfiles", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v15, "uniqueIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v4);

              if ((v17 & 1) != 0)
              {
                v18 = v15;

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v20;
      }
      v18 = 0;
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_homePresenceByPairingIdentity
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraBulletinNotificationManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenceMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentHomePresence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedIdentifierDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x24BDBD1B8];
  v9 = v8;

  return v9;
}

- (void)_handleCameraSignificantEventBulletinNotifyPrimaryResidentMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMDHomePresenceRemote *v13;
  void *v14;
  HMDHomePresenceRemote *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDCameraBulletinNotificationManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDCameraBulletinNotificationManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraBulletinNotificationManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraBulletinNotificationManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCurrentDeviceConfirmedPrimaryResident");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("HMDBulletinNotificationSignificantEventParamsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    +[HMDCameraSignificantEventBulletinParamsDictionaryTransformer reverseTransformedValue:error:](HMDCameraSignificantEventBulletinParamsDictionaryTransformer, "reverseTransformedValue:error:", v8, &v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v40;
    if (v9)
    {
      objc_msgSend(v9, "cameraProfileUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraBulletinNotificationManager _cameraProfileWithUUID:](self, "_cameraProfileWithUUID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = [HMDHomePresenceRemote alloc];
        -[HMDCameraBulletinNotificationManager _homePresenceByPairingIdentity](self, "_homePresenceByPairingIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HMDHomePresenceRemote initWithPresenceByPairingIdentity:](v13, "initWithPresenceByPairingIdentity:", v14);

        objc_msgSend(v9, "UUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v9, "reason");
        objc_msgSend(v9, "dateOfOccurrence");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v12;
        v18 = v10;
        v19 = objc_msgSend(v9, "confidenceLevel");
        objc_msgSend(v9, "faceClassifications");
        v20 = v4;
        v21 = v8;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v19;
        v10 = v18;
        v12 = v17;
        -[HMDCameraBulletinNotificationManager _handleSignificantEventWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfile:homePresence:](self, "_handleSignificantEventWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfile:homePresence:", v39, v38, v16, v23, v22, v17, v15);

        v8 = v21;
        v4 = v20;

        objc_msgSend(v20, "respondWithSuccess");
      }
      else
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v36;
          v43 = 2112;
          v44 = v37;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera profile in message payload: %@", buf, 0x16u);

          v12 = 0;
        }

        objc_autoreleasePoolPop(v33);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v15 = (HMDHomePresenceRemote *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v15);
      }

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        v43 = 2112;
        v44 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Received HMDCameraSignificantEventBulletinNotifyPrimaryMessage on non-primary device, ignoring", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__HMDCameraBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__HMDCameraBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDCameraBulletinNotificationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDCameraBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    -[HMDCameraBulletinNotificationManager _synchronizeLocalRegistrationsWithPrimaryResident](self, "_synchronizeLocalRegistrationsWithPrimaryResident");
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer, ignoring", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)observersByCameraIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver
{
  return (HMDCameraSignificantEventFaceClassificationResolver *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAppleAccountManager)accountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 64, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (HMDDoorbellPressTracker)doorbellPressTracker
{
  return (HMDDoorbellPressTracker *)objc_getProperty(self, a2, 80, 1);
}

- (HMDNotificationConditionEvaluator)evaluator
{
  return (HMDNotificationConditionEvaluator *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)currentPrimary
{
  return self->_currentPrimary;
}

- (void)setCurrentPrimary:(BOOL)a3
{
  self->_currentPrimary = a3;
}

- (HMFTimer)synchronizeWithPrimaryDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)synchronizeWithPrimaryDebounceTimerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_synchronizeWithPrimaryDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_synchronizeWithPrimaryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_doorbellPressTracker, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_faceClassificationResolver, 0);
  objc_storeStrong((id *)&self->_observersByCameraIdentifier, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

uint64_t __88__HMDCameraBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCurrentDeviceOrAccountUpdatedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__HMDCameraBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePrimaryResidentUpdateNotification:", *(_QWORD *)(a1 + 40));
}

void __117__HMDCameraBulletinNotificationManager__notifyObserversOfSignificantEventUUID_cameraProfileUUID_notificationReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      NSPrintF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying observer: %@ about camera significant event with UUID: %@ cameraProfileUUID: %@ notificationReasons: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "notificationManager:didReceiveNotificationForCameraSignificantEventIdentifier:notificationReasons:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __103__HMDCameraBulletinNotificationManager__mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __105__HMDCameraBulletinNotificationManager__mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __109__HMDCameraBulletinNotificationManager__mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __72__HMDCameraBulletinNotificationManager__currentHomeCameraAccessoryUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __116__HMDCameraBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v19 = 138544386;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v3;
      v12 = "%{public}@Unable to update camera registrations on primary resident: source: %@, [enabled : %@], [disabled : %@], error: %@";
      v13 = v7;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 52;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v19, v15);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = 138544130;
    v20 = v8;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    v12 = "%{public}@Updating camera registrations with primary resident was successful, source: %@, [enabled: %@], [disabled: %@]";
    v13 = v7;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 42;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cameraSignificantEventRegistrationsForSource:context:", v3, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_class();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cameraReachabilityRegistrationsForSource:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cameraAccessModeRegistrationsForSource:context:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2;
  v17[3] = &unk_24E77CFA8;
  v17[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v14, "na_each:", v17);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3;
  v16[3] = &unk_24E77CFD0;
  v16[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v8, "na_each:", v16);
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4;
  v15[3] = &unk_24E77CFF8;
  v15[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v12, "na_each:", v15);

}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6;
  v8[3] = &unk_24E77D048;
  v8[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "na_each:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_7;
  v7[3] = &unk_24E77D070;
  v7[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "na_each:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_8;
  v6[3] = &unk_24E77D098;
  v6[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "na_each:", v6);

}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_102;
  v7[3] = &unk_24E77D0E8;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4_106;
  v7[3] = &unk_24E77D138;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5_109(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6_110;
  v7[3] = &unk_24E77D188;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6_110(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4_106(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_102(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "cameraIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cameraIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraSignificantEventRegistrationFromLocalRegistration:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraReachabilityRegistrationFromLocalRegistration:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraAccessModeRegistrationFromLocalRegistration:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraSignificantEventRegistrationFromMKFRegistration:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraReachabilityRegistrationFromMKFRegistration:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraAccessModeRegistrationFromMKFRegistration:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __69__HMDCameraBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCameraSignificantEventBulletinNotificationRegistration:removed:", a2, 1);
}

uint64_t __66__HMDCameraBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCameraSignificantEventBulletinNotificationRegistration:removed:", a2, 0);
}

uint64_t __110__HMDCameraBulletinNotificationManager__handleCameraSignificantEventBulletinNotificationRegistration_removed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cameraIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __96__HMDCameraBulletinNotificationManager__notifyDevice_aboutSignificantEvent_notificationReasons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v20 = 138544130;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v5;
      v14 = "%{public}@Failed to notify device: %@ of significant event: %@ error: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 42;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, (uint8_t *)&v20, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v14 = "%{public}@Successfully notified device: %@ of significant event: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __102__HMDCameraBulletinNotificationManager__shouldNotifyForDoorbellPressForSignificantEvent_registration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "cameraProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_91_53718);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cameraProfileUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

uint64_t __102__HMDCameraBulletinNotificationManager__shouldNotifyForDoorbellPressForSignificantEvent_registration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __103__HMDCameraBulletinNotificationManager__notifyPrimaryResidentOfSignificantEvent_withCameraProfileUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      v13 = "%{public}@Failed to notify primary resident of significant event: %@ error: %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v13 = "%{public}@Successfully notified primary resident of significant event: %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __159__HMDCameraBulletinNotificationManager__handleSignificantEventWithUUID_reason_dateOfOccurrence_confidenceLevel_faceClassifications_cameraProfile_homePresence___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if (*(_QWORD *)(a1 + 80) == 2 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v16, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "faceClassificationResolver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceClassificationForSignificantEventFaceClassifications:user:", *(_QWORD *)(a1 + 32), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc(MEMORY[0x24BDD7590]);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 72), "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v9, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:", v10, v13, v11, v12, v14, v8);

  objc_msgSend(*(id *)(a1 + 48), "_handleSignificantEvent:remoteRegistration:", v15, v16);
}

void __103__HMDCameraBulletinNotificationManager__cameraAccessModeBulletinNotificationRegistrationsForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cameraAccessModeBulletinRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_80);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

id __103__HMDCameraBulletinNotificationManager__cameraAccessModeBulletinNotificationRegistrationsForAccessory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraAccessModeRegistrationFromMKFRegistration:", a2);
}

void __105__HMDCameraBulletinNotificationManager__cameraReachabilityBulletinNotificationRegistrationsForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cameraReachabilityBulletinRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_79);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

id __105__HMDCameraBulletinNotificationManager__cameraReachabilityBulletinNotificationRegistrationsForAccessory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraReachabilityRegistrationFromMKFRegistration:", a2);
}

void __116__HMDCameraBulletinNotificationManager__cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraSignificantEventBulletinRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "na_map:", &__block_literal_global_78);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

id __116__HMDCameraBulletinNotificationManager__cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraSignificantEventRegistrationFromMKFRegistration:", a2);
}

void __69__HMDCameraBulletinNotificationManager_handleRemovedCameraAccessory___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraSignificantEventRegistration fetchCameraSignificantEventRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraSignificantEventRegistration, "fetchCameraSignificantEventRegistrationForAccessoryUUID:managedObjectContext:", v2, a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "deleteObject:", v3);
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = a1[6];
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      *(_DWORD *)buf = 138543618;
      v33 = v7;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local significant event registration to match removed camera: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(a1[4], "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraAccessModeRegistration fetchCameraAccessModeRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraAccessModeRegistration, "fetchCameraAccessModeRegistrationForAccessoryUUID:managedObjectContext:", v9, a1[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1[5], "deleteObject:", v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1[6];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = a1[4];
      *(_DWORD *)buf = 138543618;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local access mode registration to match removed camera: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(a1[4], "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraReachabilityRegistration fetchCameraReachabilityRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraReachabilityRegistration, "fetchCameraReachabilityRegistrationForAccessoryUUID:managedObjectContext:", v16, a1[5]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(a1[5], "deleteObject:", v17);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1[6];
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a1[4];
      *(_DWORD *)buf = 138543618;
      v33 = v21;
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local reachability registration to match removed camera: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  v23 = a1[5];
  v31 = 0;
  objc_msgSend(v23, "save:", &v31);
  v24 = v31;
  v25 = (void *)MEMORY[0x227676638]();
  v26 = a1[6];
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = a1[4];
    HMFBooleanToString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v33 = v28;
    v34 = 2112;
    v35 = v3;
    v36 = 2112;
    v37 = v10;
    v38 = 2112;
    v39 = v17;
    v40 = 2112;
    v41 = v30;
    v42 = 2112;
    v43 = v29;
    v44 = 2112;
    v45 = v24;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Removing local registrations: %@, %@, %@ for removed camera: %@ was successful: %@ error: %@", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(a1[5], "reset");

}

uint64_t __90__HMDCameraBulletinNotificationManager_handleSignificantEvent_cameraProfile_homePresence___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSignificantEvent:cameraProfile:homePresence:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __87__HMDCameraBulletinNotificationManager_devicesToNotifyForAccessModeChangeForAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "registration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_deviceToNotifyForRegistration:source:", v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v7 = v8;
  }

}

void __89__HMDCameraBulletinNotificationManager_devicesToNotifyForCameraReachabilityForAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "registration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_deviceToNotifyForRegistration:source:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "isCurrentDevice");
    v7 = v9;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      v7 = v9;
    }
  }

}

void __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD block[5];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraSignificantEventRegistration fetchCameraSignificantEventRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraSignificantEventRegistration, "fetchCameraSignificantEventRegistrationForAccessoryUUID:managedObjectContext:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraReachabilityRegistration fetchCameraReachabilityRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraReachabilityRegistration, "fetchCameraReachabilityRegistrationForAccessoryUUID:managedObjectContext:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraAccessModeRegistration fetchCameraAccessModeRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraAccessModeRegistration, "fetchCameraAccessModeRegistrationForAccessoryUUID:managedObjectContext:", v8, *(_QWORD *)(a1 + 40));
  v9 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v9;
  if (v5 || v7 || v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v12 = v16;
    if (v5 && v7 && v9)
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v18 = v3;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v17;
      v50 = 2112;
      v51 = v19;
      v20 = "%{public}@Updating existing local registrations for camera: %@";
      v21 = v12;
      v22 = OS_LOG_TYPE_INFO;
      v23 = 22;
    }
    else
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v18 = v3;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v49 = v17;
      v50 = 2112;
      v51 = v19;
      v52 = 2112;
      v53 = v5;
      v54 = 2112;
      v55 = v7;
      v56 = 2112;
      v57 = v45;
      v20 = "%{public}@updateNotificationRegistrationWithSettings detected inconsistent registrations for camera: %@, sig"
            "nificantEvent: %@, reachability: %@, accessMode: %@";
      v21 = v12;
      v22 = OS_LOG_TYPE_FAULT;
      v23 = 52;
    }
    _os_log_impl(&dword_2218F0000, v21, v22, v20, buf, v23);

    v3 = v18;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = v3;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v14;
      v50 = 2112;
      v51 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating initial local registrations for camera: %@", buf, 0x16u);

      v3 = v13;
    }
  }
LABEL_14:

  objc_autoreleasePoolPop(v10);
  if (objc_msgSend(*(id *)(a1 + 48), "_updateLocalStoreWithCameraSignificantEventBulletinRegistration:existingMKFLocalRegistration:enabled:moc:", *(_QWORD *)(a1 + 56), v5, *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 40)))
  {
    if (*(_BYTE *)(a1 + 88))
      v24 = v2;
    else
      v24 = v3;
    objc_msgSend(v24, "addObject:", *(_QWORD *)(a1 + 56));
  }
  v25 = v45;
  if (objc_msgSend(*(id *)(a1 + 48), "_updateLocalStoreWithCameraReachabilityBulletinRegistration:existingMKFLocalRegistration:enabled:moc:", *(_QWORD *)(a1 + 64), v7, *(unsigned __int8 *)(a1 + 89), *(_QWORD *)(a1 + 40)))
  {
    if (*(_BYTE *)(a1 + 89))
      v26 = v2;
    else
      v26 = v3;
    objc_msgSend(v26, "addObject:", *(_QWORD *)(a1 + 64));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "_updateLocalStoreWithCameraAccessModeBulletinRegistration:existingMKFLocalRegistration:enabled:moc:", *(_QWORD *)(a1 + 72), v45, *(unsigned __int8 *)(a1 + 90), *(_QWORD *)(a1 + 40)))
  {
    if (*(_BYTE *)(a1 + 90))
      v27 = v2;
    else
      v27 = v3;
    objc_msgSend(v27, "addObject:", *(_QWORD *)(a1 + 72));
  }
  if (objc_msgSend(v2, "hmf_isEmpty") && objc_msgSend(v3, "hmf_isEmpty"))
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipping save and not messaging primary because notification registration update resulted in no changes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    v32 = *(_QWORD *)(a1 + 80);
    if (v32)
      (*(void (**)(uint64_t, _QWORD))(v32 + 16))(v32, 0);
  }
  else
  {
    v33 = v3;
    v34 = *(void **)(a1 + 40);
    v47 = 0;
    v35 = objc_msgSend(v34, "save:", &v47);
    v36 = v47;
    v37 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "reset"));
    v38 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v35)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v41;
        v50 = 2112;
        v51 = v2;
        v52 = 2112;
        v53 = v33;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Successfully updated local enabled registrations: %@, disabled registrations: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(*(id *)(a1 + 48), "workQueue");
      v42 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke_61;
      block[3] = &unk_24E79C240;
      block[4] = *(_QWORD *)(a1 + 48);
      dispatch_async(v42, block);

    }
    else
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v49 = v43;
        v50 = 2112;
        v51 = v2;
        v52 = 2112;
        v53 = v33;
        v54 = 2112;
        v55 = v36;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to update local enabled registrations: %@, disabled registrations: %@ due to error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v37);
    }
    v44 = *(_QWORD *)(a1 + 80);
    v3 = v33;
    if (v44)
      (*(void (**)(uint64_t, id))(v44 + 16))(v44, v36);

    v25 = v45;
  }

}

uint64_t __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestSynchronizeRegistrations");
}

void __83__HMDCameraBulletinNotificationManager_cameraUserNotificationSettingsForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraSignificantEventRegistration fetchCameraSignificantEventRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraSignificantEventRegistration, "fetchCameraSignificantEventRegistrationForAccessoryUUID:managedObjectContext:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraReachabilityRegistration fetchCameraReachabilityRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraReachabilityRegistration, "fetchCameraReachabilityRegistrationForAccessoryUUID:managedObjectContext:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraAccessModeRegistration fetchCameraAccessModeRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinCameraAccessModeRegistration, "fetchCameraAccessModeRegistrationForAccessoryUUID:managedObjectContext:", v7, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !v6 || !v8)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4 || v6 || v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v32 = v14;
        v33 = 2112;
        v34 = v15;
        v35 = 2112;
        v36 = v4;
        v37 = 2112;
        v38 = v6;
        v39 = 2112;
        v40 = v8;
        v16 = "%{public}@cameraUserNotificationSettingsForAccessory detected inconsistent registrations for camera: %@, s"
              "ignificantEvent: %@, reachability: %@, accessMode: %@";
        v17 = v13;
        v18 = OS_LOG_TYPE_FAULT;
        v19 = 52;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      v16 = "%{public}@Did not find any local registrations for camera: %@";
      v17 = v13;
      v18 = OS_LOG_TYPE_INFO;
      v19 = 22;
LABEL_13:
      _os_log_impl(&dword_2218F0000, v17, v18, v16, buf, v19);

    }
    objc_autoreleasePoolPop(v10);
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "enabled"))
    v9 = objc_msgSend(v4, "notificationModes") & 1;
  else
    v9 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
  +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraSignificantEventRegistrationFromLocalRegistration:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicate");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v6, "enabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v8, "enabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  v24 = (void *)MEMORY[0x227676638]();
  v25 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v4;
    v41[1] = v6;
    v41[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 3);
    v30 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v27;
    v33 = 2112;
    v34 = v28;
    v35 = 2112;
    v36 = v29;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Found local registrations: %@ for camera: %@", buf, 0x20u);

    v24 = v30;
  }

  objc_autoreleasePoolPop(v24);
LABEL_19:

}

uint64_t __77__HMDCameraBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceBecamePrimary");
}

void __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("HMD.CNS.A"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("HMD.CNS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v8);
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543874;
          v26 = v24;
          v27 = 2112;
          v28 = CFSTR("HMD.CNS");
          v29 = 2112;
          v30 = v3;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", (uint8_t *)&v25, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v20;
        v27 = 2112;
        v28 = CFSTR("HMD.CNS.A");
        v29 = 2112;
        v30 = v3;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(__CFString **)(a1 + 40);
      v25 = 138543874;
      v26 = v15;
      v27 = 2112;
      v28 = v3;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object type: %@, %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_129(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t v23[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE buf[24];
  void *v28;
  id v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(void **)(a1 + 48);
  v21 = v3;
  v5 = v4;
  v6 = v5;
  if (v2)
  {
    v7 = (void *)MEMORY[0x227676638](objc_msgSend(v5, "hmd_assertIsExecuting"));
    v8 = v2;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Migrating bulletin registrations: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __69__HMDCameraBulletinNotificationManager_migrateRegistrations_context___block_invoke;
    v28 = &unk_24E77D2C0;
    v29 = v8;
    v11 = v6;
    v30 = v11;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", buf);
    if (objc_msgSend(v11, "hasChanges"))
    {
      v22 = 0;
      v12 = objc_msgSend(v11, "hmd_saveWithTransactionAuthor:error:", 7, &v22);
      v13 = v22;
      v14 = (void *)MEMORY[0x227676638]();
      v15 = v8;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v23 = 138543362;
          v24 = v18;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated bulletin registrations", v23, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "home");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeCameraNotificationSettingsMigrationFileFromDisk");

      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v23 = 138543618;
          v24 = v20;
          v25 = 2112;
          v26 = v21;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate bulletin registrations: %@", v23, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v11, "rollback");
      }

    }
  }

}

void __69__HMDCameraBulletinNotificationManager_migrateRegistrations_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  MKFLocalBulletinCameraAccessModeRegistration *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  MKFLocalBulletinCameraReachabilityRegistration *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  MKFLocalBulletinCameraSignificantEventRegistration *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  id v92;
  _BYTE buf[24];
  void *v94;
  void *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint8_t v99[4];
  void *v100;
  __int16 v101;
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v73 = a2;
  v69 = a3;
  v6 = v4;
  if (v5)
  {
    v72 = v6;
    objc_msgSend(v6, "hmd_assertIsExecuting");
    +[MKFLocalBulletinAccessoryRegistration fetchRequest](MKFLocalBulletinAccessoryRegistration, "fetchRequest");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("accessoryModelID"), v73);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setPredicate:", v7);

    v92 = 0;
    objc_msgSend(v72, "executeFetchRequest:error:", v70, &v92);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v92;
    v8 = v71;
    if (!v71)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v5;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v68;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch existing registrations: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v8 = 0;
    }
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__53677;
    v90 = __Block_byref_object_dispose__53678;
    v91 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__53677;
    v84 = __Block_byref_object_dispose__53678;
    v85 = 0;
    v74 = 0;
    v75 = &v74;
    v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__53677;
    v78 = __Block_byref_object_dispose__53678;
    v79 = 0;
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __89__HMDCameraBulletinNotificationManager_ensureRegistrationsForAccessory_settings_context___block_invoke;
    v94 = &unk_24E77D2E8;
    v97 = &v80;
    v98 = &v74;
    v95 = v5;
    v96 = &v86;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
    v13 = (id)v87[5];
    v14 = v73;
    v15 = v69;
    v16 = v72;
    v17 = objc_msgSend(v16, "hmd_assertIsExecuting");
    if (v13)
    {
      v18 = (void *)MEMORY[0x227676638](v17);
      v19 = v5;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543618;
        v100 = v21;
        v101 = 2112;
        v102 = v13;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Already have a camera access mode registration: %@", v99, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    else
    {
      v22 = -[MKFLocalBulletinCameraAccessModeRegistration initWithContext:]([MKFLocalBulletinCameraAccessModeRegistration alloc], "initWithContext:", v16);
      -[MKFLocalBulletinCameraAccessModeRegistration setAccessoryModelID:](v22, "setAccessoryModelID:", v14);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFLocalBulletinCameraAccessModeRegistration setConditions:](v22, "setConditions:", v23);

      if (isTVOSDevice())
        v24 = 0;
      else
        v24 = objc_msgSend(v15, "isAccessModeChangeNotificationEnabled");
      v25 = (void *)MEMORY[0x227676638](-[MKFLocalBulletinCameraAccessModeRegistration setEnabled:](v22, "setEnabled:", v24));
      v26 = v5;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543618;
        v100 = v28;
        v101 = 2112;
        v102 = v22;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Created new camera access mode registration: %@", v99, 0x16u);

      }
      objc_autoreleasePoolPop(v25);

    }
    v29 = (id)v81[5];
    v30 = v14;
    v31 = v15;
    v32 = v16;
    v33 = objc_msgSend(v32, "hmd_assertIsExecuting");
    if (v29)
    {
      v34 = (void *)MEMORY[0x227676638](v33);
      v35 = v5;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543618;
        v100 = v37;
        v101 = 2112;
        v102 = v29;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Already have a camera reachability registration: %@", v99, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
    }
    else
    {
      v38 = -[MKFLocalBulletinCameraReachabilityRegistration initWithContext:]([MKFLocalBulletinCameraReachabilityRegistration alloc], "initWithContext:", v32);
      -[MKFLocalBulletinCameraReachabilityRegistration setAccessoryModelID:](v38, "setAccessoryModelID:", v30);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFLocalBulletinCameraReachabilityRegistration setConditions:](v38, "setConditions:", v39);

      if (isTVOSDevice())
        v40 = 0;
      else
        v40 = objc_msgSend(v31, "isReachabilityEventNotificationEnabled");
      v41 = (void *)MEMORY[0x227676638](-[MKFLocalBulletinCameraReachabilityRegistration setEnabled:](v38, "setEnabled:", v40));
      v42 = v5;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543618;
        v100 = v44;
        v101 = 2112;
        v102 = v38;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Created new camera reachability registration: %@", v99, 0x16u);

      }
      objc_autoreleasePoolPop(v41);

    }
    v45 = (id)v75[5];
    v46 = v30;
    v47 = v31;
    v48 = v32;
    v49 = objc_msgSend(v48, "hmd_assertIsExecuting");
    if (v45)
    {
      v50 = (void *)MEMORY[0x227676638](v49);
      v51 = v5;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543618;
        v100 = v53;
        v101 = 2112;
        v102 = v45;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Already have a camera significant event registration: %@", v99, 0x16u);

      }
      objc_autoreleasePoolPop(v50);
    }
    else
    {
      v54 = -[MKFLocalBulletinCameraSignificantEventRegistration initWithContext:]([MKFLocalBulletinCameraSignificantEventRegistration alloc], "initWithContext:", v48);
      -[MKFLocalBulletinCameraSignificantEventRegistration setAccessoryModelID:](v54, "setAccessoryModelID:", v46);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFLocalBulletinCameraSignificantEventRegistration setConditions:](v54, "setConditions:", v55);

      -[MKFLocalBulletinCameraSignificantEventRegistration setNotificationModes:](v54, "setNotificationModes:", 0);
      -[MKFLocalBulletinCameraSignificantEventRegistration setSignificantEventTypes:](v54, "setSignificantEventTypes:", 0);
      -[MKFLocalBulletinCameraSignificantEventRegistration setPersonFamiliarityOptions:](v54, "setPersonFamiliarityOptions:", 0);
      if (isHomePod())
        v56 = 0;
      else
        v56 = objc_msgSend(v47, "isSmartBulletinBoardNotificationEnabled");
      -[MKFLocalBulletinCameraSignificantEventRegistration setEnabled:](v54, "setEnabled:", v56);
      if (objc_msgSend(v47, "isSmartBulletinBoardNotificationEnabled"))
      {
        -[MKFLocalBulletinCameraSignificantEventRegistration setNotificationModes:](v54, "setNotificationModes:", 1);
        objc_msgSend(v47, "smartBulletinBoardNotificationCondition");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD78D8], "bitwiseAndValueWithKeyPath:inPredicate:validValues:", *MEMORY[0x24BDD55D0], v57, 31);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v67, "integerValue");
        objc_msgSend(MEMORY[0x24BDD78D8], "bitwiseAndValueWithKeyPath:inPredicate:validValues:", *MEMORY[0x24BDD55D8], v57, 7);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "integerValue");
        -[MKFLocalBulletinCameraSignificantEventRegistration setSignificantEventTypes:](v54, "setSignificantEventTypes:", v58);
        -[MKFLocalBulletinCameraSignificantEventRegistration setPersonFamiliarityOptions:](v54, "setPersonFamiliarityOptions:", v60);
        objc_msgSend(v5, "conditionsFromPredicate:", v57);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v54, v48, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFLocalBulletinCameraSignificantEventRegistration setConditions:](v54, "setConditions:", v62);

      }
      v63 = (void *)MEMORY[0x227676638]();
      v64 = v5;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138543618;
        v100 = v66;
        v101 = 2112;
        v102 = v54;
        _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_INFO, "%{public}@Created new camera significant event registration: %@", v99, 0x16u);

      }
      objc_autoreleasePoolPop(v63);

    }
    _Block_object_dispose(&v74, 8);

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v86, 8);

    v6 = v72;
  }

}

void __89__HMDCameraBulletinNotificationManager_ensureRegistrationsForAccessory_settings_context___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraAccessModeRegistration entity](MKFLocalBulletinCameraAccessModeRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isKindOfEntity:", v6);

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), a2);
    goto LABEL_8;
  }
  objc_msgSend(v4, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraReachabilityRegistration entity](MKFLocalBulletinCameraReachabilityRegistration, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isKindOfEntity:", v10);

  if (v11)
  {
    v8 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  objc_msgSend(v4, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCameraSignificantEventRegistration entity](MKFLocalBulletinCameraSignificantEventRegistration, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isKindOfEntity:", v13);

  if (v14)
  {
    v8 = *(_QWORD *)(a1 + 56);
    goto LABEL_7;
  }
  objc_msgSend(v4, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCharacteristicRegistration entity](MKFLocalBulletinCharacteristicRegistration, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isKindOfEntity:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v4, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFLocalBulletinServiceRegistration entity](MKFLocalBulletinServiceRegistration, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isKindOfEntity:", v19);

    if ((v20 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v24;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown type of local registration, ignoring: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }
  }
LABEL_8:

}

void __85__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_36_53806);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __85__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraAccessModeRegistrationFromLocalRegistration:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_2;
  v10[3] = &unk_24E794F18;
  v11 = v2;
  v5 = v2;
  objc_msgSend(v4, "na_each:", v10);

  objc_msgSend(v5, "na_map:", &__block_literal_global_34_53809);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "bulletinRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_3;
  v4[3] = &unk_24E78CED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

id __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraAccessModeRegistrationFromMKFRegistration:", a2);
}

void __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "castIfCameraAccessModeBulletinRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __87__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_32_53811);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __87__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraReachabilityRegistrationFromLocalRegistration:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_2;
  v10[3] = &unk_24E794F18;
  v11 = v2;
  v5 = v2;
  objc_msgSend(v4, "na_each:", v10);

  objc_msgSend(v5, "na_map:", &__block_literal_global_30_53813);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "bulletinRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_3;
  v4[3] = &unk_24E78CED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

id __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraReachabilityRegistrationFromMKFRegistration:", a2);
}

void __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "castIfCameraReachabilityBulletinRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __91__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_28_53814);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __91__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraSignificantEventRegistrationFromLocalRegistration:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_2;
  v10[3] = &unk_24E794F18;
  v11 = v2;
  v5 = v2;
  objc_msgSend(v4, "na_each:", v10);

  objc_msgSend(v5, "na_map:", &__block_literal_global_24_53816);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "bulletinRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_3;
  v4[3] = &unk_24E78CED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

id __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "cameraSignificantEventRegistrationFromMKFRegistration:", a2);
}

void __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "castIfCameraSignificantEventBulletinRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

id __173__HMDCameraBulletinNotificationManager_initWithHome_workQueue_messageDispatcher_accountManager_faceClassificationResolver_doorbellPressTracker_evaluator_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)_cameraSignificantEventRegistrationsForSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFCameraSignificantEventBulletinRegistration fetchRequest](_MKFCameraSignificantEventBulletinRegistration, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v6, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "idsDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K == %@)"), CFSTR("user.modelID"), v10, CFSTR("deviceIdsIdentifier"), v12, CFSTR("deviceIdsDestination"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v15);

  v24 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch camera significant event bulletin registrations for source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = (id)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

+ (id)_cameraAccessModeRegistrationsForSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFCameraAccessModeBulletinRegistration fetchRequest](_MKFCameraAccessModeBulletinRegistration, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v6, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "idsDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K == %@)"), CFSTR("user.modelID"), v10, CFSTR("deviceIdsIdentifier"), v12, CFSTR("deviceIdsDestination"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v15);

  v24 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch camera access mode bulletin registrations for source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = (id)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

+ (id)_cameraReachabilityRegistrationsForSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFCameraReachabilityBulletinRegistration fetchRequest](_MKFCameraReachabilityBulletinRegistration, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v6, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "idsDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K == %@)"), CFSTR("user.modelID"), v10, CFSTR("deviceIdsIdentifier"), v12, CFSTR("deviceIdsDestination"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v15);

  v24 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch camera reachability bulletin registrations for source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = (id)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t97 != -1)
    dispatch_once(&logCategory__hmf_once_t97, &__block_literal_global_139_53827);
  return (id)logCategory__hmf_once_v98;
}

void __51__HMDCameraBulletinNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v98;
  logCategory__hmf_once_v98 = v0;

}

@end
