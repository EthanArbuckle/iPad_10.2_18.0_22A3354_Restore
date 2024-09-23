@implementation HMDHomeWalletKeyManager

- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMDHomeWalletDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  HMDFileManager *v15;
  void *v16;
  HMDWalletPassLibrary *v17;
  HMDHomeWalletKeyManager *v19;

  v5 = a4;
  v6 = a3;
  v15 = objc_alloc_init(HMDFileManager);
  v17 = -[HMDWalletPassLibrary initWithWorkQueue:]([HMDWalletPassLibrary alloc], "initWithWorkQueue:", v5);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDWatchManager sharedManager](HMDWatchManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLostModeManager sharedManager](HMDLostModeManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(HMDHomeWalletDataSource);
  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDApplicationRegistry sharedRegistry](HMDApplicationRegistry, "sharedRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDHomeWalletKeyManager initWithUUID:workQueue:fileManager:passLibrary:notificationCenter:watchManager:keychainStore:lostModeManager:dataSource:bulletinBoard:applicationRegistry:systemInfo:isoCredentialFactory:](self, "initWithUUID:workQueue:fileManager:passLibrary:notificationCenter:watchManager:keychainStore:lostModeManager:dataSource:bulletinBoard:applicationRegistry:systemInfo:isoCredentialFactory:", v6, v5, v15, v17, v16, v7, v14, v8, v9, v10, v11, v12, &__block_literal_global_46944);

  return v19;
}

- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 fileManager:(id)a5 passLibrary:(id)a6 notificationCenter:(id)a7 watchManager:(id)a8 keychainStore:(id)a9 lostModeManager:(id)a10 dataSource:(id)a11 bulletinBoard:(id)a12 applicationRegistry:(id)a13 systemInfo:(id)a14 isoCredentialFactory:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  HMDHomeWalletKeyManager *v24;
  HMDHomeWalletKeyManager *v25;
  void *v26;
  id isoCredentialFactory;
  uint64_t v28;
  NSMutableArray *pendingUpdateWalletKeyOperations;
  id isoCredentialACWGFactory;
  id v33;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a4;
  v33 = a5;
  v42 = a5;
  v41 = a6;
  v34 = a7;
  v40 = a7;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v36 = a11;
  v20 = a12;
  v21 = a13;
  v22 = a14;
  v23 = a15;
  v45.receiver = self;
  v45.super_class = (Class)HMDHomeWalletKeyManager;
  v24 = -[HMDHomeWalletKeyManager init](&v45, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, a3);
    objc_storeStrong((id *)&v25->_workQueue, a4);
    objc_storeStrong((id *)&v25->_fileManager, v33);
    objc_storeStrong((id *)&v25->_passLibrary, a6);
    objc_storeStrong((id *)&v25->_notificationCenter, v34);
    objc_storeStrong((id *)&v25->_watchManager, a8);
    v26 = _Block_copy(v23);
    isoCredentialFactory = v25->_isoCredentialFactory;
    v25->_isoCredentialFactory = v26;

    objc_storeStrong((id *)&v25->_keychainStore, a9);
    objc_storeStrong((id *)&v25->_lostModeManager, a10);
    objc_storeStrong((id *)&v25->_dataSource, a11);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    pendingUpdateWalletKeyOperations = v25->_pendingUpdateWalletKeyOperations;
    v25->_pendingUpdateWalletKeyOperations = (NSMutableArray *)v28;

    objc_storeStrong((id *)&v25->_bulletinBoard, a12);
    objc_storeStrong((id *)&v25->_applicationRegistry, a13);
    objc_storeStrong((id *)&v25->_systemInfo, a14);
    isoCredentialACWGFactory = v25->_isoCredentialACWGFactory;
    v25->_isoCredentialACWGFactory = &__block_literal_global_106;

  }
  return v25;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
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
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  HMDHomeWalletKeyManager *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t);
  void *v74;
  id v75;
  id location;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[2];
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
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
    v90 = v8;
    v91 = 2112;
    v92 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager setMessageDispatcher:](v6, "setMessageDispatcher:", v9);

  -[HMDHomeWalletKeyManager setHome:](v6, "setHome:", v4);
  objc_msgSend(v4, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager setCurrentUserUUID:](v6, "setCurrentUserUUID:", v11);

  objc_msgSend(v4, "nfcReaderKeyManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessoryManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", v6);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 131077);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5C50], v6, v16, sel_handleAddWalletKeyMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5C68], v6, v18, sel_handleMessageForPairedWatches_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5CE8], v6, v20, sel_handleEnableExpressForWalletKeyMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD62C0], v6, v22, sel_handleSetHomeKeyExpressSettingsMessage_);

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRoles:", objc_msgSend(v23, "roles") | 1);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 5, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v23;
  v84[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeWalletKeyManagerPersistWalletKeyAddOptionsRemoteMessage"), v6, v26, sel_handlePersistWalletKeyAddOptionsRemoteMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v23;
  v83[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeWalletKeyManagerFetchWalletKeyDeviceStateRemoteMessage"), v6, v28, sel_handleFetchDeviceStateMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5D58], v6, v30, sel_handleFetchAvailableWalletKeyEncodedPKPassMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD5D80], v6, v32, sel_handleFetchWalletKeyColorMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6418], v6, v34, sel_handleFetchDeviceStateMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6410], v6, v36, sel_handleMessageForPairedWatches_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6420], v6, v38, sel_handleFetchMissingWalletKeysMessage_);

  -[HMDHomeWalletKeyManager messageDispatcher](v6, "messageDispatcher");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6460], v6, v40, sel_handleRestoreMissingWalletKeysMessage_);

  -[HMDHomeWalletKeyManager passLibrary](v6, "passLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDelegate:", v6);

  -[HMDHomeWalletKeyManager passLibrary](v6, "passLibrary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "start");

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", v6, sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v4);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", v6, sel_handleHomeNameChangedNotification_, CFSTR("HMDHomeNameChangedNotification"), v4);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", v6, sel_handleHomeAddedAccessoryNotification_, CFSTR("HMDNotificationHomeAddedAccessory"), v4);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", v6, sel_handleHomeAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), v4);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", v6, sel_handleAccessorySupportsWalleyKeyDidChangeNotification_, CFSTR("HMDAccessorySupportsWalletKeyDidChangeNotification"), 0);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObserver:selector:name:object:", v6, sel_handleHomeDidUpdateNFCReaderKeyNotification_, CFSTR("HMDHomeDidUpdateNFCReaderKeyNotification"), v4);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager lostModeManager](v6, "lostModeManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", v6, sel_handleLostModeUpdated, CFSTR("HMDLostModeManagerUpdatedNotification"), v50);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", v6, sel_handleHomeHasOnboardedForWalletKeyChangeNotification_, CFSTR("HMDHomeHasOnboardedForWalletKeyChangeNotification"), v4);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager lostModeManager](v6, "lostModeManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObserver:selector:name:object:", v6, sel_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification, CFSTR("HMDLostModeManagerDidExitLostModeWithAuthCompleteNotification"), v53);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObserver:selector:name:object:", v6, sel_handleApplicationInstalled_, CFSTR("HMDApplicationInstalledNotification"), 0);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObserver:selector:name:object:", v6, sel_handleAccessorySupportsAccessCodeDidChangeNotification_, CFSTR("HMDAccessorySupportsAccessCodeDidChangeNotification"), 0);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObserver:selector:name:object:", v6, sel_handleApplicationUninstalled_, CFSTR("HMDApplicationUninstalledNotification"), 0);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager systemInfo](v6, "systemInfo");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObserver:selector:name:object:", v6, sel_handleSystemInfoMigrationUpdatedNotification_, *MEMORY[0x24BE3F108], v58);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObserver:selector:name:object:", v6, sel_handleUserScheduleDidChangeNotification_, CFSTR("HMDUserScheduleDidChangeNotification"), 0);

  -[HMDHomeWalletKeyManager notificationCenter](v6, "notificationCenter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObserver:selector:name:object:", v6, sel_handleHomeManagerHomeDataLoadedNotification_, CFSTR("HMDHomeManagerHomeDataLoadedNotification"), 0);

  objc_initWeak(&location, v6);
  -[HMDHomeWalletKeyManager dataSource](v6, "dataSource");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager workQueue](v6, "workQueue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = MEMORY[0x24BDAC760];
  v72 = 3221225472;
  v73 = __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke;
  v74 = &unk_24E797318;
  objc_copyWeak(&v75, &location);
  LOBYTE(v34) = objc_msgSend(v61, "registerForPasscodeChangeNotificationWithQueue:callback:", v62, &v71);

  if ((v34 & 1) == 0)
  {
    v67 = (void *)MEMORY[0x227676638](v63, v64, v65, v66);
    v68 = v6;
    HMFGetOSLogHandle();
    v69 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v90 = v70;
      _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for passcode change notification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v67);
  }
  -[HMDHomeWalletKeyManager handleLostModeUpdated](v6, "handleLostModeUpdated", v71, v72, v73, v74);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);

}

- (void)didAddCurrentUserWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager setCurrentUserUUID:](self, "setCurrentUserUUID:", v5);

  if ((objc_msgSend(v4, "isOwner") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Did add current user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](v8, "updateWalletKeyWithReason:flow:completion:", CFSTR("Current user added"), v6, 0);
    }
    else
    {
      -[HMDHomeWalletKeyManager workQueue](v8, "workQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke;
      v14[3] = &unk_24E79C268;
      v14[4] = v8;
      v15 = v6;
      dispatch_async(v13, v14);

    }
  }

}

- (id)walletKeySettingsFileURL
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  -[HMDHomeWalletKeyManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/HMDHomeWalletKeySetting-%@.plist"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldRollWalletKeyAfterMigration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMDHomeWalletKeyManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDHomeWalletKeyManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager walletKeySettingsFileURL](self, "walletKeySettingsFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager fileManager](self, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtURL:", v3))
  {
    v33 = 0;
    objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v3, 2, &v33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend((id)objc_opt_class(), "allowedClassesForWalletKeySettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v6;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v32;

      if (v9)
      {
        v11 = v9;
        objc_opt_class();
        v12 = objc_opt_isKindOfClass() & 1;
        if (v12)
          v13 = v11;
        else
          v13 = 0;
        v31 = v13;

        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v12)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v18;
            v36 = 2112;
            v37 = v11;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Found wallet key settings for migration: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HMDHomeWalletKeySettingsNeedsKeyRollAfterMigration"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v29;
            v36 = 2112;
            v37 = v11;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          v20 = 0;
        }

      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v28;
          v36 = 2112;
          v37 = v10;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v20 = 0;
      }

      v6 = v10;
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
        *(_DWORD *)buf = 138543874;
        v35 = v24;
        v36 = 2112;
        v37 = v3;
        v38 = 2112;
        v39 = v6;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from wallet key settings file %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)shouldEnableExpressModeAfterMigration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHomeWalletKeyManager *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  HMDHomeWalletKeyManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHomeWalletKeyManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDHomeWalletKeyManager *v29;
  NSObject *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager walletKeySettingsFileURL](self, "walletKeySettingsFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager fileManager](self, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtURL:", v3))
  {
    v35 = 0;
    objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v3, 2, &v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v35;
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend((id)objc_opt_class(), "allowedClassesForWalletKeySettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v6;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v34);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v34;

      if (v9)
      {
        v11 = v9;
        objc_opt_class();
        v12 = objc_opt_isKindOfClass() & 1;
        if (v12)
          v13 = v11;
        else
          v13 = 0;
        v33 = v13;

        if (v12)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HMDHomeWalletKeySettingsExpressModeEnabledForMigrationCodingKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x227676638]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v18;
            v38 = 2112;
            v39 = v14;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Found express mode enabled: %@ for migration", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
          v19 = objc_msgSend(v14, "BOOLValue");

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
            *(_DWORD *)buf = 138543618;
            v37 = v31;
            v38 = 2112;
            v39 = v11;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
          v19 = 0;
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
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          v38 = 2112;
          v39 = v10;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        v19 = 0;
      }

      v6 = v10;
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
        v37 = v23;
        v38 = 2112;
        v39 = v3;
        v40 = 2112;
        v41 = v6;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from wallet key settings file %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)removeWalletKeyMigrationSettingsFileFromDisk
{
  void *v3;
  void *v4;
  HMDHomeWalletKeyManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDHomeWalletKeyManager *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager walletKeySettingsFileURL](self, "walletKeySettingsFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing wallet key express mode settings from disk", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDHomeWalletKeyManager fileManager](v5, "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v3, &v14);
  v9 = v14;

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing wallet key migration settings file from disk : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)handleHomeManagerHomeDataLoadedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling HMDHomeManagerHomeDataLoadedNotification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeWalletKeyManager replaceWalletKeyAfterHH2MigrationIfNecessary](v6, "replaceWalletKeyAfterHH2MigrationIfNecessary");

}

- (void)replaceWalletKeyAfterHH2MigrationIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDHomeWalletKeyManager_replaceWalletKeyAfterHH2MigrationIfNecessary__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_replaceWalletKeyAfterHH2Migration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHomeWalletKeyManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  HMDHomeWalletKeyManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomeWalletKeyManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_msgSend(v5, "hasAnyAccessoryWithWalletKeySupport") & 1) != 0)
      {
        if (!-[HMDHomeWalletKeyManager isWalletKeyRollForHH2InProgress](self, "isWalletKeyRollForHH2InProgress"))
        {
          objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "UUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v21;
            v38 = 2112;
            v39 = v22;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Deleting and re-adding wallet key because we just upgraded to HH2", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          -[HMDHomeWalletKeyManager passLibrary](v19, "passLibrary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeWalletKeyManager passSerialNumber](v19, "passSerialNumber");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "removePassWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v24, v17);

          if ((v25 & 1) == 0)
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = v19;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "UUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v29;
              v38 = 2112;
              v39 = v30;
              _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not remove pass because no home key exists in Wallet", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
          }
          if (-[HMDHomeWalletKeyManager shouldEnableExpressModeAfterMigration](v19, "shouldEnableExpressModeAfterMigration"))
          {
            v31 = 3;
          }
          else
          {
            v31 = 1;
          }
          -[HMDHomeWalletKeyManager setIsWalletKeyRollForHH2InProgress:](v19, "setIsWalletKeyRollForHH2InProgress:", 1);
          objc_initWeak((id *)buf, v19);
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __61__HMDHomeWalletKeyManager__replaceWalletKeyAfterHH2Migration__block_invoke;
          v33[3] = &unk_24E77BBD8;
          objc_copyWeak(&v35, (id *)buf);
          v32 = v17;
          v34 = v32;
          -[HMDHomeWalletKeyManager addWalletKeyWithOptions:isOnboarding:isRollingForHH2:flow:completion:](v19, "addWalletKeyWithOptions:isOnboarding:isRollingForHH2:flow:completion:", v31, 0, 1, v32, v33);

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);

          goto LABEL_27;
        }
        v7 = (void *)MEMORY[0x227676638]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v10;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@HH2 key roll is already in progress", buf, 0xCu);

        }
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
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v16;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Can not migrate home key to HH2 because home does not have any accessory that supports wallet key", buf, 0xCu);

        }
      }
    }
    else
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@No current user yet", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v7);
LABEL_27:

    goto LABEL_28;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@home is unexpectedly nil; cannot replace wallet key after HH2 migration",
      buf,
      0xCu);

  }
  objc_autoreleasePoolPop(v11);
LABEL_28:

}

- (void)recoverDueToUUIDChangeOfUser:(id)a3 fromOldUUID:(id)a4
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
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)handleAccessCodeChanged
{
  NSObject *v3;

  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", CFSTR("access code changed"), 0, 0);
  }
  else
  {
    -[HMDHomeWalletKeyManager updateWalletKeyAccessCodeFieldWithReason:](self, "updateWalletKeyAccessCodeFieldWithReason:", CFSTR("access code changed"));
  }
}

- (BOOL)hasHomeKeyInWallet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (NSString)passSerialNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = 0;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@currentUser is nil, so using cached currentUserUUID: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDHomeWalletKeyManager currentUserUUID](v7, "currentUserUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      return (NSString *)0;
  }
  -[HMDHomeWalletKeyManager passSerialNumberWithUserUUID:](self, "passSerialNumberWithUserUUID:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)autoAddWalletKeyWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", CFSTR("autoAddWalletKey API invocation"), v4, 0);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__HMDHomeWalletKeyManager_autoAddWalletKeyWithFlow___block_invoke;
    v6[3] = &unk_24E77BB90;
    v6[4] = self;
    v7 = v4;
    -[HMDHomeWalletKeyManager autoAddWalletKeyWithReason:flow:completion:](self, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("autoAddWalletKey API invocation"), v7, v6);

  }
}

- (void)unconfigure
{
  void *v3;
  id v4;

  -[HMDHomeWalletKeyManager messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDHomeWalletKeyManager notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)handleFetchDeviceStateMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] handleFetchDeviceStateMessage: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = objc_alloc_init(MEMORY[0x24BDD7700]);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke;
  v15[3] = &unk_24E77BC28;
  v15[4] = v8;
  v16 = v6;
  v17 = v4;
  v13 = v4;
  v14 = v6;
  -[HMDHomeWalletKeyManager updateDeviceStateWithCanAddWalletKey:flow:completion:](v8, "updateDeviceStateWithCanAddWalletKey:flow:completion:", v12, v14, v15);

}

- (void)handleFetchWalletKeyColorMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    v24 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling FetchWalletKeyColorMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x227676638]();
  v12 = v7;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling FetchWalletKeyColorMessage", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDHomeWalletKeyManager fetchWalletKeyColorOptionWithFlow:](v12, "fetchWalletKeyColorOptionWithFlow:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__HMDHomeWalletKeyManager_handleFetchWalletKeyColorMessage___block_invoke;
  v20[3] = &unk_24E77BC50;
  v20[4] = v12;
  v21 = v10;
  v22 = v4;
  v17 = v4;
  v18 = v10;
  v19 = (id)objc_msgSend(v16, "addSuccessBlock:", v20);

}

- (void)handleFetchAvailableWalletKeyEncodedPKPassMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
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
  HMDHomeWalletKey *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDHomeWalletKey *v27;
  void *v28;
  HMDHomeWalletKeyManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHomeWalletKeyManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDHomeWalletKeyManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  HMDHomeWalletKeyManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  id v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v10;
    v60 = 2112;
    v61 = v11;
    v62 = 2112;
    v63 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] handleFetchAvailableWalletKeyEncodedPKPassMessage: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "messagePayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_setForKey:", *MEMORY[0x24BDD6440]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_201_46853);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyManager home](v8, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "hasAnyAccessoryWithWalletKeySupport") & 1) != 0
    || (objc_msgSend(v14, "containsObject:", &unk_24E96ABC8) & 1) != 0)
  {
    -[HMDHomeWalletKeyManager passSerialNumber](v8, "passSerialNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v8;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v31;
        v60 = 2112;
        v61 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, serial number is nil", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v17);
      goto LABEL_24;
    }
    objc_msgSend(v15, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[HMDHomeWalletKeyManager passLibrary](v8, "passLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v16, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19 || (objc_msgSend(v14, "containsObject:", &unk_24E96ABE0) & 1) != 0)
      {
        v20 = [HMDHomeWalletKey alloc];
        -[HMDHomeWalletKeyManager dataSource](v8, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "walletKeyColor");
        +[HMDHomeWalletKeySecureElementInfo createForEasyProvisioning](HMDHomeWalletKeySecureElementInfo, "createForEasyProvisioning");
        v51 = v4;
        v23 = v14;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
        v50 = v15;
        v25 = v6;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HMDHomeWalletKey initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:](v20, "initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:", CFSTR("paymentpass.com.apple.dev1"), v16, 1, v17, v17, v22, v26);

        v14 = v23;
        v4 = v51;

        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke_206;
        v54[3] = &unk_24E77BC98;
        v54[4] = v8;
        v55 = v25;
        v56 = v51;
        v6 = v25;
        v15 = v50;
        -[HMDHomeWalletKeyManager createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:](v8, "createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:", v27, 0, 0, 1, 0, v55, v54);

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
      v45 = (void *)MEMORY[0x227676638]();
      v46 = v8;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v53 = v45;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v48;
        v60 = 2112;
        v61 = v49;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass already exists", buf, 0x16u);

        v45 = v53;
      }

      objc_autoreleasePoolPop(v45);
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = 1;
    }
    else
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v8;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v52 = v38;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v41;
        v60 = 2112;
        v61 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, no name configured for home", buf, 0x16u);

        v38 = v52;
      }

      objc_autoreleasePoolPop(v38);
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = 2;
    }
    objc_msgSend(v43, "hmErrorWithCode:", v44);
    v27 = (HMDHomeWalletKey *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v27);
    goto LABEL_23;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v8;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v36;
    v60 = 2112;
    v61 = v37;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] No accessory in home supports wallet key", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v33);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v16);
