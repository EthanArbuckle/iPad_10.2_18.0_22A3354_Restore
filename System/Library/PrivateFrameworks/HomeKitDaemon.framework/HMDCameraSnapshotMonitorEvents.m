@implementation HMDCameraSnapshotMonitorEvents

- (HMDCameraSnapshotMonitorEvents)initWithSnapshotManager:(id)a3 accessory:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDCameraSnapshotMonitorEvents *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMDCameraProfile bulletinBoard](HMDCameraProfile, "bulletinBoard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDCameraSnapshotMonitorEvents initWithSnapshotManager:accessory:workQueue:msgDispatcher:bulletinBoard:notificationCenter:](self, "initWithSnapshotManager:accessory:workQueue:msgDispatcher:bulletinBoard:notificationCenter:", v13, v12, v11, v10, v14, v15);

  return v16;
}

- (HMDCameraSnapshotMonitorEvents)initWithSnapshotManager:(id)a3 accessory:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6 bulletinBoard:(id)a7 notificationCenter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDCameraSnapshotMonitorEvents *v19;
  HMDCameraSnapshotMonitorEvents *v20;
  uint64_t v21;
  NSMutableSet *snapShotNotificationResponseTimers;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSUUID *uniqueIdentifier;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *logIdentifier;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *bulletinImagesDirectory;
  uint64_t v38;
  NSSet *bulletinSnapshotCharacteristics;
  HMDNotificationRegistration *v40;
  HMDNotificationRegistration *notificationRegistration;
  void *v42;
  void *v43;
  void *v44;
  HMDCharacteristicsAvailabilityListener *v45;
  HMDCharacteristicsAvailabilityListener *characteristicsAvailabilityListener;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSString *clientIdentifier;
  id v53;
  objc_super v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v53 = a8;
  v54.receiver = self;
  v54.super_class = (Class)HMDCameraSnapshotMonitorEvents;
  v19 = -[HMDCameraSnapshotMonitorEvents init](&v54, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_snapshotManager, v14);
    objc_storeWeak((id *)&v20->_accessory, v15);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    objc_storeStrong((id *)&v20->_msgDispatcher, a6);
    objc_storeStrong((id *)&v20->_notificationCenter, a8);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    snapShotNotificationResponseTimers = v20->_snapShotNotificationResponseTimers;
    v20->_snapShotNotificationResponseTimers = (NSMutableSet *)v21;

    v23 = (void *)MEMORY[0x24BDD1880];
    objc_msgSend(v14, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = CFSTR("HMDCameraSnapshotMonitorEvents");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v24, 0, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = (NSUUID *)v26;

    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v20->_uniqueIdentifier, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@"), v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = (NSString *)v31;

    if (v18)
    {
      objc_storeStrong((id *)&v20->_bulletinBoard, a7);
      getBulletinImagesPath();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "UUIDString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByAppendingPathComponent:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      bulletinImagesDirectory = v20->_bulletinImagesDirectory;
      v20->_bulletinImagesDirectory = (NSString *)v36;

      createDirectory(v20->_bulletinImagesDirectory);
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v38 = objc_claimAutoreleasedReturnValue();
    bulletinSnapshotCharacteristics = v20->_bulletinSnapshotCharacteristics;
    v20->_bulletinSnapshotCharacteristics = (NSSet *)v38;

    v40 = -[HMDNotificationRegistration initWithRegisterer:]([HMDNotificationRegistration alloc], "initWithRegisterer:", v20);
    notificationRegistration = v20->_notificationRegistration;
    v20->_notificationRegistration = v40;

    v55[0] = *MEMORY[0x24BDD6C18];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDD5918]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v42;
    v55[1] = *MEMORY[0x24BDD6BA0];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDD58F0]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = -[HMDCharacteristicsAvailabilityListener initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:]([HMDCharacteristicsAvailabilityListener alloc], "initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:", v15, v16, v44);
    characteristicsAvailabilityListener = v20->_characteristicsAvailabilityListener;
    v20->_characteristicsAvailabilityListener = v45;

    v47 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "UUIDString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.HomeKitDaemon.serviceGroupAssociation"), v49);
    v50 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v50;

  }
  return v20;
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  void *v9;
  HMDCameraSnapshotMonitorEvents *v10;
  NSObject *v11;
  void *v12;
  id Property;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraSnapshotMonitorEvents accessory]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotMonitorEvents characteristicsAvailabilityListener](self, "characteristicsAvailabilityListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDCameraSnapshotMonitorEvents characteristicsAvailabilityListener](self, "characteristicsAvailabilityListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

  if (self && objc_getProperty(self, v6, 64, 1))
  {
    objc_msgSend(objc_getProperty(self, v7, 56, 1), "addObserver:selector:name:object:", self, sel_handleCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v3);
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
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@No bulletin board, not subscribing for notifications for doorbell or motion sensor", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (!self)
    {
      Property = 0;
      goto LABEL_8;
    }
  }
  Property = objc_getProperty(self, v8, 72, 1);
LABEL_8:
  objc_msgSend(Property, "addObserver:name:object:", sel_handleCameraSettingsDidUpdateNotification_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v3);

}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotMonitorEvents *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  SEL v8;
  id Property;
  id WeakRetained;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  HMDCameraSnapshotMonitorEvents *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if (v4)
  {
    objc_msgSend(objc_getProperty(v4, v7, 16, 1), "deregisterReceiver:", v4);
    Property = objc_getProperty(v4, v8, 56, 1);
  }
  else
  {
    objc_msgSend(0, "deregisterReceiver:", 0);
    Property = 0;
  }
  objc_msgSend(Property, "removeObserver:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&v4->_accessory);
  -[NSSet allObjects](v4->_bulletinSnapshotCharacteristics, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v11, v4->_clientIdentifier);

  v12.receiver = v4;
  v12.super_class = (Class)HMDCameraSnapshotMonitorEvents;
  -[HMDCameraSnapshotMonitorEvents dealloc](&v12, sel_dealloc);
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  void *v10;
  HMDCameraSnapshotMonitorEvents *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 8, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Available characteristics changed", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDCameraSnapshotMonitorEvents currentCameraSettings]((uint64_t)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotMonitorEvents _enableNotificationsForCharacteristics:cameraSettings:](v11, v8, v14);

}

