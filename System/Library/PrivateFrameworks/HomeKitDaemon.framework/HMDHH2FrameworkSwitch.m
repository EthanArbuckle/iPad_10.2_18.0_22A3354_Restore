@implementation HMDHH2FrameworkSwitch

- (HMDHH2FrameworkSwitch)initWithAutoSwitchEnabledWithHomeManager:(id)a3 dataSource:(id)a4 callBeforeFrameworkSwitchCompletionHandler:(id)a5
{
  return -[HMDHH2FrameworkSwitch initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:](self, "initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:", 1, a5, a3, a4);
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchEnabledWithHomeManager:(id)a3 callBeforeFrameworkSwitchCompletionHandler:(id)a4
{
  return -[HMDHH2FrameworkSwitch initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:](self, "initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:", 1, a4, a3, 0);
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchDisabledWithHomeManager:(id)a3
{
  return -[HMDHH2FrameworkSwitch initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:](self, "initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:", 0, 0, a3, 0);
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitchDisabledWithHomeManager:(id)a3 dataSource:(id)a4
{
  return -[HMDHH2FrameworkSwitch initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:](self, "initWithAutoSwitch:callBeforeFrameworkSwitch:homeManager:dataSource:", 0, 0, a3, a4);
}

- (HMDHH2FrameworkSwitch)initWithAutoSwitch:(BOOL)a3 callBeforeFrameworkSwitch:(id)a4 homeManager:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  HMDHH2FrameworkSwitchDefaultDataSource *v12;
  HMDHH2FrameworkSwitch *v13;
  uint64_t v14;
  OS_os_log *logger;
  HMDHH2FrameworkSwitchDefaultDataSource *v16;
  void *v17;
  id blockToBeCalledBeforeSwitchingFramework;
  id v19;
  const char *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *workQueue;
  NAFuture *v24;
  NAFuture *fetchSentinelZoneDidFinishFuture;
  void *v26;
  objc_super v28;

  v10 = a4;
  v11 = a5;
  v12 = (HMDHH2FrameworkSwitchDefaultDataSource *)a6;
  v28.receiver = self;
  v28.super_class = (Class)HMDHH2FrameworkSwitch;
  v13 = -[HMDHH2FrameworkSwitch init](&v28, sel_init);
  if (v13)
  {
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (OS_os_log *)v14;

    v13->_autoFrameworkSwitch = a3;
    objc_storeWeak((id *)&v13->_homeManager, v11);
    v16 = v12;
    if (!v12)
      v16 = objc_alloc_init(HMDHH2FrameworkSwitchDefaultDataSource);
    objc_storeStrong((id *)&v13->_dataSource, v16);
    if (!v12)

    v17 = _Block_copy(v10);
    blockToBeCalledBeforeSwitchingFramework = v13->_blockToBeCalledBeforeSwitchingFramework;
    v13->_blockToBeCalledBeforeSwitchingFramework = v17;

    HMDispatchQueueNameString();
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(v20, v21);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v22;

    v24 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    fetchSentinelZoneDidFinishFuture = v13->_fetchSentinelZoneDidFinishFuture;
    v13->_fetchSentinelZoneDidFinishFuture = v24;

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:selector:name:object:", v13, sel_handleTapToSetupFinished_, CFSTR("TTSU.Finished.NotificationKey"), 0);

    }
    -[HMDHH2FrameworkSwitch createHH2CloudDatabaseAndStartSyncing](v13, "createHH2CloudDatabaseAndStartSyncing");
  }

  return v13;
}

- (void)createHH2CloudDatabaseAndStartSyncing
{
  void *v3;
  HMDHH2FrameworkSwitch *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDHH2FrameworkSwitch *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2FrameworkSwitch autoFrameworkSwitch](v4, "autoFrameworkSwitch");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating the Cloud database to detect HH2 cloud zone & will start sync after that. [Auto Switch: %@]", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = objc_alloc(MEMORY[0x24BDB9038]);
  v9 = (void *)objc_msgSend(v8, "initWithContainerIdentifier:environment:", CFSTR("com.apple.willow.config"), cloudKitContainerEnvironment);
  -[HMDHH2FrameworkSwitch dataSource](v4, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controller:cloudDatabaseWithContainerID:", v4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDHH2FrameworkSwitch setCloudDatabaseToDetectHH2Zone:](v4, "setCloudDatabaseToDetectHH2Zone:", v11);
    -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v4, "cloudDatabaseToDetectHH2Zone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v4);

    -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v4, "cloudDatabaseToDetectHH2Zone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "registerPrivateSubscriptionForExternalRecordType:", 0);

    -[HMDHH2FrameworkSwitch performInitialSyncAndSwitchFrameworkIfRequired](v4, "performInitialSyncAndSwitchFrameworkIfRequired");
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v4;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v18;
      v24 = 2114;
      v25 = v9;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_FAULT, "%{public}@Failed to create cloud database with containerID %{public}@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 2, CFSTR("Failed to create cloud database"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2FrameworkSwitch homeManager](v16, "homeManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentAccessorySetupMetricDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "markSetupEndStage:error:", 9, v19);

  }
}