LABEL_25:

}

- (void)handleEnableExpressForWalletKeyMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeWalletKeyManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeWalletKeyManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message to enable express: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHomeWalletKeyManager passSerialNumber](v8, "passSerialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = *MEMORY[0x24BDD61B0];
    objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD61B0]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HMDHomeWalletKeyManager passLibrary](v8, "passLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __66__HMDHomeWalletKeyManager_handleEnableExpressForWalletKeyMessage___block_invoke;
      v29[3] = &unk_24E799FD0;
      v29[4] = v8;
      v30 = v6;
      v31 = v4;
      objc_msgSend(v16, "enableExpressWithAuthData:passTypeIdentifier:serialNumber:flow:completion:", v15, CFSTR("paymentpass.com.apple.dev1"), v12, v30, v29);

    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v8;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        v36 = 2112;
        v37 = v27;
        v38 = 2112;
        v39 = v13;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express, missing key is payload %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v28);

      v15 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express, serial number is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)handleSetHomeKeyExpressSettingsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeWalletKeyManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDHomeWalletKeyManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  char v38;
  char v39;
  _QWORD v40[5];
  id v41;
  id v42;
  char v43;
  char v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v10;
    v47 = 2112;
    v48 = v11;
    v49 = 2112;
    v50 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling set express settings message: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHomeWalletKeyManager passSerialNumber](v8, "passSerialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = *MEMORY[0x24BDD61B0];
    objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD61B0]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD61C0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD61B8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
      {
        +[HMDPassUpdater shared](HMDPassUpdater, "shared");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke;
        v40[3] = &unk_24E77BCC0;
        v40[4] = v8;
        v41 = v6;
        v42 = v4;
        v43 = v19;
        v44 = v17;
        objc_msgSend(v20, "setExpressSettingsForPassSerialNumber:enableNFCExpress:enableUWB:authData:flow:completionHandler:", v12, v19, v17, v15, v41, v40);

        v21 = v41;
      }
      else
      {
        -[HMDHomeWalletKeyManager passLibrary](v8, "passLibrary");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke_210;
        v35[3] = &unk_24E77BCC0;
        v35[4] = v8;
        v36 = v6;
        v37 = v4;
        v38 = v19;
        v39 = v17;
        objc_msgSend(v34, "setExpressSettingsWithAuthData:enableUWB:enableNFCExpress:passTypeIdentifier:serialNumber:flow:completion:", v15, v17, v19, CFSTR("paymentpass.com.apple.dev1"), v12, v36, v35);

        v21 = v36;
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v8;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v46 = v30;
        v47 = 2112;
        v48 = v31;
        v49 = 2112;
        v50 = v32;
        v51 = 2112;
        v52 = v13;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings, missing key is payload %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v33);

      v15 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v8;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v25;
      v47 = 2112;
      v48 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings, serial number is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)handleMessageForPairedWatches:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMDHomeWalletKeyManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  HMDHomeWalletKeyManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  int v39;
  void *v40;
  HMDHomeWalletKeyManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  __CFString *v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v67 = v10;
    v68 = 2112;
    v69 = v11;
    v70 = 2112;
    v71 = (uint64_t)v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message for watch: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHomeWalletKeyManager watchManager](v8, "watchManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "connectedWatches");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_filter:", &__block_literal_global_212);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v17 = objc_msgSend(v14, "count");
    if (v16)
    {
      v54 = v15;
      objc_msgSend(v13, "watches");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v16 == v19)
      {
        v20 = 0;
      }
      else
      {
        v52 = v6;
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v8;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "UUID");
          v50 = v29;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v67 = v32;
          v68 = 2112;
          v69 = v33;
          v70 = 2048;
          v71 = v16;
          v72 = 2048;
          v73 = v19;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Connected supported watch count: %lu is not equal to paired watch count: %lu", buf, 0x2Au);

          v29 = v50;
        }

        objc_autoreleasePoolPop(v29);
        objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2008);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v52;
      }
      v28 = objc_alloc_init(MEMORY[0x24BE6B608]);
      objc_msgSend(v4, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BDD5C68]);

      v36 = MEMORY[0x24BDAC760];
      if (v35)
      {
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_214;
        v63[3] = &unk_24E78B610;
        v64 = v28;
        v65 = v4;
        -[HMDHomeWalletKeyManager fetchPayloadForAddWalletKeyRemoteMessageWithFlow:completion:](v8, "fetchPayloadForAddWalletKeyRemoteMessageWithFlow:completion:", v6, v63);

        v37 = CFSTR("HMDHomeWalletKeyManagerPersistWalletKeyAddOptionsRemoteMessage");
      }
      else
      {
        objc_msgSend(v4, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x24BDD6410]);

        if (v39)
        {
          objc_msgSend(v28, "finishWithResult:", MEMORY[0x24BDBD1B8]);
          v37 = CFSTR("HMDHomeWalletKeyManagerFetchWalletKeyDeviceStateRemoteMessage");
        }
        else
        {
          v53 = v6;
          v40 = (void *)MEMORY[0x227676638]();
          v41 = v8;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = v40;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "UUID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v67 = v43;
            v68 = 2112;
            v69 = v44;
            v70 = 2112;
            v71 = (uint64_t)v4;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Message is not supported for paired watches: %@", buf, 0x20u);

            v40 = v51;
          }

          objc_autoreleasePoolPop(v40);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "finishWithError:", v45);

          v37 = 0;
          v6 = v53;
          v36 = MEMORY[0x24BDAC760];
        }
      }
      v61[0] = v36;
      v61[1] = 3221225472;
      v61[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_216;
      v61[3] = &unk_24E79BD80;
      v46 = v4;
      v62 = v46;
      v47 = (id)objc_msgSend(v28, "addFailureBlock:", v61);
      v56[0] = v36;
      v56[1] = 3221225472;
      v56[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_2;
      v56[3] = &unk_24E77BD50;
      v56[4] = v8;
      v57 = (__CFString *)v37;
      v15 = v54;
      v58 = v54;
      v59 = v20;
      v60 = v46;
      v48 = v20;
      v49 = (id)objc_msgSend(v28, "addSuccessBlock:", v56);

    }
    else
    {
      v21 = v17;
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v8;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = v6;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUID");
        v55 = v15;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v67 = v26;
        v68 = 2112;
        v69 = v27;
        v70 = 2112;
        v71 = (uint64_t)v4;
        v72 = 2048;
        v73 = v21;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling message for paired watches:%@ connected watches count is %lu but none are supported", buf, 0x2Au);

        v15 = v55;
        v6 = v25;
      }

      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v28);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)handleAddWalletKeyMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v4;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message to add wallet key %@ payload: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD5C58]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_initWeak((id *)buf, v8);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__HMDHomeWalletKeyManager_handleAddWalletKeyMessage___block_invoke;
  v17[3] = &unk_24E77BD78;
  objc_copyWeak(&v20, (id *)buf);
  v15 = v4;
  v18 = v15;
  v16 = v6;
  v19 = v16;
  -[HMDHomeWalletKeyManager addWalletKeyWithOptions:isOnboarding:flow:completion:](v8, "addWalletKeyWithOptions:isOnboarding:flow:completion:", v14, 1, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)handlePersistWalletKeyAddOptionsRemoteMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
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
  HMDHomeWalletKeyManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v9;
    v26 = 2112;
    v27 = v4;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remote message to add wallet key: %@ payload: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMDHomeWalletKeyManagerRemoteMessageKeyNFCReaderKey"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDHomeWalletKeyManager dataSource](v7, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmf_hexadecimalRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistNumberValueToNoBackupStore:withKey:", v14, v16);

    objc_msgSend(v4, "respondWithPayload:", MEMORY[0x24BDBD1B8]);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing nfc reader key in the message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v22);

  }
}

- (void)handleFetchMissingWalletKeysMessage:(id)a3
{
  id v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
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
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling FetchMissingWalletKeysMessage: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeWalletKeyManager home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nfcReaderKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessoryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageTargetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyManager workQueue](v6, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "redispatchToResidentMessage:target:responseQueue:", v4, v12, v13);

}

- (void)handleRestoreMissingWalletKeysMessage:(id)a3
{
  id v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
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
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling RestoreMissingWalletKeysMessage: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeWalletKeyManager home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nfcReaderKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessoryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageTargetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyManager workQueue](v6, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "redispatchToResidentMessage:target:responseQueue:", v4, v12, v13);

}

- (void)addIssuerKeysToMatterAccessoriesWithFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
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
  void *v20;
  void *v21;
  HMDHomeWalletKeyManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] addIssuerKeysToMatterAccessories", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyManager home](v7, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasAnyResident"))
  {
    v13 = (void *)MEMORY[0x24BE3F1D0];
    v28 = *MEMORY[0x24BE3EBF8];
    HMFEncodedRootObject();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entitledMessageWithName:messagePayload:", CFSTR("HMDHomeWalletKeyAccessoryManagerAddIssuerKeysToAccessoriesMessage"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "nfcReaderKeyManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessoryManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "messageTargetUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1B8]), "initWithTarget:", v19);
    v21 = (void *)MEMORY[0x227676638](objc_msgSend(v16, "setDestination:", v20));
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = v4;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] sending message: %@", buf, 0x20u);

      v4 = v27;
    }

    objc_autoreleasePoolPop(v21);
    -[HMDHomeWalletKeyManager workQueue](v22, "workQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "redispatchToResidentMessage:target:responseQueue:", v16, v19, v26);

  }
  else
  {
    objc_msgSend(v12, "nfcReaderKeyManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addIssuerKeysToMatterAccessoriesWithFlow:", v5);
  }

}

- (BOOL)canAutoAddWalletKeyWithError:(id *)a3
{
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager systemInfo](self, "systemInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMigrating");

  if (!v6)
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nfcReaderKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_hexadecimalRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (-[HMDHomeWalletKeyManager dataSource](self, "dataSource"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "numberValueFromNoBackupStoreWithKey:", v11),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13)
      || (objc_msgSend(v8, "hasOnboardedForWalletKey") & 1) != 0)
    {
      if (-[HMDHomeWalletKeyManager isHomeBeingRemoved](self, "isHomeBeingRemoved"))
      {
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"), 4, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v17;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Cannot auto add wallet key because home is currently being removed", (uint8_t *)&v21, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        goto LABEL_20;
      }
      if (!-[HMDHomeWalletKeyManager shouldRollWalletKeyAfterMigration](self, "shouldRollWalletKeyAfterMigration"))
      {
        v7 = 1;
        goto LABEL_22;
      }
      if (!a3)
        goto LABEL_20;
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 3;
    }
    else
    {
      if (!a3)
      {
LABEL_20:
        v7 = 0;
        goto LABEL_22;
      }
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 2;
    }
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"), v19, 0);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    return v7;
  }
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"), 1, 0);
  v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)fetchExpressEnablementConflictingPassDescriptionWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomeWalletKey *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMDHomeWalletKey *v22;
  void *v23;
  HMDHomeWalletKeyManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDHomeWalletKeyManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secureElementIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HMDHomeWalletKeyManager home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDHomeWalletKeySecureElementInfo createForExpressConflictCheckWithSecureElementIdentifier:](HMDHomeWalletKeySecureElementInfo, "createForExpressConflictCheckWithSecureElementIdentifier:", v11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [HMDHomeWalletKey alloc];
      -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
      v15 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v6;
      v18 = objc_msgSend(v16, "walletKeyColor");
      v38 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      v6 = v17;
      v22 = -[HMDHomeWalletKey initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:](v14, "initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:", CFSTR("paymentpass.com.apple.dev1"), v19, 1, v13, v13, v21, v20);

      v7 = v15;
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke;
      v35[3] = &unk_24E77BDC8;
      v35[4] = self;
      v36 = v17;
      v37 = v15;
      v9 = v19;
      -[HMDHomeWalletKeyManager createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:](self, "createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:", v22, 0, 1, 0, 0, v36, v35);

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
        objc_msgSend(v6, "UUID");
        v32 = v7;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v31;
        v41 = 2112;
        v42 = v33;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express enablement conflicting pass description, secure element identifier is nil", buf, 0x16u);

        v7 = v32;
      }

      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express enablement conflicting pass description, wallet key serial number is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

- (void)updateDeviceStateWithCanAddWalletKey:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke;
  v14[3] = &unk_24E7912A8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[HMDHomeWalletKeyManager fetchHomeKeySupportedWithFlow:completion:](self, "fetchHomeKeySupportedWithFlow:completion:", v10, v14);

}

- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isWalletVisible");

  if ((v10 & 1) != 0)
  {
    -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__HMDHomeWalletKeyManager_fetchHomeKeySupportedWithFlow_completion___block_invoke;
    v13[3] = &unk_24E783930;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v11, "fetchHomeKeySupportedWithFlow:completion:", v6, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD6400], 8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

- (void)updateDeviceStateWithWalletKey:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v12, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke;
      v16[3] = &unk_24E77BE18;
      v16[4] = self;
      v17 = v9;
      v20 = v10;
      v18 = v14;
      v19 = v8;
      objc_msgSend(v15, "fetchIsExpressEnabledForPassWithTypeIdentifier:serialNumber:flow:completion:", CFSTR("paymentpass.com.apple.dev1"), v12, v17, v16);

    }
    else
    {
      (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v8, 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
  }

}

- (void)updateDeviceStateWithExpressEnablementConflictingPassDescription:(id)a3 flow:(id)a4 completion:(id)a5
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
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke;
  v15[3] = &unk_24E77BE40;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  -[HMDHomeWalletKeyManager fetchExpressEnablementConflictingPassDescriptionWithFlow:completion:](self, "fetchExpressEnablementConflictingPassDescriptionWithFlow:completion:", v14, v15);

}

- (void)sendMessageWithName:(id)a3 payload:(id)a4 toWatches:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HMDRemoteDeviceMessageDestination *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  HMDRemoteMessage *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id obj;
  id v29;
  _QWORD block[4];
  id v31;
  HMDHomeWalletKeyManager *v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[6];
  id v37;
  id v38;
  NSObject *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  _QWORD v51[4];
  int v52;
  _QWORD v53[3];
  char v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v29 = a4;
  v11 = a5;
  v27 = a6;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = dispatch_group_create();
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2810000000;
  v51[3] = &unk_22282991F;
  v52 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__46802;
  v48[4] = __Block_byref_object_dispose__46803;
  v49 = 0;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v45;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17);
        dispatch_group_enter(v13);
        v19 = [HMDRemoteDeviceMessageDestination alloc];
        -[HMDHomeWalletKeyManager uuid](self, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v19, "initWithTarget:device:", v20, v18);

        v22 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", v10, 25, v21, v29, 0, 1, 10.0);
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke;
        v36[3] = &unk_24E77BE68;
        v36[4] = self;
        v36[5] = v18;
        v37 = v10;
        v40 = v51;
        v41 = v53;
        v42 = v50;
        v43 = v48;
        v38 = v14;
        v39 = v13;
        -[HMDRemoteMessage setResponseHandler:](v22, "setResponseHandler:", v36);
        -[HMDHomeWalletKeyManager messageDispatcher](self, "messageDispatcher");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sendMessage:", v22);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v15);
  }

  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke_238;
  block[3] = &unk_24E77BE90;
  v31 = v14;
  v32 = self;
  v33 = v27;
  v34 = v50;
  v35 = v48;
  v25 = v27;
  v26 = v14;
  dispatch_group_notify(v13, v24, block);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

}

- (void)fetchPayloadForAddWalletKeyRemoteMessageWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__HMDHomeWalletKeyManager_fetchPayloadForAddWalletKeyRemoteMessageWithFlow_completion___block_invoke;
  v10[3] = &unk_24E77BEB8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[HMDHomeWalletKeyManager fetchOrCreateReaderKeyWithFlow:completion:](self, "fetchOrCreateReaderKeyWithFlow:completion:", v7, v10);

}

- (void)addWalletKeyWithOptions:(int64_t)a3 isOnboarding:(BOOL)a4 flow:(id)a5 completion:(id)a6
{
  -[HMDHomeWalletKeyManager addWalletKeyWithOptions:isOnboarding:isRollingForHH2:flow:completion:](self, "addWalletKeyWithOptions:isOnboarding:isRollingForHH2:flow:completion:", a3, a4, 0, a5, a6);
}

- (void)addWalletKeyWithOptions:(int64_t)a3 isOnboarding:(BOOL)a4 isRollingForHH2:(BOOL)a5 flow:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void (**v13)(id, void *, void *);
  NSObject *v14;
  void *v15;
  HMDHomeWalletKeyManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeWalletKeyManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDHomeWalletKeyManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(id, void *, void *);
  void *v38;
  HMDHomeKeySetupWalletLogEvent *v39;
  void *v40;
  HMDHomeKeySetupWalletLogEvent *v41;
  _QWORD v42[5];
  void (**v43)(id, void *, void *);
  void (**v44)(id, void *, void *);
  int64_t v45;
  _QWORD v46[5];
  id v47;
  void (**v48)(id, void *, void *);
  int64_t v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  int64_t v55;
  uint64_t v56;

  v8 = a5;
  v9 = a4;
  v56 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = (void (**)(id, void *, void *))a7;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v18;
    v52 = 2112;
    v53 = v19;
    v54 = 2048;
    v55 = a3;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key with options: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDHomeWalletKeyManager passSerialNumber](v16, "passSerialNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[HMDHomeWalletKeyManager passLibrary](v16, "passLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v20, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v16;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v26;
        v52 = 2112;
        v53 = v27;
        v54 = 2112;
        v55 = (int64_t)v22;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home Key already exists in Wallet: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v22, v28);

    }
    else
    {
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
      {
        +[HMDPassUpdater shared](HMDPassUpdater, "shared");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeWalletKeyManager uuid](v16, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke;
        v46[3] = &unk_24E77BF30;
        v46[4] = v16;
        v48 = v13;
        v47 = v12;
        v49 = a3;
        objc_msgSend(v34, "updatePassForHomeUUID:isOnboarding:isRollingForHH2:optionsNumber:flow:completionHandler:", v35, v9, v8, v36, v47, v46);

        v37 = v48;
      }
      else
      {
        -[HMDHomeWalletKeyManager logEvent](v16, "logEvent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          v39 = [HMDHomeKeySetupWalletLogEvent alloc];
          -[HMDHomeWalletKeyManager workQueue](v16, "workQueue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[HMDHomeKeySetupWalletLogEvent initWithQueue:](v39, "initWithQueue:", v40);
          -[HMDHomeWalletKeyManager setLogEvent:](v16, "setLogEvent:", v41);

        }
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke_246;
        v42[3] = &unk_24E77BF58;
        v42[4] = v16;
        v43 = (void (**)(id, void *, void *))v12;
        v44 = v13;
        v45 = a3;
        -[HMDHomeWalletKeyManager fetchOrCreateReaderKeyWithFlow:completion:](v16, "fetchOrCreateReaderKeyWithFlow:completion:", v43, v42);

        v37 = v43;
      }

      v22 = 0;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v16;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v32;
      v52 = 2112;
      v53 = v33;
      v54 = 2112;
      v55 = 0;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Could not find passSerialNumber: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v22);
  }

}

- (void)fetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  void *v9;
  HMDHomeWalletKeyManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeWalletKeyManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDHomeWalletKeyManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v6, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetch or create reader key", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDHomeWalletKeyManager home](v10, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v10;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, home is nil", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((objc_msgSend(v14, "hasAnyAccessoryWithWalletKeySupport") & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v10;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v26;
      v30 = 2112;
      v31 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home doesn't have any accessory that supports wallet key", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 48, 0);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v16 = (void *)v22;
    v7[2](v7, 0, v22);
    goto LABEL_13;
  }
  objc_msgSend(v15, "nfcReaderKeyManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchOrCreateReaderKeyWithRequiresPrivateKey:flow:completion:", 0, v6, v7);
LABEL_13:

}