- (void)handleBulletinBoardNotificationDidUpdateNotification:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 8, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__HMDCameraSnapshotMonitorEvents_handleBulletinBoardNotificationDidUpdateNotification___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 8, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraSnapshotMonitorEvents_handleCharacteristicsChangedNotification___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)handleCameraSettingsDidUpdateNotification:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDCameraSnapshotMonitorEvents *v10;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 8, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__HMDCameraSnapshotMonitorEvents_handleCameraSettingsDidUpdateNotification___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDCameraSnapshotMonitorEvents *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  HMDCameraSnapshotMonitorEvents *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 8, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (self)
      v16 = objc_getProperty(v11, v15, 32, 1);
    else
      v16 = 0;
    if (objc_msgSend(v16, "containsObject:", v9))
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v11;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sessionID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v20;
        v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Posting notification as timer has expired for snapshot session %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_initWeak((id *)buf, v18);
      if (self)
        v23 = objc_getProperty(v18, v22, 64, 1);
      else
        v23 = 0;
      v24 = v23;
      objc_msgSend(v9, "changedCharacteristics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __47__HMDCameraSnapshotMonitorEvents_timerDidFire___block_invoke;
      v27[3] = &unk_24E79AE08;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v9;
      objc_msgSend(v24, "insertImageBulletinsForChangedCharacteristics:snapshotData:completion:", v26, 0, v27);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDCameraSnapshotMonitorEvents *)objc_getProperty(self, a2, 8, 1);
  return (OS_dispatch_queue *)self;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (NSSet)bulletinSnapshotCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBulletinSnapshotCharacteristics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCharacteristicsAvailabilityListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_bulletinSnapshotCharacteristics, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_bulletinImagesDirectory, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_snapShotNotificationResponseTimers, 0);
  objc_destroyWeak((id *)&self->_snapshotManager);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __47__HMDCameraSnapshotMonitorEvents_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id self;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  self = objc_loadWeakRetained(v3);
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v8 = v5;
  if (self)
  {
    Property = objc_getProperty(self, v7, 8, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__HMDCameraSnapshotMonitorEvents__processPostedBulletin_responseTimer___block_invoke;
    block[3] = &unk_24E79BBD0;
    v12 = v6;
    v13 = self;
    v14 = v8;
    dispatch_async(Property, block);

  }
}

