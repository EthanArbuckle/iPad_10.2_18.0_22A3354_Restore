@implementation HMDBulletinBoard

- (HMDBulletinBoard)init
{
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  HMDUserNotificationCenter *v8;
  id v9;
  HMDUserNotificationCenter *v10;
  HMDFileManager *v11;
  HMDDoorbellBulletinUtilities *v12;
  HMDBulletinBoard *v13;

  HMDispatchQueueNameString();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(v4, v5);

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [HMDUserNotificationCenter alloc];
  v9 = (id)*MEMORY[0x24BDD5C70];
  v10 = -[HMDUserNotificationCenter initWithBundleIdentifier:logEventSubmitter:](v8, "initWithBundleIdentifier:logEventSubmitter:", v9, v7);

  v11 = objc_alloc_init(HMDFileManager);
  v12 = objc_alloc_init(HMDDoorbellBulletinUtilities);
  v13 = -[HMDBulletinBoard initWithNotificationCenter:fileManager:workQueue:doorbellBulletinUtilities:logEventSubmitter:](self, "initWithNotificationCenter:fileManager:workQueue:doorbellBulletinUtilities:logEventSubmitter:", v10, v11, v6, v12, v7);

  return v13;
}

- (HMDBulletinBoard)initWithNotificationCenter:(id)a3 fileManager:(id)a4 workQueue:(id)a5 doorbellBulletinUtilities:(id)a6 logEventSubmitter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDBulletinBoard *v17;
  HMDBulletinBoard *v18;
  uint64_t v19;
  NSMutableDictionary *characteristicTuples;
  uint64_t v21;
  Class persistentStoreClass;
  uint64_t v23;
  NSMutableDictionary *notificationRequests;
  NAFuture *v25;
  NAFuture *isConfiguredFuture;
  id v28;
  objc_super v29;

  v28 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HMDBulletinBoard;
  v17 = -[HMDBulletinBoard init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_notificationCenter, a3);
    objc_storeStrong((id *)&v18->_fileManager, a4);
    objc_storeStrong((id *)&v18->_workQueue, a5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    characteristicTuples = v18->_characteristicTuples;
    v18->_characteristicTuples = (NSMutableDictionary *)v19;

    objc_opt_class();
    v21 = objc_claimAutoreleasedReturnValue();
    persistentStoreClass = v18->_persistentStoreClass;
    v18->_persistentStoreClass = (Class)v21;

    objc_storeStrong((id *)&v18->_doorbellBulletinUtilities, a6);
    objc_storeStrong((id *)&v18->_logEventSubmitter, a7);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    notificationRequests = v18->_notificationRequests;
    v18->_notificationRequests = (NSMutableDictionary *)v23;

    v25 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    isConfiguredFuture = v18->_isConfiguredFuture;
    v18->_isConfiguredFuture = v25;

  }
  return v18;
}

- (void)configureWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  HMDBulletinBoard *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home manager: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDBulletinBoard workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__HMDBulletinBoard_configureWithHomeManager___block_invoke;
  v11[3] = &unk_24E79C268;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (HMDBulletinBoard)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinBoard *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDBulletinBoard init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMD.bulletinRequests"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[HMDBulletinBoard setNotificationRequests:](v5, "setNotificationRequests:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMD.bulletinRequests"));

}

- (void)archive
{
  -[objc_class archiveBulletinBoard:](-[HMDBulletinBoard persistentStoreClass](self, "persistentStoreClass"), "archiveBulletinBoard:", self);
}

- (void)insertImageBulletinsForChangedCharacteristics:(id)a3 snapshotData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  +[HMDHome filterAllowedToPostBulletinFromCharacteristics:](HMDHome, "filterAllowedToPostBulletinFromCharacteristics:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __90__HMDBulletinBoard_insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke;
    v12[3] = &unk_24E79B3F0;
    v12[4] = self;
    v15 = v9;
    v13 = v10;
    v14 = v8;
    dispatch_async(v11, v12);

  }
}

- (void)insertBulletinsForChangedCharacteristics:(id)a3 modifiedCharacteristics:(id)a4 changedByThisDevice:(BOOL)a5 changeNotificationFromPrimary:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;

  v12 = a4;
  v13 = a7;
  +[HMDHome filterAllowedToPostBulletinFromCharacteristics:](HMDHome, "filterAllowedToPostBulletinFromCharacteristics:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __146__HMDBulletinBoard_insertBulletinsForChangedCharacteristics_modifiedCharacteristics_changedByThisDevice_changeNotificationFromPrimary_completion___block_invoke;
    block[3] = &unk_24E77A828;
    block[4] = self;
    v19 = v13;
    v17 = v14;
    v20 = a5;
    v21 = a6;
    v18 = v12;
    dispatch_async(v15, block);

  }
}

- (id)insertBulletinForIncomingInvitation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  HMDBulletinBoard *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bulletinContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  v8 = (void *)v7;
  objc_msgSend(v4, "bulletinContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("homeIncomingInvitation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__HMDBulletinBoard_insertBulletinForIncomingInvitation___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    v20 = v4;
    v12 = v6;
    v21 = v12;
    dispatch_async(v11, block);

    v13 = v12;
  }
  else
  {
LABEL_4:
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid incoming invitation bulletinContext!", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)insertBulletinForIncompatibleInvitationFromInviterName:(id)a3 homeName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDBulletinBoard_insertBulletinForIncompatibleInvitationFromInviterName_homeName___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)insertBulletinForSecureTrigger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinBoard workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDBulletinBoard_insertBulletinForSecureTrigger___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v14 = v4;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  dispatch_async(v7, block);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (void)insertReachabilityEventBulletinForAccessory:(id)a3 reachable:(BOOL)a4 date:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__HMDBulletinBoard_insertReachabilityEventBulletinForAccessory_reachable_date___block_invoke;
  v13[3] = &unk_24E796150;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)insertHomeHubReachabilityBulletinForHome:(id)a3 reachable:(BOOL)a4 hasMultipleResidents:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__HMDBulletinBoard_insertHomeHubReachabilityBulletinForHome_reachable_hasMultipleResidents___block_invoke;
  block[3] = &unk_24E790028;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)insertAccessCodeAddedBulletinForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDBulletinBoard_insertAccessCodeAddedBulletinForHome___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertAccessCodeChangedBulletinForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDBulletinBoard_insertAccessCodeChangedBulletinForHome___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertAccessCodeRemovedBulletinForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDBulletinBoard_insertAccessCodeRemovedBulletinForHome___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertLockOnboardingBulletinForHome:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDBulletinBoard_insertLockOnboardingBulletinForHome_serviceType___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)insertWalletKeySupportAddedBulletinForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDBulletinBoard_insertWalletKeySupportAddedBulletinForAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertWalletKeyExpressModeSetUpBulletinForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__HMDBulletinBoard_insertWalletKeyExpressModeSetUpBulletinForHome___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeWalletKeyOnboardingBulletinForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDBulletinBoard_removeWalletKeyOnboardingBulletinForHome___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertCameraClipSignificantEventBulletin:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDBulletinBoard_insertCameraClipSignificantEventBulletin___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertCameraAccessModeChangedBulletin:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HMDBulletinBoard_insertCameraAccessModeChangedBulletin___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertConnectedCHIPEcosystemsChangedBulletin:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDBulletinBoard_insertConnectedCHIPEcosystemsChangedBulletin___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertAudioAnalysisEventNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  objc_msgSend(v4, "reason");
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDBulletinBoard_insertAudioAnalysisEventNotification___block_invoke;
  v7[3] = &unk_24E790468;
  v8 = v4;
  v9 = self;
  v11 = 1;
  v10 = 3;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateAudioAnalysisEventNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDBulletinBoard_updateAudioAnalysisEventNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertHH2SoftwareUpdateCompleteEventBulletinForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDBulletinBoard_insertHH2SoftwareUpdateCompleteEventBulletinForAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertHH2DuplicateUserModelBulletinForHome:(id)a3 user:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  HMDBulletinBoard *v14;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDBulletinBoard_insertHH2DuplicateUserModelBulletinForHome_user___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)updateBulletinForFirmwareUpdateInHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  HMDBulletinBoard *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  _BYTE location[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "shouldPostBulletin") & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("firmware"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, v4);
    -[HMDBulletinBoard isConfiguredFuture](self, "isConfiguredFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BE6B628];
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerWithDispatchQueue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reschedule:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__HMDBulletinBoard_updateBulletinForFirmwareUpdateInHome___block_invoke;
    v23[3] = &unk_24E77A850;
    objc_copyWeak(&v25, (id *)location);
    v23[4] = self;
    v13 = v7;
    v24 = v13;
    v14 = (id)objc_msgSend(v12, "addCompletionBlock:", v23);

    v15 = v24;
    v16 = v13;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for firmware update for home: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

- (void)insertBulletinsForMatterFirmwareUpdateInstalledInHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDBulletinBoard *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _BYTE location[12];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "shouldPostBulletin") & 1) != 0)
  {
    objc_initWeak((id *)location, v4);
    -[HMDBulletinBoard isConfiguredFuture](self, "isConfiguredFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE6B628];
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schedulerWithDispatchQueue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reschedule:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__HMDBulletinBoard_insertBulletinsForMatterFirmwareUpdateInstalledInHome___block_invoke;
    v16[3] = &unk_24E78BFB0;
    objc_copyWeak(&v17, (id *)location);
    v16[4] = self;
    v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for matter firmware update for home: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)updateDoorbellPressNotificationsWithSignificantEventBulletin:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__HMDBulletinBoard_updateDoorbellPressNotificationsWithSignificantEventBulletin_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)fetchAreUserNotificationsEnabledWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__HMDBulletinBoard_fetchAreUserNotificationsEnabledWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)insertNewRMVLanguageBulletinForHome:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard isConfiguredFuture](self, "isConfiguredFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE6B628];
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "schedulerWithDispatchQueue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reschedule:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__HMDBulletinBoard_insertNewRMVLanguageBulletinForHome_language___block_invoke;
  v16[3] = &unk_24E798798;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  v15 = (id)objc_msgSend(v12, "addCompletionBlock:", v16);

}

- (void)refreshHomeBadgeNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[HMDBulletinBoard isConfiguredFuture](self, "isConfiguredFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE6B628];
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schedulerWithDispatchQueue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reschedule:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__HMDBulletinBoard_refreshHomeBadgeNumber__block_invoke;
  v9[3] = &unk_24E798920;
  v9[4] = self;
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

}

- (void)removeBulletinsForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeBulletinsForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeBulletinsForService:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDBulletinBoard_removeBulletinsForService___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeBulletinsForTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeCameraClipBulletinsForCameraProfile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBulletinBoard *v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeBulletinWithRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDBulletinBoard_removeBulletinWithRecordID___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeAllBulletins
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDBulletinBoard workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HMDBulletinBoard_removeAllBulletins__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)notificationRequestsSortedByDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("content.date"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateContent:(id)a3 forNotificationWithRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBulletinBoard *v9;
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
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
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
    v21 = 138543874;
    v22 = v11;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating notification with request identifier %@ with content: %@", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDBulletinBoard notificationRequests](v9, "notificationRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v13, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithIdentifier:content:trigger:", v15, v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoard notificationRequests](v9, "notificationRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v7);

  -[HMDBulletinBoard notificationCenter](v9, "notificationCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateContent:forNotificationWithRequestIdentifier:", v6, v20);

}

- (void)cullBulletinsToCount:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDBulletinBoard *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6 > a3;
  v8 = v6 - a3;
  if (v7)
  {
    -[HMDBulletinBoard notificationRequestsSortedByDate](self, "notificationRequestsSortedByDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectsAtIndexes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "identifier", (_QWORD)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v15);
    }

    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Culling bulletin with identifiers: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDBulletinBoard removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:](v20, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v12, 1);

  }
}

- (void)removeBulletinsUsingPredicate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "na_map:", &__block_literal_global_145);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoard removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:](self, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v8, 1);

}

- (void)removeNotificationRequestsWithIdentifiers:(id)a3 shouldDeleteAttachments:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDBulletinBoard *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL8 v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  HMDBulletinBoard *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  uint32_t v35;
  void *v36;
  __int128 v37;
  HMDBulletinBoard *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v6;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v41)
  {
    v9 = *(_QWORD *)v44;
    v40 = *MEMORY[0x24BDD7E28];
    *(_QWORD *)&v8 = 138543874;
    v37 = v8;
    v38 = self;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[HMDBulletinBoard notificationRequests](self, "notificationRequests", v37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v48 = v17;
            v49 = 2112;
            v50 = v11;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing notification request with identifier: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          -[HMDBulletinBoard notificationRequests](v15, "notificationRequests");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v11);

          objc_msgSend(v13, "content");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "userInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v40);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4 && v21)
          {
            v22 = v9;
            v23 = v4;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0;
            v25 = objc_msgSend(v24, "removeItemAtPath:error:", v21, &v42);
            v26 = v42;

            v27 = (void *)MEMORY[0x227676638]();
            v28 = v15;
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v25)
            {
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v48 = v31;
                v49 = 2112;
                v50 = v21;
                v32 = v30;
                v33 = OS_LOG_TYPE_INFO;
                v34 = "%{public}@Removed the bulletin snapshot file at %@";
                v35 = 22;
                goto LABEL_16;
              }
            }
            else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v37;
              v48 = v31;
              v49 = 2112;
              v50 = v21;
              v51 = 2112;
              v52 = v26;
              v32 = v30;
              v33 = OS_LOG_TYPE_ERROR;
              v34 = "%{public}@Failed to remove the bulletin snapshot file at %@: %@";
              v35 = 32;
LABEL_16:
              _os_log_impl(&dword_2218F0000, v32, v33, v34, buf, v35);

            }
            objc_autoreleasePoolPop(v27);

            v4 = v23;
            v9 = v22;
            self = v38;
          }

        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v41);
  }

  -[HMDBulletinBoard notificationCenter](self, "notificationCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeNotificationRequestsWithIdentifiers:", obj);

  -[HMDBulletinBoard archive](self, "archive");
}

- (void)addNotificationRequest:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDBulletinBoard *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
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
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding Notification Request: %@ requestIdentifier:%@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDBulletinBoard notificationRequests](v10, "notificationRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v7);

  -[HMDBulletinBoard cullBulletinsToCount:](v10, "cullBulletinsToCount:", 20);
  -[HMDBulletinBoard archive](v10, "archive");

}

- (id)messageForChangedCharacteristic:(id)a3 withSignificantEvents:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  id v31;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bulletinBoardNotification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationServiceGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "cameraProfiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_8;
  objc_msgSend(v6, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE1B570]);

  if (!v15)
  {
    objc_msgSend(v6, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BE1B558]) & 1) != 0)
    {
      objc_msgSend(v9, "type");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BE1B7B0]);

      if (v28)
      {
        -[HMDBulletinBoard doorbellBulletinUtilities](self, "doorbellBulletinUtilities");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedDoorbellMessageForSignificantEvents:", v7);
        v29 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v25 = (void *)v29;
        goto LABEL_10;
      }
    }
    else
    {

    }
LABEL_8:
    -[HMDBulletinBoard doorbellBulletinUtilities](self, "doorbellBulletinUtilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinCategory localizedStateForCharacteristic:doorbellBulletinUtilities:](HMDBulletinCategory, "localizedStateForCharacteristic:doorbellBulletinUtilities:", v6, v17);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v11, "cameraProfiles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x24BDD7590]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v31 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:", v19, 1, v20, 100, v21, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hapAccessory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCameraClipSignificantEventBulletin localizedMessageForSignificantEvents:cameraAccessory:](HMDCameraClipSignificantEventBulletin, "localizedMessageForSignificantEvents:cameraAccessory:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v31;
LABEL_10:

  return v25;
}

- (id)messageForLockCharacteristic:(id)a3 personName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  __CFString *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  __CFString *v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    if (!objc_msgSend(v18, "integerValue"))
    {
      v19 = CFSTR("BULLETIN_LOCK_ACTION_UNLOCKED");
      goto LABEL_11;
    }
    if (objc_msgSend(v18, "integerValue") == 1)
    {
      v19 = CFSTR("BULLETIN_LOCK_ACTION_LOCKED");
      goto LABEL_11;
    }
    if (objc_msgSend(v18, "integerValue") == 2)
    {
      v19 = CFSTR("BULLETIN_LOCK_ACTION_JAMMED");
LABEL_11:
      v20 = (void *)MEMORY[0x24BDD17C8];
      HMDLocalizedStringForKey(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v42 = v15;
      objc_msgSend(v15, "composedName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), &v45, v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = v45;

      v25 = v23;
      if (!v23)
      {
        v26 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v47 = v28;
          v48 = 2112;
          v49 = v19;
          v50 = 2112;
          v51 = CFSTR("%@");
          v52 = 2112;
          v53 = v24;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          v26 = v41;
        }

        objc_autoreleasePoolPop(v26);
        v25 = v19;
      }
      v29 = v25;

      v30 = (void *)MEMORY[0x24BDD17C8];
      if (v7)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        objc_msgSend(v30, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%@ %@"), &v44, v29, v7);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v33 = v44;

        if (!v32)
        {
          v34 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          v32 = CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v47 = v36;
            v48 = 2112;
            v49 = CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON");
            v50 = 2112;
            v51 = CFSTR("%@ %@");
            v52 = 2112;
            v53 = v33;
LABEL_24:
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            goto LABEL_25;
          }
          goto LABEL_25;
        }
      }
      else
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        objc_msgSend(v30, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@"), &v43, v29);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v33 = v43;

        if (!v32)
        {
          v34 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          v32 = CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v47 = v36;
            v48 = 2112;
            v49 = CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
            v50 = 2112;
            v51 = CFSTR("%@");
            v52 = 2112;
            v53 = v33;
            goto LABEL_24;
          }
LABEL_25:
          v15 = v42;

          objc_autoreleasePoolPop(v34);
          v39 = 0;
          goto LABEL_26;
        }
      }
      v39 = v32;
      v15 = v42;
LABEL_26:
      v37 = v32;

      goto LABEL_27;
    }
  }
  v37 = 0;
LABEL_27:

  return v37;
}