- (void)fetchWalletKeyColorOptionWithFlow:(id)a3 completion:(id)a4
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
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)fetchWalletKeyColorOptionWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  HMDHomeWalletKeyManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchWalletKeyColorOption", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDHomeWalletKeyManager home](v7, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nfcReaderKeyManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __61__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow___block_invoke;
    v26[3] = &unk_24E793168;
    v26[4] = v7;
    v27 = v4;
    v15 = v11;
    v28 = v15;
    objc_msgSend(v14, "fetchWalletKeyColorWithFlow:completion:", v27, v26);
    v16 = v28;
    v17 = v15;

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
      objc_msgSend(v4, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessory manager found, using default wallet key color", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v23 = (void *)MEMORY[0x24BDD16E0];
    -[HMDHomeWalletKeyManager dataSource](v19, "dataSource");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v17, "walletKeyColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithResult:", v24);

  }
  return v11;
}

- (void)addWalletKeyWithOptions:(int64_t)a3 nfcReaderKey:(id)a4 flow:(id)a5 completion:(id)a6
{
  NSObject *v10;
  void *v11;
  HMDHomeWalletKeyManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  HMDHomeWalletKeyManager *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  HMDHomeWalletKeyManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDHomeWalletKeyManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDHomeWalletKeyManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDHomeWalletKeyManager *v51;
  NSObject *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  int64_t v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75[2];
  id location;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  int64_t v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v60 = a4;
  v62 = a5;
  v61 = a6;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v62, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v78 = v14;
    v79 = 2112;
    v80 = v15;
    v81 = 2048;
    v82 = a3;
    v83 = 2112;
    v84 = v60;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key with options: %ld, readerKey: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDHomeWalletKeyManager home](v12, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[HMDHomeWalletKeyManager passSerialNumber](v12, "passSerialNumber");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        -[HMDHomeWalletKeyManager addWalletKeyFuture](v12, "addWalletKeyFuture");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v20 = objc_alloc_init(MEMORY[0x24BE6B608]);
          -[HMDHomeWalletKeyManager setAddWalletKeyFuture:](v12, "setAddWalletKeyFuture:", v20);

        }
        -[HMDHomeWalletKeyManager addWalletKeyFuture](v12, "addWalletKeyFuture");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v12);
        -[HMDHomeWalletKeyManager addWalletKeyFuture](v12, "addWalletKeyFuture");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BE6B628];
        -[HMDHomeWalletKeyManager workQueue](v12, "workQueue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "schedulerWithDispatchQueue:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "reschedule:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = MEMORY[0x24BDAC760];
        v71[1] = 3221225472;
        v71[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke;
        v71[3] = &unk_24E77BF80;
        v57 = v75;
        objc_copyWeak(v75, &location);
        v56 = v62;
        v72 = v56;
        v74 = v61;
        v27 = v21;
        v73 = v27;
        v75[1] = (id)a3;
        v28 = (id)objc_msgSend(v26, "addCompletionBlock:", v71);

        if (v19)
        {
          v29 = (void *)MEMORY[0x227676638]();
          v30 = v12;
          HMFGetOSLogHandle();
          v31 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "UUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v32;
            v79 = 2112;
            v80 = v33;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Add wallet key is already in progress", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
        }
        else
        {
          if (_os_feature_enabled_impl()
            && ((isInternalBuild() & 1) != 0
             || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
          {
            objc_msgSend(v17, "acwgGroupResolvingKey", v56, v75, v58);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v49 = 0;
          }
          v50 = (void *)MEMORY[0x227676638]();
          v51 = v12;
          HMFGetOSLogHandle();
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "UUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v53;
            v79 = 2112;
            v80 = v54;
            _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching home key supported", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v50);
          v63[0] = MEMORY[0x24BDAC760];
          v63[1] = 3221225472;
          v63[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_249;
          v63[3] = &unk_24E77C020;
          v63[4] = v51;
          v64 = v56;
          v65 = v60;
          v66 = v58;
          v67 = v17;
          v55 = v49;
          v68 = v55;
          v69 = v18;
          v70 = a3;
          -[HMDHomeWalletKeyManager fetchHomeKeySupportedWithFlow:completion:](v51, "fetchHomeKeySupportedWithFlow:completion:", v64, v63);

        }
        objc_destroyWeak(v57);
        objc_destroyWeak(&location);
      }
      else
      {
        v44 = (void *)MEMORY[0x227676638]();
        v45 = v12;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "UUID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v47;
          v79 = 2112;
          v80 = v48;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, serial number is nil", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id))v61 + 2))(v61, 0, v27);
      }

    }
    else
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v12;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "UUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v42;
        v79 = 2112;
        v80 = v43;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, no name configured for home", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v61 + 2))(v61, 0, v59);

    }
  }
  else
  {
    v34 = (void *)MEMORY[0x227676638]();
    v35 = v12;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "UUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v78 = v37;
      v79 = 2112;
      v80 = v38;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v61 + 2))(v61, 0, v18);
  }

}

- (void)configureWalletPaymentApplicationsWithNFCReaderKey:(id)a3 serialNumber:(id)a4 homeUniqueIdentifier:(id)a5 homeGRK:(id)a6 flow:(id)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v11 = a8;
  v12 = a7;
  v13 = a3;
  -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publicKeyExternalRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "generateHomeKeyNFCInfoWithReaderPublicKey:readerIdentifier:flow:completion:", v14, v15, v12, v11);
}

- (void)addWalletKey:(id)a3 withOptions:(int64_t)a4 assertion:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeWalletKeyManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  int64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMHomeAddWalletKeyOptionsDescription();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v17;
    v38 = 2112;
    v39 = v18;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v19;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key: %@ with options: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v15;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v30 = v21;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      v40 = 2112;
      v41 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] New Wallet key in process of adding, creating client wallet key uuid: %@", buf, 0x20u);

      v21 = v30;
    }

    objc_autoreleasePoolPop(v21);
    -[HMDHomeWalletKeyManager home](v22, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "saveClientWalletKeyUUIDToLocalStore:", v20);

  }
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke;
  v31[3] = &unk_24E77C098;
  v31[4] = v15;
  v32 = v12;
  v33 = v11;
  v34 = v10;
  v35 = a4;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  -[HMDHomeWalletKeyManager createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:](v15, "createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:", v27, a4, 0, 1, 1, v29, v31);

}

- (void)enableExpressWithOptions:(int64_t)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if ((a3 & 6) != 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Enabling express after adding home key", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDHomeWalletKeyManager passLibrary](v12, "passLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyManager passSerialNumber](v12, "passSerialNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__HMDHomeWalletKeyManager_enableExpressWithOptions_flow_completion___block_invoke;
    v18[3] = &unk_24E79A050;
    v19 = v10;
    objc_msgSend(v16, "setExpressSettingsWithAuthData:enableUWB:enableNFCExpress:passTypeIdentifier:serialNumber:flow:completion:", 0, ((unint64_t)a3 >> 2) & 1, ((unint64_t)a3 >> 1) & 1, CFSTR("paymentpass.com.apple.dev1"), v17, v8, v18);

  }
  else
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)createExpressModeSetUpBulletin
{
  void *v3;
  int v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWatch");

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Not creating express mode setup bulletin on this device", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDHomeWalletKeyManager bulletinBoard](self, "bulletinBoard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertWalletKeyExpressModeSetUpBulletinForHome:", v9);

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
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Can not create express mode setup bulletin because home is nil", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
}

- (void)removeWalletKeyOnboardingBulletin
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHomeWalletKeyManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWatch");

  if ((v4 & 1) == 0)
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "hasPostedWalletKeyOnboardingBulletinForAnyAccessory"))
      {
        -[HMDHomeWalletKeyManager bulletinBoard](self, "bulletinBoard");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeWalletKeyOnboardingBulletinForHome:", v6);

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Can not remove wallet key onboarding bulletin because home is nil", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (void)syncDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDHomeWalletKeyManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeWalletKeyManager *v22;
  NSObject *v23;
  void *v24;
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
  v8 = a3;
  v9 = a5;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] Syncing device credential key", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDHomeWalletKeyManager home](v13, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nfcReaderKeyManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessoryManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __63__HMDHomeWalletKeyManager_syncDeviceCredentialKey_ofType_flow___block_invoke;
    v26[3] = &unk_24E79BCC8;
    v26[4] = v13;
    v27 = v11;
    objc_msgSend(v20, "configureAllAccessoriesWithDeviceCredentialKey:ofType:flow:completion:", v8, a4, v27, v26);

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v13;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessory manager found to sync device credential key", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)enqueueWalletKeyUpdateOperation:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeWalletKeyManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomeWalletKeyManager pendingUpdateWalletKeyOperations](self, "pendingUpdateWalletKeyOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _Block_copy(v6);
  objc_msgSend(v9, "addObject:", v10);

  if (-[HMDHomeWalletKeyManager isWalletKeyUpdateOperationInProgress](self, "isWalletKeyUpdateOperationInProgress")
    || (-[HMDHomeWalletKeyManager addWalletKeyFuture](self, "addWalletKeyFuture"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key update operation in progress, update will happen later", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    -[HMDHomeWalletKeyManager handlePendingWalletKeyUpdateOperationsWithFlow:](self, "handlePendingWalletKeyUpdateOperationsWithFlow:", v7);
  }

}

- (void)handlePendingWalletKeyUpdateOperationsWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHomeWalletKeyManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  HMDHomeWalletKeyManager *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDHomeWalletKeyManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  HMDHomeWalletKeyManager *v45;
  NSObject *v46;
  NSObject *v47;
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
  HMDHomeWalletKeyManager *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  char v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[HMDHomeWalletKeyManager isWalletKeyUpdateOperationInProgress](self, "isWalletKeyUpdateOperationInProgress"))
  {
    -[HMDHomeWalletKeyManager pendingUpdateWalletKeyOperations](self, "pendingUpdateWalletKeyOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hmf_isEmpty");

    if ((v7 & 1) == 0)
    {
      -[HMDHomeWalletKeyManager pendingUpdateWalletKeyOperations](self, "pendingUpdateWalletKeyOperations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      -[HMDHomeWalletKeyManager pendingUpdateWalletKeyOperations](self, "pendingUpdateWalletKeyOperations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

      -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v13, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v78 = v18;
          v79 = 2112;
          v80 = v19;
          v81 = 2112;
          v82 = (uint64_t)v11;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping wallet key update since key with serial number does not exist: %@", buf, 0x20u);
          goto LABEL_9;
        }
LABEL_10:

        objc_autoreleasePoolPop(v15);
LABEL_52:

        goto LABEL_53;
      }
      if (objc_msgSend(v14, "isMissingNFCInfo"))
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "nfcInfos");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v78 = v18;
          v79 = 2112;
          v80 = v19;
          v81 = 2112;
          v82 = (uint64_t)v20;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Can't update wallet key because we are missing NFC info for the current wallet key. NFCInfo: %@", buf, 0x20u);

LABEL_9:
          goto LABEL_10;
        }
        goto LABEL_10;
      }
      v67 = v11;
      v21 = v14;
      v76 = 0;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v68 = v9;
      v22 = v9;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      v66 = v21;
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v73;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v73 != v25)
              objc_enumerationMutation(v22);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i) + 16))();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v76)
            {

              goto LABEL_23;
            }
            if (v27)
            {
              v29 = v27;

              v21 = v29;
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
          if (v24)
            continue;
          break;
        }
      }
LABEL_23:

      if (v76)
      {
        -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v67;
        v31 = objc_msgSend(v30, "removePassWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v67, v4);

        v32 = (void *)MEMORY[0x227676638]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if ((v31 & 1) != 0)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "UUID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v36;
            v79 = 2112;
            v80 = v37;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully removed home key fom wallet", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
          if (_os_feature_enabled_impl()
            && ((isInternalBuild() & 1) != 0
             || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
          {
            v38 = (void *)MEMORY[0x227676638]();
            v39 = v33;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "UUID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v78 = v41;
              v79 = 2112;
              v80 = v42;
              _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resetting dismissed UWB onboarding flag and clearing client wallet key UUID", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v38);
            -[HMDHomeWalletKeyManager home](v39, "home");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "resetHomeKeyMiscInfo");

          }
          goto LABEL_51;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v51;
          v79 = 2112;
          v80 = v52;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove home key from wallet", buf, 0x16u);

        }
      }
      else
      {
        v44 = objc_msgSend(v21, "isMissingNFCInfo");
        v32 = (void *)MEMORY[0x227676638]();
        v45 = self;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        v11 = v67;
        if (!v44)
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "UUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v78 = v53;
            v79 = 2112;
            v80 = v54;
            v81 = 2112;
            v82 = (uint64_t)v66;
            v83 = 2112;
            v84 = v21;
            _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating home key in Wallet from %@ to %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v32);
          -[HMDHomeWalletKeyManager home](v45, "home");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (_os_feature_enabled_impl()
            && ((isInternalBuild() & 1) != 0
             || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
          {
            objc_msgSend(v55, "clientWalletKeyUUID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v56)
            {
              v57 = (void *)MEMORY[0x227676638]();
              v58 = v45;
              HMFGetOSLogHandle();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v57;
                objc_msgSend(v4, "UUID");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "uuid");
                v61 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v78 = v64;
                v79 = 2112;
                v80 = v60;
                v81 = 2112;
                v82 = v61;
                v62 = (void *)v61;
                _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key UUID for client has not been set, the existing wallet key being updated is pre-UWB, so saving the existingWalletKey as the wallet key's UUID: %@ going forward", buf, 0x20u);

                v57 = v65;
              }

              objc_autoreleasePoolPop(v57);
              objc_msgSend(v66, "uuid");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "saveClientWalletKeyUUIDToLocalStore:", v63);

            }
          }
          -[HMDHomeWalletKeyManager setIsWalletKeyUpdateOperationInProgress:](v45, "setIsWalletKeyUpdateOperationInProgress:", 1);
          v69[0] = MEMORY[0x24BDAC760];
          v69[1] = 3221225472;
          v69[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke;
          v69[3] = &unk_24E77BC98;
          v69[4] = v45;
          v70 = v4;
          v71 = v21;
          -[HMDHomeWalletKeyManager createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:](v45, "createPassDirectoryWithWalletKey:options:shouldSkipResourceFiles:shouldCreateZipArchive:validateNFCInfo:flow:completion:", v71, 0, 0, 1, 1, v70, v69);

          goto LABEL_51;
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "nfcInfos");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v78 = v48;
          v79 = 2112;
          v80 = v49;
          v81 = 2112;
          v82 = (uint64_t)v50;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update wallet key because we have lost NFC info: %@", buf, 0x20u);

        }
      }
      objc_autoreleasePoolPop(v32);
LABEL_51:

      v9 = v68;
      goto LABEL_52;
    }
  }
LABEL_53:

}

- (void)addISOCredentialWithPassAtURL:(id)a3 walletKey:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a4, "nfcInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke;
  v27[3] = &unk_24E77C0E8;
  v27[4] = self;
  v28 = v10;
  v29 = v11;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "na_map:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "combineAllFutures");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BE6B628];
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "schedulerWithDispatchQueue:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reschedule:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke_2;
  v25[3] = &unk_24E787600;
  v26 = v12;
  v23 = v12;
  v24 = (id)objc_msgSend(v22, "addCompletionBlock:", v25);

}

- (void)addISOCredentialV0WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDHomeWalletKeyManager *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDHomeWalletKeyManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(v11, "deviceCredentialKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      v42 = 2112;
      v43 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating iso credential...", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDHomeWalletKeyManager keychainStore](v17, "keychainStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getPreferredHH2ControllerKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[HMDHomeWalletKeyManager isoCredentialFactory](v17, "isoCredentialFactory");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v24)[2](v24, v23, v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke;
      v35[3] = &unk_24E796D00;
      v35[4] = v17;
      v36 = v12;
      v39 = v13;
      v37 = v11;
      v38 = v10;
      objc_msgSend(v25, "encodeWithCompletion:", v35);

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v17;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v34 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v31;
        v42 = 2112;
        v43 = v32;
        v44 = 2112;
        v45 = 0;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get local pairing identity %@", buf, 0x20u);

        v28 = v34;
      }

      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 52, v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v33);

    }
  }
  else
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v26;
      v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding ISO credential because there is no device credential key", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

- (void)addISOCredentialV1WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDHomeWalletKeyManager *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    objc_msgSend(v11, "deviceCredentialKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 2112;
        v34 = v21;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating iso credential...", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      +[HMDACWGKeyManager shared](HMDACWGKeyManager, "shared");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke;
      v25[3] = &unk_24E77C110;
      v25[4] = v17;
      v26 = v12;
      v30 = v13;
      v27 = v15;
      v28 = v11;
      v29 = v10;
      objc_msgSend(v22, "getIssuerKeyPairExternalRepresentationFromKeychainWithCompletionHandler:", v25);

    }
    else
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v23;
        v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding ISO credential because there is no device credential key", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
    }

  }
}

- (id)createPassDirectoryWithResourceFilesWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  HMDHomeWalletKeyManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory with resources files", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("HomeKey-Wallet.pass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager passLibrary](v7, "passLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createTemporaryPassDirectoryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyManager fileManager](v7, "fileManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v17 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v13, v15, &v26);
  v18 = v26;

  if ((v17 & 1) != 0)
  {
    v19 = v15;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to copy item at URL %@ to %@ : %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

- (id)createPassDirectoryWithoutResourceFilesWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  HMDHomeWalletKeyManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HMDHomeWalletKeyManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  HMDHomeWalletKeyManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v9;
    v51 = 2112;
    v52 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory without resources files", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("HomeKey-Wallet.pass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager passLibrary](v7, "passLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createTemporaryPassDirectoryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyManager fileManager](v7, "fileManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 0, 0, &v48);
  v18 = v48;

  if ((v17 & 1) != 0)
  {
    v45 = v4;
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("pass.json"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("pass.json"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyManager fileManager](v7, "fileManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v18;
    v22 = objc_msgSend(v21, "copyItemAtURL:toURL:error:", v19, v20, &v47);
    v23 = v47;

    if ((v22 & 1) != 0)
    {
      v18 = v23;
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
        v43 = v30;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v50 = v33;
        v51 = 2112;
        v52 = v34;
        v53 = 2112;
        v54 = v15;
        v55 = 2112;
        v56 = v23;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create directory at path %@:%@", buf, 0x2Au);

        v30 = v43;
      }

      objc_autoreleasePoolPop(v30);
      -[HMDHomeWalletKeyManager fileManager](v31, "fileManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v23;
      v36 = objc_msgSend(v35, "removeItemAtURL:error:", v15, &v46);
      v18 = v46;

      if ((v36 & 1) == 0)
      {
        v37 = (void *)MEMORY[0x227676638]();
        v38 = v31;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = v37;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v50 = v40;
          v51 = 2112;
          v52 = v41;
          v53 = 2112;
          v54 = v15;
          v55 = 2112;
          v56 = v18;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

          v37 = v44;
        }

        objc_autoreleasePoolPop(v37);
      }
    }
    v4 = v45;
    v29 = v15;

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
      objc_msgSend(v4, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v50 = v27;
      v51 = 2112;
      v52 = v28;
      v53 = 2112;
      v54 = v15;
      v55 = 2112;
      v56 = v18;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create directory at path %@:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v24);
    v29 = 0;
  }

  return v29;
}