void __71__HMDCameraSnapshotMonitorEvents__processPostedBulletin_responseTimer___block_invoke(id *a1)
{
  const char *v2;
  id Property;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1[4], "count"))
  {
    Property = a1[5];
    if (Property)
      Property = objc_getProperty(Property, v2, 32, 1);
    v4 = objc_msgSend(Property, "containsObject:", a1[6]);
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1[5];
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if ((v4 & 1) != 0)
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "sessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating the posted bulletin for %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(a1[6], "setPostedBulletins:", a1[4]);
    }
    else
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "sessionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Timer has been already removed for %@, removing the posted bulletin", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      v19 = a1[4];
      v18 = a1[5];
      objc_msgSend(a1[6], "sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotMonitorEvents _removeBulletins:sessionID:](v18, v19, v20);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1[5];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@No bulletins were posted for snapshot %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
}

- (void)_removeBulletins:(void *)a3 sessionID:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  SEL v15;
  id v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v17 = a3;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x227676638]();
          v12 = a1;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v24 = v14;
            v25 = 2112;
            v26 = v10;
            v27 = 2112;
            v28 = v17;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@A bulletin with recordID %@ has already been posted for snapshot session %@, removing it", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v11);
          objc_msgSend(objc_getProperty(v12, v15, 64, 1), "removeBulletinWithRecordID:", v10);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v7);
    }

    v5 = v16;
  }

}

void __76__HMDCameraSnapshotMonitorEvents_handleCameraSettingsDidUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDCameraProfileSettingsNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "characteristicsAvailabilityListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableCharacteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera user settings changed.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraSnapshotMonitorEvents _enableNotificationsForCharacteristics:cameraSettings:](*(void **)(a1 + 40), v7, v5);

  }
}

- (void)_enableNotificationsForCharacteristics:(void *)a3 cameraSettings:
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  void *v9;
  int *v10;
  SEL v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 8, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
    objc_msgSend(objc_getProperty(a1, v11, 56, 1), "removeObserver:name:object:", a1, CFSTR("HMDBulletinBoardNotificationDidUpdateNotification"), 0);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v5;
    v12 = v5;
    v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v34;
      v29 = v9;
      v30 = v12;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(v12);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v14, "service");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "bulletinBoardNotification");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(objc_getProperty(a1, v17, v10[142], 1), "addObserver:selector:name:object:", a1, sel_handleBulletinBoardNotificationDidUpdateNotification_, CFSTR("HMDBulletinBoardNotificationDidUpdateNotification"), v16);
          if (objc_msgSend(v16, "isEnabled")
            && -[HMDCameraSnapshotMonitorEvents _canEnableNotificationForCharacteristic:cameraSettings:](a1, v14, v7))
          {
            v18 = (void *)MEMORY[0x227676638]();
            v19 = a1;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = v7;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v22;
              v39 = 2112;
              v40 = v14;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin snapshot characteristic: %@", buf, 0x16u);

              v7 = v21;
              v9 = v29;
            }

            objc_autoreleasePoolPop(v18);
            objc_msgSend(v9, "addObject:", v14);
            v10 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
            v12 = v30;
          }

        }
        v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v32);
    }

    objc_msgSend(a1, "bulletinSnapshotCharacteristics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    if (v24 == objc_msgSend(v9, "count"))
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)a1, v9);
      v5 = v28;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(a1, "bulletinSnapshotCharacteristics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v26 = objc_msgSend(v9, "count");

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)a1, v9);
      v5 = v28;
      if (v26)
        goto LABEL_21;
    }
    else
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)a1, v9);
      v5 = v28;
    }
    -[HMDCameraSnapshotMonitorEvents _updateHomedRelaunchRegistration](a1, v27);
    goto LABEL_21;
  }