- (void)performInitialSyncAndSwitchFrameworkIfRequired
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke;
  v2[3] = &unk_24E79BD80;
  v2[4] = self;
  -[HMDHH2FrameworkSwitch performInitialSync:](self, "performInitialSync:", v2);
}

- (void)forceFetchSentinelZone
{
  void *v3;
  HMDHH2FrameworkSwitch *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Force fetching sentinel zone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x24BDB91F8]);
  v8 = (void *)objc_msgSend(v7, "initWithZoneName:ownerName:", CFSTR("HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"), *MEMORY[0x24BDB8E88]);
  v9 = objc_alloc(MEMORY[0x24BE4EC70]);
  -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v4, "cloudDatabaseToDetectHH2Zone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithContainerID:scope:zoneID:", v11, 2, v8);

  -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v4, "cloudDatabaseToDetectHH2Zone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronizeZoneStateForZoneIDs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __47__HMDHH2FrameworkSwitch_forceFetchSentinelZone__block_invoke;
  v17[3] = &unk_24E798920;
  v17[4] = v4;
  v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v17);

}

- (BOOL)waitForHH2SentinelZoneToBeFetchedFromCloud
{
  NSObject *v3;
  void *v4;
  HMDHH2FrameworkSwitch *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMDHH2FrameworkSwitch *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  _QWORD v24[5];
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_group_create();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Waiting for Initial sync to finish... Start", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  dispatch_group_enter(v3);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __67__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeFetchedFromCloud__block_invoke;
  v24[3] = &unk_24E79BCC8;
  v24[4] = v5;
  v8 = v3;
  v25 = v8;
  -[HMDHH2FrameworkSwitch performInitialSync:](v5, "performInitialSync:", v24);
  v9 = dispatch_time(0, 60000000000);
  v10 = dispatch_group_wait(v8, v9);
  v15 = (void *)MEMORY[0x227676638](v10, v11, v12, v13, v14);
  v16 = v5;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      v20 = "%{public}@Could not finish initial sync and timed out.";
      v21 = v18;
      v22 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v21, v22, v20, buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v19;
    v20 = "%{public}@Waiting for Initial sync to finish... End";
    v21 = v18;
    v22 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v15);
  return v10 == 0;
}

- (void)performInitialSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDHH2FrameworkSwitch *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](self, "cloudDatabaseToDetectHH2Zone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](self, "cloudDatabaseToDetectHH2Zone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performInitialCloudSync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(location, self);
    v8 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke;
    v19[3] = &unk_24E78BE40;
    objc_copyWeak(&v21, location);
    v9 = v4;
    v20 = v9;
    v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v19);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke_92;
    v16[3] = &unk_24E797698;
    objc_copyWeak(&v18, location);
    v17 = v9;
    v11 = (id)objc_msgSend(v7, "addFailureBlock:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cloud database is nil. Cannot perform initial sync. (a)", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }

}