- (void)createPassDirectoryWithWalletKey:(id)a3 options:(int64_t)a4 shouldSkipResourceFiles:(BOOL)a5 shouldCreateZipArchive:(BOOL)a6 validateNFCInfo:(BOOL)a7 flow:(id)a8 completion:(id)a9
{
  _BOOL4 v10;
  id v13;
  NSObject *v14;
  void *v15;
  HMDHomeWalletKeyManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDHomeWalletKeyManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  HMDHomeWalletKeyManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  char v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  LODWORD(v40) = a7;
  HIDWORD(v40) = a6;
  v10 = a5;
  v63 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v13 = a8;
  v41 = a9;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v52 = v18;
    v53 = 2112;
    v54 = v19;
    v55 = 2112;
    v56 = v42;
    v57 = 2048;
    v58 = a4;
    v59 = 2112;
    v60 = v20;
    v61 = 2112;
    v62 = v21;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory with wallet key: %@, options: %ld, shouldSkipResourceFiles: %@, shouldCreateZipArchive: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v15);
  if (v10)
    -[HMDHomeWalletKeyManager createPassDirectoryWithoutResourceFilesWithFlow:](v16, "createPassDirectoryWithoutResourceFilesWithFlow:", v13);
  else
    -[HMDHomeWalletKeyManager createPassDirectoryWithResourceFilesWithFlow:](v16, "createPassDirectoryWithResourceFilesWithFlow:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "URLByAppendingPathComponent:", CFSTR("pass.json"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyManager updatePassJSONAtURL:withWalletKey:options:validateNFCInfo:flow:](v16, "updatePassJSONAtURL:withWalletKey:options:validateNFCInfo:flow:", v24, v42, a4, v40, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_initWeak((id *)buf, v16);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __147__HMDHomeWalletKeyManager_createPassDirectoryWithWalletKey_options_shouldSkipResourceFiles_shouldCreateZipArchive_validateNFCInfo_flow_completion___block_invoke;
      v43[3] = &unk_24E77C138;
      objc_copyWeak(&v48, (id *)buf);
      v47 = v41;
      v49 = BYTE4(v40);
      v44 = v23;
      v45 = v25;
      v46 = v13;
      -[HMDHomeWalletKeyManager addISOCredentialWithPassAtURL:walletKey:flow:completion:](v16, "addISOCredentialWithPassAtURL:walletKey:flow:completion:", v44, v42, v46, v43);

      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
      v26 = 0;
    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v16;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v30;
        v53 = 2112;
        v54 = v31;
        v55 = 2112;
        v56 = v24;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pass JSON at URL: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      -[HMDHomeWalletKeyManager fileManager](v28, "fileManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      v33 = objc_msgSend(v32, "removeItemAtURL:error:", v23, &v50);
      v26 = v50;

      if ((v33 & 1) == 0)
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = v28;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v52 = v37;
          v53 = 2112;
          v54 = v38;
          v55 = 2112;
          v56 = v23;
          v57 = 2112;
          v58 = (int64_t)v26;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v34);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52, v40);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v41 + 2))(v41, 0, 0, v39);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v41 + 2))(v41, 0, 0, v26);
  }

}

- (id)updatePassJSONAtURL:(id)a3 withWalletKey:(id)a4 options:(int64_t)a5 validateNFCInfo:(BOOL)a6 flow:(id)a7
{
  _BOOL8 v8;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDHomeWalletKeyManager *v40;
  NSObject *v41;
  id v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDHomeWalletKeyManager *v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  HMDHomeWalletKeyManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDHomeWalletKeyManager *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  HMDHomeWalletKeyManager *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  char v90;
  __CFString *v91;
  void *v92;
  HMDHomeWalletKeyManager *v93;
  NSObject *v94;
  id v95;
  void *v96;
  void *v97;
  HMDHomeWalletKeyManager *v98;
  NSObject *v99;
  id v100;
  void *v101;
  NSObject *v102;
  id v103;
  void *v104;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  __CFString *v111;
  void *v112;
  id v113;
  __CFString *v114;
  __CFString *v115;
  _QWORD v116[6];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  char v120;
  id v121;
  _QWORD v122[3];
  _QWORD v123[3];
  const __CFString *v124;
  const __CFString *v125;
  void *v126;
  _QWORD v127[2];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[3];
  _QWORD v131[3];
  _QWORD v132[3];
  _QWORD v133[3];
  _QWORD v134[2];
  _QWORD v135[2];
  void *v136;
  uint8_t buf[4];
  id v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  const __CFString *v142;
  __int16 v143;
  __CFString *v144;
  __int16 v145;
  int64_t v146;
  __int16 v147;
  void *v148;
  uint64_t v149;

  v8 = a6;
  v149 = *MEMORY[0x24BDAC8D0];
  v114 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v113 = a7;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v138 = v17;
    v139 = 2112;
    v140 = v18;
    v141 = 2112;
    v142 = v114;
    v143 = 2112;
    v144 = v12;
    v145 = 2048;
    v146 = a5;
    v147 = 2112;
    v148 = v19;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating pass JSON at URL: %@, withWalletKey: %@, options: %ld, validateNFCInfo: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDHomeWalletKeyManager fileManager](v15, "fileManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0;
  objc_msgSend(v20, "JSONObjectWithURL:error:", v114, &v121);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (__CFString *)v121;

  if (v112)
  {
    v21 = v112;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    v24 = (__CFString *)-[__CFString mutableCopy](v23, "mutableCopy");
    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a5 & 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, CFSTR("muteReadyForUseNotification"));

      -[__CFString serialNumber](v12, "serialNumber");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v26, CFSTR("serialNumber"));

      -[__CFString typeIdentifier](v12, "typeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v27, CFSTR("passTypeIdentifier"));

      -[__CFString walletKeyDescription](v12, "walletKeyDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v28, CFSTR("description"));

      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", CFSTR("appleHomeKey"), CFSTR("liveRenderType"));
      -[__CFString passColorValue](v12, "passColorValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v29, CFSTR("homeKeyLiveType"));

      -[__CFString labelColorValue](v12, "labelColorValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v30, CFSTR("foregroundColor"));

      -[__CFString objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("paymentApplications"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
      v109 = v32;

      objc_msgSend(v109, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      v110 = (void *)objc_msgSend(v35, "mutableCopy");
      if (v110)
      {
        v117 = 0;
        v118 = &v117;
        v119 = 0x2020000000;
        v120 = 0;
        -[HMDHomeWalletKeyManager home](v15, "home");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "backingStore");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "context");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v116[0] = MEMORY[0x24BDAC760];
        v116[1] = 3221225472;
        v116[2] = __90__HMDHomeWalletKeyManager_updatePassJSONAtURL_withWalletKey_options_validateNFCInfo_flow___block_invoke;
        v116[3] = &unk_24E79B698;
        v116[4] = v15;
        v116[5] = &v117;
        objc_msgSend(v38, "unsafeSynchronousBlock:", v116);

        v39 = (void *)MEMORY[0x227676638]();
        v40 = v15;
        HMFGetOSLogHandle();
        v41 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "UUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v138 = v42;
          v139 = 2112;
          v140 = v43;
          v141 = 2112;
          v142 = v44;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] doesAnyAccessorySupportACB: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v39);
        -[HMDHomeWalletKeyManager paymentApplicationsForWalletKey:validateNFCInfo:defaultPaymentApplication:doesAnyAccessorySupportACB:flow:](v40, "paymentApplicationsForWalletKey:validateNFCInfo:defaultPaymentApplication:doesAnyAccessorySupportACB:flow:", v12, v8, v110, *((unsigned __int8 *)v118 + 24), v113);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v45 && !objc_msgSend(v45, "hmf_isEmpty"))
        {
          -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v46, CFSTR("paymentApplications"));
          -[__CFString objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("paymentCard"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v69 = v68;
          else
            v69 = 0;
          v70 = v69;

          v108 = (void *)objc_msgSend(v70, "mutableCopy");
          if (v108)
          {
            -[__CFString homeName](v12, "homeName");
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              v134[1] = CFSTR("value");
              v135[0] = CFSTR("homeName");
              v134[0] = CFSTR("key");
              -[__CFString homeName](v12, "homeName");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v135[1] = v72;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v135, v134, 2);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = v73;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v74, CFSTR("headerFields"));

            }
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString accessCode](v12, "accessCode");
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if (v75)
            {
              v132[0] = CFSTR("key");
              v132[1] = CFSTR("label");
              v133[0] = CFSTR("arbitrary_supplementary_field_accessCode");
              v133[1] = CFSTR("ACCESS_CODE");
              v132[2] = CFSTR("value");
              -[__CFString accessCode](v12, "accessCode");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v133[2] = v76;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v133, v132, 3);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "addObject:", v77);

              objc_msgSend(v107, "addObject:", CFSTR("arbitrary_supplementary_field_accessCode"));
            }
            -[__CFString changeAccessCodeHomeAppCustomURL](v12, "changeAccessCodeHomeAppCustomURL");
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            if (v78)
            {
              v130[0] = CFSTR("key");
              v130[1] = CFSTR("value");
              v131[0] = CFSTR("arbitrary_supplementary_field_changeAccessCode");
              v131[1] = CFSTR("CHANGE_ACCESS_CODE_BUTTON");
              v130[2] = CFSTR("link");
              -[__CFString changeAccessCodeHomeAppCustomURL](v12, "changeAccessCodeHomeAppCustomURL");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "absoluteString");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v131[2] = v80;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, v130, 3);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "addObject:", v81);

              objc_msgSend(v107, "addObject:", CFSTR("arbitrary_supplementary_field_changeAccessCode"));
            }
            if (objc_msgSend(v107, "count"))
            {
              v128[0] = CFSTR("key");
              v128[1] = CFSTR("label");
              v129[0] = CFSTR("arbitrary_supplementary_field_personalPinCode");
              v129[1] = CFSTR("PERSONAL_PIN_CODE");
              v128[2] = CFSTR("link");
              v129[2] = CFSTR("wallet://card/card-id/sections?sections=access_code&authenticationRequirment=deviceOwner&title=PERSONAL_PIN_CODE_TITLE");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "addObject:", v82);

              v83 = (void *)objc_msgSend(v106, "copy");
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v83, CFSTR("backFields"));

              v124 = CFSTR("arbitrary_supplementary_field_personalPinCode");
              v125 = CFSTR("rows");
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v124, 1);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v126 = v84;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v127[0] = v85;
              v122[0] = CFSTR("rows");
              v86 = (void *)objc_msgSend(v107, "copy");
              v123[0] = v86;
              v123[1] = MEMORY[0x24BDBD1C8];
              v122[1] = CFSTR("hidden");
              v122[2] = CFSTR("identifier");
              v123[2] = CFSTR("access_code");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 3);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v127[1] = v87;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 2);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v88, CFSTR("passDetailSections"));

            }
            -[__CFString setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v108, CFSTR("paymentCard"));
            -[HMDHomeWalletKeyManager fileManager](v40, "fileManager");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = v111;
            v90 = objc_msgSend(v89, "writeJSONObject:toURL:error:", v24, v114, &v115);
            v91 = v115;

            v92 = (void *)MEMORY[0x227676638]();
            v93 = v40;
            if ((v90 & 1) != 0)
            {
              HMFGetOSLogHandle();
              v94 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v95 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "UUID");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v138 = v95;
                v139 = 2112;
                v140 = v96;
                v141 = 2112;
                v142 = v24;
                v143 = 2112;
                v144 = v114;
                _os_log_impl(&dword_2218F0000, v94, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wrote pass JSON dict: %@, to URL: %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v92);
              v52 = (void *)-[__CFString copy](v24, "copy");
            }
            else
            {
              HMFGetOSLogHandle();
              v102 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v103 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "UUID");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v138 = v103;
                v139 = 2112;
                v140 = v104;
                v141 = 2112;
                v142 = v114;
                v143 = 2112;
                v144 = v91;
                _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write pass JSON dict to URL %@:%@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v92);
              v52 = 0;
            }

            v111 = v91;
          }
          else
          {
            v97 = (void *)MEMORY[0x227676638]();
            v98 = v40;
            HMFGetOSLogHandle();
            v99 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v100 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "UUID");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v138 = v100;
              v139 = 2112;
              v140 = v101;
              v141 = 2112;
              v142 = CFSTR("paymentCard");
              v143 = 2112;
              v144 = v21;
              _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Key payment card does not exist in pass json %@:%@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v97);
            v52 = 0;
          }

        }
        else
        {
          v47 = (void *)MEMORY[0x227676638]();
          v48 = v40;
          HMFGetOSLogHandle();
          v49 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "UUID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v138 = v50;
            v139 = 2112;
            v140 = v51;
            _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not create any payment applications", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v47);
          v52 = 0;
        }

        _Block_object_dispose(&v117, 8);
      }
      else
      {
        v63 = (void *)MEMORY[0x227676638]();
        v64 = v15;
        HMFGetOSLogHandle();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "UUID");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v138 = v66;
          v139 = 2112;
          v140 = v67;
          v141 = 2112;
          v142 = CFSTR("paymentApplications");
          v143 = 2112;
          v144 = v24;
          _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Payment application key: %@ does not exist in pass json: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v63);
        v52 = 0;
      }

    }
    else
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = v15;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "UUID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v138 = v61;
        v139 = 2112;
        v140 = v62;
        v141 = 2112;
        v142 = v21;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] passJSONObject is not of type NSDictionary: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v58);
      v52 = 0;
    }

  }
  else
  {
    v53 = (void *)MEMORY[0x227676638]();
    v54 = v15;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "UUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v138 = v56;
      v139 = 2112;
      v140 = v57;
      v141 = 2112;
      v142 = v114;
      v143 = 2112;
      v144 = v111;
      _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to load pass json at URL %@:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v53);
    v52 = 0;
  }

  return v52;
}

- (id)paymentApplicationsForWalletKey:(id)a3 validateNFCInfo:(BOOL)a4 defaultPaymentApplication:(id)a5 doesAnyAccessorySupportACB:(BOOL)a6 flow:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;
  BOOL v26;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  objc_msgSend(v12, "nfcInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke;
  v21[3] = &unk_24E77C248;
  v25 = a4;
  v21[4] = self;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v26 = a6;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  objc_msgSend(v15, "na_map:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)passSerialNumberWithUserUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD76B0];
  v5 = a3;
  -[HMDHomeWalletKeyManager uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passSerialNumberWithHomeUUID:userUUID:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)walletKeyByAddingAccessCodeToWalletKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeWalletKeyManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "state");
  if (v10 != 1 || !v9 || (objc_msgSend(v6, "hasAnyAccessoryWithWalletKeyAndAccessCodeSupport") & 1) == 0)
  {
    objc_msgSend(v7, "setAccessCode:", 0);
LABEL_8:
    objc_msgSend(v7, "setChangeAccessCodeHomeAppCustomURL:", 0);
    goto LABEL_9;
  }
  objc_msgSend(v7, "setAccessCode:", v9);
  -[HMDHomeWalletKeyManager applicationRegistry](self, "applicationRegistry");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (id)*MEMORY[0x24BDD5C70];
  objc_msgSend((id)v11, "applicationInfoForBundleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v14, "isWatch");

  if ((v11 & 1) != 0 || !v13)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("com.apple.Home-private://userLockSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextSPIUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setChangeAccessCodeHomeAppCustomURL:", v18);
LABEL_9:
  v19 = (void *)objc_msgSend(v7, "copy");

  return v19;
}

- (void)updateWalletKeyStateToState:(int64_t)a3 flow:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD aBlock[5];
  id v11;
  int64_t v12;

  v6 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMDHomeWalletKeyManager_updateWalletKeyStateToState_flow___block_invoke;
  aBlock[3] = &unk_24E77C270;
  v11 = v6;
  v12 = a3;
  aBlock[4] = self;
  v8 = v6;
  v9 = _Block_copy(aBlock);
  -[HMDHomeWalletKeyManager enqueueWalletKeyUpdateOperation:flow:](self, "enqueueWalletKeyUpdateOperation:flow:", v9, v8);

}

- (void)syncDeviceCredentialKeyForAccessory:(id)a3 paymentApplications:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HMDHomeWalletKeyManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v40 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v39 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v20 = v13;
    v21 = v8;
    v22 = v12;
    v23 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v50 = v17;
    v51 = 2112;
    v52 = v18;
    v53 = 2112;
    v54 = v19;
    v55 = 2112;
    v56 = v24;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] Syncing device credential key to accessory: %@", buf, 0x2Au);

    v10 = v23;
    v12 = v22;
    v8 = v21;
    v13 = v20;

    v14 = v39;
    v9 = v40;

  }
  objc_autoreleasePoolPop(v14);
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager deviceCredentialKeyForAccessory:fromPaymentApplications:](v15, "deviceCredentialKeyForAccessory:fromPaymentApplications:", v8, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[HMDHomeWalletKeyManager home](v15, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nfcReaderKeyManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "accessoryManager");
      v41 = v10;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v8, "supportsACWGProvisioning");
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke;
      v46[3] = &unk_24E799FD0;
      v46[4] = v15;
      v47 = v13;
      v48 = v8;
      objc_msgSend(v28, "configureAccessory:withDeviceCredentialKey:ofType:flow:completion:", v48, v25, v29, v47, v46);

      v10 = v41;
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = v15;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v42 = v10;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v36 = v13;
        v37 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v50 = v34;
        v51 = 2112;
        v52 = v35;
        v53 = 2112;
        v54 = v38;
        v55 = 2112;
        v56 = v37;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to find device credential key for accessory: %@ in payment applications: %@", buf, 0x2Au);

        v9 = v37;
        v13 = v36;

        v10 = v42;
        v25 = 0;
      }

      objc_autoreleasePoolPop(v31);
    }

  }
  else
  {
    -[HMDHomeWalletKeyManager passLibrary](v15, "passLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1048;
    v43[3] = &unk_24E77C298;
    v43[4] = v15;
    v44 = v13;
    v45 = v8;
    objc_msgSend(v30, "fetchTransactionKeyForPassWithTypeIdentifier:serialNumber:completion:", CFSTR("paymentpass.com.apple.dev1"), v12, v43);

  }
}

- (id)deviceCredentialKeyForAccessory:(id)a3 fromPaymentApplications:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (objc_msgSend(a3, "supportsACWGProvisioning"))
  {
    objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_1051);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "subcredentials");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transactionKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_1052);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "subcredentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)fetchShouldSuppressWalletNotificationWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWatch");

  if (v7)
  {
    v4[2](v4, 1);
  }
  else
  {
    -[HMDHomeWalletKeyManager applicationRegistry](self, "applicationRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)*MEMORY[0x24BDD5C70];
    objc_msgSend(v8, "applicationInfoForBundleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMDHomeWalletKeyManager bulletinBoard](self, "bulletinBoard");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke;
      v12[3] = &unk_24E781B48;
      v12[4] = self;
      v13 = v4;
      objc_msgSend(v11, "fetchAreUserNotificationsEnabledWithCompletion:", v12);

    }
    else
    {
      v4[2](v4, 0);
    }
  }

}

- (void)updateWalletKeyAccessCodeFieldWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key access code field with reason: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDHomeWalletKeyManager_updateWalletKeyAccessCodeFieldWithReason___block_invoke;
  aBlock[3] = &unk_24E77C320;
  aBlock[4] = v8;
  v12 = _Block_copy(aBlock);
  -[HMDHomeWalletKeyManager enqueueWalletKeyUpdateOperation:flow:](v8, "enqueueWalletKeyUpdateOperation:flow:", v12, v6);

}

- (void)fetchShouldAutoEnableExpressWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWatch");

  if ((v6 & 1) != 0)
  {
    -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "canNotifyAboutExpressModeWithCompletion:", v8);

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (void)updateWalletKeyWithReason:(id)a3 flow:(id)a4 completion:(id)a5
{
  -[HMDHomeWalletKeyManager updateWalletKeyWithReason:syncDeviceKeyToAccessory:flow:completion:](self, "updateWalletKeyWithReason:syncDeviceKeyToAccessory:flow:completion:", a3, 0, a4, a5);
}

- (void)updateWalletKeyWithReason:(id)a3 syncDeviceKeyToAccessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDHomeWalletKeyManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDHomeWalletKeyManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeWalletKeyManager *v31;
  NSObject *v32;
  void *v33;
  HMDHomeWalletKeyManager *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDHomeWalletKeyManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDHomeWalletKeyManager *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v56 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v16;
      v64 = 2112;
      v65 = v17;
      v66 = 2112;
      v67 = v10;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating wallet key with reason: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v22;
      v64 = 2112;
      v65 = v23;
      v66 = 2112;
      v67 = v10;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key with reason: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }
  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v54 = v10;
      objc_msgSend(v25, "clientWalletKeyUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v24, v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = (void *)MEMORY[0x227676638]();
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "UUID");
            v52 = v12;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "uuid");
            v51 = v30;
            v34 = v31;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v63 = v53;
            v64 = 2112;
            v65 = v33;
            v66 = 2112;
            v67 = v35;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key UUID for client has not been set, the existing wallet key being updated is pre-UWB, so saving the existingWalletKey as the wallet key's UUID: %@ going forward", buf, 0x20u);

            v31 = v34;
            v30 = v51;

            v12 = v52;
          }

          objc_autoreleasePoolPop(v30);
          objc_msgSend(v29, "uuid");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "saveClientWalletKeyUUIDToLocalStore:", v36);

        }
      }
      +[HMDPassUpdater shared](HMDPassUpdater, "shared", v51);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyManager uuid](self, "uuid");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke;
      v57[3] = &unk_24E77C370;
      v57[4] = self;
      v61 = v12;
      v39 = v56;
      v58 = v56;
      v59 = v18;
      v60 = v26;
      objc_msgSend(v37, "updatePassForHomeUUID:isOnboarding:isRollingForHH2:optionsNumber:flow:completionHandler:", v38, 0, 0, 0, v59, v57);

      v10 = v54;
    }
    else
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUID");
        v55 = v10;
        v49 = v12;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v48;
        v64 = 2112;
        v65 = v50;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Nil home", buf, 0x16u);

        v12 = v49;
        v10 = v55;

      }
      objc_autoreleasePoolPop(v45);
      v39 = v56;
    }

  }
  else
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v43;
      v64 = 2112;
      v65 = v44;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No pass serial number", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    v39 = v56;
  }

}