- (id)titleNameForChangedCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1B4A8]) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v3, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000260-0000-1000-8000-0026BB765291"));

  if (!v8)
  {
LABEL_9:
    objc_msgSend(v4, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("BULLETIN_KEYPAD_DISABLED_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v21, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v21;

  v14 = v12;
  if (!v12)
  {
    v15 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v17;
      v24 = 2112;
      v25 = CFSTR("BULLETIN_KEYPAD_DISABLED_TITLE");
      v26 = 2112;
      v27 = CFSTR("%@");
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    v14 = CFSTR("BULLETIN_KEYPAD_DISABLED_TITLE");
  }
  v18 = v14;

LABEL_10:
  return v18;
}

- (id)removeRedundantSignificantEventNotificationsForSignificantEvents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDBulletinBoard *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBulletinBoard doorbellBulletinUtilities](self, "doorbellBulletinUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipUUIDsForCoalesceableSignificantEvents:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinBoard notificationRequestsForCameraClipUUIDs:](self, "notificationRequestsForCameraClipUUIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing significant event notifications (due to doorbell notification): %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v8, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_188_38017);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinBoard removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:](v10, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v14, 0);
  objc_msgSend(v8, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_insertImageBulletinsForChangedCharacteristics:(id)a3 attributedUsers:(id)a4 snapshotData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDBulletinBoard *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDBulletinBoard *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  HMDBulletinBoard *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL8 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  HMDBulletinBoard *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  HMDBulletinBoard *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  HMDBulletinBoard *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  HMDBulletinBoard *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  HMDBulletinBoard *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  HMDBulletinBoard *v120;
  NSObject *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  unint64_t v125;
  void *v126;
  HMDBulletinBoard *v127;
  NSObject *v128;
  void *v129;
  HMDBulletinBoard *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  void (**v135)(id, void *);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  _BOOL8 v148;
  void *context;
  void *contexta;
  uint64_t v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  HMDBulletinBoard *v155;
  HMDBulletinBoard *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  id v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  HMDBulletinBoard *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  _QWORD v172[5];
  id v173;
  id v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  uint64_t v179;
  void *v180;
  _QWORD v181[2];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  id v185;
  __int16 v186;
  id v187;
  __int16 v188;
  id v189;
  _BYTE v190[128];
  uint64_t v191;

  v191 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v166 = a5;
  v135 = (void (**)(id, void *))a6;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v175, v190, 16);
  if (v14)
  {
    v15 = v14;
    v170 = *(_QWORD *)v176;
    v168 = *MEMORY[0x24BE1B558];
    v154 = *MEMORY[0x24BDD7E28];
    v153 = *MEMORY[0x24BDD5350];
    v151 = *MEMORY[0x24BDD5370];
    v137 = *MEMORY[0x24BDD5368];
    v138 = *MEMORY[0x24BDD5388];
    v136 = *MEMORY[0x24BE1B7B0];
    v139 = *MEMORY[0x24BDD53A0];
    v152 = v11;
    v155 = self;
    v160 = v13;
    do
    {
      v16 = 0;
      v169 = v15;
      do
      {
        if (*(_QWORD *)v176 != v170)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v16);
        objc_msgSend(v17, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

LABEL_9:
          objc_msgSend(v17, "service");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (!v21
            || (objc_msgSend(v21, "name"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23))
          {
            v25 = (void *)MEMORY[0x227676638]();
            v26 = self;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v183 = v28;
              v184 = 2112;
              v185 = v17;
              _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Bulletin board changed characteristic's service or service name is nil: %@", buf, 0x16u);

              v15 = v169;
            }

            objc_autoreleasePoolPop(v25);
            goto LABEL_16;
          }
          if (+[HMDBulletinUserAttributionManager currentStateCharacteristicSupportsUserAttribution:](HMDBulletinUserAttributionManager, "currentStateCharacteristicSupportsUserAttribution:", v17))
          {
            objc_msgSend(v11, "objectForKey:", v17);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObjectForKey:", v17);
            -[HMDBulletinBoard insertBulletinForChangedSecureClassCharacteristic:attributedUser:](self, "insertBulletinForChangedSecureClassCharacteristic:attributedUser:", v17, v24);

LABEL_16:
            goto LABEL_17;
          }
          objc_msgSend(v22, "bulletinBoardNotification");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEnabled");

          v35 = (void *)MEMORY[0x227676638]();
          v36 = self;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
          if (!v34)
          {
            if (v38)
            {
              HMFGetLogIdentifier();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "service");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "bulletinBoardNotification");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v183 = v55;
              v184 = 2112;
              v185 = v17;
              v186 = 2112;
              v187 = v57;
              _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Not posting bulletin for %@ as it is not enabled: %@", buf, 0x20u);

              self = v155;
            }

            objc_autoreleasePoolPop(v35);
            objc_msgSend(v166, "objectForKeyedSubscript:", v154);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "objectForKeyedSubscript:", v154);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v171 = 0;
              objc_msgSend(v59, "removeItemAtPath:error:", v60, &v171);
              v61 = v171;

              v62 = (void *)MEMORY[0x227676638]();
              v63 = v36;
              HMFGetOSLogHandle();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v183 = v65;
                v184 = 2112;
                v185 = v166;
                v186 = 2112;
                v187 = v61;
                _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@Removed the bulletin snapshot file at %@ as it not being posted with result %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v62);

              self = v155;
            }
            v13 = v160;
            v15 = v169;
            goto LABEL_16;
          }
          if (v38)
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v183 = v39;
            v184 = 2112;
            v185 = v17;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Posting bulletin for changed characteristic: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v161 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bulletinBoardNotification");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "notificationServiceGroup");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v159 = v41;
          objc_msgSend(v41, "cameraProfiles");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "bulletinContext");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "mutableCopy");

          +[HMDBulletinCategory bulletinReasonForChangedCharacteristic:](HMDBulletinCategory, "bulletinReasonForChangedCharacteristic:", v17);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKeyedSubscript:");
          objc_msgSend(v43, "contextSPIUniqueIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "UUIDString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v47, v153);

          v156 = v36;
          -[HMDBulletinBoard titleNameForChangedCharacteristic:](v36, "titleNameForChangedCharacteristic:", v17);
          v158 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bulletinBoardNotification");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "notificationServiceGroup");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v164 = v43;
          objc_msgSend(v43, "uniqueIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "actionContextForCameraProfileID:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v163 = v51;
          objc_msgSend(v51, "objectForKey:", CFSTR("categoryID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v165 = v45;
          if (v52)
          {
            if (v166)
            {
              objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "productPlatform") != 1;

            }
            else
            {
              v54 = 0;
            }
            v76 = v51;
            v75 = v156;
            objc_msgSend(v165, "hmf_stringForKey:", v151);
            v77 = objc_claimAutoreleasedReturnValue();
            if (v77)
            {
              v66 = (void *)v77;
              objc_msgSend(v163, "hmf_stringForKey:", v153);
              v78 = objc_claimAutoreleasedReturnValue();
              if (v78)
              {
                v67 = (void *)v78;
                +[HMDCameraClipSignificantEventBulletin actionURLForHomeUUID:cameraUUID:](HMDCameraClipSignificantEventBulletin, "actionURLForHomeUUID:cameraUUID:", v66, v78);
                context = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

                objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "UUIDString");
                v157 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDBCF20], "set");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "clipManager");
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                v82 = (uint64_t)v166;
                v83 = v154;
                v148 = v54;
                if (v81)
                {
                  objc_msgSend(v17, "type");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v84, "isEqualToString:", v168))
                    goto LABEL_70;
                  objc_msgSend(v22, "type");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v85, "isEqualToString:", v136);

                  if (v86)
                  {
                    -[HMDBulletinBoard doorbellBulletinUtilities](v75, "doorbellBulletinUtilities");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "significantEventsRelevantToDoorbellPress:forCameraProfile:", v161, v164);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v88, "hmf_isEmpty"))
                    {
                      v144 = v88;
                      v89 = (void *)MEMORY[0x227676638]();
                      v90 = v75;
                      HMFGetOSLogHandle();
                      v91 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v183 = v92;
                        _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_INFO, "%{public}@Did not find significant events, attempting cloud pull", buf, 0xCu);

                      }
                      objc_autoreleasePoolPop(v89);
                      objc_msgSend(v164, "clipManager");
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v141, "performCloudPull");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v94 = (void *)MEMORY[0x24BE6B628];
                      -[HMDBulletinBoard workQueue](v90, "workQueue");
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v94, "schedulerWithDispatchQueue:", v95);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "reschedule:", v96);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      v172[0] = MEMORY[0x24BDAC760];
                      v172[1] = 3221225472;
                      v172[2] = __107__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_attributedUsers_snapshotData_completion___block_invoke;
                      v172[3] = &unk_24E788E58;
                      v172[4] = v90;
                      v173 = v157;
                      v174 = v164;
                      v98 = (id)objc_msgSend(v97, "addSuccessBlock:", v172);

                      v83 = v154;
                      v88 = v144;
                    }
                    -[HMDBulletinBoard _submitDoorbellEventDetailsFromBulletinWithDate:significantEvents:](v75, "_submitDoorbellEventDetailsFromBulletinWithDate:significantEvents:", v161, v88);
                    -[HMDBulletinBoard removeRedundantSignificantEventNotificationsForSignificantEvents:](v75, "removeRedundantSignificantEventNotificationsForSignificantEvents:", v88);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v145 = (void *)objc_msgSend(v84, "mutableCopy");
                    objc_msgSend(v84, "sortedArrayUsingComparator:", &__block_literal_global_194);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "na_firstObjectPassingTest:", &__block_literal_global_196);
                    v100 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v100)
                    {
                      objc_msgSend(v100, "content");
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v101, "userInfo");
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDBulletinBoard _updateDoorbellUserInfo:withSignificantEventUserInfo:](v75, "_updateDoorbellUserInfo:withSignificantEventUserInfo:", v165, v102);

                      objc_msgSend(v100, "content");
                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v103, "userInfo");
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v104, "objectForKeyedSubscript:", v83);
                      v105 = (void *)objc_claimAutoreleasedReturnValue();

                      v82 = (uint64_t)v166;
                      if (!v166 && v105)
                      {
                        v106 = (void *)MEMORY[0x227676638]();
                        v167 = v75;
                        HMFGetOSLogHandle();
                        v107 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v142 = v106;
                          v108 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543362;
                          v183 = v108;
                          _os_log_impl(&dword_2218F0000, v107, OS_LOG_TYPE_INFO, "%{public}@No snapshotData was provided, so using whatever we had in the mostRecentCoalescedPersonNotification", buf, 0xCu);

                          v106 = v142;
                        }

                        objc_autoreleasePoolPop(v106);
                        v179 = v154;
                        v180 = v105;
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
                        v82 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v145, "removeObject:", v100);
                      }

                    }
                    else
                    {
                      v82 = (uint64_t)v166;
                    }
                    -[HMDBulletinBoard removeImageFilesForNotificationRequests:](v75, "removeImageFilesForNotificationRequests:", v145);

                    v80 = v88;
LABEL_70:

                  }
                  else
                  {
                    v82 = (uint64_t)v166;
                  }
                }
                if (objc_msgSend(v162, "isEqualToString:", v139))
                  v123 = 9;
                else
                  v123 = 8;
                v146 = v80;
                -[HMDBulletinBoard messageForChangedCharacteristic:withSignificantEvents:](v75, "messageForChangedCharacteristic:withSignificantEvents:", v17, v80);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = +[HMDBulletinBoard interruptionLevelForChangedCharacteristic:](HMDBulletinBoard, "interruptionLevelForChangedCharacteristic:", v17);
                v126 = (void *)MEMORY[0x227676638]();
                v127 = v75;
                HMFGetOSLogHandle();
                v128 = objc_claimAutoreleasedReturnValue();
                v166 = (id)v82;
                if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v183 = v129;
                  v184 = 2112;
                  v185 = v124;
                  v186 = 2112;
                  v187 = v165;
                  v188 = 2112;
                  v189 = v166;
                  _os_log_impl(&dword_2218F0000, v128, OS_LOG_TYPE_INFO, "%{public}@Inserting new bulletin with message: %@, userInfo: %@, snapshotData: %@", buf, 0x2Au);

                  v82 = (uint64_t)v166;
                }

                objc_autoreleasePoolPop(v126);
                v134 = v123;
                v76 = v163;
                v130 = v127;
                v118 = (void *)v158;
                v113 = (void *)v161;
                -[HMDBulletinBoard _insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:](v130, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v158, v82, v124, v157, v161, v148, context, v165, v163, v125, v134);
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "identifier");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "addObject:", v132);

                v70 = v165;
                self = v155;
                v13 = v160;
                v15 = v169;
              }
              else
              {
                v119 = (void *)MEMORY[0x227676638]();
                v120 = v156;
                HMFGetOSLogHandle();
                v121 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v183 = v122;
                  v184 = 2112;
                  v185 = v163;
                  _os_log_impl(&dword_2218F0000, v121, OS_LOG_TYPE_ERROR, "%{public}@Camera UUID is absent in action context: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v119);

                v13 = v160;
                v113 = (void *)v161;
                v15 = v169;
                v70 = v165;
                v118 = (void *)v158;
              }
LABEL_77:

              v11 = v152;
              goto LABEL_16;
            }
            v109 = (void *)MEMORY[0x227676638]();
            v110 = v156;
            HMFGetOSLogHandle();
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v183 = v112;
              v184 = 2112;
              v185 = v165;
              _os_log_impl(&dword_2218F0000, v111, OS_LOG_TYPE_ERROR, "%{public}@Home UUID is absent in bulletin context: %@", buf, 0x16u);

              v15 = v169;
            }

            objc_autoreleasePoolPop(v109);
            v13 = v160;
            v113 = (void *)v161;
            v70 = v165;
          }
          else
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", v151);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", v138);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", v137);
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = (void *)v68;
            v70 = v45;
            if (v66 && v67 && v68)
            {
              objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 0, v66);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 2, v67);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 3, v69);
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = (void *)MEMORY[0x24BDBCF20];
              v181[0] = v147;
              v181[1] = v143;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v181, 2);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setWithArray:", v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              generateURLForHomeKitObject();
              context = (void *)objc_claimAutoreleasedReturnValue();

              v54 = 0;
              v75 = v156;
              goto LABEL_43;
            }
            v114 = (void *)v68;
            contexta = (void *)MEMORY[0x227676638]();
            v115 = v156;
            HMFGetOSLogHandle();
            v116 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v183 = v117;
              v184 = 2112;
              v185 = v66;
              v186 = 2112;
              v187 = v67;
              v188 = 2112;
              v189 = v114;
              _os_log_impl(&dword_2218F0000, v116, OS_LOG_TYPE_ERROR, "%{public}@Cannot generate action URL with homeUUID: %@ serviceUUID: %@ characteristicUUID: %@", buf, 0x2Au);

              v70 = v165;
            }

            objc_autoreleasePoolPop(contexta);
            v13 = v160;
            v113 = (void *)v161;
          }
          v118 = (void *)v158;
          v76 = v163;
          goto LABEL_77;
        }
        objc_msgSend(v17, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v168);

        if ((v20 & 1) != 0)
          goto LABEL_9;
        v29 = (void *)MEMORY[0x227676638]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v183 = v32;
          v184 = 2112;
          v185 = v17;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Bulletin board changed characteristic value is nil: %@", buf, 0x16u);

          v15 = v169;
        }

        objc_autoreleasePoolPop(v29);
LABEL_17:
        ++v16;
      }
      while (v15 != v16);
      v133 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v175, v190, 16);
      v15 = v133;
    }
    while (v133);
  }

  if (v135)
    v135[2](v135, v140);

}

- (void)insertBulletinForChangedSecureClassCharacteristic:(id)a3 attributedUser:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  HMDBulletinBoard *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDBulletinBoard *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *context;
  void *contexta;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  HMDBulletinBoard *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  unint64_t v58;
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v48 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "accessory");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "bulletinContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD5370]);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD5388]);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD5368]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
      v15 = v12 == 0;
    else
      v15 = 1;
    if (v15 || v13 == 0)
    {
      v35 = (void *)v13;
      v36 = (void *)v12;
      v37 = (void *)v11;
      context = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v19;
        v62 = 2112;
        v63 = v37;
        v64 = 2112;
        v65 = v36;
        v66 = 2112;
        v67 = v35;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot generate action URL with homeUUID: %@ serviceUUID: %@ characteristicUUID: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(context);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 0, v11);
      contexta = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 2, v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 3, v14);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDBCF20];
      v59[0] = contexta;
      v59[1] = v44;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
      v43 = (void *)v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v41 = (void *)v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      generateURLForHomeKitObject();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v40 = (void *)v14;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = +[HMDBulletinBoard interruptionLevelForChangedCharacteristic:](HMDBulletinBoard, "interruptionLevelForChangedCharacteristic:", v6);
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __85__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic_attributedUser___block_invoke;
      v49[3] = &unk_24E77A9A8;
      v50 = v48;
      v51 = self;
      v52 = v6;
      v53 = v10;
      v54 = v27;
      v55 = v30;
      v56 = v28;
      v57 = v38;
      v58 = v31;
      v39 = v38;
      v32 = v28;
      v33 = v30;
      v34 = v27;
      v35 = v40;
      v36 = v41;
      -[HMDBulletinBoard resolveDisplayNameForChangedCharacteristic:completion:](self, "resolveDisplayNameForChangedCharacteristic:completion:", v52, v49);

      v37 = v43;
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v23;
      v62 = 2112;
      v63 = v6;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Not creating a bulletin for characteristic because home is nil: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)resolveDisplayNameForChangedCharacteristic:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lockNotificationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldResolveNotificationContextForCharacteristic:", v6) & 1) != 0)
  {
    objc_msgSend(v6, "notificationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke;
    v13[3] = &unk_24E77A9D0;
    v13[4] = self;
    v16 = v7;
    v14 = v8;
    v15 = v10;
    objc_msgSend(v15, "resolveEncodedCharacteristicNotificationContext:accessoryUUID:completion:", v11, v12, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (id)messageForGarageDoorCharacteristic:(id)a3 personName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  __CFString *v39;
  id v40;
  __CFString *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v46;
  void *v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (!v18)
    goto LABEL_8;
  if (objc_msgSend(v18, "integerValue"))
  {
    if (objc_msgSend(v18, "integerValue") == 1)
    {
      v19 = CFSTR("BULLETIN_DOOR_ACTION_CLOSED");
      goto LABEL_10;
    }
LABEL_8:
    v20 = 0;
    goto LABEL_26;
  }
  v19 = CFSTR("BULLETIN_DOOR_ACTION_OPENED");
LABEL_10:
  v47 = v15;
  if (v7)
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_WITH_PERSON"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD17C8];
    v48 = v21;
    HMDLocalizedStringForKey(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v15, "composedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@ %@"), &v51, v24, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v51;

    if (!v25)
    {
      v27 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v53 = v29;
        v54 = 2112;
        v30 = v48;
        v55 = v48;
        v56 = 2112;
        v57 = CFSTR("%@ %@");
        v58 = 2112;
        v59 = v26;
LABEL_18:
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

LABEL_20:
        objc_autoreleasePoolPop(v27);
        v35 = 0;
        v48 = v30;
        v25 = v30;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_WITHOUT_PERSON"));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD17C8];
    v48 = v31;
    HMDLocalizedStringForKey(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(v15, "composedName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v33, CFSTR("%@"), &v50, v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v50;

    if (!v25)
    {
      v27 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v53 = v29;
        v54 = 2112;
        v30 = v48;
        v55 = v48;
        v56 = 2112;
        v57 = CFSTR("%@");
        v58 = 2112;
        v59 = v26;
        goto LABEL_18;
      }
LABEL_19:
      v30 = v48;
      goto LABEL_20;
    }
  }
  v35 = v25;
LABEL_21:
  v36 = v25;

  v37 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("BULLETIN_DOOR_MESSAGE"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v37, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@"), &v49, v36);
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v40 = v49;

  v41 = v39;
  if (!v39)
  {
    v42 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v53 = v44;
      v54 = 2112;
      v55 = CFSTR("BULLETIN_DOOR_MESSAGE");
      v56 = 2112;
      v57 = CFSTR("%@");
      v58 = 2112;
      v59 = v40;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      v42 = v46;
    }

    objc_autoreleasePoolPop(v42);
    v41 = CFSTR("BULLETIN_DOOR_MESSAGE");
  }
  v20 = v41;

  v15 = v47;
LABEL_26:

  return v20;
}

- (id)messageForSecuritySystemCharacteristic:(id)a3 personName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  id v39;
  __CFString *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  __CFString *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (!v18)
    goto LABEL_19;
  if (!objc_msgSend(v18, "integerValue"))
  {
    v19 = CFSTR("BULLETIN_SECURITY_SYSTEM_ACTION_ARMED_STAY");
    goto LABEL_15;
  }
  if (objc_msgSend(v18, "integerValue") == 1)
  {
    v19 = CFSTR("BULLETIN_SECURITY_SYSTEM_ACTION_ARMED_AWAY");
    goto LABEL_15;
  }
  if (objc_msgSend(v18, "integerValue") == 2)
  {
    v19 = CFSTR("BULLETIN_SECURITY_SYSTEM_ACTION_ARMED_NIGHT");
    goto LABEL_15;
  }
  if (objc_msgSend(v18, "integerValue") == 3)
  {
    v19 = CFSTR("BULLETIN_SECURITY_SYSTEM_ACTION_DISARMED");
    goto LABEL_15;
  }
  if (objc_msgSend(v18, "integerValue") != 4)
  {
LABEL_19:
    v29 = 0;
    goto LABEL_32;
  }
  v19 = CFSTR("BULLETIN_SECURITY_SYSTEM_ACTION_TRIGGERED");
LABEL_15:
  if (v7)
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_WITH_PERSON"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD17C8];
    v45 = v20;
    HMDLocalizedStringForKey(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v15, "composedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@ %@"), &v48, v23, v7);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = v48;

    if (!v24)
    {
      v26 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v50 = v28;
        v51 = 2112;
        v24 = v45;
        v52 = v45;
        v53 = 2112;
        v54 = CFSTR("%@ %@");
        v55 = 2112;
        v56 = v25;
LABEL_24:
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

LABEL_26:
        objc_autoreleasePoolPop(v26);
        v34 = 0;
        v45 = v24;
        goto LABEL_27;
      }
      goto LABEL_25;
    }
  }
  else
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_WITHOUT_PERSON"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD17C8];
    v45 = v30;
    HMDLocalizedStringForKey(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v15, "composedName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v32, CFSTR("%@"), &v47, v33);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = v47;

    if (!v24)
    {
      v26 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v50 = v28;
        v51 = 2112;
        v24 = v45;
        v52 = v45;
        v53 = 2112;
        v54 = CFSTR("%@");
        v55 = 2112;
        v56 = v25;
        goto LABEL_24;
      }
LABEL_25:
      v24 = v45;
      goto LABEL_26;
    }
  }
  v34 = v24;