- (void)createHH2SentinelZoneWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDHH2FrameworkSwitch *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](self, "cloudDatabaseToDetectHH2Zone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDB91F8]);
    v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"), *MEMORY[0x24BDB8E88]);
    v8 = objc_alloc(MEMORY[0x24BE4EC70]);
    -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](self, "cloudDatabaseToDetectHH2Zone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithContainerID:scope:zoneID:", v10, 2, v7);

    -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](self, "cloudDatabaseToDetectHH2Zone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createPrivateZoneWithID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke;
    v24[3] = &unk_24E78BE68;
    v15 = v4;
    v25 = v15;
    v16 = (id)objc_msgSend(v13, "addSuccessBlock:", v24);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke_2;
    v22[3] = &unk_24E79A050;
    v23 = v15;
    v17 = (id)objc_msgSend(v13, "addFailureBlock:", v22);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cloud database is nil. Cannot perform initial sync. (b)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }

}

- (BOOL)waitForHH2SentinelZoneToBeCreated:(double)a3 error:(id *)a4
{
  void *v7;
  HMDHH2FrameworkSwitch *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  intptr_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDHH2FrameworkSwitch *v19;
  NSObject *v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v24;
  HMDHH2FrameworkSwitch *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  NSObject *v37;
  __int128 *p_buf;
  uint8_t v39[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x227676638](self, a2);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Going to create sentinel Zone", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__169631;
  v46 = __Block_byref_object_dispose__169632;
  v47 = 0;
  v33 = MEMORY[0x24BDAC760];
  v34 = 3221225472;
  v35 = __65__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeCreated_error___block_invoke;
  v36 = &unk_24E78BE90;
  v12 = v11;
  v37 = v12;
  p_buf = &buf;
  -[HMDHH2FrameworkSwitch createHH2SentinelZoneWithCompletionHandler:](v8, "createHH2SentinelZoneWithCompletionHandler:", &v33);
  v13 = dispatch_time(0, (unint64_t)a3);
  v14 = dispatch_group_wait(v12, v13);
  if (v14)
  {
    v18 = (void *)MEMORY[0x227676638](v14, v15, v16, v17);
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v39 = 138543362;
      v40 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Timed out while creating the HH2 sentinel zone.", v39, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8, v33, v34, v35, v36);
      v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v29 = 0;
      *a4 = v22;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;
  v24 = (void *)MEMORY[0x227676638](0, v15, v16, v17);
  v25 = v8;
  if (!v23)
  {
    HMFGetOSLogHandle();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v39 = 138543618;
      v40 = v27;
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to create Sentinel zone due to %@", v39, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    if (a4)
    {
      v22 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      goto LABEL_13;
    }
LABEL_14:
    v29 = 0;
    goto LABEL_18;
  }
  HMFGetOSLogHandle();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v39 = 138543362;
    v40 = v31;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully created sentinel Zone", v39, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  v29 = 1;
LABEL_18:

  _Block_object_dispose(&buf, 8);
  return v29;
}

- (BOOL)checkExistenceOfHH2SentinelZone
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](self, "cloudDatabaseToDetectHH2Zone", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateZoneIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "zoneID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoneName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"));

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  objc_autoreleasePoolPop(v3);
  return v13;
}

- (void)cloudDatabase:(id)a3 didCreateZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMDHH2FrameworkSwitch *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"));

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@created / synced HH2 sentinel zone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDHH2FrameworkSwitch workQueue](v12, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HMDHH2FrameworkSwitch_cloudDatabase_didCreateZoneWithID___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v12;
    dispatch_async(v15, block);

  }
}

- (void)makeSureWeAreRunningInRightEnvironment:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDHH2FrameworkSwitch workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__HMDHH2FrameworkSwitch_makeSureWeAreRunningInRightEnvironment___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_makeSureWeAreRunningInRightEnvironment:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHH2FrameworkSwitch *v8;
  NSObject *v9;
  void *v10;
  NSObject *logger;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDHH2FrameworkSwitch *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2FrameworkSwitch workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDHH2FrameworkSwitch autoFrameworkSwitch](self, "autoFrameworkSwitch"))
  {
    -[HMDHH2FrameworkSwitch homeManager](self, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[HMDHH2FrameworkSwitch _areWeRunningInRightEnvironment:](self, "_areWeRunningInRightEnvironment:", v3))
    {
      if (v3 || -[HMDHH2FrameworkSwitch checkExistenceOfHH2SentinelZone](self, "checkExistenceOfHH2SentinelZone"))
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v10;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sentinel zone exist which mean we should be running HH2 world. Relaunching ourselves in HH2 world", (uint8_t *)&v20, 0xCu);

        }
        objc_autoreleasePoolPop(v7);
        logger = v8->_logger;
        if (os_signpost_enabled(logger))
        {
          LOWORD(v20) = 0;
          _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReadyToSwitchToHH2", ", (uint8_t *)&v20, 2u);
        }
        objc_msgSend(v6, "currentAccessorySetupMetricDispatcher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "markSetupEndStage:error:", 9, 0);

        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      v18 = (void *)objc_opt_class();
      -[HMDHH2FrameworkSwitch blockToBeCalledBeforeSwitchingFramework](self, "blockToBeCalledBeforeSwitchingFramework");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "relaunchHomedAfterSettingEnvironmentTo:blockToExecuteBeforeReLaunch:", v13, v19);

    }
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
      v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Not enforcing HK environment as auto-switch is OFF", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
}