- (void)autoAddWalletKeyWithReason:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  void *v12;
  HMDHomeWalletKeyManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDHomeWalletKeyManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  HMDHomeWalletKeyManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  void (**v36)(id, _QWORD, id);
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v15;
    v40 = 2112;
    v41 = v16;
    v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Auto adding wallet key with reason: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDHomeWalletKeyManager home](v13, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "homeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "homeUUIDsWithAutoAddWalletKeySuppressed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "containsObject:", v20);

  if (v21)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v13;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2112;
      v41 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot auto add wallet key because it is suppressed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10[2](v10, 0, v27);
    goto LABEL_13;
  }
  v37 = 0;
  v28 = -[HMDHomeWalletKeyManager canAutoAddWalletKeyWithError:](v13, "canAutoAddWalletKeyWithError:", &v37);
  v27 = v37;
  if (!v28)
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v13;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v39 = v32;
      v40 = 2112;
      v41 = v33;
      v42 = 2112;
      v43 = v8;
      v44 = 2112;
      v45 = v27;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot auto add wallet key for reason: %@ with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v29);
    goto LABEL_12;
  }
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke;
  v34[3] = &unk_24E78BB78;
  v34[4] = v13;
  v35 = v9;
  v36 = v10;
  -[HMDHomeWalletKeyManager fetchShouldSuppressWalletNotificationWithCompletion:](v13, "fetchShouldSuppressWalletNotificationWithCompletion:", v34);

LABEL_13:
}

- (void)showExpressEnabledNotificationForWalletKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomeWalletKeyManager *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWatch");

  if (v7)
  {
    -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passUniqueIDOfWalletKeyWithTypeIdentifier:serialNumber:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __70__HMDHomeWalletKeyManager_showExpressEnabledNotificationForWalletKey___block_invoke;
      v17[3] = &unk_24E79BD80;
      v17[4] = self;
      objc_msgSend(v12, "showExpressEnabledUserNotificationForWalletKeyWithPassUniqueID:completion:", v11, v17);

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
        *(_DWORD *)buf = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pass unique id of wallet key: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeWalletKeyManager uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)passLibrary:(id)a3 didAddPassWithSerialNumber:(id)a4 typeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDHomeWalletKeyManager *v14;
  NSObject *v15;
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
  void *v28;
  void *v29;
  void *v30;
  HMDHomeWalletKeyManager *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && objc_msgSend(v9, "isEqualToString:", v12)
    && objc_msgSend(v10, "isEqualToString:", CFSTR("paymentpass.com.apple.dev1")))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message that home key was added in wallet", (uint8_t *)&v34, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD5CC8], 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDHomeWalletKeyManager uuid](v14, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

    objc_msgSend(v17, "setDestination:", v20);
    objc_msgSend(v17, "setRequiresWalletKeyEntitlement");
    -[HMDHomeWalletKeyManager messageDispatcher](v14, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:", v17);

  }
  -[HMDHomeWalletKeyManager passLibrary](self, "passLibrary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "walletKeyWithTypeIdentifier:serialNumber:flow:", v10, v9, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "nfcReaderKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[HMDHomeWalletKeyManager dataSource](self, "dataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hmf_hexadecimalRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "persistNumberValueToNoBackupStore:withKey:", 0, v29);

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
        v34 = 138543362;
        v35 = v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not persisting settings because could not find reader key after pass was added", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
    }

  }
}

- (void)passLibrary:(id)a3 didRemovePassWithSerialNumber:(id)a4 typeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDHomeWalletKeyManager *v14;
  NSObject *v15;
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
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeWalletKeyManager passSerialNumber](self, "passSerialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && objc_msgSend(v9, "isEqualToString:", v12)
    && objc_msgSend(v10, "isEqualToString:", CFSTR("paymentpass.com.apple.dev1")))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message that home key was removed from wallet", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD5CD8], 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDHomeWalletKeyManager uuid](v14, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

    objc_msgSend(v17, "setDestination:", v20);
    objc_msgSend(v17, "setRequiresWalletKeyEntitlement");
    -[HMDHomeWalletKeyManager messageDispatcher](v14, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:", v17);

    -[HMDHomeWalletKeyManager pendingUpdateWalletKeyOperations](v14, "pendingUpdateWalletKeyOperations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAllObjects");

    -[HMDHomeWalletKeyManager home](v14, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "nfcReaderKeyManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessoryManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleWalletKeyRemoved");

  }
}

- (void)accessoryManager:(id)a3 didUpdateWalletKeyColor:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeWalletKeyManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[6];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    HMHomeWalletKeyColorAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Wallet key color did update to %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", v10, 0, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeWalletKeyColorAsString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling wallet key color did update delegate callback: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HMDHomeWalletKeyManager_accessoryManager_didUpdateWalletKeyColor___block_invoke;
    aBlock[3] = &unk_24E77C3E0;
    aBlock[4] = v13;
    aBlock[5] = a4;
    v18 = _Block_copy(aBlock);
    -[HMDHomeWalletKeyManager enqueueWalletKeyUpdateOperation:flow:](v13, "enqueueWalletKeyUpdateOperation:flow:", v18, v11);

  }
}

- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeWalletKeyManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", CFSTR("accessory supports access code changed"), 0, 0);
    }
    else
    {
      -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__HMDHomeWalletKeyManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = self;
      dispatch_async(v15, block);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling access code support change for accessory in other home: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)handleSystemInfoMigrationUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDHomeWalletKeyManager *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager systemInfo](self, "systemInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMigrating");

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
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Not handling migration updated notification, migration is in progress", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDHomeWalletKeyManager_handleSystemInfoMigrationUpdatedNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v11, block);

  }
}

- (void)handleApplicationInstalled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  HMDHomeWalletKeyManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDHomeWalletKeyManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD block[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)*MEMORY[0x24BDD5C70];
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      v11 = CFSTR("Home App was installed");
LABEL_14:
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", v11, 0, 0);
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key because Home App was installed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDHomeWalletKeyManager workQueue](v16, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v16;
    dispatch_async(v20, block);

  }
  else
  {
    objc_msgSend(v7, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.Passbook"));

    if (v13)
    {
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
      {
        v11 = CFSTR("Wallet app installed");
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Auto adding wallet key after wallet app installed", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDHomeWalletKeyManager workQueue](v23, "workQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke_1071;
      v29[3] = &unk_24E79C268;
      v29[4] = v23;
      v30 = v21;
      v28 = v21;
      dispatch_async(v27, v29);

    }
  }
LABEL_21:

}

- (void)handleApplicationUninstalled:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)*MEMORY[0x24BDD5C70];
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", CFSTR("Home App was uninstalled"), 0, 0);
    }
    else
    {
      -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__HMDHomeWalletKeyManager_handleApplicationUninstalled___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = self;
      dispatch_async(v10, block);

    }
  }
}

- (void)handleLostModeUpdated
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeWalletKeyManager lostModeManager](self, "lostModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLost");

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification lost mode updated to: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyManager workQueue](v7, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDHomeWalletKeyManager_handleLostModeUpdated__block_invoke;
  block[3] = &unk_24E799CF0;
  v16 = v4;
  block[4] = v7;
  v15 = v5;
  v13 = v5;
  dispatch_async(v12, block);

}

- (void)handleLostModeManagerDidExitLostModeWithAuthCompleteNotification
{
  void *v3;
  void *v4;
  HMDHomeWalletKeyManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification did exit lost mode with auth complete notification", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDHomeWalletKeyManager workQueue](v5, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__HMDHomeWalletKeyManager_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification__block_invoke;
  v11[3] = &unk_24E79C268;
  v11[4] = v5;
  v12 = v3;
  v10 = v3;
  dispatch_async(v9, v11);

}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  HMDHomeWalletKeyManager *v8;

  v4 = a3;
  if (!_os_feature_enabled_impl()
    || (isInternalBuild() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__HMDHomeWalletKeyManager_handleHomeUserRemovedNotification___block_invoke;
    v6[3] = &unk_24E79C268;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)handleHomeWasRemoved
{
  void *v3;
  void *v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x227676638]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v8;
        v17 = 2112;
        v18 = v9;
        v19 = 2112;
        v20 = v3;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home was removed: %@", (uint8_t *)&v15, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      +[HMDPassUpdater shared](HMDPassUpdater, "shared");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeOrphanedPassesWithFlow:completionHandler:", v4, &__block_literal_global_1081);

      -[HMDHomeWalletKeyManager removeWalletKeyMigrationSettingsFileFromDisk](v6, "removeWalletKeyMigrationSettingsFileFromDisk");
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
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home was nil in handleHomeWasRemoved", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
}

- (void)handleHomeWillBeRemoved
{
  void *v3;
  void *v4;
  HMDHomeWalletKeyManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HMDHomeWalletKeyManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomeWalletKeyManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!_os_feature_enabled_impl()
    || (isInternalBuild() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDHomeWalletKeyManager home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[HMDHomeWalletKeyManager removeWalletKeyMigrationSettingsFileFromDisk](self, "removeWalletKeyMigrationSettingsFileFromDisk");
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
      {
        v4 = (void *)MEMORY[0x227676638]();
        v5 = self;
        HMFGetOSLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v7;
          _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Resetting dismissed UWB onboarding flag and clearing client wallet key UUID", (uint8_t *)&v18, 0xCu);

        }
        objc_autoreleasePoolPop(v4);
        objc_msgSend(v3, "resetHomeKeyMiscInfo");
      }
      else
      {
        -[HMDHomeWalletKeyManager setIsHomeBeingRemoved:](self, "setIsHomeBeingRemoved:", 1);
        objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v16;
          v20 = 2112;
          v21 = v17;
          v22 = 2112;
          v23 = v3;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home will be removed: %@", (uint8_t *)&v18, 0x20u);

        }
        objc_autoreleasePoolPop(v13);
        -[HMDHomeWalletKeyManager updateWalletKeyStateToState:flow:](v14, "updateWalletKeyStateToState:flow:", 10, v12);

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Home was nil in handleHomeWillBeRemoved", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (void)handleHomeNameChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDHomeWalletKeyManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  HMDHomeWalletKeyManager *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](self, "updateWalletKeyWithReason:flow:completion:", CFSTR("home name changed"), 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home name changed notification", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDHomeWalletKeyManager workQueue](v10, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    v17 = v4;
    v18 = v10;
    v19 = v8;
    v15 = v8;
    dispatch_async(v14, block);

  }
}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDHomeWalletKeyManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHomeWalletKeyManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDNotificationAddedAccessoryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if ((objc_msgSend(v8, "supportsWalletKey") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v13;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling accessory added", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
      {
        -[HMDHomeWalletKeyManager updateWalletKeyWithReason:syncDeviceKeyToAccessory:flow:completion:](v11, "updateWalletKeyWithReason:syncDeviceKeyToAccessory:flow:completion:", CFSTR("accessory added"), v8, v9, &__block_literal_global_1088);
      }
      else
      {
        -[HMDHomeWalletKeyManager workQueue](v11, "workQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_2;
        v21[3] = &unk_24E79A910;
        v21[4] = v11;
        v22 = v9;
        v23 = v4;
        v24 = v8;
        dispatch_async(v20, v21);

      }
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Added accessory does not support wallet key: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
  }

}

- (void)handleAccessorySupportsWalleyKeyDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeWalletKeyManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeWalletKeyManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling wallet key support change for accessory in other home: %@", buf, 0x16u);

    }
LABEL_16:

    objc_autoreleasePoolPop(v10);
    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "supportsWalletKey") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "supportsMatterWalletKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "BOOLValue");
      HMFBooleanToString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "supportsACWGProvisioning");
      HMFBooleanToString();
      v28 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "supportsACWGUWB");
      HMFBooleanToString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v34 = v21;
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v23;
      v39 = 2112;
      v40 = v24;
      v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling wallet key support change, since support was disabled for accessory: %@, supportsMatterWalletKey: %@, supportsACWGProvisioning: %@, supportsACWGUWB: %@", buf, 0x34u);

      v10 = v28;
    }
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v19;
    v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling AccessorySupportsWalletKeyDidChangeNotification", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager updateWalletKeyWithReason:syncDeviceKeyToAccessory:flow:completion:](v17, "updateWalletKeyWithReason:syncDeviceKeyToAccessory:flow:completion:", CFSTR("wallet key support added"), v7, v15, &__block_literal_global_1091);
  }
  else
  {
    -[HMDHomeWalletKeyManager workQueue](v17, "workQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_2;
    block[3] = &unk_24E79A910;
    block[4] = v17;
    v30 = v7;
    v31 = v15;
    v32 = v4;
    dispatch_async(v26, block);

  }
LABEL_17:

}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDHomeWalletKeyManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  HMDHomeWalletKeyManager *v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling accessory removed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](v11, "updateWalletKeyWithReason:flow:completion:", CFSTR("accessory removed"), v9, 0);
    }
    else if (-[HMDHomeWalletKeyManager canSuspendWalletKey](v11, "canSuspendWalletKey"))
    {
      -[HMDHomeWalletKeyManager workQueue](v11, "workQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke;
      block[3] = &unk_24E79BBD0;
      block[4] = v11;
      v25 = v9;
      v26 = v8;
      dispatch_async(v16, block);

    }
    else
    {
      -[HMDHomeWalletKeyManager passLibrary](v11, "passLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyManager passSerialNumber](v11, "passSerialNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v18, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HMDHomeWalletKeyManager workQueue](v11, "workQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke_1095;
        v21[3] = &unk_24E79C268;
        v22 = v8;
        v23 = v11;
        dispatch_async(v20, v21);

      }
    }

  }
}

- (void)handleUserScheduleDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling user schedule did change for user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](v15, "updateWalletKeyWithReason:flow:completion:", CFSTR("user schedule changed"), v13, 0);
    }
    else
    {
      v20 = -[HMDHomeWalletKeyManager canSuspendWalletKey](v15, "canSuspendWalletKey");
      -[HMDHomeWalletKeyManager workQueue](v15, "workQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke;
        block[3] = &unk_24E79C268;
        block[4] = v15;
        v26 = v13;
        dispatch_async(v21, block);

        v22 = v26;
      }
      else
      {
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_1098;
        v23[3] = &unk_24E79C268;
        v23[4] = v15;
        v24 = v13;
        dispatch_async(v21, v23);

        v22 = v24;
      }

    }
  }

}

- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomeWalletKeyManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling HomeDidUpdateNFCReaderKeyNotification", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyManager home](v7, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nfcReaderKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](v7, "updateWalletKeyWithReason:flow:completion:", CFSTR("NFC reader key updated"), v5, 0);
    }
    else
    {
      -[HMDHomeWalletKeyManager workQueue](v7, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke;
      v19[3] = &unk_24E79C268;
      v19[4] = v7;
      v20 = v5;
      dispatch_async(v18, v19);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling nfc reader key update because it set to nil on home", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)handleNFCReaderKeyUpdatedForWalletKey:(id)a3 flow:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMDHomeWalletKeyManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  HMDHomeWalletKeyManager *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDHomeWalletKeyManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDHomeWalletKeyManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v57 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v57, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v66 = v11;
    v67 = 2112;
    v68 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling NFC reader key updated for wallet key", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeWalletKeyManager home](v9, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nfcReaderKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "nfcReaderKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "publicKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNIST256Utilities identifier16BytesForKey:](HMDNIST256Utilities, "identifier16BytesForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v6, "nfcInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pairedReaderIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hmf_initWithHexadecimalString:options:", v22, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nfcInfos");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke;
  v62[3] = &unk_24E77C4D8;
  v24 = v15;
  v63 = v24;
  v25 = v18;
  v64 = v25;
  LODWORD(v21) = objc_msgSend(v23, "na_any:", v62);

  v26 = (void *)MEMORY[0x227676638]();
  v27 = v9;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if ((_DWORD)v21)
  {
    if (v29)
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v66 = v30;
      v67 = 2112;
      v68 = v31;
      v69 = 2112;
      v70 = v56;
      v71 = 2112;
      v72 = v24;
      v73 = 2112;
      v74 = v25;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader identifier of the existing wallet key: %@ matches with what exists in home. uaReaderGroupIdentifier: %@, v2ReaderGroupIdentifier: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v26);
  }
  else
  {
    if (v29)
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v66 = v32;
      v67 = 2112;
      v68 = v33;
      v69 = 2112;
      v70 = v56;
      v71 = 2112;
      v72 = v24;
      v73 = 2112;
      v74 = v25;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader identifier of existing wallet key: %@ doesn't match with home uaReaderGroupIdentifier: %@ or v2ReaderGroupIdentifier: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v26);
    -[HMDHomeWalletKeyManager dataSource](v27, "dataSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hmf_hexadecimalRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberValueFromNoBackupStoreWithKey:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v27;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "UUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v66 = v40;
        v67 = 2112;
        v68 = v41;
        v69 = 2112;
        v70 = v36;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing and re-adding wallet key with default options: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v37);
      -[HMDHomeWalletKeyManager passLibrary](v38, "passLibrary");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typeIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialNumber");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v42, "removePassWithTypeIdentifier:serialNumber:flow:", v43, v44, v57);

      if ((v45 & 1) != 0)
      {
        objc_initWeak((id *)buf, v38);
        v46 = objc_msgSend(v36, "integerValue");
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke_1103;
        v58[3] = &unk_24E77BD78;
        objc_copyWeak(&v61, (id *)buf);
        v59 = v57;
        v60 = v6;
        -[HMDHomeWalletKeyManager addWalletKeyWithOptions:isOnboarding:flow:completion:](v38, "addWalletKeyWithOptions:isOnboarding:flow:completion:", v46, 0, v59, v58);

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v51 = (void *)MEMORY[0x227676638]();
        v52 = v38;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "UUID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v66 = v54;
          v67 = 2112;
          v68 = v55;
          v69 = 2112;
          v70 = v6;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove wallet key: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v51);
      }
    }
    else
    {
      if (!_os_feature_enabled_impl()
        || (isInternalBuild() & 1) == 0
        && !CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
      {
        -[HMDHomeWalletKeyManager passLibrary](v27, "passLibrary");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nfcInfos");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "firstObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "subCredentialIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "deleteKeyMaterialForSubCredentialId:", v50);

      }
      -[HMDHomeWalletKeyManager updateWalletKeyByConfiguringEndpointsWithFlow:](v27, "updateWalletKeyByConfiguringEndpointsWithFlow:", v57);
    }

  }
}