LABEL_27:
  v35 = v24;

  v36 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("BULLETIN_SECURITY_SYSTEM_MESSAGE"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v36, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), &v46, v35);
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = v46;

  v40 = v38;
  if (!v38)
  {
    v41 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v50 = v43;
      v51 = 2112;
      v52 = CFSTR("BULLETIN_SECURITY_SYSTEM_MESSAGE");
      v53 = 2112;
      v54 = CFSTR("%@");
      v55 = 2112;
      v56 = v39;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v41);
    v40 = CFSTR("BULLETIN_SECURITY_SYSTEM_MESSAGE");
  }
  v29 = v40;

LABEL_32:
  return v29;
}

- (id)messageForWindowCharacteristic:(id)a3 personName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  __CFString *v39;
  id v40;
  __CFString *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v46;
  void *v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (!v18)
    goto LABEL_12;
  if (objc_msgSend(v18, "integerValue") > 0)
  {
    v19 = CFSTR("BULLETIN_WINDOW_ACTION_OPENED");
    goto LABEL_7;
  }
  if (objc_msgSend(v18, "integerValue"))
  {
LABEL_12:
    v30 = 0;
    goto LABEL_26;
  }
  v19 = CFSTR("BULLETIN_WINDOW_ACTION_CLOSED");
LABEL_7:
  v47 = v15;
  if (v7)
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_WITH_PERSON"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD17C8];
    v48 = v20;
    HMDLocalizedStringForKey(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v15, "composedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@ %@"), &v51, v23, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v51;

    if (!v24)
    {
      v26 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v53 = v28;
        v54 = 2112;
        v29 = v48;
        v55 = v48;
        v56 = 2112;
        v57 = CFSTR("%@ %@");
        v58 = 2112;
        v59 = v25;
LABEL_18:
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

LABEL_20:
        objc_autoreleasePoolPop(v26);
        v35 = 0;
        v48 = v29;
        v24 = v29;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_WITHOUT_PERSON"));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD17C8];
    v48 = v31;
    HMDLocalizedStringForKey(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(v15, "composedName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v33, CFSTR("%@"), &v50, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v50;

    if (!v24)
    {
      v26 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v53 = v28;
        v54 = 2112;
        v29 = v48;
        v55 = v48;
        v56 = 2112;
        v57 = CFSTR("%@");
        v58 = 2112;
        v59 = v25;
        goto LABEL_18;
      }
LABEL_19:
      v29 = v48;
      goto LABEL_20;
    }
  }
  v35 = v24;
LABEL_21:
  v36 = v24;

  v37 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("BULLETIN_WINDOW_MESSAGE"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v37, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@"), &v49, v36);
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v40 = v49;

  v41 = v39;
  if (!v39)
  {
    v42 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v53 = v44;
      v54 = 2112;
      v55 = CFSTR("BULLETIN_WINDOW_MESSAGE");
      v56 = 2112;
      v57 = CFSTR("%@");
      v58 = 2112;
      v59 = v40;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      v42 = v46;
    }

    objc_autoreleasePoolPop(v42);
    v41 = CFSTR("BULLETIN_WINDOW_MESSAGE");
  }
  v30 = v41;

  v15 = v47;
LABEL_26:

  return v30;
}

- (void)insertBulletinForDoorLockAlarm:(id)a3 alarmCode:(unsigned __int8)a4 flow:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDBulletinBoard *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDBulletinBoard *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD block[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v6 = a4;
  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldPostBulletin") & 1) != 0)
  {
    objc_msgSend(v10, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryBulletinContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v51 = v12;
    objc_msgSend(v12, "hmf_stringForKey:", *MEMORY[0x24BDD5388]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastLockOperationEventRequestIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v48 = v9;
    if (v14)
    {
      v49 = v14;
    }
    else
    {
      objc_msgSend(v9, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v49 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(v8, "contextSPIUniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tupleWithQueryType:uuidString:", 1, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(v10, "contextSPIUniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "tupleWithQueryType:uuidString:", 0, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDBCF20];
    v46 = (void *)v28;
    v60 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v24;
    generateURLForHomeKitObject();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v32, "absoluteString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setObject:forKey:", v33, *MEMORY[0x24BDD7120]);

    }
    objc_msgSend((id)objc_opt_class(), "messageForDoorLockAlarmEvent:alarmCode:", v8, v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v9 = v48;
      if (_os_feature_enabled_impl())
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = v35;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v62 = v38;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

          v9 = v48;
        }

        objc_autoreleasePoolPop(v35);
        objc_msgSend(v10, "uuid");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "UUIDString");
        v40 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v40;
      }
      v41 = v50;
      v42 = v51;
      -[HMDBulletinBoard workQueue](self, "workQueue", v45);
      v43 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__HMDBulletinBoard_insertBulletinForDoorLockAlarm_alarmCode_flow___block_invoke;
      block[3] = &unk_24E77F7F0;
      block[4] = self;
      v53 = v9;
      v54 = v34;
      v44 = v49;
      v55 = v49;
      v56 = v50;
      v13 = v13;
      v57 = v13;
      v58 = v51;
      v59 = v8;
      dispatch_async(v43, block);

    }
    else
    {
      v9 = v48;
      v44 = v49;
      v41 = v50;
      v42 = v51;
    }

  }
  else
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
      v62 = v19;
      v63 = 2112;
      v64 = v8;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for Door Lock Alarm : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)insertBulletinForLockOperation:(id)a3 userDisplayName:(id)a4 lockOperationType:(unsigned __int8)a5 ecosystemName:(id)a6 flow:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  HMDBulletinBoard *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDBulletinBoard *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *context;
  void *v55;
  void *v56;
  void *v57;
  HMDBulletinBoard *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  _QWORD block[5];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v9 = a5;
  v82 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v68 = a6;
  v14 = a7;
  objc_msgSend(v12, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "shouldPostBulletin") & 1) != 0)
  {
    v58 = self;
    objc_msgSend(v12, "name");
    v65 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "name");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryBulletinContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "hmf_stringForKey:", *MEMORY[0x24BDD5388]);
    v64 = objc_claimAutoreleasedReturnValue();
    v66 = v14;
    objc_msgSend(v14, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v20;
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v12, "setLastLockOperationEventRequestIdentifier:", v21);

    v22 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(v12, "contextSPIUniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tupleWithQueryType:uuidString:", 1, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(v15, "contextSPIUniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tupleWithQueryType:uuidString:", 0, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x24BDBCF20];
    v57 = (void *)v29;
    v77 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v25;
    generateURLForHomeKitObject();
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v33, "absoluteString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v34, *MEMORY[0x24BDD7120]);

    }
    v61 = v18;
    if (v13)
    {
      v35 = (void *)v65;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("user=%@ room=%@ accessory=%@ operationType=%hhu"), v13, v67, v65, v9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v63;
      v37 = (id)v64;
    }
    else
    {
      v37 = (id)v64;
      v35 = (void *)v65;
      v38 = v63;
      if (v68)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("room=%@ accessory=%@ operationType=%hhu ecosystemName=%@"), v67, v65, v9, v68);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("room=%@ accessory=%@ operationType=%hhu"), v67, v65, v9, v53);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)objc_opt_class(), "messageForLockOperationEvent:personName:lockOperationType:ecosystemName:", v12, v13, v9, v68);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v13;
    if (v43)
    {
      v56 = v36;
      v55 = v33;
      if (_os_feature_enabled_impl())
      {
        context = (void *)MEMORY[0x227676638]();
        v44 = v58;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v79 = v46;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

          v38 = v63;
          v37 = (id)v64;
        }

        objc_autoreleasePoolPop(context);
        objc_msgSend(v15, "uuid");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "UUIDString");
        v48 = objc_claimAutoreleasedReturnValue();

        v37 = (id)v48;
        v35 = (void *)v65;
      }
      -[HMDBulletinBoard workQueue](v58, "workQueue");
      v49 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __104__HMDBulletinBoard_insertBulletinForLockOperation_userDisplayName_lockOperationType_ecosystemName_flow___block_invoke;
      block[3] = &unk_24E77F7F0;
      block[4] = v58;
      v70 = v66;
      v71 = v43;
      v36 = v56;
      v72 = v56;
      v73 = v38;
      v50 = v62;
      v74 = v62;
      v37 = v37;
      v75 = v37;
      v51 = v38;
      v52 = v61;
      v76 = v61;
      dispatch_async(v49, block);

      v33 = v55;
    }
    else
    {
      v51 = v38;
      v52 = v61;
      v50 = v62;
    }

    v14 = v66;
    v13 = v60;
  }
  else
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v42;
      v80 = 2112;
      v81 = v12;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for Door lock operation : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
  }

}

- (void)insertBulletinForLockUserChange:(id)a3 lockDataType:(unsigned __int8)a4 dataOperationType:(unsigned __int8)a5 ecosystemName:(id)a6 isAffectedUser:(BOOL)a7 flow:(id)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  HMDBulletinBoard *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  unsigned int v44;
  unsigned int context;
  void *contexta;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD block[5];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  _QWORD v64[3];

  v44 = a4;
  context = a5;
  v64[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v51 = a6;
  v12 = a8;
  objc_msgSend(v11, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessoryBulletinContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "hmf_stringForKey:", *MEMORY[0x24BDD5388]);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v12;
  objc_msgSend(v12, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD74F0];
  objc_msgSend(v11, "contextSPIUniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tupleWithQueryType:uuidString:", 1, v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD74F0];
  v52 = v13;
  objc_msgSend(v13, "contextSPIUniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tupleWithQueryType:uuidString:", 0, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDBCF20];
  v47 = (void *)v25;
  v64[0] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v21;
  generateURLForHomeKitObject();
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v30, *MEMORY[0x24BDD7120]);

  }
  v60 = 0;
  v61 = 0;
  LOBYTE(v42) = a7;
  v31 = v51;
  objc_msgSend((id)objc_opt_class(), "messageAndTitleForLockUserChangeEvent:title:accessory:lockDataType:dataOperationType:ecosystemName:isAffectedUser:", &v61, &v60, v11, v44, context, v51, v42);
  v32 = v61;
  v33 = v60;
  if (v32)
  {
    if (_os_feature_enabled_impl())
    {
      contexta = (void *)MEMORY[0x227676638]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v36;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

        v31 = v51;
      }

      objc_autoreleasePoolPop(contexta);
      objc_msgSend(v52, "uuid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "UUIDString");
      v38 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v38;
    }
    v39 = v50;
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117__HMDBulletinBoard_insertBulletinForLockUserChange_lockDataType_dataOperationType_ecosystemName_isAffectedUser_flow___block_invoke;
    block[3] = &unk_24E77A9F8;
    block[4] = self;
    v54 = v50;
    v55 = v32;
    v41 = v49;
    v56 = v49;
    v57 = v33;
    v16 = v16;
    v58 = v16;
    v59 = v15;
    dispatch_async(v40, block);

  }
  else
  {
    v41 = v49;
    v39 = v50;
  }

}

- (void)insertUserPreferredHomeHubReachabilityBulletinForHome:(id)a3 reachable:(BOOL)a4 electedPrimary:(id)a5 previousPrimary:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDBulletinBoard *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v10, "shouldPostBulletin") & 1) != 0)
  {
    -[HMDBulletinBoard workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__HMDBulletinBoard_insertUserPreferredHomeHubReachabilityBulletinForHome_reachable_electedPrimary_previousPrimary___block_invoke;
    block[3] = &unk_24E78E830;
    block[4] = self;
    v19 = v10;
    v22 = a4;
    v20 = v11;
    v21 = v12;
    dispatch_async(v13, block);

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
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for preferred home hub reachability : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)removeImageFilesForNotificationRequests:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDBulletinBoard *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  HMDBulletinBoard *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    v10 = *MEMORY[0x24BDD7E28];
    *(_QWORD *)&v7 = 138543874;
    v24 = v7;
    do
    {
      v11 = 0;
      v25 = v8;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v11), "content", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          objc_msgSend(v15, "removeItemAtPath:error:", v14, &v27);
          v16 = v27;

          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = v10;
            v21 = v9;
            v22 = self;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v33 = v23;
            v34 = 2112;
            v35 = v14;
            v36 = 2112;
            v37 = v16;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Removed the bulletin snapshot file at %@ with result %@", buf, 0x20u);

            self = v22;
            v9 = v21;
            v10 = v20;
            v8 = v25;
          }

          objc_autoreleasePoolPop(v17);
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v8);
  }

}

- (id)_insertRequestWithTitle:(id)a3 snapshotData:(id)a4 message:(id)a5 requestIdentifier:(id)a6 date:(id)a7 bulletinType:(unint64_t)a8 actionURL:(id)a9 bulletinContext:(id)a10 actionContext:(id)a11 interruptionLevel:(unint64_t)a12 logEventTopic:(int64_t)a13
{
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDBulletinBoard *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDBulletinBoard *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDBulletinBoard *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  __CFString **v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v71 = a3;
  v19 = a4;
  v68 = a5;
  v67 = a6;
  v66 = a7;
  v20 = a9;
  v21 = a10;
  v69 = a11;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  objc_msgSend(v21, "hmf_stringForKey:", *MEMORY[0x24BDD5388]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v23 = v21;
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v21 = v23;
    objc_msgSend(v23, "hmf_stringForKey:", CFSTR("home"));
    v28 = objc_claimAutoreleasedReturnValue();

    v70 = (void *)v28;
  }
  v65 = v21;
  v29 = (void *)objc_msgSend(v21, "mutableCopy");
  v64 = v19;
  if (!v19)
  {
    v38 = 0;
    if (!v20)
      goto LABEL_17;
    goto LABEL_14;
  }
  v30 = *MEMORY[0x24BDD7E28];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD7E28]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValue:forKey:", v31, v30);

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kCameraSessionID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValue:forKey:", v32, CFSTR("kCameraSessionID"));

  v33 = *MEMORY[0x24BDD7E20];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD7E20]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValue:forKey:", v34, v33);

  objc_msgSend(v19, "objectForKeyedSubscript:", v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBulletinBoard fileManager](self, "fileManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:fileManager:](HMDBulletinBoard, "createImageAttachmentByHardLinkingFile:fileManager:", v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x227676638]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v42;
      v74 = 2112;
      v75 = v38;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Adding attachments: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
  }
  else
  {
    v38 = 0;
  }

  if (v20)
  {
LABEL_14:
    v43 = (void *)MEMORY[0x227676638]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v46;
      v74 = 2112;
      v75 = v20;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Setting default action with URL: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    objc_msgSend(v20, "absoluteString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v47, *MEMORY[0x24BDD7120]);

  }
LABEL_17:
  LOBYTE(v48) = 0;
  switch(a8)
  {
    case 0uLL:
      v52 = &HMDBulletinCategoryNormalType;
LABEL_23:
      v49 = *v52;
      goto LABEL_32;
    case 2uLL:
      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("buttonCategory"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isEqualToNumber:", &unk_24E96AA48);

      if (!v54)
      {
        LOBYTE(v48) = 0;
        v49 = 0;
        goto LABEL_32;
      }
      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("buttonCategory"));
      v55 = objc_claimAutoreleasedReturnValue();
      if (!v55
        || (v56 = (void *)v55,
            objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("bulletinActionButtonDescription")),
            v57 = (void *)objc_claimAutoreleasedReturnValue(),
            v57,
            v56,
            !v57))
      {
        v49 = 0;
        LOBYTE(v48) = 1;
        goto LABEL_32;
      }
      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("bulletinActionButtonDescription"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setValue:forKey:", v58, CFSTR("bulletinActionButtonDescription"));

      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("buttonCategory"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setValue:forKey:", v59, CFSTR("buttonCategory"));

      LOBYTE(v48) = 1;
      v52 = HMDBulletinCategorySecureTrigger;
      goto LABEL_23;
    case 1uLL:
      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("categoryID"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("categoryID"));
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("bulletinActionButtonDescription"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v50, CFSTR("bulletinActionButtonDescription"));

        v48 = (void *)*MEMORY[0x24BDD5350];
        objc_msgSend(v69, "objectForKeyedSubscript:", *MEMORY[0x24BDD5350]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v51, v48);

        LOBYTE(v48) = 0;
      }
      else
      {
        v49 = 0;
      }
      goto LABEL_35;
  }
  v49 = 0;
LABEL_32:
  if (legacyWatchOSCategoryMap_onceToken != -1)
    dispatch_once(&legacyWatchOSCategoryMap_onceToken, &__block_literal_global_524);
  objc_msgSend(v29, "addEntriesFromDictionary:", legacyWatchOSCategoryMap_legacyWatchOSCategoryMap);
LABEL_35:
  -[HMDBulletinBoard notificationCenter](self, "notificationCenter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v63) = (_BYTE)v48;
  objc_msgSend(v60, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v71, v68, v70, v49, v67, v66, v38, v29, v63, a12, a13);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinBoard addNotificationRequest:forIdentifier:](self, "addNotificationRequest:forIdentifier:", v61, v67);
  return v61;
}

- (BOOL)_hasDuplicateBulletinForCharacteristic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBulletinBoard notificationRequestsSortedByDate](self, "notificationRequestsSortedByDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __59__HMDBulletinBoard__hasDuplicateBulletinForCharacteristic___block_invoke;
  v40[3] = &unk_24E77AA20;
  v7 = v4;
  v41 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinCategory presentationValueForValue:type:](HMDBulletinCategory, "presentationValueForValue:type:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("characteristicValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("characteristicType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinCategory presentationValueForValue:type:](HMDBulletinCategory, "presentationValueForValue:type:", v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stepValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!compareCharacteristicValue(v11, v18, (void *)4, v20))
    {
      v29 = 0;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v7, "stateNumber");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("stateNumber"));
    v24 = objc_claimAutoreleasedReturnValue();

    if (v21 | v24)
    {
      if (!HMFEqualObjects())
        goto LABEL_11;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "content");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v26);
      v28 = v27;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "content");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "date");
      v39 = v18;
      v32 = v24;
      v33 = v21;
      v34 = v11;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSinceDate:", v35);
      v28 = v36;

      v11 = v34;
      v21 = v33;
      v24 = v32;
      v18 = v39;

    }
    if (v28 < 60.0)
    {
      v29 = 1;
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v29 = 0;
    goto LABEL_12;
  }
  v29 = 0;
LABEL_14:

  return v29;
}

- (BOOL)_hasDuplicateBulletinForSnapshotCharacteristic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  char v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBulletinBoard notificationRequestsSortedByDate](self, "notificationRequestsSortedByDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__HMDBulletinBoard__hasDuplicateBulletinForSnapshotCharacteristic___block_invoke;
  v20[3] = &unk_24E77AA20;
  v7 = v4;
  v21 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  objc_msgSend(v7, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE1B558]))
    goto LABEL_7;
  objc_msgSend(v7, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE1B7B0]);

  if (!v12)
    goto LABEL_8;
  objc_msgSend(v8, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("characteristicValueUpdatedTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToDate:", v15))
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v7, "lastKnownValueUpdateTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "isEqualToDate:", v18);

  if ((v19 & 1) != 0)
  {
    v16 = 1;
    goto LABEL_9;
  }
LABEL_8:
  v16 = 0;
LABEL_9:

  return v16;
}

- (void)_updateCharacteristicTupleFor:(id)a3 withCurrentType:(id)a4 changedByThisDevice:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDBulletinBoard *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "findCharacteristicWithType:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateNumber");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_7;
  v13 = (void *)v12;
  objc_msgSend(v11, "stateNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
  objc_msgSend(v11, "stateNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = HAPCompareStateNumberWithRollover();

  if (v17 == 1)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stateNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stateNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v21;
      v40 = 2112;
      v41 = v22;
      v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Not creating tuple because target state number is stale: %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
LABEL_7:
    v37 = v11;
    objc_msgSend(v10, "contextID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard characteristicTupleKeyFromServiceContextID:currentType:](HMDBulletinBoard, "characteristicTupleKeyFromServiceContextID:currentType:", v24, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDBulletinBoard characteristicTuples](self, "characteristicTuples");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v27, "targetValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = +[HMDBulletinBoard presentationValueOfCharacteristic:equalTo:](HMDBulletinBoard, "presentationValueOfCharacteristic:equalTo:", v7, v28);

      if (v29)
        objc_msgSend(v27, "changedByThisDevice");
    }
    objc_msgSend(v7, "value");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "type");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinCategory presentationValueForValue:type:](HMDBulletinCategory, "presentationValueForValue:type:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      objc_msgSend(v7, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "contextID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stateNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinCharacteristicTuple tupleWithServiceContextID:currentType:targetValue:targetStateNumber:changedByThisDevice:](HMDBulletinCharacteristicTuple, "tupleWithServiceContextID:currentType:targetValue:targetStateNumber:changedByThisDevice:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBulletinBoard characteristicTuples](self, "characteristicTuples");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v25);

    v11 = v37;
  }

}

- (BOOL)_shouldSkipBulletinForChangedCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1B570]) & 1) != 0)
  {
    objc_msgSend(v4, "bulletinBoardNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationServiceGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
LABEL_19:
      v23 = 1;
      goto LABEL_31;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE1B558]))
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE1B7B0]) & 1) == 0)
  {

    goto LABEL_10;
  }
  objc_msgSend(v4, "bulletinBoardNotification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notificationServiceGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cameraProfiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
    goto LABEL_19;
LABEL_11:
  objc_msgSend(v3, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE1B4A8]))
  {
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v4, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("00000260-0000-1000-8000-0026BB765291")) & 1) == 0)
  {

    goto LABEL_16;
  }
  objc_msgSend(v3, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  if (v19)
    goto LABEL_19;
LABEL_17:
  objc_msgSend(v3, "type");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BE1B4E0]) & 1) != 0)
  {
    objc_msgSend(v3, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    if (v22 == 3)
      goto LABEL_19;
  }
  else
  {

  }
  objc_msgSend(v3, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE1B500]))
  {
    objc_msgSend(v3, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "integerValue"))
    {
      objc_msgSend(v3, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "integerValue") == 1)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v3, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v27, "integerValue") != 2;

      }
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

LABEL_31:
  return v23;
}

- (BOOL)_shouldPostBulletinOnCurrentValueChangeForCharacteristic:(id)a3 includeChangeFromNil:(BOOL)a4
{
  __CFString *v6;
  NSObject *v7;
  void *v8;
  HMDBulletinBoard *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDBulletinBoard *v29;
  NSObject *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  HMDBulletinBoard *v59;
  NSObject *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  HMDBulletinBoard *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  _QWORD v76[4];
  __CFString *v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[HMDBulletinBoard _shouldSkipBulletinForChangedCharacteristic:](self, "_shouldSkipBulletinForChangedCharacteristic:", v6))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v11;
      v80 = 2112;
      v81 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping bulletin for characteristic: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_9;
  }
  if (a4)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    -[__CFString previousValue](v6, "previousValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = v13 == 0;

  }
  +[HMDBulletinCategory targetCurrentCharacteristicTypeMap](HMDBulletinCategory, "targetCurrentCharacteristicTypeMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString type](v6, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[__CFString service](v6, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contextID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString type](v6, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard characteristicTupleKeyFromServiceContextID:currentType:](HMDBulletinBoard, "characteristicTupleKeyFromServiceContextID:currentType:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    -[HMDBulletinBoard characteristicTuples](self, "characteristicTuples");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)v22;
    objc_msgSend(v23, "objectForKeyedSubscript:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v12)
          v32 = CFSTR("not post");
        else
          v32 = CFSTR("post");
        -[__CFString instanceID](v6, "instanceID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString value](v6, "value");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v73 = v12;
        v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v79 = v31;
        v80 = 2112;
        v81 = v32;
        v82 = 2112;
        v83 = v33;
        v84 = 2112;
        v85 = v34;
        v86 = 2112;
        v87 = v35;
        v88 = 2112;
        v89 = v12;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Should %@ bulletin for characteristic instanceId: %@ value:%@ includeChangeFromNil: %@ because tuple not present and initial update is %@", buf, 0x3Eu);

        LOBYTE(v12) = v73;
      }

      objc_autoreleasePoolPop(v28);
      LOBYTE(v17) = v12 ^ 1;
      v24 = 0;
      goto LABEL_51;
    }
    v25 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v24, "targetValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v25, "arrayWithObject:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "arrayWithObject:", v36);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[__CFString type](v6, "type");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BE1B500]);

    if (v38)
    {
      objc_msgSend(v27, "arrayByAddingObject:", &unk_24E96AA60);
      v39 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v39;
    }
    objc_msgSend(v24, "targetStateNumber");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stateNumber](v6, "stateNumber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = HAPCompareStateNumberWithRollover();

    v72 = v27;
    if (v42 == 1)
    {
      LOBYTE(v17) = 0;
LABEL_46:
      v58 = (void *)MEMORY[0x227676638]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = CFSTR("same/newer");
        if (v42 == 1)
          v61 = CFSTR("older");
        v69 = v61;
        objc_msgSend(v24, "targetValue");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "targetStateNumber");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "changedByThisDevice");
        HMFBooleanToString();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v70 = v59;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545410;
        v79 = v71;
        v80 = 2112;
        v81 = v69;
        v82 = 2112;
        v83 = v68;
        v84 = 2112;
        v85 = v67;
        v86 = 2112;
        v87 = v62;
        v88 = 2112;
        v89 = (uint64_t)v63;
        v90 = 2112;
        v91 = v64;
        v92 = 2112;
        v93 = v65;
        v94 = 2112;
        v95 = v66;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@Should post bulletin: Target/Current - Current is: %@, Cached Target Value: %@ Cached Target State: %@ waitForTargetMatch: %@ changedByThisDevice: %@ initialUpdate: %@, shouldPostBulletin: %@, includeChangeFromNil: %@", buf, 0x5Cu);

        v59 = v70;
      }

      objc_autoreleasePoolPop(v58);
LABEL_51:

      goto LABEL_10;
    }
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __98__HMDBulletinBoard__shouldPostBulletinOnCurrentValueChangeForCharacteristic_includeChangeFromNil___block_invoke;
    v76[3] = &unk_24E7979C8;
    v43 = v6;
    v77 = v43;
    if (objc_msgSend(v27, "na_any:", v76))
    {
      v17 = (objc_msgSend(v24, "changedByThisDevice") | v12) ^ 1;
      -[__CFString type](v43, "type");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BE1B4E0]))
      {
        -[__CFString value](v43, "value");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "integerValue") == 2)
        {
          v74 = v24;
          objc_msgSend(v24, "targetValue");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "integerValue");

          if (!v47)
          {
            v24 = v74;
            goto LABEL_45;
          }
          v24 = v74;
          goto LABEL_44;
        }

      }
LABEL_44:
      -[HMDBulletinBoard characteristicTuples](self, "characteristicTuples");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "removeObjectForKey:", v75);

      goto LABEL_45;
    }
    v48 = v42;
    objc_msgSend(v24, "targetStateNumber");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = (void *)v49;
      -[__CFString stateNumber](v43, "stateNumber");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (!v51 || v42)
      {

      }
      else
      {
        v53 = objc_msgSend(v24, "changedByThisDevice");

        if (!v53)
          goto LABEL_40;
      }
    }
    objc_msgSend(v24, "targetValue");
    v54 = objc_claimAutoreleasedReturnValue();
    if (!v54 || (v55 = (void *)v54, v56 = objc_msgSend(v24, "changedByThisDevice"), v55, v56))
    {
      v42 = v48;
      if ((objc_msgSend(v24, "changedByThisDevice") & 1) == 0)
      {
        LOBYTE(v17) = 1;
        goto LABEL_44;
      }
      LOBYTE(v17) = 0;
LABEL_45:

      goto LABEL_46;
    }
LABEL_40:
    LOBYTE(v17) = 0;
    v42 = v48;
    goto LABEL_45;
  }
LABEL_9:
  LOBYTE(v17) = 0;
LABEL_10:

  return v17;
}

- (BOOL)_updateDoorbellPressNotificationsWithSignificantEventBulletin:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  HMDBulletinBoard *v12;
  NSObject *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  char v40;
  id v41;
  void *v42;
  HMDBulletinBoard *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDBulletinBoard *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v67;
  void *v68;
  void *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  HMDBulletinBoard *v75;
  void *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoard _doorbellPressNotificationsNearDate:forCameraProfile:](self, "_doorbellPressNotificationsNearDate:forCameraProfile:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hmf_isEmpty");
  v10 = v9;
  if ((v9 & 1) == 0)
  {
    v67 = v9;
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v14;
      v84 = 2112;
      v85 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Found recent doorbell press notifications to update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v68 = v8;
    obj = v8;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
    if (v72)
    {
      v71 = *(_QWORD *)v79;
      v74 = *MEMORY[0x24BDD7E28];
      v73 = v4;
      v75 = v12;
      do
      {
        for (i = 0; i != v72; ++i)
        {
          if (*(_QWORD *)v79 != v71)
            objc_enumerationMutation(obj);
          v76 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v76, "content");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");

          objc_msgSend(v4, "previewImageFilePathURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v4, "previewImageFilePathURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v4, "previewImageFilePathURL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDBulletinBoard fileManager](v12, "fileManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "heroFrameStoreDirectoryURL");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[HMDBulletinBoard _copyItemAtURL:toDirectory:](v75, "_copyItemAtURL:toDirectory:", v20, v22);

              v12 = v75;
            }
            else
            {
              v23 = 0;
            }

            objc_msgSend(v23, "filePathURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDBulletinBoard fileManager](v12, "fileManager");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:fileManager:](HMDBulletinBoard, "createImageAttachmentByHardLinkingFile:fileManager:", v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAttachments:", v33);

            objc_msgSend(v17, "userInfo");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v74);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "userInfo");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v35, "mutableCopy");

            objc_msgSend(v23, "filePathURL");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "path");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v37, v74);

            objc_msgSend(v17, "setUserInfo:", v30);
            if (v29)
            {
              objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v29);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDBulletinBoard fileManager](v12, "fileManager");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = 0;
              v40 = objc_msgSend(v39, "removeItemAtURL:error:", v38, &v77);
              v41 = v77;

              if ((v40 & 1) == 0)
              {
                v42 = (void *)MEMORY[0x227676638]();
                v43 = v75;
                HMFGetOSLogHandle();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v69 = v42;
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v83 = v45;
                  v84 = 2112;
                  v85 = v38;
                  v86 = 2112;
                  v87 = v41;
                  _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove old notification image: %@ with error: %@", buf, 0x20u);

                  v42 = v69;
                }

                objc_autoreleasePoolPop(v42);
              }

              v4 = v73;
              v12 = v75;
            }
            else
            {
              v4 = v73;
            }
          }
          else
          {
            objc_msgSend(v17, "userInfo");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v74);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
              goto LABEL_23;
            v26 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(v17, "userInfo");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v74);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "fileURLWithPath:", v28);
            v23 = (id)objc_claimAutoreleasedReturnValue();

            -[HMDBulletinBoard fileManager](v12, "fileManager");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:fileManager:](HMDBulletinBoard, "createImageAttachmentByHardLinkingFile:fileManager:", v23, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAttachments:", v30);
          }

LABEL_23:
          objc_msgSend(v17, "date");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "significantEvents");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBulletinBoard _submitDoorbellEventDetailsFromBulletinWithDate:significantEvents:](v12, "_submitDoorbellEventDetailsFromBulletinWithDate:significantEvents:", v46, v47);

          objc_msgSend(v4, "significantEvents");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v47) = objc_msgSend(v48, "na_any:", &__block_literal_global_258);

          if ((_DWORD)v47)
          {
            objc_msgSend(v17, "userInfo");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(v49, "mutableCopy");

            objc_msgSend(v4, "userInfo");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDBulletinBoard _updateDoorbellUserInfo:withSignificantEventUserInfo:](v12, "_updateDoorbellUserInfo:withSignificantEventUserInfo:", v50, v51);

            objc_msgSend(v17, "setUserInfo:", v50);
          }
          -[HMDBulletinBoard doorbellBulletinUtilities](v12, "doorbellBulletinUtilities");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "date");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "camera");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "significantEventsRelevantToDoorbellPress:forCameraProfile:", v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDBulletinBoard doorbellBulletinUtilities](v12, "doorbellBulletinUtilities");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "localizedDoorbellMessageForSignificantEvents:", v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBody:", v57);

          v58 = (void *)MEMORY[0x227676638]();
          v59 = v12;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "body");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "userInfo");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "attachments");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v83 = v61;
            v84 = 2112;
            v85 = v76;
            v86 = 2112;
            v87 = v62;
            v88 = 2112;
            v89 = v63;
            v90 = 2112;
            v91 = v64;
            _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@Updating doorbell press notification %@ with body: %@, userInfo: %@, attachments: %@", buf, 0x34u);

            v4 = v73;
          }

          objc_autoreleasePoolPop(v58);
          objc_msgSend(v76, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBulletinBoard updateContent:forNotificationWithRequestIdentifier:](v59, "updateContent:forNotificationWithRequestIdentifier:", v17, v65);

          v12 = v75;
        }
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
      }
      while (v72);
    }

    v8 = v68;
    v10 = v67;
  }

  return v10 ^ 1;
}

- (void)updateMessageForDoorbellPressNotificationRequestWithIdentifier:(id)a3 cameraProfile:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDBulletinBoard *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  HMDBulletinBoard *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[HMDBulletinBoard doorbellBulletinUtilities](self, "doorbellBulletinUtilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "significantEventsRelevantToDoorbellPress:forCameraProfile:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBulletinBoard _submitDoorbellEventDetailsFromBulletinWithDate:significantEvents:](self, "_submitDoorbellEventDetailsFromBulletinWithDate:significantEvents:", v16, v15);

    -[HMDBulletinBoard doorbellBulletinUtilities](self, "doorbellBulletinUtilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDoorbellMessageForSignificantEvents:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBody:", v18);

    objc_msgSend(v12, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BDD7E28];
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD7E28]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v12, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fileURLWithPath:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDBulletinBoard fileManager](self, "fileManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:fileManager:](HMDBulletinBoard, "createImageAttachmentByHardLinkingFile:fileManager:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttachments:", v27);

    }
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "body");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userInfo");
      v41 = v7;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attachments");
      v40 = v15;
      v34 = v6;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v43 = v31;
      v44 = 2112;
      v45 = v10;
      v46 = 2112;
      v47 = v32;
      v48 = 2112;
      v49 = v33;
      v50 = 2112;
      v51 = v35;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating doorbell press notification %@ with body: %@, userInfo: %@, attachments: %@", buf, 0x34u);

      v6 = v34;
      v15 = v40;

      v7 = v41;
    }

    objc_autoreleasePoolPop(v28);
    -[HMDBulletinBoard updateContent:forNotificationWithRequestIdentifier:](v29, "updateContent:forNotificationWithRequestIdentifier:", v12, v6);

  }
  else
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v39;
      v44 = 2112;
      v45 = v6;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Did not find request with identifier: %@, so doing nothing", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
  }

}

- (id)notificationRequestsForCameraClipUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__HMDBulletinBoard_notificationRequestsForCameraClipUUIDs___block_invoke;
  v11[3] = &unk_24E77AA68;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v4, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_doorbellPressNotificationsNearDate:(id)a3 forCameraProfile:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDBulletinBoard notificationRequests](self, "notificationRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__HMDBulletinBoard__doorbellPressNotificationsNearDate_forCameraProfile___block_invoke;
  v15[3] = &unk_24E77AA90;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "na_filter:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_copyItemAtURL:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  HMDBulletinBoard *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDBulletinBoard *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  uint8_t buf[4];
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
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDBulletinBoard fileManager](self, "fileManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v30);
  v11 = v30;

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("jpg"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBulletinBoard fileManager](self, "fileManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    v17 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v6, v15, &v29);
    v18 = v29;

    if ((v17 & 1) != 0)
    {
      v19 = v15;
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
        *(_DWORD *)buf = 138544130;
        v32 = v27;
        v33 = 2112;
        v34 = v6;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to item from %@ to %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v24);
      v19 = 0;
    }

    v11 = v18;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v23;
      v33 = 2112;
      v34 = v7;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

- (void)_submitDoorbellEventDetailsFromBulletinWithDate:(id)a3 significantEvents:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  HMDFamiliarFacesBulletinLogEvent *v22;
  HMDFamiliarFacesBulletinLogEvent *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "na_filter:", &__block_literal_global_262);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_map:", &__block_literal_global_264_37870);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_266);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateOfOccurrence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceDate:", v24);
    v15 = v14;
  }
  else
  {
    v15 = 0.0;
  }
  objc_msgSend(v9, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_map:", &__block_literal_global_268);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v9, "count") != 0;
  v19 = objc_msgSend(v17, "count");
  v20 = objc_msgSend(v9, "count") - v19;
  -[HMDBulletinBoard logEventSubmitter](self, "logEventSubmitter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [HMDFamiliarFacesBulletinLogEvent alloc];
  v23 = -[HMDFamiliarFacesBulletinLogEvent initWithContainsFaceClassification:numberOfKnownPersons:numberOfUnknownPersons:bulletinReason:doorbellPressed:secondsFromDoorbellToFaceClassification:](v22, "initWithContainsFaceClassification:numberOfKnownPersons:numberOfUnknownPersons:bulletinReason:doorbellPressed:secondsFromDoorbellToFaceClassification:", v18, v19, v20, *MEMORY[0x24BDD53A0], 1, v15);
  objc_msgSend(v21, "submitLogEvent:", v23);

}

- (void)_submitCameraClipSignificantEventDetailsFromBulletin:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HMDFamiliarFacesBulletinLogEvent *v13;
  HMDFamiliarFacesBulletinLogEvent *v14;
  id v15;

  v4 = a3;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "significantEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_map:", &__block_literal_global_270);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_271);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v15, "count") != 0;
  v10 = objc_msgSend(v8, "count");
  v11 = objc_msgSend(v15, "count") - v10;
  -[HMDBulletinBoard logEventSubmitter](self, "logEventSubmitter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [HMDFamiliarFacesBulletinLogEvent alloc];
  v14 = -[HMDFamiliarFacesBulletinLogEvent initWithContainsFaceClassification:numberOfKnownPersons:numberOfUnknownPersons:bulletinReason:doorbellPressed:secondsFromDoorbellToFaceClassification:](v13, "initWithContainsFaceClassification:numberOfKnownPersons:numberOfUnknownPersons:bulletinReason:doorbellPressed:secondsFromDoorbellToFaceClassification:", v9, v10, v11, *MEMORY[0x24BDD53B8], 0, 0.0);
  objc_msgSend(v12, "submitLogEvent:", v14);

}

- (void)_updateDoorbellUserInfo:(id)a3 withSignificantEventUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDBulletinBoard *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD7120];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD7120]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  v12 = *MEMORY[0x24BDD5348];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD5348]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v12);

  v14 = *MEMORY[0x24BDD5358];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD5358]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

  v16 = *MEMORY[0x24BDD5340];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD5340]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v16);

  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v21;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Merging user info: %@ from significant event notification into doorbell notification", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v6, "addEntriesFromDictionary:", v9);

}

- (void)_handleDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBulletinBoard *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  void *v39;
  HMDBulletinBoard *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMDBulletinBoard *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v16;
    v55 = 2112;
    v56 = v6;
    v57 = 2112;
    v58 = v12;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Did receive notification response: %@ with context: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v6, "notification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "content");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "categoryIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "isEqualToString:", CFSTR("HomeAppBulletinCategory")))
  {
    objc_msgSend(v6, "actionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDF8A70]);

    if (v22)
    {
      objc_msgSend(v6, "notification");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "request");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBulletinBoard removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:](v14, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v26, 1);

LABEL_23:
      v7[2](v7);
      goto LABEL_24;
    }
  }
  if (!objc_msgSend(v20, "isEqualToString:", CFSTR("HMDBBSecureTrigger")))
    goto LABEL_23;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("home.uuid.internal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("trigger.uuid.internal"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionIdentifier");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v27 && v28 && v29)
  {
    v48 = (void *)v29;
    v49 = v28;
    -[HMDBulletinBoard homeManager](v14, "homeManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v27);
    objc_msgSend(v31, "_homeWithUUID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v49);
      v35 = v33;
      objc_msgSend(v33, "triggerWithUUID:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v30 = v48;
        v37 = objc_msgSend(v48, "isEqualToString:", CFSTR("trigger_execute"));
        v50[0] = MEMORY[0x24BDAC760];
        v50[1] = 3221225472;
        v50[2] = __76__HMDBulletinBoard__handleDidReceiveNotificationResponse_completionHandler___block_invoke;
        v50[3] = &unk_24E79BCC8;
        v50[4] = v14;
        v51 = v36;
        objc_msgSend(v51, "userDidConfirmExecute:completionHandler:", v37, v50);

        v38 = 0;
      }
      else
      {
        v43 = (void *)MEMORY[0x227676638]();
        v47 = v14;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v30 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = v43;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v45;
          v55 = 2112;
          v56 = v49;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@No trigger with UUID %@ found", buf, 0x16u);

          v43 = v46;
        }

        objc_autoreleasePoolPop(v43);
        v7[2](v7);
        v38 = 1;
      }
      v28 = v49;

    }
    else
    {
      v35 = 0;
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v14;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v42;
        v55 = 2112;
        v56 = v27;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@No home with UUID %@ found", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      v7[2](v7);
      v38 = 1;
      v30 = v48;
      v28 = v49;
    }

  }
  else
  {
    v7[2](v7);
    v38 = 1;
  }

  if (!v38)
    goto LABEL_23;