- (BOOL)_areWeRunningInRightEnvironment:(BOOL)a3
{
  void *v5;
  int v6;
  BOOL v7;
  int v8;
  unint64_t v9;
  void *v10;
  HMDHH2FrameworkSwitch *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  void *v19;
  HMDHH2FrameworkSwitch *v20;
  NSObject *v21;
  void *v22;
  int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2FrameworkSwitch dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = a3 || -[HMDHH2FrameworkSwitch checkExistenceOfHH2SentinelZone](self, "checkExistenceOfHH2SentinelZone");
    v8 = objc_msgSend(v5, "isHH2Enabled");
    v9 = objc_msgSend(v5, "setupMode");
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v6;
      if (v9 > 2)
        v16 = CFSTR("Unexpected mode read");
      else
        v16 = off_24E780150[v9];
      v17 = v16;
      *(_DWORD *)buf = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Going to check our current environment: [doesSentinelZoneExist = %@] [current User HK Preference = %@] [setupMode = %@]", buf, 0x2Au);

      v6 = v24;
    }

    objc_autoreleasePoolPop(v10);
    v18 = v8 ^ 1;
    if (v9 != 1)
      v18 = 1;
    v7 = 1;
    if (v18 == 1 && v6 != v8)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v11;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Looks like we are in wrong world. Let's make things right.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)waitForHH2SentinelZoneToBeRemoved
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  NSObject *v6;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeRemoved__block_invoke;
  v5[3] = &unk_24E79BCC8;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[HMDHH2FrameworkSwitch removeHH2SentinelZoneWithCompletion:](self, "removeHH2SentinelZoneWithCompletion:", v5);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)removeHH2SentinelZoneWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  HMDHH2FrameworkSwitch *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void (**v17)(id, void *);
  id v18;
  id v19;
  void *v20;
  HMDHH2FrameworkSwitch *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHH2FrameworkSwitch *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(id, void *);
  id v30;
  _QWORD v31[4];
  void (**v32)(id, void *);
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Request to remove HH2 sentinel zone received", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v6, "cloudDatabaseToDetectHH2Zone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v6;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cloud database is nil. Cannot perform initial sync. (c)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, v13);
  }
  else
  {
    -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v6, "cloudDatabaseToDetectHH2Zone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "privateZoneIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_169650);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDHH2FrameworkSwitch cloudDatabaseToDetectHH2Zone](v6, "cloudDatabaseToDetectHH2Zone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removePrivateZoneWithID:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, v6);
      v16 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_94;
      v31[3] = &unk_24E78BE40;
      objc_copyWeak(&v33, (id *)buf);
      v17 = v4;
      v32 = v17;
      v18 = (id)objc_msgSend(v15, "addSuccessBlock:", v31);
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_97;
      v28[3] = &unk_24E797698;
      objc_copyWeak(&v30, (id *)buf);
      v29 = v17;
      v19 = (id)objc_msgSend(v15, "addFailureBlock:", v28);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v6;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@HH2 Sentinel zone does not exist", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v4[2](v4, v15);
    }

  }
}

