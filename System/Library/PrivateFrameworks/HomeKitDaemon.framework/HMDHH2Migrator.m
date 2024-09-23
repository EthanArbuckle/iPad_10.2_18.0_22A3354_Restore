@implementation HMDHH2Migrator

- (HMDHH2Migrator)init
{
  HMDHH2FrameworkSwitch *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDBackgroundOperationManager *v7;
  void *v8;
  void *v9;
  HMDHH2Migrator *v10;

  v3 = -[HMDHH2FrameworkSwitch initWithAutoSwitchDisabledWithHomeManager:]([HMDHH2FrameworkSwitch alloc], "initWithAutoSwitchDisabledWithHomeManager:", 0);
  +[HMDHH2MigratorRecord singleRecord](HMDHH2MigratorRecord, "singleRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataCloudTransform sharedInstance](HMDCoreDataCloudTransform, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackgroundOperationManager initWithHomeManager:]([HMDBackgroundOperationManager alloc], "initWithHomeManager:", 0);
  +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDatabase cameraClipsDatabase](HMDDatabase, "cameraClipsDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHH2Migrator initWithMigratorRecord:hh2FrameworkSwitch:coreData:cloudTransform:backgroundOperationManager:defaultDatabase:cameraClipsDatabase:](self, "initWithMigratorRecord:hh2FrameworkSwitch:coreData:cloudTransform:backgroundOperationManager:defaultDatabase:cameraClipsDatabase:", v4, v3, v5, v6, v7, v8, v9);

  return v10;
}

- (HMDHH2Migrator)initWithMigratorRecord:(id)a3 hh2FrameworkSwitch:(id)a4 coreData:(id)a5 cloudTransform:(id)a6 backgroundOperationManager:(id)a7 defaultDatabase:(id)a8 cameraClipsDatabase:(id)a9
{
  id v16;
  id v17;
  HMDHH2Migrator *v18;
  HMDHH2Migrator *v19;
  uint64_t v20;
  NSMutableSet *scheduledKeyRollOperationsDuringMigration;
  uint64_t v22;
  NSMutableSet *v5ModelUpdateFutures;
  uint64_t v24;
  NSMutableSet *openedZones;
  uint64_t v26;
  NSDate *migrationStartTime;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *queue;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v16 = a8;
  v17 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HMDHH2Migrator;
  v18 = -[HMDHH2Migrator init](&v38, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_migratorRecord, a3);
    objc_storeStrong((id *)&v19->_hh2FrameworkSwitch, a4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    scheduledKeyRollOperationsDuringMigration = v19->_scheduledKeyRollOperationsDuringMigration;
    v19->_scheduledKeyRollOperationsDuringMigration = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    v5ModelUpdateFutures = v19->_v5ModelUpdateFutures;
    v19->_v5ModelUpdateFutures = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    openedZones = v19->_openedZones;
    v19->_openedZones = (NSMutableSet *)v24;

    objc_storeStrong((id *)&v19->_coreData, a5);
    objc_storeStrong((id *)&v19->_cloudTransform, a6);
    objc_storeStrong((id *)&v19->_backgroundOpsManager, a7);
    objc_storeStrong((id *)&v19->_defaultDatabase, a8);
    objc_storeStrong((id *)&v19->_cameraClipsDatabase, a9);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v26 = objc_claimAutoreleasedReturnValue();
    migrationStartTime = v19->_migrationStartTime;
    v19->_migrationStartTime = (NSDate *)v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("HMDHH2Migrator", v29);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v30;

  }
  return v19;
}

- (void)dealloc
{
  void *v3;
  HMDHH2Migrator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
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
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v4->_migrationStartTime);
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating... Total time : [%f]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v9.receiver = v4;
  v9.super_class = (Class)HMDHH2Migrator;
  -[HMDHH2Migrator dealloc](&v9, sel_dealloc);
}

- (BOOL)startMigrationIfNeeded
{
  HMDHH2Migrator *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDHH2Migrator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__HMDHH2Migrator_startMigrationIfNeeded__block_invoke;
  v5[3] = &unk_24E79B698;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)startMigrationFromLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  HMDHH2Migrator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  HMDHH2Migrator *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDHH2Migrator *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  HMDHH2Migrator *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDHH2Migrator *v35;
  NSObject *v36;
  void *v37;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:parent:options:", CFSTR("HH2 Migration"), 0, 1);
  objc_msgSend(v5, "begin");
  v6 = v5;
  v40 = v6;
  -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMigrationInProgress");
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  if ((v8 & 1) != 0)
  {
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v12;
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Current device is the designated migrator : [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if ((objc_msgSend(v7, "beginMigration") & 1) != 0)
    {
      -[HMDHH2Migrator hh2FrameworkSwitch](v10, "hh2FrameworkSwitch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v14 = objc_msgSend(v13, "areCloudKitServersReachableWithError:", &v39);
      v15 = v39;

      if (v14 == 1)
      {
        if (-[HMDHH2Migrator startMigratingHomeDataFromLocation:](v10, "startMigratingHomeDataFromLocation:", v4))
        {
          v28 = 0;
LABEL_27:

          v29 = 0;
          goto LABEL_28;
        }
        v34 = (void *)MEMORY[0x227676638](-[HMDHH2Migrator revertChangesPerformedDuringMigration](v10, "revertChangesPerformedDuringMigration"));
        v35 = v10;
        HMFGetOSLogHandle();
        v36 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v37;
          v43 = 2112;
          v44 = v7;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not finish HH2 migration successfully. Will try again. [%@]", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
      }
      else
      {
        if (v14)
        {
          v30 = (void *)MEMORY[0x227676638]();
          v31 = v10;
          HMFGetOSLogHandle();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v42 = v33;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot start the migration as there is a CloudKit account status issue", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v30);
          +[HMDHH2FrameworkSwitch errorFromHMDCKAccountStatus:](HMDHH2FrameworkSwitch, "errorFromHMDCKAccountStatus:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v31, "submitABCEventForFailedMigrationWithReason:withError:", 6, v20);
        }
        else
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = v10;
          HMFGetOSLogHandle();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v42 = v19;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot start the migration as CloudKit account status could not be queried", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v16);
          objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:underlyingError:", 2727, v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v17, "submitABCEventForFailedMigrationWithReason:withError:", 6, v20);
        }

      }
      v28 = 1;
      goto LABEL_27;
    }
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v10;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot start the migration as unable to record the migration attempt. Switching back to HH1 framework.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2718);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHH2MigratorRecord recordMigrationFailureWithError:](HMDHH2MigratorRecord, "recordMigrationFailureWithError:", v27);

    +[HMDHH2FrameworkSwitch switchBackToHH1AndRelaunchDueToHH2MigrationFailed](HMDHH2FrameworkSwitch, "switchBackToHH1AndRelaunchDueToHH2MigrationFailed");
    objc_msgSend(v7, "finishMigration");
  }
  else
  {
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Migration to HH2 is not needed as this device is not the designated migrator", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  v28 = 1;
  v29 = 1;
LABEL_28:

  __HMFActivityScopeLeave();
  return (v28 == 0) | v29;
}

- (BOOL)startMigratingHomeDataFromLocation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  BOOL v9;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  BOOL v21;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = 0;
  v6 = objc_msgSend(v5, "getOrCreateHH2ControllerKey:secretKey:keyPair:username:", &v24, 0, 0, &v23);
  v7 = v24;
  v8 = v23;

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_FAULT, "%{public}@FATAL Error : Unable to create HH2 Controller key", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v7);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BBB0]), "initWithIdentifier:publicKey:privateKey:permissions:", v8, v16, 0, 1);
    -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "migrateFromTestDirectory");

    v20 = (void *)MEMORY[0x227676638]();
    if (v19)
      v21 = -[HMDHH2Migrator _performMigrationFromTestDirectoryUsingHH2ControllerKey:](self, "_performMigrationFromTestDirectoryUsingHH2ControllerKey:", v17);
    else
      v21 = -[HMDHH2Migrator _startMigratingHomeDataFromLocation:usingHH2PairingKey:](self, "_startMigratingHomeDataFromLocation:usingHH2PairingKey:", v4, v17);
    v15 = v21;
    objc_autoreleasePoolPop(v20);

  }
  return v15;
}

- (BOOL)_startMigratingHomeDataFromLocation:(id)a3 usingHH2PairingKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHH2Migrator *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDHH2Migrator *v16;
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
  id v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  HMDHH2Migrator *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v37;
  HMDHH2Migrator *v38;
  NSObject *v39;
  void *v40;
  HMDHH2Migrator *v41;
  void *v42;
  HMDHH2Migrator *v43;
  void *v44;
  HMDHH2Migrator *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  _BYTE *v51;
  id v52;
  char v53;
  uint8_t v54[4];
  void *v55;
  void *v56;
  _BYTE buf[24];
  char v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@HH2 pairing identity : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v53 = 0;
  v12 = (void *)MEMORY[0x227676638](+[HMDHAPMetadata prepareMetadata](HMDHAPMetadata, "prepareMetadata"));
  v52 = 0;
  +[HMDMainDriver loadHomeDataFromLocalStore:fromLocation:decryptionFailed:forHH2Migration:](HMDMainDriver, "loadHomeDataFromLocalStore:fromLocation:decryptionFailed:forHH2Migration:", &v52, v6, &v53, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v52;
  if (v13)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_FAULT, "%{public}@Could not decrypt the archived home data. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v16, "submitABCEventForFailedMigrationWithReason:withError:", 7, v13);

    objc_autoreleasePoolPop(v12);
    goto LABEL_21;
  }
  objc_autoreleasePoolPop(v12);
  if (v53 || !v14)
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v9;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Unable to unarchive homeData. Cannot do HH2 Migration. Aborting...", buf, 0xCu);

    }
  }
  else
  {
    -[HMDHH2Migrator backgroundOpsManager](v9, "backgroundOpsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllOperationsBeforeStartingHH2Migration");

    if (-[HMDHH2Migrator waitForFirstImportToFinish](v9, "waitForFirstImportToFinish"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v58 = 0;
      -[HMDHH2Migrator coreData](v9, "coreData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "coordinator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2Migrator coreData](v9, "coreData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cloudPrivateStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentPersistentHistoryTokenFromStores:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDHH2Migrator coreData](v9, "coreData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "newManagedObjectContext");

      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __73__HMDHH2Migrator__startMigratingHomeDataFromLocation_usingHH2PairingKey___block_invoke;
      v47[3] = &unk_24E79B670;
      v51 = buf;
      v47[4] = v9;
      v48 = v14;
      v28 = v27;
      v49 = v28;
      v50 = v7;
      v29 = objc_msgSend(v28, "performBlockAndWait:", v47);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        if (-[HMDHH2Migrator waitForCDToExportModelsToCloudKit:](v9, "waitForCDToExportModelsToCloudKit:", v25))
        {
          if (-[HMDHH2Migrator waitForV5UpdatesToSyncToCloudKit](v9, "waitForV5UpdatesToSyncToCloudKit"))
          {
            if (-[HMDHH2Migrator handlePostMigration](v9, "handlePostMigration"))
            {
              v30 = 1;
LABEL_32:

              _Block_object_dispose(buf, 8);
              goto LABEL_22;
            }
            v37 = (void *)MEMORY[0x227676638]();
            v45 = v9;
            HMFGetOSLogHandle();
            v39 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v54 = 138543362;
              v55 = v46;
              _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to finish post migration task. Aborting...", v54, 0xCu);

            }
          }
          else
          {
            v37 = (void *)MEMORY[0x227676638]();
            v43 = v9;
            HMFGetOSLogHandle();
            v39 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v54 = 138543362;
              v55 = v44;
              _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to sync V5 updates to CloudKit. Aborting...", v54, 0xCu);

            }
          }
        }
        else
        {
          v37 = (void *)MEMORY[0x227676638]();
          v41 = v9;
          HMFGetOSLogHandle();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v54 = 138543362;
            v55 = v42;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to export CD models to CloudKit. Aborting...", v54, 0xCu);

          }
        }
      }
      else
      {
        v37 = (void *)MEMORY[0x227676638](v29);
        v38 = v9;
        HMFGetOSLogHandle();
        v39 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 138543362;
          v55 = v40;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to do migration to HH2. Aborting...", v54, 0xCu);

        }
      }

      objc_autoreleasePoolPop(v37);
      v30 = 0;
      goto LABEL_32;
    }
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v9;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v35;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Timed out while waiting for first import to finish", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v31);
LABEL_21:
  v30 = 0;
LABEL_22:

  return v30;
}

- (void)_fixupUserUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  HMDHH2Migrator *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  HMDHH2Migrator *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  id v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    v39 = v3;
    objc_msgSend(v3, "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_206723);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      v42 = *(_QWORD *)v46;
      v43 = v9;
      do
      {
        v13 = 0;
        v40 = v11;
        do
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
          v15 = HMDIsEmptyHome(v14);
          if (objc_msgSend(v14, "isOwnerUser"))
          {
            objc_msgSend(v14, "owner");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v8;
            v19 = objc_msgSend(v8, "containsObject:", v17);

            if (v19)
            {
              if (v15)
              {
                objc_msgSend(v14, "uuid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "pairingIdentity");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                +[HMDUser UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:](HMDUser, "UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:", 0, v20, 0, v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v18, "containsObject:", v22))
                {
                  objc_msgSend(v16, "userID");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "uuid");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HMDUser UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:](HMDUser, "UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:", v23, v24, 0, 0);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v18, "containsObject:", v25))
                  {
                    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();

                    v26 = CFSTR("random");
                  }
                  else
                  {
                    v22 = v25;
                    v26 = CFSTR("userID");
                  }
                }
                else
                {
                  v26 = CFSTR("pairingID");
                }
                v41 = v26;
                v12 = v42;
                v9 = v43;
                v11 = v40;
                v33 = (void *)MEMORY[0x227676638]();
                v34 = self;
                HMFGetOSLogHandle();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "uuid");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v50 = v36;
                  v51 = 2112;
                  v52 = v37;
                  v53 = 2112;
                  v54 = v41;
                  v55 = 2112;
                  v56 = v22;
                  _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Detected duplicate user UUID %@, forcing this user to use new \"%@\" UUID %@", buf, 0x2Au);

                  v12 = v42;
                  v9 = v43;
                }

                objc_autoreleasePoolPop(v33);
                objc_msgSend(v16, "setUUID:", v22);

              }
              else
              {
                v27 = (void *)MEMORY[0x227676638]();
                v28 = self;
                HMFGetOSLogHandle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "uuid");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "uuid");
                  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v50 = v30;
                  v51 = 2112;
                  v52 = v31;
                  v53 = 2112;
                  v54 = v32;
                  _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Detected duplicate user UUID %@, not changing UUID because of none empty home %@", buf, 0x20u);

                  v9 = v43;
                  v12 = v42;
                }

                objc_autoreleasePoolPop(v27);
              }
            }
            objc_msgSend(v16, "uuid");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v18;
            objc_msgSend(v18, "addObject:", v38);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v11);
    }

    v3 = v39;
  }

}