LABEL_22:

}

- (uint64_t)_canEnableNotificationForCharacteristic:(void *)a3 cameraSettings:
{
  id v5;
  id v6;
  SEL v7;
  NSObject *Property;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id WeakRetained;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  id *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  id *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 138543618;
    v56 = v12;
    v57 = 2112;
    v58 = v5;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Checking if bulletin notification can be enabled for characteristic: %@", (uint8_t *)&v55, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = v5;
  objc_opt_self();
  objc_msgSend(v13, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD58F0]) & 1) != 0)
  {
    objc_msgSend(v13, "service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD6BA0]);

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v10;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 138543362;
        v56 = v21;
        v22 = "%{public}@Allowing notifications to be enabled for doorbell characteristic";
        v23 = v20;
        v24 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        _os_log_impl(&dword_2218F0000, v23, v24, v22, (uint8_t *)&v55, 0xCu);

        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  else
  {

  }
  v25 = v13;
  objc_opt_self();
  objc_msgSend(v25, "type");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDD5918]) & 1) == 0)
  {

    goto LABEL_21;
  }
  objc_msgSend(v25, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "type");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BDD6C18]);

  if ((v29 & 1) == 0)
  {
LABEL_21:
    v44 = (void *)MEMORY[0x227676638]();
    v45 = v10;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138543362;
      v56 = v47;
      _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Disallowing notifications to be enabled for non-doorbell, non-motion characteristic", (uint8_t *)&v55, 0xCu);

    }
    goto LABEL_24;
  }
  if (v10)
    WeakRetained = objc_loadWeakRetained(v10 + 5);
  else
    WeakRetained = 0;
  v31 = objc_msgSend(WeakRetained, "isCameraRecordingFeatureSupported");

  if ((v31 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v10;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138543362;
      v56 = v21;
      v22 = "%{public}@Allowing notifications to be enabled because recording is not supported for this camera";
      v23 = v20;
      v24 = OS_LOG_TYPE_INFO;
      goto LABEL_27;
    }
LABEL_28:

    objc_autoreleasePoolPop(v18);
    v48 = 1;
    goto LABEL_29;
  }
  objc_msgSend(v6, "currentAccessMode");
  if ((HMIsMotionDetectionAllowedForCameraAccessMode() & 1) == 0)
  {
    v44 = (void *)MEMORY[0x227676638]();
    v45 = v10;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      HMCameraAccessModeAsString();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138543618;
      v56 = v51;
      v57 = 2112;
      v58 = v52;
      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Disallowing notifications to be enabled because the camera's current access mode disallows motion detection: %@", (uint8_t *)&v55, 0x16u);

    }
LABEL_24:

    objc_autoreleasePoolPop(v44);
    v48 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v6, "notificationSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x24BDD7530];
  objc_msgSend(v32, "smartBulletinBoardNotificationCondition");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "significantEventTypesInPredicate:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "integerValue");

  v37 = objc_msgSend(v32, "isSmartBulletinBoardNotificationEnabled");
  if (v36)
    v38 = v37;
  else
    v38 = 0;
  v39 = (void *)MEMORY[0x227676638](v37);
  v40 = v10;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
  if (v38 == 1)
  {
    if (v42)
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138543618;
      v56 = v43;
      v57 = 2112;
      v58 = v32;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Disallowing notifications to be enabled because smart notifications are enabled: %@", (uint8_t *)&v55, 0x16u);

    }
  }
  else if (v42)
  {
    HMFGetLogIdentifier();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    HMCameraAccessModeAsString();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 138543874;
    v56 = v53;
    v57 = 2112;
    v58 = v54;
    v59 = 2112;
    v60 = v32;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Allowing notifications to be enabled for current access mode: %@, notification settings: %@", (uint8_t *)&v55, 0x20u);

  }
  objc_autoreleasePoolPop(v39);
  v48 = v38 ^ 1u;