LABEL_24:

}

- (void)notificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HMDBulletinBoard workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__HMDBulletinBoard_notificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)notificationCategories
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NAFuture)isConfiguredFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDUserNotificationCenter)notificationCenter
{
  return (HMDUserNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)notificationRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNotificationRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)characteristicTuples
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (Class)persistentStoreClass
{
  return (Class)objc_getProperty(self, a2, 72, 1);
}

- (void)setPersistentStoreClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMDDoorbellBulletinUtilities)doorbellBulletinUtilities
{
  return (HMDDoorbellBulletinUtilities *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDoorbellBulletinUtilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLogEventSubmitter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_doorbellBulletinUtilities, 0);
  objc_storeStrong((id *)&self->_persistentStoreClass, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_characteristicTuples, 0);
  objc_storeStrong((id *)&self->_notificationRequests, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_isConfiguredFuture, 0);
  objc_storeStrong((id *)&self->_notificationCategories, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

uint64_t __92__HMDBulletinBoard_notificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidReceiveNotificationResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __76__HMDBulletinBoard__handleDidReceiveNotificationResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Trigger execution error after user confirms: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    +[HMDBulletinUIManager presentExecutionErrorDialogForTrigger:partialSuccess:](HMDBulletinUIManager, "presentExecutionErrorDialogForTrigger:partialSuccess:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "code") == 64);
  }

}

id __73__HMDBulletinBoard__submitCameraClipSignificantEventDetailsFromBulletin___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __73__HMDBulletinBoard__submitCameraClipSignificantEventDetailsFromBulletin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceClassification");
}

id __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceClassification");
}

BOOL __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "faceClassification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __73__HMDBulletinBoard__doorbellPressNotificationsNearDate_forCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;

  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD53A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD53A0]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 32), -30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 32), 30.0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v9;
  if (objc_msgSend(v11, "compare:", v8) == 1)
  {
    objc_msgSend(v3, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v23 = v8;
    v13 = v6;
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "compare:", v9) == -1;

    v7 = v14;
    v6 = v13;
    v8 = v23;

  }
  else
  {
    v16 = 0;
  }

  objc_msgSend(v3, "content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDD5350]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v21, "isEqualToString:", v19);

  return v7 & v18 & v16;
}

id __59__HMDBulletinBoard_notificationRequestsForCameraClipUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __82__HMDBulletinBoard__updateDoorbellPressNotificationsWithSignificantEventBulletin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason") == 2;
}

BOOL __98__HMDBulletinBoard__shouldPostBulletinOnCurrentValueChangeForCharacteristic_includeChangeFromNil___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {

    v3 = 0;
  }
  v5 = +[HMDBulletinBoard presentationValueOfCharacteristic:equalTo:](HMDBulletinBoard, "presentationValueOfCharacteristic:equalTo:", *(_QWORD *)(a1 + 32), v3);

  return v5;
}

uint64_t __67__HMDBulletinBoard__hasDuplicateBulletinForSnapshotCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characteristic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contextID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

uint64_t __59__HMDBulletinBoard__hasDuplicateBulletinForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characteristic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contextID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

void __115__HMDBulletinBoard_insertUserPreferredHomeHubReachabilityBulletinForHome_reachable_electedPrimary_previousPrimary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("HOME_USER_PREFERRED_HUB_REACHABLE_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v53, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v53;

    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v55 = v11;
        v56 = 2112;
        v57 = CFSTR("HOME_USER_PREFERRED_HUB_REACHABLE_TITLE");
        v58 = 2112;
        v59 = CFSTR("%@");
        v60 = 2112;
        v61 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      v8 = CFSTR("HOME_USER_PREFERRED_HUB_REACHABLE_TITLE");
    }
    v50 = v8;

    v12 = (void *)MEMORY[0x24BDD17C8];
    if (*(_BYTE *)(a1 + 64))
    {
      HMDLocalizedStringForKey(CFSTR("HOME_USER_PREFERRED_HUB_REACHABLE_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      objc_msgSend(v12, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), &v52, *(_QWORD *)(a1 + 48));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = v52;

      if (!v14)
      {
        v16 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("HOME_USER_PREFERRED_HUB_REACHABLE_MESSAGE");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v55 = v18;
          v56 = 2112;
          v57 = CFSTR("HOME_USER_PREFERRED_HUB_REACHABLE_MESSAGE");
          v58 = 2112;
          v59 = CFSTR("%@");
          v60 = 2112;
          v61 = v15;
LABEL_17:
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
    }
    else
    {
      HMDLocalizedStringForKey(CFSTR("HOME_USER_PREFERRED_HUB_NOT_REACHABLE_MESSAGE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v12, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@ %@"), &v51, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = v51;

      if (!v14)
      {
        v16 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("HOME_USER_PREFERRED_HUB_NOT_REACHABLE_MESSAGE");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v55 = v18;
          v56 = 2112;
          v57 = CFSTR("HOME_USER_PREFERRED_HUB_NOT_REACHABLE_MESSAGE");
          v58 = 2112;
          v59 = CFSTR("%@ %@");
          v60 = 2112;
          v61 = v15;
          goto LABEL_17;
        }
LABEL_18:

        objc_autoreleasePoolPop(v16);
        v24 = 0;
        goto LABEL_19;
      }
    }
    v24 = v14;
LABEL_19:
    v25 = v14;

    v26 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tupleWithQueryType:uuidString:", 0, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    v49 = (void *)v29;
    generateURLForHomeKitObject();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v32;
    objc_msgSend(v32, "absoluteString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BDD7120]);

    v36 = (void *)MEMORY[0x227676638]();
    v37 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v39;
      v56 = 2112;
      v57 = v50;
      v58 = 2112;
      v59 = v25;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Inserting new bulletin with title: %@, message: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v31;
    v44 = (void *)objc_msgSend(v31, "copy");
    LOBYTE(v46) = 0;
    objc_msgSend(v40, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v50, v25, v42, CFSTR("HMDBBNormalType"), v34, v43, 0, v44, v46, 1, 10);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v45, v34);
    return;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertHomeResidentSelectionUserPreferredReachable", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
}

void __117__HMDBulletinBoard_insertBulletinForLockUserChange_lockDataType_dataOperationType_ecosystemName_isAffectedUser_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Inserting new bulletin with message=%@, requestIdentifier=%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  objc_msgSend(v9, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v10, v12, v11, CFSTR("HMDBBNormalType"), v13, v14, 0, *(_QWORD *)(a1 + 80), v16, 1, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v15, *(_QWORD *)(a1 + 56));
}

void __104__HMDBulletinBoard_insertBulletinForLockOperation_userDisplayName_lockOperationType_ecosystemName_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Inserting new bulletin with message=%@, reason=%@, requestIdentifier=%@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = 0;
  objc_msgSend(v10, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v13, v11, v12, CFSTR("HMDBBNormalType"), v14, v15, 0, *(_QWORD *)(a1 + 88), v17, 1, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v16, *(_QWORD *)(a1 + 64));
}

void __66__HMDBulletinBoard_insertBulletinForDoorLockAlarm_alarmCode_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    v28 = v5;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Inserting new bulletin with message=%@, requestIdentifier=%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = 0;
  objc_msgSend(v9, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v10, v12, v11, CFSTR("HMDBBNormalType"), v13, v14, 0, *(_QWORD *)(a1 + 80), v26, 1, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 88), "lastLockOperationEventRequestIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "lastLockOperationEventRequestIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Event is replacing last lock operation event with requestIdentifier=%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v23 = *(void **)(a1 + 32);
    objc_msgSend(v15, "content");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "lastLockOperationEventRequestIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateContent:forNotificationWithRequestIdentifier:", v24, v25);

    objc_msgSend(*(id *)(a1 + 88), "setLastLockOperationEventRequestIdentifier:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v15, *(_QWORD *)(a1 + 56));
  }

}

void __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
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
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context to result: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v5, "userUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "users");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke_201;
      v18[3] = &unk_24E799728;
      v19 = v5;
      objc_msgSend(v14, "na_firstObjectPassingTest:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "isCurrentUser");
    }
    objc_msgSend(*(id *)(a1 + 48), "displayNameForNotificationContextResolutionResult:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to resolve notification context with error: %@, creating bulletin without display name", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke_201(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __85__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic_attributedUser___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5 || (v10 = *(void **)(a1 + 32)) == 0)
  {
    if (!a3)
    {
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __85__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic_attributedUser___block_invoke_197;
      block[3] = &unk_24E77A980;
      v12 = *(id *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 40);
      v17 = v12;
      v18 = v13;
      v5 = v5;
      v19 = v5;
      v20 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 64);
      v22 = *(id *)(a1 + 72);
      v23 = *(id *)(a1 + 80);
      v14 = *(id *)(a1 + 88);
      v15 = *(_QWORD *)(a1 + 96);
      v24 = v14;
      v25 = v15;
      dispatch_async(v11, block);

      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v10, "displayName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "isCurrentUser") & 1) == 0)
      goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context to current user, skipping bulletin", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
LABEL_9:

}

void __85__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic_attributedUser___block_invoke_197(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD5850]);

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD5818]);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "messageForGarageDoorCharacteristic:personName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 40), "messageForGarageDoorCharacteristic:personName:", *(_QWORD *)(a1 + 32), CFSTR("<redacted>"));
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
LABEL_17:
      v13 = v5;
      v6 = v13;
      v7 = 8;
LABEL_18:
      v5 = v13;
      if (v13)
        goto LABEL_19;
LABEL_23:
      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = v26;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic value does not require bulletin: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v5 = 0;
      goto LABEL_26;
    }
    objc_msgSend(*(id *)(a1 + 32), "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD5870]);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "messageForSecuritySystemCharacteristic:personName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_17;
      objc_msgSend(*(id *)(a1 + 40), "messageForSecuritySystemCharacteristic:personName:", *(_QWORD *)(a1 + 32), CFSTR("<redacted>"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD5860]);

      if (!v15)
      {
        v6 = 0;
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(a1 + 40), "messageForWindowCharacteristic:personName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_17;
      objc_msgSend(*(id *)(a1 + 40), "messageForWindowCharacteristic:personName:", *(_QWORD *)(a1 + 32), CFSTR("<redacted>"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    v6 = (void *)v10;
    v7 = 8;
    if (!v5)
      goto LABEL_23;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 40), "messageForLockCharacteristic:personName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!*(_QWORD *)(a1 + 48))
  {
    v13 = v4;
    v6 = v13;
    v7 = 12;
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "messageForLockCharacteristic:personName:", *(_QWORD *)(a1 + 32), CFSTR("<redacted>"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 12;
  if (!v5)
    goto LABEL_23;
LABEL_19:
  v16 = (void *)MEMORY[0x227676638]();
  v17 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v28 = v19;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Inserting new bulletin with message: %@, userInfo: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v21 = (id)objc_msgSend(*(id *)(a1 + 40), "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", *(_QWORD *)(a1 + 64), 0, v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 96), v7);
LABEL_26:

}

void __107__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_attributedUsers_snapshotData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud pull succeeded, updating notification", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "updateMessageForDoorbellPressNotificationRequestWithIdentifier:cameraProfile:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __107__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_attributedUsers_snapshotData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("HMDBulletinContextDidDetectedPerson"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

uint64_t __107__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_attributedUsers_snapshotData_completion___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __85__HMDBulletinBoard_removeRedundantSignificantEventNotificationsForSignificantEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __50__HMDBulletinBoard_removeBulletinsUsingPredicate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __38__HMDBulletinBoard_removeAllBulletins__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cullBulletinsToCount:", 0);
}

void __47__HMDBulletinBoard_removeBulletinWithRecordID___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v2, 1);

}

void __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x24BDD1758];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke_2;
  v4[3] = &unk_24E77A878;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "predicateWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeBulletinsUsingPredicate:", v3);

}

uint64_t __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD5358]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD5350]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextSPIUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x24BDD1758];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke_2;
  v4[3] = &unk_24E77A878;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "predicateWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeBulletinsUsingPredicate:", v3);

}

uint64_t __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5);
  return v6;
}

void __46__HMDBulletinBoard_removeBulletinsForService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x24BDD1758];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HMDBulletinBoard_removeBulletinsForService___block_invoke_2;
  v4[3] = &unk_24E77A878;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "predicateWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeBulletinsUsingPredicate:", v3);

}

uint64_t __46__HMDBulletinBoard_removeBulletinsForService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contextID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

void __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x24BDD1758];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke_2;
  v4[3] = &unk_24E77A878;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "predicateWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeBulletinsUsingPredicate:", v3);

}

uint64_t __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x24BDD1758];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke_2;
  v4[3] = &unk_24E77A878;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "predicateWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeBulletinsUsingPredicate:", v3);

}

uint64_t __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "contextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __42__HMDBulletinBoard_refreshHomeBadgeNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v23 = v6;
    v9 = v5;
    v10 = objc_msgSend(v7, "numberOfPendingIncomingInvitation");
    v11 = objc_msgSend(v8, "numberOfAccessoryWithNewFirmwareAvailable");
    v12 = v11 + v10;
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v16;
      v26 = 2048;
      v27 = v10;
      v28 = 2048;
      v29 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Refreshing home badge number to %lu (invitation) + %lu (firmware update).", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v5 = v9;
    v6 = v23;
    if ((v12 & 0x8000000000000000) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBadgeNumber:", v12);

      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Home manager is not yet configured, bailing refreshHomeBadgeNumber.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

void __65__HMDBulletinBoard_insertNewRMVLanguageBulletinForHome_language___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v58 = v6;
    v59 = v5;
    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x24BDD5370]);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_NEW_RMV_LANGUAGE_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), &v61, *(_QWORD *)(a1 + 48));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v61;

    v14 = v12;
    if (!v12)
    {
      v15 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v63 = v17;
        v64 = 2112;
        v65 = CFSTR("BULLETIN_NEW_RMV_LANGUAGE_TITLE");
        v66 = 2112;
        v67 = CFSTR("%@");
        v68 = 2112;
        v69 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v15);
      v14 = CFSTR("BULLETIN_NEW_RMV_LANGUAGE_TITLE");
    }
    v56 = v14;

    v18 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_NEW_RMV_LANGUAGE_MESSAGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), &v60, *(_QWORD *)(a1 + 48));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = v60;

    v22 = v20;
    if (!v20)
    {
      v23 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = v9;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v63 = v26;
        v64 = 2112;
        v65 = CFSTR("BULLETIN_NEW_RMV_LANGUAGE_MESSAGE");
        v66 = 2112;
        v67 = CFSTR("%@");
        v68 = 2112;
        v69 = v21;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        v9 = v25;
      }

      objc_autoreleasePoolPop(v23);
      v22 = CFSTR("BULLETIN_NEW_RMV_LANGUAGE_MESSAGE");
    }
    v27 = v22;

    v28 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v28, "setScheme:", CFSTR("com.apple.Home-private"));
    objc_msgSend(v28, "setHost:", CFSTR("recognizeMyVoiceOptIn"));
    v57 = (void *)v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("showEnablementSheet=YES&homeId=%@"), v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setQuery:", v29);

    v55 = v28;
    objc_msgSend(v28, "URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");

    v54 = v30;
    objc_msgSend(v30, "absoluteString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BDD7120]);

    v34 = (void *)MEMORY[0x227676638]();
    v35 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v37;
      v64 = 2112;
      v65 = v27;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Inserting new RMV language bulletin with message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v43 = a1;
    v44 = v27;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v32;
    v46 = (void *)objc_msgSend(v32, "copy");
    LOBYTE(v52) = 0;
    objc_msgSend(v40, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v56, v44, v42, CFSTR("HMDBBNormalType"), v39, v45, 0, v46, v52, 1, 16);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v43 + 32), "addNotificationRequest:forIdentifier:", v47, v39);
    v6 = v58;
    v5 = v59;
  }
  else
  {
    v48 = (void *)MEMORY[0x227676638]();
    v49 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v51;
      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert new RMV language bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v48);
  }

}

void __67__HMDBulletinBoard_fetchAreUserNotificationsEnabledWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAreUserNotificationsEnabledWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __92__HMDBulletinBoard_updateDoorbellPressNotificationsWithSignificantEventBulletin_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateDoorbellPressNotificationsWithSignificantEventBulletin:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__HMDBulletinBoard_insertBulletinsForMatterFirmwareUpdateInstalledInHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *WeakRetained;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t i;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  id v52;
  __CFString *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  const char *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  __CFString *v80;
  __CFString *v81;
  void *v82;
  __CFString *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  id v96;
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v71 = a2;
  v70 = a3;
  WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!WeakRetained)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v90 = v64;
      v65 = "%{public}@Update bulletin for stale home object; returning early.";
LABEL_37:
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v65, buf, 0xCu);

    }