- (BOOL)migrateHomeData:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  BOOL v15;
  void *v16;
  HMDHH2Migrator *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDHH2Migrator *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHH2Migrator *v25;
  NSObject *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHH2Migrator setHomeData:](self, "setHomeData:", v8);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v11 = -[HMDHH2Migrator migrateHomeManager:managedObjectContext:hh2ControllerKey:](self, "migrateHomeManager:managedObjectContext:hh2ControllerKey:", v8, v9, v10);
  *((_BYTE *)v35 + 24) = v11;
  if (v11)
  {
    objc_msgSend(v8, "homes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") == 0;

    if (v13)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@There are no homes... Skipping home migration path...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      v15 = 1;
    }
    else
    {
      -[HMDHH2Migrator _fixupUserUUID:](self, "_fixupUserUUID:", v8);
      objc_msgSend(v8, "homes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __72__HMDHH2Migrator_migrateHomeData_managedObjectContext_hh2ControllerKey___block_invoke;
      v29[3] = &unk_24E791B98;
      v33 = &v34;
      v29[4] = self;
      v30 = v8;
      v31 = v9;
      v32 = v10;
      objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);

      v15 = *((_BYTE *)v35 + 24) != 0;
      if (!*((_BYTE *)v35 + 24))
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v39 = v19;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to migrate the homes to CD.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
      }

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to migrate the home manager to CD.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v15 = 0;
  }
  _Block_object_dispose(&v34, 8);

  return v15;
}

- (BOOL)migrateHomeManager:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHH2Migrator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDHH2Migrator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v31;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  objc_msgSend(v7, "primaryHomeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "homes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_firstObjectWithUUID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isOwnerUser") & 1) == 0)
    {
      v31 = v10;
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "isOwnerUser");
        HMFBooleanToString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v17;
        v35 = 2112;
        v36 = v11;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping migrating primary home setting %@, primaryHome.isOwnerUser = %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);

      v11 = 0;
      v10 = v31;
    }

  }
  v19 = (void *)objc_opt_class();
  objc_msgSend(v7, "cloudZones");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getAllBackingStoreObjects:primaryHomeUUID:cloudZone:appData:", 4, v11, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v23 = v10;
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v27;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Adding primary HMDHomeManagerHomeModel %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend((id)objc_opt_class(), "modelForHomeUUID:", v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObjectChangeType:", 1);
    objc_msgSend(v22, "addObject:", v28);

    v10 = v23;
  }
  objc_msgSend(v8, "setName:", CFSTR("HomeManager"));
  v29 = -[HMDHH2Migrator populateAndSaveCDModelsFrom:managedObjectContext:hh2ControllerKey:tag:](self, "populateAndSaveCDModelsFrom:managedObjectContext:hh2ControllerKey:tag:", v22, v8, v9, CFSTR("Home Manager"));

  objc_autoreleasePoolPop(v10);
  return v29;
}

- (BOOL)migrateHome:(id)a3 primaryHomeUUID:(id)a4 managedObjectContext:(id)a5 hh2ControllerKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  void *v26;
  HMDHH2Migrator *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "isOwnerUser");
  v15 = (void *)MEMORY[0x227676638]();
  if ((v14 & 1) == 0)
  {
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v24;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Not migrating home [%@] as it is not owned by the current user.", (uint8_t *)&v32, 0x16u);

    }
    goto LABEL_11;
  }
  v16 = (void *)MEMORY[0x227676638]();
  if (!-[HMDHH2Migrator migrateHomeToCoreData:primaryHomeUUID:managedObjectContext:hh2ControllerKey:](self, "migrateHomeToCoreData:primaryHomeUUID:managedObjectContext:hh2ControllerKey:", v10, v11, v12, v13))
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v29;
    v30 = "%{public}@Unable to migrate home data to Core Data.";
LABEL_20:
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0xCu);

    goto LABEL_21;
  }
  objc_autoreleasePoolPop(v16);
  v16 = (void *)MEMORY[0x227676638]();
  if (!-[HMDHH2Migrator migrateV5Models:forHome:](self, "migrateV5Models:forHome:", v12, v10))
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v29;
    v30 = "%{public}@Unable to migrate v5 models to Core Data.";
    goto LABEL_20;
  }
  objc_autoreleasePoolPop(v16);
  -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldSkipKeyRollOperations");

  v16 = (void *)MEMORY[0x227676638]();
  if ((v18 & 1) != 0)
  {
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@*=*=*=*= Not scheduling any kind of key roll operations as migrator was asked to skip them. *=*=*=*=", (uint8_t *)&v32, 0xCu);

    }
    goto LABEL_17;
  }
  if (!-[HMDHH2Migrator rollAccessoryKeysToHH2:hh2ControllerKey:](self, "rollAccessoryKeysToHH2:hh2ControllerKey:", v10, v13))
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v29;
      v30 = "%{public}@Unable to schedule key-roll operations";
      goto LABEL_20;
    }
LABEL_21:

    objc_autoreleasePoolPop(v26);
    objc_autoreleasePoolPop(v16);
    v25 = 0;
    goto LABEL_22;
  }
LABEL_17:
  objc_autoreleasePoolPop(v16);
LABEL_11:
  v25 = 1;
LABEL_22:
  objc_autoreleasePoolPop(v15);

  return v25;
}

- (BOOL)migrateHomeToCoreData:(id)a3 primaryHomeUUID:(id)a4 managedObjectContext:(id)a5 hh2ControllerKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDHH2Migrator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
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
  BOOL v37;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v17;
    v43 = 2112;
    v44 = v10;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting migration for home : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
    v40 = v13;
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v15;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = v11;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v24;
      v43 = 2112;
      v44 = v25;
      v45 = 2112;
      v46 = v26;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Adding HMDHomeManagerHomeModel for %@/%@", buf, 0x20u);

      v11 = v39;
    }

    objc_autoreleasePoolPop(v21);
    v27 = (void *)objc_opt_class();
    objc_msgSend(v10, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "modelForHomeUUID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setObjectChangeType:", 1);
    objc_msgSend(v18, "addObject:", v29);

    v13 = v40;
  }
  objc_msgSend(v10, "backingStoreObjects:hh2Migration:", 4, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v30);

  objc_msgSend(v10, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HMDWorkingContextNameForHomeUUID(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v32);

  v33 = (void *)MEMORY[0x227676638]();
  objc_msgSend((id)objc_opt_class(), "modelsByDroppingEmptyStringAccessCodesOnModels:", v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2Migrator _auditAccessCodesByRemovingIllegalDuplicatesFromModels:](v15, "_auditAccessCodesByRemovingIllegalDuplicatesFromModels:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v33);
  objc_msgSend(v10, "name");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[HMDHH2Migrator populateAndSaveCDModelsFrom:managedObjectContext:hh2ControllerKey:tag:](v15, "populateAndSaveCDModelsFrom:managedObjectContext:hh2ControllerKey:tag:", v35, v12, v13, v36);

  return v37;
}

- (id)_auditAccessCodesByRemovingIllegalDuplicatesFromModels:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke;
  v16[3] = &unk_24E791C28;
  v17 = v4;
  v5 = v4;
  objc_msgSend(v5, "na_map:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "auditedHomeAccessCodeModelsFromModels:userAccessCodeModelsAndInvites:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "auditedUserAccessCodeModelsAndInvitesFromModels:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "arrayByRemovingElementsInArray:fromArray:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "arrayByRemovingElementsInArray:fromArray:", v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "arrayByRemovingElementsInArray:fromArray:", v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2Migrator findAndRemoveAllModelsWithInvalidAccessCodes:](self, "findAndRemoveAllModelsWithInvalidAccessCodes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findAndRemoveAllModelsWithInvalidAccessCodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "na_map:", &__block_literal_global_58_206687);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_60_206688);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "na_map:", &__block_literal_global_62_206689);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", &__block_literal_global_64_206690);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_5;
  v12[3] = &unk_24E791D90;
  v13 = v7;
  v14 = v5;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v3, "na_map:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)populateAndSaveCDModelsFrom:(id)a3 managedObjectContext:(id)a4 hh2ControllerKey:(id)a5 tag:(id)a6
{
  id v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  HMDHH2Migrator *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
  void *v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  BOOL v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  HMDHH2Migrator *v32;
  NSObject *v33;
  void *v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  id v36;
  void *v37;
  HMDHH2Migrator *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _BYTE *v50;
  _QWORD v51[4];
  id v52;
  HMDHH2Migrator *v53;
  _BYTE *v54;
  uint8_t v55[4];
  void *v56;
  __int16 v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v43 = a5;
  v12 = (uint64_t (*)(uint64_t, uint64_t))a6;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v60 = v12;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Migrating [%@] models for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v60 = __Block_byref_object_copy__206586;
  v61 = __Block_byref_object_dispose__206587;
  v62 = 0;
  v18 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke;
  v51[3] = &unk_24E791EA8;
  v19 = v11;
  v53 = v14;
  v54 = buf;
  v52 = v19;
  v20 = objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v51);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v21 = (void *)MEMORY[0x227676638](v20);
    v22 = v14;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v55 = 138543618;
      v56 = v24;
      v57 = 2112;
      v58 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to create managed object : %@", v55, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v22, "submitABCEventForFailedMigrationWithReason:withError:", 8, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v26 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v18;
    v47[1] = 3221225472;
    v47[2] = __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_81;
    v47[3] = &unk_24E791ED0;
    v47[4] = v14;
    v50 = buf;
    v28 = v19;
    v48 = v28;
    v29 = v27;
    v49 = v29;
    v30 = objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v47);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v31 = (void *)MEMORY[0x227676638](v30);
      v32 = v14;
      HMFGetOSLogHandle();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v55 = 138543618;
        v56 = v34;
        v57 = 2112;
        v58 = v35;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to update managed object : %@", v55, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v32, "submitABCEventForFailedMigrationWithReason:withError:", 8, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v26 = 0;
    }
    else
    {
      v44[0] = v18;
      v44[1] = 3221225472;
      v44[2] = __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_84;
      v44[3] = &unk_24E791EF8;
      v44[4] = v14;
      v36 = v28;
      v45 = v36;
      v46 = v43;
      v37 = (void *)MEMORY[0x227676638](objc_msgSend(v29, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44));
      v38 = v14;
      HMFGetOSLogHandle();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138543618;
        v56 = v40;
        v57 = 2112;
        v58 = v12;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Going to save all CD models for the [%@] to the working store", v55, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to save during migrating %@"), v12);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDHH2Migrator _saveAndResetWithContext:errorMessage:](v38, "_saveAndResetWithContext:errorMessage:", v36, v41);

    }
  }

  _Block_object_dispose(buf, 8);
  return v26;
}

- (BOOL)_saveAndResetWithContext:(id)a3 errorMessage:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  HMDHH2Migrator *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  v8 = objc_msgSend(v6, "hmd_saveWithTransactionAuthor:error:", 7, &v15);
  v9 = v15;
  if ((v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@%@, Save Error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v11, "submitABCEventForFailedMigrationWithReason:withError:", 1, v9);
  }
  objc_msgSend(v6, "reset");

  return v8;
}