- (void)updateWalletKeyByConfiguringEndpointsWithFlow:(id)a3
{
  id v4;
  void *v5;
  HMDHomeWalletKeyManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeWalletKeyManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHomeWalletKeyManager *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating wallet key by configuring endpoints", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeWalletKeyManager home](v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      objc_msgSend(v10, "acwgGroupResolvingKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    -[HMDHomeWalletKeyManager passSerialNumber](v6, "passSerialNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generating nfc info for existing wallet key", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v10, "nfcReaderKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "spiClientIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke;
      v28[3] = &unk_24E799F40;
      v28[4] = v19;
      v29 = v4;
      -[HMDHomeWalletKeyManager configureWalletPaymentApplicationsWithNFCReaderKey:serialNumber:homeUniqueIdentifier:homeGRK:flow:completion:](v19, "configureWalletPaymentApplicationsWithNFCReaderKey:serialNumber:homeUniqueIdentifier:homeGRK:flow:completion:", v24, v17, v25, v11, v29, v28);

    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update home key, serial number is nil", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)handleHomeHasOnboardedForWalletKeyChangeNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  HMDHomeWalletKeyManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  char v18;
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeWalletKeyManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOnboardedForWalletKey");

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Home has onboarded flag changed to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    -[HMDHomeWalletKeyManager updateWalletKeyWithReason:flow:completion:](v9, "updateWalletKeyWithReason:flow:completion:", CFSTR("onboarded for wallet key"), v7, 0);
  }
  else
  {
    v14 = -[HMDHomeWalletKeyManager canSuspendWalletKey](v9, "canSuspendWalletKey");
    -[HMDHomeWalletKeyManager workQueue](v9, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke;
    block[3] = &unk_24E790028;
    v18 = v6;
    v19 = v14;
    block[4] = v9;
    v17 = v7;
    dispatch_async(v15, block);

  }
}

- (BOOL)canSuspendWalletKey
{
  void *v2;
  char v3;

  -[HMDHomeWalletKeyManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAnyAccessoryWithWalletKeySupport") ^ 1;

  return v3;
}

- (void)auditExistingWalletKeysForDuplicatesWithFlow:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHomeWalletKeyManager home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyManager removeDuplicateWalletKeysForUser:flow:](self, "removeDuplicateWalletKeysForUser:flow:", v5, v4);

}

- (void)removeDuplicateWalletKeysForUser:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDHomeWalletKeyManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomeWalletKeyManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isOwnerUser") & 1) == 0)
  {
    objc_msgSend(v9, "currentUser");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v9, "currentUser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRestrictedGuest");

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
          objc_msgSend(v7, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v17;
          v24 = 2112;
          v25 = v18;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing duplicate wallet keys", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v9, "findAdditionalUUIDsForUser:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __65__HMDHomeWalletKeyManager_removeDuplicateWalletKeysForUser_flow___block_invoke;
        v20[3] = &unk_24E77FFA0;
        v20[4] = v15;
        v21 = v7;
        objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

      }
    }
  }

}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 16, 1);
}

- (HMDWalletPassLibrary)passLibrary
{
  return (HMDWalletPassLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMDWatchManager)watchManager
{
  return (HMDWatchManager *)objc_getProperty(self, a2, 72, 1);
}

- (NAFuture)addWalletKeyFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAddWalletKeyFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (id)isoCredentialFactory
{
  return objc_getProperty(self, a2, 88, 1);
}

- (id)isoCredentialACWGFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (HAPKeyStore)keychainStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 104, 1);
}

- (HMDLostModeManager)lostModeManager
{
  return (HMDLostModeManager *)objc_getProperty(self, a2, 112, 1);
}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableArray)pendingUpdateWalletKeyOperations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isWalletKeyUpdateOperationInProgress
{
  return self->_isWalletKeyUpdateOperationInProgress;
}

- (void)setIsWalletKeyUpdateOperationInProgress:(BOOL)a3
{
  self->_isWalletKeyUpdateOperationInProgress = a3;
}

- (BOOL)isHomeBeingRemoved
{
  return self->_isHomeBeingRemoved;
}

- (void)setIsHomeBeingRemoved:(BOOL)a3
{
  self->_isHomeBeingRemoved = a3;
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 136, 1);
}

- (HMDApplicationRegistry)applicationRegistry
{
  return (HMDApplicationRegistry *)objc_getProperty(self, a2, 144, 1);
}

- (HMFSystemInfo)systemInfo
{
  return (HMFSystemInfo *)objc_getProperty(self, a2, 152, 1);
}

- (NSUUID)currentUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentUserUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (HMDHomeKeySetupWalletLogEvent)logEvent
{
  return (HMDHomeKeySetupWalletLogEvent *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLogEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)isWalletKeyRollForHH2InProgress
{
  return self->_isWalletKeyRollForHH2InProgress;
}

- (void)setIsWalletKeyRollForHH2InProgress:(BOOL)a3
{
  self->_isWalletKeyRollForHH2InProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong((id *)&self->_currentUserUUID, 0);
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_applicationRegistry, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_pendingUpdateWalletKeyOperations, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lostModeManager, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
  objc_storeStrong(&self->_isoCredentialACWGFactory, 0);
  objc_storeStrong(&self->_isoCredentialFactory, 0);
  objc_storeStrong((id *)&self->_addWalletKeyFuture, 0);
  objc_storeStrong((id *)&self->_watchManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

void __65__HMDHomeWalletKeyManager_removeDuplicateWalletKeysForUser_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "passSerialNumberWithUserUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "passSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "passLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "removePassWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v4, *(_QWORD *)(a1 + 40));

    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (!v18)
        goto LABEL_11;
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v3;
      v12 = "%{public}@[Flow: %@] Removed duplicate wallet key with serial number: %@ for user uuid: %@";
    }
    else
    {
      if (!v18)
        goto LABEL_11;
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v3;
      v12 = "%{public}@[Flow: %@] Did not find wallet key with serial number: %@ for user uuid: %@";
    }
    v13 = v9;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 42;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v3;
    v12 = "%{public}@[Flow: %@] Duplicate user's wallet key serial number matches to current user's key, user uuid: %@";
    v13 = v9;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 32;
LABEL_10:
    _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v19, v15);

  }
LABEL_11:

  objc_autoreleasePoolPop(v7);
}

void __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeWalletKeyOnboardingBulletin");
    v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke_2;
    v4[3] = &unk_24E77BB90;
    v4[4] = v3;
    v5 = v2;
    objc_msgSend(v3, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("onboarded for wallet key"), v5, v4);

  }
  else if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyStateToState:flow:", 6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "auditExistingWalletKeysForDuplicatesWithFlow:", *(_QWORD *)(a1 + 40));
  }
}

void __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "domain");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 == CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"))
  {
    if (objc_msgSend(v6, "code") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_replaceWalletKeyAfterHH2Migration");
      goto LABEL_12;
    }
  }
  else
  {

  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when home has onboarded for wallet key: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when home onboarded for wallet key", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "createExpressModeSetUpBulletin");
  }
LABEL_12:

}

void __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1104;
    block[3] = &unk_24E79BBD0;
    v8 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v8;
    v16 = v5;
    dispatch_async(v7, block);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to generate nfc info, when handling home did update nfc reader key", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1104(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating existing wallet key with nfc info", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = a1[4];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1105;
  v8[3] = &unk_24E77C428;
  v8[4] = v7;
  v9 = a1[6];
  objc_msgSend(v7, "enqueueWalletKeyUpdateOperation:flow:", v8, a1[5]);

}

id __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1105(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "walletKeyByAddingAccessCodeToWalletKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "setNfcInfos:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint64_t __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "pairedReaderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hmf_initWithHexadecimalString:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40));

  return v8;
}

void __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke_1103(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added wallet key: %@", (uint8_t *)&v16, 0x20u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v12;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add wallet key: %@", (uint8_t *)&v16, 0x20u);

    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v8);
}

void __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_2;
  v3[3] = &unk_24E77BB90;
  v3[4] = v2;
  v4 = v1;
  objc_msgSend(v2, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("NFC reader key updated"), v4, v3);

}

void __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8 == CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"))
    {
      if (objc_msgSend(v6, "code") == 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "_replaceWalletKeyAfterHH2Migration");
        goto LABEL_18;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 == (void *)*MEMORY[0x24BDD5BD8])
    {
      v17 = objc_msgSend(v6, "code");

      if (v17 == 1)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543874;
          v29 = v21;
          v30 = 2112;
          v31 = v22;
          v32 = 2112;
          v33 = v5;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key already exists: %@, when handling home did update nfc reader key", (uint8_t *)&v28, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        v16 = objc_msgSend(*(id *)(a1 + 32), "handleNFCReaderKeyUpdatedForWalletKey:flow:", v5, *(_QWORD *)(a1 + 40));
      }
    }
    else
    {

    }
    v23 = (void *)MEMORY[0x227676638](v16);
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v26;
      v30 = 2112;
      v31 = v27;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when NFC reader key was updated: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when NFC reader key was updated", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "createExpressModeSetUpBulletin");
  }
LABEL_18:

}

uint64_t __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
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
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Suspending home key", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyStateToState:flow:", 6, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "auditExistingWalletKeysForDuplicatesWithFlow:", *(_QWORD *)(a1 + 40));
}

void __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_1098(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_2;
  v3[3] = &unk_24E77BB90;
  v3[4] = v2;
  v4 = v1;
  objc_msgSend(v2, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("user schedule changed"), v4, v3);

}

void __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 == (void *)*MEMORY[0x24BDD5BD8])
    {
      v15 = objc_msgSend(v6, "code");

      if (v15 == 1)
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v19;
          v27 = 2112;
          v28 = v20;
          v21 = "%{public}@[Flow: %@] Home key already exists in wallet";
          v22 = v18;
          v23 = OS_LOG_TYPE_INFO;
          v24 = 22;
LABEL_12:
          _os_log_impl(&dword_2218F0000, v22, v23, v21, (uint8_t *)&v25, v24);

        }
LABEL_13:

        objc_autoreleasePoolPop(v16);
        goto LABEL_14;
      }
    }
    else
    {

    }
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v6;
      v21 = "%{public}@[Flow: %@] Failed to add home key with error: %@";
      v22 = v18;
      v23 = OS_LOG_TYPE_ERROR;
      v24 = 32;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 32), "createExpressModeSetUpBulletin");
LABEL_14:

}

uint64_t __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Suspending home key when accessory was removed: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(a1[4], "updateWalletKeyStateToState:flow:", 6, a1[5]);
  return objc_msgSend(a1[4], "auditExistingWalletKeysForDuplicatesWithFlow:", a1[5]);
}

uint64_t __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke_1095(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "supportsAccessCode");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "updateWalletKeyAccessCodeFieldWithReason:", CFSTR("accessory removed"));
  return result;
}

void __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_2(id *a1)
{
  id v2;
  char v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v35 = 0;
  v3 = objc_msgSend(v2, "canAutoAddWalletKeyWithError:", &v35);
  v4 = v35;
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = a1[4];
    v7 = a1[6];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_1092;
    v31[3] = &unk_24E77C490;
    v31[4] = v6;
    v32 = v7;
    v33 = a1[7];
    v34 = a1[5];
    objc_msgSend(v6, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("wallet key support added"), v32, v31);

  }
  else
  {
    objc_msgSend(v4, "domain");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8 == CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"))
    {
      if (objc_msgSend(v5, "code") == 3)
      {
        objc_msgSend(a1[4], "_replaceWalletKeyAfterHH2Migration");
        goto LABEL_21;
      }
    }
    else
    {

    }
    if (objc_msgSend(a1[5], "wasUpdatedWithServiceType:", CFSTR("00000266-0000-1000-8000-0026BB765291"))
      && (objc_msgSend(a1[5], "hasPostedBulletinForWalletKeyOnboarding") & 1) == 0)
    {
      objc_msgSend(a1[4], "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isAdminUser")
        && (objc_msgSend(a1[4], "dataSource"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isWatch"),
            v16,
            (v17 & 1) == 0))
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = a1[4];
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "UUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "shortDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v37 = v27;
          v38 = 2112;
          v39 = v28;
          v40 = 2112;
          v41 = v29;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home hasn't onboarded, creating lock onboarding bulletin after accessory was updated with wallet key support: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(a1[5], "updateHasPostedBulletinForWalletKeyOnboarding:", 1);
        objc_msgSend(a1[4], "bulletinBoard");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "insertLockOnboardingBulletinForHome:serviceType:", v15, CFSTR("00000266-0000-1000-8000-0026BB765291"));

      }
      else
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = a1[4];
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "shortDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v37 = v21;
          v38 = 2112;
          v39 = v22;
          v40 = 2112;
          v41 = v23;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not creating lock onboarding bulletin on non-admin or watch after accessory was updated with wallet key support: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = a1[4];
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v12;
        v38 = 2112;
        v39 = v13;
        v40 = 2112;
        v41 = v14;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home hasn't onboarded, not handling wallet key support update for accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }
  }
LABEL_21:

}

void __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_1092(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 != (void *)*MEMORY[0x24BDD5BD8])
    {

LABEL_13:
      v26 = (void *)MEMORY[0x227676638]();
      v27 = a1[4];
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "shortDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138544386;
        v34 = v29;
        v35 = 2112;
        v36 = v30;
        v37 = 2112;
        v38 = v31;
        v39 = 2112;
        v40 = v32;
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key when handling notification: %@ for accessory %@:%@", (uint8_t *)&v33, 0x34u);

      }
      objc_autoreleasePoolPop(v26);
      goto LABEL_16;
    }
    v17 = objc_msgSend(v6, "code");

    if (v17 != 1)
      goto LABEL_13;
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1[4];
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v21;
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v23;
      v39 = 2112;
      v40 = v24;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home key already exists in wallet when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(a1[4], "syncDeviceCredentialKeyForAccessory:paymentApplications:flow:", a1[7], MEMORY[0x24BDBD1A8], a1[5]);
    if (objc_msgSend(a1[7], "wasUpdatedWithServiceType:", CFSTR("00000266-0000-1000-8000-0026BB765291"))
      && (objc_msgSend(a1[7], "hasPostedBulletinForWalletKeyOnboarding") & 1) == 0)
    {
      objc_msgSend(a1[7], "updateHasPostedBulletinForWalletKeyOnboarding:", 1);
      objc_msgSend(a1[4], "bulletinBoard");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "insertWalletKeySupportAddedBulletinForAccessory:", a1[7]);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1[4];
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      v37 = 2112;
      v38 = v15;
      v39 = 2112;
      v40 = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[4], "createExpressModeSetUpBulletin");
  }
LABEL_16:

}

void __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_3;
  v4[3] = &unk_24E77C490;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("accessory added"), v5, v4);

}

void __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == (void *)*MEMORY[0x24BDD5BD8])
  {
    v10 = objc_msgSend(v6, "code");

    if (v10 == 1)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = a1[4];
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138544130;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v16;
        v39 = 2112;
        v40 = v17;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home key already exists in wallet when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);

      }
      objc_autoreleasePoolPop(v11);
      if (objc_msgSend(a1[7], "supportsAccessCode"))
        objc_msgSend(a1[4], "updateWalletKeyAccessCodeFieldWithReason:", CFSTR("accessory added"));
      objc_msgSend(a1[4], "syncDeviceCredentialKeyForAccessory:paymentApplications:flow:", a1[7], MEMORY[0x24BDBD1A8], a1[5]);
      goto LABEL_20;
    }
  }
  else
  {

  }
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v18 == CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"))
    {
      if (objc_msgSend(v6, "code") == 3)
      {
        objc_msgSend(a1[4], "_replaceWalletKeyAfterHH2Migration");
        goto LABEL_20;
      }
    }
    else
    {

    }
    v26 = (void *)MEMORY[0x227676638]();
    v27 = a1[4];
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544386;
      v34 = v29;
      v35 = 2112;
      v36 = v30;
      v37 = 2112;
      v38 = v31;
      v39 = 2112;
      v40 = v32;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key when handling notification: %@ for accessory %@:%@", (uint8_t *)&v33, 0x34u);

    }
    objc_autoreleasePoolPop(v26);
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1[4];
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      v39 = 2112;
      v40 = v25;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(a1[4], "createExpressModeSetUpBulletin");
  }
LABEL_20:

}

void __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("HMDHomeNameNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke_2;
  v9 = &unk_24E77C428;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v4 = v3;
  v5 = _Block_copy(&v6);
  objc_msgSend(*(id *)(a1 + 40), "enqueueWalletKeyUpdateOperation:flow:", v5, *(_QWORD *)(a1 + 48), v6, v7, v8, v9, v10);

}

id __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend(v3, "state") == 6 || objc_msgSend(v3, "state") == 1)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setHomeName:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "setWalletKeyDescription:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __61__HMDHomeWalletKeyManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification user removed: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v5, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "passSerialNumberWithUserUUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "passSerialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v14);

  if (v16)
    objc_msgSend(*(id *)(a1 + 40), "updateWalletKeyStateToState:flow:", 10, v6);
  objc_msgSend(*(id *)(a1 + 40), "removeDuplicateWalletKeysForUser:flow:", v5, v6);

}

uint64_t __91__HMDHomeWalletKeyManager_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification__block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
  {
    return objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyWithReason:flow:completion:", CFSTR("Exited lost mode with auth"), *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    return objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyStateToState:flow:", 1, *(_QWORD *)(a1 + 40));
  }
}

uint64_t __48__HMDHomeWalletKeyManager_handleLostModeUpdated__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 48))
  {
    v1 = result;
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      return objc_msgSend(*(id *)(v1 + 32), "updateWalletKeyWithReason:flow:completion:", CFSTR("Entered lost mode"), *(_QWORD *)(v1 + 40), 0);
    }
    else
    {
      return objc_msgSend(*(id *)(v1 + 32), "updateWalletKeyStateToState:flow:", 7, *(_QWORD *)(v1 + 40));
    }
  }
  return result;
}

uint64_t __56__HMDHomeWalletKeyManager_handleApplicationUninstalled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyAccessCodeFieldWithReason:", CFSTR("home app uninstalled"));
}

uint64_t __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyAccessCodeFieldWithReason:", CFSTR("home app installed"));
}

uint64_t __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke_1071(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autoAddWalletKeyWithFlow:", *(_QWORD *)(a1 + 40));
}

void __72__HMDHomeWalletKeyManager_handleSystemInfoMigrationUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Auto adding wallet key after device migration has finished", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "autoAddWalletKeyWithFlow:", v2);

}

uint64_t __82__HMDHomeWalletKeyManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWalletKeyAccessCodeFieldWithReason:", CFSTR("supports access code changed"));
}

id __68__HMDHomeWalletKeyManager_accessoryManager_didUpdateWalletKeyColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend(v3, "state") == 1)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setColor:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __70__HMDHomeWalletKeyManager_showExpressEnabledNotificationForWalletKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to show express enabled user notification: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully showed express enabled user notification";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_2;
  v6[3] = &unk_24E77C398;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v10 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "fetchShouldAutoEnableExpressWithCompletion:", v6);

}

void __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_3;
  v6[3] = &unk_24E789BB8;
  v9 = *(_BYTE *)(a1 + 56);
  v10 = a2;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

}

uint64_t __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 57))
    v1 = *(unsigned __int8 *)(a1 + 56) | 2;
  else
    v1 = *(unsigned __int8 *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "addWalletKeyWithOptions:isOnboarding:flow:completion:", v1, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke(id *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(a1[4], "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke_2;
  block[3] = &unk_24E77C348;
  v13 = a1[4];
  v18 = v11;
  v19 = v13;
  v25 = a1[8];
  v26 = a2;
  v20 = a1[5];
  v21 = v9;
  v22 = a1[6];
  v23 = v10;
  v24 = a1[7];
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_async(v12, block);

}

void __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  HMDHomeWalletKey *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v1 = a1;
  v30 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "shouldRollWalletKeyAfterMigration"))
      objc_msgSend(*(id *)(v1 + 40), "_replaceWalletKeyAfterHH2Migration");
    v2 = _Block_copy(*(const void **)(v1 + 88));
    if (v2)
    {
      v21 = v2;
      (*((void (**)(void *, uint64_t, _QWORD))v2 + 2))(v2, 3, *(_QWORD *)(v1 + 32));
      v2 = v21;
    }

    return;
  }
  v3 = *(_QWORD *)(a1 + 96);
  if (v3 != 1)
    goto LABEL_10;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    a1 = objc_msgSend(*(id *)(a1 + 40), "syncDeviceCredentialKeyForAccessory:paymentApplications:flow:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v3 = *(_QWORD *)(v1 + 96);
LABEL_10:
    if (!v3)
    {
      v5 = -[HMDHomeWalletKey initWithPKPass:flow:]([HMDHomeWalletKey alloc], "initWithPKPass:flow:", *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 64));
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke_3;
      v22[3] = &unk_24E77BEE0;
      v22[4] = *(_QWORD *)(v1 + 40);
      v6 = *(void **)(v1 + 56);
      v23 = *(id *)(v1 + 64);
      objc_msgSend(v6, "na_each:", v22);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(v1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 64), "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating client wallet key uuid: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(v1 + 80), "saveClientWalletKeyUUIDToLocalStore:", v7);
      if (!*(_QWORD *)(v1 + 96))
        objc_msgSend(*(id *)(v1 + 40), "showExpressEnabledNotificationForWalletKey:", v5);
      objc_msgSend(*(id *)(v1 + 40), "createExpressModeSetUpBulletin");

      v3 = *(_QWORD *)(v1 + 96);
    }
    if (v3 == 2)
    {
      v13 = (void *)MEMORY[0x227676638](a1);
      v14 = *(id *)(v1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 64), "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        v26 = 2112;
        v27 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resetting dismissed UWB onboarding flag and clearing client wallet key UUID", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(v1 + 40), "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resetHomeKeyMiscInfo");

    }
  }
  v19 = _Block_copy(*(const void **)(v1 + 88));
  v20 = v19;
  if (v19)
    (*((void (**)(void *, _QWORD, _QWORD))v19 + 2))(v19, *(_QWORD *)(v1 + 96), 0);

}