- (void)_clearSetupModeIfNeeded
{
  NSObject *v2;

  -[HMDHH2FrameworkSwitch workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

}

- (void)switchToHH2AndRelaunchHomedToPerformHH2Migration
{
  void *v3;
  HMDHH2FrameworkSwitch *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Switching to HH2 framework and relaunching homed in order to perform HH2 migration", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHH2FrameworkSwitch switchToHH2AfterPerformingHH2PreRebootTask](v4, "switchToHH2AfterPerformingHH2PreRebootTask");
}

- (void)switchToHH2AfterPerformingHH2PreRebootTask
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  -[HMDHH2FrameworkSwitch blockToBeCalledBeforeSwitchingFramework](self, "blockToBeCalledBeforeSwitchingFramework");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relaunchHomedAfterSettingEnvironmentTo:blockToExecuteBeforeReLaunch:", 1, v4);

}

- (BOOL)switchToSetupMode:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  HMDHH2FrameworkSwitch *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDHH2FrameworkSwitch *v12;
  NSObject *v13;
  void *v14;
  CFIndex AppIntegerValue;
  BOOL v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDHH2FrameworkSwitch dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setupMode");

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v10;
    v22 = 2048;
    v23 = a3;
    v24 = 2048;
    v25 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Switching to setup mode: %lu, current mode: %lu", (uint8_t *)&v20, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6 == a3 || a3 == 2 && !v6)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Already in requested setup mode", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    return 1;
  }
  else
  {
    LOBYTE(v20) = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("HHTTSUMode"), CFSTR("com.apple.homed"), (Boolean *)&v20);
    if ((_BYTE)v20)
      v17 = AppIntegerValue == 0;
    else
      v17 = 1;
    v18 = v17;
    if (a3 != 2 || (v18 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(CFSTR("HHTTSUMode"), v19, CFSTR("com.apple.homed"));

    }
    objc_msgSend((id)objc_opt_class(), "relaunchHomedAfterSettingEnvironmentTo:blockToExecuteBeforeReLaunch:", a3 == 1, 0);
    return 0;
  }
}

- (int64_t)areCloudKitServersReachableWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDHH2FrameworkSwitch *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  intptr_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  HMDHH2FrameworkSwitch *v23;
  NSObject *v24;
  void *v25;
  int64_t v26;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  HMDHH2FrameworkSwitch *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  HMDHH2FrameworkSwitch *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDHH2FrameworkSwitch *v46;
  NSObject *v47;
  void *v48;
  BOOL v49;
  void *v50;
  HMDHH2FrameworkSwitch *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  HMDHH2FrameworkSwitch *v55;
  NSObject *v56;
  void *v57;
  HMDHH2FrameworkSwitch *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  _QWORD v62[5];
  NSObject *v63;
  __int128 *p_buf;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t v80[4];
  void *v81;
  __int16 v82;
  uint64_t v83;
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc(MEMORY[0x24BDB9038]);
  v6 = (void *)objc_msgSend(v5, "initWithContainerIdentifier:environment:", CFSTR("com.apple.homekit.config"), cloudKitContainerEnvironment);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setUseZoneWidePCS:", 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:options:", v6, v7);
  v9 = dispatch_group_create();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Waiting to check whether CloudKit is reachable or not... Start", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  dispatch_group_enter(v9);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__169631;
  v87 = __Block_byref_object_dispose__169632;
  v88 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __62__HMDHH2FrameworkSwitch_areCloudKitServersReachableWithError___block_invoke;
  v62[3] = &unk_24E78BF88;
  v62[4] = v11;
  p_buf = &buf;
  v65 = &v76;
  v66 = &v72;
  v67 = &v68;
  v14 = v9;
  v63 = v14;
  objc_msgSend(v8, "accountInfoWithCompletionHandler:", v62);
  v15 = dispatch_time(0, 60000000000);
  v16 = dispatch_group_wait(v14, v15);
  v17 = v16 == 0;
  v22 = (void *)MEMORY[0x227676638](v16, v18, v19, v20, v21);
  v23 = v11;
  if (!v17)
  {
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v80 = 138543362;
      v81 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Fetching the CK account info operation timed out.", v80, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
LABEL_7:
    v26 = 0;
    goto LABEL_8;
  }
  HMFGetOSLogHandle();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v80 = 138543362;
    v81 = v29;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Waiting to check whether CloudKit is reachable or not... End", v80, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  v35 = v77[3];
  if (!v35 || *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v36 = (void *)MEMORY[0x227676638](v30, v31, v32, v33, v34);
    v37 = v23;
    HMFGetOSLogHandle();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v80 = 138543618;
      v81 = v39;
      v82 = 2112;
      v83 = v40;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@CK account fetch info resulted into error : %@", v80, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    if (a3)
    {
      v26 = 0;
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  switch(v35)
  {
    case 1:
      if (*((_BYTE *)v73 + 24))
        goto LABEL_19;
      v54 = (void *)MEMORY[0x227676638](v30, v31, v32, v33, v34);
      v55 = v23;
      HMFGetOSLogHandle();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543362;
        v81 = v57;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@CK account status available but need to verify terms", v80, 0xCu);

      }
      goto LABEL_35;
    case 2:
      v41 = (void *)MEMORY[0x227676638](v30, v31, v32, v33, v34);
      v42 = v23;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543362;
        v81 = v44;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@CK account status is restricted", v80, 0xCu);

      }
      objc_autoreleasePoolPop(v41);
      v26 = 2;
      break;
    case 3:
      v45 = (void *)MEMORY[0x227676638](v30, v31, v32, v33, v34);
      v46 = v23;
      HMFGetOSLogHandle();
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543362;
        v81 = v48;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@CK account status is not signed in", v80, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      v26 = 3;
      break;
    case 4:
      if (*((_BYTE *)v73 + 24))
      {
        v49 = *((_BYTE *)v69 + 24) == 0;
        v50 = (void *)MEMORY[0x227676638](v30, v31, v32, v33, v34);
        v51 = v23;
        if (v49)
        {
          HMFGetOSLogHandle();
          v60 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v80 = 138543362;
            v81 = v61;
            _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@CK account status is temporarily unavailable", v80, 0xCu);

          }
          objc_autoreleasePoolPop(v50);
          v26 = 4;
        }
        else
        {
          HMFGetOSLogHandle();
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v80 = 138543362;
            v81 = v53;
            _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@CK account status is need to verify terms", v80, 0xCu);

          }
          objc_autoreleasePoolPop(v50);
          v26 = 6;
        }
      }
      else
      {
        v54 = (void *)MEMORY[0x227676638](v30, v31, v32, v33, v34);
        v58 = v23;
        HMFGetOSLogHandle();
        v56 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v80 = 138543362;
          v81 = v59;
          _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@CK account status is invalid credentials", v80, 0xCu);

        }