- (void)fixupModelForMigration:(id)a3 backingStoreModelObject:(id)a4 hh2ControllerKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void **p_vtable;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  HMDHH2Migrator *v24;
  NSObject *v25;
  void *v26;
  HMDHH2Migrator *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDHH2Migrator *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  void *v71;
  HMDHH2Migrator *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  int v88;
  id v89;
  void *v90;
  void *v91;
  int v92;
  void *context;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  id v106;
  __int16 v107;
  void *v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "managedObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHome entity](_MKFHome, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isKindOfEntity:", v13);

  p_vtable = _MKFDurationEvent.vtable;
  if (v14)
  {
    -[HMDHH2Migrator _updatePairingIdentityForHome:withHH2ControllerKey:context:](self, "_updatePairingIdentityForHome:withHH2ControllerKey:context:", v11, v10, v8);
    -[HMDHH2Migrator _fixUpHomeWithoutOwner:withHH2ControllerKey:context:](self, "_fixUpHomeWithoutOwner:withHH2ControllerKey:context:", v11, v10, v8);
    -[HMDHH2Migrator _fixupHomeInvalidName:context:](self, "_fixupHomeInvalidName:context:", v11, v8);
    v16 = v11;
    v17 = v8;
    if (self)
    {
      v100 = v10;
      v97 = v16;
      v18 = v17;
      v102 = 0;
      +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v18, &v102);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v102;
      v98 = v17;
      v99 = v16;
      if (v19)
      {
        objc_msgSend(v19, "appDataDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = +[HMDHome didHomeAppOnboardHindsightWithAppData:](HMDHome, "didHomeAppOnboardHindsightWithAppData:", v21);
        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v95 = v9;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v104 = v29;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Home manager doesn't have app data", buf, 0xCu);

            v9 = v95;
          }

          objc_autoreleasePoolPop(context);
          v22 = 0;
          p_vtable = _MKFDurationEvent.vtable;
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
          v94 = v9;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v104 = v26;
          v105 = 2114;
          v106 = v20;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find home manager: %{public}@", buf, 0x16u);

          v9 = v94;
        }

        objc_autoreleasePoolPop(v23);
        v22 = 0;
        p_vtable = (void **)(_MKFDurationEvent + 24);
      }

      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
      if (v22)
      {
        v34 = v97;
        if (v33)
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v104 = v35;
          v105 = 2112;
          v106 = v97;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Home %@ has previously onboarded hindsight", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(v97, "setDidOnboardEventLog:", MEMORY[0x24BDBD1C8]);
      }
      else
      {
        v34 = v97;
        if (v33)
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v104 = v36;
          v105 = 2112;
          v106 = v97;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Home %@ has not completed hindsight onboarding", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
      }

      v16 = v99;
      v10 = v100;
      v17 = v98;
    }

  }
  objc_msgSend(v11, "entity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUser entity](_MKFUser, "entity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "isKindOfEntity:", v38);

  if (v39)
  {
    v40 = v11;
    objc_msgSend(v40, "privilege");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "intValue");

    if (v42 == 3)
    {
      -[HMDHH2Migrator _fixupUserPairingIdentity:withHH2ControllerKey:context:](self, "_fixupUserPairingIdentity:withHH2ControllerKey:context:", v40, v10, v8);
      -[HMDHH2Migrator fixupAssistantAccessControlForUserModel:](self, "fixupAssistantAccessControlForUserModel:", v40);
      -[HMDHH2Migrator _fixupUserAuthorizationDataForUserModel:](self, "_fixupUserAuthorizationDataForUserModel:", v40);
    }

  }
  objc_msgSend(v11, "entity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_vtable + 32, "entity");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v43, "isKindOfEntity:", v44);

  if (v45)
    -[HMDHH2Migrator _fixupHomeManagerPairingIdentity:withHH2ControllerKey:context:](self, "_fixupHomeManagerPairingIdentity:withHH2ControllerKey:context:", v11, v10, v8);
  objc_msgSend(v11, "entity");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFAppleMediaAccessory entity](_MKFAppleMediaAccessory, "entity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v46, "isKindOfEntity:", v47);

  if (v48)
  {
    -[HMDHH2Migrator _fixupAppleMediaAccessory:context:](self, "_fixupAppleMediaAccessory:context:", v11, v8);
    -[HMDHH2Migrator _createResidentModelsDuringMigrationForAppleMediaAccessory:context:](self, "_createResidentModelsDuringMigrationForAppleMediaAccessory:context:", v11, v8);
  }
  objc_msgSend(v11, "entity");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFAccessory entity](_MKFAccessory, "entity");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v49, "isKindOfEntity:", v50);

  if (v51)
  {
    -[HMDHH2Migrator _fixupAccessoryWithNoRoom:coreDataModelObject:](self, "_fixupAccessoryWithNoRoom:coreDataModelObject:", v8, v11);
    -[HMDHH2Migrator _fixupAccessoryWithNoInitialValues:](self, "_fixupAccessoryWithNoInitialValues:", v11);
  }
  objc_msgSend(v11, "entity");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFSoftwareUpdate entity](_MKFSoftwareUpdate, "entity");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v52, "isKindOfEntity:", v53);

  if (v54)
    -[HMDHH2Migrator _fixupSoftwareUpdateModelWithNoAccessory:coreDataModelObject:](self, "_fixupSoftwareUpdateModelWithNoAccessory:coreDataModelObject:", v8, v11);
  objc_msgSend(v11, "entity");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFGuestAccessCode entity](_MKFGuestAccessCode, "entity");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v55, "isKindOfEntity:", v56);

  if (v57)
  {
    v58 = (void *)MEMORY[0x24BDD1880];
    v59 = v11;
    objc_msgSend(v58, "UUID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setHh2ModelID:", v60);

    -[HMDHH2Migrator _fixupGuestAccessCodeWithInvalidLabel:context:](self, "_fixupGuestAccessCodeWithInvalidLabel:context:", v59, v8);
  }
  objc_msgSend(v11, "entity");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFRemovedUserAccessCode entity](_MKFRemovedUserAccessCode, "entity");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v61, "isKindOfEntity:", v62);

  if (v63)
  {
    v64 = (void *)MEMORY[0x24BDD1880];
    v65 = v11;
    objc_msgSend(v64, "UUID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setHh2ModelID:", v66);

  }
  objc_msgSend(v11, "entity");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFApplicationData entity](_MKFApplicationData, "entity");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v67, "isKindOfEntity:", v68);

  if (v69)
  {
    v70 = v11;
    if ((objc_msgSend(v70, "hasValidContainer") & 1) == 0)
    {
      v71 = (void *)MEMORY[0x227676638]();
      v72 = self;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v96 = v9;
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "debugDescription");
        v101 = v10;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "appDataDictionary");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v104 = v74;
        v105 = 2112;
        v106 = v75;
        v107 = 2112;
        v108 = v76;
        _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_INFO, "%{public}@FixUp : Deleting app data [%@] as it is not associated with any container : %@", buf, 0x20u);

        v10 = v101;
        v9 = v96;
      }

      objc_autoreleasePoolPop(v71);
      objc_msgSend(v8, "deleteObject:", v70);
    }

  }
  objc_msgSend(v11, "entity");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v77, "isKindOfEntity:", v78);

  if (v79)
    -[HMDHH2Migrator _fixupUserAccessCodeWithInvalidValue:context:](self, "_fixupUserAccessCodeWithInvalidValue:context:", v11, v8);
  objc_msgSend(v11, "entity");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFService entity](_MKFService, "entity");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v80, "isKindOfEntity:", v81);

  if (v82)
    -[HMDHH2Migrator _fixupInvalidCharacteristicFormat:context:](self, "_fixupInvalidCharacteristicFormat:context:", v11, v8);
  objc_msgSend(v11, "entity");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFTrigger entity](_MKFTrigger, "entity");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v83, "isKindOfEntity:", v84);

  if (v85)
    -[HMDHH2Migrator _fixupTriggerInvalidName:context:](self, "_fixupTriggerInvalidName:context:", v11, v8);
  objc_msgSend(v11, "entity");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFActionSet entity](_MKFActionSet, "entity");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v86, "isKindOfEntity:", v87);

  if (v88)
  {
    v89 = v11;
    -[HMDHH2Migrator _fixupActionSetInvalidName:context:](self, "_fixupActionSetInvalidName:context:", v89, v8);
    -[HMDHH2Migrator _fixupActionSetUnlocalizedName:](self, "_fixupActionSetUnlocalizedName:", v89);
    -[HMDHH2Migrator _fixupCharacteristicWriteActionWithInvalidService:context:](self, "_fixupCharacteristicWriteActionWithInvalidService:context:", v89, v8);

  }
  objc_msgSend(v11, "entity");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFEventTrigger entity](_MKFEventTrigger, "entity");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v90, "isKindOfEntity:", v91);

  if (v92)
    -[HMDHH2Migrator _fixupCharacteristicEventTriggerInvalidService:context:](self, "_fixupCharacteristicEventTriggerInvalidService:context:", v11, v8);

}

- (void)_fixUpHomeWithoutOwner:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMDHH2Migrator *v14;
  NSObject *v15;
  void *v16;
  _MKFUser *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_msgSend(v11, "owner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Looks like this home does not have owner. Going to create one", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = -[_MKFUser initWithContext:]([_MKFUser alloc], "initWithContext:", v10);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFUser setModelID:](v17, "setModelID:", v18);

    -[_MKFUser setPairingIdentity:](v17, "setPairingIdentity:", v9);
    -[_MKFUser setPrivilege:](v17, "setPrivilege:", &unk_24E96CC38);
    objc_msgSend(v11, "setOwner:", v17);
    -[_MKFUser setHome:](v17, "setHome:", v11);
    -[_MKFUser setOwnedHome:](v17, "setOwnedHome:", v11);

  }
}

- (void)_fixupHomeInvalidName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "name");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || !-[__CFString length](v9, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("HOME_FALLBACK_NAME"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%ld"), &v28, _fixupHomeInvalidName_context__fixedUpHomeNameCounter);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;

    v15 = v13;
    if (!v13)
    {
      v27 = v7;
      v16 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v18;
        v31 = 2112;
        v32 = CFSTR("HOME_FALLBACK_NAME");
        v33 = 2112;
        v34 = CFSTR("%ld");
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        v16 = v26;
      }

      objc_autoreleasePoolPop(v16);
      v15 = CFSTR("HOME_FALLBACK_NAME");
      v7 = v27;
    }
    v19 = v15;

    v20 = objc_msgSend(v8, "setName:", v19);
    ++_fixupHomeInvalidName_context__fixedUpHomeNameCounter;
    v21 = (void *)MEMORY[0x227676638](v20);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@FixUp: found home with invalid name, updating name from: %@ to: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);

  }
}

- (void)_updatePairingIdentityForHome:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHH2Migrator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_msgSend(v9, "publicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOwnerPublicKey:", v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ownerPublicKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updated the home owner's public key to %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v14);

}

- (void)_fixupUserPairingIdentity:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "privilege");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  if (v12 == 3)
  {
    -[HMDHH2Migrator homeData](self, "homeData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HMDHH2Migrator homeData](self, "homeData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccountIdentifier:", v17);

      -[HMDHH2Migrator homeData](self, "homeData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "primaryAccountHandle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v8, "setAccountHandle:", v19);
      }
      else
      {
        objc_msgSend(v14, "primaryHandle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccountHandle:", v20);

      }
    }
    v21 = (void *)MEMORY[0x227676638](objc_msgSend(v8, "setPairingIdentity:", v9));
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pairingIdentity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updating owner's pairing identity : %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v21);

  }
}

- (void)_fixupHomeManagerPairingIdentity:(id)a3 withHH2ControllerKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDHH2Migrator *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "controllerKeyIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@FixUp: Current controller key identifier for the home manager is %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v9, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setControllerKeyIdentifier:", v17);

  v18 = (void *)MEMORY[0x227676638]();
  v19 = v13;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "controllerKeyIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v21;
    v25 = 2112;
    v26 = v22;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updating the controller key identifier for the Home Manager to %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v18);

}

- (void)_fixupGuestAccessCodeWithInvalidLabel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDHH2Migrator *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "label");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v8, "label"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "length"),
        v11,
        v10,
        !v12))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@FixUp: Found MKFGuestAccessCode with empty label. Going to remove this entity: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v7, "deleteObject:", v8);
  }

}

- (void)_fixupUserAccessCodeWithInvalidValue:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMDHH2Migrator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "accessCode");
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
      objc_msgSend(v8, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUp: Found MKFUserAccessCode without accessCode. Going to remove this entity: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v7, "deleteObject:", v8);
  }

}

- (void)_fixupInvalidCharacteristicFormat:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  objc_msgSend(a3, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HMDHH2Migrator__fixupInvalidCharacteristicFormat_context___block_invoke;
  v9[3] = &unk_24E791F20;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

}

- (void)_fixupUserAuthorizationDataForUserModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDHH2Migrator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isOwner"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator homeData](self, "homeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke;
    v16[3] = &unk_24E7968F0;
    v8 = v5;
    v17 = v8;
    objc_msgSend(v7, "na_each:", v16);

    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "setOwnerCharacteristicAuthorizationData:", v9);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ownerCharacteristicAuthorizationData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUp: Updating %@ user's characteristics authorization data to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);

  }
}

- (void)_fixupTriggerInvalidName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "name");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || !-[__CFString length](v9, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("TRIGGER_FALLBACK_NAME"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%ld"), &v28, _fixupTriggerInvalidName_context__fixedUpTriggerNameCounter);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;

    v15 = v13;
    if (!v13)
    {
      v27 = v7;
      v16 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v18;
        v31 = 2112;
        v32 = CFSTR("TRIGGER_FALLBACK_NAME");
        v33 = 2112;
        v34 = CFSTR("%ld");
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        v16 = v26;
      }

      objc_autoreleasePoolPop(v16);
      v15 = CFSTR("TRIGGER_FALLBACK_NAME");
      v7 = v27;
    }
    v19 = v15;

    v20 = objc_msgSend(v8, "setName:", v19);
    ++_fixupTriggerInvalidName_context__fixedUpTriggerNameCounter;
    v21 = (void *)MEMORY[0x227676638](v20);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@FixUp: found trigger with invalid name, updating name from: %@ to: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);

  }
}

- (void)_fixupActionSetInvalidName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  HMDHH2Migrator *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !-[__CFString length](v8, "length"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(CFSTR("ACTION_SET_FALLBACK_NAME"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%ld"), &v27, _fixupActionSetInvalidName_context__fixedUpActionSetNameCounter);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    v14 = v12;
    if (!v12)
    {
      v26 = v7;
      v15 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v17;
        v30 = 2112;
        v31 = CFSTR("ACTION_SET_FALLBACK_NAME");
        v32 = 2112;
        v33 = CFSTR("%ld");
        v34 = 2112;
        v35 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        v15 = v25;
      }

      objc_autoreleasePoolPop(v15);
      v14 = CFSTR("ACTION_SET_FALLBACK_NAME");
      v7 = v26;
    }
    v18 = v14;

    v19 = objc_msgSend(v6, "setName:", v18);
    ++_fixupActionSetInvalidName_context__fixedUpActionSetNameCounter;
    v20 = (void *)MEMORY[0x227676638](v19);
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v23;
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@FixUp: found action set with invalid name, updating name from: %@ to: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);

  }
}

- (void)_fixupActionSetUnlocalizedName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHH2Migrator *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHome getBuiltinActionSets](HMDHome, "getBuiltinActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_stringForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v5))
  {
    HMDLocalizedStringForKey(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "setName:", v9));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUp: found action set with unlocalized name, updating name from: %@ to: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v10);

  }
}

- (void)_fixupCharacteristicWriteActionWithInvalidService:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDHH2Migrator *v18;
  NSObject *v19;
  void *v20;
  id v21;
  HMDHH2Migrator *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = v6;
  objc_msgSend(v6, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v25 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
        {
          objc_msgSend(v15, "service");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = (void *)MEMORY[0x227676638]();
            v18 = self;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = v8;
              v21 = v7;
              v22 = self;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v23;
              v32 = 2112;
              v33 = v15;
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUp: deleting characteristicWriteAction: %@ as it has no associated service", buf, 0x16u);

              self = v22;
              v7 = v21;
              v8 = v20;
              v11 = v25;
            }

            objc_autoreleasePoolPop(v17);
            objc_msgSend(v7, "deleteObject:", v15);
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v10);
  }

}

- (void)_fixupCharacteristicEventTriggerInvalidService:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDHH2Migrator *v18;
  NSObject *v19;
  id v20;
  id v21;
  HMDHH2Migrator *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = v6;
  objc_msgSend(v6, "events");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v25 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
        {
          objc_msgSend(v15, "service");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = (void *)MEMORY[0x227676638]();
            v18 = self;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = v8;
              v21 = v7;
              v22 = self;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v23;
              v32 = 2112;
              v33 = v15;
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUp: deleting characteristicEvent: %@ as it has no associated service", buf, 0x16u);

              self = v22;
              v7 = v21;
              v8 = v20;
              v11 = v25;
            }

            objc_autoreleasePoolPop(v17);
            objc_msgSend(v7, "deleteObject:", v15);
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v10);
  }

}

- (void)_fixupAppleMediaAccessory:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMDHH2Migrator *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDHH2Migrator *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDHH2Migrator homeData](self, "homeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeWithUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryWithUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v16, "deviceForDirectMessaging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "idsIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "modelID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543618;
          v31 = v22;
          v32 = 2112;
          v33 = v23;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Adding ids identifier to %@ in fixup", (uint8_t *)&v30, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(v17, "idsIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIdsIdentifier:", v24);

      }
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
      objc_msgSend(v8, "debugDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v28;
      v32 = 2112;
      v33 = v29;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@FixUp: AppleMediaAccessory without a home: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)_createResidentModelsDuringMigrationForAppleMediaAccessory:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
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
  id v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v18 = MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v21;
      v42 = 2112;
      v43 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@FixUp: Accessory without a home: %@", buf, 0x16u);

    }
    v17 = (void *)v18;
    goto LABEL_9;
  }
  objc_msgSend(v8, "resident");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v15;
      v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@FixUp: Accessory already has a resident: %@", buf, 0x16u);

    }
    v17 = v11;
LABEL_9:
    objc_autoreleasePoolPop(v17);
    goto LABEL_13;
  }
  v38 = v7;
  if (v14)
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v23;
    v42 = 2112;
    v43 = v24;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@FixUp: Creating resident for media accessory %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  buf[0] = 0;
  objc_msgSend(v8, "modelID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v9, "modelID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hm_deriveUUIDFromBaseUUID:withSalts:", v29, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "materializeOrCreateResidentsRelationWithModelID:createdNew:", v30, buf);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAppleMediaAccessory:", v8);
  -[HMDHH2Migrator homeData](v12, "homeData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "homeWithUUID:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "accessoryWithUUID:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setName:", v37);

  v7 = v38;
LABEL_13:

}

- (void)_fixupAccessoryWithNoRoom:(id)a3 coreDataModelObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDHH2Migrator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHH2Migrator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHH2Migrator *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v12;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@FixUP: Looks like [%@] does not have room associated with it. Going to put this accessory to default room", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v7, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultRoom");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultRoom");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRoom:", v16);

      v17 = (void *)MEMORY[0x227676638]();
      v18 = v10;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "home");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "defaultRoom");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v20;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v22;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUP: added accessory: [%@] to default room : [%@]", (uint8_t *)&v24, 0x20u);