void __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "subcredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "paymentType");
  if (v6 == 1004)
  {
    objc_msgSend(*(id *)(a1 + 32), "syncDeviceCredentialKey:ofType:flow:", v8, 1, *(_QWORD *)(a1 + 40));
  }
  else if (v6 == 1003)
  {
    +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "syncDeviceCredentialKey:ofType:flow:", v7, 0, *(_QWORD *)(a1 + 40));

  }
}

id __68__HMDHomeWalletKeyManager_updateWalletKeyAccessCodeFieldWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend(v3, "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "walletKeyByAddingAccessCodeToWalletKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke_2;
  v5[3] = &unk_24E781B20;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

BOOL __83__HMDHomeWalletKeyManager_deviceCredentialKeyForAccessory_fromPaymentApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentType") == 1003;
}

BOOL __83__HMDHomeWalletKeyManager_deviceCredentialKeyForAccessory_fromPaymentApplications___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentType") == 1004;
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@[Flow: %@] Failed to configured accessory with device credential key %@:%@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 42;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v15, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v11 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1048(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(a1[4], "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1049;
    v13[3] = &unk_24E79A910;
    v13[4] = a1[4];
    v14 = a1[6];
    v15 = v5;
    v16 = a1[5];
    dispatch_async(v7, v13);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch the transaction key: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1049(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nfcReaderKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_2;
  v8[3] = &unk_24E799FD0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v4, "configureAccessory:withDeviceCredentialKey:ofType:flow:completion:", v5, v6, 0, v9, v8);

}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@[Flow: %@] Failed to configured accessory with device credential key %@:%@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 42;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v15, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v11 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

id __60__HMDHomeWalletKeyManager_updateWalletKeyStateToState_flow___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7 == 10 || v7 == 6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v26 = 138543874;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2048;
      v31 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing home key from wallet since updated state is: %ld", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v15 = 0;
    *a3 = 1;
  }
  else
  {
    v17 = objc_msgSend(v5, "state");
    if (v17 == *(_QWORD *)(a1 + 48))
    {
      v18 = v17;
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 48);
        v26 = 138544130;
        v27 = v22;
        v28 = 2112;
        v29 = v23;
        v30 = 2048;
        v31 = v18;
        v32 = 2048;
        v33 = v24;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not updating wallet key since existing wallet key state: %lu matches final state: %lu", (uint8_t *)&v26, 0x2Au);

      }
      objc_autoreleasePoolPop(v19);
      v15 = 0;
    }
    else
    {
      v25 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v25, "setState:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "walletKeyByAddingAccessCodeToWalletKey:", v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v15;
}

id __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
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
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v62;
  __CFString *v63;
  _QWORD v64[6];
  id v65;
  void *v66;
  _BYTE *v67;
  void *v68;
  __CFString *v69;
  _BYTE buf[24];
  const __CFString *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 64))
  {
LABEL_6:
    v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    v10 = objc_msgSend(v4, "paymentCredentialType");
    v11 = CFSTR("Aliro");
    if (v10 != 1)
      v11 = 0;
    if (v10)
      v12 = v11;
    else
      v12 = CFSTR("UnifiedAccess");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("paymentType"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("state"));

    objc_msgSend(v4, "secureElementIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("secureElementIdentifier"));

    objc_msgSend(v4, "applicationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("applicationIdentifier"));

    objc_msgSend(*(id *)(a1 + 56), "serialNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("DPANIdentifier"));

    objc_msgSend(*(id *)(a1 + 56), "serialNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "serialNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v18, "length") - 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("DPANSuffix"));

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("state"));

    objc_msgSend(v4, "subCredentialIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("identifier"));

    objc_msgSend(v4, "pairedReaderIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("pairedReaderIdentifier"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("automaticSelectionCriteria"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v29 = v28;

    if (!v29)
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        v71 = CFSTR("automaticSelectionCriteria");
        v72 = 2112;
        v73 = v9;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Automatic selection criteria key: %@ does not exist in payment application: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v38);
      v43 = 0;
      goto LABEL_47;
    }
    objc_msgSend(v4, "pairedReaderIdentifier");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        v71 = v63;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting paired reader identifier in automatic selection criteria: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      v35 = (void *)objc_msgSend(v29, "mutableCopy");
      v69 = v63;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("readerIDs"));

      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
      {
        v37 = objc_msgSend(v4, "paymentCredentialType");
        if (v37 == 1)
        {
          objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_24E970CE8, CFSTR("tcis"));
          v53 = *(_BYTE *)(a1 + 65) ? &unk_24E96AC10 : &unk_24E96ABF8;
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v53, CFSTR("allSupportedRadioTechnologies"));
          objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("aliro"), CFSTR("isoFormat"));
        }
        else if (!v37)
        {
          objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_24E970CD0, CFSTR("tcis"));
          objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24E96ABF8, CFSTR("allSupportedRadioTechnologies"));
        }
        if (objc_msgSend(v4, "paymentCredentialType") == 1)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v71) = 0;
          objc_msgSend(*(id *)(a1 + 32), "home");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "backingStore");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "context");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = MEMORY[0x24BDAC760];
          v64[1] = 3221225472;
          v64[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_1020;
          v64[3] = &unk_24E79B670;
          v58 = *(void **)(a1 + 40);
          v64[4] = *(_QWORD *)(a1 + 32);
          v64[5] = v54;
          v67 = buf;
          v65 = v58;
          v66 = v62;
          objc_msgSend(v57, "unsafeSynchronousBlock:", v64);

          v59 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {

            _Block_object_dispose(buf, 8);
LABEL_43:

            v43 = 0;
LABEL_46:

LABEL_47:
            goto LABEL_48;
          }
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v62, CFSTR("associatedReaderIDs"));
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v54, CFSTR("aliroGroupResolvingKeys"));

          _Block_object_dispose(buf, 8);
          if (v59)
            goto LABEL_43;
        }
      }
      v68 = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v60, CFSTR("automaticSelectionCriteria"));

    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("subcredential"));
    v43 = v9;
    goto LABEL_46;
  }
  objc_msgSend(v3, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "secureElementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "subCredentialIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "pairedReaderIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          goto LABEL_6;
        goto LABEL_32;
      }

    }
  }
LABEL_32:
  v44 = (void *)MEMORY[0x227676638]();
  v45 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationIdentifier");
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secureElementIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subCredentialIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairedReaderIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v47;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2112;
    v71 = v49;
    v72 = 2112;
    v73 = v50;
    v74 = 2112;
    v75 = v51;
    v76 = 2112;
    v77 = v52;
    _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pass JSON because critical NFC Info is missing. applicationIdentifier: %@, secureElementIdentifier: %@, subCredentialIdentifier: %@, pairedReaderIdentifier: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v44);
  v43 = 0;
LABEL_48:

  return v43;
}

void __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_1020(uint64_t a1)
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
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "matCredGRK");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_hexadecimalRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v4, "matCredGRK");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_hexadecimalRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    objc_msgSend(v4, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_map:", &__block_literal_global_1023);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_filter:", &__block_literal_global_1025);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_3;
    v20[3] = &unk_24E77C220;
    v20[4] = *(_QWORD *)(a1 + 32);
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v21 = v13;
    v22 = v14;
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "na_each:", v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] matCredGRK is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }

}

void __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
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
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "preexistingMatCredRGI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preexistingMatCredRPK");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preexistingMatCredGRK");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 && v5 && v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "modelID");
      v21 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v4;
      v36 = 2112;
      v37 = v5;
      v38 = 2112;
      v39 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting ACWG data from other fabrics for accessory: %@, preexistingMatCredRGI: %@, preexistingMatCredRPK: %@, preexistingMatCredGRK: %@", buf, 0x3Eu);

      v8 = v21;
    }

    objc_autoreleasePoolPop(v8);
    v22 = *(void **)(a1 + 48);
    v26[0] = CFSTR("readerID");
    objc_msgSend(v4, "hmf_hexadecimalRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = &unk_24E96AC28;
    v26[1] = CFSTR("priority");
    v26[2] = CFSTR("readerCAs");
    v23[0] = CFSTR("scheme");
    v23[1] = CFSTR("publicKey");
    v24[0] = CFSTR("secp256r1");
    objc_msgSend(v5, "hmf_hexadecimalRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v18);

    v19 = *(void **)(a1 + 56);
    objc_msgSend(v7, "hmf_hexadecimalRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
}

BOOL __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "preexistingMatCredRGI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_1021(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255852958))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __90__HMDHomeWalletKeyManager_updatePassJSONAtURL_withWalletKey_options_validateNFCInfo_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "na_any:", &__block_literal_global_275);

}

BOOL __90__HMDHomeWalletKeyManager_updatePassJSONAtURL_withWalletKey_options_validateNFCInfo_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255852958))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "supportsMatCredACB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __147__HMDHomeWalletKeyManager_createPassDirectoryWithWalletKey_options_shouldSkipResourceFiles_shouldCreateZipArchive_validateNFCInfo_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!v3)
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_3;
    }
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathExtension:", CFSTR("pkpass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "fileManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v35 = 0;
    v10 = objc_msgSend(v8, "zipItemAtURL:toURL:error:", v9, v7, &v35);
    v11 = v35;

    objc_msgSend(WeakRetained, "fileManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v34 = 0;
    v14 = objc_msgSend(v12, "removeItemAtURL:error:", v13, &v34);
    v15 = v34;

    if ((v14 & 1) != 0)
    {
      if ((v10 & 1) != 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_16:

        goto LABEL_17;
      }
      v23 = MEMORY[0x227676638]();
      v24 = WeakRetained;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v27 = v11;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v37 = v26;
        v38 = 2112;
        v39 = v28;
        v40 = 2112;
        v41 = v29;
        v42 = 2112;
        v43 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create the zip file at URL %@:%@", buf, 0x2Au);

        v11 = v27;
        v23 = v33;
      }

      v22 = (void *)v23;
    }
    else
    {
      v16 = MEMORY[0x227676638]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = v11;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v37 = v19;
        v38 = 2112;
        v39 = v20;
        v40 = 2112;
        v41 = v21;
        v42 = 2112;
        v43 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

        v11 = v32;
      }

      v22 = (void *)v16;
    }
    objc_autoreleasePoolPop(v22);
    v30 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v30 + 16))(v30, 0, 0, v31);

    goto LABEL_16;
  }
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_3:
  v6();
LABEL_17:

}

void __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "isoCredentialACWGFactory");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v3, *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_269;
    v13[3] = &unk_24E796D00;
    v6 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v6;
    v17 = *(id *)(a1 + 72);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v5, "encodeWithCompletion:", v13);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to find Issuer Key in keychain", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
  }

}

void __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_2;
  block[3] = &unk_24E798170;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v19 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 64), "subCredentialIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("ISO18013-%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v27 = 0;
    v8 = objc_msgSend(v6, "writeData:toURL:options:error:", v7, v5, 0, &v27);
    v9 = v27;

    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v14;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created ACWG iso credential", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v22;
        v30 = 2112;
        v31 = v23;
        v32 = 2112;
        v33 = v5;
        v34 = 2112;
        v35 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write UA ACWG credential to file at url %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD1398]);
      v25 = *(_QWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 52, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create encoded ACWG ISO credential %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke_2;
  block[3] = &unk_24E798170;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v19 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 64), "subCredentialIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("ISO18013-%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v27 = 0;
    v8 = objc_msgSend(v6, "writeData:toURL:options:error:", v7, v5, 0, &v27);
    v9 = v27;

    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v14;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created UA iso credential", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v22;
        v30 = 2112;
        v31 = v23;
        v32 = 2112;
        v33 = v5;
        v34 = 2112;
        v35 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write UA ISO credential to file at url %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD1398]);
      v25 = *(_QWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 52, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create encoded UA ISO credential %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
}

id __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "paymentCredentialType");
  if (v5 == 1)
  {
    v10 = (void *)a1[4];
    v11 = a1[5];
    v12 = a1[6];
    objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addISOCredentialV1WithPassAtURL:nfcInfo:flow:completion:", v11, v3, v12, v9);
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = (void *)a1[4];
    v7 = a1[5];
    v8 = a1[6];
    objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addISOCredentialV0WithPassAtURL:nfcInfo:flow:completion:", v7, v3, v8, v9);
LABEL_5:

  }
  return v4;
}

uint64_t __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    objc_initWeak(&location, a1[4]);
    objc_msgSend(a1[4], "passLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[5];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_261;
    v27[3] = &unk_24E77C0C0;
    objc_copyWeak(&v32, &location);
    v28 = v9;
    v29 = a1[5];
    v30 = a1[6];
    v31 = v8;
    objc_msgSend(v11, "updatePassAtURL:flow:completion:", v7, v12, v27);

    objc_msgSend(a1[4], "fileManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v14 = objc_msgSend(v13, "removeItemAtURL:error:", v7, &v26);
    v15 = v26;

    if ((v14 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = a1[4];
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v35 = v19;
        v36 = 2112;
        v37 = v20;
        v38 = 2112;
        v39 = v7;
        v40 = 2112;
        v41 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1[4];
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create zipped pass: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(a1[4], "setIsWalletKeyUpdateOperationInProgress:", 0);
    objc_msgSend(a1[4], "handlePendingWalletKeyUpdateOperationsWithFlow:", a1[5]);
  }

}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_261(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update home key in Wallet :%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    if (v7)
    {
LABEL_5:
      objc_msgSend(v7, "workQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_262;
      v16[3] = &unk_24E79C268;
      v16[4] = v7;
      v17 = *(id *)(a1 + 40);
      dispatch_async(v12, v16);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated home key in Wallet", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    +[HMDHomeKeyDataRecorder sharedRecorder](HMDHomeKeyDataRecorder, "sharedRecorder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordUpdatedWalletKey:passJSONDict:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    if (v7)
      goto LABEL_5;
  }

}

uint64_t __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_262(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsWalletKeyUpdateOperationInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "handlePendingWalletKeyUpdateOperationsWithFlow:", *(_QWORD *)(a1 + 40));
}

void __63__HMDHomeWalletKeyManager_syncDeviceCredentialKey_ofType_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      v10 = "%{public}@[Flow: %@] Failed to configure accessory with device credential key: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v10 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __68__HMDHomeWalletKeyManager_enableExpressWithOptions_flow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
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
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40[2];
  id location;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v31 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "passLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_257;
    v33[3] = &unk_24E77C070;
    objc_copyWeak(v40, &location);
    v34 = *(id *)(a1 + 40);
    v35 = *(id *)(a1 + 48);
    v36 = v8;
    v12 = v7;
    v37 = v12;
    v38 = *(id *)(a1 + 56);
    v13 = v31;
    v14 = *(void **)(a1 + 64);
    v39 = v13;
    v40[1] = v14;
    objc_msgSend(v10, "addPassAtURL:flow:completion:", v12, v11, v33);

    objc_msgSend(*(id *)(a1 + 32), "fileManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    LOBYTE(v11) = objc_msgSend(v15, "removeItemAtURL:error:", v12, &v32);
    v16 = v32;

    if ((v11 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v30 = v17;
        HMFGetLogIdentifier();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v20;
        v44 = 2112;
        v45 = v21;
        v46 = 2112;
        v47 = v12;
        v48 = 2112;
        v49 = v16;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);

        v17 = v30;
      }

      objc_autoreleasePoolPop(v17);
    }
    objc_msgSend(*(id *)(a1 + 32), "logEvent", v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "submitSuccess");

    objc_destroyWeak(v40);
    objc_destroyWeak(&location);
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
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v26;
      v44 = 2112;
      v45 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create zipped pass", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "addWalletKeyFuture");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "finishWithError:", v29);

  }
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_257(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      +[HMDHomeKeyDataRecorder sharedRecorder](HMDHomeKeyDataRecorder, "sharedRecorder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordAddedWalletKey:passJSONDict:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v19 = *(_QWORD *)(a1 + 88);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_259;
      v21[3] = &unk_24E79A910;
      v20 = *(_QWORD *)(a1 + 32);
      v22 = *(id *)(a1 + 40);
      v23 = WeakRetained;
      v24 = *(id *)(a1 + 64);
      v25 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "enableExpressWithOptions:flow:completion:", v19, v20, v21);

      v18 = v22;
      goto LABEL_11;
    }
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to add home key in wallet at URL %@:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    objc_msgSend(v6, "addWalletKeyFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = -1;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to add home key in wallet at URL, object got invalidated", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    objc_msgSend(0, "addWalletKeyFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = 23;
  }
  objc_msgSend(v12, "hmErrorWithCode:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishWithError:", v18);
LABEL_11:

}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_259(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "invalidate");
  objc_msgSend(a1[5], "addWalletKeyFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", a1[6]);

  objc_msgSend(a1[5], "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_2;
  block[3] = &unk_24E79BBD0;
  v4 = a1[6];
  v5 = a1[5];
  v7 = v4;
  v8 = v5;
  v9 = a1[7];
  dispatch_async(v3, block);

}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nfcInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_3;
  v4[3] = &unk_24E77C048;
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v2, "na_each:", v4);

}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "paymentCredentialType");
  if (v3 == 1)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v11, "deviceCredentialKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v6 = v10;
    v8 = v5;
    v9 = 1;
    goto LABEL_5;
  }
  if (!v3)
  {
    objc_msgSend(v11, "deviceCredentialKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    v9 = 0;
LABEL_5:
    objc_msgSend(v6, "syncDeviceCredentialKey:ofType:flow:", v8, v9, v7);

  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addWalletKeyFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);

    if (v9 == v10)
    {
      objc_msgSend(v8, "setAddWalletKeyFuture:", 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      if (v5 && (*(_BYTE *)(a1 + 64) & 2) != 0)
        objc_msgSend(v8, "showExpressEnabledNotificationForWalletKey:", v5);
      objc_msgSend(v8, "handlePendingWalletKeyUpdateOperationsWithFlow:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);

      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Self became nil while waiting for add wallet key future to finish", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v6);
  }

}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_249(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Acquiring wallet provisioning assertion", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "passLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_252;
    v19[3] = &unk_24E77BFF8;
    v13 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v13;
    v21 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 64);
    v24 = *(id *)(a1 + 72);
    v14 = *(id *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 88);
    v25 = v14;
    v26 = v15;
    objc_msgSend(v12, "acquireAssertionOfType:withReason:completion:", 1, CFSTR("Adding Home Key"), v19);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Adding home key in wallet is not supported: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "addWalletKeyFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "finishWithError:", v5);

  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generating home key nfc info with reader key: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "spiClientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 72);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_253;
    v26[3] = &unk_24E77BFD0;
    v19 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v19;
    v28 = v5;
    v29 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 80);
    v21 = *(_QWORD *)(a1 + 88);
    v30 = v20;
    v31 = v21;
    objc_msgSend(v14, "configureWalletPaymentApplicationsWithNFCReaderKey:serialNumber:homeUniqueIdentifier:homeGRK:flow:completion:", v15, v16, v17, v18, v27, v26);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v22;
      v34 = 2112;
      v35 = v23;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not add home key in wallet, failed to acquire assertion: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "addWalletKeyFuture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "finishWithError:", v25);

  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generated NFC info: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_254;
    block[3] = &unk_24E796B20;
    v14 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = v14;
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v15 = v5;
    v16 = *(_QWORD *)(a1 + 72);
    v25 = v15;
    v27 = v16;
    v26 = *(id *)(a1 + 48);
    dispatch_async(v13, block);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate nfc info for home key: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "addWalletKeyFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithError:", v20);

  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_254(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "fetchWalletKeyColorOptionWithFlow:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_2;
  v7[3] = &unk_24E77BFA8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v10 = v3;
  v13 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v6 = (id)objc_msgSend(v2, "addSuccessBlock:", v7);

}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  HMDHomeWalletKey *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HMDHomeWalletKey *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = [HMDHomeWalletKey alloc];
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = objc_msgSend(v4, "integerValue");

  v10 = -[HMDHomeWalletKey initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:](v6, "initWithTypeIdentifier:serialNumber:state:walletKeyDescription:homeName:color:nfcInfos:", CFSTR("paymentpass.com.apple.dev1"), v7, 1, v8, v8, v9, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "walletKeyByAddingAccessCodeToWalletKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addWalletKey:withOptions:assertion:flow:", v11, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __61__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
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
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1[4];
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "integerValue");
      HMHomeWalletKeyColorAsString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetch wallet key color: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "walletKeyColor");
      HMHomeWalletKeyColorAsString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch wallet key color: %@, using default wallet key color: %@", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1[4], "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "walletKeyColor"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1[6], "finishWithResult:", v5);

}