LABEL_38:

    objc_autoreleasePoolPop(v6);
    goto LABEL_43;
  }
  if (v9)
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v90 = v10;
    v91 = 2112;
    v92 = WeakRetained;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin for firmware update installed in home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v90 = v64;
      v65 = "%{public}@Home manager is not yet configured, bailing updateBulletinForFirmwareUpdateInHome.";
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  -[__CFString matterAccessoriesWithNewFirmwareInstalledInHome](WeakRetained, "matterAccessoriesWithNewFirmwareInstalledInHome");
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  if (!v76)
    goto LABEL_42;
  v75 = *(_QWORD *)v86;
  v74 = a1;
  while (2)
  {
    for (i = 0; i != v76; ++i)
    {
      if (*(_QWORD *)v86 != v75)
        objc_enumerationMutation(obj);
      v13 = (__CFString *)*(id *)(*((_QWORD *)&v85 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (v15)
      {
        if ((-[__CFString supportsCHIP](v15, "supportsCHIP") & 1) == 0)
        {
          v21 = (void *)MEMORY[0x227676638]();
          v22 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v90 = v24;
            v91 = 2112;
            v92 = v13;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@During update of bulletins for firmware updaes, found non-Matter accessory while processing Matter accessories: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v21);
          goto LABEL_30;
        }
        -[__CFString softwareUpdate](v13, "softwareUpdate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && objc_msgSend(v16, "state") == 4)
        {
          objc_msgSend(v17, "displayableVersion");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "version");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[__CFString displayableFirmwareVersion](v15, "displayableFirmwareVersion");
          v18 = objc_claimAutoreleasedReturnValue();
          -[__CFString firmwareVersion](v15, "firmwareVersion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v25 = v19;
        v83 = (__CFString *)v18;
        objc_msgSend(v19, "shortVersionString");
        v20 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[__CFString displayableFirmwareVersion](v13, "displayableFirmwareVersion");
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString firmwareVersion](v13, "firmwareVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "shortVersionString");
        v20 = objc_claimAutoreleasedReturnValue();
      }

      -[__CFString name](v13, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString uuid](v13, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingPathComponent:", CFSTR("firmwareInstalled"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)v20;
      objc_msgSend(v29, "stringByAppendingPathComponent:", v20);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "notificationRequests");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v66 = (void *)MEMORY[0x227676638]();
        v67 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v90 = v69;
          v91 = 2112;
          v92 = v30;
          _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Firmware update completed bulletin with recordID (%@) already exists, ignoring bulletin.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v66);

        goto LABEL_42;
      }
      v78 = i;
      v80 = v30;
      v81 = v15;
      v33 = v26;
      v34 = (void *)MEMORY[0x24BDD74F0];
      -[__CFString contextSPIUniqueIdentifier](WeakRetained, "contextSPIUniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "tupleWithQueryType:uuidString:", 0, v36);
      v37 = WeakRetained;
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)MEMORY[0x24BDD74F0];
      -[__CFString contextSPIUniqueIdentifier](v13, "contextSPIUniqueIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "UUIDString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "tupleWithQueryType:uuidString:", 1, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)MEMORY[0x24BDBCF20];
      v79 = (void *)v38;
      v97 = v38;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setWithArray:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      generateURLForHomeKitObject();
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x24BDD17C8];
      HMDLocalizedStringForKey(CFSTR("ACCESSORY_FIRMWARE_UPDATE_INSTALLED_BODY_SINGLE"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0;
      v49 = v83;
      objc_msgSend(v47, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v48, CFSTR("%@ %@"), &v84, v26, v83);
      v50 = v37;
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v52 = v84;

      v53 = v51;
      if (!v51)
      {
        v72 = v42;
        v54 = v33;
        v55 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v90 = v57;
          v91 = 2112;
          v92 = CFSTR("ACCESSORY_FIRMWARE_UPDATE_INSTALLED_BODY_SINGLE");
          v93 = 2112;
          v94 = CFSTR("%@ %@");
          v95 = 2112;
          v96 = v52;
          _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v55);
        v53 = CFSTR("ACCESSORY_FIRMWARE_UPDATE_INSTALLED_BODY_SINGLE");
        v49 = v83;
        v33 = v54;
        v42 = v72;
      }
      v77 = v33;
      v58 = v53;

      v59 = *(void **)(v74 + 32);
      HMDLocalizedStringForKey(CFSTR("ACCESSORY_FIRMWARE_UPDATE_INSTALLED_TITLE"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString homeBulletinContext](v37, "homeBulletinContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (id)objc_msgSend(v59, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v60, 0, v58, v80, v61, 0, v46, v62, 0, 1, 19);

      a1 = v74;
      v15 = v49;
      WeakRetained = v50;
      i = v78;
LABEL_30:

    }
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
    if (v76)
      continue;
    break;
  }
LABEL_42:

LABEL_43:
}

void __58__HMDBulletinBoard_updateBulletinForFirmwareUpdateInHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "namesOfServicesWithNewFirmwareAvailableInHome");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 1)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        HMDLocalizedStringForKey(CFSTR("ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_SINGLE"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        objc_msgSend(v9, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), &v59, v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = v59;

        v57 = v5;
        if (!v13)
        {
          v15 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          v13 = CFSTR("ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_SINGLE");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = v15;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v62 = v18;
            v63 = 2112;
            v64 = CFSTR("ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_SINGLE");
            v65 = 2112;
            v66 = CFSTR("%@");
            v67 = 2112;
            v68 = v14;
LABEL_21:
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            v15 = v17;
            goto LABEL_22;
          }
          goto LABEL_22;
        }
      }
      else
      {
        if ((unint64_t)objc_msgSend(v9, "count") < 2)
        {
          v27 = (void *)MEMORY[0x227676638]();
          v28 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "name");
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = v30;
            v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@No accessory in home %@ has firmware update. Cleaning the bulletin.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          v32 = *(void **)(a1 + 32);
          v60 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v33, 1);
          goto LABEL_29;
        }
        v24 = (void *)MEMORY[0x24BDD17C8];
        HMDLocalizedStringForKey(CFSTR("ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_MULTIPLE"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        objc_msgSend(v24, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%d"), &v58, objc_msgSend(v9, "count"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = v58;

        v57 = v5;
        if (!v13)
        {
          v15 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          v13 = CFSTR("ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_MULTIPLE");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = v15;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v62 = v18;
            v63 = 2112;
            v64 = CFSTR("ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_MULTIPLE");
            v65 = 2112;
            v66 = CFSTR("%d");
            v67 = 2112;
            v68 = v14;
            goto LABEL_21;
          }
LABEL_22:

          objc_autoreleasePoolPop(v15);
          v26 = 0;
          goto LABEL_23;
        }
      }
      v26 = v13;
LABEL_23:
      v33 = v13;

      objc_msgSend(*(id *)(a1 + 32), "notificationRequests");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", *(_QWORD *)(a1 + 40));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = (void *)MEMORY[0x227676638]();
        v37 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *(const __CFString **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v62 = v39;
          v63 = 2112;
          v64 = v40;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Bulletin with recordID (%@) already exists. Updating bulletin.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        objc_msgSend(v35, "content");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v41, "mutableCopy");

        objc_msgSend(v42, "setBody:", v33);
        v43 = *(void **)(a1 + 32);
        objc_msgSend(v35, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "updateContent:forNotificationWithRequestIdentifier:", v42, v44);
      }
      else
      {
        objc_msgSend(WeakRetained, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x24BDD74F0];
        objc_msgSend(WeakRetained, "contextSPIUniqueIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "UUIDString");
        v56 = v6;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "tupleWithQueryType:uuidString:", 8, v47);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        generateURLForHomeKitObject();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = *(void **)(a1 + 32);
        v55 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "homeBulletinContext");
        v51 = v9;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v49;
        v6 = v56;
        v54 = (id)objc_msgSend(v53, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v42, 0, v33, v55, v50, 0, v48, v52, 0, 1, 2);

        v9 = v51;
      }

      v5 = v57;
LABEL_29:

      goto LABEL_30;
    }
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v22;
      v23 = "%{public}@Home manager is not yet configured, bailing updateBulletinForFirmwareUpdateInHome.";
      goto LABEL_11;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v22;
      v23 = "%{public}@Update bulletin for stale home object; returning early.";
LABEL_11:
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v19);
LABEL_30:

}

void __68__HMDBulletinBoard_insertHH2DuplicateUserModelBulletinForHome_user___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  __CFString *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  id v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "mergeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "notificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1[6];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v11;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@HH2 duplicate user bulletin with requestID (%@) already exists, resending", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = a1[6];
    v48[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v13, 1);

  }
  v37 = a1[6];
  v14 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("HH2_DUPLICATE_USER_MODELS_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(a1[4], "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), &v39, v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v39;

  v19 = v17;
  if (!v17)
  {
    v20 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v22;
      v42 = 2112;
      v43 = CFSTR("HH2_DUPLICATE_USER_MODELS_TITLE");
      v44 = 2112;
      v45 = CFSTR("%@");
      v46 = 2112;
      v47 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    v19 = CFSTR("HH2_DUPLICATE_USER_MODELS_TITLE");
  }
  v23 = v19;

  v24 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("HH2_DUPLICATE_USER_MODELS_MESSAGE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(a1[5], "displayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@"), &v38, v26);
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v28 = v38;

  v29 = v27;
  if (!v27)
  {
    v30 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v32;
      v42 = 2112;
      v43 = CFSTR("HH2_DUPLICATE_USER_MODELS_MESSAGE");
      v44 = 2112;
      v45 = CFSTR("%@");
      v46 = 2112;
      v47 = v28;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v30);
    v29 = CFSTR("HH2_DUPLICATE_USER_MODELS_MESSAGE");
  }
  v33 = v29;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "homeBulletinContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v37, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v23, 0, v33, v5, v34, 0, 0, v35, 0, 1, 20);

}

void __77__HMDBulletinBoard_insertHH2SoftwareUpdateCompleteEventBulletinForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  id v22;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *context;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("hh2Update"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notificationRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v12;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@HH2 update completed bulletin with recordID (%@) already exists, ignoring bulletin.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v17 = *(void **)(a1 + 40);
      HMDLocalizedStringForKey(CFSTR("HOMEPOD_HH2_FIRMWARE_UPDATE_COMPLETE_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD17C8];
      HMDLocalizedStringForKey(CFSTR("HOMEPOD_HH2_FIRMWARE_UPDATE_COMPLETE_BODY"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v19, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), &v31, v6);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = v31;

      v23 = v21;
      if (!v21)
      {
        context = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v33 = v29;
          v34 = 2112;
          v35 = CFSTR("HOMEPOD_HH2_FIRMWARE_UPDATE_COMPLETE_BODY");
          v36 = 2112;
          v37 = CFSTR("%@");
          v38 = 2112;
          v39 = v22;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(context);
        v23 = CFSTR("HOMEPOD_HH2_FIRMWARE_UPDATE_COMPLETE_BODY");
      }
      v25 = v23;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "homeBulletinContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v17, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v18, 0, v25, v5, v26, 0, 0, v27, 0, 1, 18);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot post notification as accessory has no home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

void __57__HMDBulletinBoard_updateAudioAnalysisEventNotification___block_invoke(uint64_t a1)
{
  void *v2;
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
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "notificationRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "notificationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 40), "localizedKeyForBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBody:", v8);

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateContent:forNotificationWithRequestIdentifier:", v7, v10);

    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "notificationUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Request for identifier %@ found, updating the notification", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "notificationUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@No request for identifier %@ found, skipping the notification", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __57__HMDBulletinBoard_insertAudioAnalysisEventNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contextSPIUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spiClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x24BDD5360];
  v36[0] = *MEMORY[0x24BDD5370];
  v36[1] = v9;
  v32 = (void *)v8;
  v33 = (void *)v5;
  v37[0] = v5;
  v37[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v10, "mutableCopy");

  v11 = CFSTR("HomeAppBulletinAudioNotificationCategory");
  objc_msgSend(*(id *)(a1 + 32), "threadIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  if (_os_feature_enabled_impl())
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v3, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
  }
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedKeyForTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedKeyForBody");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "notificationUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dateOfOccurrence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = *(_BYTE *)(a1 + 56);
  objc_msgSend(v19, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v20, v21, v12, CFSTR("HomeAppBulletinAudioNotificationCategory"), v23, v24, 0, v31, v29, *(_QWORD *)(a1 + 48), 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "notificationUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addNotificationRequest:forIdentifier:", v25, v28);

}

void __65__HMDBulletinBoard_insertConnectedCHIPEcosystemsChangedBulletin___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isTimeSensitive"))
    v2 = 2;
  else
    v2 = 1;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  objc_msgSend(v4, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v5, v6, v7, CFSTR("HMDBBNormalType"), v12, v8, 0, v9, v11, v2, 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addNotificationRequest:forIdentifier:", v10, v12);
}

void __58__HMDBulletinBoard_insertCameraAccessModeChangedBulletin___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isTimeSensitive"))
    v2 = 2;
  else
    v2 = 1;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  objc_msgSend(v4, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v5, v6, v7, 0, v12, v8, 0, v9, v11, v2, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addNotificationRequest:forIdentifier:", v10, v12);
}

void __61__HMDBulletinBoard_insertCameraClipSignificantEventBulletin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
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
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  int v38;
  __CFString *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "previewImageFilePathURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "notificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  objc_msgSend(v5, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
    v13 = 1;
  else
    v13 = v2 == 0;
  v14 = !v13;
  if (!v9 || (v14 & 1) != 0)
  {
    if (v2)
    {
      v19 = *(void **)(a1 + 40);
      objc_msgSend(v19, "fileManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "heroFrameStoreDirectoryURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "_copyItemAtURL:toDirectory:", v2, v21);

    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v22, "filePathURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fileManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:fileManager:](HMDBulletinBoard, "createImageAttachmentByHardLinkingFile:fileManager:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v22, "filePathURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDD7E28]);

    if (v9)
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v33;
        v70 = 2112;
        v71 = v22;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Silently updating existing significant event bulletin with preview image file path URL: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v5, "content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (__CFString *)objc_msgSend(v34, "mutableCopy");

      -[__CFString setAttachments:](v35, "setAttachments:", v25);
      -[__CFString setUserInfo:](v35, "setUserInfo:", v27);
      v36 = *(void **)(a1 + 40);
      objc_msgSend(v5, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "updateContent:forNotificationWithRequestIdentifier:", v35, v37);
    }
    else
    {
      v65 = v25;
      v38 = objc_msgSend(*(id *)(a1 + 32), "shouldShowProvideFeedbackButton");
      v39 = CFSTR("HomeAppBulletinCategory");
      if (v38)
        v39 = CFSTR("HMDBulletinCategoryProvideCameraRecordingFeedback");
      v35 = v39;
      v40 = (void *)MEMORY[0x227676638]();
      v41 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v69 = v43;
        v70 = 2112;
        v71 = v44;
        v72 = 2112;
        v73 = v27;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Showing new significant event bulletin: %@, with user info: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(*(id *)(a1 + 40), "_submitCameraClipSignificantEventDetailsFromBulletin:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "threadIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v22;
      v67 = v2;
      v64 = v5;
      if (_os_feature_enabled_impl())
      {
        v46 = (void *)MEMORY[0x227676638]();
        v47 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v62 = v46;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v69 = v49;
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

          v46 = v62;
        }

        objc_autoreleasePoolPop(v46);
        objc_msgSend(*(id *)(a1 + 32), "home");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "uuid");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "UUIDString");
        v52 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v52 = (uint64_t)v45;
      }
      v63 = (void *)v52;
      objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "title");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "body");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dateOfOccurrence");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v61) = 0;
      v25 = v65;
      objc_msgSend(v53, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v54, v55, v52, v35, v56, v57, v65, v27, v61, 1, 6);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addNotificationRequest:forIdentifier:", v58, v60);

      v22 = v66;
      v2 = v67;
      v37 = v63;
      v5 = v64;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v18;
      v70 = 2112;
      v71 = v5;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Not inserting camera clip significant event bulletin because a bulletin already exists with the same body and an attachment: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

void __61__HMDBulletinBoard_removeWalletKeyOnboardingBulletinForHome___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("lockOnboarding"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v39;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Did not find any existing lock onboarding bulletin.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v36);
      goto LABEL_17;
    }
    v46 = v5;
    objc_msgSend(v7, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v45 = v9;
    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v43 = *MEMORY[0x24BDD7120];
    objc_msgSend(v11, "objectForKeyedSubscript:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@"), CFSTR("%@ %@"), 0, v14, CFSTR("all"));
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@"), CFSTR("%@ %@"), 0, v17, CFSTR("walletkey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)v15;
    if (objc_msgSend(v12, "isEqualToString:", v15))
    {
      v42 = v18;
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@"), CFSTR("%@ %@"), 0, v20, CFSTR("pincode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x227676638]();
      v24 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = v23;
        v26 = v12;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v43);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v27;
        v50 = 2112;
        v51 = v28;
        v52 = 2112;
        v53 = v22;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Lock onboarding bulletin already exists, updating bulletin actionURL: %@ to %@.", buf, 0x20u);

        v12 = v26;
        v23 = v41;
      }

      objc_autoreleasePoolPop(v23);
      objc_msgSend(v22, "absoluteString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, v43);

      v9 = v45;
      objc_msgSend(v45, "setUserInfo:", v11);
      v30 = *(void **)(a1 + 32);
      objc_msgSend(v7, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "updateContent:forNotificationWithRequestIdentifier:", v45, v31);

      v5 = v46;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", v18))
      {
LABEL_16:

LABEL_17:
        return;
      }
      v42 = v18;
      v40 = *(void **)(a1 + 32);
      v47 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeNotificationRequestsWithIdentifiers:shouldDeleteAttachments:", v21, 1);
    }

    v18 = v42;
    goto LABEL_16;
  }
  v32 = (void *)MEMORY[0x227676638]();
  v33 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v35;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not remove wallet key onboarding bulletin", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v32);
}

void __67__HMDBulletinBoard_insertWalletKeyExpressModeSetUpBulletinForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
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
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    HMDLocalizedStringForKey(CFSTR("BULLETIN_WALLET_KEY_EXPRESS_MODE_TITLE"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_WALLET_KEY_EXPRESS_MODE_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v41, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v41;

    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v11;
        v44 = 2112;
        v45 = CFSTR("BULLETIN_WALLET_KEY_EXPRESS_MODE_MESSAGE");
        v46 = 2112;
        v47 = CFSTR("%@");
        v48 = 2112;
        v49 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      v8 = CFSTR("BULLETIN_WALLET_KEY_EXPRESS_MODE_MESSAGE");
    }
    v12 = v8;

    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://locksOnboarding/%@?type=%@"), CFSTR("%@ %@"), 0, v14, CFSTR("walletkey"));
    v15 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v15;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    -[__CFString absoluteString](v16, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD7120]);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v23;
      v44 = 2112;
      v45 = v12;
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting wallet key express mode setup bulletin with message: %@ actionURL:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v38 = v16;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    v30 = (void *)objc_msgSend(v18, "copy");
    LOBYTE(v36) = 0;
    objc_msgSend(v26, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v40, v12, v28, CFSTR("HMDBulletinCategorySuppressNotificationOnWatch"), v25, v29, 0, v30, v36, 1, 17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v31, v25);
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert wallet key express mode setup bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
  }
}

void __68__HMDBulletinBoard_insertWalletKeySupportAddedBulletinForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  __CFString *v9;
  void *v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  id v58;
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_WALLET_KEY_SUPPORT_ADDED_MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), &v58, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v58;

    v9 = v7;
    if (!v7)
    {
      v10 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v12;
        v62 = 2112;
        v63 = CFSTR("BULLETIN_WALLET_KEY_SUPPORT_ADDED_MESSAGE");
        v64 = 2112;
        v65 = CFSTR("%@");
        v66 = 2112;
        v67 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      v9 = CFSTR("BULLETIN_WALLET_KEY_SUPPORT_ADDED_MESSAGE");
    }
    v57 = v9;

    v13 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tupleWithQueryType:uuidString:", 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD74F0];
    v18 = v3;
    objc_msgSend(v3, "contextSPIUniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tupleWithQueryType:uuidString:", 0, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDBCF20];
    v55 = (void *)v21;
    v59 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    generateURLForHomeKitObject();
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "accessoryBulletinContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    -[__CFString absoluteString](v25, "absoluteString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDD7120]);

    v29 = (void *)MEMORY[0x227676638]();
    v30 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v32;
      v62 = 2112;
      v63 = v57;
      v64 = 2112;
      v65 = v25;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting wallet key support added bulletin with message: %@ actionURL:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v18;
    v54 = v25;
    if (_os_feature_enabled_impl())
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v61 = v38;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(v18, "uuid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "UUIDString");
      v40 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v40;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v27, "copy");
    LOBYTE(v52) = 0;
    objc_msgSend(v43, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v56, v57, v34, CFSTR("HMDBBNormalType"), v42, v44, 0, v45, v52, 1, 17);
    v46 = v27;
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v47, v42);
  }
  else
  {
    v48 = (void *)MEMORY[0x227676638]();
    v49 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v51;
      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert wallet key support added bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v48);
  }
}

void __68__HMDBulletinBoard_insertLockOnboardingBulletinForHome_serviceType___block_invoke(uint64_t a1)
{
  void *v2;
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
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __CFString *v64;
  __CFString *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("lockOnboarding"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@"), CFSTR("%@ %@"), 0, v9, CFSTR("all"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (__CFString *)objc_msgSend(v12, "mutableCopy");

      v64 = v13;
      -[__CFString userInfo](v13, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v61 = v16;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BDD7120];
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD7120]);
        v63 = v10;
        v21 = v5;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v19;
        v68 = 2112;
        v69 = (uint64_t)v22;
        v70 = 2112;
        v71 = v11;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Lock onboarding bulletin already exists, updating bulletin actionURL: %@ to %@.", buf, 0x20u);

        v5 = v21;
        v10 = v63;

        v16 = v61;
      }
      else
      {
        v20 = *MEMORY[0x24BDD7120];
      }

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v11, "absoluteString");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v55, v20);

      v53 = v64;
      -[__CFString setUserInfo:](v64, "setUserInfo:", v15);
      v56 = *(void **)(a1 + 32);
      objc_msgSend(v7, "identifier");
      v54 = v15;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "updateContent:forNotificationWithRequestIdentifier:", v64, v48);
    }
    else
    {
      v62 = v5;
      HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_ONBOARDING_TITLE"));
      v27 = objc_claimAutoreleasedReturnValue();
      HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_ONBOARDING_MESSAGE"));
      v28 = objc_claimAutoreleasedReturnValue();
      if (*(__CFString **)(a1 + 48) == CFSTR("00000266-0000-1000-8000-0026BB765291"))
        v29 = CFSTR("walletkey");
      else
        v29 = CFSTR("pincode");
      v30 = v29;
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v30;
      objc_msgSend(v31, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@"), CFSTR("%@ %@"), 0, v32, v30);
      v33 = objc_claimAutoreleasedReturnValue();

      v60 = (void *)v33;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "mutableCopy");

      objc_msgSend(v34, "absoluteString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDD7120]);

      v38 = (void *)MEMORY[0x227676638]();
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v67 = v41;
        v68 = 2112;
        v69 = v28;
        v70 = 2112;
        v71 = v34;
        v72 = 2112;
        v73 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting lock onboarding bulletin with message: %@ actionURL:%@ for service: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "UUIDString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v36;
      v46 = (void *)objc_msgSend(v36, "copy");
      LOBYTE(v57) = 0;
      v47 = (void *)v43;
      v48 = v34;
      v49 = (void *)v43;
      v50 = (void *)v28;
      v51 = (void *)v27;
      v5 = v62;
      objc_msgSend(v47, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v27, v50, v44, CFSTR("HMDBulletinCategorySuppressNotificationOnWatch"), v62, v45, 0, v46, v57, 1, 13);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v52, v62);
      v10 = v51;
      v11 = v50;

      v7 = 0;
      v53 = v65;
      v54 = v60;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code onboarding bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }
}