LABEL_9:
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v23 = v10;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "home");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@This is not good. Looks like we do not have default room in the home : %@", (uint8_t *)&v24, 0x16u);
        goto LABEL_9;
      }
    }

    objc_autoreleasePoolPop(v17);
  }

}

- (void)_fixupAccessoryWithNoInitialValues:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  HMDHH2Migrator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHH2Migrator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDHH2Migrator *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHH2Migrator *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "initialManufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_3:
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_3;
  objc_msgSend(v4, "manufacturer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialManufacturer:", v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manufacturer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initialManufacturer to [%@]", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v6 = 1;
LABEL_8:
  objc_msgSend(v4, "initialModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else
  {
    objc_msgSend(v4, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setInitialModel:", v16);

      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "model");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v20;
        v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initialModel to [%@]", (uint8_t *)&v35, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v6 = 1;
    }
  }
  objc_msgSend(v4, "initialCategoryIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "unsignedIntValue"))
  {

    goto LABEL_16;
  }
  objc_msgSend(v4, "accessoryCategory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_16:
    if (!v6)
      goto LABEL_25;
    goto LABEL_22;
  }
  objc_msgSend(v4, "accessoryCategory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialCategoryIdentifier:", v24);

  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryCategory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v28;
    v37 = 2112;
    v38 = v29;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initialCategoryIdentifier to [%@]", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
LABEL_22:
  v30 = (void *)MEMORY[0x227676638]();
  v31 = self;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v33;
    v37 = 2112;
    v38 = v34;
    _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@FixUP: updated initial values on : %@", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v30);
LABEL_25:

}

- (void)_fixupSoftwareUpdateModelWithNoAccessory:(id)a3 coreDataModelObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHH2Migrator *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDHH2Migrator *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    HMDCastIfManagedObjectBSORepresentable(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmd_parentModelID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543874;
        v32 = v14;
        v33 = 2112;
        v34 = v9;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@FixUP: Looks like [%@] does not have accessory associated with it. Going to find the accessory with model id: %@", (uint8_t *)&v31, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v9, "hmd_parentModelID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFModel modelWithModelID:context:](_MKFAccessory, "modelWithModelID:context:", v16, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "setAccessory:", v17));
        v19 = v11;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "debugDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "debugDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543874;
          v32 = v21;
          v33 = 2112;
          v34 = v22;
          v35 = 2112;
          v36 = v23;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@FixUP: Setting accessory [%@] on software update model [%@]", (uint8_t *)&v31, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
      }
      else
      {
        v26 = (void *)MEMORY[0x227676638]();
        v27 = v11;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "hmd_parentModelID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v29;
          v33 = 2112;
          v34 = v30;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the _MKFAccessory with modelID : %@ for software update model.", (uint8_t *)&v31, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        objc_msgSend(v6, "deleteObject:", v7);
      }

    }
    else
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "debugDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v24;
        v33 = 2112;
        v34 = v25;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Deleting the software update model %@ as it does not have accessory associated with it.", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v6, "deleteObject:", v7);
    }

  }
}

- (void)fixupAssistantAccessControlForUserModel:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDHH2Migrator *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDHH2Migrator *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  HMDHH2Migrator *v31;
  __int128 *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2Migrator homeData](self, "homeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeWithUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "assistantAccessControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "areActivityNotificationsEnabledForPersonalRequests"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivityNotificationsEnabledForPersonalRequests:", v14);

    *(_QWORD *)&v39 = 0;
    *((_QWORD *)&v39 + 1) = &v39;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__206586;
    v42 = __Block_byref_object_dispose__206587;
    v15 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v13, "accessories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithCapacity:", objc_msgSend(v16, "count"));
    v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "accessories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __58__HMDHH2Migrator_fixupAssistantAccessControlForUserModel___block_invoke;
    v29[3] = &unk_24E791FC0;
    v30 = v5;
    v31 = self;
    v32 = &v39;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);

    v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 40), "copy");
    objc_msgSend(v4, "setAccessoriesWithPersonalRequestsEnabled_:", v18);

    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activityNotificationsEnabledForPersonalRequests");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@FixUp: Migrated owner's assistant access control activityNotificationsEnabled=%@, accessories=%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v39) = 138543362;
      *(_QWORD *)((char *)&v39 + 4) = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@No assistant access control to migrate", (uint8_t *)&v39, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (BOOL)waitForCDToExportModelsToCloudKit:(id)a3
{
  id v4;
  void *v5;
  HMDHH2Migrator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHH2Migrator *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  void *v17;
  HMDHH2Migrator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  HMDHH2Migrator *v26;
  NSObject *v27;
  void *v28;
  _QWORD v30[5];
  id v31;
  id v32;
  _BYTE *v33;
  uint8_t v34[4];
  void *v35;
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting to wait for CD to export models to CK : history token before migration began : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDHH2Migrator waitForCloudTransformToRun](v6, "waitForCloudTransformToRun"))
  {
    -[HMDHH2Migrator migratorRecord](v6, "migratorRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "migrateFromTestDirectory"))
    {

LABEL_10:
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Not going to wait for all CloudKit models to be exported to CloudKit servers.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v14 = 1;
      goto LABEL_18;
    }
    -[HMDHH2Migrator migratorRecord](v6, "migratorRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "dryRun");

    if (v16)
      goto LABEL_10;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v37 = 0;
    -[HMDHH2Migrator coreData](v6, "coreData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "newManagedObjectContext");

    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __52__HMDHH2Migrator_waitForCDToExportModelsToCloudKit___block_invoke;
    v30[3] = &unk_24E79B5F8;
    v33 = buf;
    v30[4] = v6;
    v23 = v22;
    v31 = v23;
    v32 = v4;
    v24 = objc_msgSend(v23, "performBlockAndWait:", v30);
    v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v25 = (void *)MEMORY[0x227676638](v24);
      v26 = v6;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v34 = 138543362;
        v35 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to verify whether CD models made it to CloudKit", v34, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cloud transform failed after migration.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }
LABEL_18:

  return v14;
}

- (BOOL)waitForCloudTransformToRun
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  intptr_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HMDHH2Migrator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  HMDHH2Migrator *v24;
  void *v25;
  uint64_t v26;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  __int128 *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2Migrator cloudTransform](self, "cloudTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_QWORD *)&v38 = 0;
    *((_QWORD *)&v38 + 1) = &v38;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__206586;
    v41 = __Block_byref_object_dispose__206587;
    v42 = 0;
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    dispatch_get_global_queue(2, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __44__HMDHH2Migrator_waitForCloudTransformToRun__block_invoke;
    v30[3] = &unk_24E79B5F8;
    v30[4] = self;
    v31 = v3;
    v33 = &v38;
    v6 = v4;
    v32 = v6;
    dispatch_async(v5, v30);

    v7 = dispatch_time(0, 420000000000);
    v8 = dispatch_group_wait(v6, v7);
    if (v8)
    {
      v14 = (void *)MEMORY[0x227676638](v8, v9, v10, v11, v12, v13);
      v15 = self;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cloud transform did not run and the operation timed out.", buf, 0xCu);

      }
    }
    else
    {
      v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 40) == 0;
      v14 = (void *)MEMORY[0x227676638](0, v9, v10, v11, v12, v13);
      v24 = self;
      if (v23)
      {
        HMFGetOSLogHandle();
        v28 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v35 = v29;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Successfully finished running cloud transform", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        v22 = 1;
        goto LABEL_12;
      }
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 40);
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@runTransformForCoreData after migration failed with error : %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v14);
    v22 = 0;
LABEL_12:

    _Block_object_dispose(&v38, 8);
    goto LABEL_13;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 138543362;
    *(_QWORD *)((char *)&v38 + 4) = v21;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cloud transform is unavailable.", (uint8_t *)&v38, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)didCoreDataPushAllModelsToCloudKit:(id)a3 previousToken:(id)a4 cloudStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDHH2CoreDataCloudKitMirroringObserver *v20;
  void *v21;
  void *v22;
  HMDHH2CoreDataCloudKitMirroringObserver *v23;
  NSObject *v24;
  dispatch_time_t v25;
  HMDHH2Migrator *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDHH2Migrator *v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  void *v34;
  HMDHH2Migrator *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDHH2Migrator *v39;
  NSObject *v40;
  void *v41;
  BOOL v42;
  HMDHH2Migrator *v43;
  NSObject *v44;
  HMDHH2Migrator *v45;
  void *v46;
  uint64_t v47;
  NSObject *v49;
  HMDHH2Migrator *v50;
  void *v51;
  void *context;
  void *contexta;
  HMDHH2CoreDataCloudKitMirroringObserver *v54;
  dispatch_group_t group;
  void *v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  _QWORD v58[4];
  HMDHH2CoreDataCloudKitMirroringObserver *v59;
  dispatch_group_t v60;
  _BYTE *v61;
  id v62;
  uint8_t v63[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to execute history change request using token : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAffectedStores:", v16);

  v62 = 0;
  objc_msgSend(v8, "executeRequest:error:", v15, &v62);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (uint64_t (*)(uint64_t, uint64_t))v62;
  if (v17)
  {
    objc_msgSend(v17, "result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "count"))
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = v12;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@There are no transactions from the history fetch results", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      v33 = 1;
      goto LABEL_26;
    }
    objc_msgSend(v10, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator allObjectIDsFromTransactions:cloudStoreIdentifier:](v12, "allObjectIDsFromTransactions:cloudStoreIdentifier:", v18, v19);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v56, "count"))
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v12;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v41;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@There were no objects inserted as part of the migration.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      v33 = 1;
      goto LABEL_25;
    }
    v20 = [HMDHH2CoreDataCloudKitMirroringObserver alloc];
    -[HMDHH2Migrator coreData](v12, "coreData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDHH2CoreDataCloudKitMirroringObserver initWithObjectIds:coreData:storeIdentifier:](v20, "initWithObjectIds:coreData:storeIdentifier:", v56, v21, v22);

    v24 = dispatch_group_create();
    dispatch_group_enter(v24);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v68 = __Block_byref_object_copy__206586;
    v69 = __Block_byref_object_dispose__206587;
    v70 = 0;
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __78__HMDHH2Migrator_didCoreDataPushAllModelsToCloudKit_previousToken_cloudStore___block_invoke;
    v58[3] = &unk_24E795E08;
    v61 = buf;
    v59 = v23;
    v54 = v59;
    group = v24;
    v60 = group;
    -[HMDHH2CoreDataCloudKitMirroringObserver startMonitoring:](v59, "startMonitoring:", v58);
    v25 = dispatch_time(0, 900000000000);
    if (dispatch_group_wait(group, v25))
    {
      context = (void *)MEMORY[0x227676638]();
      v26 = v12;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v63 = 138543362;
        v64 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not push the models to CloudKit. Timed out.", v63, 0xCu);

      }
      objc_autoreleasePoolPop(context);
      -[HMDHH2CoreDataCloudKitMirroringObserver stopMonitoring](v54, "stopMonitoring");
    }
    else
    {
      v42 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
      contexta = (void *)MEMORY[0x227676638]();
      v43 = v12;
      if (v42)
      {
        HMFGetOSLogHandle();
        v49 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = v43;
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v63 = 138543362;
          v64 = v51;
          _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Successfully exported CD models to CloudKit", v63, 0xCu);

          v43 = v50;
        }

        objc_autoreleasePoolPop(contexta);
        v33 = 1;
        goto LABEL_24;
      }
      HMFGetOSLogHandle();
      v44 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = v43;
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v63 = 138543618;
        v64 = v46;
        v65 = 2112;
        v66 = v47;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to verify CD models pushed to CloudKit using export stream : %@", v63, 0x16u);

        v43 = v45;
      }

      objc_autoreleasePoolPop(contexta);
    }
    -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v12, "submitABCEventForFailedMigrationWithReason:withError:", 4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v33 = 0;
LABEL_24:

    _Block_object_dispose(buf, 8);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v29 = (void *)MEMORY[0x227676638]();
  v30 = v12;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v68 = v57;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch history for cloud store with token %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v29);
  v33 = 0;
LABEL_27:

  return v33;
}

- (id)allObjectIDsFromTransactions:(id)a3 cloudStoreIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HMDHH2Migrator *v16;
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  v8 = a3;
  objc_msgSend(v7, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke;
  v14[3] = &unk_24E792010;
  v15 = v6;
  v16 = self;
  v17 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  v12 = (void *)objc_msgSend(v10, "copy");
  return v12;
}

- (BOOL)waitForStartupForCloudZone:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  dispatch_time_t v11;
  intptr_t v12;
  void *v13;
  HMDHH2Migrator *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_create(0);
  objc_msgSend(v4, "startUp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45__HMDHH2Migrator_waitForStartupForCloudZone___block_invoke;
  v18[3] = &unk_24E798798;
  v18[4] = self;
  v8 = v5;
  v19 = v8;
  v9 = v6;
  v20 = v9;
  v10 = (id)objc_msgSend(v7, "addCompletionBlock:", v18);

  v11 = dispatch_time(0, 60000000000);
  v12 = dispatch_semaphore_wait(v9, v11);
  if (v12)
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
      v22 = v16;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for cloud zone startup for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

  return v12 == 0;
}

- (BOOL)waitForCloudKitSyncForProcessingResult:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  dispatch_time_t v11;
  void *v12;
  HMDHH2Migrator *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v7 = dispatch_semaphore_create(0);
  objc_msgSend(v6, "mirrorOutputResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__HMDHH2Migrator_waitForCloudKitSyncForProcessingResult_error___block_invoke;
  v20[3] = &unk_24E792038;
  v22 = &v24;
  v23 = a4;
  v9 = v7;
  v21 = v9;
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v20);

  v11 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for CloudKit sync for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *a4;
      *a4 = v16;

    }
  }
  v18 = *((_BYTE *)v25 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (BOOL)waitForV5UpdatesToSyncToCloudKit
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  HMDHH2Migrator *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  dispatch_time_t v17;
  void *v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v25[5];
  NSObject *v26;
  __int128 *p_buf;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  void *v33;
  uint8_t v34[128];
  __int128 buf;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "migrateFromTestDirectory"))
  {

LABEL_4:
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Not going to wait for V5 updates to sync to CloudKit during Dry Run.", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    return 1;
  }
  -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dryRun");

  if (v4)
    goto LABEL_4;
  v9 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDHH2Migrator v5ModelUpdateFutures](self, "v5ModelUpdateFutures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        dispatch_group_enter(v9);
        v25[0] = v13;
        v25[1] = 3221225472;
        v25[2] = __50__HMDHH2Migrator_waitForV5UpdatesToSyncToCloudKit__block_invoke;
        v25[3] = &unk_24E792060;
        p_buf = &buf;
        v25[4] = self;
        v26 = v9;
        v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v25);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v11);
  }

  v17 = dispatch_time(0, 900000000000);
  if (dispatch_group_wait(v9, v17))
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138543362;
      v33 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for V5 CloudKit sync", v32, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v19, "submitABCEventForFailedMigrationWithReason:withError:", 5, v22);

  }
  _Block_object_dispose(&buf, 8);

  return 1;
}