void __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "fetchWalletKeyColorOptionWithFlow:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke_2;
  v4[3] = &unk_24E79A028;
  v5 = *(id *)(a1 + 48);
  v3 = (id)objc_msgSend(v2, "addSuccessBlock:", v4);

}

uint64_t __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke_2;
  v18[3] = &unk_24E77BF08;
  v19 = v11;
  v24 = *(id *)(a1 + 48);
  v25 = a2;
  v13 = *(void **)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = v13;
  v22 = v10;
  v14 = *(_QWORD *)(a1 + 56);
  v23 = v9;
  v26 = v14;
  v15 = v9;
  v16 = v10;
  v17 = v11;
  dispatch_async(v12, v18);

}

void __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke_246(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
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
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addWalletKeyWithOptions:nfcReaderKey:flow:completion:", *(_QWORD *)(a1 + 56), v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or create reader key: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HMDHomeWalletKey *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0);
  }
  else
  {
    if (*(_QWORD *)(a1 + 80) == 2)
    {
      v2 = (void *)MEMORY[0x227676638]();
      v3 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v5;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass was removed when we were expecting an add", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v2);
      v7 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v8 = (HMDHomeWalletKey *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, HMDHomeWalletKey *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      v8 = -[HMDHomeWalletKey initWithPKPass:flow:]([HMDHomeWalletKey alloc], "initWithPKPass:flow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      if (*(_QWORD *)(a1 + 80) == 1)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v12;
          v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass was updated when we were expecting an add", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        (*(void (**)(_QWORD, HMDHomeWalletKey *, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v8, 0);
      }
      else
      {
        v14 = *(void **)(a1 + 64);
        v23 = MEMORY[0x24BDAC760];
        v24 = 3221225472;
        v25 = __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke_241;
        v26 = &unk_24E77BEE0;
        v15 = *(void **)(a1 + 48);
        v27 = *(_QWORD *)(a1 + 40);
        v28 = v15;
        objc_msgSend(v14, "na_each:", &v23);
        objc_msgSend(MEMORY[0x24BDD1880], "UUID", v23, v24, v25, v26, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x227676638]();
        v18 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v20;
          v31 = 2112;
          v32 = v21;
          v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating client wallet key uuid: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(*(id *)(a1 + 40), "home");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "saveClientWalletKeyUUIDToLocalStore:", v16);

        if ((*(_BYTE *)(a1 + 88) & 2) != 0)
          objc_msgSend(*(id *)(a1 + 40), "showExpressEnabledNotificationForWalletKey:", v8);
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

      }
    }

  }
}

void __96__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_isRollingForHH2_flow_completion___block_invoke_241(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "subcredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "paymentType");
  if (v6 == 1004)
  {
    objc_msgSend(*(id *)(a1 + 32), "syncDeviceCredentialKey:ofType:flow:", v8, 1, *(_QWORD *)(a1 + 40));
  }
  else if (v6 == 1003)
  {
    +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "syncDeviceCredentialKey:ofType:flow:", v7, 0, *(_QWORD *)(a1 + 40));

  }
}

void __87__HMDHomeWalletKeyManager_fetchPayloadForAddWalletKeyRemoteMessageWithFlow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v8)
    {
      v12 = CFSTR("HMDHomeWalletKeyManagerRemoteMessageKeyNFCReaderKey");
      v13[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
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
      v26 = 138544130;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Watch: %@ failed to handle message %@:%@ ", (uint8_t *)&v26, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    v14 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    os_unfair_lock_lock_with_options();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v16 = 2008;
    }
    else
    {
      v25 = objc_msgSend(v5, "code");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      if (v25 == 1)
      {
        if (*(_QWORD *)(v15 + 24) != 52)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v5, "code");
        goto LABEL_18;
      }
      v16 = 52;
    }
    *(_QWORD *)(v15 + 24) = v16;
LABEL_18:
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
    goto LABEL_19;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    v26 = 138543874;
    v27 = v17;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Watch: %@ successfully handled message %@", (uint8_t *)&v26, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v14 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (*(_QWORD *)(v20 + 24))
    *(_QWORD *)(v20 + 24) = 2008;
  v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  }
  objc_msgSend(v21, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
LABEL_19:
  os_unfair_lock_unlock(v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke_238(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 32), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD6408]);
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
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode error by device", (uint8_t *)&v9, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke_2;
  v12[3] = &unk_24E799C60;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v9;
  v18 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 48);
  v17 = v5;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "code") != 2)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflicting pass description: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v11 = (id)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
    objc_msgSend(v11, "setExpressEnablementConflictingPassDescription:", *(_QWORD *)(a1 + 64));
    v3 = *(_QWORD *)(a1 + 72);
    v4 = (void *)objc_msgSend(v11, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;

  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke_2;
  block[3] = &unk_24E77BDF0;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v7;
  v14 = v9;
  v15 = v10;
  v18 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  v19 = a2;
  v20 = a3;
  v17 = *(id *)(a1 + 56);
  v11 = v7;
  dispatch_async(v8, block);

}

void __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v26 = 138543874;
      v27 = v5;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express setting of existing pass: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    v8 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    v10 = *(void **)(a1 + 56);
    v11 = *(unsigned __int8 *)(a1 + 80);
    v12 = *(unsigned __int8 *)(a1 + 81);
    objc_msgSend(*(id *)(a1 + 40), "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientWalletKeyUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "xpcWalletKeyWithExpressEnabled:uwbEnabled:clientWalletKeyUUID:", v11, v12, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v15 = (void *)objc_msgSend(*(id *)(a1 + 64), "mutableCopy");
      objc_msgSend(v15, "setWalletKey:", v9);
      v16 = *(_QWORD *)(a1 + 72);
      v17 = (void *)objc_msgSend(v15, "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 56);
        v26 = 138543874;
        v27 = v21;
        v28 = 2112;
        v29 = v22;
        v30 = 2112;
        v31 = v23;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create xpc wallet key with wallet key: %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v24 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);

      v9 = 0;
    }
  }

}

void __68__HMDHomeWalletKeyManager_fetchHomeKeySupportedWithFlow_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  if ((a2 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = a3;
    v6 = (void *)objc_opt_class();
    v7 = objc_msgSend(v5, "code");

    objc_msgSend(v6, "homekitErrorWithPassLibraryErrorCode:", v7);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  objc_msgSend(a1[4], "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke_2;
  v9[3] = &unk_24E7962D8;
  v7 = a1[5];
  v13 = a2;
  v10 = v7;
  v11 = v5;
  v12 = a1[6];
  v8 = v5;
  dispatch_async(v6, v9);

}

void __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v4, "setCanAddWalletKey:", *(unsigned __int8 *)(a1 + 56));
  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(v4, "setCanAddWalletKeyErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = (void *)objc_msgSend(v4, "copy");
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(id, _QWORD, void *);
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    objc_msgSend(a1[4], "passLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke_231;
    v19[3] = &unk_24E77BDA0;
    v20 = a1[6];
    objc_msgSend(v11, "fetchExpressEnablementConflictingPassDescriptionForPassAtURL:completion:", v7, v19);

    v12 = v20;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass creation failed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 0, v12);
  }

}

uint64_t __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__HMDHomeWalletKeyManager_handleAddWalletKeyMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(WeakRetained, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (objc_msgSend(v9, "clientWalletKeyUUID"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      objc_msgSend(v9, "clientWalletKeyUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x227676638]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v22 = v13;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v16;
        v27 = 2112;
        v28 = v12;
        v29 = 2112;
        v30 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Client Wallet Key UUID saved to local store, using it: %@ instead of %@", buf, 0x20u);

        v13 = v22;
      }

      objc_autoreleasePoolPop(v13);
    }
    else
    {
      v12 = v10;
    }
    v18 = *(void **)(a1 + 32);
    v23 = *MEMORY[0x24BDD6458];
    v24 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "respondWithPayload:", v19);

    objc_msgSend(v9, "nfcReaderKeyManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "accessoryManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configureNFCReaderKeyForAllAccessoriesWithReason:", CFSTR("Add wallet key message"));

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterTTU"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      objc_msgSend(v8, "addIssuerKeysToMatterAccessoriesWithFlow:", *(_QWORD *)(a1 + 40));
    }

  }
}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_214(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v5 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "messagePayload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "messagePayload");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v4);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
}

uint64_t __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_216(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_3;
  v11[3] = &unk_24E77BD28;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = v10;
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v6, "sendMessageWithName:payload:toWatches:completion:", v7, v4, v8, v11);

}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
    v13 = a1[4];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  objc_msgSend(a1[6], "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responsePayloadForPairedWatchesWithMessageName:responsePayloadByDevice:error:", v7, v5, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD5C68]);

  if ((v5 & 1) != 0 && (objc_msgSend(v13, "code") == 2008 || !v13))
  {
    objc_msgSend(a1[5], "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nfcReaderKeyManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureNFCReaderKeyForAllAccessoriesWithReason:", CFSTR("Handle message for paired watches"));

    objc_msgSend(a1[6], "respondWithPayload:error:", v8, v13);
  }
  else
  {
    objc_msgSend(a1[6], "respondWithPayload:error:", v8, v13);
  }

}

BOOL __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "operatingSystemVersion");
  v5 = HMFOperatingSystemVersionCompare() != 1;

  return v5;
}

void __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings for home key: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully set express settings for home key. isNFCExpressEnabled: %@, isUWBEnabled: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithPayload:", MEMORY[0x24BDBD1B8]);
  }

}

void __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke_210(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings for home key: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully set express settings for home key. isNFCExpressEnabled: %@, isUWBEnabled: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithPayload:", MEMORY[0x24BDBD1B8]);
  }

}

void __66__HMDHomeWalletKeyManager_handleEnableExpressForWalletKeyMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express for home key: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully enabled express for home key", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithPayload:", MEMORY[0x24BDBD1B8]);
  }

}

void __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke_206(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    objc_msgSend(a1[4], "fileManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9;
    objc_msgSend(v11, "fileHandleForReadingFromURL:error:", v7, &v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v36;

    if (v12)
    {
      objc_msgSend(a1[4], "fileManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v13;
      v15 = objc_msgSend(v14, "removeItemAtURL:error:", v7, &v35);
      v16 = v35;

      if ((v15 & 1) == 0)
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = a1[4];
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v40 = v20;
          v41 = 2112;
          v42 = v21;
          v43 = 2112;
          v44 = v7;
          v45 = 2112;
          v46 = v16;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v17);
      }
      v37 = *MEMORY[0x24BDD5D60];
      v38 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "respondWithPayload:", v22);
      v13 = v16;
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = a1[4];
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v40 = v32;
        v41 = 2112;
        v42 = v33;
        v43 = 2112;
        v44 = v7;
        v45 = 2112;
        v46 = v13;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, file handle creation failed for file %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v29);
      v34 = a1[6];
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "respondWithError:", v22);
    }

    v9 = v13;
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = a1[4];
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass creation failed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    v28 = a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "respondWithError:", v12);
  }

}

id __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __60__HMDHomeWalletKeyManager_handleFetchWalletKeyColorMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding to FetchWalletKeyColorMessage with color: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *MEMORY[0x24BDD5D88];
  v11 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "respondWithPayload:", v9);

}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_2;
  v8[3] = &unk_24E77BC00;
  v8[4] = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v6, "updateDeviceStateWithWalletKey:flow:completion:", v4, v7, v8);

}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_3;
    v10[3] = &unk_24E77BC00;
    v10[4] = v8;
    v11 = v9;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "updateDeviceStateWithExpressEnablementConflictingPassDescription:flow:completion:", v5, v11, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }

}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1[4];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v13;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding with wallet key device state: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      v15 = a1[6];
      v26 = *MEMORY[0x24BDD6430];
      v27 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "respondWithPayload:", v16);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v22;
        v30 = 2112;
        v31 = v23;
        v32 = 2112;
        v33 = v5;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to encode wallet key device state %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      v24 = a1[6];
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "respondWithError:", v16);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update device state with express conflict. Error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(a1[6], "respondWithError:", v6);
  }

}

void __52__HMDHomeWalletKeyManager_autoAddWalletKeyWithFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  __CFString *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == (void *)*MEMORY[0x24BDD5BD8])
  {
    v10 = objc_msgSend(v6, "code");

    if (v10 == 1)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v14;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v5;
        v16 = "%{public}@[Flow: %@] Did not auto add wallet key, it already exists: %@";
LABEL_16:
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v21, 0x20u);

      }
LABEL_17:

      objc_autoreleasePoolPop(v11);
      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "domain");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v17 == CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"))
  {
    if (objc_msgSend(v6, "code") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_replaceWalletKeyAfterHH2Migration");
      goto LABEL_18;
    }
  }
  else
  {

  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v6;
      v16 = "%{public}@[Flow: %@] Failed to auto add wallet key: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v18)
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully auto added wallet key: %@", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(*(id *)(a1 + 32), "createExpressModeSetUpBulletin");
LABEL_18:

}

void __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Recovering due to uuid change of user: %@, old uuid: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend(*(id *)(a1 + 40), "isCurrentUser"))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentUserUUID:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "passSerialNumberWithUserUUID:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "passLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "removePassWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v11, v2);

  if ((v13 & 1) != 0)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v14 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke_189;
    v20[3] = &unk_24E77BBD8;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v2;
    objc_msgSend(v14, "addWalletKeyWithOptions:isOnboarding:flow:completion:", 1, 0, v21, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not recovering due to user UUID change because no home key exists in Wallet", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

void __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to recover due to user UUID change: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully recovered due to user UUID change", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "createExpressModeSetUpBulletin");
  }

}

void __61__HMDHomeWalletKeyManager__replaceWalletKeyAfterHH2Migration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638](objc_msgSend(WeakRetained, "setIsWalletKeyRollForHH2InProgress:", 0));
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to re-add wallet pass after update to HH2 with error: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added new wallet key after update to HH2, removing settings from disk", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "removeWalletKeyMigrationSettingsFileFromDisk");
  }

}

uint64_t __71__HMDHomeWalletKeyManager_replaceWalletKeyAfterHH2MigrationIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldRollWalletKeyAfterMigration");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_replaceWalletKeyAfterHH2Migration");
  return result;
}

void __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_177);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "passLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "passSerialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "walletKeyWithTypeIdentifier:serialNumber:flow:", CFSTR("paymentpass.com.apple.dev1"), v6, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v11;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key exists", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      v19 = *(void **)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_180;
      v20[3] = &unk_24E77BB90;
      v20[4] = v19;
      v21 = v18;
      objc_msgSend(v19, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("did add current user"), v21, v20);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessories support wallet key", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
}

void __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "domain");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 == CFSTR("HMDHomeAutoAddWalletKeyErrorDomain"))
  {
    if (objc_msgSend(v6, "code") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_replaceWalletKeyAfterHH2Migration");
      goto LABEL_12;
    }
  }
  else
  {

  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when current user was added: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when current user was added", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "createExpressModeSetUpBulletin");
  }
LABEL_12:

}

uint64_t __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsWalletKey");
}

void __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x227676638]();
    v6 = v2;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling passcode changed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("UWBUnlock"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)))
    {
      objc_msgSend(v6, "updateWalletKeyWithReason:flow:completion:", CFSTR("passcode changed"), v4, 0);
    }
    else
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke_171;
      v10[3] = &unk_24E77BB90;
      v10[4] = v6;
      v11 = v4;
      objc_msgSend(v6, "autoAddWalletKeyWithReason:flow:completion:", CFSTR("passcode changed"), v11, v10);

    }
  }

}

void __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key because passcode changed: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key because passcode changed", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "createExpressModeSetUpBulletin");
  }

}

HMDHomeWalletKeyISOCredentialACWG *__213__HMDHomeWalletKeyManager_initWithUUID_workQueue_fileManager_passLibrary_notificationCenter_watchManager_keychainStore_lostModeManager_dataSource_bulletinBoard_applicationRegistry_systemInfo_isoCredentialFactory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HMDHomeWalletKeyISOCredentialACWG *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[HMDHomeWalletKeyISOCredentialACWG initWithIssuerKeyPairExternalRepresentation:deviceCredentialPublicKeyExternalRepresentation:]([HMDHomeWalletKeyISOCredentialACWG alloc], "initWithIssuerKeyPairExternalRepresentation:deviceCredentialPublicKeyExternalRepresentation:", v5, v4);

  return v6;
}

HMDHomeWalletKeyISOCredential *__50__HMDHomeWalletKeyManager_initWithUUID_workQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HMDHomeWalletKeyISOCredential *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[HMDHomeWalletKeyISOCredential initWithHAPPairingIdentity:deviceCredentialKeyExternalRepresentation:]([HMDHomeWalletKeyISOCredential alloc], "initWithHAPPairingIdentity:deviceCredentialKeyExternalRepresentation:", v5, v4);

  return v6;
}

+ (id)allowedClassesForWalletKeySettings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)responsePayloadForPairedWatchesWithMessageName:(id)a3 responsePayloadByDevice:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "code");
  v11 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDD6410]);
  if (v9)
    v12 = v10 == 2008;
  else
    v12 = 1;
  v13 = v12;
  if (v11)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v9)
      v15 = 0;
    else
      v15 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    v44 = v9;
    v46 = v7;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v45 = v8;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    v47 = v16;
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v53;
      v21 = *MEMORY[0x24BDD6430];
      v48 = *MEMORY[0x24BDD6430];
      do
      {
        v22 = 0;
        v50 = v19;
        do
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v22);
          objc_msgSend(v17, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
          v27 = v26;

          if (v27)
          {
            v28 = (void *)MEMORY[0x24BDD1620];
            v29 = objc_opt_class();
            v51 = 0;
            objc_msgSend(v28, "unarchivedObjectOfClass:fromData:error:", v29, v27, &v51);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v51;
            if (v30)
            {
              objc_msgSend(v16, "setObject:forKey:", v30, v23);
            }
            else
            {
              v32 = v20;
              v33 = (void *)MEMORY[0x227676638]();
              v34 = a1;
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v59 = v36;
                v60 = 2112;
                v61 = v27;
                v62 = 2112;
                v63 = v31;
                _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode wallet key device state %@:%@", buf, 0x20u);

                v16 = v47;
              }

              objc_autoreleasePoolPop(v33);
              v20 = v32;
              v21 = v48;
              v19 = v50;
            }

          }
          ++v22;
        }
        while (v19 != v22);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      }
      while (v19);
    }

    encodeRootObjectForIncomingXPCMessage(v16, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
    {
      v56 = *MEMORY[0x24BDD6438];
      v57 = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v44;
    }
    else
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = a1;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      v9 = v44;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v42;
        v60 = 2112;
        v61 = 0;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to encoded wallet key device state by device %@", buf, 0x16u);

        v16 = v47;
      }

      objc_autoreleasePoolPop(v39);
      v15 = 0;
    }

    v8 = v45;
    v7 = v46;
  }

  return v15;
}

+ (id)homekitErrorWithPassLibraryErrorCode:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)(a3 - 1) > 7)
    v3 = 0;
  else
    v3 = qword_2226A0668[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD6400], v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t217 != -1)
    dispatch_once(&logCategory__hmf_once_t217, &__block_literal_global_1054);
  return (id)logCategory__hmf_once_v218;
}

void __38__HMDHomeWalletKeyManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v218;
  logCategory__hmf_once_v218 = v0;

}

@end