LABEL_35:

        objc_autoreleasePoolPop(v54);
        v26 = 5;
      }
      break;
    default:
LABEL_19:
      v26 = 1;
      break;
  }
LABEL_8:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&buf, 8);

  return v26;
}

- (void)waitForCloudKitAccountToBeAvailable
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHH2FrameworkSwitch workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleTapToSetupFinished:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHH2FrameworkSwitch *v9;

  v4 = a3;
  -[HMDHH2FrameworkSwitch workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDHH2FrameworkSwitch_handleTapToSetupFinished___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NAFuture)fetchSentinelZoneDidFinishFuture
{
  return self->_fetchSentinelZoneDidFinishFuture;
}

- (BOOL)autoFrameworkSwitch
{
  return self->_autoFrameworkSwitch;
}

- (void)setAutoFrameworkSwitch:(BOOL)a3
{
  self->_autoFrameworkSwitch = a3;
}

- (BOOL)isTapToSetupOngoing
{
  return self->_isTapToSetupOngoing;
}

- (void)setIsTapToSetupOngoing:(BOOL)a3
{
  self->_isTapToSetupOngoing = a3;
}

- (HMBCloudDatabase)cloudDatabaseToDetectHH2Zone
{
  return self->_cloudDatabaseToDetectHH2Zone;
}

- (void)setCloudDatabaseToDetectHH2Zone:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDatabaseToDetectHH2Zone, a3);
}

- (id)blockToBeCalledBeforeSwitchingFramework
{
  return self->_blockToBeCalledBeforeSwitchingFramework;
}