void __59__HMDBulletinBoard_insertAccessCodeRemovedBulletinForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
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
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACCESS_CODE_REMOVED_TITLE"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACCESS_CODE_REMOVED_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v41, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v41;

    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v11;
        v44 = 2112;
        v45 = CFSTR("BULLETIN_ACCESS_CODE_REMOVED_MESSAGE");
        v46 = 2112;
        v47 = CFSTR("%@");
        v48 = 2112;
        v49 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      v8 = CFSTR("BULLETIN_ACCESS_CODE_REMOVED_MESSAGE");
    }
    v12 = v8;

    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://userLockSettings/%@"), CFSTR("%@"), 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v15;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    v38 = v16;
    objc_msgSend(v16, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD7120]);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v23;
      v44 = 2112;
      v45 = v12;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting access code removed bulletin with message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    v30 = (void *)objc_msgSend(v18, "copy");
    LOBYTE(v36) = 0;
    objc_msgSend(v26, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v40, v12, v28, CFSTR("HMDBBNormalType"), v25, v29, 0, v30, v36, 1, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v31, v25);
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code removed bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
  }
}

void __59__HMDBulletinBoard_insertAccessCodeChangedBulletinForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
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
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACCESS_CODE_CHANGED_TITLE"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACCESS_CODE_CHANGED_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v41, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v41;

    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v11;
        v44 = 2112;
        v45 = CFSTR("BULLETIN_ACCESS_CODE_CHANGED_MESSAGE");
        v46 = 2112;
        v47 = CFSTR("%@");
        v48 = 2112;
        v49 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      v8 = CFSTR("BULLETIN_ACCESS_CODE_CHANGED_MESSAGE");
    }
    v12 = v8;

    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://userLockSettings/%@"), CFSTR("%@"), 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v15;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    v38 = v16;
    objc_msgSend(v16, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD7120]);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v23;
      v44 = 2112;
      v45 = v12;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting access code changed bulletin with message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    v30 = (void *)objc_msgSend(v18, "copy");
    LOBYTE(v36) = 0;
    objc_msgSend(v26, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v40, v12, v28, CFSTR("HMDBBNormalType"), v25, v29, 0, v30, v36, 1, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v31, v25);
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code changed bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
  }
}

void __57__HMDBulletinBoard_insertAccessCodeAddedBulletinForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
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
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACCESS_CODE_ADDED_TITLE"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACCESS_CODE_ADDED_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v41, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v41;

    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v11;
        v44 = 2112;
        v45 = CFSTR("BULLETIN_ACCESS_CODE_ADDED_MESSAGE");
        v46 = 2112;
        v47 = CFSTR("%@");
        v48 = 2112;
        v49 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      v8 = CFSTR("BULLETIN_ACCESS_CODE_ADDED_MESSAGE");
    }
    v12 = v8;

    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("com.apple.Home-private://userLockSettings/%@"), CFSTR("%@"), 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v15;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    v38 = v16;
    objc_msgSend(v16, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD7120]);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v23;
      v44 = 2112;
      v45 = v12;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting access code added bulletin with message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    v30 = (void *)objc_msgSend(v18, "copy");
    LOBYTE(v36) = 0;
    objc_msgSend(v26, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v40, v12, v28, CFSTR("HMDBBNormalType"), v25, v29, 0, v30, v36, 1, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v31, v25);
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code added bulletin", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
  }
}

void __92__HMDBulletinBoard_insertHomeHubReachabilityBulletinForHome_reachable_hasMultipleResidents___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = (uint64_t)v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertBulletinsForUnreachableRecordingCamera", buf, 0xCu);

    }
    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "shouldPostBulletin") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (uint64_t)v10;
      v42 = 2112;
      v43 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post home hub reachability bulletin for home: %@", buf, 0x16u);

    }
LABEL_11:
    objc_autoreleasePoolPop(v4);
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = CFSTR("HOME_REACHABLE_HOME_HUB");
  }
  else if (*(_BYTE *)(a1 + 49))
  {
    v3 = CFSTR("HOME_NO_REACHABLE_HOME_HUBS");
  }
  else
  {
    v3 = CFSTR("HOME_NO_REACHABLE_HOME_HUB");
  }
  HMDLocalizedStringForKey(v3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD74F0];
  objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tupleWithQueryType:uuidString:", 0, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v15;
  generateURLForHomeKitObject();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homeBulletinContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v36 = v16;
  objc_msgSend(v16, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD7120]);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = CFSTR("Reachable");
    if (!*(_BYTE *)(a1 + 48))
      v25 = CFSTR("Unreachable");
    *(_DWORD *)buf = 138543618;
    v41 = v23;
    v42 = 2114;
    v43 = v25;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Posting %{public}@ Home Bulletin", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v18;
  v32 = (void *)objc_msgSend(v18, "copy");
  LOBYTE(v34) = 0;
  objc_msgSend(v28, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v39, v38, v30, CFSTR("HMDBBNormalType"), v27, v31, 0, v32, v34, 1, 10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v33, v27);
}

void __79__HMDBulletinBoard_insertReachabilityEventBulletinForAccessory_reachable_date___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v17;
      v18 = "%{public}@Home manager is not yet configured, bailing insertReachabilityEventBulletinForAccessory";
LABEL_11:
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

    }
LABEL_12:

    objc_autoreleasePoolPop(v14);
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "cameraProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v17;
      v18 = "%{public}@Accessory without cameraProfiles is not supported for reachability event bulletin";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (*(_BYTE *)(a1 + 56))
  {
    HMDLocalizedStringForKey(CFSTR("CAMERA_IS_REACHABLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), &v59, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v59;

    if (!v9)
    {
      v11 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("CAMERA_IS_REACHABLE");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v62 = v13;
        v63 = 2112;
        v64 = CFSTR("CAMERA_IS_REACHABLE");
        v65 = 2112;
        v66 = CFSTR("%@");
        v67 = 2112;
        v68 = v10;
LABEL_17:
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  else
  {
    HMDLocalizedStringForKey(CFSTR("CAMERA_IS_UNREACHABLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), &v58, v20);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v58;

    if (!v9)
    {
      v11 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("CAMERA_IS_UNREACHABLE");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v62 = v13;
        v63 = 2112;
        v64 = CFSTR("CAMERA_IS_UNREACHABLE");
        v65 = 2112;
        v66 = CFSTR("%@");
        v67 = 2112;
        v68 = v10;
        goto LABEL_17;
      }
LABEL_18:

      objc_autoreleasePoolPop(v11);
      v21 = 0;
      goto LABEL_19;
    }
  }
  v21 = v9;
LABEL_19:
  v56 = v9;

  v22 = (void *)MEMORY[0x24BDD74F0];
  objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tupleWithQueryType:uuidString:", 1, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDD74F0];
  v27 = v5;
  objc_msgSend(v5, "contextSPIUniqueIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tupleWithQueryType:uuidString:", 0, v29);
  v30 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDBCF20];
  v54 = (void *)v30;
  v60 = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v25;
  generateURLForHomeKitObject();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "accessoryBulletinContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  v53 = v34;
  objc_msgSend(v34, "absoluteString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDD7120]);

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "UUIDString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v43;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Using home uuid as thread identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(v27, "uuid");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "UUIDString");
    v45 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v45;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "UUIDString");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(a1 + 48);
  v50 = (void *)objc_msgSend(v36, "copy");
  LOBYTE(v52) = 0;
  objc_msgSend(v48, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v57, v56, v39, CFSTR("HMDBBNormalType"), v47, v49, 0, v50, v52, 1, 7);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v51, v47);
}

void __51__HMDBulletinBoard_insertBulletinForSecureTrigger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLocalizedStringForKey(CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_TITLE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_BODY"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@ %@"), &v38, v6, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v38;

    v10 = v8;
    if (!v8)
    {
      v11 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v41 = v13;
        v42 = 2112;
        v43 = CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_BODY");
        v44 = 2112;
        v45 = CFSTR("%@ %@");
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v11);
      v10 = CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_BODY");
    }
    v14 = v10;

    v15 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(*(id *)(a1 + 40), "contextSPIUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tupleWithQueryType:uuidString:", 6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(v3, "contextSPIUniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tupleWithQueryType:uuidString:", 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDBCF20];
    v39 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    generateURLForHomeKitObject();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *(void **)(a1 + 32);
    v28 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bulletinContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v27, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v37, 0, v14, v28, v29, 2, v26, v30, v31, 2, 4);

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertBulletinForSecureTrigger.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
  }
}

void __84__HMDBulletinBoard_insertBulletinForIncompatibleInvitationFromInviterName_homeName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    HMDLocalizedStringForKey(CFSTR("INVITE_REQUEST_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    if (*(_QWORD *)(a1 + 40))
    {
      HMDLocalizedStringForKey(CFSTR("INVITE_INCOMPATIBLE_HH2_BODY"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@ %@"), &v25, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = v25;

      if (!v6)
      {
        v8 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        v6 = CFSTR("INVITE_INCOMPATIBLE_HH2_BODY");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v27 = v10;
          v28 = 2112;
          v29 = CFSTR("INVITE_INCOMPATIBLE_HH2_BODY");
          v30 = 2112;
          v31 = CFSTR("%@ %@");
          v32 = 2112;
          v33 = v7;
LABEL_13:
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      HMDLocalizedStringForKey(CFSTR("INVITE_INCOMPATIBLE_HH2_NO_HOME_NAME_BODY"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), &v24, *(_QWORD *)(a1 + 48));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = v24;

      if (!v6)
      {
        v8 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        v6 = CFSTR("INVITE_INCOMPATIBLE_HH2_NO_HOME_NAME_BODY");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v27 = v10;
          v28 = 2112;
          v29 = CFSTR("INVITE_INCOMPATIBLE_HH2_NO_HOME_NAME_BODY");
          v30 = 2112;
          v31 = CFSTR("%@");
          v32 = 2112;
          v33 = v7;
          goto LABEL_13;
        }
LABEL_14:

        objc_autoreleasePoolPop(v8);
        v16 = 0;
        goto LABEL_15;
      }
    }
    v16 = v6;
LABEL_15:
    v17 = v6;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = 0;
    objc_msgSend(v20, "showNotificationWithTitle:body:threadIdentifier:categoryIdentifier:requestIdentifier:date:attachments:userInfo:shouldIgnoreDoNotDisturb:interruptionLevel:logEventTopic:", v3, v17, 0, CFSTR("HMDBBNormalType"), v19, v21, 0, 0, v23, 1, 21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addNotificationRequest:forIdentifier:", v22, v19);
    return;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Home manager is not yet configured, bailing insertBulletinForIncomingInvitation.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
}

void __56__HMDBulletinBoard_insertBulletinForIncomingInvitation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "invitationData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    HMDLocalizedStringForKey(CFSTR("INVITE_REQUEST_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("CONFIRM_INVITE_TO_HOME"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v5, "inviterName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "homeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@ %@"), &v31, v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = v31;

    v13 = v11;
    if (!v11)
    {
      v14 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v16;
        v34 = 2112;
        v35 = CFSTR("CONFIRM_INVITE_TO_HOME");
        v36 = 2112;
        v37 = CFSTR("%@ %@");
        v38 = 2112;
        v39 = v12;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      v13 = CFSTR("CONFIRM_INVITE_TO_HOME");
    }
    v17 = v13;

    objc_msgSend(*(id *)(a1 + 40), "bulletinContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("homeIncomingInvitation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    generateURLForHomeKitObject();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bulletinContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v22, "_insertRequestWithTitle:snapshotData:message:requestIdentifier:date:bulletinType:actionURL:bulletinContext:actionContext:interruptionLevel:logEventTopic:", v6, 0, v17, v23, v24, 0, v21, v25, 0, 1, 11);

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Home manager is not yet configured, bailing insertBulletinForIncomingInvitation.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
  }
}

void __146__HMDBulletinBoard_insertBulletinsForChangedCharacteristics_modifiedCharacteristics_changedByThisDevice_changeNotificationFromPrimary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  id obja;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v53 = (id)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v72 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          +[HMDBulletinCategory targetCurrentCharacteristicTypeMap](HMDBulletinCategory, "targetCurrentCharacteristicTypeMap");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "type");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(*(id *)(a1 + 32), "_updateCharacteristicTupleFor:withCurrentType:changedByThisDevice:", v8, v11, *(unsigned __int8 *)(a1 + 64));

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      }
      while (v5);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = *(id *)(a1 + 40);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v68 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          objc_msgSend(v16, "type");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "service");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[HMDBulletinBoard isBulletinSupportedForCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForCharacteristicType:serviceType:", v17, v19))
          {
            v20 = objc_msgSend(*(id *)(a1 + 32), "_shouldPostBulletinOnCurrentValueChangeForCharacteristic:includeChangeFromNil:", v16, *(unsigned __int8 *)(a1 + 65));

            if (v20)
              objc_msgSend(v53, "addObject:", v16);
          }
          else
          {

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obja = v53;
    v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v64;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(obja);
          v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v25);
          if (+[HMDBulletinCategory isSensorDetectedCharacteristic:](HMDBulletinCategory, "isSensorDetectedCharacteristic:", v26))
          {
            objc_msgSend(v26, "value");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "intValue");

            if (!v28)
              goto LABEL_30;
LABEL_29:
            objc_msgSend(v21, "addObject:", v26);
            goto LABEL_30;
          }
          if ((objc_msgSend(*(id *)(a1 + 32), "_hasDuplicateBulletinForCharacteristic:", v26) & 1) == 0)
            goto LABEL_29;
LABEL_30:
          ++v25;
        }
        while (v23 != v25);
        v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
        v23 = v29;
      }
      while (v29);
    }

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v30 = v21;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v60;
      v54 = v30;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v60 != v33)
            objc_enumerationMutation(v54);
          v35 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v35, v52);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "attributedUserUUID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v35, "accessory");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "home");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "users");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x24BDAC760];
            v57[1] = 3221225472;
            v57[2] = __146__HMDBulletinBoard_insertBulletinsForChangedCharacteristics_modifiedCharacteristics_changedByThisDevice_changeNotificationFromPrimary_completion___block_invoke_41;
            v57[3] = &unk_24E799728;
            v58 = v37;
            objc_msgSend(v40, "na_firstObjectPassingTest:", v57);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
              objc_msgSend(v52, "setObject:forKey:", v41, v35);

          }
        }
        v30 = v54;
        v32 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
      }
      while (v32);
    }

    v42 = (void *)MEMORY[0x227676638]();
    v43 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v45;
      v77 = 2112;
      v78 = v30;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@After filtering, actually posting notifications for characteristics: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    if (objc_msgSend(v30, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_insertImageBulletinsForChangedCharacteristics:attributedUsers:snapshotData:completion:", v30, v52, 0, 0);
      v46 = *(_QWORD *)(a1 + 56);
      if (v46)
        (*(void (**)(void))(v46 + 16))();
    }

  }
  else
  {
    v47 = (void *)MEMORY[0x227676638]();
    v48 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v50;
      _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertBulletinsForChangedCharacteristics.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v47);
    v51 = *(_QWORD *)(a1 + 56);
    if (v51)
      (*(void (**)(void))(v51 + 16))();
  }
}

uint64_t __146__HMDBulletinBoard_insertBulletinsForChangedCharacteristics_modifiedCharacteristics_changedByThisDevice_changeNotificationFromPrimary_completion___block_invoke_41(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __90__HMDBulletinBoard_insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v1 = a1;
  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = *(id *)(v1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v27;
      *(_QWORD *)&v6 = 138543618;
      v24 = v6;
      do
      {
        v9 = 0;
        v25 = v7;
        do
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
          if ((objc_msgSend(*(id *)(v1 + 32), "_hasDuplicateBulletinForSnapshotCharacteristic:", v10, v24) & 1) != 0)
          {
            v11 = (void *)MEMORY[0x227676638]();
            v12 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v14 = v8;
              v15 = v1;
              v16 = v4;
              v17 = v3;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v24;
              v31 = v18;
              v32 = 2112;
              v33 = v10;
              _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Not creating bulletin because it already exists with the same characteristic update: %@", buf, 0x16u);

              v3 = v17;
              v4 = v16;
              v1 = v15;
              v8 = v14;
              v7 = v25;
            }

            objc_autoreleasePoolPop(v11);
          }
          else
          {
            objc_msgSend(v3, "addObject:", v10);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(v1 + 32), "_insertImageBulletinsForChangedCharacteristics:attributedUsers:snapshotData:completion:", v3, 0, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertImageBulletinsForChangedCharacteristics.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = *(_QWORD *)(v1 + 56);
    if (v23)
      (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, MEMORY[0x24BDBD1A8]);
  }
}

void __45__HMDBulletinBoard_configureWithHomeManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "setHomeManager:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBulletinBoard notificationCategories](HMDBulletinBoard, "notificationCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithNotificationCategories:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HMDBulletinBoard_configureWithHomeManager___block_invoke_2;
  v8[3] = &unk_24E798920;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v8);

}

void __45__HMDBulletinBoard_configureWithHomeManager___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "isConfiguredFuture");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithNoResult");

}

+ (id)sharedBulletinBoard
{
  if (sharedBulletinBoard_onceToken != -1)
    dispatch_once(&sharedBulletinBoard_onceToken, &__block_literal_global_38314);
  return (id)sharedBulletinBoard__bulletinBoard;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)notificationCategories
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDF8828], "iconWithSystemImageName:", CFSTR("checkmark.circle"));
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8828], "iconWithSystemImageName:", CFSTR("xmark.circle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8828], "iconWithSystemImageName:", CFSTR("apple.bubble.middle.bottom"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  v26 = (void *)v5;
  v29 = (void *)v3;
  v6 = (void *)MEMORY[0x24BDF8820];
  HMDLocalizedStringForKey(CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_YES"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithIdentifier:title:options:icon:", CFSTR("trigger_execute"), v7, 0, v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDF8820];
  HMDLocalizedStringForKey(CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_NO"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithIdentifier:title:options:icon:", CFSTR("trigger_doNotExecute"), v9, 0, v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF8838];
  v31[0] = v28;
  v31[1] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v10, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("HMDBBSecureTrigger"), v11, MEMORY[0x24BDBD1A8], 0x20000000);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v13);
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("HMDBBNormalType"), v12, v12, 0x20000000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v14);
  v15 = (void *)MEMORY[0x24BDF8820];
  HMDLocalizedStringForKey(CFSTR("CAMERA_PROVIDE_RECORDING_FEEDBACK"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithIdentifier:title:options:icon:", CFSTR("provide_cameraRecordingFeedback"), v16, 0, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF8838];
  v30 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("HMDBulletinCategoryProvideCameraRecordingFeedback"), v19, v12, 0x20000000);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v20);
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("HomeAppBulletinCategory"), v12, v12, 536870913);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v21);
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("HomeAppBulletinAudioNotificationCategory"), v12, v12, 536870913);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v22);
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("HMDBulletinCategorySuppressNotificationOnWatch"), v12, v12, 0x20000000);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v23);
  v24 = (void *)objc_msgSend(v2, "copy");

  return v24;
}

+ (id)_supportedSecureServices
{
  if (_supportedSecureServices_onceToken != -1)
    dispatch_once(&_supportedSecureServices_onceToken, &__block_literal_global_25);
  return (id)_supportedSecureServices_supportedSecureServices;
}