- (BOOL)rollAccessoryKeysToHH2:(id)a3 hh2ControllerKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  HMDHH2Migrator *v24;
  NSObject *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  _BYTE *v31;
  _BYTE buf[24];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v6, "accessories"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        v10))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v15, "count");
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Scheduling accessory key-roll for [%lu] accessories", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = objc_alloc(MEMORY[0x24BE1BBB0]);
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publicKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithIdentifier:publicKey:privateKey:permissions:", v17, v18, 0, 1);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33 = 1;
    objc_msgSend(v6, "accessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __58__HMDHH2Migrator_rollAccessoryKeysToHH2_hh2ControllerKey___block_invoke;
    v28[3] = &unk_24E792148;
    v31 = buf;
    v28[4] = v12;
    v29 = v6;
    v21 = v19;
    v30 = v21;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v28);

    v22 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@[%@] does not have any accessories in it. Skipping key-roll.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 1;
  }

  return v22;
}

- (BOOL)scheduleAccessoryKeyMigration:(id)a3 oldPairingIdentity:(id)a4 hh2PairingIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char isKindOfClass;
  void *v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  HMDHH2Migrator *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  void *v31;
  HMDHH2Migrator *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDHH2Migrator *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_38;
  }
  v11 = v10;
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_38:
    _HMFPreconditionFailure();
    goto LABEL_39;
  }
  if (!v9)
  {
LABEL_39:
    _HMFPreconditionFailure();
LABEL_40:
    _HMFPreconditionFailure();
  }
  if (!v11)
    goto LABEL_40;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[HMDHH2Migrator backgroundOpsManager](self, "backgroundOpsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
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
        v47 = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Background operation manager is nil. Not scheduling key roll operation for that.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      v30 = 0;
      goto LABEL_35;
    }
    v14 = v8;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    v18 = v14;
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();
    if ((v19 & 1) != 0)
      v20 = v18;
    else
      v20 = 0;
    v21 = v20;

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v18, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[HMDHH2Migrator scheduledKeyRollOperationsDuringMigration](self, "scheduledKeyRollOperationsDuringMigration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v24);

        v25 = objc_msgSend(v13, "scheduleHH2KeyRollForAccessory:previousIdentity:newIdentity:", v18, v9, v11);
LABEL_26:
        v30 = v25;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
LABEL_32:
        HMFGetLogIdentifier();
        v45 = v38;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v42;
        v48 = 2112;
        v49 = v18;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Accessory identifier is nil. Not scheduling key roll operation for that. %@", buf, 0x16u);

        v38 = v45;
      }
    }
    else
    {
      if ((v19 & 1) == 0)
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = self;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = v17;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v41;
          v48 = 2112;
          v49 = v18;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unexpected accessory class. Not scheduling key roll operation for it. %@", buf, 0x16u);

          v17 = v44;
        }
        goto LABEL_33;
      }
      objc_msgSend(v18, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[HMDHH2Migrator scheduledKeyRollOperationsDuringMigration](self, "scheduledKeyRollOperationsDuringMigration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v37);

        v25 = objc_msgSend(v13, "scheduleHH2KeyRollForAirPlayAccessory:previousIdentity:newIdentity:", v18, v9, v11);
        goto LABEL_26;
      }
      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
    }
LABEL_33:

    objc_autoreleasePoolPop(v38);
    v30 = 0;
    goto LABEL_34;
  }
  v31 = (void *)MEMORY[0x227676638]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v34;
    v48 = 2112;
    v49 = v8;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Not Scheduling key roll operation for Non-HAP and Non-AirPlay accessory : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
  v30 = 1;
LABEL_36:

  return v30;
}

- (void)revertChangesPerformedDuringMigration
{
  void *v3;
  HMDHH2Migrator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing all the key-roll operations scheduled during migration as it has failed...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHH2Migrator backgroundOpsManager](v4, "backgroundOpsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2Migrator scheduledKeyRollOperationsDuringMigration](v4, "scheduledKeyRollOperationsDuringMigration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HMDHH2Migrator_revertChangesPerformedDuringMigration__block_invoke;
  v11[3] = &unk_24E798FA8;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  -[HMDHH2Migrator scheduledKeyRollOperationsDuringMigration](v4, "scheduledKeyRollOperationsDuringMigration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (BOOL)handlePostMigration
{
  void *v3;
  HMDHH2Migrator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDHH2Migrator *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  int v15;
  NSObject *v16;
  os_log_type_t v17;
  BOOL v18;
  void *v20;
  int v21;
  BOOL v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  HMDHH2Migrator *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDHH2Migrator *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDHH2Migrator *v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting HH2 post migration work.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHH2Migrator migratorRecord](v4, "migratorRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "forceMigrationFailureForTesting");

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v12;
      v13 = "%{public}@*=*=*=*= Failing migration as it was requested by home-util command *=*=*=*=";
LABEL_9:
      v16 = v11;
      v17 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v16, v17, v13, buf, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[HMDHH2Migrator migratorRecord](v4, "migratorRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "dryRun");

  if (!v15)
  {
    -[HMDHH2Migrator hh2FrameworkSwitch](v4, "hh2FrameworkSwitch");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "waitForHH2SentinelZoneToBeFetchedFromCloud");

    if ((v21 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v4;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v12;
      v13 = "%{public}@Unable to perform initial sync for HH2 sentinel zone. Without that we cannot finish migration";
      v16 = v11;
      v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
    v41 = 0;
    v22 = -[HMDHH2Migrator makeSureToCreateHH2SentinelZoneWithError:](v4, "makeSureToCreateHH2SentinelZoneWithError:", &v41);
    v23 = v41;
    if (v22)
    {
      -[HMDHH2Migrator migratorRecord](v4, "migratorRecord");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "migrateFromTestDirectory");

      if ((v25 & 1) != 0
        || (-[HMDHH2Migrator migratorRecord](v4, "migratorRecord"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "finishMigration"),
            v26,
            (v27 & 1) != 0))
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = v4;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v31;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Finally Victory : n_n : HH2 migration successfully done.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        v18 = 1;
        +[HMDHH2MigrationStateLogger recordMigrationEnd:](HMDHH2MigrationStateLogger, "recordMigrationEnd:", 1);
        goto LABEL_29;
      }
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v4;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v40;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@This is the worst possible thing as we cannot even remove our migration record from the local disk. I am sad. :( Aborting the migration...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
    }
    else
    {
      v32 = (void *)MEMORY[0x227676638]();
      v33 = v4;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v35;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HH2 sentinel zone. Cannot mark migration as done. Aborting...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:underlyingError:", 2714, v23);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v33, "submitABCEventForFailedMigrationWithReason:withError:", 2, v36);

    }
    v18 = 0;
LABEL_29:

    return v18;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = v4;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v12;
    v13 = "%{public}@*=*=*=*= Failing migration as this was just a Dry Run *=*=*=*=";
    goto LABEL_9;
  }
LABEL_11:

  objc_autoreleasePoolPop(v9);
  return 0;
}

- (BOOL)makeSureToCreateHH2SentinelZoneWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  HMDHH2Migrator *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  HMDHH2Migrator *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2Migrator hh2FrameworkSwitch](self, "hh2FrameworkSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkExistenceOfHH2SentinelZone");

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
      v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@This is wierd... Looks like HH2 Sentinel zone exist already. That means other devices are already booted up in new world and might have wreaked havoc. Well... Let's move on. ¯\\_(ツ)_/¯", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    return 1;
  }
  else
  {
    -[HMDHH2Migrator hh2FrameworkSwitch](self, "hh2FrameworkSwitch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "waitForHH2SentinelZoneToBeCreated:error:", a3, 1.2e11);

    if ((v13 & 1) != 0)
    {
      v11 = 1;
      +[HMDHH2FrameworkSwitch setHH2EnablementPreferenceKey:](HMDHH2FrameworkSwitch, "setHH2EnablementPreferenceKey:", 1);
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HH2 Sentinel zone. We already checked that HH2 sentinel does not exist. Aborting the migration... ", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      return 0;
    }
  }
  return v11;
}

- (id)backingStoreObjectsForAccountsAndDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHH2Migrator *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
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
      objc_msgSend(v4, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Getting bso objects for account : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStoreObjectsWithChangeType:version:", 1, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  objc_msgSend(v4, "remoteAccounts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __59__HMDHH2Migrator_backingStoreObjectsForAccountsAndDevices___block_invoke;
  v19[3] = &unk_24E7920A8;
  v19[4] = self;
  v15 = v5;
  v20 = v15;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);

  v16 = v20;
  v17 = v15;

  return v17;
}

- (id)openZoneWithName:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHH2Migrator *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  void *v21;
  HMDHH2Migrator *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Opening zone with name: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
  v25 = 0;
  objc_msgSend(v7, "privateZonesWithName:configuration:delegate:error:", v6, v12, 0, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v25;
  if (v13)
  {
    -[HMDHH2Migrator openedZones](v9, "openedZones");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v13);

    objc_msgSend(v13, "localZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startUp");
    objc_msgSend(v13, "cloudZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator waitForStartupForCloudZone:](v9, "waitForStartupForCloudZone:", v17);

    v18 = (void *)MEMORY[0x227676638]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully opened local zone [%@]", buf, 0x16u);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v22 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v23;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zone with name %@: %@", buf, 0x20u);

    }
    v16 = 0;
  }

  objc_autoreleasePoolPop(v18);
  return v16;
}

- (id)privateZoneForOwnerUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHH2Migrator *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isOwner") & 1) != 0)
  {
    objc_msgSend(v4, "privateZoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator defaultDatabase](self, "defaultDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator openZoneWithName:inDatabase:](self, "openZoneWithName:inDatabase:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not going to open zone for user: %@ as it is not an owner", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)sharedZoneForOwnerUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHH2Migrator *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isOwner") & 1) != 0)
  {
    objc_msgSend(v4, "sharedZoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator defaultDatabase](self, "defaultDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator openZoneWithName:inDatabase:](self, "openZoneWithName:inDatabase:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not going to open shared zone for user : %@ as it is not an owner", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (BOOL)migrateV5Models:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHH2Migrator *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  HMDHH2Migrator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDHH2Migrator *v22;
  NSObject *v23;
  void *v24;
  HMDHH2Migrator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDHH2Migrator *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
    v34 = 138543618;
    v35 = v11;
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting migration for V5 models for home : %@", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "owner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDHH2Migrator privateZoneForOwnerUser:](v9, "privateZoneForOwnerUser:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v9;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v24;
        v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate V5 models: could not get private zone for owner user: %@", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v16 = 0;
      goto LABEL_41;
    }
    -[HMDHH2Migrator sharedZoneForOwnerUser:](v9, "sharedZoneForOwnerUser:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    if (!v14)
    {
      v25 = v9;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v27;
        v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate V5 models: could not get shared zone for owner user: %@", (uint8_t *)&v34, 0x16u);

      }
      goto LABEL_39;
    }
    if (-[HMDHH2Migrator migrateUserSettingsToCoreData:forUser:fromLocalZone:](v9, "migrateUserSettingsToCoreData:forUser:fromLocalZone:", v6, v12, v13))
    {
      objc_autoreleasePoolPop(v15);
      v15 = (void *)MEMORY[0x227676638]();
      if (-[HMDHH2Migrator migrateUserSettingsToCoreData:forUser:fromLocalZone:](v9, "migrateUserSettingsToCoreData:forUser:fromLocalZone:", v6, v12, v14))
      {
        objc_autoreleasePoolPop(v15);
        v15 = (void *)MEMORY[0x227676638]();
        if (-[HMDHH2Migrator migrateMediaContentProfileAccessControl:forOwnerUser:fromLocalZone:](v9, "migrateMediaContentProfileAccessControl:forOwnerUser:fromLocalZone:", v6, v12, v14))
        {
          objc_autoreleasePoolPop(v15);
          v15 = (void *)MEMORY[0x227676638]();
          if (-[HMDHH2Migrator migrateUserListeningHistoryControl:forOwnerUser:fromLocalZone:](v9, "migrateUserListeningHistoryControl:forOwnerUser:fromLocalZone:", v6, v12, v14))
          {
            objc_autoreleasePoolPop(v15);
            v15 = (void *)MEMORY[0x227676638]();
            if (-[HMDHH2Migrator migratePhotosPersonManagerSettingsFromLocalZone:owner:managedObjectContext:](v9, "migratePhotosPersonManagerSettingsFromLocalZone:owner:managedObjectContext:", v14, v12, v6))
            {
              objc_autoreleasePoolPop(v15);
              v15 = (void *)MEMORY[0x227676638]();
              if (-[HMDHH2Migrator migrateAccessoryV5Models:fromLocalZone:forHome:owner:](v9, "migrateAccessoryV5Models:fromLocalZone:forHome:owner:", v6, v13, v7, v12))
              {
                objc_autoreleasePoolPop(v15);
                v15 = (void *)MEMORY[0x227676638]();
                if (-[HMDHH2Migrator migrateV5PersonDataForHome:managedObjectContext:](v9, "migrateV5PersonDataForHome:managedObjectContext:", v7, v6))
                {
                  v16 = 1;
LABEL_40:
                  objc_autoreleasePoolPop(v15);

LABEL_41:
                  goto LABEL_42;
                }
                v28 = (void *)MEMORY[0x227676638]();
                v29 = v9;
                HMFGetOSLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  goto LABEL_38;
                goto LABEL_36;
              }
              v28 = (void *)MEMORY[0x227676638]();
              v29 = v9;
              HMFGetOSLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
LABEL_36:
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = 138543618;
                v35 = v31;
                v36 = 2112;
                v37 = v12;
                v32 = "%{public}@Failed to migrate V5 models: unable to migrate accessory settings for owner user: %@";
                goto LABEL_37;
              }
LABEL_38:

              objc_autoreleasePoolPop(v28);
LABEL_39:
              v16 = 0;
              goto LABEL_40;
            }
            v28 = (void *)MEMORY[0x227676638]();
            v29 = v9;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              goto LABEL_38;
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 138543618;
            v35 = v31;
            v36 = 2112;
            v37 = v12;
            v32 = "%{public}@Failed to migrate V5 models: unable to migrate photos person manager settings for owner user: %@";
          }
          else
          {
            v28 = (void *)MEMORY[0x227676638]();
            v29 = v9;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              goto LABEL_38;
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 138543618;
            v35 = v31;
            v36 = 2112;
            v37 = v12;
            v32 = "%{public}@Failed to migrate V5 models: unable to migrate listening history control for owner user: %@";
          }
        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = v9;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_38;
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v31;
          v36 = 2112;
          v37 = v12;
          v32 = "%{public}@Failed to migrate V5 models: unable to migrate media content profile access control for owner user: %@";
        }
      }
      else
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = v9;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v31;
        v36 = 2112;
        v37 = v12;
        v32 = "%{public}@Failed to migrate V5 models: unable to migrate shared settings for owner user: %@";
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v9;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v31;
      v36 = 2112;
      v37 = v12;
      v32 = "%{public}@Failed to migrate V5 models: unable to migrate private settings for owner user: %@";
    }
LABEL_37:
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v34, 0x16u);

    goto LABEL_38;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = v9;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543618;
    v35 = v20;
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate V5 models: owner user was not found for home: %@", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v16 = 0;
LABEL_42:

  return v16;
}