- (void)setBlockToBeCalledBeforeSwitchingFramework:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDHH2FrameworkSwitchDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong(&self->_blockToBeCalledBeforeSwitchingFramework, 0);
  objc_storeStrong((id *)&self->_cloudDatabaseToDetectHH2Zone, 0);
  objc_storeStrong((id *)&self->_fetchSentinelZoneDidFinishFuture, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __50__HMDHH2FrameworkSwitch_handleTapToSetupFinished___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TTSU.error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Got TTSU finished notification with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring TTSU notification as either this is on a non-tvOS device or TTSU finished with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

void __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Wait for the CloudKit account to be available.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  objc_msgSend(v7, "cloudDatabaseToDetectHH2Zone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waitForAccountAvailability");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *v6);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_116;
  v11[3] = &unk_24E78BFB0;
  v11[4] = *v6;
  objc_copyWeak(&v12, (id *)buf);
  v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Looks like CloudKit account is now available. Performing cloud sync. [%@]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (v6 || !WeakRetained)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v12;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error occurred : %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    objc_msgSend(WeakRetained, "_fastBootToHH2IfRequiredForTTSU");
    objc_msgSend(v12, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_117;
    block[3] = &unk_24E79C240;
    block[4] = v12;
    dispatch_async(v13, block);

  }
}

uint64_t __60__HMDHH2FrameworkSwitch_waitForCloudKitAccountToBeAvailable__block_invoke_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createHH2CloudDatabaseAndStartSyncing");
}

void __62__HMDHH2FrameworkSwitch_areCloudKitServersReachableWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
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
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@CK account fetch info completed with : %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;
  v13 = v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "accountStatus");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v5, "hasValidCredentials");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v5, "needsToVerifyTerms");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    _HMFPreconditionFailure();
  v5 = WeakRetained;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = v5;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@HH2 sentinel zone removed successfully.", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v7, "waitForCloudKitAccountToBeAvailable");
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);

}

void __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    _HMFPreconditionFailure();
  v5 = WeakRetained;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = v5;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to delete HH2 sentinel zone from cloud database.", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v7, "waitForCloudKitAccountToBeAvailable");
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

uint64_t __61__HMDHH2FrameworkSwitch_removeHH2SentinelZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"));

  return v4;
}

void __58__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeRemoved__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@HH2 sentinel zone removal status : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __64__HMDHH2FrameworkSwitch_makeSureWeAreRunningInRightEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeSureWeAreRunningInRightEnvironment:", *(unsigned __int8 *)(a1 + 40));
}

void __59__HMDHH2FrameworkSwitch_cloudDatabase_didCreateZoneWithID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearSetupModeIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_makeSureWeAreRunningInRightEnvironment:", 1);
  logAndPostNotification(CFSTR("HMDHomeManagerHH2SentinelZonePresent"), *(void **)(a1 + 32), 0);
}

void __65__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeCreated_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __68__HMDHH2FrameworkSwitch_createHH2SentinelZoneWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Initial cloud sync finished on HH2 cloud database.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);

}

void __44__HMDHH2FrameworkSwitch_performInitialSync___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to perform initial sync on cloud database to determine sentinel zone.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

void __67__HMDHH2FrameworkSwitch_waitForHH2SentinelZoneToBeFetchedFromCloud__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@HH2 sentinel zone removal status : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __47__HMDHH2FrameworkSwitch_forceFetchSentinelZone__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
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
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Force fetch sentinel zone on HH1 container finished with error: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "makeSureWeAreRunningInRightEnvironment:", 0);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchSentinelZoneDidFinishFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithNoResult");

  }
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentAccessorySetupMetricDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markSetupEndStage:error:", 9, v6);

  }
}

void __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Initial sync on HH1 container finished with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (v3)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not perform initial sync : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v3, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (v13 && objc_msgSend(v3, "code") == 1)
    {
      v14 = dispatch_time(0, 3600000000000);
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke_84;
      block[3] = &unk_24E79C240;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v14, v15, block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "waitForCloudKitAccountToBeAvailable");
    }
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentAccessorySetupMetricDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markSetupEndStage:error:", 9, v3);

  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "autoFrameworkSwitch"))
      goto LABEL_18;
    if (!objc_msgSend(*(id *)(a1 + 32), "checkExistenceOfHH2SentinelZone"))
    {
      objc_msgSend(*(id *)(a1 + 32), "forceFetchSentinelZone");
      goto LABEL_18;
    }
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Skip force fetching sentinel zone from the cloud since it is already in the local database", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 32), "fetchSentinelZoneDidFinishFuture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithNoResult");
  }