+ (id)_supportedNonSecureServices
{
  if (_supportedNonSecureServices_onceToken != -1)
    dispatch_once(&_supportedNonSecureServices_onceToken, &__block_literal_global_27_38302);
  return (id)_supportedNonSecureServices_supportedNonSecureServices;
}

+ (BOOL)isBulletinSupportedForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  +[HMDBulletinBoard _supportedSecureServices](HMDBulletinBoard, "_supportedSecureServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 && (!v5 || (objc_msgSend(v8, "containsObject:", v5) & 1) != 0)
    || +[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForNonSecureCharacteristicType:serviceType:", v5, v6);

  return v9;
}

+ (BOOL)isBulletinSupportedForNonSecureCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  +[HMDBulletinBoard _supportedNonSecureServices](HMDBulletinBoard, "_supportedNonSecureServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v5)
      v9 = objc_msgSend(v8, "containsObject:", v5);
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isCriticalNonSecureServiceType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isCriticalNonSecureServiceType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isCriticalNonSecureServiceType__onceToken, &__block_literal_global_28);
  v5 = objc_msgSend((id)isCriticalNonSecureServiceType__criticalServices, "containsObject:", v4);

  return v5;
}

+ (id)bulletinSupportedCharacteristicsForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HMDBulletinBoard _supportedSecureServices](HMDBulletinBoard, "_supportedSecureServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[HMDBulletinBoard _supportedNonSecureServices](HMDBulletinBoard, "_supportedNonSecureServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "characteristics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v12)
    {

LABEL_20:
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v13 = v12;
    v21 = v3;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "type");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v8, "containsObject:", v18);

        if (v19)
        {
          if (!v14)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "addObject:", v17);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);

    v3 = v21;
    if (!v14)
      goto LABEL_20;
  }
  else
  {
    v14 = 0;
  }
LABEL_21:

  return v14;
}

+ (id)attachmentsWithFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDF8830];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "attachmentWithIdentifier:URL:options:error:", v7, v4, 0, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v8)
    {
      v17 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v14;
        v20 = 2112;
        v21 = v4;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create attachment with URL %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v10 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

+ (id)createImageAttachmentByHardLinkingFile:(id)a3 fileManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "heroFrameStoreDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v10 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v36);
    v11 = v36;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "URLByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("link_%@_%@.%@"), v15, v13, CFSTR("jpg"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "URLByAppendingPathComponent:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v11;
      v18 = objc_msgSend(v8, "linkItemAtURL:toURL:error:", v6, v17, &v35);
      v19 = v35;

      if ((v18 & 1) != 0)
      {
        +[HMDBulletinBoard attachmentsWithFileURL:](HMDBulletinBoard, "attachmentsWithFileURL:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = a1;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = v29;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v38 = v32;
          v39 = 2112;
          v40 = v17;
          v41 = 2112;
          v42 = v6;
          v43 = 2112;
          v44 = v19;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hard link: %@ to file: %@ with error %@", buf, 0x2Au);

          v29 = v34;
        }

        objc_autoreleasePoolPop(v29);
        v20 = (void *)MEMORY[0x24BDBD1A8];
      }

      v11 = v19;
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = a1;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v38 = v28;
        v39 = 2112;
        v40 = v6;
        v41 = 2112;
        v42 = v9;
        v43 = 2112;
        v44 = v11;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create attachment for file: %@, because failed to create directory at URL %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      v20 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Returning empty attachments because nil fileURL was passed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v20;
}

+ (unint64_t)interruptionLevelForChangedCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  unint64_t v19;
  void *v20;
  int v21;

  v3 = a3;
  if (interruptionLevelForChangedCharacteristic__onceToken != -1)
    dispatch_once(&interruptionLevelForChangedCharacteristic__onceToken, &__block_literal_global_33_38293);
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)interruptionLevelForChangedCharacteristic__criticalCharacteristicsByService;
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)interruptionLevelForChangedCharacteristic__timeSensitiveCharacteristicsByService;
  objc_msgSend(v4, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v3, "type"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "containsObject:", v11),
        v11,
        v12))
  {
    objc_msgSend(v3, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE1B518]);

    if (v14)
    {
      objc_msgSend(v3, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      v18 = objc_msgSend(v17, "intValue");
      if (v18 == 4)
        v19 = 3;
      else
        v19 = 1;
    }
    else
    {
      v19 = 3;
    }
  }
  else if (v10)
  {
    objc_msgSend(v3, "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "containsObject:", v20);

    if (v21)
      v19 = 2;
    else
      v19 = 1;
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (id)characteristicTupleKeyFromServiceContextID:(id)a3 currentType:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

+ (BOOL)presentationValueOfCharacteristic:(id)a3 equalTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stepValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBulletinCategory presentationValueForValue:type:](HMDBulletinCategory, "presentationValueForValue:type:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v5, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = compareCharacteristicValue(v11, v6, (void *)4, v8);

  return v12;
}

+ (id)messageForDoorLockAlarmEvent:(id)a3 alarmCode:(unsigned __int8)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  id v22;
  __CFString *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  __CFString *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "primaryService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v16;
      v41 = 1024;
      LODWORD(v42) = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@AlarmCode is invalid value, did not expect to create bulletin for this value=%hhu", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_ACTION_JAMMED"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v12, "composedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), &v38, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = v38;

    v23 = v21;
    if (!v21)
    {
      v24 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v40 = v26;
        v41 = 2112;
        v42 = CFSTR("BULLETIN_LOCK_ACTION_JAMMED");
        v43 = 2112;
        v44 = CFSTR("%@");
        v45 = 2112;
        v46 = v22;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v24);
      v23 = CFSTR("BULLETIN_LOCK_ACTION_JAMMED");
    }
    v27 = v23;

    v28 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v28, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), &v37, v27);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v37;

    v32 = v30;
    if (!v30)
    {
      v33 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v40 = v35;
        v41 = 2112;
        v42 = CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
        v43 = 2112;
        v44 = CFSTR("%@");
        v45 = 2112;
        v46 = v31;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v33);
      v32 = CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
    }
    v17 = v32;

  }
  return v17;
}

+ (id)messageForLockOperationEvent:(id)a3 personName:(id)a4 lockOperationType:(unsigned __int8)a5 ecosystemName:(id)a6
{
  int v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  id v22;
  __CFString *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v7 = a5;
  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v47 = a4;
  v11 = a6;
  objc_msgSend(v10, "primaryService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "room");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v13, v15, v16);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v17 = CFSTR("BULLETIN_LOCK_ACTION_LOCKED");
LABEL_5:
    v18 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v48, "composedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), &v52, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = v52;

    v23 = v21;
    if (!v21)
    {
      v24 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v54 = v26;
        v55 = 2112;
        v56 = v17;
        v57 = 2112;
        v58 = CFSTR("%@");
        v59 = 2112;
        v60 = v22;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v24);
      v23 = v17;
    }
    v27 = v23;

    v28 = v47;
    if (v47)
    {
      v29 = (void *)MEMORY[0x24BDD17C8];
      HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v29, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@ %@"), &v51, v27, v47);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v32 = v51;

      if (!v31)
      {
        v33 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v35;
          v55 = 2112;
          v56 = CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON");
          v57 = 2112;
          v58 = CFSTR("%@ %@");
          v59 = 2112;
          v60 = v32;
LABEL_24:
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      if (v11)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        HMDLocalizedStringForKey(v11);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v42, CFSTR("%@ %@"), &v50, v27, v43);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v32 = v50;

        if (!v31)
        {
          v33 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          v31 = CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v54 = v35;
            v55 = 2112;
            v56 = CFSTR("BULLETIN_LOCK_MESSAGE_WITH_PERSON");
            v57 = 2112;
            v58 = CFSTR("%@ %@");
            v59 = 2112;
            v60 = v32;
            goto LABEL_24;
          }
LABEL_25:

          objc_autoreleasePoolPop(v33);
          v45 = 0;
          v28 = v47;
          goto LABEL_26;
        }
      }
      else
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        objc_msgSend(v41, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v44, CFSTR("%@"), &v49, v27);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v32 = v49;

        if (!v31)
        {
          v33 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          v31 = CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v54 = v35;
            v55 = 2112;
            v56 = CFSTR("BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
            v57 = 2112;
            v58 = CFSTR("%@");
            v59 = 2112;
            v60 = v32;
            goto LABEL_24;
          }
          goto LABEL_25;
        }
      }
    }
    v45 = v31;
LABEL_26:
    v40 = v31;

    goto LABEL_27;
  }
  if (v7 == 1)
  {
    v17 = CFSTR("BULLETIN_LOCK_ACTION_UNLOCKED");
    goto LABEL_5;
  }
  v36 = (void *)MEMORY[0x227676638]();
  v37 = a1;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v39;
    v55 = 1024;
    LODWORD(v56) = v7;
    _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@LockOperationType is invalid value, did not expect to create bulletin for this value=%hhu", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v36);
  v40 = 0;
  v28 = v47;
LABEL_27:

  return v40;
}

+ (void)messageAndTitleForLockUserChangeEvent:(id *)a3 title:(id *)a4 accessory:(id)a5 lockDataType:(unsigned __int8)a6 dataOperationType:(unsigned __int8)a7 ecosystemName:(id)a8 isAffectedUser:(BOOL)a9
{
  int v10;
  int v11;
  id v14;
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
  __CFString *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  id *v56;
  __CFString *v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v10 = a7;
  v11 = a6;
  v77 = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v60 = a8;
  objc_msgSend(v14, "primaryService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v14;
  objc_msgSend(v14, "room");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "composedName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (v11 == 7)
    {
      HMDLocalizedStringForKey(CFSTR("BULLETIN_RFID_ADDED_TITLE"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x24BDD17C8];
      v23 = v59;
      v24 = v60;
      if (v60)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_RFID_ADDED_THRU_SERVICE"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        HMDLocalizedStringForKey(v60);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v48, CFSTR("%@ %@"), &v62, v49, v21);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v62;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_RFID_ADDED_THRU_SERVICE");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_RFID_ADDED_THRU_SERVICE");
            v73 = 2112;
            v74 = CFSTR("%@ %@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
      else
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_RFID_ADDED"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        objc_msgSend(v47, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v52, CFSTR("%@"), &v61, v21);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v61;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_RFID_ADDED");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_RFID_ADDED");
            v73 = 2112;
            v74 = CFSTR("%@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
      goto LABEL_50;
    }
    if (v11 == 6)
    {
      HMDLocalizedStringForKey(CFSTR("BULLETIN_PIN_ADDED_TITLE"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x24BDD17C8];
      v23 = v59;
      v24 = v60;
      if (v60)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_PIN_ADDED_THRU_SERVICE"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        HMDLocalizedStringForKey(v60);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v33, CFSTR("%@ %@"), &v64, v21, v34);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v64;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_PIN_ADDED_THRU_SERVICE");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_PIN_ADDED_THRU_SERVICE");
            v73 = 2112;
            v74 = CFSTR("%@ %@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
LABEL_54:
          v56 = a3;

          objc_autoreleasePoolPop(v29);
          v55 = 0;
          v24 = v60;
          goto LABEL_55;
        }
      }
      else
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_PIN_ADDED"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0;
        objc_msgSend(v32, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v51, CFSTR("%@"), &v63, v21);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v63;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_PIN_ADDED");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_PIN_ADDED");
            v73 = 2112;
            v74 = CFSTR("%@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
LABEL_50:
      v55 = v27;
      v56 = a3;
LABEL_55:
      v57 = objc_retainAutorelease(v27);

      *v56 = v57;
      goto LABEL_56;
    }
    v35 = (void *)MEMORY[0x227676638]();
    v45 = a1;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v10 != 1)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = a1;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

      goto LABEL_39;
    }
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v38;
    v71 = 1024;
    LODWORD(v72) = v10;
    v39 = "%{public}@DataOperationType is invalid value, did not expect to create bulletin for this value=%hhu";
    v40 = v37;
    v41 = 18;
LABEL_37:
    _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);

    goto LABEL_38;
  }
  if (v11 == 7)
  {
    if (a9)
    {
      HMDLocalizedStringForKey(CFSTR("BULLETIN_USER_HOME_KEY_REMOVED_TITLE"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BDD17C8];
      v23 = v59;
      v24 = v60;
      if (v60)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_USER_HOME_KEY_REMOVED_THRU_SERVICE"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        HMDLocalizedStringForKey(v60);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v43, CFSTR("%@ %@"), &v66, v21, v44);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v66;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_USER_HOME_KEY_REMOVED_THRU_SERVICE");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_USER_HOME_KEY_REMOVED_THRU_SERVICE");
            v73 = 2112;
            v74 = CFSTR("%@ %@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
      else
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_USER_HOME_KEY_REMOVED"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        objc_msgSend(v42, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v54, CFSTR("%@"), &v65, v21);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v65;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_USER_HOME_KEY_REMOVED");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_USER_HOME_KEY_REMOVED");
            v73 = 2112;
            v74 = CFSTR("%@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
      goto LABEL_50;
    }
    v35 = (void *)MEMORY[0x227676638]();
    v36 = a1;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v70 = v38;
    v39 = "%{public}@Not affected user for RFID clear operation, and did not expect to create bulletin";
    goto LABEL_36;
  }
  if (v11 == 6)
  {
    if (a9)
    {
      HMDLocalizedStringForKey(CFSTR("BULLETIN_PIN_REMOVED_TITLE"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x24BDD17C8];
      v23 = v59;
      v24 = v60;
      if (v60)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_PIN_REMOVED_THRU_SERVICE"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0;
        HMDLocalizedStringForKey(v60);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@ %@"), &v68, v21, v26);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v68;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_PIN_REMOVED_THRU_SERVICE");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_PIN_REMOVED_THRU_SERVICE");
            v73 = 2112;
            v74 = CFSTR("%@ %@");
            v75 = 2112;
            v76 = v28;
LABEL_53:
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            goto LABEL_54;
          }
          goto LABEL_54;
        }
      }
      else
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_PIN_REMOVED"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        objc_msgSend(v22, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v53, CFSTR("%@"), &v67, v21);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v67;

        if (!v27)
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("BULLETIN_PIN_REMOVED");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v31;
            v71 = 2112;
            v72 = CFSTR("BULLETIN_PIN_REMOVED");
            v73 = 2112;
            v74 = CFSTR("%@");
            v75 = 2112;
            v76 = v28;
            goto LABEL_53;
          }
          goto LABEL_54;
        }
      }
      goto LABEL_50;
    }
    v35 = (void *)MEMORY[0x227676638]();
    v36 = a1;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v70 = v38;
    v39 = "%{public}@Not affected user for pin clear operation, and did not expect to create bulletin";
LABEL_36:
    v40 = v37;
    v41 = 12;
    goto LABEL_37;
  }
  v35 = (void *)MEMORY[0x227676638]();
  v45 = a1;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
LABEL_30:
    HMFGetLogIdentifier();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v50;
    v71 = 1024;
    LODWORD(v72) = v11;
    _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Lock Data type is invalid value, did not expect to create bulletin for this value=%hhu", buf, 0x12u);

  }
LABEL_31:

LABEL_39:
  objc_autoreleasePoolPop(v35);
  v23 = v59;
  v24 = v60;
LABEL_56:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t184 != -1)
    dispatch_once(&logCategory__hmf_once_t184, &__block_literal_global_274);
  return (id)logCategory__hmf_once_v185;
}

void __31__HMDBulletinBoard_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v185;
  logCategory__hmf_once_v185 = v0;

}

void __62__HMDBulletinBoard_interruptionLevelForChangedCharacteristic___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v18[0] = *MEMORY[0x24BE1B808];
  v17 = *MEMORY[0x24BE1B518];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v0;
  v18[1] = *MEMORY[0x24BE1B820];
  v16 = *MEMORY[0x24BE1B4C8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v1;
  v18[2] = *MEMORY[0x24BE1B838];
  v15 = *MEMORY[0x24BE1B560];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v2;
  v18[3] = *MEMORY[0x24BE1B858];
  v14 = *MEMORY[0x24BE1B5E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)interruptionLevelForChangedCharacteristic__criticalCharacteristicsByService;
  interruptionLevelForChangedCharacteristic__criticalCharacteristicsByService = v4;

  v12[0] = *MEMORY[0x24BE1B818];
  v11 = *MEMORY[0x24BE1B4C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x24BE1B7B0];
  v10 = *MEMORY[0x24BE1B558];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)interruptionLevelForChangedCharacteristic__timeSensitiveCharacteristicsByService;
  interruptionLevelForChangedCharacteristic__timeSensitiveCharacteristicsByService = v8;

}

void __51__HMDBulletinBoard_isCriticalNonSecureServiceType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE1B818];
  v4[0] = *MEMORY[0x24BE1B7B0];
  v4[1] = v0;
  v1 = *MEMORY[0x24BE1B838];
  v4[2] = *MEMORY[0x24BE1B820];
  v4[3] = v1;
  v4[4] = *MEMORY[0x24BE1B858];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isCriticalNonSecureServiceType__criticalServices;
  isCriticalNonSecureServiceType__criticalServices = v2;

}

void __47__HMDBulletinBoard__supportedNonSecureServices__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[9];
  _QWORD v22[10];

  v22[9] = *MEMORY[0x24BDAC8D0];
  v21[0] = *MEMORY[0x24BE1B7B0];
  v20 = *MEMORY[0x24BE1B558];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v0;
  v21[1] = *MEMORY[0x24BE1B818];
  v19 = *MEMORY[0x24BE1B4C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v1;
  v21[2] = *MEMORY[0x24BE1B820];
  v18 = *MEMORY[0x24BE1B4C8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v2;
  v21[3] = *MEMORY[0x24BE1B828];
  v17 = *MEMORY[0x24BE1B4D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v3;
  v21[4] = *MEMORY[0x24BE1B838];
  v16 = *MEMORY[0x24BE1B560];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v4;
  v21[5] = *MEMORY[0x24BE1B848];
  v15 = *MEMORY[0x24BE1B570];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v5;
  v21[6] = *MEMORY[0x24BE1B850];
  v14 = *MEMORY[0x24BE1B588];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v6;
  v21[7] = *MEMORY[0x24BE1B858];
  v13 = *MEMORY[0x24BE1B5E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v7;
  v21[8] = *MEMORY[0x24BE1B898];
  v8 = *MEMORY[0x24BE1B630];
  v12[0] = *MEMORY[0x24BE1B508];
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_supportedNonSecureServices_supportedNonSecureServices;
  _supportedNonSecureServices_supportedNonSecureServices = v10;

}

void __44__HMDBulletinBoard__supportedSecureServices__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v18[0] = *MEMORY[0x24BE1B7A8];
  v1 = *MEMORY[0x24BE1B630];
  v17[0] = *MEMORY[0x24BE1B508];
  v0 = v17[0];
  v17[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[1] = *MEMORY[0x24BE1B7C8];
  v3 = *MEMORY[0x24BE1B500];
  v16[0] = *MEMORY[0x24BE1B4E0];
  v16[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  v18[2] = *MEMORY[0x24BE1B7F0];
  v5 = *MEMORY[0x24BE1B628];
  v15[0] = v3;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  v18[3] = *MEMORY[0x24BE1B808];
  v14 = *MEMORY[0x24BE1B518];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  v18[4] = *MEMORY[0x24BE1B890];
  v13[0] = v0;
  v13[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v8;
  v18[5] = CFSTR("00000260-0000-1000-8000-0026BB765291");
  v12 = *MEMORY[0x24BE1B4A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_supportedSecureServices_supportedSecureServices;
  _supportedSecureServices_supportedSecureServices = v10;

}

void __39__HMDBulletinBoard_sharedBulletinBoard__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  HMDBulletinBoard *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (+[HMDDeviceCapabilities supportsUserNotifications](HMDDeviceCapabilities, "supportsUserNotifications"))
  {
    +[HMDPersistentStore unarchiveBulletinBoard](HMDPersistentStore, "unarchiveBulletinBoard");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)sharedBulletinBoard__bulletinBoard;
    sharedBulletinBoard__bulletinBoard = v0;

    if (!sharedBulletinBoard__bulletinBoard)
    {
      v2 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v4;
        _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive HMDBulletinBoard", (uint8_t *)&v7, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
      v5 = objc_alloc_init(HMDBulletinBoard);
      v6 = (void *)sharedBulletinBoard__bulletinBoard;
      sharedBulletinBoard__bulletinBoard = (uint64_t)v5;

    }
  }
}

@end