LABEL_29:
  return v48;
}

- (void)_handleUpdatedBulletinSnapshotCharacteristics:(id *)a1
{
  id v3;
  SEL v4;
  NSObject *Property;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  id obj;
  id *v55;
  void *v56;
  _QWORD v57[6];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[6];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Property = objc_getProperty(a1, v4, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (a1)
    WeakRetained = objc_loadWeakRetained(a1 + 5);
  else
    WeakRetained = 0;
  v51 = WeakRetained;
  objc_msgSend(WeakRetained, "home");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristicsAvailabilityListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableCharacteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v8;
  v52 = v3;
  objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v3);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  v55 = a1;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v64;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v64 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v56, "accessoryBulletinNotificationManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x227676638]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v14)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v44;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          v45 = obj;

          v46 = v51;
          v47 = v52;
          v48 = v50;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v19;
          v70 = 2112;
          v71 = v13;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Unregistering for notifications for characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke;
        v62[3] = &unk_24E79BCC8;
        v62[4] = v16;
        v62[5] = v13;
        objc_msgSend(v14, "updateRegistrationsWithEnabledCharacteristics:disabledCharacteristics:conditions:completion:", v20, v21, v22, v62);

        a1 = v55;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      if (v10)
        continue;
      break;
    }
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v23 = v52;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v24)
  {
    v25 = v24;
    v53 = *(_QWORD *)v59;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        objc_msgSend(v56, "accessoryBulletinNotificationManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x227676638]();
        v30 = a1;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (!v28)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v49;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v29);

          goto LABEL_32;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v33;
          v70 = 2112;
          v71 = v27;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Registering for notifications for characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v27, "service");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "bulletinBoardNotification");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "condition");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "conditionsFromPredicate:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke_29;
        v57[3] = &unk_24E79BCC8;
        v57[4] = v30;
        v57[5] = v27;
        objc_msgSend(v28, "updateRegistrationsWithEnabledCharacteristics:disabledCharacteristics:conditions:completion:", v38, v39, v37, v57);

        a1 = v55;
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v25)
        continue;
      break;
    }
  }

  v40 = (void *)MEMORY[0x227676638]();
  v41 = a1;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v69 = v43;
    v70 = 2112;
    v71 = v23;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Setting the bulletin snapshot characteristics to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v40);
  objc_msgSend(v41, "setBulletinSnapshotCharacteristics:", v23);
LABEL_32:
  v48 = v50;
  v46 = v51;
  v45 = obj;
  v47 = v52;
LABEL_33:

}

- (void)_updateHomedRelaunchRegistration
{
  NSObject *Property;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  Property = objc_getProperty(a1, a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  objc_msgSend(a1, "bulletinSnapshotCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering homed for relaunch", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    +[HMDLaunchHandler sharedHandler](HMDLaunchHandler, "sharedHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerRelaunchClientWithUUID:", v12);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Deregistering homed for relaunch", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    +[HMDLaunchHandler sharedHandler](HMDLaunchHandler, "sharedHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deregisterRelaunchClientWithUUID:", v12);
  }

}

- (id)accessory
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
  return WeakRetained;
}