LABEL_18:
}

uint64_t __71__HMDHH2FrameworkSwitch_performInitialSyncAndSwitchFrameworkIfRequired__block_invoke_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForCloudKitAccountToBeAvailable");
}

+ (void)setHH2EnablementPreferenceKey:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CFPropertyListRef *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](a1, a2);
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting HH2 preference value to %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!v3)
    v10 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("isHH2Enabled"), *v10, CFSTR("com.apple.homed"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.homed"));
}

+ (void)setHH2SettingsMigrationKey:(BOOL)a3
{
  _BOOL8 v3;
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
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](a1, a2);
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting HH2 settings migration key to %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBool:forKey:", v3, CFSTR("mi.hh2"));

}

+ (void)relaunchHomedAfterSettingEnvironmentTo:(BOOL)a3 blockToExecuteBeforeReLaunch:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[5];
  BOOL v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("HH1");
    if (v4)
      v12 = CFSTR("HH2");
    *(_DWORD *)buf = 138543618;
    v32 = v10;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Going to relaunch homed in : [%@]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke;
  aBlock[3] = &__block_descriptor_41_e5_v8__0l;
  aBlock[4] = v8;
  v30 = v4;
  v14 = _Block_copy(aBlock);
  v15 = v14;
  if (v6)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (__CFString *)_Block_copy(v6);
      *(_DWORD *)buf = 138543618;
      v32 = (uint64_t)v19;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Calling block : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    dispatch_get_global_queue(0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", v21);
    v6[2](v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_106;
    v27[3] = &unk_24E78BF18;
    v28 = v15;
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2_108;
    v25[3] = &unk_24E78BF40;
    v26 = v28;
    v24 = (id)objc_msgSend(v23, "inContext:then:orRecover:", v22, v27, v25);

  }
  else
  {
    (*((void (**)(void *))v14 + 2))(v14);
  }

}

+ (void)switchBackToHH1AndDoNotLaunchDueToPrimaryAccountRemoval
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](a1, a2);
  v4 = a1;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Switching back to HK 1.0 framework as primary account got removed. HomeKitDaemon will not be relaunched.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend((id)objc_opt_class(), "setHH2EnablementPreferenceKey:", 0);
  objc_msgSend((id)objc_opt_class(), "setHH2SettingsMigrationKey:", 0);
}

+ (void)switchBackToHH1AndRelaunchDueToHH2MigrationFailed
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](a1, a2);
  v4 = a1;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Switching back to HK 1.0 framework as migration to HH2 failed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend((id)objc_opt_class(), "switchBackToHH1AndRelaunch");
}

+ (void)switchBackToHH1AndRelaunch
{
  objc_msgSend((id)objc_opt_class(), "setHH2SettingsMigrationKey:", 0);
  objc_msgSend((id)objc_opt_class(), "relaunchHomedAfterSettingEnvironmentTo:blockToExecuteBeforeReLaunch:", 0, 0);
}

+ (void)switchToHH2AndRelaunchHomed
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](a1, a2);
  v4 = a1;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Switching to HH2 framework and relaunching homed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend((id)objc_opt_class(), "relaunchHomedAfterSettingEnvironmentTo:blockToExecuteBeforeReLaunch:", 1, 0);
}

+ (id)errorFromHMDCKAccountStatus:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 2) > 4)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", qword_2226A0E68[a3 - 2], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t46_169709 != -1)
    dispatch_once(&logCategory__hmf_once_t46_169709, &__block_literal_global_110_169710);
  return (id)logCategory__hmf_once_v47_169711;
}

void __36__HMDHH2FrameworkSwitch_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v47_169711;
  logCategory__hmf_once_v47_169711 = v0;

}

void __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = dispatch_time(0, 1000000000);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2;
  v4[3] = &__block_descriptor_41_e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  dispatch_after(v2, v3, v4);

}

uint64_t __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_106(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2_108(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

void __93__HMDHH2FrameworkSwitch_relaunchHomedAfterSettingEnvironmentTo_blockToExecuteBeforeReLaunch___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_opt_class(), "setHH2EnablementPreferenceKey:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)MEMORY[0x227676638](v2);
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@See you on the other side - restarting...", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relaunch");

}

@end