- (BOOL)migrateMediaContentProfileAccessControl:(id)a3 forOwnerUser:(id)a4 fromLocalZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  HMDHH2Migrator *v22;
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryModelsOfType:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke;
  v25[3] = &unk_24E7920D0;
  v14 = v11;
  v26 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke_2;
  v19[3] = &unk_24E79B670;
  v15 = v9;
  v20 = v15;
  v16 = v8;
  v21 = v16;
  v22 = self;
  v24 = &v27;
  v17 = v14;
  v23 = v17;
  objc_msgSend(v16, "performBlockAndWait:", v19);
  LOBYTE(v14) = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)v14;
}

- (BOOL)migrateUserListeningHistoryControl:(id)a3 forOwnerUser:(id)a4 fromLocalZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  HMDHH2Migrator *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;
  id v26;
  HMDHH2Migrator *v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryModelsOfType:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke;
  v30[3] = &unk_24E7920F8;
  v14 = v11;
  v31 = v14;
  v15 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "enumerateObjectsUsingBlock:", v30));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v18;
    v38 = 2112;
    v39 = v14;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Found listening history control enabled accessories: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke_165;
  v24[3] = &unk_24E79B670;
  v19 = v9;
  v25 = v19;
  v20 = v8;
  v26 = v20;
  v27 = v16;
  v29 = &v32;
  v21 = v14;
  v28 = v21;
  objc_msgSend(v20, "performBlockAndWait:", v24);
  v22 = *((_BYTE *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  return v22;
}

- (BOOL)migrateUserSettingsToCoreData:(id)a3 forUser:(id)a4 fromLocalZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  HMDHH2Migrator *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v14;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate user settings for user [%@] from local zone: [%@]", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v9, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUser getSettingsUsingPreOrderTraversal:rootUUID:keyPath:](HMDUser, "getSettingsUsingPreOrderTraversal:rootUUID:keyPath:", v10, v15, &stru_24E79DB48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  v18 = (void *)MEMORY[0x227676638]();
  if (v17)
  {
    v19 = -[HMDHH2Migrator saveUserSettingsToCoreData:forUser:privateSettingsMap:](v12, "saveUserSettingsToCoreData:forUser:privateSettingsMap:", v8, v9, v16);
  }
  else
  {
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Did not find any settings model for user : %@", (uint8_t *)&v24, 0x16u);

    }
    v19 = 1;
  }
  objc_autoreleasePoolPop(v18);

  return v19;
}

- (BOOL)saveUserSettingsToCoreData:(id)a3 forUser:(id)a4 privateSettingsMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDHH2Migrator *v19;
  NSObject *v20;
  id v21;
  void *v22;
  BOOL v23;
  _QWORD v25[4];
  id v26;
  id v27;
  HMDHH2Migrator *v28;
  id v29;
  _BYTE *v30;
  uint8_t v31[4];
  id v32;
  __int16 v33;
  void *v34;
  _BYTE buf[24];
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@User Settings : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v36 = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke;
  v25[3] = &unk_24E79B670;
  v15 = v9;
  v26 = v15;
  v16 = v8;
  v27 = v16;
  v28 = v12;
  v17 = v10;
  v29 = v17;
  v30 = buf;
  v18 = (void *)MEMORY[0x227676638](objc_msgSend(v16, "performBlockAndWait:", v25));
  v19 = v12;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v31 = 138543618;
    v32 = v21;
    v33 = 2112;
    v34 = v22;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Migrating user's owned settings finished : %@", v31, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v23;
}

- (BOOL)migrateAccessoryV5Models:(id)a3 fromLocalZone:(id)a4 forHome:(id)a5 owner:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDHH2Migrator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v23[5];
  id v24;
  id v25;
  _BYTE *v26;
  _BYTE buf[24];
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Will look for all the V5 models and migrate them for home : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v28 = 1;
  objc_msgSend(v12, "accessories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __71__HMDHH2Migrator_migrateAccessoryV5Models_fromLocalZone_forHome_owner___block_invoke;
  v23[3] = &unk_24E792148;
  v23[4] = v15;
  v19 = v12;
  v24 = v19;
  v26 = buf;
  v20 = v10;
  v25 = v20;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

  v21 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v21;
}

- (BOOL)migratePhotosPersonManagerSettingsFromLocalZone:(id)a3 owner:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  HMDHH2Migrator *v23;
  _BYTE *v24;
  _BYTE buf[24];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v26 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Migrating person manager settings for user: %@, localZone: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v26) = 1;
  objc_msgSend(v8, "queryModelsOfType:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __93__HMDHH2Migrator_migratePhotosPersonManagerSettingsFromLocalZone_owner_managedObjectContext___block_invoke;
  v20[3] = &unk_24E792170;
  v16 = v9;
  v21 = v16;
  v17 = v10;
  v22 = v17;
  v23 = v12;
  v24 = buf;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);
  v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v18;
}

- (BOOL)fetchAndMigrateCompositeSettingsFromAccessory:(id)a3 fromLocalZone:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryModelsWithParentModelID:ofType:", v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __99__HMDHH2Migrator_fetchAndMigrateCompositeSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke;
  v16[3] = &unk_24E792198;
  v19 = &v20;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);
  LOBYTE(v10) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v10;
}

- (BOOL)migrateCompositeAccessorySettingModel:(id)a3 accessory:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  HMDHH2Migrator *v24;
  id v25;
  _BYTE *v26;
  _BYTE buf[24];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v28 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Found composite accessory setting model on accessory : [%@], [%@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v28) = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__HMDHH2Migrator_migrateCompositeAccessorySettingModel_accessory_managedObjectContext___block_invoke;
  v21[3] = &unk_24E79B670;
  v16 = v9;
  v22 = v16;
  v17 = v10;
  v23 = v17;
  v24 = v12;
  v26 = buf;
  v18 = v8;
  v25 = v18;
  objc_msgSend(v17, "performBlockAndWait:", v21);
  v19 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v19;
}

- (BOOL)fetchAndMigrateCameraSettingsFromAccessory:(id)a3 fromLocalZone:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryModelsWithParentModelID:ofType:", v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__HMDHH2Migrator_fetchAndMigrateCameraSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke;
  v16[3] = &unk_24E7921C0;
  v19 = &v20;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);
  LOBYTE(v10) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v10;
}

- (BOOL)migrateCameraProfileSettingModel:(id)a3 accessory:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  HMDHH2Migrator *v23;
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v27 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Found camera profile setting model on accessory : [%@], [%@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __82__HMDHH2Migrator_migrateCameraProfileSettingModel_accessory_managedObjectContext___block_invoke;
  v20[3] = &unk_24E79B670;
  v15 = v9;
  v21 = v15;
  v16 = v10;
  v22 = v16;
  v23 = v12;
  v25 = buf;
  v17 = v8;
  v24 = v17;
  objc_msgSend(v16, "performBlockAndWait:", v20);
  v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v18;
}

- (BOOL)migrateV5PersonDataForHome:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  HMDHH2Migrator *v17;
  NSObject *v18;
  void *v19;
  HMDHH2Migrator *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDHH2Migrator *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "personManagerZoneUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HMDHomePersonManager zoneNameForZoneUUID:](HMDHomePersonManager, "zoneNameForZoneUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator cameraClipsDatabase](self, "cameraClipsDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator openZoneWithName:inDatabase:](self, "openZoneWithName:inDatabase:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x227676638]();
    if (!v11)
    {
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v22;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to open home person manager zone for home: %@", (uint8_t *)&v29, 0x16u);

      }
      goto LABEL_18;
    }
    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDHH2Migrator migrateHomePersonModelsForHomeUUID:localZone:managedObjectContext:](self, "migrateHomePersonModelsForHomeUUID:localZone:managedObjectContext:", v13, v11, v7);

    if (v14)
    {
      objc_autoreleasePoolPop(v12);
      v12 = (void *)MEMORY[0x227676638]();
      if (-[HMDHH2Migrator migratePersonFaceCropModelsForLocalZone:](self, "migratePersonFaceCropModelsForLocalZone:", v11))
      {
        v15 = 1;
LABEL_19:
        objc_autoreleasePoolPop(v12);

        goto LABEL_20;
      }
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v26;
      v31 = 2112;
      v32 = v6;
      v27 = "%{public}@Failed to migrate person face crop models for home: %@";
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        objc_autoreleasePoolPop(v23);
LABEL_18:
        v15 = 0;
        goto LABEL_19;
      }
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v26;
      v31 = 2112;
      v32 = v6;
      v27 = "%{public}@Failed to migrate home person models for home: %@";
    }
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v29, 0x16u);

    goto LABEL_17;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v19;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Not migrating home person models because no home person manager zone UUID exists", (uint8_t *)&v29, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  v15 = 1;
LABEL_20:

  return v15;
}

- (BOOL)migrateHomePersonModelsForHomeUUID:(id)a3 localZone:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHH2Migrator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  HMDHH2Migrator *v22;
  id v23;
  _BYTE *v24;
  _BYTE buf[24];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Migrating home person models for local zone: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v26 = 1;
  objc_msgSend(v9, "queryModelsOfType:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke;
  v20[3] = &unk_24E792210;
  v16 = v10;
  v21 = v16;
  v22 = v12;
  v17 = v8;
  v23 = v17;
  v24 = buf;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);
  v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v18;
}

- (BOOL)migratePersonFaceCropModelsForLocalZone:(id)a3
{
  id v4;
  void *v5;
  HMDHH2Migrator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  HMDHH2Migrator *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Migrating person face crop models for local zone: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryModelsOfType:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__HMDHH2Migrator_migratePersonFaceCropModelsForLocalZone___block_invoke;
  v17[3] = &unk_24E792238;
  v11 = v9;
  v18 = v11;
  v12 = v4;
  v19 = v12;
  v20 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Migrate face crop models to HH2"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateModels:options:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2Migrator v5ModelUpdateFutures](v6, "v5ModelUpdateFutures");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

  }
  return 1;
}

- (BOOL)waitForFirstImportToFinish
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  HMDHH2Migrator *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHH2Migrator *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "migrateFromTestDirectory"))
  {

LABEL_4:
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Not going to wait for first import to finish as we are running without live CloudKit", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    return 1;
  }
  -[HMDHH2Migrator migratorRecord](self, "migratorRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dryRun");

  if (v5)
    goto LABEL_4;
  v19 = 0;
  v20 = 0;
  -[HMDHH2Migrator coreData](self, "coreData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstCloudKitImportFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "waitForResult:orError:withTimeout:", &v19, &v20, 900.0);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Did first import finished: %@ error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  if ((v10 & 1) == 0)
    -[HMDHH2Migrator submitABCEventForFailedMigrationWithReason:withError:](v14, "submitABCEventForFailedMigrationWithReason:withError:", 3, v20);

  return v10;
}

- (void)submitABCEventForFailedMigrationWithReason:(unint64_t)a3 withError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  char v22;
  void *v23;
  HMDHH2Migrator *v24;
  NSObject *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  dispatch_time_t v30;
  void *v31;
  HMDHH2Migrator *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDHH2Migrator *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HMDHH2Migrator *v45;
  NSObject *v46;
  void *v47;
  const __CFString *v48;
  id v49;
  void *v50;
  _QWORD v51[5];
  NSObject *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE3F258], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BEB3478]);
  dispatch_get_global_queue(2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithQueue:", v9);

  objc_msgSend(v7, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("HomeKit"), CFSTR("CoreData"), CFSTR("Migration"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = a3 - 1;
  if (a3 - 1 > 8)
    v14 = CFSTR("Unknown");
  else
    v14 = off_24E7922D0[v13];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BEB3588]);
  if (v6)
  {
    objc_msgSend(v6, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BEB3568]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BEB3570]);

  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", self->_migrationStartTime);
  v20 = v19;
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __71__HMDHH2Migrator_submitABCEventForFailedMigrationWithReason_withError___block_invoke;
  v51[3] = &unk_24E792260;
  v51[4] = self;
  v21 = v17;
  v52 = v21;
  v22 = objc_msgSend(v10, "snapshotWithSignature:duration:event:payload:reply:", v12, 0, 0, v51, v20);

  if ((v22 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = v6;
      v26 = v13;
      v27 = v10;
      v28 = v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v29;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to submit ABC event", buf, 0xCu);

      v7 = v28;
      v10 = v27;
      v13 = v26;
      v6 = v49;
    }

    objc_autoreleasePoolPop(v23);
  }
  v30 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v21, v30))
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v50 = v12;
      v34 = v21;
      v35 = v6;
      v36 = v13;
      v37 = v10;
      v38 = v7;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v39;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to file the ABC event", buf, 0xCu);

      v7 = v38;
      v10 = v37;
      v13 = v36;
      v6 = v35;
      v21 = v34;
      v12 = v50;
    }

    objc_autoreleasePoolPop(v31);
  }
  v40 = (void *)MEMORY[0x227676638]();
  v41 = self;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v43;
    v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Migration to HH2 failed with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v40);
  v44 = (void *)MEMORY[0x227676638]();
  v45 = v41;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v47;
    _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_FAULT, "%{public}@Migration to HH2 failed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v44);
  if (v13 > 8)
    v48 = CFSTR("Unknown");
  else
    v48 = off_24E7922D0[v13];
  +[HMDHH2MigrationStateLogger recordMigrationFailedWithError:withReason:](HMDHH2MigrationStateLogger, "recordMigrationFailedWithError:withReason:", v6, v48);

}

- (BOOL)_performMigrationFromTestDirectoryUsingHH2ControllerKey:(id)a3
{
  void *v4;
  HMDHH2Migrator *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  HMDHH2Migrator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  HMDHH2Migrator *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDHH2Migrator *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDHH2Migrator *v34;
  NSObject *v35;
  void *v36;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)hh1TestArchivesDirectoryPath;
    *(_DWORD *)buf = 138543618;
    v51 = v7;
    v52 = 2112;
    v53 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Was asked to migrate from test directory : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = (void *)MEMORY[0x24BDBCF48];
  v10 = (id)hh1TestArchivesDirectoryPath;
  objc_msgSend(v9, "fileURLWithPath:", v10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isInternalBuild() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v11, "getOrCreateLocalPairingIdentity:", &v49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v49;

    v13 = v12 != 0;
    if (v12)
    {
      -[HMDHH2Migrator makeListOfArchivesToMigrate:](v5, "makeListOfArchivesToMigrate:", v39);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v5;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v18;
        v52 = 2112;
        v53 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@List of files to Migrate : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 0;
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __74__HMDHH2Migrator__performMigrationFromTestDirectoryUsingHH2ControllerKey___block_invoke;
      v41[3] = &unk_24E792288;
      v41[4] = v16;
      v42 = v40;
      v44 = &v45;
      v20 = v19;
      v43 = v20;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v41);
      v21 = objc_msgSend(v14, "count");
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v16;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21 - *((int *)v46 + 6));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v51 = v25;
        v52 = 2112;
        v53 = v26;
        v54 = 2112;
        v55 = v27;
        v56 = 2112;
        v57 = v20;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Final Migration Status Succeeded: %@/%@, Failed list : %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDHH2Migrator migratorRecord](v23, "migratorRecord");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "finishMigration");

      _Block_object_dispose(&v45, 8);
    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v5;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        v52 = 2112;
        v53 = v38;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to get / create HH1 controller key : %@. Failing the test migration", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v5;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot migrate test archives as this is not an internal build", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    v13 = 0;
  }

  return v13;
}