void __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Error unregistering for notifications from characteristic %@ : %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Unregistered for notifications from characteristic %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Error registering for notifications from characteristic %@ : %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Registered for notifications from characteristic %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __75__HMDCameraSnapshotMonitorEvents_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  HMDHomePresenceRemote *v23;
  HMDHomePresenceRemote *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = *(id **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v31 = v2;
  if (v1)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kModifiedCharacteristicsMapKey"));
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hmf_arrayForKey:", CFSTR("kCharacteristicsToShowBulletinsKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v4;
    v30 = (void *)v3;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(v31, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      v12 = *MEMORY[0x24BDD5918];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v1, "bulletinSnapshotCharacteristics");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v14);

          if (v16)
          {
            objc_msgSend(v14, "type");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v12);

            if (!v18
              || (objc_msgSend(v14, "value"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  v20 = objc_msgSend(v19, "BOOLValue"),
                  v19,
                  v20))
            {
              objc_msgSend(v7, "addObject:", v14);
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v10);
    }

    if (!objc_msgSend(v7, "count"))
      goto LABEL_26;
    if (v29)
    {
      objc_msgSend(v7, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotMonitorEvents _characteristicsUpdated:modifiedCharacteristics:](v1, v21, v30);
LABEL_25:

LABEL_26:
      v2 = v31;
      goto LABEL_27;
    }
    objc_msgSend(v31, "hmf_dictionaryForKey:", CFSTR("kPresenceDictionaryForNotificationKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hmf_dictionaryForKey:", CFSTR("kPresencePairingIdentifierDictionaryForNotificationKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v22;
    if (v22)
    {
      v23 = -[HMDHomePresenceRemote initWithPresenceByPairingIdentity:]([HMDHomePresenceRemote alloc], "initWithPresenceByPairingIdentity:", v22, v22);
    }
    else
    {
      if (!v21)
      {
        v24 = 0;
        goto LABEL_24;
      }
      v23 = -[HMDHomePresenceRemote initWithPresenceByUserId:]([HMDHomePresenceRemote alloc], "initWithPresenceByUserId:", v21, 0);
    }
    v24 = v23;
LABEL_24:
    WeakRetained = objc_loadWeakRetained(v1 + 5);
    objc_msgSend(WeakRetained, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __71__HMDCameraSnapshotMonitorEvents__handleCharacteristicsChangedPayload___block_invoke;
    v32[3] = &unk_24E793E28;
    v32[4] = v1;
    v33 = v30;
    objc_msgSend(v26, "evaluateNotificationConditionForCharacteristics:homePresence:completion:", v27, v24, v32);

    goto LABEL_25;
  }
LABEL_27:

}

- (void)_characteristicsUpdated:(void *)a3 modifiedCharacteristics:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  HMDCameraSnapshotNotificationTimer *v22;
  SEL v23;
  SEL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  HMDCameraSnapshotNotificationTimer *v35;
  void *v36;
  void *v37;
  id *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id WeakRetained;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  HMDCameraSnapshotNotificationTimer *v49;
  id v50;
  id location;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v45 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v44;
    if (objc_msgSend(v44, "count"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v7 = v44;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v53;
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v11, "remoteDevice");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
              break;
          }

          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            if (v8)
              goto LABEL_5;
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        v11 = 0;
      }

      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v18;
        v58 = 2112;
        v59 = v7;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Taking a snapshot as the update characteristic %@ is being monitored", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      WeakRetained = objc_loadWeakRetained(v16 + 3);
      v19 = objc_loadWeakRetained(v16 + 5);
      if (objc_msgSend(v19, "isReachable"))
        v20 = 7.0;
      else
        v20 = 15.0;

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = -[HMDCameraSnapshotNotificationTimer initWithCameraSessionID:changedCharacteristics:timeInterval:]([HMDCameraSnapshotNotificationTimer alloc], "initWithCameraSessionID:changedCharacteristics:timeInterval:", v43, v7, v20);
      -[HMFTimer setDelegate:](v22, "setDelegate:", v16);
      -[HMFTimer setDelegateQueue:](v22, "setDelegateQueue:", objc_getProperty(v16, v23, 8, 1));
      objc_msgSend(objc_getProperty(v16, v24, 32, 1), "addObject:", v22);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v43, CFSTR("kCameraSessionID"));
      if (v11)
      {
        objc_msgSend(v11, "updateIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("kCameraProactiveSessionID"));

        objc_msgSend(v11, "remoteDevice");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("kIDSMessageSourceIDKey"));

      }
      v28 = (void *)MEMORY[0x227676638](objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD5608]));
      v29 = v16;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v31;
        v58 = 2112;
        v59 = v25;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Notification payload is: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_initWeak(&location, v29);
      v32 = (void *)MEMORY[0x24BE3F1B0];
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __82__HMDCameraSnapshotMonitorEvents__characteristicsUpdated_modifiedCharacteristics___block_invoke;
      v46[3] = &unk_24E793318;
      objc_copyWeak(&v50, &location);
      v33 = *MEMORY[0x24BDD5620];
      v34 = v25;
      v47 = v34;
      v48 = v7;
      v35 = v22;
      v49 = v35;
      objc_msgSend(v32, "messageWithName:messagePayload:responseHandler:", v33, v34, v46);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x227676638](objc_msgSend(WeakRetained, "takeSnapshot:", v36));
      v38 = v29;
      HMFGetOSLogHandle();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSnapshotNotificationTimer sessionID](v35, "sessionID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v40;
        v58 = 2112;
        v59 = v41;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Starting the notification timer for identifier %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      -[HMFTimer resume](v35, "resume");

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);

      v6 = v44;
    }

  }
}