- (id)makeListOfArchivesToMigrate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _BYTE v25[128];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBCC60];
  v26[0] = *MEMORY[0x24BDBCCD0];
  v26[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __46__HMDHH2Migrator_makeListOfArchivesToMigrate___block_invoke;
  v24[3] = &unk_24E7922B0;
  v24[4] = self;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v7, 0, v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "pathExtension", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", CFSTR("sqlite"));

        if (v17)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v12);
  }

  v18 = (void *)objc_msgSend(v9, "copy");
  return v18;
}

- (HMDHH2MigratorRecord)migratorRecord
{
  return self->_migratorRecord;
}

- (HMDHH2FrameworkSwitch)hh2FrameworkSwitch
{
  return self->_hh2FrameworkSwitch;
}

- (NSMutableSet)scheduledKeyRollOperationsDuringMigration
{
  return self->_scheduledKeyRollOperationsDuringMigration;
}

- (NSMutableSet)v5ModelUpdateFutures
{
  return self->_v5ModelUpdateFutures;
}

- (NSMutableSet)openedZones
{
  return self->_openedZones;
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (HMDCoreDataCloudTransform)cloudTransform
{
  return self->_cloudTransform;
}

- (HMDBackgroundOperationManager)backgroundOpsManager
{
  return self->_backgroundOpsManager;
}

- (HMDDatabase)defaultDatabase
{
  return self->_defaultDatabase;
}

- (HMDDatabase)cameraClipsDatabase
{
  return self->_cameraClipsDatabase;
}

- (NSDate)migrationStartTime
{
  return self->_migrationStartTime;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDHomeData)homeData
{
  return self->_homeData;
}

- (void)setHomeData:(id)a3
{
  objc_storeStrong((id *)&self->_homeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_migrationStartTime, 0);
  objc_storeStrong((id *)&self->_cameraClipsDatabase, 0);
  objc_storeStrong((id *)&self->_defaultDatabase, 0);
  objc_storeStrong((id *)&self->_backgroundOpsManager, 0);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong((id *)&self->_openedZones, 0);
  objc_storeStrong((id *)&self->_v5ModelUpdateFutures, 0);
  objc_storeStrong((id *)&self->_scheduledKeyRollOperationsDuringMigration, 0);
  objc_storeStrong((id *)&self->_hh2FrameworkSwitch, 0);
  objc_storeStrong((id *)&self->_migratorRecord, 0);
}

uint64_t __46__HMDHH2Migrator_makeListOfArchivesToMigrate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not adding file : %@ to migration list due to %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);

  return 1;
}

void __74__HMDHH2Migrator__performMigrationFromTestDirectoryUsingHH2ControllerKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v7;
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Picked up the file for migration: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "_startMigratingHomeDataFromLocation:usingHH2PairingKey:", v10, *(_QWORD *)(a1 + 40));

  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v16 = CFSTR("successfully");
    else
      v16 = CFSTR("with an error");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v19);
    *(_DWORD *)buf = 138544130;
    v21 = v15;
    v22 = 2112;
    v23 = v3;
    v24 = 2112;
    v25 = v16;
    v26 = 2048;
    v27 = v18;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Migration of [%@] finished [%@]. Total time: %f", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  if ((v11 & 1) == 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }
  objc_autoreleasePoolPop(v8);

}

void __71__HMDHH2Migrator_submitABCEventForFailedMigrationWithReason_withError___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@ABC event was not submitted due to : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __58__HMDHH2Migrator_migratePersonFaceCropModelsForLocalZone___block_invoke(id *a1, void *a2)
{
  id v3;
  HMDFaceCropModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDFaceCropModel *v12;

  v3 = a2;
  v4 = [HMDFaceCropModel alloc];
  objc_msgSend(v3, "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmbParentModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMBModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, v6);

  objc_msgSend(v3, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceCropModel setPersonUUID:](v12, "setPersonUUID:", v8);

  objc_msgSend(a1[4], "addObject:", v12);
  if ((unint64_t)objc_msgSend(a1[4], "count") >= 0x15)
  {
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Migrate face crop models to HH2"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "updateModels:options:", a1[4], v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "v5ModelUpdateFutures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

    objc_msgSend(a1[4], "removeAllObjects");
  }

}

void __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke_2;
  v10[3] = &unk_24E7921E8;
  v6 = *(void **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v13 = v7;
  v14 = v8;
  v15 = a3;
  v9 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v10);

}

void __84__HMDHH2Migrator_migrateHomePersonModelsForHomeUUID_localZone_managedObjectContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _MKFHomePerson *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
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
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Migrating home person model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  +[_MKFModel modelWithModelID:context:](_MKFHome, "modelWithModelID:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "hmbModelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFHomePerson, "modelWithModelID:context:", v8, *(_QWORD *)(a1 + 56));
    v9 = (_MKFHomePerson *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = -[_MKFHomePerson initWithContext:]([_MKFHomePerson alloc], "initWithContext:", *(_QWORD *)(a1 + 56));
      -[_MKFHomePerson setModelID:](v9, "setModelID:", v8);
      -[_MKFHomePerson setHome:](v9, "setHome:", v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomePerson setName:](v9, "setName:", v10);

    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to save home person for home person model: %@"), *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v12, "_saveAndResetWithContext:errorMessage:", v11, v13);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated home person model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    else
    {
      **(_BYTE **)(a1 + 72) = 1;
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find home with model ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    **(_BYTE **)(a1 + 72) = 1;
  }

}

void __82__HMDHH2Migrator_migrateCameraProfileSettingModel_accessory_managedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFModel modelWithModelID:context:](_MKFHAPAccessory, "modelWithModelID:context:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "accessModeAtHome"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraAccessModeAtHome:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "accessModeNotAtHome"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraAccessModeNotAtHome:", v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "recordingEventTriggers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraRecordingEventTriggers:", v6);

    objc_msgSend(*(id *)(a1 + 56), "activityZones");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraActivityZones:", v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "activityZonesIncludedForSignificantEventDetection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraActivityZonesIncludedForSignificantEventDetection:", v8);

    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Unable to save the camera profile settings for: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v9, "_saveAndResetWithContext:errorMessage:", v10, v13);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "debugDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully stored camera profile settings for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v22;
      v25 = 2112;
      v26 = 0;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get MKFHAPAccessory for %@. Failing the migration due to that.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

uint64_t __96__HMDHH2Migrator_fetchAndMigrateCameraSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "migrateCameraProfileSettingModel:accessory:managedObjectContext:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a3 = 1;
  return result;
}

void __87__HMDHH2Migrator_migrateCompositeAccessorySettingModel_accessory_managedObjectContext___block_invoke(uint64_t a1)
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
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFModel modelWithModelID:context:](_MKFHAPAccessory, "modelWithModelID:context:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "root_siri_soundAlert_value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSoundAlertEnabled:", v4);

    objc_msgSend(*(id *)(a1 + 56), "root_siri_lightWhenUsingSiri_value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLightWhenUsingSiriEnabled:", v5);

    objc_msgSend(*(id *)(a1 + 56), "root_siri_siriEnabled_value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSiriEnabled:", v6);

    objc_msgSend(*(id *)(a1 + 56), "root_siri_language_inputLanguageCodeValueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSiriLanguageCode:", v7);

    objc_msgSend(*(id *)(a1 + 56), "root_siri_language_outputLanguageVoiceCodeValueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSiriLanguageVoiceCode:", v8);

    objc_msgSend(*(id *)(a1 + 56), "root_siri_language_outputLanguageGenderCodeValueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSiriLanguageVoiceGenderCode:", v9);

    objc_msgSend(*(id *)(a1 + 56), "root_siri_language_voiceNameValueName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSiriLanguageVoiceName:", v10);

    objc_msgSend(*(id *)(a1 + 56), "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHasDismissedHomePodHasNonMemberMediaAccountWarning:", v11);

    objc_msgSend(*(id *)(a1 + 56), "root_doorbellChime_enabled_value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDoorbellChimeEnabled:", v12);

    objc_msgSend(*(id *)(a1 + 56), "root_announce_enabled_value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnnounceEnabled:", v13);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisionDoubleTapSettingsTimeoutInterval:", v14);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_voiceOver_enabled_value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisionVoiceOverEnabled:", v15);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisionVoiceOverAudioDuckingEnabled:", v16);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisionSpeakingRate:", v17);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_holdDuration_enabled_value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionHoldDurationEnabled:", v18);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_holdDuration_seconds_value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionHoldDurationSeconds:", v19);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_touchAccommodations_enabled_value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionTouchAccommodationsEnabled:", v20);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionIgnoreRepeatEnabled:", v21);

    objc_msgSend(*(id *)(a1 + 56), "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionIgnoreRepeatSeconds:", v22);

    objc_msgSend(*(id *)(a1 + 56), "root_general_analytics_shareSiriAnalytics_value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShareSiriAnalytics:", v23);

    objc_msgSend(*(id *)(a1 + 56), "root_general_analytics_shareSpeakerAnalytics_value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShareSpeakerAnalytics:", v24);

    objc_msgSend(*(id *)(a1 + 56), "root_airPlay_airPlayEnabled_value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAirPlayEnabled:", v25);

    objc_msgSend(*(id *)(a1 + 56), "root_siriEndpoint_enabled_value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSiriEndpointEnabled:", v26);

    v28 = *(_QWORD *)(a1 + 40);
    v27 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to save the sidekick settings for: %@"), v3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v27, "_saveAndResetWithContext:errorMessage:", v28, v29);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "debugDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        v41 = 2112;
        v42 = v34;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Successfully stored sidekick settings for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v38;
      v41 = 2112;
      v42 = 0;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to get MKFHAPAccessory for %@. Failing the migration due to that.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

uint64_t __99__HMDHH2Migrator_fetchAndMigrateCompositeSettingsFromAccessory_fromLocalZone_managedObjectContext___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "migrateCompositeAccessorySettingModel:accessory:managedObjectContext:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a3 = 1;
  return result;
}

void __93__HMDHH2Migrator_migratePhotosPersonManagerSettingsFromLocalZone_owner_managedObjectContext___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "sharingFaceClassificationsEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSharePhotosFaceClassifications:", v8);

    objc_msgSend(v5, "zoneUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhotosPersonDataZoneUUID:", v9);

    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to save the photos person manager settings for: %@"), *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "_saveAndResetWithContext:errorMessage:", v11, v12);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully stored photos person manager settings for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not sure how this happened. Unable to find the MKFUser for : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    *a3 = 1;
  }

}

void __71__HMDHH2Migrator_migrateAccessoryV5Models_fromLocalZone_forHome_owner___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
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
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCompositeSettingsControllerManager zoneNameForHomeUUID:](HMDCompositeSettingsControllerManager, "zoneNameForHomeUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openZoneWithName:inDatabase:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "fetchAndMigrateCompositeSettingsFromAccessory:fromLocalZone:managedObjectContext:", v6, v12, *(_QWORD *)(a1 + 48));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "debugDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        v21 = "%{public}@Could not migrate sidekick settings for accessory : %@";
        goto LABEL_9;
      }
LABEL_10:

      objc_autoreleasePoolPop(v16);
      *a4 = 1;
      goto LABEL_11;
    }
  }

  objc_autoreleasePoolPop(v7);
  v7 = (void *)MEMORY[0x227676638]();
  v13 = *(void **)(a1 + 32);
  +[HMDCameraProfileSettingsManager zoneNameForHome:](HMDCameraProfileSettingsManager, "zoneNameForHome:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openZoneWithName:inDatabase:", v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "fetchAndMigrateCameraSettingsFromAccessory:fromLocalZone:managedObjectContext:", v6, v12, *(_QWORD *)(a1 + 48));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "debugDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        v21 = "%{public}@Could not migrate camera profile settings for accessory : %@";
LABEL_9:
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v22, 0x16u);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
LABEL_11:

  objc_autoreleasePoolPop(v7);
}

void __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[_MKFUser entity](_MKFUser, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmd_attributesBySettingsPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke_168;
    v19[3] = &unk_24E792120;
    v6 = *(void **)(a1 + 56);
    v19[4] = *(_QWORD *)(a1 + 48);
    v20 = *(id *)(a1 + 32);
    v21 = v5;
    v7 = v3;
    v22 = v7;
    v8 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v19);
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Unable to save the owner's private settings : %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v9, "_saveAndResetWithContext:errorMessage:", v10, v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser in database: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

void __72__HMDHH2Migrator_saveUserSettingsToCoreData_forUser_privateSettingsMap___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "type");
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 == 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v12;
      v30 = 2112;
      v31 = v5;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[keyPath = %@] : [Value = %@]", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(id *)(a1 + 56);
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544130;
        v29 = v19;
        v30 = 2112;
        v31 = v5;
        v32 = 2112;
        v33 = v20;
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Going to save setting:[%@] with value:[%@] on attribute: [%@]", (uint8_t *)&v28, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v6, "numberValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v21, v14);

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v27;
        v30 = 2112;
        v31 = v5;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not find mapping of settings to attribute name. [%@]", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      v28 = 138543874;
      v29 = v22;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v23;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Non number setting found : [%@] for user :[%@]. Only expecting number setting for private settings", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessories");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __80__HMDHH2Migrator_migrateUserListeningHistoryControl_forOwnerUser_fromLocalZone___block_invoke_165(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **p_superclass;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v43 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v43);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v43;

  if (v4)
  {
    v34 = v4;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = *(id *)(a1 + 56);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v8 = a1;
    v35 = v6;
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v40;
      p_superclass = HMDMediaGroupsAggregatorBackupSender.superclass;
      do
      {
        v12 = 0;
        v13 = v5;
        v36 = v9;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
          v15 = *(_QWORD *)(v8 + 40);
          v38 = v13;
          objc_msgSend(p_superclass + 414, "modelWithModelID:context:error:", v14, v15, &v38);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v38;

          if (v16)
          {
            objc_msgSend(v6, "addObject:", v16);
          }
          else
          {
            v17 = v10;
            v18 = (void *)MEMORY[0x227676638]();
            v19 = *(id *)(v8 + 48);
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = v5;
              v22 = v8;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v23;
              v47 = 2112;
              v48 = v14;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to find accessory with UUID %@ when migrating user listening history control", buf, 0x16u);

              v8 = v22;
              v5 = v21;
              v6 = v35;
            }

            objc_autoreleasePoolPop(v18);
            v10 = v17;
            p_superclass = (__objc2_class **)(HMDMediaGroupsAggregatorBackupSender + 8);
            v9 = v36;
          }

          ++v12;
          v13 = v5;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v9);
    }

    v24 = (void *)objc_msgSend(v6, "copy");
    v4 = v34;
    objc_msgSend(v34, "setAccessoriesWithListeningHistoryEnabled_:", v24);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 64) + 8) + 24) = objc_msgSend(*(id *)(v8 + 48), "_saveAndResetWithContext:errorMessage:", *(_QWORD *)(v8 + 40), CFSTR("Unable to save the migrated user listening history control"));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 64) + 8) + 24))
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = *(id *)(v8 + 48);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v28;
        v47 = 2112;
        v48 = v35;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated user listening history control for accessories: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      v6 = v35;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v32;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v5;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate user listening history control because owner user %@ fetch failed with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessories");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __85__HMDHH2Migrator_migrateMediaContentProfileAccessControl_forOwnerUser_fromLocalZone___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **p_superclass;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v43 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v43);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v43;

  if (v4)
  {
    v34 = v4;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = *(id *)(a1 + 56);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v8 = a1;
    v35 = v6;
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v40;
      p_superclass = HMDMediaGroupsAggregatorBackupSender.superclass;
      do
      {
        v12 = 0;
        v13 = v5;
        v36 = v9;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
          v15 = *(_QWORD *)(v8 + 40);
          v38 = v13;
          objc_msgSend(p_superclass + 414, "modelWithModelID:context:error:", v14, v15, &v38);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v38;

          if (v16)
          {
            objc_msgSend(v6, "addObject:", v16);
          }
          else
          {
            v17 = v10;
            v18 = (void *)MEMORY[0x227676638]();
            v19 = *(id *)(v8 + 48);
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = v5;
              v22 = v8;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v23;
              v47 = 2112;
              v48 = v14;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to find accessory with UUID %@ when migrating media content profile access control", buf, 0x16u);

              v8 = v22;
              v5 = v21;
              v6 = v35;
            }

            objc_autoreleasePoolPop(v18);
            v10 = v17;
            p_superclass = (__objc2_class **)(HMDMediaGroupsAggregatorBackupSender + 8);
            v9 = v36;
          }

          ++v12;
          v13 = v5;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v9);
    }

    v24 = (void *)objc_msgSend(v6, "copy");
    v4 = v34;
    objc_msgSend(v34, "setAccessoriesWithMediaContentProfileEnabled_:", v24);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 64) + 8) + 24) = objc_msgSend(*(id *)(v8 + 48), "_saveAndResetWithContext:errorMessage:", *(_QWORD *)(v8 + 40), CFSTR("Unable to save the migrated media content profile access control"));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 64) + 8) + 24))
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = *(id *)(v8 + 48);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v28;
        v47 = 2112;
        v48 = v35;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated media content profile access control for accessories %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      v6 = v35;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v46 = v32;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v5;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate media content profile access control because owner user %@ fetch failed with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __59__HMDHH2Migrator_backingStoreObjectsForAccountsAndDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Getting bso objects for remote account : %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v3, "backingStoreObjectsWithChangeType:version:", 1, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

}

uint64_t __55__HMDHH2Migrator_revertChangesPerformedDuringMigration__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllOperationForAccessoryIdentifier:", a2);
}

void __58__HMDHH2Migrator_rollAccessoryKeysToHH2_hh2ControllerKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "scheduleAccessoryKeyMigration:oldPairingIdentity:hh2PairingIdentity:", v6, v10, *(_QWORD *)(a1 + 48));

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to schedule key roll operation for %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    *a4 = 1;
  }
  objc_autoreleasePoolPop(v7);

}

void __50__HMDHH2Migrator_waitForV5UpdatesToSyncToCloudKit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v5)
  {
    v28 = 0;
    v7 = objc_msgSend(*(id *)(a1 + 32), "waitForCloudKitSyncForProcessingResult:error:", v5, &v28);
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        objc_msgSend(*(id *)(a1 + 32), "v5ModelUpdateFutures");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138543874;
        v30 = v12;
        v31 = 2048;
        v32 = v13;
        v33 = 2048;
        v34 = v15;
        v16 = "%{public}@Finished V5 CloudKit sync for %ld/%lu";
        v17 = v11;
        v18 = OS_LOG_TYPE_INFO;
        v19 = 32;
LABEL_10:
        _os_log_impl(&dword_2218F0000, v17, v18, v16, buf, v19);

      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "v5ModelUpdateFutures");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 138544130;
      v30 = v12;
      v31 = 2048;
      v32 = v26;
      v33 = 2048;
      v34 = v27;
      v35 = 2112;
      v36 = v28;
      v16 = "%{public}@Failed V5 CloudKit sync for %ld/%lu: %@";
      v17 = v11;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 42;
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v8);
    goto LABEL_12;
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "v5ModelUpdateFutures");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v23;
    v31 = 2048;
    v32 = v24;
    v33 = 2048;
    v34 = objc_msgSend(v25, "count");
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed V5 local database sync for %ld/%lu: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v20);
LABEL_12:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __63__HMDHH2Migrator_waitForCloudKitSyncForProcessingResult_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v6 = *(id **)(a1 + 48);
    if (v6)
      objc_storeStrong(v6, a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __45__HMDHH2Migrator_waitForStartupForCloudZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      v12 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud zone startup succeeded for %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone startup failed for %@: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "submitABCEventForFailedMigrationWithReason:withError:", 9, v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "storeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "changes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke_136;
    v15[3] = &unk_24E791FE8;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v16 = v7;
    v17 = v8;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "storeID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring transactions from [%@] as expecting transaction from [%@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __68__HMDHH2Migrator_allObjectIDsFromTransactions_cloudStoreIdentifier___block_invoke_136(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "changeType");
  if (v5 >= 2)
  {
    if (v5 == 2)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v9;
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Delete change detected : %@", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __78__HMDHH2Migrator_didCoreDataPushAllModelsToCloudKit_previousToken_cloudStore___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stopMonitoring");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __44__HMDHH2Migrator_waitForCloudTransformToRun__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id obj;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting cloud transform.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "runTransformWithError:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud transform completed with : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __52__HMDHH2Migrator_waitForCDToExportModelsToCloudKit___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(v2, "coreData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudPrivateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "didCoreDataPushAllModelsToCloudKit:previousToken:cloudStore:", v3, v4, v6);

  return objc_msgSend((id)a1[5], "reset");
}

void __58__HMDHH2Migrator_fixupAssistantAccessControlForUserModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFAccessory, "modelWithModelID:context:error:", v4, v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@FixUp: Failed to find accessory with UUID %@ when migrating assistant access control", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "hapAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_2;
  v4[3] = &unk_24E791F98;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_3;
  v6[3] = &unk_24E791F70;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v6);

}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_4;
  v4[3] = &unk_24E791F48;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);

}

void __58__HMDHH2Migrator__fixupUserAuthorizationDataForUserModel___block_invoke_4(uint64_t a1, void *a2)
{
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
  id v15;

  v15 = a2;
  objc_msgSend(v15, "getCharacteristicDictionaryForMigrationFixup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCharacteristicAuthorizationDataCodingKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    if (!v7)
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, v14);

  }
}

void __60__HMDHH2Migrator__fixupInvalidCharacteristicFormat_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@FixUp: Deleting the characteristic without a format : %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);
  }

}

void __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id obj;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  HMDCastIfModelCDRepresentable(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v7, "cd_currentManagedObjectInContext:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {

  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to create current managed object for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    *a4 = 1;
  }

}

void __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_81(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  int v7;
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
  uint64_t v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id obj;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "shouldIgnoreModel:", v6);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bsoType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v12;
      v36 = 2112;
      v37 = v13;
      v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not migrating [%@.%@] as it is ignored right now.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v35 = v15;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Populating CD object for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    HMDCastIfModelCDRepresentable(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      _HMFPreconditionFailure();
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v20 + 40);
    v21 = objc_msgSend(v17, "cd_updateManagedObjectInContext:error:", v19, &obj);
    objc_storeStrong((id *)(v20 + 40), obj);
    if ((v21 & 1) != 0)
    {
      objc_msgSend(v6, "managedObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v32;
          v36 = 2112;
          v37 = v6;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Nil managed object found for [%@]. Not adding to the migration list", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
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
        objc_msgSend(v6, "bsoType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2112;
        v37 = v27;
        v38 = 2112;
        v39 = v28;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not populate CD version of %@ due to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      *a4 = 1;
    }

  }
}

uint64_t __88__HMDHH2Migrator_populateAndSaveCDModelsFrom_managedObjectContext_hh2ControllerKey_tag___block_invoke_84(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fixupModelForMigration:backingStoreModelObject:hh2ControllerKey:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "parentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v9, "userID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "accessCode");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "accessCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setValue:", v14);

          v15 = v6;
          v13 = v3;
        }
      }
      else
      {
        v13 = v3;
      }

    }
    else
    {
      v13 = v3;
    }

  }
  else
  {
    v13 = v3;
  }

  return v13;
}

uint64_t __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_3(uint64_t a1, void *a2)
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

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("userID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__HMDHH2Migrator_findAndRemoveAllModelsWithInvalidAccessCodes___block_invoke(uint64_t a1, void *a2)
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

id __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v3 && (isKindOfClass & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke_2;
      v17[3] = &unk_24E791C00;
      v18 = v8;
      objc_msgSend(v9, "na_firstObjectPassingTest:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;
      v13 = v12;
      if (v12
        && (objc_msgSend(v12, "privilege"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqual:", &unk_24E96CC38),
            v14,
            v15))
      {
        v5 = v6;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

id __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke_54(uint64_t a1, void *a2)
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

uint64_t __73__HMDHH2Migrator__auditAccessCodesByRemovingIllegalDuplicatesFromModels___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __72__HMDHH2Migrator_migrateHomeData_managedObjectContext_hh2ControllerKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "primaryHomeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v7, "migrateHome:primaryHomeUUID:managedObjectContext:hh2ControllerKey:", v6, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *a4 = 1;
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not migrate home : %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

uint64_t __33__HMDHH2Migrator__fixupUserUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = HMDIsEmptyHome(v4);
  v7 = HMDIsEmptyHome(v5);
  if (!v6 || v7)
  {
    if (v6 || !v7)
    {
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "compare:", v12);

    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __73__HMDHH2Migrator__startMigratingHomeDataFromLocation_usingHH2PairingKey___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "migrateHomeData:managedObjectContext:hh2ControllerKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "reset");
}

uint64_t __40__HMDHH2Migrator_startMigrationIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Initiating migration with user initiated qos", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  result = objc_msgSend(*(id *)(a1 + 32), "startMigrationFromLocation:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)modelsByDroppingEmptyStringAccessCodesOnModels:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_44_206803);
}

+ (id)auditedHomeAccessCodeModelsFromModels:(id)a3 userAccessCodeModelsAndInvites:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_uuid);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke;
  v11[3] = &unk_24E791E18;
  v12 = v6;
  v13 = a1;
  v8 = v6;
  objc_msgSend(v7, "na_reduceWithInitialValue:reducer:", MEMORY[0x24BDBD1A8], v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)userAccessCodeFromModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v5)
  {
    objc_msgSend(v5, "value");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v8)
    {
      v10 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v8, "accessCode");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_12:

  return v10;
}

+ (int64_t)compareUserAccessCodeInModel:(id)a3 withModel:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  int64_t v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && (isKindOfClass & 1) != 0)
  {
    v8 = -1;
  }
  else
  {
    v9 = v6;
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if (v9 && (v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v11 = v9;
      objc_msgSend(v5, "user");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("userID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "user");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("userID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v13, "compare:", v15);
    }
  }

  return v8;
}

+ (id)auditedUserAccessCodeModelsAndInvitesFromModels:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke;
  v9[3] = &__block_descriptor_40_e67_q24__0__HMDBackingStoreModelObject_8__HMDBackingStoreModelObject_16l;
  v9[4] = a1;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_2;
  v8[3] = &__block_descriptor_40_e57___NSArray_24__0__HMDBackingStoreModelObject_8__NSArray_16l;
  v8[4] = a1;
  objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", MEMORY[0x24BDBD1A8], v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)arrayByRemovingElementsInArray:(id)a3 fromArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__HMDHH2Migrator_arrayByRemovingElementsInArray_fromArray___block_invoke;
  v9[3] = &unk_24E791E80;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)shouldIgnoreModel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[13];

  v9[12] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEF0];
  v4 = a3;
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  v9[5] = objc_opt_class();
  v9[6] = objc_opt_class();
  v9[7] = objc_opt_class();
  v9[8] = objc_opt_class();
  v9[9] = objc_opt_class();
  v9[10] = objc_opt_class();
  v9[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v7);

  return (char)v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t162 != -1)
    dispatch_once(&logCategory__hmf_once_t162, &__block_literal_global_154_206771);
  return (id)logCategory__hmf_once_v163;
}

void __29__HMDHH2Migrator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v163;
  logCategory__hmf_once_v163 = v0;

}

id __59__HMDHH2Migrator_arrayByRemovingElementsInArray_fromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

uint64_t __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "compareUserAccessCodeInModel:withModel:", v5, v4);

  return v6;
}

id __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "userAccessCodeFromModel:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_3;
    v28[3] = &__block_descriptor_40_e46___NSString_16__0__HMDBackingStoreModelObject_8l;
    v28[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "na_map:", v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BDD72D8], "doesAccessCode:conflictWithExistingAccessCodes:", v7, v10))
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v14;
        v31 = 2112;
        v32 = v5;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Dropping user access code in model because it conflicts with another. Model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v15 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "user");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("userID"));
          v27 = v18;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v21;
          v31 = 2112;
          v32 = v23;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@userID: %@", buf, 0x16u);

          v18 = v27;
        }

        objc_autoreleasePoolPop(v18);
        objc_msgSend(v17, "setAccessCode:", 0);
        objc_msgSend(v6, "arrayByAddingObject:", v17);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = v6;
      }
      v25 = v24;

    }
    else
    {
      objc_msgSend(v6, "arrayByAddingObject:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v6, "arrayByAddingObject:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

id __66__HMDHH2Migrator_auditedUserAccessCodeModelsAndInvitesFromModels___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "userAccessCodeFromModel:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
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
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "na_map:", &__block_literal_global_70_206799);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke_3;
  v23[3] = &__block_descriptor_40_e46___NSString_16__0__HMDBackingStoreModelObject_8l;
  v12 = *(void **)(a1 + 32);
  v23[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v12, "na_map:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setByAddingObjectsFromSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD72D8], "doesAccessCode:conflictWithExistingAccessCodes:", v7, v15))
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Dropping HMDHomeAccessCodeModel because it conflicts with another. Dropping model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v20 = v6;
  }
  else
  {
    objc_msgSend(v6, "arrayByAddingObject:", v5);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  return v21;
}

id __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "userAccessCodeFromModel:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__HMDHH2Migrator_auditedHomeAccessCodeModelsFromModels_userAccessCodeModelsAndInvites___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

id __65__HMDHH2Migrator_modelsByDroppingEmptyStringAccessCodesOnModels___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  char v24;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "accessCode"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", &stru_24E79DB48),
        v6,
        v7))
  {
    objc_msgSend(v5, "setAccessCode:", 0);
    v8 = v5;
    v9 = v2;
  }
  else
  {
    v10 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12
      && (objc_msgSend(v12, "value"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isEqualToString:", &stru_24E79DB48),
          v13,
          (v14 & 1) != 0))
    {
      v9 = 0;
    }
    else
    {
      v15 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17
        && (objc_msgSend(v17, "value"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isEqualToString:", &stru_24E79DB48),
            v18,
            (v19 & 1) != 0))
      {
        v9 = 0;
      }
      else
      {
        v20 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v22 = v21;

        if (v22
          && (objc_msgSend(v22, "accessCode"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v23, "isEqualToString:", &stru_24E79DB48),
              v23,
              (v24 & 1) != 0))
        {
          v9 = 0;
        }
        else
        {
          v9 = v20;
        }

      }
    }

  }
  return v9;
}

@end