void __71__HMDCameraSnapshotMonitorEvents__handleCharacteristicsChangedPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  -[HMDCameraSnapshotMonitorEvents _characteristicsUpdated:modifiedCharacteristics:](*(void **)(a1 + 32), a3, *(void **)(a1 + 40));
}

void __82__HMDCameraSnapshotMonitorEvents__characteristicsUpdated_modifiedCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  NSObject *v18;
  void *v19;
  void *WeakRetained;
  void *v21;
  uint64_t v22;
  SEL v23;
  id Property;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id *v52;
  NSObject *v53;
  id v54;
  void *v55;
  SEL v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id *self;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  self = (id *)objc_loadWeakRetained(v5);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kCameraSessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = v10;
  v14 = v6;
  v15 = v9;
  if (self)
  {
    if (v11)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v19;
        v69 = 2112;
        v70 = v12;
        v71 = 2112;
        v72 = v11;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to take a snapshot for session ID %@ with error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v15, "postedBulletins");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotMonitorEvents _insertUpdateOrRemoveBulletins:forChangedCharacteristics:snapshotData:](v17, WeakRetained, v21, 0);
    }
    else
    {
      v64 = v15;
      WeakRetained = objc_loadWeakRetained(self + 3);
      v58 = v14;
      v62 = *MEMORY[0x24BDD7E28];
      objc_msgSend(v14, "objectForKeyedSubscript:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = objc_claimAutoreleasedReturnValue();
      Property = objc_getProperty(self, v23, 48, 1);
      v25 = (void *)MEMORY[0x24BDD17C8];
      v26 = Property;
      v61 = (void *)v22;
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@_%@.%@"), v22, v12, CFSTR("jpg"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingPathComponent:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      LOBYTE(v26) = objc_msgSend(v29, "linkItemAtPath:toPath:error:", v21, v28, &v66);
      v30 = v66;

      v57 = v30;
      if ((v26 & 1) != 0)
      {
        v31 = (void *)v28;
      }
      else
      {
        v32 = (void *)v28;
        v59 = v13;
        v33 = v12;
        v34 = (void *)MEMORY[0x227676638]();
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v68 = v37;
          v69 = 2112;
          v70 = v32;
          v71 = 2112;
          v72 = v21;
          v73 = 2112;
          v74 = v30;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hard link: %@ to file at path %@ with error %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v34);

        v31 = 0;
        v12 = v33;
        v13 = v59;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x24BDD6F00];
      v14 = v58;
      objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x24BDD6F00]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, v39);

      v60 = v31;
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v31, v62);
      v63 = v12;
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v12, CFSTR("kCameraSessionID"));
      v41 = *MEMORY[0x24BDD7E20];
      objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x24BDD7E20]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, v41);

      objc_msgSend(WeakRetained, "uniqueIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v43, CFSTR("HM.accessoryProfileUUID"));

      v44 = (void *)MEMORY[0x227676638]();
      v45 = self;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        v69 = 2112;
        v70 = v58;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Took snapshot with response %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(v64, "postedBulletins");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotMonitorEvents _insertUpdateOrRemoveBulletins:forChangedCharacteristics:snapshotData:](v45, v48, v49, v38);

      objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x24BDD6DC0]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)MEMORY[0x227676638]();
      v52 = v45;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = v13;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v55;
        v69 = 2112;
        v70 = v50;
        _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot with slot identifier: %@", buf, 0x16u);

        v13 = v54;
        v11 = 0;
      }

      objc_autoreleasePoolPop(v51);
      objc_msgSend(WeakRetained, "releaseSnapshotWithSlotIdentifier:", v50);

      v12 = v63;
      v15 = v64;
    }

    objc_msgSend(objc_getProperty(self, v56, 32, 1), "removeObject:", v15);
  }

}

- (void)_insertUpdateOrRemoveBulletins:(void *)a3 forChangedCharacteristics:(void *)a4 snapshotData:
{
  id v7;
  id v8;
  id v9;
  SEL v10;
  id Property;
  id v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  Property = objc_getProperty(a1, v10, 64, 1);
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            v19 = objc_getProperty(a1, v14, 64, 1);
            objc_msgSend(v19, "updateBulletinWithRecordID:forChangedCharacteristics:snapshotData:", v18, v8, v9, (_QWORD)v20);
          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v15);
      }
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCameraSessionID"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotMonitorEvents _removeBulletins:sessionID:](a1, v7, v12);
    }

  }
  else
  {
    objc_msgSend(Property, "insertImageBulletinsForChangedCharacteristics:snapshotData:completion:", v8, v9, 0);
  }

}

void __87__HMDCameraSnapshotMonitorEvents_handleBulletinBoardNotificationDidUpdateNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  if (v1)
  {
    objc_msgSend(v2, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    v7 = (void *)MEMORY[0x227676638]();
    v39 = v1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "object");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v32;
        v51 = 2112;
        v52 = v33;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected notifier for HMDBulletinBoardNotificationDidUpdateNotification: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      goto LABEL_33;
    }
    v38 = v3;
    v10 = v39;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v11;
      v51 = 2112;
      v52 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated bulletin board notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v39, "characteristicsAvailabilityListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "availableCharacteristics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "bulletinSnapshotCharacteristics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v6, "service");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "characteristics");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v20);

          if (v23)
          {
            if (objc_msgSend(v6, "isEnabled")
              && (-[HMDCameraSnapshotMonitorEvents currentCameraSettings]((uint64_t)v10),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  v25 = -[HMDCameraSnapshotMonitorEvents _canEnableNotificationForCharacteristic:cameraSettings:](v10, v20, v24), v24, v25))
            {
              v26 = (void *)MEMORY[0x227676638]();
              v27 = v10;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v45 = 138543618;
                v46 = v29;
                v47 = 2112;
                v48 = v20;
                _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin snapshot characteristic: %@", v45, 0x16u);

                v10 = v39;
              }

              objc_autoreleasePoolPop(v26);
              objc_msgSend(v15, "addObject:", v20);
            }
            else
            {
              objc_msgSend(v15, "removeObject:", v20);
            }
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
      }
      while (v17);
    }

    objc_msgSend(v10, "bulletinSnapshotCharacteristics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");
    if (v31 == objc_msgSend(v15, "count"))
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)v10, v15);
      v3 = v38;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    objc_msgSend(v10, "bulletinSnapshotCharacteristics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id *)v10;
    v3 = v38;
    if (objc_msgSend(v34, "count"))
    {
      v36 = objc_msgSend(v15, "count");

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:](v35, v15);
      if (v36)
        goto LABEL_32;
    }
    else
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:](v35, v15);
    }
    -[HMDCameraSnapshotMonitorEvents _updateHomedRelaunchRegistration](v35, v37);
    goto LABEL_32;
  }
LABEL_34:

}

- (id)currentCameraSettings
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "cameraProfiles");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_140025 != -1)
    dispatch_once(&logCategory__hmf_once_t42_140025, &__block_literal_global_140026);
  return (id)logCategory__hmf_once_v43_140027;
}

void __45__HMDCameraSnapshotMonitorEvents_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43_140027;
  logCategory__hmf_once_v43_140027 = v0;

}

@end
