@implementation HMDCloudManager

- (HMDCloudManager)initWithMessageDispatcher:(id)a3 cloudDataSyncStateFilter:(id)a4 cloudCache:(id)a5 delegate:(id)a6 dataSource:(id)a7 syncManager:(id)a8 logEventSubmitter:(id)a9 callbackQueue:(id)a10
{
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  void *v22;
  HMDCloudManager *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCloudManager *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a4;
  v16 = a5;
  v17 = a6;
  v33 = a7;
  v32 = a8;
  v31 = a9;
  v18 = a10;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = dispatch_queue_create("com.apple.hmd.cksync", v19);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.willow.config"), cloudKitContainerEnvironment);
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CKContainerEnvironmentString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Creating CloudKit container in '%@' environment", buf, 0x16u);

    v17 = v25;
  }

  objc_autoreleasePoolPop(v22);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v21);
  v30 = -[HMDCloudManager initWithMessageDispatcher:cloudDataSyncStateFilter:cloudCache:delegate:dataSource:syncManager:callbackQueue:container:logEventSubmitter:workQueue:](v23, "initWithMessageDispatcher:cloudDataSyncStateFilter:cloudCache:delegate:dataSource:syncManager:callbackQueue:container:logEventSubmitter:workQueue:", v35, v34, v16, v17, v33, v32, v18, v28, v31, v20);

  return v30;
}

- (HMDCloudManager)initWithMessageDispatcher:(id)a3 cloudDataSyncStateFilter:(id)a4 cloudCache:(id)a5 delegate:(id)a6 dataSource:(id)a7 syncManager:(id)a8 callbackQueue:(id)a9 container:(id)a10 logEventSubmitter:(id)a11 workQueue:(id)a12
{
  id v18;
  id v19;
  id v20;
  HMDCloudManager *v21;
  uint64_t v22;
  OS_os_log *logger;
  uint64_t v24;
  CKDatabase *database;
  id v26;
  id v27;
  OS_dispatch_source *retryTimer;
  OS_dispatch_source *pollTimer;
  OS_dispatch_source *controllerKeyPollTimer;
  id cloudDataDeletedNotificationHandler;
  id cloudMetadataDeletedNotificationHandler;
  void *v33;
  void *v34;
  void *v35;
  HMDCloudManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v42 = a4;
  v48 = a4;
  v47 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v46 = a9;
  v45 = a10;
  v44 = a11;
  v43 = a12;
  v50.receiver = self;
  v50.super_class = (Class)HMDCloudManager;
  v21 = -[HMDCloudManager init](&v50, sel_init);
  if (v21)
  {
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    logger = v21->_logger;
    v21->_logger = (OS_os_log *)v22;

    objc_storeStrong((id *)&v21->_workQueue, a12);
    objc_storeStrong((id *)&v21->_container, a10);
    -[CKContainer privateCloudDatabase](v21->_container, "privateCloudDatabase");
    v24 = objc_claimAutoreleasedReturnValue();
    database = v21->_database;
    v21->_database = (CKDatabase *)v24;

    objc_storeStrong((id *)&v21->_cloudCache, a5);
    v21->_cloudHomeDataRecordExists = 0;
    objc_storeStrong((id *)&v21->_clientCallbackQueue, a9);
    objc_storeStrong((id *)&v21->_msgDispatcher, a3);
    v26 = v18;
    objc_storeWeak((id *)&v21->_delegate, v18);
    objc_storeWeak((id *)&v21->_dataSource, v19);
    v27 = v20;
    objc_storeWeak((id *)&v21->_syncManager, v20);
    retryTimer = v21->_retryTimer;
    v21->_retryTimer = 0;

    pollTimer = v21->_pollTimer;
    v21->_pollTimer = 0;

    controllerKeyPollTimer = v21->_controllerKeyPollTimer;
    v21->_controllerKeyPollTimer = 0;

    cloudDataDeletedNotificationHandler = v21->_cloudDataDeletedNotificationHandler;
    v21->_cloudDataDeletedNotificationHandler = 0;

    cloudMetadataDeletedNotificationHandler = v21->_cloudMetadataDeletedNotificationHandler;
    v21->_cloudMetadataDeletedNotificationHandler = 0;

    v21->_keychainSyncEnabled = objc_msgSend(v19, "isKeychainSyncEnabled");
    v21->_firstV3FetchRun = 0;
    v21->_firstDBQueryRun = 0;
    objc_storeStrong((id *)&v21->_cloudDataSyncStateFilter, v42);
    objc_storeStrong((id *)&v21->_logEventSubmitter, a11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v21, sel_resetCloudServerTokenData_, CFSTR("kCloudServerTokenDataResetNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v21, sel_handleKeychainStateChangedNotification_, CFSTR("HMDAppleAccountSettingsKeychainSyncStateUpdatedNotificationKey"), 0);

    v35 = (void *)MEMORY[0x1D17BA0A0](-[HMDCloudManager _registerForProxSetupNotifications](v21, "_registerForProxSetupNotifications"));
    v36 = v21;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKContainer containerIdentifier](v21->_container, "containerIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v38;
      v53 = 2112;
      v54 = v39;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Using %@ as container identifier", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v18 = v26;
    v20 = v27;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDCloudManager;
  -[HMDCloudManager dealloc](&v4, sel_dealloc);
}

- (void)__addCKDatabaseOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCloudManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQualityOfService:", 17);

    -[HMDCloudManager database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperation:", v5);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Operation no specified to submit to database", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)__fetchSubscriptionWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCloudManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  HMDCloudManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C94E60]);
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSubscriptionIDs:", v9);

    objc_msgSend(v10, "operationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __63__HMDCloudManager___fetchSubscriptionWithID_completionHandler___block_invoke;
    v24 = &unk_1E89A96E8;
    v25 = self;
    v12 = v11;
    v26 = v12;
    v27 = v6;
    v28 = v7;
    v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "setFetchSubscriptionCompletionBlock:", &v21));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Start fetching zone subscription with operation ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No subscriptionID specified to fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)__saveSubscription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCloudManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  HMDCloudManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C94F28]);
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v9, 0);

    objc_msgSend(v10, "operationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __56__HMDCloudManager___saveSubscription_completionHandler___block_invoke;
    v24 = &unk_1E89A9710;
    v25 = self;
    v12 = v11;
    v26 = v12;
    v27 = v6;
    v28 = v7;
    v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "setModifySubscriptionsCompletionBlock:", &v21));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Start saving zone subscription with operation ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No subscription specified to save", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)__fetchAllRecordZonesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDCloudManager *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C94E08], "fetchAllRecordZonesOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__HMDCloudManager___fetchAllRecordZonesWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E89ABFF8;
  v13[4] = self;
  v7 = v6;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  v9 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v5, "setFetchRecordZonesCompletionBlock:", v13));
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Start fetching all record zone with operation ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCloudManager __addCKDatabaseOperation:](v10, "__addCKDatabaseOperation:", v5);

}

- (void)__fetchRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCloudManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  HMDCloudManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C94E08]);
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithRecordZoneIDs:", v9);

    objc_msgSend(v10, "operationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __61__HMDCloudManager___fetchRecordZoneWithID_completionHandler___block_invoke;
    v24 = &unk_1E89A96E8;
    v25 = self;
    v12 = v11;
    v26 = v12;
    v27 = v6;
    v28 = v7;
    v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "setFetchRecordZonesCompletionBlock:", &v21));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Start fetching record zone with operation ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No zoneID specified to fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)__saveRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCloudManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  HMDCloudManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C94EF0]);
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v9, 0);

    objc_msgSend(v10, "operationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __54__HMDCloudManager___saveRecordZone_completionHandler___block_invoke;
    v24 = &unk_1E89A9710;
    v25 = self;
    v12 = v11;
    v26 = v12;
    v27 = v6;
    v28 = v7;
    v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", &v21));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Start saving record zone with operation ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No zone specified to create", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)__deleteRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDCloudManager *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__HMDCloudManager___deleteRecordZoneWithID_completionHandler___block_invoke;
    v13[3] = &unk_1E89C0960;
    v14 = v6;
    v15 = v7;
    -[HMDCloudManager __deleteRecordZonesWithIDs:completionHandler:](self, "__deleteRecordZonesWithIDs:completionHandler:", v8, v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@No zoneID specified to delete", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)__deleteRecordZonesWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCloudManager *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94EF0]), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v6);
    objc_msgSend(v8, "operationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__HMDCloudManager___deleteRecordZonesWithIDs_completionHandler___block_invoke;
    v19[3] = &unk_1E89A9738;
    v19[4] = self;
    v10 = v9;
    v20 = v10;
    v21 = v7;
    v11 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v8, "setModifyRecordZonesCompletionBlock:", v19));
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Start deleting record zones with operation ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCloudManager __addCKDatabaseOperation:](v12, "__addCKDatabaseOperation:", v8);

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@No zones specified to delete", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)__deleteRecordWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCloudManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  HMDCloudManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C94F10]);
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithRecordsToSave:recordIDsToDelete:", 0, v9);

    objc_msgSend(v10, "operationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __58__HMDCloudManager___deleteRecordWithID_completionHandler___block_invoke;
    v24 = &unk_1E89A9710;
    v25 = self;
    v12 = v11;
    v26 = v12;
    v27 = v6;
    v28 = v7;
    v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "setModifyRecordsCompletionBlock:", &v21));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Start deleting record with operation ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No recordID specified to delete", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (HMDCloudLegacyZone)legacyZone
{
  void *v2;
  void *v3;

  -[HMDCloudManager cloudCache](self, "cloudCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCloudLegacyZone *)v3;
}

- (BOOL)legacyZoneHasRecordsAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[HMDCloudManager cloudCache](self, "cloudCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRecordsAvailable");

  return v4;
}

- (HMDCloudMetadataZone)metadataZone
{
  void *v2;
  void *v3;

  -[HMDCloudManager cloudCache](self, "cloudCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCloudMetadataZone *)v3;
}

- (HMDCloudHomeManagerZone)homeManagerZone
{
  void *v2;
  void *v3;

  -[HMDCloudManager cloudCache](self, "cloudCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManagerZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCloudHomeManagerZone *)v3;
}

- (void)addHomeZoneName:(id)a3 owner:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HMDCloudManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__HMDCloudManager_addHomeZoneName_owner___block_invoke;
  v11[3] = &unk_1E89BD988;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_addHomeZoneName:(id)a3 owner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCloudManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding home cloud zone %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    -[HMDCloudManager cloudCache](v9, "cloudCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__HMDCloudManager__addHomeZoneName_owner___block_invoke;
    v13[3] = &unk_1E89A9760;
    v13[4] = v9;
    v14 = v6;
    objc_msgSend(v12, "homeZoneWithName:owner:completion:", v14, v7, v13);

  }
}

- (void)removeHomeZoneName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HMDCloudManager_removeHomeZoneName___block_invoke;
  block[3] = &unk_1E89BE218;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeHomeZoneName:(id)a3
{
  id v4;
  void *v5;
  HMDCloudManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing zone %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    -[HMDCloudManager cloudCache](v6, "cloudCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteHomeZoneWithName:", v4);

  }
}

- (void)fetchTransaction:(id)a3 completionHandler:(id)a4
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
  -[HMDCloudManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_fetchTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  HMDCloudManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCloudManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *logger;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  HMDCloudManager *v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  HMDCloudManager *v43;
  NSObject *v44;
  id v45;
  void *v46;
  id *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _BYTE *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _BYTE *v59;
  id v60[2];
  _QWORD aBlock[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67[2];
  _QWORD v68[4];
  id v69;
  id v70[2];
  id location;
  _QWORD block[4];
  id v73;
  uint8_t v74[4];
  id v75;
  __int16 v76;
  void *v77;
  _BYTE buf[24];
  char v79;
  void *v80;
  id v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  v50 = v6;
  objc_msgSend(v6, "cloudZone");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v51)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v51;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching changes from zone %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v49 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
    objc_msgSend(v51, "serverChangeToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setPreviousServerChangeToken:", v12);

    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "previousServerChangeToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "debugDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching data with current server token: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if ((objc_msgSend(v6, "zoneHasNoLocalData") & 1) != 0
      || objc_msgSend(v6, "isHomeManagerTransaction")
      && (objc_msgSend(v6, "doRecordsExistInCache") & 1) == 0)
    {
      objc_msgSend(v49, "setFetchNewestChangesFirst:", 1);
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    logger = v14->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FetchTransaction", ", buf, 2u);
    }
    v23 = objc_alloc(MEMORY[0x1E0C94DE8]);
    objc_msgSend(v51, "zone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "zoneID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "zone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "zoneID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v28;
    v81 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v23, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v26, v29);

    objc_msgSend(v30, "setFetchAllChanges:", 1);
    objc_initWeak(&location, v14);
    v31 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_42;
    v68[3] = &unk_1E89A9788;
    v47 = v70;
    objc_copyWeak(v70, &location);
    v70[1] = (id)0xEEEEB0B5B2B2EEEELL;
    v32 = v50;
    v69 = v32;
    v33 = objc_msgSend(v30, "setRecordChangedBlock:", v68);
    if (v19)
    {
      v34 = (void *)MEMORY[0x1D17BA0A0](v33);
      v35 = v14;
      HMFGetOSLogHandle();
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Ignoring deleted records while fetch zone", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
    }
    else
    {
      v65[0] = v31;
      v65[1] = 3221225472;
      v65[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_45;
      v65[3] = &unk_1E89A97B0;
      objc_copyWeak(v67, &location);
      v67[1] = (id)0xEEEEB0B5B2B2EEEELL;
      v66 = v32;
      objc_msgSend(v30, "setRecordWithIDWasDeletedBlock:", v65, v70);

      objc_destroyWeak(v67);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v79 = 0;
    aBlock[0] = v31;
    aBlock[1] = 3221225472;
    aBlock[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_47;
    aBlock[3] = &unk_1E89A97D8;
    objc_copyWeak(&v64, &location);
    v38 = v48;
    v63 = v38;
    v39 = v32;
    v62 = v39;
    v40 = _Block_copy(aBlock);
    v57[0] = v31;
    v57[1] = 3221225472;
    v57[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_2;
    v57[3] = &unk_1E89A9800;
    objc_copyWeak(v60, &location);
    v60[1] = (id)0xEEEEB0B5B2B2EEEELL;
    v59 = buf;
    v41 = v40;
    v58 = v41;
    objc_msgSend(v30, "setRecordZoneFetchCompletionBlock:", v57);
    v52[0] = v31;
    v52[1] = 3221225472;
    v52[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_52;
    v52[3] = &unk_1E89BE0E0;
    objc_copyWeak(&v56, &location);
    v55 = buf;
    v53 = v39;
    v54 = v38;
    v42 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v30, "setFetchRecordZoneChangesCompletionBlock:", v52));
    v43 = v14;
    HMFGetOSLogHandle();
    v44 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "operationID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v74 = 138543618;
      v75 = v45;
      v76 = 2112;
      v77 = v46;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Fetching record changes operation with ID: %@", v74, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    -[HMDCloudManager __addCKDatabaseOperation:](v43, "__addCKDatabaseOperation:", v30);

    objc_destroyWeak(&v56);
    objc_destroyWeak(v60);

    objc_destroyWeak(&v64);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(v47);
    objc_destroyWeak(&location);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to fetch data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    if (v48)
    {
      -[HMDCloudManager clientCallbackQueue](v8, "clientCallbackQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E89C0870;
      v73 = v48;
      dispatch_async(v21, block);

    }
  }

}

- (void)uploadTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HMDCloudManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke;
  v11[3] = &unk_1E89BC548;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_createZoneAndUploadTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudManager *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(location, self);
    objc_msgSend(v8, "zone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_2;
    v15[3] = &unk_1E89A98A0;
    objc_copyWeak(&v19, location);
    v16 = v8;
    v18 = v7;
    v17 = v6;
    -[HMDCloudManager __saveRecordZone:completionHandler:](self, "__saveRecordZone:completionHandler:", v9, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (v7)
    {
      -[HMDCloudManager clientCallbackQueue](v11, "clientCallbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E89C0870;
      v21 = v7;
      dispatch_async(v14, block);

    }
  }

}

- (void)_verifyZoneHasBeenDeletedTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  HMDCloudManager *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  HMDCloudManager *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 *v30;
  id location;
  _QWORD block[4];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DB0]), "initWithPreviousServerChangeToken:", 0);
    objc_msgSend(v9, "setFetchAllChanges:", 1);
    *(_QWORD *)&v38 = 0;
    *((_QWORD *)&v38 + 1) = &v38;
    v39 = 0x2020000000;
    v40 = 0;
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_2;
    v28[3] = &unk_1E89A9828;
    v11 = v8;
    v29 = v11;
    v30 = &v38;
    objc_msgSend(v9, "setRecordZoneWithIDWasDeletedBlock:", v28);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_3;
    v22[3] = &unk_1E89A9850;
    objc_copyWeak(&v27, &location);
    v23 = v11;
    v25 = v7;
    v26 = &v38;
    v24 = v6;
    v12 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v9, "setFetchDatabaseChangesCompletionBlock:", v22));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "operationID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v15;
      v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Verifying zone was deleted operation: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDCloudManager __addCKDatabaseOperation:](v13, "__addCKDatabaseOperation:", v9);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v38, 8);
    goto LABEL_9;
  }
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 138543362;
    *(_QWORD *)((char *)&v38 + 4) = v20;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to determine if deleted", (uint8_t *)&v38, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  if (v7)
  {
    -[HMDCloudManager clientCallbackQueue](v18, "clientCallbackQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke;
    block[3] = &unk_1E89C0870;
    v33 = v7;
    dispatch_async(v21, block);

    v9 = v33;
LABEL_9:

  }
}

- (void)_checkZoneAndUploadTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  void *v15;
  HMDCloudManager *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(location, self);
    if (objc_msgSend(v6, "shouldDeleteZone"))
    {
      objc_msgSend(v8, "zone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2;
      v25[3] = &unk_1E89A9878;
      v11 = &v29;
      objc_copyWeak(&v29, location);
      v26 = v8;
      v28 = v7;
      v27 = v6;
      -[HMDCloudManager __deleteRecordZoneWithID:completionHandler:](self, "__deleteRecordZoneWithID:completionHandler:", v10, v25);
      v12 = &v26;
      v13 = &v28;
      v14 = &v27;
    }
    else
    {
      if (!objc_msgSend(v6, "shouldCreateZone"))
      {
        -[HMDCloudManager _uploadTransaction:completionHandler:](self, "_uploadTransaction:completionHandler:", v6, v7);
        goto LABEL_12;
      }
      objc_msgSend(v8, "zone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_3;
      v20[3] = &unk_1E89A98A0;
      v11 = &v24;
      objc_copyWeak(&v24, location);
      v21 = v8;
      v22 = v6;
      v23 = v7;
      -[HMDCloudManager __fetchRecordZoneWithID:completionHandler:](self, "__fetchRecordZoneWithID:completionHandler:", v10, v20);
      v12 = &v21;
      v13 = &v22;
      v14 = &v23;
    }

    objc_destroyWeak(v11);
LABEL_12:
    objc_destroyWeak(location);
    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", (uint8_t *)location, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  if (v7)
  {
    -[HMDCloudManager clientCallbackQueue](v16, "clientCallbackQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke;
    block[3] = &unk_1E89C0870;
    v31 = v7;
    dispatch_async(v19, block);

  }
LABEL_13:

}

- (void)_uploadTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *logger;
  void *v10;
  HMDCloudManager *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UploadTransaction", ", buf, 2u);
    }
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_66;
    v15[3] = &unk_1E89A9940;
    objc_copyWeak(v19, (id *)buf);
    v18 = v7;
    v16 = v8;
    v17 = v6;
    v19[1] = (id)0xEEEEB0B5B2B2EEEELL;
    objc_msgSend(v17, "fetchBatchToUpload:", v15);

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (v7)
    {
      -[HMDCloudManager clientCallbackQueue](v11, "clientCallbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E89C0870;
      v21 = v7;
      dispatch_async(v14, block);

    }
  }

}

- (void)removeZonesTransactions:(id)a3 completionHandler:(id)a4
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
  -[HMDCloudManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_removeZonesTransactions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v14;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing zone %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_initWeak((id *)buf, v12);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke;
  v18[3] = &unk_1E89A9878;
  objc_copyWeak(&v22, (id *)buf);
  v15 = v10;
  v19 = v15;
  v16 = v7;
  v21 = v16;
  v17 = v6;
  v20 = v17;
  -[HMDCloudManager __deleteRecordZoneWithID:completionHandler:](v12, "__deleteRecordZoneWithID:completionHandler:", v15, v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

- (void)uploadLegacyTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HMDCloudManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke;
  v11[3] = &unk_1E89BC548;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_uploadLegacyTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDCloudManager *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2;
    v14[3] = &unk_1E89A99B8;
    objc_copyWeak(&v18, location);
    v17 = v7;
    v15 = v8;
    v16 = v6;
    objc_msgSend(v16, "fetchBatchToUpload:", v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (v7)
    {
      -[HMDCloudManager clientCallbackQueue](v10, "clientCallbackQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E89C0870;
      v20 = v7;
      dispatch_async(v13, block);

    }
  }

}

- (void)_fetchAndVerifyZoneRootRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  HMDCloudTransaction *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMDCloudTransaction *v13;
  void *v14;
  HMDCloudManager *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  HMDCloudManager *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  HMDCloudManager *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id *v29;
  id *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  HMDCloudTransaction *v34;
  id v35;
  _BYTE *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  HMDCloudTransaction *v40;
  _BYTE *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  _QWORD v46[4];
  id v47;
  _QWORD block[4];
  HMDCloudTransaction *v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[24];
  char v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  if (v6)
  {
    v7 = -[HMDCloudTransaction initWithType:temporaryCache:]([HMDCloudTransaction alloc], "initWithType:temporaryCache:", 3, 1);
    -[HMDCloudTransaction updateCloudZone:](v7, "updateCloudZone:", v6);
    -[HMDCloudTransaction privateZoneRootRecordID](v7, "privateZoneRootRecordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0C94E18]);
      v56[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithRecordIDs:", v10);

      *(_QWORD *)v54 = 0;
      *(_QWORD *)&v54[8] = v54;
      *(_QWORD *)&v54[16] = 0x2020000000;
      v55 = 0;
      objc_initWeak(&location, self);
      v12 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_2;
      v43[3] = &unk_1E89A99E0;
      v30 = &v44;
      objc_copyWeak(&v44, &location);
      objc_msgSend(v11, "setPerRecordProgressBlock:", v43);
      v38[0] = v12;
      v38[1] = 3221225472;
      v38[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_94;
      v38[3] = &unk_1E89A9A08;
      v29 = &v42;
      objc_copyWeak(&v42, &location);
      v39 = v8;
      v41 = v54;
      v13 = v7;
      v40 = v13;
      objc_msgSend(v11, "setPerRecordCompletionBlock:", v38);
      v32[0] = v12;
      v32[1] = 3221225472;
      v32[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_96;
      v32[3] = &unk_1E89A9A30;
      objc_copyWeak(&v37, &location);
      v33 = v6;
      v35 = v31;
      v36 = v54;
      v34 = v13;
      v14 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v11, "setFetchRecordsCompletionBlock:", v32));
      v15 = self;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "operationID", &v42, &v44);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v17;
        v52 = 2112;
        v53 = v18;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Fetching zone root record operation with ID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMDCloudManager __addCKDatabaseOperation:](v15, "__addCKDatabaseOperation:", v11);

      objc_destroyWeak(&v37);
      objc_destroyWeak(v29);
      objc_destroyWeak(v30);
      objc_destroyWeak(&location);
      _Block_object_dispose(v54, 8);
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v54 = 138543618;
        *(_QWORD *)&v54[4] = v27;
        *(_WORD *)&v54[12] = 2112;
        *(_QWORD *)&v54[14] = v6;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine root record for zone %@", v54, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      if (!v31)
        goto LABEL_15;
      -[HMDCloudManager clientCallbackQueue](v25, "clientCallbackQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_91;
      v46[3] = &unk_1E89C0870;
      v47 = v31;
      dispatch_async(v28, v46);

      v11 = v47;
    }

LABEL_15:
    goto LABEL_16;
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v54 = 138543362;
    *(_QWORD *)&v54[4] = v22;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone need to be specified to verify root record", v54, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  if (v31)
  {
    -[HMDCloudManager clientCallbackQueue](v20, "clientCallbackQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke;
    block[3] = &unk_1E89C0870;
    v49 = (HMDCloudTransaction *)v31;
    dispatch_async(v23, block);

    v7 = v49;
LABEL_16:

  }
}

- (void)resetCloudDataAndDeleteMetadataForCurrentAccount:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[HMDCloudManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke;
  v9[3] = &unk_1E89A9A58;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_removeAllHomeZonesCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
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

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCloudManager cloudCache](self, "cloudCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allHomeZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "zone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "zoneID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v17;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing zones %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_initWeak((id *)buf, v15);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke;
  v19[3] = &unk_1E89BC028;
  objc_copyWeak(&v21, (id *)buf);
  v18 = v4;
  v20 = v18;
  -[HMDCloudManager __deleteRecordZonesWithIDs:completionHandler:](v15, "__deleteRecordZonesWithIDs:completionHandler:", v7, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

- (void)verifyAndRemoveZone:(id)a3 completionHandler:(id)a4
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
  -[HMDCloudManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDCloudManager_verifyAndRemoveZone_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_verifyAndRemoveZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDCloudManager *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Verifying zone after controller key change: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_initWeak((id *)buf, v10);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_108;
    v14[3] = &unk_1E89A9AA8;
    objc_copyWeak(&v17, (id *)buf);
    v15 = v6;
    v16 = v8;
    -[HMDCloudManager _fetchAndVerifyZoneRootRecord:completionHandler:](v10, "_fetchAndVerifyZoneRootRecord:completionHandler:", v15, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    -[HMDCloudManager clientCallbackQueue](self, "clientCallbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke;
    block[3] = &unk_1E89C0870;
    v19 = v8;
    dispatch_async(v13, block);

  }
}

- (void)_verifyAndRemoveAllHomeZonesCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id obj;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  -[HMDCloudManager cloudCache](self, "cloudCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHomeZones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__39198;
  v26[4] = __Block_byref_object_dispose__39199;
  v27 = 0;
  v6 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        dispatch_group_enter(v6);
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke;
        v19[3] = &unk_1E89A9AD0;
        v21 = v26;
        v20 = v6;
        -[HMDCloudManager _verifyAndRemoveZone:completionHandler:](self, "_verifyAndRemoveZone:completionHandler:", v11, v19);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  -[HMDCloudManager clientCallbackQueue](self, "clientCallbackQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke_2;
  block[3] = &unk_1E89BCAA8;
  v17 = v14;
  v18 = v26;
  v13 = v14;
  dispatch_group_notify(v6, v12, block);

  _Block_object_dispose(v26, 8);
}

- (void)_resetCloudZonesIgnoreHomeManager:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  HMDCloudManager *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[HMDCloudManager accountActive](self, "accountActive");
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing all zones", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_initWeak((id *)buf, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_113;
    v15[3] = &unk_1E89A9AF8;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v6;
    v18 = a3;
    -[HMDCloudManager __fetchAllRecordZonesWithCompletionHandler:](v9, "__fetchAllRecordZonesWithCompletionHandler:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Ignoring request to reset cloud data since there is no active account", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    if (v6)
    {
      -[HMDCloudManager clientCallbackQueue](v9, "clientCallbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke;
      block[3] = &unk_1E89C0870;
      v20 = v6;
      dispatch_async(v14, block);

    }
  }

}

- (void)_resetCloudDataAndDeleteMetadataForCurrentAccount:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
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
  uint64_t v17;
  id v18;
  void *v19;
  HMDCloudManager *v20;
  NSObject *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[5];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _QWORD v35[5];

  v4 = a3;
  v35[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDCloudManager legacyZone](self, "legacyZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeDataRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v9;
  -[HMDCloudManager legacyZone](self, "legacyZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeDataV3RecordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDCloudManager legacyZone](self, "legacyZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metadataRecordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", 0, v13);
  objc_msgSend(v16, "setSavePolicy:", 1);
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke;
  v30[3] = &unk_1E89A9B20;
  v30[4] = self;
  objc_msgSend(v16, "setPerRecordProgressBlock:", v30);
  objc_initWeak(&location, self);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_115;
  v27[3] = &unk_1E89A9B48;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v16, "setPerRecordCompletionBlock:", v27);
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_116;
  v24[3] = &unk_1E89A9B70;
  objc_copyWeak(&v26, &location);
  v18 = v6;
  v25 = v18;
  v19 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v16, "setModifyRecordsCompletionBlock:", v24));
  v20 = self;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "operationID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    v33 = 2112;
    v34 = v23;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Adding deleting operation with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDCloudManager _stopFetchRetryTimer](v20, "_stopFetchRetryTimer");
  -[HMDCloudManager __addCKDatabaseOperation:](v20, "__addCKDatabaseOperation:", v16);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)resetCloudServerTokenData:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCloudManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDCloudManager_resetCloudServerTokenData___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_resetCloudServerTokenData
{
  void *v3;
  HMDCloudManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Cloud server token has been reset", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudManager legacyZone](v4, "legacyZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerChangeToken:", 0);

  -[HMDCloudManager cloudCache](v4, "cloudCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDatabaseServerChangeToken:", 0);

  -[HMDCloudManager cloudCache](v4, "cloudCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistDatabaseServerChangeToken");

  -[HMDCloudManager _updateServerTokenStatusOnCloudFilter](v4, "_updateServerTokenStatusOnCloudFilter");
}

- (void)resetCloudCache:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HMDCloudManager_resetCloudCache___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_resetCloudCache:(id)a3
{
  id v4;
  void *v5;
  HMDCloudManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud cache has been reset", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCloudManager cloudCache](v6, "cloudCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteAllZones");

  objc_initWeak((id *)buf, v6);
  -[HMDCloudManager cloudCache](v6, "cloudCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__HMDCloudManager__resetCloudCache___block_invoke;
  v12[3] = &unk_1E89BE698;
  objc_copyWeak(&v14, (id *)buf);
  v11 = v4;
  v13 = v11;
  objc_msgSend(v10, "createAndFetchZonesFromBackingStore:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (BOOL)decryptionFailed
{
  void *v2;
  char v3;

  -[HMDCloudManager cloudDataSyncStateFilter](self, "cloudDataSyncStateFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "decryptionFailed");

  return v3;
}

- (NSData)serverTokenData
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__39198;
  v11 = __Block_byref_object_dispose__39199;
  v12 = 0;
  -[HMDCloudManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMDCloudManager_serverTokenData__block_invoke;
  v6[3] = &unk_1E89C0800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

- (id)_serverTokenData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDCloudManager legacyZone](self, "legacyZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverChangeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    -[HMDCloudManager legacyZone](self, "legacyZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverChangeToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)fetchCurrentAccountStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMDCloudManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *logger;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Start query for container account status", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AccountStatus", ", buf, 2u);
  }
  objc_initWeak((id *)buf, v6);
  -[HMDCloudManager container](v6, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E89A9B98;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = (id)0xEEEEB0B5B2B2EEEELL;
  v11 = v4;
  v13 = v11;
  objc_msgSend(v10, "accountStatusWithCompletionHandler:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);

}

- (void)setDataAvailableFromCloudCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCloudManager_setDataAvailableFromCloudCompletionBlock___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setCloudDataDeletedNotificationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDCloudManager_setCloudDataDeletedNotificationBlock___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setCloudMetadataDeletedNotificationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCloudManager_setCloudMetadataDeletedNotificationBlock___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setControllerKeyAvailableNotificationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HMDCloudManager_setControllerKeyAvailableNotificationBlock___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setDataDecryptionFailedCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCloudManager_setDataDecryptionFailedCompletionBlock___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setAccountActiveUpdateCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDCloudManager_setAccountActiveUpdateCallback___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)fetchLegacyTransaction:(id)a3 forceFetch:(BOOL)a4 accountCompletionHandler:(id)a5 dataCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HMDCloudManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke;
  block[3] = &unk_1E89A9BC0;
  v19 = v11;
  v20 = v12;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_async(v13, block);

}

- (void)_fetchLegacyTransaction:(id)a3 forceFetch:(BOOL)a4 accountCompletionHandler:(id)a5 dataCompletionHandler:(id)a6
{
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDCloudManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDCloudManager *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDCloudManager *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void (**v61)(void);
  void *v62;
  id v63;
  void *v64;
  HMDCloudManager *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  BOOL v70;
  HMDCloudManager *val;
  id v72;
  void *v73;
  void (**v74)(void);
  void *v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  void (**v82)(void);
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD *v89;
  id v90;
  _QWORD aBlock[4];
  id v92;
  id v93;
  id v94;
  void (**v95)(void);
  _QWORD *v96;
  _QWORD *v97;
  _BYTE *v98;
  _QWORD *v99;
  _QWORD *v100;
  id v101;
  BOOL v102;
  _QWORD v103[3];
  char v104;
  _QWORD v105[4];
  id v106;
  id v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  id v111;
  _QWORD v112[3];
  char v113;
  _QWORD v114[3];
  char v115;
  _QWORD v116[3];
  char v117;
  _QWORD v118[4];
  id v119;
  id v120;
  _BYTE *v121;
  _QWORD *v122;
  id v123;
  id location;
  _QWORD v125[3];
  char v126;
  uint8_t v127[4];
  id v128;
  __int16 v129;
  void *v130;
  _BYTE buf[24];
  char v132;
  void *v133;
  id v134;
  _QWORD v135[4];

  v8 = a4;
  v135[1] = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v77 = a5;
  v74 = (void (**)(void))a6;
  -[HMDCloudManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyTransferAgent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v73 = v13;
  objc_msgSend(v13, "progressState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Key transfer in progress. Not fetching from the cloud.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 12, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
      (*((void (**)(id, _QWORD, _QWORD, void *))v77 + 2))(v77, 0, 0, v75);
    if (v74)
      v74[2]();
  }
  else
  {
    objc_msgSend(v76, "cloudZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    v75 = v21;
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v21)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        v28 = CFSTR("existing");
        if (!v77)
          v28 = CFSTR("changed");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v28;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Fetching %@ records from cloud", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDCloudManager cloudDataSyncStateFilter](v23, "cloudDataSyncStateFilter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setICloudSwitchStateEnabled:", objc_msgSend(v29, "isiCloudSwitchEnabled"));

      v72 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
      if (v8)
      {
        objc_msgSend(v72, "setPreviousServerChangeToken:", 0);
      }
      else
      {
        -[HMDCloudManager legacyZone](v23, "legacyZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "serverChangeToken");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setPreviousServerChangeToken:", v32);

      }
      objc_msgSend(v72, "previousServerChangeToken");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v33 == 0;

      v34 = (void *)MEMORY[0x1D17BA0A0]();
      val = v23;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "previousServerChangeToken");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v38;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Fetching legacy data with current server token: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      if ((objc_msgSend(v76, "iCloudSwitchStateEnabled") & 1) == 0)
      {
        v39 = (void *)MEMORY[0x1D17BA0A0]();
        v40 = val;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v42;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting desired keys to empty since iCloud Switch is off", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v39);
        objc_msgSend(v72, "setDesiredKeys:", MEMORY[0x1E0C9AA60]);
      }
      v43 = objc_alloc(MEMORY[0x1E0C94DE8]);
      -[HMDCloudManager legacyZone](val, "legacyZone");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "zone");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "zoneID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v135[0] = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudManager legacyZone](val, "legacyZone");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "zone");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "zoneID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = v50;
      v134 = v72;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v43, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v47, v51);

      objc_msgSend(v52, "setFetchAllChanges:", 1);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v132 = 0;
      v125[0] = 0;
      v125[1] = v125;
      v125[2] = 0x2020000000;
      v126 = 0;
      objc_initWeak(&location, val);
      v53 = MEMORY[0x1E0C809B0];
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke;
      v118[3] = &unk_1E89A9BE8;
      objc_copyWeak(&v123, &location);
      v54 = v75;
      v119 = v54;
      v121 = buf;
      v55 = v76;
      v120 = v55;
      v122 = v125;
      objc_msgSend(v52, "setRecordChangedBlock:", v118);
      v116[0] = 0;
      v116[1] = v116;
      v116[2] = 0x2020000000;
      v117 = 0;
      v114[0] = 0;
      v114[1] = v114;
      v114[2] = 0x2020000000;
      v115 = 0;
      v112[0] = 0;
      v112[1] = v112;
      v112[2] = 0x2020000000;
      v113 = 0;
      v105[0] = v53;
      v105[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_129;
      v105[3] = &unk_1E89A9C10;
      v105[1] = 3221225472;
      objc_copyWeak(&v111, &location);
      v56 = v54;
      v106 = v56;
      v108 = v116;
      v109 = v114;
      v110 = v112;
      v57 = v55;
      v107 = v57;
      objc_msgSend(v52, "setRecordWithIDWasDeletedBlock:", v105);
      v103[0] = 0;
      v103[1] = v103;
      v103[2] = 0x2020000000;
      v104 = 0;
      aBlock[0] = v53;
      aBlock[1] = 3221225472;
      aBlock[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_130;
      aBlock[3] = &unk_1E89A9C60;
      objc_copyWeak(&v101, &location);
      v96 = v116;
      v97 = v114;
      v58 = v57;
      v92 = v58;
      v59 = v56;
      v102 = v70;
      v93 = v59;
      v98 = buf;
      v60 = v77;
      v94 = v60;
      v99 = v112;
      v61 = v74;
      v95 = v61;
      v100 = v125;
      v62 = _Block_copy(aBlock);
      v87[0] = v53;
      v87[1] = 3221225472;
      v87[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_137;
      v87[3] = &unk_1E89A9C88;
      objc_copyWeak(&v90, &location);
      v89 = v103;
      v63 = v62;
      v88 = v63;
      objc_msgSend(v52, "setRecordZoneFetchCompletionBlock:", v87);
      v78[0] = v53;
      v78[1] = 3221225472;
      v78[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_138;
      v78[3] = &unk_1E89A9CB0;
      objc_copyWeak(&v86, &location);
      v83 = v103;
      v81 = v60;
      v79 = v58;
      v80 = v59;
      v84 = v112;
      v85 = v116;
      v82 = v61;
      v64 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v52, "setFetchRecordZoneChangesCompletionBlock:", v78));
      v65 = val;
      HMFGetOSLogHandle();
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = v63;
        HMFGetLogIdentifier();
        v68 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "operationID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v127 = 138543618;
        v128 = v68;
        v129 = 2112;
        v130 = v69;
        _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_INFO, "%{public}@[Legacy] Fetching record changes operation with ID: %@", v127, 0x16u);

        v63 = v67;
      }

      objc_autoreleasePoolPop(v64);
      -[HMDCloudManager __addCKDatabaseOperation:](v65, "__addCKDatabaseOperation:", v52);

      objc_destroyWeak(&v86);
      objc_destroyWeak(&v90);

      objc_destroyWeak(&v101);
      _Block_object_dispose(v103, 8);

      objc_destroyWeak(&v111);
      _Block_object_dispose(v112, 8);
      _Block_object_dispose(v114, 8);
      _Block_object_dispose(v116, 8);

      objc_destroyWeak(&v123);
      objc_destroyWeak(&location);
      _Block_object_dispose(v125, 8);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Legacy zone does not exist, cannot fetch", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (v77)
        (*((void (**)(id, _QWORD, _QWORD, id))v77 + 2))(v77, 0, 0, v72);
      if (v74)
        v74[2]();
    }

  }
}

- (BOOL)_processFetchedTransaction:(id)a3
{
  id v4;
  void *v5;
  HMDCloudManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  HMDCloudManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  HMDCloudManager *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDCloudManager *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void (**v54)(void);
  void *v55;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, int, void *);
  void *v60;
  NSObject *v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v64 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received event that home data record has been modified", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCloudManager logEventSubmitter](v6, "logEventSubmitter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDecryptionCompletedLogEvent decryptionCompletedWithFailure:](HMDDecryptionCompletedLogEvent, "decryptionCompletedWithFailure:", -[HMDCloudManager decryptionFailed](v6, "decryptionFailed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitLogEvent:", v10);

  -[HMDCloudManager delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "decryptionFailed"))
  {
    -[HMDCloudManager legacyZone](v6, "legacyZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRecordsAvailable:", 0);

    -[HMDCloudManager dataSource](v6, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "supportsKeyTransferServer"))
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v6;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting to start key transfer because of failed decryption.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v13, "keyTransferAgent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "beginPairingWithCompletionHandler:", 0);

    }
    -[HMDCloudManager legacyZone](v6, "legacyZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverChangeToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v6;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Resetting the server token data to nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDCloudManager _resetCloudServerTokenData](v23, "_resetCloudServerTokenData");
      objc_msgSend(v11, "archiveServerToken:", 0);
    }
    if (objc_msgSend(v4, "iCloudSwitchStateEnabled"))
    {
      -[HMDCloudManager watchdogControllerKeyPollTimer](v6, "watchdogControllerKeyPollTimer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26
        && (+[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "isRunning"),
            v27,
            v26,
            v28))
      {
        -[HMDCloudManager _startControllerKeyPollTimer](v6, "_startControllerKeyPollTimer");
      }
      else
      {
        -[HMDCloudManager currentBackoffTimerValuesInMinutes](v6, "currentBackoffTimerValuesInMinutes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41 == 0;

        if (v42)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCloudManager setCurrentBackoffTimerValuesInMinutes:](v6, "setCurrentBackoffTimerValuesInMinutes:", v43);

          for (i = 0; i != 5; ++i)
          {
            -[HMDCloudManager currentBackoffTimerValuesInMinutes](v6, "currentBackoffTimerValuesInMinutes");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sBackoffTimerValuesInMinutes[i]);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v46);

          }
        }
        -[HMDCloudManager _startControllerKeyPollTimerWithBackoff](v6, "_startControllerKeyPollTimerWithBackoff");
      }
    }
    +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "followUpManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "startAdvertising:", 1);

    v49 = (void *)MEMORY[0x1D17BA0A0]();
    v50 = v6;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v52;
      _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Decryption has failed, updating to cloud data sync filter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v49);
    -[HMDCloudManager dataDecryptionFailedHandler](v50, "dataDecryptionFailedHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      -[HMDCloudManager dataDecryptionFailedHandler](v50, "dataDecryptionFailedHandler");
      v54 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v54[2]();

    }
    -[HMDCloudManager cloudDataSyncStateFilter](v50, "cloudDataSyncStateFilter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDecryptionFailed:", 1);

    LOBYTE(v29) = 0;
  }
  else
  {
    v29 = objc_msgSend(v4, "controllerIdentifierChanged");
    if (v29)
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = v6;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v33;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Controller identifier has changed, erasing local home data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      v34 = dispatch_group_create();
      dispatch_group_enter(v34);
      objc_initWeak((id *)buf, v31);
      -[HMDCloudManager homeManagerZone](v31, "homeManagerZone");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = MEMORY[0x1E0C809B0];
      v58 = 3221225472;
      v59 = __46__HMDCloudManager__processFetchedTransaction___block_invoke;
      v60 = &unk_1E89A9CD8;
      objc_copyWeak(&v62, (id *)buf);
      v36 = v34;
      v61 = v36;
      -[HMDCloudManager _verifyAndRemoveZone:completionHandler:](v31, "_verifyAndRemoveZone:completionHandler:", v35, &v57);

      dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
      objc_destroyWeak(&v62);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      objc_msgSend(v11, "reloadHomeDataFromLocalStore:", 1);
    }
    -[HMDCloudManager setCurrentBackoffTimerValuesInMinutes:](v6, "setCurrentBackoffTimerValuesInMinutes:", 0, v57, v58, v59, v60);
    +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "followUpManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stopAdvertising:", 1);

    if (-[HMDCloudManager decryptionFailed](v6, "decryptionFailed"))
      objc_msgSend(v11, "fetchAllZones");
    -[HMDCloudManager legacyZone](v6, "legacyZone");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setRecordsAvailable:", 1);

    -[HMDCloudManager cloudDataSyncStateFilter](v6, "cloudDataSyncStateFilter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDecryptionFailed:", 0);

    objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ensureControllerKeyExistsForAllViews");
  }

  return v29;
}

- (void)_processFetchCompletedWithError:(id)a3 serverToken:(id)a4 fetchTransaction:(id)a5 migrationOptions:(unint64_t)a6 completionHandler:(id)a7 moreRecordsComing:(BOOL)a8 emptyRecord:(BOOL)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDCloudManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  HMDCloudManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDCloudManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  HMDCloudManager *v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  HMDCloudManager *v55;
  NSObject *v56;
  _BOOL4 v57;
  void *v58;
  const char *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  HMDCloudManager *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  id v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  unint64_t v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD block[4];
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v9 = a8;
  v88 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  objc_msgSend(v17, "cloudZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (!v15)
  {
    if (v9)
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v38;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@More records expected, auto fetch in progress", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
      goto LABEL_47;
    }
    if (!-[HMDCloudManager decryptionFailed](self, "decryptionFailed") && !a9)
    {
LABEL_37:
      -[HMDCloudManager dataSource](self, "dataSource");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v62, "isControllerKeyAvailable") & 1) != 0)
      {

      }
      else
      {
        v63 = -[HMDCloudManager cloudHomeDataRecordExists](self, "cloudHomeDataRecordExists");

        if (v63)
        {
          v64 = (void *)MEMORY[0x1D17BA0A0]();
          v65 = self;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v85 = v67;
            _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_ERROR, "%{public}@We have data in the cloud, but no controller key yet, dropping downloaded record data", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v64);
          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 77, 0);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudManager clientCallbackQueue](v65, "clientCallbackQueue");
            v69 = objc_claimAutoreleasedReturnValue();
            v78[0] = MEMORY[0x1E0C809B0];
            v78[1] = 3221225472;
            v78[2] = __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_143;
            v78[3] = &unk_1E89C1D68;
            v79 = v68;
            v80 = v18;
            v70 = v68;
            dispatch_async(v69, v78);

          }
          goto LABEL_47;
        }
      }
      if (!v18)
        goto LABEL_47;
      -[HMDCloudManager clientCallbackQueue](self, "clientCallbackQueue");
      v71 = objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_2;
      v74[3] = &unk_1E89C01B0;
      v76 = v18;
      v77 = a6;
      v75 = 0;
      dispatch_async(v71, v74);

      v52 = v76;
LABEL_46:

      goto LABEL_47;
    }
    v53 = -[HMDCloudManager decryptionFailed](self, "decryptionFailed", v16);
    v54 = (void *)MEMORY[0x1D17BA0A0]();
    v55 = self;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
    if (v53)
    {
      if (v57)
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v58;
        v59 = "%{public}@Resetting the cloud server token since we failed to decrypt the data";
LABEL_33:
        _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, v59, buf, 0xCu);

      }
    }
    else if (v57)
    {
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v85 = v58;
      v59 = "%{public}@Resetting the cloud server token since iCloud Switch is off";
      goto LABEL_33;
    }

    objc_autoreleasePoolPop(v54);
    if (v21)
    {
      objc_msgSend(v21, "homeDataObjectID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeChangeWithObjectID:", v60);

      objc_msgSend(v21, "homeDataV3ObjectID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeChangeWithObjectID:", v61);

    }
    objc_msgSend(v17, "setUpdatedServerChangeToken:", 0);
    -[HMDCloudManager _resetCloudServerTokenData](v55, "_resetCloudServerTokenData");
    v16 = v73;
    goto LABEL_37;
  }
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v85 = v25;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because legacy fetch failed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  -[HMDCloudManager cloudCache](v23, "cloudCache");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDatabaseServerChangeToken:", 0);

  -[HMDCloudManager cloudCache](v23, "cloudCache");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "persistDatabaseServerChangeToken");

  objc_msgSend(v15, "domain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0C947D8];
  if (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v30 = objc_msgSend(v15, "code");

    if (v30 == 21)
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v23;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v34;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed due to expired token, resetting token and re-fetching", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      -[HMDCloudManager _resetCloudServerTokenData](v32, "_resetCloudServerTokenData");
      -[HMDCloudManager _fetchLegacyTransaction:forceFetch:accountCompletionHandler:dataCompletionHandler:](v32, "_fetchLegacyTransaction:forceFetch:accountCompletionHandler:dataCompletionHandler:", v17, 0, 0, v18);
      goto LABEL_47;
    }
  }
  else
  {

  }
  objc_msgSend(v15, "domain");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "isEqualToString:", v29))
  {
    v40 = -[HMDCloudManager _validFetchRetryCKErrorCode:](v23, "_validFetchRetryCKErrorCode:", objc_msgSend(v15, "code"));

    if (!v18 && v40)
      -[HMDCloudManager _startFetchRetryTimer](v23, "_startFetchRetryTimer");
  }
  else
  {

  }
  v41 = (void *)MEMORY[0x1D17BA0A0]();
  v42 = v23;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmd_conciseCKError");
    v72 = v15;
    v45 = v18;
    v46 = v17;
    v47 = v21;
    v48 = v16;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shortDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v85 = v44;
    v86 = 2112;
    v87 = v50;
    _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed with error: %@", buf, 0x16u);

    v16 = v48;
    v21 = v47;
    v17 = v46;
    v18 = v45;
    v15 = v72;

  }
  objc_autoreleasePoolPop(v41);
  if (v18)
  {
    -[HMDCloudManager clientCallbackQueue](v42, "clientCallbackQueue");
    v51 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke;
    block[3] = &unk_1E89C1D68;
    v83 = v18;
    v82 = v15;
    dispatch_async(v51, block);

    v52 = v83;
    goto LABEL_46;
  }
LABEL_47:

}

- (void)updateAccountStatusChanged:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[HMDCloudManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HMDCloudManager_updateAccountStatusChanged_completionHandler___block_invoke;
  block[3] = &unk_1E89B6038;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleAccountStatus:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  HMDCloudManager *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (a3 == 1)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@iCloud account is available, going to start syncing data from the cloud", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCloudManager _createZoneAndFetchChanges:](v8, "_createZoneAndFetchChanges:", v6);
    -[HMDCloudManager registerForPushNotifications](v8, "registerForPushNotifications");
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@iCloud account status (%tu) is not available", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCloudManager setAccountActive:](v8, "setAccountActive:", 0);
    -[HMDCloudManager _stopFetchPollTimer](v8, "_stopFetchPollTimer");
    -[HMDCloudManager _stopControllerKeyPollTimer](v8, "_stopControllerKeyPollTimer");
    -[HMDCloudManager dataSource](v8, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudManager setKeychainSyncEnabled:](v8, "setKeychainSyncEnabled:", objc_msgSend(v13, "isKeychainSyncEnabled"));

    if (v6)
    {
      -[HMDCloudManager clientCallbackQueue](v8, "clientCallbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__HMDCloudManager__handleAccountStatus_completionHandler___block_invoke;
      block[3] = &unk_1E89C0870;
      v16 = v6;
      dispatch_async(v14, block);

    }
  }

}

- (id)_changeTokenFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDCloudManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (!v5)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive server change token from token data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to decode client Token data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_resetHomeDataRecordState
{
  void *v3;

  -[HMDCloudManager legacyZone](self, "legacyZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecordsAvailable:", 0);

  -[HMDCloudManager setCloudHomeDataRecordExists:](self, "setCloudHomeDataRecordExists:", 0);
  -[HMDCloudManager _stopControllerKeyPollTimer](self, "_stopControllerKeyPollTimer");
}

- (void)_verifyHH2SentinelCloudZoneExist:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *logger;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13[2];
  uint8_t buf[8];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0C95098]);
  v6 = (void *)objc_msgSend(v5, "initWithZoneName:ownerName:", CFSTR("HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71"), *MEMORY[0x1E0C94730]);
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VerifyZone", ", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke;
  v10[3] = &unk_1E89A9D00;
  objc_copyWeak(v13, &location);
  v13[1] = (id)0xEEEEB0B5B2B2EEEELL;
  v8 = v6;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  -[HMDCloudManager __fetchRecordZoneWithID:completionHandler:](self, "__fetchRecordZoneWithID:completionHandler:", v8, v10);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)_verifyZonesExist:(id)a3 zoneIndex:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCloudManager *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *logger;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24[3];
  uint8_t v25[8];
  _QWORD block[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8 && objc_msgSend(v8, "count") - 1 >= a4)
  {
    objc_msgSend(v8, "objectAtIndex:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VerifyZone", ", v25, 2u);
    }
    objc_msgSend(v16, "zone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_150;
    v20[3] = &unk_1E89A9D50;
    objc_copyWeak(v24, (id *)buf);
    v24[1] = (id)0xEEEEB0B5B2B2EEEELL;
    v15 = v16;
    v21 = v15;
    v23 = v9;
    v24[2] = (id)a4;
    v22 = v8;
    -[HMDCloudManager __fetchRecordZoneWithID:completionHandler:](self, "__fetchRecordZoneWithID:completionHandler:", v19, v20);

    objc_destroyWeak(v24);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No cloud zones to process", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if (v9)
  {
    -[HMDCloudManager clientCallbackQueue](v11, "clientCallbackQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke;
    block[3] = &unk_1E89C0870;
    v27 = v9;
    dispatch_async(v14, block);

    v15 = v27;
LABEL_10:

  }
}

- (void)_createZoneAndFetchChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  _QWORD block[4];
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCloudManager _stopControllerKeyPollTimer](self, "_stopControllerKeyPollTimer");
  -[HMDCloudManager _stopFetchRetryTimer](self, "_stopFetchRetryTimer");
  -[HMDCloudManager homeManagerZone](self, "homeManagerZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudManager metadataZone](self, "metadataZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudManager legacyZone](self, "legacyZone");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v8, "serverChangeToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v25[0] = CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5");
      v25[1] = CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_2;
      v18[3] = &unk_1E89BD528;
      objc_copyWeak(&v20, &location);
      v19 = v4;
      objc_msgSend(v8, "cloudRecordWithNames:completionHandler:", v10, v18);

      objc_destroyWeak(&v20);
    }
    else
    {
      v24[0] = v5;
      v24[1] = v6;
      v24[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_5;
      v14[3] = &unk_1E89BB490;
      objc_copyWeak(&v17, &location);
      v16 = v4;
      v13 = v12;
      v15 = v13;
      -[HMDCloudManager _verifyHH2SentinelCloudZoneExist:](self, "_verifyHH2SentinelCloudZoneExist:", v14);

      objc_destroyWeak(&v17);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    -[HMDCloudManager clientCallbackQueue](self, "clientCallbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke;
    block[3] = &unk_1E89C0870;
    v23 = v4;
    dispatch_async(v11, block);

  }
}

- (void)_accountIsActive
{
  void *v3;
  HMDCloudManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Marking account is active", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudManager setAccountActive:](v4, "setAccountActive:", 1);
  -[HMDCloudManager dataSource](v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudManager _handleKeychainSyncStateChanged:](v4, "_handleKeychainSyncStateChanged:", objc_msgSend(v7, "isKeychainSyncEnabled"));

  -[HMDCloudManager _startFetchPollTimer](v4, "_startFetchPollTimer");
  -[HMDCloudManager fetchDatabaseZoneChanges](v4, "fetchDatabaseZoneChanges");
  -[HMDCloudManager legacyZone](v4, "legacyZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudManager _setupSubscriptionForZone:](v4, "_setupSubscriptionForZone:", v8);

  -[HMDCloudManager homeManagerZone](v4, "homeManagerZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudManager _setupSubscriptionForZone:](v4, "_setupSubscriptionForZone:", v9);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDCloudManager cloudCache](v4, "cloudCache", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allHomeZones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[HMDCloudManager _setupSubscriptionForZone:](v4, "_setupSubscriptionForZone:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)setAccountActive:(BOOL)a3
{
  void *v4;
  void (**v5)(id, BOOL);

  self->_accountActive = a3;
  -[HMDCloudManager accountActiveUpdateHandler](self, "accountActiveUpdateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDCloudManager accountActiveUpdateHandler](self, "accountActiveUpdateHandler");
    v5 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self->_accountActive);

  }
}

- (void)updateCloudDataSyncFilterState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HMDCloudManager cloudDataSyncStateFilter](self, "cloudDataSyncStateFilter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCloudDataSyncState:", v3);

}

- (void)_forceCleanCloud:(BOOL)a3 fetchTransaction:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  HMDCloudManager *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  char v27;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "cloudZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v12, "homeDataObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "doesRecordExistInCacheWithObjectID:", v13);

    objc_msgSend(v12, "homeDataV3ObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "doesRecordExistInCacheWithObjectID:", v15);

    objc_initWeak(location, self);
    -[HMDCloudManager homeManagerZone](self, "homeManagerZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke;
    v22[3] = &unk_1E89A9DF0;
    objc_copyWeak(&v25, location);
    v24 = v9;
    v26 = a3;
    v23 = v12;
    v27 = v14 | v16;
    -[HMDCloudManager _fetchAndVerifyZoneRootRecord:completionHandler:](self, "_fetchAndVerifyZoneRootRecord:completionHandler:", v17, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Legacy zone does not exist, cannot process force clean", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (BOOL)_validFetchRetryCKErrorCode:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (void)initializeServerTokenStatusOnCloudFilter
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDCloudManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__HMDCloudManager_initializeServerTokenStatusOnCloudFilter__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateServerTokenStatusOnCloudFilter
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCloudManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDCloudManager_updateServerTokenStatusOnCloudFilter__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_updateServerTokenStatusOnCloudFilter
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[HMDCloudManager legacyZone](self, "legacyZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverChangeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  -[HMDCloudManager cloudDataSyncStateFilter](self, "cloudDataSyncStateFilter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateServerTokenAvailable:", v5);

}

- (void)_startFetchRetryTimer
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  HMDCloudManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD handler[5];
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager retryTimer](self, "retryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDCloudManager workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    -[HMDCloudManager setRetryTimer:](self, "setRetryTimer:", v5);

    -[HMDCloudManager retryTimer](self, "retryTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    objc_initWeak(&location, self);
    -[HMDCloudManager retryTimer](self, "retryTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__HMDCloudManager__startFetchRetryTimer__block_invoke;
    handler[3] = &unk_1E89BE218;
    objc_copyWeak(&v15, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    -[HMDCloudManager retryTimer](self, "retryTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting retry fetch timer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_stopFetchRetryTimer
{
  void *v3;
  void *v4;
  HMDCloudManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager retryTimer](self, "retryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling fetch retry timer", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCloudManager retryTimer](v5, "retryTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[HMDCloudManager setRetryTimer:](v5, "setRetryTimer:", 0);
  }
}

- (void)_startFetchPollTimer
{
  NSObject *v3;
  dispatch_source_t v4;
  uint32_t v5;
  void *v6;
  HMDCloudManager *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  HMDCloudManager *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager _stopFetchPollTimer](self, "_stopFetchPollTimer");
  -[HMDCloudManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  -[HMDCloudManager setPollTimer:](self, "setPollTimer:", v4);

  v5 = arc4random_uniform(0x1C21u);
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v5 + 86400;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    v27 = 2048;
    v28 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Cloud sync initial poll timer set to %lld secs", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCloudManager pollTimer](v7, "pollTimer");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_walltime(0, 1000000000 * v9);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  objc_initWeak(&location, v7);
  -[HMDCloudManager pollTimer](v7, "pollTimer");
  v13 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __39__HMDCloudManager__startFetchPollTimer__block_invoke;
  v22 = &unk_1E89BE3F8;
  objc_copyWeak(&v23, &location);
  dispatch_source_set_event_handler(v13, &v19);

  -[HMDCloudManager pollTimer](v7, "pollTimer", v19, v20, v21, v22);
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v14);

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v7;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting cloud sync poll timer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)_stopFetchPollTimer
{
  void *v3;
  void *v4;
  HMDCloudManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager pollTimer](self, "pollTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling cloud sync poll timer", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCloudManager pollTimer](v5, "pollTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[HMDCloudManager setPollTimer:](v5, "setPollTimer:", 0);
  }
}

- (void)handleKeychainStateChangedNotification:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;

  -[HMDCloudManager dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isKeychainSyncEnabled");

  -[HMDCloudManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCloudManager_handleKeychainStateChangedNotification___block_invoke;
  v7[3] = &unk_1E89C2758;
  v7[4] = self;
  v8 = v5;
  dispatch_async(v6, v7);

}

- (void)_handleKeychainSyncStateChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  HMDCloudManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager setKeychainSyncEnabled:](self, "setKeychainSyncEnabled:");
  if (v3)
  {
    if (-[HMDCloudManager accountActive](self, "accountActive"))
    {
      -[HMDCloudManager dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isControllerKeyAvailable");

      if (v6)
      {
        -[HMDCloudManager _handleControllerKeyAvailable](self, "_handleControllerKeyAvailable");
      }
      else if (-[HMDCloudManager cloudHomeDataRecordExists](self, "cloudHomeDataRecordExists"))
      {
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v14;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Keychain is enabled and data in cloud. We don't have controller key as yet, starting poll timer", (uint8_t *)&v15, 0xCu);

        }
        objc_autoreleasePoolPop(v11);
        -[HMDCloudManager _startControllerKeyPollTimer](v12, "_startControllerKeyPollTimer");
      }
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0](-[HMDCloudManager _stopControllerKeyPollTimer](self, "_stopControllerKeyPollTimer"));
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received message that keychain sync is not available", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (void)_handleControllerKeyAvailable
{
  void *v3;
  HMDCloudManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudManager *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Controller key is available, fetching new changes", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudManager delegate](v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadHomeDataFromLocalStore:", 0);

  -[HMDCloudManager controllerKeyAvailableNotificationHandler](v4, "controllerKeyAvailableNotificationHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Controller key is available, notifying availability", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCloudManager clientCallbackQueue](v10, "clientCallbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    -[HMDCloudManager controllerKeyAvailableNotificationHandler](v10, "controllerKeyAvailableNotificationHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v13, v14);

  }
  -[HMDCloudManager _stopControllerKeyPollTimer](v4, "_stopControllerKeyPollTimer");
  -[HMDCloudManager _stopFetchRetryTimer](v4, "_stopFetchRetryTimer");
  -[HMDCloudManager fetchDatabaseZoneChanges](v4, "fetchDatabaseZoneChanges");
}

- (void)_startWatchdogControllerKeyPollTimer
{
  uint64_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  HMDCloudManager *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager _stopWatchdogControllerKeyPollTimer](self, "_stopWatchdogControllerKeyPollTimer");
  v3 = watchdogControllerKeyPollTimeout;
  -[HMDCloudManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  -[HMDCloudManager setWatchdogControllerKeyPollTimer:](self, "setWatchdogControllerKeyPollTimer:", v5);

  -[HMDCloudManager watchdogControllerKeyPollTimer](self, "watchdogControllerKeyPollTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 1000000000 * v3);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  objc_initWeak(&location, self);
  -[HMDCloudManager watchdogControllerKeyPollTimer](self, "watchdogControllerKeyPollTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __55__HMDCloudManager__startWatchdogControllerKeyPollTimer__block_invoke;
  v17 = &unk_1E89BE3F8;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v8, &v14);

  -[HMDCloudManager watchdogControllerKeyPollTimer](self, "watchdogControllerKeyPollTimer", v14, v15, v16, v17);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting watchdog controller key poll timer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_stopWatchdogControllerKeyPollTimer
{
  void *v3;
  void *v4;
  HMDCloudManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager watchdogControllerKeyPollTimer](self, "watchdogControllerKeyPollTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling watchdog controller key poll timer", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCloudManager watchdogControllerKeyPollTimer](v5, "watchdogControllerKeyPollTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[HMDCloudManager setWatchdogControllerKeyPollTimer:](v5, "setWatchdogControllerKeyPollTimer:", 0);
  }
}

- (void)_startControllerKeyPollTimer
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = controllerKeyPollInterval;
  -[HMDCloudManager watchdogControllerKeyPollTimer](self, "watchdogControllerKeyPollTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = aggressiveControllerKeyPollInterval;
  else
    v5 = v3;
  -[HMDCloudManager _startControllerKeyPollTimerWithValue:](self, "_startControllerKeyPollTimerWithValue:", v5);
}

- (void)_startControllerKeyPollTimerWithBackoff
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCloudManager *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager currentBackoffTimerValuesInMinutes](self, "currentBackoffTimerValuesInMinutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HMDCloudManager currentBackoffTimerValuesInMinutes](self, "currentBackoffTimerValuesInMinutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    -[HMDCloudManager currentBackoffTimerValuesInMinutes](self, "currentBackoffTimerValuesInMinutes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 2)
    {
      -[HMDCloudManager currentBackoffTimerValuesInMinutes](self, "currentBackoffTimerValuesInMinutes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectAtIndex:", 0);

    }
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2048;
      v22 = v7;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting a back off timer with %lld minutes timeout", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCloudManager _startControllerKeyPollTimerWithValue:](v12, "_startControllerKeyPollTimerWithValue:", 60 * v7);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Current back off timer values count is 0?", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }
}

- (void)_startControllerKeyPollTimerWithValue:(int64_t)a3
{
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  _QWORD handler[4];
  id v16[2];
  id location;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager _stopControllerKeyPollTimer](self, "_stopControllerKeyPollTimer");
  -[HMDCloudManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
  -[HMDCloudManager setControllerKeyPollTimer:](self, "setControllerKeyPollTimer:", v6);

  -[HMDCloudManager controllerKeyPollTimer](self, "controllerKeyPollTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  objc_initWeak(&location, self);
  -[HMDCloudManager controllerKeyPollTimer](self, "controllerKeyPollTimer");
  v9 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __57__HMDCloudManager__startControllerKeyPollTimerWithValue___block_invoke;
  handler[3] = &unk_1E89BCF60;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  dispatch_source_set_event_handler(v9, handler);

  -[HMDCloudManager controllerKeyPollTimer](self, "controllerKeyPollTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting controller key poll timer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_stopControllerKeyPollTimer
{
  void *v3;
  void *v4;
  HMDCloudManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDCloudManager controllerKeyPollTimer](self, "controllerKeyPollTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling controller key poll timer", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCloudManager controllerKeyPollTimer](v5, "controllerKeyPollTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[HMDCloudManager setControllerKeyPollTimer:](v5, "setControllerKeyPollTimer:", 0);
  }
}

- (void)_auditProxSetupNotification:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("running"));

  if (v5)
  {
    -[HMDCloudManager _startWatchdogControllerKeyPollTimer](self, "_startWatchdogControllerKeyPollTimer");
    -[HMDCloudManager controllerKeyPollTimer](self, "controllerKeyPollTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HMDCloudManager _stopControllerKeyPollTimer](self, "_stopControllerKeyPollTimer");
      -[HMDCloudManager setCurrentBackoffTimerValuesInMinutes:](self, "setCurrentBackoffTimerValuesInMinutes:", 0);
      -[HMDCloudManager _startControllerKeyPollTimer](self, "_startControllerKeyPollTimer");
      -[HMDCloudManager dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isControllerKeyAvailable");

      if (v8)
        -[HMDCloudManager _handleControllerKeyAvailable](self, "_handleControllerKeyAvailable");
      -[HMDCloudManager cloudDataSyncStateFilter](self, "cloudDataSyncStateFilter");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "kickResetConfigDisplayTimer");

    }
  }
  else
  {
    -[HMDCloudManager _stopWatchdogControllerKeyPollTimer](self, "_stopWatchdogControllerKeyPollTimer");
  }
}

- (void)_registerForProxSetupNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__auditProxSetupNotification_, CFSTR("HMDDeviceSetupManagerUpdatedRunningNotification"), v3);

}

- (void)_setupSubscriptionForZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id inited;
  void *v8;
  HMDCloudManager *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "subscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "subscriptionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      inited = objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1D17BA0A0](inited);
      v9 = self;
      HMFGetOSLogHandle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "subscriptionName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v11;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching subscription with ID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v4, "subscriptionName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke;
      v14[3] = &unk_1E89A9E40;
      objc_copyWeak(&v16, &location);
      v15 = v4;
      -[HMDCloudManager __fetchSubscriptionWithID:completionHandler:](v9, "__fetchSubscriptionWithID:completionHandler:", v13, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }

}

- (void)registerForPushNotifications
{
  void *v3;
  _QWORD v4[5];

  -[HMDCloudManager container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HMDCloudManager_registerForPushNotifications__block_invoke;
  v4[3] = &unk_1E89B86D8;
  v4[4] = self;
  objc_msgSend(v3, "serverPreferredPushEnvironmentWithCompletionHandler:", v4);

}

- (void)_scheduleZoneFetch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMDCloudManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCloudManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  HMDCloudManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  HMDCloudManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudManager legacyZone](self, "legacyZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for legacy zone", (uint8_t *)&v35, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v5, "fetchHomeDataFromCloudWithCloudConflict:withDelay:", 0, 0.0);
    }
    else
    {
      -[HMDCloudManager homeManagerZone](self, "homeManagerZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "zone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "zoneID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "zoneName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", v4);

      if (v23)
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138543362;
          v36 = v27;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for home manager zone", (uint8_t *)&v35, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(v5, "fetchHomeManagerCloudConflict:withDelay:", 0, 0.0);
      }
      else
      {
        -[HMDCloudManager cloudCache](self, "cloudCache");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "homeZoneExists:", v4);

        if (v29)
        {
          v30 = (void *)MEMORY[0x1D17BA0A0]();
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 138543618;
            v36 = v33;
            v37 = 2112;
            v38 = v4;
            _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for home zone %@", (uint8_t *)&v35, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
          objc_msgSend(v5, "fetchHomeFromCloudZone:cloudConflict:withDelay:", v34, 0, 0.0);

        }
      }
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Zone not specified, cannot fetch", (uint8_t *)&v35, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)fetchDatabaseZoneChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *, int);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke;
  v10 = &unk_1E89BCF88;
  objc_copyWeak(&v11, &location);
  v3 = _Block_copy(&v7);
  -[HMDCloudManager dataSource](self, "dataSource", v7, v8, v9, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDatabaseOperationWithBlock:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCloudManager syncManager](self, "syncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)cacheDatabaseServerToken
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCloudManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMDCloudManager_cacheDatabaseServerToken__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_fetchDatabaseZoneChangesCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDCloudManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *logger;
  id v17;
  void *v18;
  HMDCloudManager *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _BYTE *v25;
  id v26[2];
  _QWORD v27[6];
  id location;
  uint8_t v29[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudManager cloudCache](v6, "cloudCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "databaseServerChangeToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching zone changes for the database with %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v11 = objc_alloc(MEMORY[0x1E0C94DB0]);
  -[HMDCloudManager cloudCache](v6, "cloudCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseServerChangeToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithPreviousServerChangeToken:", v13);

  objc_msgSend(v14, "setFetchAllChanges:", 1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__39198;
  v35 = __Block_byref_object_dispose__39199;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke;
  v27[3] = &unk_1E89A9828;
  v27[4] = v6;
  v27[5] = buf;
  objc_msgSend(v14, "setRecordZoneWithIDChangedBlock:", v27);
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DBQuery", ", v29, 2u);
  }
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_185;
  v23[3] = &unk_1E89A9E90;
  objc_copyWeak(v26, &location);
  v26[1] = (id)0xEEEEB0B5B2B2EEEELL;
  v25 = buf;
  v17 = v4;
  v24 = v17;
  v18 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v14, "setFetchDatabaseChangesCompletionBlock:", v23));
  v19 = v6;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "operationID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v29 = 138543618;
    v30 = v21;
    v31 = 2112;
    v32 = v22;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching database zone changes with operation ID: %@", v29, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDCloudManager __addCKDatabaseOperation:](v19, "__addCKDatabaseOperation:", v14);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (void)handler:(id)a3 didReceivePushForTopic:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D28668];
  v6 = a4;
  objc_msgSend(v5, "sharedPowerLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportIncomingCloudPush:", v6);

  -[HMDCloudManager logEventSubmitter](self, "logEventSubmitter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[HMDIncomingCloudPushLogEvent incomingCloudPush:](HMDIncomingCloudPushLogEvent, "incomingCloudPush:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "submitLogEvent:", v8);
}

- (void)handler:(id)a3 didReceiveCKNotification:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _QWORD block[5];

  objc_msgSend(a4, "containerIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudManager container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[HMDCloudManager workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HMDCloudManager_handler_didReceiveCKNotification___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v9, block);

  }
}

- (BOOL)accountActive
{
  return self->_accountActive;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (HMDCloudManagerDelegate)delegate
{
  return (HMDCloudManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCloudManagerDataSource)dataSource
{
  return (HMDCloudManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (HMDCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (void)setCloudCache:(id)a3
{
  objc_storeStrong((id *)&self->_cloudCache, a3);
}

- (HMFMessageDispatcher)configSyncDispatcher
{
  return self->_configSyncDispatcher;
}

- (void)setConfigSyncDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_configSyncDispatcher, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)clientCallbackQueue
{
  return self->_clientCallbackQueue;
}

- (void)setClientCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientCallbackQueue, a3);
}

- (BOOL)cloudHomeDataRecordExists
{
  return self->_cloudHomeDataRecordExists;
}

- (void)setCloudHomeDataRecordExists:(BOOL)a3
{
  self->_cloudHomeDataRecordExists = a3;
}

- (BOOL)keychainSyncEnabled
{
  return self->_keychainSyncEnabled;
}

- (void)setKeychainSyncEnabled:(BOOL)a3
{
  self->_keychainSyncEnabled = a3;
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (OS_dispatch_source)pollTimer
{
  return self->_pollTimer;
}

- (void)setPollTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pollTimer, a3);
}

- (OS_dispatch_source)controllerKeyPollTimer
{
  return self->_controllerKeyPollTimer;
}

- (void)setControllerKeyPollTimer:(id)a3
{
  objc_storeStrong((id *)&self->_controllerKeyPollTimer, a3);
}

- (OS_dispatch_source)watchdogControllerKeyPollTimer
{
  return self->_watchdogControllerKeyPollTimer;
}

- (void)setWatchdogControllerKeyPollTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogControllerKeyPollTimer, a3);
}

- (id)cloudDataDeletedNotificationHandler
{
  return self->_cloudDataDeletedNotificationHandler;
}

- (void)setCloudDataDeletedNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)cloudMetadataDeletedNotificationHandler
{
  return self->_cloudMetadataDeletedNotificationHandler;
}

- (void)setCloudMetadataDeletedNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)controllerKeyAvailableNotificationHandler
{
  return self->_controllerKeyAvailableNotificationHandler;
}

- (void)setControllerKeyAvailableNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (HMDCloudDataSyncStateFilter)cloudDataSyncStateFilter
{
  return self->_cloudDataSyncStateFilter;
}

- (void)setCloudDataSyncStateFilter:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDataSyncStateFilter, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDSyncOperationManager)syncManager
{
  return (HMDSyncOperationManager *)objc_loadWeakRetained((id *)&self->_syncManager);
}

- (void)setSyncManager:(id)a3
{
  objc_storeWeak((id *)&self->_syncManager, a3);
}

- (NSMutableArray)currentBackoffTimerValuesInMinutes
{
  return self->_currentBackoffTimerValuesInMinutes;
}

- (void)setCurrentBackoffTimerValuesInMinutes:(id)a3
{
  objc_storeStrong((id *)&self->_currentBackoffTimerValuesInMinutes, a3);
}

- (id)dataDecryptionFailedHandler
{
  return self->_dataDecryptionFailedHandler;
}

- (void)setDataDecryptionFailedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)accountActiveUpdateHandler
{
  return self->_accountActiveUpdateHandler;
}

- (void)setAccountActiveUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isFirstV3FetchRun
{
  return self->_firstV3FetchRun;
}

- (void)setFirstV3FetchRun:(BOOL)a3
{
  self->_firstV3FetchRun = a3;
}

- (BOOL)isFirstDBQueryRun
{
  return self->_firstDBQueryRun;
}

- (void)setFirstDBQueryRun:(BOOL)a3
{
  self->_firstDBQueryRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountActiveUpdateHandler, 0);
  objc_storeStrong(&self->_dataDecryptionFailedHandler, 0);
  objc_storeStrong((id *)&self->_currentBackoffTimerValuesInMinutes, 0);
  objc_destroyWeak((id *)&self->_syncManager);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_cloudDataSyncStateFilter, 0);
  objc_storeStrong(&self->_controllerKeyAvailableNotificationHandler, 0);
  objc_storeStrong(&self->_cloudMetadataDeletedNotificationHandler, 0);
  objc_storeStrong(&self->_cloudDataDeletedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_watchdogControllerKeyPollTimer, 0);
  objc_storeStrong((id *)&self->_controllerKeyPollTimer, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_clientCallbackQueue, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configSyncDispatcher, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __52__HMDCloudManager_handler_didReceiveCKNotification___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "accountActive");
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Did receive message from push, fetching new changes", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isControllerKeyAvailable") & 1) != 0)
    {

    }
    else
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");

      if (v11)
        objc_msgSend(*(id *)(a1 + 32), "_startControllerKeyPollTimer");
    }
    objc_msgSend(*(id *)(a1 + 32), "_stopFetchRetryTimer");
    objc_msgSend(*(id *)(a1 + 32), "fetchDatabaseZoneChanges");
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Did receive message from push, ignoring since account is not active", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "kickAccountAvailabilityCheck");

  }
}

void __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v5, "zoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scheduleZoneFetch:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);
  }
}

void __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_185(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Completed fetching database zone changes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v10, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_186;
    v18[3] = &unk_1E89A9E68;
    v14 = *(_QWORD *)(a1 + 56);
    v18[4] = v10;
    v23 = v14;
    v15 = v7;
    v16 = *(_QWORD *)(a1 + 40);
    v19 = v15;
    v22 = v16;
    v20 = v6;
    v21 = *(id *)(a1 + 32);
    dispatch_async(v13, v18);

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v7);
  }

}

void __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_186(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  dispatch_time_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id obj;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[3];
  _QWORD v103[3];
  _BYTE v104[128];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  uint64_t v112;
  _BYTE v113[128];
  uint64_t v114;

  v1 = a1;
  v114 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = v2;
  v4 = *(_QWORD *)(v1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v3, OS_SIGNPOST_INTERVAL_END, v4, "DBQuery", ", buf, 2u);
  }

  objc_msgSend(*(id *)(v1 + 40), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v6 = objc_msgSend(*(id *)(v1 + 40), "code");

    if (v6 == 21)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = *(id *)(v1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Database zone change fetch failed due to expired token, resetting token and re-fetching", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(v1 + 32), "cloudCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDatabaseServerChangeToken:", 0);

      objc_msgSend(*(id *)(v1 + 32), "cloudCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistDatabaseServerChangeToken");

      objc_msgSend(*(id *)(v1 + 32), "fetchDatabaseZoneChanges");
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(v1 + 32), "delegate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "legacyZone");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "serverChangeToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Force Scheduling fetch for legacy zone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v91, "fetchHomeDataFromCloudWithCloudConflict:withDelay:", 0, 0.0);
    objc_msgSend(v89, "zone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "containsObject:", v19) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "addObject:", v19);

  }
  objc_msgSend(*(id *)(v1 + 32), "homeManagerZone");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "serverChangeToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Force Scheduling fetch for home manager zone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v91, "fetchHomeManagerCloudConflict:withDelay:", 0, 0.0);
    objc_msgSend(v88, "zone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "zoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "containsObject:", v26) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "addObject:", v26);

  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(*(id *)(v1 + 32), "cloudCache");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allHomeZones");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v28;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
  v93 = v1;
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v99;
    v90 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v99 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_msgSend(v33, "serverChangeToken");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v36 = *(id *)(v1 + 32);
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "zone");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "zoneID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "zoneName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v110 = v38;
            v111 = 2112;
            v112 = (uint64_t)v41;
            _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for home zone %@", buf, 0x16u);

            v1 = v93;
          }

          objc_autoreleasePoolPop(v35);
          v42 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v33, "zone");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "zoneID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "zoneName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v42, "initWithUUIDString:", v45);

          objc_msgSend(v91, "fetchHomeFromCloudZone:cloudConflict:withDelay:", v46, 0, 0.0);
          objc_msgSend(v33, "zone");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "zoneID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "containsObject:", v48) & 1) == 0)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "addObject:", v48);

          v31 = v90;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
    }
    while (v30);
  }

  v49 = (void *)MEMORY[0x1D17BA0A0]();
  v50 = *(id *)(v1 + 32);
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *(_QWORD *)(v1 + 48);
    *(_DWORD *)buf = 138543618;
    v110 = v52;
    v111 = 2112;
    v112 = v53;
    _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Updating databaseServerChangeToken with %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v49);
  v54 = *(_QWORD *)(v1 + 48);
  objc_msgSend(*(id *)(v1 + 32), "cloudCache");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDatabaseServerChangeToken:", v54);

  objc_msgSend(v91, "schedulePostFetch");
  if ((objc_msgSend(*(id *)(v1 + 32), "isFirstDBQueryRun") & 1) == 0)
  {
    objc_msgSend(*(id *)(v1 + 32), "setFirstDBQueryRun:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40);
    objc_msgSend(v89, "zone");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "zoneID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v57) = objc_msgSend(v57, "containsObject:", v59);

    v60 = MEMORY[0x1E0C9AAA0];
    if ((v57 & 1) == 0)
    {
      objc_msgSend(*(id *)(v1 + 32), "setFirstV3FetchRun:", 1);
      v107[0] = CFSTR("HMDCR.stc");
      v107[1] = CFSTR("HMDCR.if");
      v108[0] = v60;
      v108[1] = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v61);

    }
    v62 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40);
    objc_msgSend(v88, "zone");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "zoneID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v62) = objc_msgSend(v62, "containsObject:", v64);

    if ((v62 & 1) == 0)
    {
      v105[0] = CFSTR("HMDCR.id");
      v105[1] = CFSTR("HMDCR.stc");
      v106[0] = CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5");
      v106[1] = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v65);

    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(*(id *)(v1 + 32), "cloudCache");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "allHomeZones");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v95 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          v73 = *(void **)(*(_QWORD *)(*(_QWORD *)(v93 + 64) + 8) + 40);
          objc_msgSend(v72, "zone");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "zoneID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v73) = objc_msgSend(v73, "containsObject:", v75);

          if ((v73 & 1) == 0)
          {
            objc_msgSend(v72, "zone");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "zoneID");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "zoneName");
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            if (v78)
            {
              v102[0] = CFSTR("HMDCR.id");
              v102[1] = CFSTR("HMDCR.stc");
              v103[0] = v78;
              v103[1] = v60;
              v102[2] = CFSTR("HMDCR.if");
              v103[2] = v60;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "addObject:", v79);

            }
          }
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
      }
      while (v69);
    }

    if (objc_msgSend(v56, "count"))
      objc_msgSend(v91, "notifyZonesCloudZoneReady:", v56);

    v1 = v93;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(v1 + 32), "pollTimer");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      v81 = arc4random_uniform(0x1C21u) + 86400;
      v82 = (void *)MEMORY[0x1D17BA0A0]();
      v83 = *(id *)(v1 + 32);
      HMFGetOSLogHandle();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v110 = v85;
        v111 = 2048;
        v112 = v81;
        _os_log_impl(&dword_1CD062000, v84, OS_LOG_TYPE_INFO, "%{public}@Resetting next cloud sync poll timer set to %lld secs since we just fetched", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v82);
      v86 = dispatch_walltime(0, 1000000000 * v81);
      dispatch_source_set_timer(v80, v86, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    }

  }
  v87 = *(_QWORD *)(v1 + 56);
  if (v87)
    (*(void (**)(uint64_t, _QWORD))(v87 + 16))(v87, *(_QWORD *)(v1 + 40));

}

void __43__HMDCloudManager_cacheDatabaseServerToken__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Caching database server token", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "cloudCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistDatabaseServerChangeToken");

}

void __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v7 = a2;
  v8 = a3;
  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke_2;
      v12[3] = &unk_1E89C1D68;
      v12[4] = v9;
      v13 = v7;
      dispatch_async(v11, v12);

    }
    goto LABEL_6;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 23, CFSTR("Operation was cancelled before it could run"), CFSTR("HMDCloudManager cancelled the operation"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
LABEL_6:

  }
}

uint64_t __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDatabaseZoneChangesCompletion:", *(_QWORD *)(a1 + 40));
}

void __47__HMDCloudManager_registerForPushNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HMDCloudManager_registerForPushNotifications__block_invoke_2;
  block[3] = &unk_1E89C20C8;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __47__HMDCloudManager_registerForPushNotifications__block_invoke_2(id *a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id)*MEMORY[0x1E0CFE130];
  if (a1[4])
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = a1[5];
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "hmd_conciseCKError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDCloudManager] Failed to resolve preferred CloudKit environment with error: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
  else if (objc_msgSend(a1[6], "length"))
  {
    v9 = a1[6];

    v2 = v9;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = a1[5];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2112;
    v18 = v2;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Registering APS Connection for preferred environment: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x1E0D32C30], "sharedHandlerForEnvironment:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:forBundleIdentifier:", a1[5], CFSTR("com.apple.willowd"));

}

void __45__HMDCloudManager__setupSubscriptionForZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_2;
    block[3] = &unk_1E89AC020;
    v11 = v6;
    v12 = v5;
    v13 = *(id *)(a1 + 32);
    v14 = v8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
  }

}

void __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(id *)(a1 + 40);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    if (v4)
    {
      objc_msgSend(v4, "subscriptionID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "subscriptionName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if (v7)
      {
        v8 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 48), "setSubscription:", v4));
        v9 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "zone");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "zoneID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "zoneName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v11;
          v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Already have subscription for in zone %@, caching", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        goto LABEL_14;
      }
    }

  }
  v15 = objc_alloc(MEMORY[0x1E0C950B0]);
  objc_msgSend(*(id *)(a1 + 48), "zone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "zoneID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "subscriptionName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v15, "initWithZoneID:subscriptionID:", v17, v18);

  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v22;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Subscription not found, attempting to create one", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  v23 = *(void **)(a1 + 56);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_171;
  v24[3] = &unk_1E89A9E18;
  objc_copyWeak(&v26, (id *)(a1 + 64));
  v25 = *(id *)(a1 + 48);
  objc_msgSend(v23, "__saveSubscription:completionHandler:", v4, v24);

  objc_destroyWeak(&v26);
LABEL_14:

}

void __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  _QWORD block[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmd_conciseCKError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v11;
        v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not modify iCloud subscription: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v9, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_172;
      block[3] = &unk_1E89C2730;
      v15 = &v29;
      v29 = *(id *)(a1 + 32);
      dispatch_async(v14, block);
LABEL_10:

      goto LABEL_11;
    }
    if (v5)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "zoneID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "zoneName");
        v24 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2112;
        v33 = v22;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Registered for push notifications from record zone %@", buf, 0x16u);

        v16 = v24;
      }

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v17, "workQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_173;
      v25[3] = &unk_1E89C2328;
      v15 = &v26;
      v26 = *(id *)(a1 + 32);
      v27 = v5;
      dispatch_async(v23, v25);

      v14 = v27;
      goto LABEL_10;
    }
  }
LABEL_11:

}

uint64_t __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_172(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSubscription:", 0);
}

uint64_t __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_173(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSubscription:", *(_QWORD *)(a1 + 40));
}

void __57__HMDCloudManager__startControllerKeyPollTimerWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Controller key poll timer fired", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(v4, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isControllerKeyAvailable");

    if (v8)
    {
      objc_msgSend(v4, "_handleControllerKeyAvailable");
    }
    else
    {
      v9 = controllerKeyPollInterval;
      objc_msgSend(v4, "watchdogControllerKeyPollTimer");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10
        && (v11 = (void *)v10,
            +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isRunning"),
            v12,
            v11,
            v13))
      {
        v14 = aggressiveControllerKeyPollInterval;
      }
      else if (*(_QWORD *)(a1 + 40) <= v9)
      {
        v14 = v9;
      }
      else
      {
        v14 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend(v4, "controllerKeyPollTimer");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_time(0, 1000000000 * v14);
      dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

    }
  }

}

void __55__HMDCloudManager__startWatchdogControllerKeyPollTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Watchdog controller key poll timer fired", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v3, "_stopWatchdogControllerKeyPollTimer");
  }

}

uint64_t __58__HMDCloudManager_handleKeychainStateChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeychainSyncStateChanged:", *(unsigned __int8 *)(a1 + 40));
}

void __39__HMDCloudManager__startFetchPollTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Cloud sync poll timer fired, fetching any new changes", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v3, "_stopFetchRetryTimer");
    objc_msgSend(v3, "fetchDatabaseZoneChanges");
    v6 = arc4random_uniform(0x1C21u) + 86400;
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = v3;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Next cloud sync poll timer set to %lld secs", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "pollTimer");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_walltime(0, 1000000000 * v6);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  }
}

void __40__HMDCloudManager__startFetchRetryTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetch retry timer fired, fetching any new changes", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "fetchDatabaseZoneChanges");
  }

}

uint64_t __55__HMDCloudManager_updateServerTokenStatusOnCloudFilter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateServerTokenStatusOnCloudFilter");
}

void __59__HMDCloudManager_initializeServerTokenStatusOnCloudFilter__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "legacyZone");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serverChangeToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

    objc_msgSend(v6, "cloudDataSyncStateFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithoutDataSynCheckServerTokenAvailable:", v4);

    WeakRetained = v6;
  }

}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmd_conciseCKError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v11;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine fetch zone information to determine local data should be cleaned %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
        (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v6);
    }
    else if (a2)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_165;
      v21[3] = &unk_1E89BD000;
      objc_copyWeak(&v24, (id *)(a1 + 48));
      v25 = *(_BYTE *)(a1 + 56);
      v22 = *(id *)(a1 + 32);
      v23 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_resetCloudZonesIgnoreHomeManager:completionHandler:", 0, v21);

      objc_destroyWeak(&v24);
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_167;
      v15[3] = &unk_1E89A9DC8;
      objc_copyWeak(&v18, (id *)(a1 + 48));
      v19 = *(_BYTE *)(a1 + 56);
      v16 = *(id *)(a1 + 32);
      v20 = *(_BYTE *)(a1 + 57);
      v17 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_resetCloudZonesIgnoreHomeManager:completionHandler:", 1, v15);

      objc_destroyWeak(&v18);
    }
  }

}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_8;
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "homeDataV3RecordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2;
    v16[3] = &unk_1E89A9D78;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v5, "__deleteRecordWithID:completionHandler:", v15, v16);

    objc_destroyWeak(&v18);
    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "cloudDataDeletedNotificationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = v5;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "clientCallbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudDataDeletedNotificationHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, v12);

    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, 1, v3);
  }
  else
  {
LABEL_8:
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v3);
  }
LABEL_11:

}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_9;
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "homeDataV3RecordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2_168;
    v16[3] = &unk_1E89A9DA0;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    v19 = *(_BYTE *)(a1 + 57);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v5, "__deleteRecordWithID:completionHandler:", v15, v16);

    objc_destroyWeak(&v18);
    goto LABEL_12;
  }
  if (*(_BYTE *)(a1 + 57)
    && (objc_msgSend(WeakRetained, "cloudDataDeletedNotificationHandler"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = v5;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "clientCallbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudDataDeletedNotificationHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, v12);

    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, 1, v3);
  }
  else
  {
LABEL_9:
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v3);
  }
LABEL_12:

}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2_168(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void (*v23)(void);
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6 && WeakRetained)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmd_conciseCKError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v12;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to delete Version 3 record due to error %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  if (*(_BYTE *)(a1 + 48)
    && (objc_msgSend(v8, "cloudDataDeletedNotificationHandler"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v17, "clientCallbackQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cloudDataDeletedNotificationHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v20, v21);

    v22 = *(_QWORD *)(a1 + 32);
    if (v22)
    {
      v23 = *(void (**)(void))(v22 + 16);
LABEL_14:
      v23();
    }
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
    {
      v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_14;
    }
  }

}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void (*v23)(void);
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6 && WeakRetained)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmd_conciseCKError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v12;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to delete Version 3 record due to error %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(v8, "cloudDataDeletedNotificationHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v17, "clientCallbackQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cloudDataDeletedNotificationHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v20, v21);

    v22 = *(_QWORD *)(a1 + 32);
    if (v22)
    {
      v23 = *(void (**)(void))(v22 + 16);
LABEL_13:
      v23();
    }
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
    {
      v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_13;
    }
  }

}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 2, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_3;
    block[3] = &unk_1E89C1B48;
    block[4] = v6;
    v9 = v4;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "clientCallbackQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_6;
      block[3] = &unk_1E89C1D68;
      v20 = *(id *)(a1 + 40);
      v19 = v5;
      dispatch_async(v8, block);

      v9 = v20;
    }
    else
    {
      if (!a2)
      {
        objc_msgSend(WeakRetained, "_verifyZonesExist:zoneIndex:completion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
        goto LABEL_9;
      }
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v7;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot continue HH1 initial fetch because HH2 sentinel zone exists", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "makeSureWeAreRunningInRightEnvironment:", 1);

      objc_msgSend(v11, "clientCallbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_164;
      v16[3] = &unk_1E89C0870;
      v17 = *(id *)(a1 + 40);
      dispatch_async(v15, v16);

      v9 = v17;
    }

  }
LABEL_9:

}

uint64_t __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_164(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 77, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_3(id *a1)
{
  char v2;
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v6;
  char v7;

  objc_msgSend(a1[4], "setCloudHomeDataRecordExists:", objc_msgSend(a1[5], "containsObject:", CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5")) ^ 1);
  v2 = objc_msgSend(a1[5], "containsObject:", CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300")) ^ 1;
  objc_msgSend(a1[4], "clientCallbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_4;
  block[3] = &unk_1E89B6038;
  v4 = a1[6];
  block[4] = a1[4];
  v6 = v4;
  v7 = v2;
  dispatch_async(v3, block);

  objc_msgSend(a1[4], "_accountIsActive");
}

uint64_t __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "cloudHomeDataRecordExists"), *(unsigned __int8 *)(result + 48), 0);
  return result;
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  _BOOL4 IsZoneNotExistError;
  id *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *context;
  void *contexta;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50[2];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v39 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[1];
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 64);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VerifyZone", ", buf, 2u);
    }

    if (v5)
    {
      IsZoneNotExistError = HMDCloudManagerIsZoneNotExistError(v5);
      context = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v7;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (IsZoneNotExistError)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "zone");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "zoneID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "zoneName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v15;
          v53 = 2114;
          v54 = v18;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch record zone %{public}@, creating", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(*(id *)(a1 + 32), "zone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_151;
        v46[3] = &unk_1E89A9D28;
        objc_copyWeak(v50, (id *)(a1 + 56));
        v47 = *(id *)(a1 + 32);
        v20 = *(id *)(a1 + 48);
        v21 = *(void **)(a1 + 72);
        v49 = v20;
        v50[1] = v21;
        v48 = *(id *)(a1 + 40);
        objc_msgSend(v12, "__saveRecordZone:completionHandler:", v19, v46);

        objc_destroyWeak(v50);
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "zone");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "zoneID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "zoneName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "hmd_conciseCKError");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "shortDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v29;
          v53 = 2114;
          v54 = v31;
          v55 = 2114;
          v56 = v33;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch record zone %{public}@ due to error: %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(v12, "clientCallbackQueue");
          v34 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_159;
          block[3] = &unk_1E89C1D68;
          v45 = *(id *)(a1 + 48);
          v44 = v5;
          dispatch_async(v34, block);

        }
      }
    }
    else
    {
      contexta = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v7;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zone");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "zoneID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "zoneName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v24;
        v53 = 2112;
        v54 = v27;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Verified record zone %@ exists", buf, 0x16u);

      }
      objc_autoreleasePoolPop(contexta);
      v28 = *(_QWORD *)(a1 + 72);
      if (v28 >= objc_msgSend(*(id *)(a1 + 40), "count") - 1)
      {
        objc_msgSend(v22, "workQueue");
        v35 = objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_160;
        v40[3] = &unk_1E89BC548;
        v40[4] = v22;
        v41 = *(id *)(a1 + 48);
        objc_copyWeak(&v42, (id *)(a1 + 56));
        dispatch_async(v35, v40);

        objc_destroyWeak(&v42);
      }
      else
      {
        objc_msgSend(v22, "_verifyZonesExist:zoneIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 48));
      }
    }
  }

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_151(uint64_t a1, void *a2, void *a3)
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
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
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
        objc_msgSend(*(id *)(a1 + 32), "zone");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "zoneID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "zoneName");
        v26 = v8;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmd_conciseCKError");
        v28 = v5;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v12;
        v38 = 2112;
        v39 = v14;
        v40 = 2112;
        v41 = v16;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to create record zone %@ due to error: %@", buf, 0x20u);

        v5 = v28;
        v8 = v26;

      }
      objc_autoreleasePoolPop(v8);
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v9, "clientCallbackQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_152;
        block[3] = &unk_1E89C1D68;
        v35 = *(id *)(a1 + 48);
        v34 = v6;
        dispatch_async(v17, block);

        v18 = v35;
LABEL_12:

      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zone");
        v27 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "zoneID");
        v29 = v5;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "zoneName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v19;
        v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully created record zone %@", buf, 0x16u);

        v5 = v29;
        v8 = v27;

      }
      objc_autoreleasePoolPop(v8);
      v23 = *(_QWORD *)(a1 + 64);
      if (v23 >= objc_msgSend(*(id *)(a1 + 40), "count") - 1)
      {
        objc_msgSend(v9, "workQueue");
        v24 = objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_153;
        v30[3] = &unk_1E89BC548;
        v30[4] = v9;
        v31 = *(id *)(a1 + 48);
        objc_copyWeak(&v32, (id *)(a1 + 56));
        dispatch_async(v24, v30);

        objc_destroyWeak(&v32);
        v18 = v31;
        goto LABEL_12;
      }
      objc_msgSend(v9, "_verifyZonesExist:zoneIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 48));
    }
  }

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_159(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_160(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_161;
    v9[3] = &unk_1E89BD640;
    v10 = a1[5];
    objc_copyWeak(&v11, a1 + 6);
    objc_msgSend(v2, "verifyHomeDataFromCloud:", v9);
    objc_destroyWeak(&v11);
    v3 = v10;
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = a1[4];
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delegate is no longer valid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Delegate is missing"), CFSTR("Delegate is nil"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v3);
  }

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_161(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2_162;
    block[3] = &unk_1E89C2730;
    block[4] = v3;
    dispatch_async(v4, block);

  }
}

uint64_t __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2_162(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accountIsActive");
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_152(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_153(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_158;
    v9[3] = &unk_1E89BD640;
    v10 = a1[5];
    objc_copyWeak(&v11, a1 + 6);
    objc_msgSend(v2, "verifyHomeDataFromCloud:", v9);
    objc_destroyWeak(&v11);
    v3 = v10;
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = a1[4];
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delegate is no longer valid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Delegate is missing"), CFSTR("Delegate is nil"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v3);
  }

}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_158(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2;
    block[3] = &unk_1E89C2730;
    block[4] = v3;
    dispatch_async(v4, block);

  }
}

uint64_t __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accountIsActive");
}

void __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  _BOOL4 IsZoneNotExistError;
  void *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id *v19;
  _QWORD *v20;
  void *v21;
  id *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD block[4];
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained[1];
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VerifyZone", ", buf, 2u);
  }

  if (!v6)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Verified HH2 sentinel record zone exists: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v22, "workQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_149;
    block[3] = &unk_1E89C0870;
    v19 = &v33;
    v33 = *(id *)(a1 + 40);
    v20 = block;
    goto LABEL_12;
  }
  IsZoneNotExistError = HMDCloudManagerIsZoneNotExistError(v6);
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = WeakRetained;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (IsZoneNotExistError)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v16;
      v41 = 2114;
      v42 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Verified HH2 sentinel record zone does not exist: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v13, "workQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_147;
    v37[3] = &unk_1E89C0870;
    v19 = &v38;
    v38 = *(id *)(a1 + 40);
    v20 = v37;
LABEL_12:
    dispatch_async(v18, v20);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmd_conciseCKError");
    v31 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shortDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v26;
    v41 = 2114;
    v42 = v27;
    v43 = 2114;
    v44 = v29;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch HH2 sentinel record zone %{public}@: %{public}@", buf, 0x20u);

    v5 = v31;
  }

  objc_autoreleasePoolPop(v12);
  objc_msgSend(v13, "workQueue");
  v30 = objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_148;
  v34[3] = &unk_1E89C1D68;
  v19 = &v36;
  v36 = *(id *)(a1 + 40);
  v35 = v6;
  dispatch_async(v30, v34);

  v18 = v35;
LABEL_16:

}

uint64_t __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_147(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_148(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_149(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __58__HMDCloudManager__handleAccountStatus_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

uint64_t __64__HMDCloudManager_updateAccountStatusChanged_completionHandler___block_invoke(uint64_t a1)
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
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Account status has changed (accountIsActive %@), re-kicking query of current account state", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(v7, "fetchCurrentAccountStateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v7, "_handleAccountStatus:completionHandler:", 3, *(_QWORD *)(a1 + 40));
}

uint64_t __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __46__HMDCloudManager__processFetchedTransaction___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD *v9;
  id *v10;
  _QWORD v11[6];
  id v12;
  _QWORD v13[6];
  id v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __46__HMDCloudManager__processFetchedTransaction___block_invoke_2;
      v13[3] = &unk_1E89BCB20;
      v9 = v13;
      v10 = &v14;
      objc_copyWeak(&v14, (id *)(a1 + 40));
      v13[4] = v8;
      v13[5] = *(id *)(a1 + 32);
      objc_msgSend(v7, "_removeAllHomeZonesCompletionHandler:", v13);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __46__HMDCloudManager__processFetchedTransaction___block_invoke_3;
      v11[3] = &unk_1E89BCB20;
      v9 = v11;
      v10 = &v12;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      v11[4] = v8;
      v11[5] = *(id *)(a1 + 32);
      objc_msgSend(v7, "_verifyAndRemoveAllHomeZonesCompletionHandler:", v11);
    }

    objc_destroyWeak(v10);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __46__HMDCloudManager__processFetchedTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "eraseLocalHomeData");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __46__HMDCloudManager__processFetchedTransaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "eraseLocalHomeData");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_17;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138543618;
    v47 = v8;
    v48 = 2048;
    v49 = objc_msgSend(v3, "size");
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@[HomeKit Data Usage Metric Log] Fetched record with size (Legacy recordChangedBlock): %lu", (uint8_t *)&v46, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v6, "logEventSubmitter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRecordChangedLogEvent legacyRecordChanged:](HMDRecordChangedLogEvent, "legacyRecordChanged:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitLogEvent:", v10);

  objc_msgSend(v3, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeDataRecordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543362;
      v47 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Version 0 exists", (uint8_t *)&v46, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = *(_QWORD *)(a1 + 48);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v18 + 8) + 24) = 1;
    goto LABEL_13;
  }
  objc_msgSend(v3, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeDataV3RecordID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if (v21)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v6;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543362;
      v47 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Version 3 exists", (uint8_t *)&v46, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v18 = *(_QWORD *)(a1 + 56);
    goto LABEL_12;
  }
  objc_msgSend(v3, "recordID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadataRecordID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = v6;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
  if (!v36)
  {
    if (v40)
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "recordType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "recordID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "recordName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543874;
      v47 = v42;
      v48 = 2112;
      v49 = (uint64_t)v43;
      v50 = 2112;
      v51 = v45;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Ignoring unknown legacy record %@/%@", (uint8_t *)&v46, 0x20u);

    }
    objc_autoreleasePoolPop(v37);
    goto LABEL_14;
  }
  if (v40)
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138543362;
    v47 = v41;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Metadata exists", (uint8_t *)&v46, 0xCu);

  }
  objc_autoreleasePoolPop(v37);
LABEL_13:
  v26 = objc_msgSend(*(id *)(a1 + 40), "addChangeWithRecord:", v3);
LABEL_14:
  v27 = (void *)MEMORY[0x1D17BA0A0](v26);
  v28 = v6;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "recordName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138543874;
    v47 = v30;
    v48 = 2112;
    v49 = (uint64_t)v31;
    v50 = 2112;
    v51 = v33;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Received record changed event for record %@/%@", (uint8_t *)&v46, 0x20u);

  }
  objc_autoreleasePoolPop(v27);
LABEL_17:

}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v11;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received deleted record changed event for record %@", (uint8_t *)&v40, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "homeDataRecordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "isEqual:", v13);

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v9;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543362;
        v41 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Version 0 data was deleted", (uint8_t *)&v40, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v19 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "homeDataV3RecordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v5, "isEqual:", v20);

      if (!v21)
      {
        objc_msgSend(*(id *)(a1 + 32), "metadataRecordID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v5, "isEqual:", v26);

        if (v27)
        {
          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = v9;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 138543362;
            v41 = v31;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Metadata record was deleted in the cloud", (uint8_t *)&v40, 0xCu);

          }
          objc_autoreleasePoolPop(v28);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          v32 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "metadataObjectID");
          v33 = objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v32, "doesRecordExistInCacheWithObjectID:", v33) & 1) != 0)
          {
            objc_msgSend(v29, "cloudMetadataDeletedNotificationHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
              goto LABEL_13;
            v35 = (void *)MEMORY[0x1D17BA0A0]();
            v36 = v29;
            HMFGetOSLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 138543362;
              v41 = v38;
              _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud metadata deleted notification block", (uint8_t *)&v40, 0xCu);

            }
            objc_autoreleasePoolPop(v35);
            objc_msgSend(v36, "clientCallbackQueue");
            v33 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "cloudMetadataDeletedNotificationHandler");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            dispatch_async(v33, v39);

          }
        }
LABEL_13:
        objc_msgSend(*(id *)(a1 + 40), "addChangeWithDeletedRecordID:", v5);
        goto LABEL_14;
      }
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543362;
        v41 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Version 3 data was deleted", (uint8_t *)&v40, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      v19 = *(_QWORD *)(a1 + 56);
    }
    *(_BYTE *)(*(_QWORD *)(v19 + 8) + 24) = 1;
    goto LABEL_13;
  }
LABEL_14:

}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_130(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD v40[4];
  NSObject *v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "logEventSubmitter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCloudSyncLegacyFetchLogEvent fetchCompletedWithError:](HMDCloudSyncLegacyFetchLogEvent, "fetchCompletedWithError:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "submitLogEvent:", v12);

    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v44 = 0;
    v13 = MEMORY[0x1E0C809B0];
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v14 = dispatch_group_create();
      dispatch_group_enter(v14);
      v15 = v13;
      v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v17 = *(_QWORD *)(a1 + 32);
      v40[0] = v15;
      v40[1] = 3221225472;
      v40[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2;
      v40[3] = &unk_1E89A9AD0;
      v42 = v43;
      v18 = v14;
      v41 = v18;
      objc_msgSend(v10, "_forceCleanCloud:fetchTransaction:completionHandler:", v16, v17, v40);
      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

      v13 = MEMORY[0x1E0C809B0];
    }
    objc_msgSend(v10, "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3;
    v25[3] = &unk_1E89A9C38;
    v26 = *(id *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    v28 = v10;
    v38 = *(_BYTE *)(a1 + 112);
    v20 = *(_QWORD *)(a1 + 64);
    v33 = *(_QWORD *)(a1 + 80);
    v34 = v20;
    v21 = *(id *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 88);
    v31 = v21;
    v35 = v22;
    v29 = v8;
    v30 = v7;
    v36 = v43;
    v23 = *(id *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 96);
    v32 = v23;
    v37 = v24;
    v39 = a3;
    dispatch_async(v19, v25);

    _Block_object_dispose(v43, 8);
  }

}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_137(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  char v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = WeakRetained;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "zoneName");
      v30 = a5;
      v20 = v14;
      v21 = v12;
      v22 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetch record completion for zone %@", buf, 0x16u);

      v11 = v22;
      v12 = v21;
      v14 = v20;
      a5 = v30;

      v13 = v31;
    }

    objc_autoreleasePoolPop(v16);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v24 = v11;
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v17;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = v13;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v29;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Completion handler for fetch has already been called", buf, 0xCu);

        v13 = v28;
      }

      objc_autoreleasePoolPop(v25);
      v11 = v24;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if ((a5 & 1) == 0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
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
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  BOOL v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 1;
      v6 = v3;
      if (!v6)
      {
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v8 = WeakRetained;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v10;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Legacy zone fetch failed to return data, nothing to process", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v7);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = WeakRetained;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmd_conciseCKError");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v14;
        v41 = 2112;
        v42 = v16;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not fetch zone due to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v12;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because fetch failed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v18, "cloudCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDatabaseServerChangeToken:", 0);

      objc_msgSend(v18, "cloudCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "persistDatabaseServerChangeToken");

      v23 = MEMORY[0x1E0C809B0];
      if (*(_QWORD *)(a1 + 48))
      {
        v24 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "metadataObjectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "doesRecordExistWithObjectID:", v25))
          v26 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 0;
        else
          v26 = 0;

        v27 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "homeDataObjectID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "doesRecordExistWithObjectID:", v28))
          v29 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0;
        else
          v29 = 0;
        objc_msgSend(v18, "setCloudHomeDataRecordExists:", v29);

        objc_msgSend(v18, "clientCallbackQueue");
        v30 = objc_claimAutoreleasedReturnValue();
        block[0] = v23;
        block[1] = 3221225472;
        block[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_139;
        block[3] = &unk_1E89BD720;
        v37 = *(id *)(a1 + 48);
        block[4] = v18;
        v38 = v26;
        v36 = v6;
        dispatch_async(v30, block);

      }
      if (*(_QWORD *)(a1 + 56))
      {
        objc_msgSend(v18, "clientCallbackQueue");
        v31 = objc_claimAutoreleasedReturnValue();
        v32[0] = v23;
        v32[1] = 3221225472;
        v32[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_140;
        v32[3] = &unk_1E89C1D68;
        v34 = *(id *)(a1 + 56);
        v33 = v6;
        dispatch_async(v31, v32);

      }
    }
  }

}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_139(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "cloudHomeDataRecordExists");
  v4 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "hmd_hmErrorFromCKError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4, v5);

}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_140(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3(uint64_t a1)
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
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  int v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD block[5];
  id v76;
  id v77;
  char v78;
  _QWORD v79[2];
  _QWORD v80[2];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeDataObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeWithObjectID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isDeleted"))
    objc_msgSend(*(id *)(a1 + 48), "_resetHomeDataRecordState");
  if (*(_BYTE *)(a1 + 128))
  {
    objc_msgSend(*(id *)(a1 + 48), "setCloudHomeDataRecordExists:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) != 0);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "homeDataObjectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v5, "doesRecordExistWithObjectID:", v6);

      if ((_DWORD)v5)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "homeDataRecordID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDeleteAsProcessedWithRecordID:", v8);

      }
    }
  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "setCloudHomeDataRecordExists:", 1);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "homeDataObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "doesRecordExistWithObjectID:", v10))
      v11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) == 0;
    else
      v11 = 0;
    objc_msgSend(*(id *)(a1 + 48), "setCloudHomeDataRecordExists:", v11);

  }
  objc_msgSend(*(id *)(a1 + 48), "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 72))
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "metadataObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "doesRecordExistWithObjectID:", v15) & 1) != 0)
    {
      v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);

      if (!v16)
      {
        v17 = 1;
LABEL_21:
        if ((objc_msgSend(v12, "isControllerKeyAvailable") & 1) == 0
          && objc_msgSend(*(id *)(a1 + 48), "keychainSyncEnabled"))
        {
          objc_msgSend(*(id *)(a1 + 48), "_startControllerKeyPollTimer");
        }
        objc_msgSend(*(id *)(a1 + 48), "clientCallbackQueue");
        v22 = objc_claimAutoreleasedReturnValue();
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_132;
        block[3] = &unk_1E89BD720;
        v23 = *(id *)(a1 + 72);
        v24 = *(_QWORD *)(a1 + 48);
        v25 = *(void **)(a1 + 56);
        v77 = v23;
        block[4] = v24;
        v78 = v17;
        v76 = v25;
        dispatch_async(v22, block);

        goto LABEL_25;
      }
    }
    else
    {

    }
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch metadata record during initial fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
    goto LABEL_21;
  }
LABEL_25:
  v26 = objc_msgSend(v12, "dataMigrationOptions");
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedServerChangeToken:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "legacyZone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "serverChangeToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = HMFEqualObjects();

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "_resetCloudServerTokenData");
    objc_msgSend(*(id *)(a1 + 32), "setUpdatedServerChangeToken:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setOsTransaction:", 0);
    if (!*(_QWORD *)(a1 + 80))
      goto LABEL_44;
    objc_msgSend(*(id *)(a1 + 48), "clientCallbackQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    v73[0] = v13;
    v73[1] = 3221225472;
    v73[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_133;
    v73[3] = &unk_1E89C0870;
    v74 = *(id *)(a1 + 80);
    dispatch_async(v30, v73);

    v31 = v74;
    goto LABEL_43;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
  {
    v32 = objc_msgSend(*(id *)(a1 + 48), "_processFetchedTransaction:", *(_QWORD *)(a1 + 32));
    v33 = *(void **)(a1 + 48);
    if (!v32)
    {
      v35 = *(_QWORD *)(a1 + 56);
      v36 = *(_QWORD *)(a1 + 64);
      v37 = *(void **)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 80);
      v67 = v12;
      v39 = v4;
      v40 = v29;
      v41 = *(unsigned __int8 *)(a1 + 129);
      LOBYTE(v66) = objc_msgSend(v37, "iCloudSwitchStateEnabled") ^ 1;
      v42 = v41;
      v29 = v40;
      v4 = v39;
      v12 = v67;
      objc_msgSend(v33, "_processFetchCompletedWithError:serverToken:fetchTransaction:migrationOptions:completionHandler:moreRecordsComing:emptyRecord:", v35, v36, v37, v26, v38, v42, v66);
      goto LABEL_44;
    }
    objc_msgSend(*(id *)(a1 + 48), "_resetCloudServerTokenData");
    objc_msgSend(*(id *)(a1 + 32), "setUpdatedServerChangeToken:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setOsTransaction:", 0);
    if (!*(_QWORD *)(a1 + 80))
      goto LABEL_44;
    objc_msgSend(*(id *)(a1 + 48), "clientCallbackQueue");
    v34 = objc_claimAutoreleasedReturnValue();
    v71[0] = v13;
    v71[1] = 3221225472;
    v71[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3_134;
    v71[3] = &unk_1E89C0870;
    v72 = *(id *)(a1 + 80);
    dispatch_async(v34, v71);

    v31 = v72;
    goto LABEL_43;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "iCloudSwitchStateEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUpdatedServerChangeToken:", 0);
    objc_msgSend(*(id *)(a1 + 48), "_resetCloudServerTokenData");
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "cloudHomeDataRecordExists") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "cloudDataSyncStateFilter");
    v68 = v29;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isLocalDataDecryptionFailed");

    v29 = v68;
    if (v44)
    {
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v82 = v48;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@No data in the cloud and local decryption has failed, start reset timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(*(id *)(a1 + 48), "cloudDataSyncStateFilter");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "startDataConfigResetTimers");

      v29 = v68;
    }
  }
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 48), "clientCallbackQueue");
    v50 = v29;
    v51 = objc_claimAutoreleasedReturnValue();
    v69[0] = v13;
    v69[1] = 3221225472;
    v69[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_135;
    v69[3] = &unk_1E89C0870;
    v70 = *(id *)(a1 + 80);
    dispatch_async(v51, v69);

    v29 = v50;
    v31 = v70;
LABEL_43:

  }
LABEL_44:
  if (objc_msgSend(*(id *)(a1 + 48), "decryptionFailed"))
  {
    v52 = (void *)MEMORY[0x1D17BA0A0]();
    v53 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v55;
      _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@Decryption from V3 zone failed, do not notify of successful fetch, reset first fetch run and db query run", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v52);
    objc_msgSend(*(id *)(a1 + 48), "setFirstV3FetchRun:", 0);
    objc_msgSend(*(id *)(a1 + 48), "setFirstDBQueryRun:", 0);
  }
  else if ((objc_msgSend(*(id *)(a1 + 48), "isFirstV3FetchRun") & 1) == 0 && !*(_QWORD *)(a1 + 56))
  {
    v56 = v29 ^ 1u;
    v57 = (void *)MEMORY[0x1D17BA0A0]();
    v58 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v60;
      v83 = 2112;
      v84 = v61;
      _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_INFO, "%{public}@Zone ready determined for legacy zone; didServerTokenChange: %@",
        buf,
        0x16u);

    }
    objc_autoreleasePoolPop(v57);
    objc_msgSend(*(id *)(a1 + 48), "setFirstV3FetchRun:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = CFSTR("HMDCR.stc");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v56);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = CFSTR("HMDCR.de");
    v80[0] = v63;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "cloudHomeDataRecordExists"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v64;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "postNotificationName:object:userInfo:", CFSTR("HMDCloudZoneReadyNotification"), 0, v65);

  }
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_132(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "cloudHomeDataRecordExists");
  v4 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "hmd_hmErrorFromCKError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4, v5);

}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_133(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "accountActive");
  v3 = *(_QWORD *)(a1 + 48);
  if ((v2 & 1) != 0 || v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchLegacyTransaction:forceFetch:accountCompletionHandler:dataCompletionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), v3, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing request fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCallbackQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_122;
      block[3] = &unk_1E89C0870;
      v10 = *(id *)(a1 + 56);
      dispatch_async(v8, block);

    }
  }
}

void __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_122(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __50__HMDCloudManager_setAccountActiveUpdateCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccountActiveUpdateHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__HMDCloudManager_setDataDecryptionFailedCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDataDecryptionFailedHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMDCloudManager_setControllerKeyAvailableNotificationBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setControllerKeyAvailableNotificationHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__HMDCloudManager_setCloudMetadataDeletedNotificationBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCloudMetadataDeletedNotificationHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__HMDCloudManager_setCloudDataDeletedNotificationBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCloudDataDeletedNotificationHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__HMDCloudManager_setDataAvailableFromCloudCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFetchCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = (id *)WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmd_conciseCKError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      v22 = 2048;
      v23 = a2;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Query for container account status completed with status (%lu) and error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = v8[1];
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 48);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v14, OS_SIGNPOST_INTERVAL_END, v15, "AccountStatus", ", buf, 2u);
    }

    objc_msgSend(v8, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke_120;
    block[3] = &unk_1E89C01B0;
    block[4] = v8;
    v19 = a2;
    v18 = *(id *)(a1 + 32);
    dispatch_async(v16, block);

  }
}

uint64_t __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke_120(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccountStatus:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __34__HMDCloudManager_serverTokenData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_serverTokenData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__HMDCloudManager__resetCloudCache___block_invoke(uint64_t a1, void *a2)
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
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(WeakRetained, "updateServerTokenStatusOnCloudFilter"));
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Completed resetting cloud cached with error %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

uint64_t __35__HMDCloudManager_resetCloudCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetCloudCache:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__HMDCloudManager_resetCloudServerTokenData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetCloudServerTokenData");
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Record delete %@/%@ progress %f", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);

}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmd_conciseCKError");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v12;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to delete record in the server, %@", (uint8_t *)&v16, 0x16u);
LABEL_7:

      }
    }
    else if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleted home data record %@/%@", (uint8_t *)&v16, 0x20u);

      goto LABEL_7;
    }

    objc_autoreleasePoolPop(v8);
  }

}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_116(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2;
    v11[3] = &unk_1E89C0448;
    v12 = v7;
    v13 = v9;
    v15 = *(id *)(a1 + 32);
    v14 = v6;
    dispatch_async(v10, v11);

  }
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id *v10;
  _QWORD *v11;
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
  int v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = a1[5];
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "hmd_conciseCKError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v5;
      v42 = 2112;
      v43 = (uint64_t)v7;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Could not delete records due to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    if (a1[7])
    {
      objc_msgSend(a1[5], "clientCallbackQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_117;
      v36[3] = &unk_1E89C1D68;
      v9 = &v38;
      v38 = a1[7];
      v10 = &v37;
      v37 = a1[4];
      v11 = v36;
      goto LABEL_21;
    }
    return;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = a1[6];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (!v13)
    goto LABEL_17;
  v14 = v13;
  v15 = *(_QWORD *)v33;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v33 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
      objc_msgSend(a1[5], "legacyZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "homeDataRecordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqual:", v19))
      {

      }
      else
      {
        objc_msgSend(a1[5], "legacyZone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "homeDataV3RecordID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v17, "isEqual:", v21);

        if (!v22)
          goto LABEL_15;
      }
      objc_msgSend(a1[5], "legacyZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRecordsAvailable:", 0);

      objc_msgSend(a1[5], "setCloudHomeDataRecordExists:", 0);
LABEL_15:
      ++v16;
    }
    while (v14 != v16);
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  }
  while (v14);
LABEL_17:

  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = a1[5];
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(a1[6], "count");
    *(_DWORD *)buf = 138543618;
    v41 = v27;
    v42 = 2048;
    v43 = v28;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Deleted %ld records", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(a1[5], "_resetCloudServerTokenData");
  if (a1[7])
  {
    objc_msgSend(a1[5], "clientCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_118;
    v29[3] = &unk_1E89C1D68;
    v9 = &v31;
    v31 = a1[7];
    v10 = &v30;
    v30 = a1[4];
    v11 = v29;
LABEL_21:
    dispatch_async(v8, v11);

  }
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_117(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_118(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id WeakRetained;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[4];
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v25 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v11 = v23;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (*(_BYTE *)(a1 + 48))
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "zoneID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "zoneName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"), "isEqualToString:", v17);

              if ((v18 & 1) != 0)
                continue;
            }
            objc_msgSend(v15, "zoneID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "zoneName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v20);
            if (v21)
            {
              objc_msgSend(v15, "zoneID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v22);

            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v12);
      }

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_2;
      v27[3] = &unk_1E89BC028;
      objc_copyWeak(&v29, (id *)(a1 + 40));
      v28 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "__deleteRecordZonesWithIDs:completionHandler:", v26, v27);

      objc_destroyWeak(&v29);
      v10 = v26;
      goto LABEL_20;
    }
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch zone information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v6, "clientCallbackQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_114;
      block[3] = &unk_1E89C0870;
      v35 = *(id *)(a1 + 32);
      dispatch_async(v9, block);

      v10 = v35;
LABEL_20:

    }
  }

}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_114(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "clientCallbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_3;
    block[3] = &unk_1E89C0870;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

uint64_t __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_108(id *a1, int a2, char a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *context;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || (a3 & 1) != 0)
    {
      if (a1[5])
      {
        objc_msgSend(WeakRetained, "clientCallbackQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_2;
        block[3] = &unk_1E89C1D68;
        v22 = a1[5];
        v21 = v7;
        dispatch_async(v18, block);

      }
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v10 = v9;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "zone", context);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "zoneID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoneName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v12;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Zone cannot be decrypted with current controller key, removing zone %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(a1[4], "zone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "zoneID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_109;
      v23[3] = &unk_1E89A9A80;
      objc_copyWeak(&v26, a1 + 6);
      v24 = a1[4];
      v25 = a1[5];
      objc_msgSend(v10, "__deleteRecordZoneWithID:completionHandler:", v17, v23);

      objc_destroyWeak(&v26);
    }
  }

}

void __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_109(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "zone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "zoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "zoneName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed zone %@ with error %@", buf, 0x20u);

      v5 = v16;
    }

    objc_autoreleasePoolPop(v8);
    if (a1[5])
    {
      objc_msgSend(v9, "clientCallbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_110;
      block[3] = &unk_1E89C1D68;
      v19 = a1[5];
      v18 = v6;
      dispatch_async(v15, block);

    }
  }

}

uint64_t __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
}

uint64_t __57__HMDCloudManager_verifyAndRemoveZone_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verifyAndRemoveZone:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "clientCallbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke_2;
    block[3] = &unk_1E89C0870;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

uint64_t __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2;
  v5[3] = &unk_1E89BD000;
  objc_copyWeak(&v7, v2);
  v8 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5[4] = WeakRetained;
  v6 = v4;
  objc_msgSend(WeakRetained, "_resetCloudZonesIgnoreHomeManager:completionHandler:", 0, v5);

  objc_destroyWeak(&v7);
}

void __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCallbackQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_3;
      v6[3] = &unk_1E89C1D68;
      v8 = *(id *)(a1 + 40);
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_resetCloudDataAndDeleteMetadataForCurrentAccount:completionHandler:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_91(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching %@ progress %f", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_94(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C947D8]) && objc_msgSend(v9, "code") == 11)
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v8);

        if (v12)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = WeakRetained;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "recordName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543618;
            v26 = v16;
            v27 = 2112;
            v28 = v17;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Root record %@ does not exist", (uint8_t *)&v25, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
        }
      }
      else
      {

      }
    }
    else if (v7)
    {
      v18 = *(void **)(a1 + 32);
      objc_msgSend(v7, "recordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = objc_msgSend(v18, "isEqual:", v19);

      if ((_DWORD)v18)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = WeakRetained;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "recordName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v23;
          v27 = 2112;
          v28 = v24;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Root record %@ does exist", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(*(id *)(a1 + 40), "addChangeWithRecord:", v7);
      }
    }
  }

}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  int v23;
  const __CFString *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[2];
  _QWORD block[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_20;
  if (v6)
  {
    -[__CFString domain](v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]) & 1) != 0)
    {
      v9 = -[__CFString code](v6, "code");

      if (v9 != 2)
      {
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = WeakRetained;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v34 = v13;
          v35 = 2112;
          v36 = v14;
          v37 = 2112;
          v38 = v6;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch root record for zone %@ with error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v10);
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(v11, "clientCallbackQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_97;
          block[3] = &unk_1E89C0870;
          v16 = &v32;
          v32 = *(id *)(a1 + 48);
          dispatch_async(v15, block);
LABEL_19:

          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = WeakRetained;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v21 = CFSTR("exists");
    else
      v21 = CFSTR("does not exist");
    v22 = *(_QWORD *)(a1 + 32);
    v23 = objc_msgSend(*(id *)(a1 + 40), "decryptionFailed");
    v24 = CFSTR("was");
    *(_DWORD *)buf = 138544130;
    v34 = v20;
    v35 = 2112;
    if (v23)
      v24 = CFSTR("failed to");
    v36 = v22;
    v37 = 2112;
    v38 = v21;
    v39 = 2112;
    v40 = v24;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetched zone %@ and record %@ and %@ to decrypt", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v18, "clientCallbackQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_106;
    v28[3] = &unk_1E89BD0A0;
    v16 = (id *)v30;
    v26 = *(id *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 56);
    v30[0] = v26;
    v30[1] = v27;
    v29 = *(id *)(a1 + 40);
    dispatch_async(v25, v28);

    v15 = v29;
    goto LABEL_19;
  }
LABEL_20:

}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_97(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(a1 + 32), "decryptionFailed") ^ 1, 0);
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  id *from;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id obj;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _BYTE *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  _BYTE *v64;
  id v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  _QWORD block[5];
  uint8_t v78[4];
  id v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint8_t v83[128];
  _BYTE buf[24];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v53 = a2;
  v52 = a3;
  v54 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v54)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v51 = WeakRetained;
        objc_msgSend(WeakRetained, "clientCallbackQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_3;
        block[3] = &unk_1E89C0870;
        v10 = block;
        block[4] = *(id *)(a1 + 48);
        dispatch_async(v9, block);

LABEL_5:
        v11 = (void *)v10[4];
LABEL_31:

        v8 = v51;
      }
    }
    else
    {
      v50 = a1;
      v51 = WeakRetained;
      if (objc_msgSend(v53, "count") || objc_msgSend(v52, "count"))
      {
        from = (id *)(a1 + 56);
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = v8;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          v85 = objc_msgSend(v53, "count");
          v86 = 2048;
          v87 = objc_msgSend(v52, "count");
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Operations in zone %@ (%lu save, %lu delete)", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v12);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v53;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v73 != v18)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              v21 = (void *)MEMORY[0x1D17BA0A0]();
              v22 = v13;
              HMFGetOSLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "recordID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v24;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v25;
                _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@     Saving: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v21);
            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
          }
          while (v17);
        }

        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v26 = v52;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v69;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v69 != v28)
                objc_enumerationMutation(v26);
              v30 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
              v31 = (void *)MEMORY[0x1D17BA0A0]();
              v32 = v13;
              HMFGetOSLogHandle();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v34;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v30;
                _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@     Deleting: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v31);
            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
          }
          while (v27);
        }

        objc_msgSend(v13, "logEventSubmitter");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRecordsSavedLogEvent legacyRecordsSaved:](HMDRecordsSavedLogEvent, "legacyRecordsSaved:", obj);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "submitLogEvent:", v36);

        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", obj, v26);
        objc_msgSend(v11, "setSavePolicy:", 0);
        v37 = MEMORY[0x1E0C809B0];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_81;
        v66[3] = &unk_1E89A98C8;
        objc_copyWeak(&v67, from);
        objc_msgSend(v11, "setPerRecordProgressBlock:", v66);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v85) = 0;
        v62[0] = v37;
        v62[1] = 3221225472;
        v62[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_82;
        v62[3] = &unk_1E89A98F0;
        objc_copyWeak(&v65, from);
        v64 = buf;
        v63 = *(id *)(v50 + 40);
        objc_msgSend(v11, "setPerRecordCompletionBlock:", v62);
        v56[0] = v37;
        v56[1] = 3221225472;
        v56[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_84;
        v56[3] = &unk_1E89A9990;
        objc_copyWeak(&v61, from);
        v60 = buf;
        v57 = *(id *)(v50 + 40);
        v59 = *(id *)(v50 + 48);
        v58 = obj;
        v38 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v56));
        v39 = v13;
        HMFGetOSLogHandle();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "operationID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v78 = 138543618;
          v79 = v41;
          v80 = 2112;
          v81 = v42;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Modifying records with operation ID: %@", v78, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        objc_msgSend(v39, "__addCKDatabaseOperation:", v11);

        objc_destroyWeak(&v61);
        objc_destroyWeak(&v65);
        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v67);
        goto LABEL_31;
      }
      v43 = (void *)MEMORY[0x1D17BA0A0]();
      v44 = v8;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(_QWORD *)(v50 + 32);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v47;
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_DEBUG, "%{public}@There are no records to save or delete for zone %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v43);
      v8 = v51;
      if (*(_QWORD *)(v50 + 48))
      {
        objc_msgSend(v44, "clientCallbackQueue");
        v48 = objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_80;
        v76[3] = &unk_1E89C0870;
        v10 = v76;
        v76[4] = *(id *)(v50 + 48);
        dispatch_async(v48, v76);

        goto LABEL_5;
      }
    }
  }

}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_81(uint64_t a1, void *a2, double a3)
{
  id v5;
  id WeakRetained;
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
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v13;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Record modify %@/%@ progress %f", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  NSObject *v41;
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
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_28;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C947D8];
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == 26)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        goto LABEL_28;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", v9))
    {
      v26 = objc_msgSend(v6, "code");

      if (v26 == 14)
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = WeakRetained;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "hmd_conciseCKError");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "shortDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v64 = v30;
          v65 = 2112;
          v66 = v32;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Failed to save record due to updated record in the server, need to resolve conflict, %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(*(id *)(a1 + 32), "setNeedConflictResolution:", 1);
        v33 = *(void **)(a1 + 32);
        objc_msgSend(v5, "recordID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "recordName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "changeWithRecordName:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v36, "cloudRecord");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isRecordCreated");

          if (v38)
          {
            v39 = (void *)MEMORY[0x1D17BA0A0]();
            v40 = v28;
            HMFGetOSLogHandle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v64 = v42;
              _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Conflict caused by new record, zone and cache can be out of sync, resetting token for fetch", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v39);
            objc_msgSend(*(id *)(a1 + 32), "cloudZone");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setServerChangeToken:", 0);

            v44 = (void *)MEMORY[0x1D17BA0A0]();
            v45 = v40;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v64 = v47;
              _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because legacy record conflict", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v44);
            objc_msgSend(v45, "cloudCache");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setDatabaseServerChangeToken:", 0);

            objc_msgSend(v45, "cloudCache");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "persistDatabaseServerChangeToken");

          }
        }
        v50 = *(void **)(a1 + 32);
        objc_msgSend(v5, "recordID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "resetRecordWithRecordID:", v51);

        goto LABEL_28;
      }
    }
    else
    {

    }
    v52 = (void *)MEMORY[0x1D17BA0A0]();
    v53 = WeakRetained;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "recordName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmd_conciseCKError");
      v62 = v52;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "shortDescription");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v64 = v55;
      v65 = 2112;
      v66 = v56;
      v67 = 2112;
      v68 = v57;
      v69 = 2112;
      v70 = v59;
      _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@Could not save record %@/%@: %@", buf, 0x2Au);

      v52 = v62;
    }

    objc_autoreleasePoolPop(v52);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v61 = a1;
      v17 = v5;
      v18 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v64 = v14;
      v65 = 2112;
      v66 = v15;
      v67 = 2112;
      v68 = v19;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Saved record %@/%@", buf, 0x20u);

      v11 = v18;
      v5 = v17;
      a1 = v61;

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v5, "recordID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "legacyZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "homeDataRecordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqual:", v22);

    if (v23)
    {
      objc_msgSend(v12, "setCloudHomeDataRecordExists:", 1);
      objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ensureControllerKeyExistsForAllViews");

    }
    objc_msgSend(*(id *)(a1 + 32), "setSaveAsProcessedWithRecord:", v5);
  }
LABEL_28:

}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_84(uint64_t a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  int v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  unint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD block[4];
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v54 = a2;
  v55 = a3;
  v57 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v58 = v57;
    v56 = WeakRetained;
    objc_msgSend(WeakRetained, "logEventSubmitter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCloudSyncLegacyUploadLogEvent uploadCompletedWithError:](HMDCloudSyncLegacyUploadLogEvent, "uploadCompletedWithError:", v58);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitLogEvent:", v9);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v56;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "zoneID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "zoneName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v14;
        v82 = 2112;
        v83 = (uint64_t)v17;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to upload records to zone %@, creating", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v10, "zone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_86;
      v74[3] = &unk_1E89A9968;
      objc_copyWeak(&v77, (id *)(a1 + 64));
      v19 = v10;
      v75 = v19;
      v76 = *(id *)(a1 + 48);
      objc_msgSend(v12, "__saveRecordZone:completionHandler:", v18, v74);

      objc_destroyWeak(&v77);
      goto LABEL_43;
    }
    objc_msgSend(v56, "delegate");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v53 = v56;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v58)
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "hmd_conciseCKError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v23;
        v82 = 2114;
        v83 = (uint64_t)v25;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Failed to save records due %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      if (objc_msgSend(*(id *)(a1 + 32), "needConflictResolution"))
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v53;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v81 = v29;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Need conflict resolution for home manager, schedule zone fetch and repush.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v26);
        objc_msgSend(v19, "fetchHomeDataFromCloudWithCloudConflict:withDelay:", objc_msgSend(*(id *)(a1 + 32), "needConflictResolution"), 0.0);
      }
      else
      {
        objc_msgSend(v58, "domain");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0C947D8]);

        if (v42)
        {
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v43 = *(id *)(a1 + 40);
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          if (v44)
          {
            v45 = *(_QWORD *)v71;
            while (2)
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v71 != v45)
                  objc_enumerationMutation(v43);
                v47 = objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "size");
                if (v47 > cloudRecordSizeLimit)
                {
                  v48 = (void *)MEMORY[0x1D17BA0A0]();
                  v49 = v53;
                  HMFGetOSLogHandle();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v81 = v51;
                    _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Operations failed because of record size, ignoring error", buf, 0xCu);

                  }
                  objc_autoreleasePoolPop(v48);

                  v58 = 0;
                  goto LABEL_40;
                }
              }
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
              if (v44)
                continue;
              break;
            }
          }
LABEL_40:

        }
      }
    }
    else
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v30;
        v82 = 2048;
        v83 = objc_msgSend(v54, "count");
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Saved %ld records", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v31 = v55;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v67 != v33)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(a1 + 32), "setDeleteAsProcessedWithRecordID:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        }
        while (v32);
      }

      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = v53;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v31, "count");
        *(_DWORD *)buf = 138543618;
        v81 = v38;
        v82 = 2048;
        v83 = v39;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Deleted %ld records", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      if (objc_msgSend(*(id *)(a1 + 32), "moreChangesToProcess"))
      {
        objc_msgSend(v36, "workQueue");
        v40 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_88;
        block[3] = &unk_1E89BC548;
        objc_copyWeak(&v65, (id *)(a1 + 64));
        v63 = *(id *)(a1 + 32);
        v64 = *(id *)(a1 + 48);
        dispatch_async(v40, block);

        objc_destroyWeak(&v65);
        v58 = 0;
LABEL_43:

        WeakRetained = v56;
        goto LABEL_44;
      }
      objc_msgSend(v19, "fetchHomeDataFromCloudWithCloudConflict:withDelay:", 0, 0.0);
      v58 = 0;
    }
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v53, "clientCallbackQueue");
      v52 = objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2_89;
      v59[3] = &unk_1E89C1D68;
      v61 = *(id *)(a1 + 48);
      v58 = v58;
      v60 = v58;
      dispatch_async(v52, v59);

    }
    goto LABEL_43;
  }
LABEL_44:

}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_86(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = v6;
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = v6;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "zone");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "zoneID");
        v23 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoneName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmd_conciseCKError");
        v24 = v5;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v17;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to create record zone %@ due to error: %@", buf, 0x20u);

        v5 = v24;
        v9 = v23;

        v6 = v22;
      }

      objc_autoreleasePoolPop(v9);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v18;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Restarting legacy push", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uploadHomeConfigToCloud:withDelay:", 0, 0.0);

      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a1[5])
    {
      objc_msgSend(v10, "clientCallbackQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_87;
      block[3] = &unk_1E89C1D68;
      v27 = a1[5];
      v26 = v8;
      dispatch_async(v20, block);

    }
  }

}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_88(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_uploadLegacyTransaction:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2_89(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "accountActive") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v4;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction upload", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (a1[5])
    {
      objc_msgSend(v7, "clientCallbackQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_79;
      block[3] = &unk_1E89C0870;
      v16 = a1[5];
      dispatch_async(v10, block);

    }
  }
  else
  {
    v5 = a1[4];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_2;
    v11[3] = &unk_1E89C0650;
    objc_copyWeak(&v14, v2);
    v12 = a1[4];
    v13 = a1[5];
    objc_msgSend(v5, "loadCloudRecordsAndDetermineDeletesFromCache:", v11);

    objc_destroyWeak(&v14);
  }

}

void __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_79(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_3;
    block[3] = &unk_1E89C1B48;
    block[4] = v3;
    v6 = a1[4];
    v7 = a1[5];
    dispatch_async(v4, block);

  }
}

uint64_t __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_uploadLegacyTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      {
        v9 = objc_msgSend(v6, "code");

        if (v9 == 26)
        {
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          v11 = WeakRetained;
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v23 = v13;
            v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Zone %@ does not exist in cloud, nothing to delete", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(*(id *)(a1 + 40), "setZoneWasDeleted:", 1);
            objc_msgSend(v11, "clientCallbackQueue");
            v15 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_78;
            block[3] = &unk_1E89C0870;
            v21 = *(id *)(a1 + 48);
            dispatch_async(v15, block);

          }
        }
      }
      else
      {

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setZoneWasDeleted:", 1);
    }
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "clientCallbackQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_2;
      v17[3] = &unk_1E89C1D68;
      v19 = *(id *)(a1 + 48);
      v18 = v6;
      dispatch_async(v16, v17);

    }
  }

}

uint64_t __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "accountActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeZonesTransactions:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction to remove zone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke_77;
      block[3] = &unk_1E89C0870;
      v8 = *(id *)(a1 + 48);
      dispatch_async(v6, block);

    }
  }
}

void __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke_77(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_66(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id *location;
  id *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _BYTE *v41;
  id v42[2];
  _QWORD v43[4];
  id v44;
  _BYTE *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];
  _QWORD block[5];
  uint8_t v51[4];
  id v52;
  __int16 v53;
  void *v54;
  _BYTE buf[24];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v36 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      if (a1[6])
      {
        v35 = WeakRetained;
        objc_msgSend(WeakRetained, "clientCallbackQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_2;
        block[3] = &unk_1E89C0870;
        v12 = block;
        block[4] = a1[6];
        dispatch_async(v11, block);

LABEL_5:
        v13 = (void *)v12[4];
LABEL_13:

        v10 = v35;
      }
    }
    else
    {
      v35 = WeakRetained;
      if (objc_msgSend(v7, "count") || objc_msgSend(v36, "count"))
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = v10;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = a1[4];
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2048;
          v56 = objc_msgSend(v7, "count");
          v57 = 2048;
          v58 = objc_msgSend(v36, "count");
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Operations in zone %@ (%lu save, %lu delete)", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "logEventSubmitter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRecordsSavedLogEvent recordsSaved:](HMDRecordsSavedLogEvent, "recordsSaved:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "submitLogEvent:", v20);

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v7, v36);
        objc_msgSend(v13, "setSavePolicy:", 0);
        v21 = MEMORY[0x1E0C809B0];
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_69;
        v47[3] = &unk_1E89A98C8;
        v34 = &v48;
        objc_copyWeak(&v48, a1 + 7);
        objc_msgSend(v13, "setPerRecordProgressBlock:", v47);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v56) = 0;
        v43[0] = v21;
        v43[1] = 3221225472;
        v43[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_71;
        v43[3] = &unk_1E89A98F0;
        location = &v46;
        objc_copyWeak(&v46, a1 + 7);
        v45 = buf;
        v44 = a1[5];
        objc_msgSend(v13, "setPerRecordCompletionBlock:", v43);
        v37[0] = v21;
        v37[1] = 3221225472;
        v37[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_73;
        v37[3] = &unk_1E89A9918;
        objc_copyWeak(v42, a1 + 7);
        v42[1] = a1[8];
        v38 = a1[5];
        v41 = buf;
        v39 = a1[4];
        v40 = a1[6];
        v22 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v13, "setModifyRecordsCompletionBlock:", v37));
        v23 = v15;
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "operationID", &v46, &v48);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138543618;
          v52 = v25;
          v53 = 2112;
          v54 = v26;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Modifying records with operation ID: %@", v51, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v23, "__addCKDatabaseOperation:", v13);

        objc_destroyWeak(v42);
        objc_destroyWeak(location);
        _Block_object_dispose(buf, 8);
        objc_destroyWeak(v34);
        goto LABEL_13;
      }
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v10;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEBUG, "%{public}@There are no records to save or delete for zone %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      if (a1[6])
      {
        objc_msgSend(v28, "clientCallbackQueue");
        v32 = objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_67;
        v49[3] = &unk_1E89C0870;
        v12 = v49;
        v49[4] = a1[6];
        dispatch_async(v32, v49);

        goto LABEL_5;
      }
    }
  }

}

uint64_t __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_69(uint64_t a1, void *a2, double a3)
{
  id v5;
  id WeakRetained;
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
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v13;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Record modify %@/%@ progress %f", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
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
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_28;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C947D8];
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == 26)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        goto LABEL_28;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", v9))
    {
      if (objc_msgSend(v6, "code") == 14)
      {

LABEL_18:
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = WeakRetained;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "hmd_conciseCKError");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "shortDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v58 = v32;
          v59 = 2112;
          v60 = v34;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Failed to save record due to updated record in the server, need to resolve conflict, %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(*(id *)(a1 + 32), "setNeedConflictResolution:", 1);
        v35 = *(void **)(a1 + 32);
        objc_msgSend(v5, "recordID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "recordName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "changeWithRecordName:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v38, "cloudRecord");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isRecordCreated");

          if (v40)
          {
            v41 = (void *)MEMORY[0x1D17BA0A0]();
            v42 = v30;
            HMFGetOSLogHandle();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v58 = v44;
              _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Conflict caused by new record, zone and cache can be out of sync, resetting token for fetch", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v41);
            objc_msgSend(*(id *)(a1 + 32), "cloudZone");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setServerChangeToken:", 0);

            v46 = (void *)MEMORY[0x1D17BA0A0]();
            v47 = v42;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v58 = v49;
              _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because record conflict", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v46);
            objc_msgSend(v47, "cloudCache");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setDatabaseServerChangeToken:", 0);

            objc_msgSend(v47, "cloudCache");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "persistDatabaseServerChangeToken");

          }
        }
        v52 = *(void **)(a1 + 32);
        objc_msgSend(v5, "recordID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "resetRecordWithRecordID:", v53);

        goto LABEL_28;
      }
      v28 = objc_msgSend(v6, "code");

      if (v28 == 11)
        goto LABEL_18;
    }
    else
    {

    }
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = WeakRetained;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "recordName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmd_conciseCKError");
      v56 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v58 = v23;
      v59 = 2112;
      v60 = v24;
      v61 = 2112;
      v62 = v25;
      v63 = 2112;
      v64 = v27;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Could not save record %@/%@: %@", buf, 0x2Au);

      v20 = v56;
    }

    objc_autoreleasePoolPop(v20);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v55 = v5;
      v17 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v14;
      v59 = 2112;
      v60 = v15;
      v61 = 2112;
      v62 = v18;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Saved record %@/%@", buf, 0x20u);

      v11 = v17;
      v5 = v55;

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 32), "setSaveAsProcessedWithRecord:", v5);
  }
LABEL_28:

}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_73(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  id v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  void *v53;
  id *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id *v72;
  NSObject *v73;
  void *v74;
  id v75;
  void *v76;
  id *v77;
  NSObject *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  id *v87;
  id v88;
  id *from;
  void *v90;
  id *v91;
  void *v92;
  void *v93;
  id *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD block[4];
  id v99;
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  void *v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    from = a1 + 8;
    v12 = WeakRetained[1];
    v13 = v12;
    v14 = (os_signpost_id_t)a1[9];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v13, OS_SIGNPOST_INTERVAL_END, v14, "UploadTransaction", ", buf, 2u);
    }
    v92 = v7;

    objc_msgSend(v11, "logEventSubmitter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCloudSyncUploadLogEvent uploadCompletedWithError:](HMDCloudSyncUploadLogEvent, "uploadCompletedWithError:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitLogEvent:", v16);

    objc_msgSend(v11, "delegate");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[4], "wasZoneCreated"))
    {
      objc_msgSend(a1[4], "cloudZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "zone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "zoneID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "owner");
      v21 = a1;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_addHomeZoneName:owner:", v20, v22);

      a1 = v21;
    }
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v91 = v11;
    v94 = v11;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v25)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmd_conciseCKError");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v111 = v26;
        v112 = 2114;
        v113 = (uint64_t)v28;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to save records due %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      if (*(_BYTE *)(*((_QWORD *)a1[7] + 1) + 24))
      {
        v29 = a1;
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v94;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29[5], "zone");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "zoneID");
          v35 = v9;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "zoneName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v111 = v33;
          v112 = 2112;
          v113 = (uint64_t)v37;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to save records because zone %@ does not exist", buf, 0x16u);

          v9 = v35;
        }

        objc_autoreleasePoolPop(v30);
        objc_msgSend(v31, "_verifyZoneHasBeenDeletedTransaction:completionHandler:", v29[4], v29[6]);
        v38 = v90;
        v11 = v91;
        v7 = v92;
        goto LABEL_57;
      }
      v38 = v90;
      v11 = v91;
      v7 = v92;
      if (objc_msgSend(a1[4], "needConflictResolution"))
      {
        if (objc_msgSend(a1[4], "isHomeManagerTransaction"))
        {
          v58 = (void *)MEMORY[0x1D17BA0A0]();
          v59 = v94;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v93 = v58;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v111 = v61;
            _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Need conflict resolution for home manager, schedule zone fetch and repush.", buf, 0xCu);

            v58 = v93;
          }

          objc_autoreleasePoolPop(v58);
          objc_msgSend(v90, "fetchHomeManagerCloudConflict:withDelay:", 1, 0.0);
        }
        else if (objc_msgSend(a1[4], "isHomeTransaction"))
        {
          v76 = (void *)MEMORY[0x1D17BA0A0]();
          v77 = v94;
          HMFGetOSLogHandle();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = a1[5];
            *(_DWORD *)buf = 138543618;
            v111 = v79;
            v112 = 2112;
            v113 = (uint64_t)v80;
            _os_log_impl(&dword_1CD062000, v78, OS_LOG_TYPE_INFO, "%{public}@Need conflict resolution for home %@, schedule zone fetch and repush.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v76);
          v81 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(a1[5], "zone");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "zoneID");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "zoneName");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = (void *)objc_msgSend(v81, "initWithUUIDString:", v84);

          if (v85)
            objc_msgSend(v90, "fetchHomeFromCloudZone:cloudConflict:withDelay:", v85, 1, 0.0);

        }
      }
    }
    else
    {
      if (v25)
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v92, "count");
        *(_DWORD *)buf = 138543618;
        v111 = v39;
        v112 = 2048;
        v113 = v40;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Saved %ld records", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v88 = v8;
      v41 = v8;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v107;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v107 != v44)
              objc_enumerationMutation(v41);
            objc_msgSend(a1[4], "setDeleteAsProcessedWithRecordID:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i));
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
        }
        while (v43);
      }
      v87 = a1;

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v46 = v41;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
      v48 = v94;
      if (v47)
      {
        v49 = v47;
        v50 = *(_QWORD *)v103;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v103 != v50)
              objc_enumerationMutation(v46);
            v52 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j);
            v53 = (void *)MEMORY[0x1D17BA0A0]();
            v54 = v48;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v111 = v56;
              v112 = 2112;
              v113 = v52;
              _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_INFO, "%{public}@   Deleting: %@", buf, 0x16u);

              v48 = v94;
            }

            objc_autoreleasePoolPop(v53);
          }
          v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
        }
        while (v49);
      }

      a1 = v87;
      if (objc_msgSend(v87[4], "moreChangesToProcess"))
      {
        objc_msgSend(v48, "workQueue");
        v57 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_75;
        block[3] = &unk_1E89BC548;
        objc_copyWeak(&v101, from);
        v99 = v87[4];
        v100 = v87[6];
        dispatch_async(v57, block);

        objc_destroyWeak(&v101);
        v11 = v91;
        v7 = v92;
        v9 = 0;
        v8 = v88;
        v38 = v90;
LABEL_57:

        goto LABEL_58;
      }
      v9 = 0;
      v38 = v90;
      v11 = v91;
      if (objc_msgSend(v87[4], "isHomeManagerTransaction"))
      {
        v62 = (void *)MEMORY[0x1D17BA0A0]();
        v63 = v48;
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v111 = v65;
          _os_log_impl(&dword_1CD062000, v64, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch of home manager zone to update server token", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v62);
        objc_msgSend(v90, "fetchHomeManagerCloudConflict:withDelay:", 0, 0.0);
        v7 = v92;
        v8 = v88;
      }
      else
      {
        v7 = v92;
        v8 = v88;
        if (objc_msgSend(v87[4], "isHomeTransaction"))
        {
          v66 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v87[5], "zone");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "zoneID");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "zoneName");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)objc_msgSend(v66, "initWithUUIDString:", v69);

          v71 = (void *)MEMORY[0x1D17BA0A0]();
          v72 = v94;
          HMFGetOSLogHandle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v87[5];
            *(_DWORD *)buf = 138543874;
            v111 = v74;
            v112 = 2112;
            v113 = (uint64_t)v75;
            v114 = 2112;
            v115 = v70;
            _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch of zone %@/%@ to update server token", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v71);
          if (v70)
            objc_msgSend(v90, "fetchHomeFromCloudZone:cloudConflict:withDelay:", v70, 0, 0.0);

          v9 = 0;
          v8 = v88;
        }
      }
    }
    if (a1[6])
    {
      objc_msgSend(v94, "clientCallbackQueue");
      v86 = objc_claimAutoreleasedReturnValue();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_76;
      v95[3] = &unk_1E89C1D68;
      v97 = a1[6];
      v96 = v9;
      dispatch_async(v86, v95);

    }
    goto LABEL_57;
  }
LABEL_58:

}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_75(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_uploadTransaction:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      {
        v9 = objc_msgSend(v6, "code");

        if (v9 == 26)
        {
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          v11 = WeakRetained;
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v23 = v13;
            v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Zone %@ does not exist in cloud, nothing to delete", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(v11, "clientCallbackQueue");
            v15 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_62;
            block[3] = &unk_1E89C0870;
            v21 = *(id *)(a1 + 48);
            dispatch_async(v15, block);

          }
        }
      }
      else
      {

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setZoneWasDeleted:", 1);
    }
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "clientCallbackQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2_63;
      v17[3] = &unk_1E89C1D68;
      v19 = *(id *)(a1 + 48);
      v18 = v6;
      dispatch_async(v16, v17);

    }
  }

}

void __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_14;
  if (!v6)
  {
    objc_msgSend(WeakRetained, "_uploadTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_14;
  }
  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v10 = objc_msgSend(v6, "code");

    if (v10 == 26)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v8;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Create zone %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v12, "_createZoneAndUploadTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      goto LABEL_14;
    }
  }
  else
  {

  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = v8;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch zone %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v17, "clientCallbackQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_65;
    v22[3] = &unk_1E89C1D68;
    v24 = *(id *)(a1 + 48);
    v23 = v6;
    dispatch_async(v21, v22);

  }
LABEL_14:

}

uint64_t __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2_63(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "zone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v7)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = WeakRetained;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v32 = v12;
        v33 = 2112;
        v34 = v13;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine if zone %@ was deleted in the cloud with error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v10, "clientCallbackQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_60;
        block[3] = &unk_1E89C1D68;
        v15 = &v30;
        v30 = *(id *)(a1 + 48);
        v29 = v7;
        dispatch_async(v14, block);

        v16 = v29;
LABEL_16:

      }
    }
    else
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = WeakRetained;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v32 = v22;
          v33 = 2112;
          v34 = v23;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Zone %@ was deleted in the cloud", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(*(id *)(a1 + 40), "setZoneWasDeleted:", 1);
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v32 = v24;
          v33 = 2112;
          v34 = v25;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Zone %@ does not exist in cloud and transaction is not marked to create, cannot upload records", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
      }
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v19, "clientCallbackQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_61;
        v26[3] = &unk_1E89C0870;
        v15 = &v27;
        v27 = *(id *)(a1 + 48);
        dispatch_async(v16, v26);
        goto LABEL_16;
      }
    }
  }

}

uint64_t __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "hmd_conciseCKError");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        v8 = v16;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to create zone %@ due to error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v9, "clientCallbackQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_56;
        block[3] = &unk_1E89C1D68;
        v19 = *(id *)(a1 + 48);
        v18 = v6;
        dispatch_async(v15, block);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setZoneWasCreated:", 1);
      objc_msgSend(WeakRetained, "_uploadTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }

}

uint64_t __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "accountActive") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v4;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction upload", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (a1[5])
    {
      objc_msgSend(v7, "clientCallbackQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_55;
      block[3] = &unk_1E89C0870;
      v16 = a1[5];
      dispatch_async(v10, block);

    }
  }
  else
  {
    v5 = a1[4];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_2;
    v11[3] = &unk_1E89C0650;
    objc_copyWeak(&v14, v2);
    v12 = a1[4];
    v13 = a1[5];
    objc_msgSend(v5, "loadCloudRecordsAndDetermineDeletesFromCache:", v11);

    objc_destroyWeak(&v14);
  }

}

void __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_55(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_3;
    block[3] = &unk_1E89C1B48;
    block[4] = v3;
    v6 = a1[4];
    v7 = a1[5];
    dispatch_async(v4, block);

  }
}

uint64_t __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkZoneAndUploadTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 48);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      objc_msgSend(v3, "recordID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v7, OS_SIGNPOST_EVENT, v8, "FetchTransaction", "recordcallbackrecordName=%{signpost.description:attribute}@ ", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(v5, "logEventSubmitter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRecordChangedLogEvent recordChanged:](HMDRecordChangedLogEvent, "recordChanged:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "submitLogEvent:", v12);

    objc_msgSend(*(id *)(a1 + 32), "addChangeWithRecord:", v3);
  }

}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 48);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      objc_msgSend(v5, "recordName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v12;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v10, OS_SIGNPOST_EVENT, v11, "FetchTransaction", "deletecallbackrecordName=%{signpost.description:attribute}@ ", (uint8_t *)&v18, 0xCu);

    }
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Received deleted record changed event for record %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 32), "addChangeWithDeletedRecordID:", v5);
  }

}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_47(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "logEventSubmitter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCloudSyncFetchLogEvent fetchCompletedWithError:](HMDCloudSyncFetchLogEvent, "fetchCompletedWithError:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "submitLogEvent:", v11);

    if (a1[5])
    {
      objc_msgSend(v7, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0C947D8];
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      {
        v14 = objc_msgSend(v7, "code");

        if (v14 == 21)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = v9;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v45 = v18;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed due to expired token, resetting token and re-fetching", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          objc_msgSend(a1[4], "cloudZone");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setServerChangeToken:", 0);
          objc_msgSend(v16, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a1[4], "isHomeManagerTransaction"))
          {
            v21 = objc_msgSend(v20, "fetchHomeManagerCloudConflict:withDelay:", 0, 0.0);
          }
          else
          {
            v21 = objc_msgSend(a1[4], "isHomeTransaction");
            if ((_DWORD)v21)
            {
              v28 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v19, "zone");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "zoneID");
              v40 = v20;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "zoneName");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend(v28, "initWithUUIDString:", v31);

              v20 = v40;
              if (v32)
                objc_msgSend(v40, "fetchHomeFromCloudZone:cloudConflict:withDelay:", v32, 0, 0.0);

            }
          }
          v33 = (void *)MEMORY[0x1D17BA0A0](v21);
          v34 = v16;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v45 = v36;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because zone fetch failed", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v33);
          objc_msgSend(v34, "cloudCache");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setDatabaseServerChangeToken:", 0);

          objc_msgSend(v34, "cloudCache");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "persistDatabaseServerChangeToken");

          goto LABEL_24;
        }
      }
      else
      {

      }
      objc_msgSend(v7, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", v13))
      {
        v23 = objc_msgSend(v7, "code");

        if (v23 == 26)
        {
          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = v9;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v45 = v27;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Zone does not exist in cloud, nothing to fetch", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v24);
          objc_msgSend(a1[4], "setZoneWasDeleted:", 1);
          goto LABEL_24;
        }
      }
      else
      {

      }
      objc_msgSend(a1[4], "setUpdatedServerChangeToken:", v6);
LABEL_24:
      objc_msgSend(v9, "clientCallbackQueue");
      v39 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_49;
      block[3] = &unk_1E89C1D68;
      v43 = a1[5];
      v42 = v7;
      dispatch_async(v39, block);

    }
  }

}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  id *v17;
  NSObject *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  void *v27;
  id *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = (id *)WeakRetained;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = v14;
    v19 = a5;
    v20 = v12;
    v21 = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v22;
    v34 = 2112;
    v35 = v23;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetch record completion for zone %@", buf, 0x16u);

    v13 = v21;
    v12 = v20;
    a5 = v19;
    v14 = v31;
  }

  objc_autoreleasePoolPop(v16);
  if (v17)
  {
    v24 = v17[1];
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 56);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v25, OS_SIGNPOST_INTERVAL_END, v26, "FetchTransaction", ", buf, 2u);
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v17;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Completion handler for fetch has already been called", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if ((a5 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_14;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {

    goto LABEL_9;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 26)
  {
LABEL_9:
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because zone fetch failed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v12, "cloudCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDatabaseServerChangeToken:", 0);

    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Zone does not exist in cloud, nothing to fetch", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "setZoneWasDeleted:", 1);
LABEL_12:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "clientCallbackQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_53;
    v17[3] = &unk_1E89C1D68;
    v19 = *(id *)(a1 + 40);
    v18 = v3;
    dispatch_async(v16, v17);

  }
LABEL_14:

}

uint64_t __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "accountActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke_37;
      block[3] = &unk_1E89C0870;
      v8 = *(id *)(a1 + 48);
      dispatch_async(v6, block);

    }
  }
}

void __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke_37(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 75);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __38__HMDCloudManager_removeHomeZoneName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeHomeZoneName:", *(_QWORD *)(a1 + 32));

}

void __42__HMDCloudManager__addHomeZoneName_owner___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_setupSubscriptionForZone:", a2);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchHomeFromCloudZone:cloudConflict:withDelay:", v4, 0, 0.0);

}

void __41__HMDCloudManager_addHomeZoneName_owner___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addHomeZoneName:owner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__HMDCloudManager___deleteRecordWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v18 = 138543874;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed deleting record with operation ID %@ and error %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
  {
    objc_msgSend(v8, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v15);

  }
}

void __64__HMDCloudManager___deleteRecordZonesWithIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v16 = 138543874;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed deleting record zones with operation ID %@ and error %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v8, v9);

}

void __62__HMDCloudManager___deleteRecordZoneWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v5);

  }
}

void __54__HMDCloudManager___saveRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v19 = 138543874;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed saving record zone with operation ID %@ and error %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 48), "zoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
  {
    objc_msgSend(v7, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v16);

  }
}

void __61__HMDCloudManager___fetchRecordZoneWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed fetching record zone with operation ID %@ and error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v12);

  }
}

void __62__HMDCloudManager___fetchAllRecordZonesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed fetching all record zone with operation ID %@ and error %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    objc_msgSend(v5, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);

  }
}

void __56__HMDCloudManager___saveSubscription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v39 = v13;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed saving zone subscription with operation ID %@ and error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 48), "subscriptionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = 0;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v7;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v29 = v9;
      v20 = a1;
      v30 = v7;
      v31 = v8;
      v21 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(obj);
          v17 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v17;
          else
            v23 = 0;
          v24 = v23;

          if (v24)
          {
            objc_msgSend(v24, "subscriptionID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v20 + 48), "subscriptionID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "isEqualToString:", v26);

            if ((v27 & 1) != 0)
            {
              v7 = v30;
              v8 = v31;
              goto LABEL_19;
            }
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        v8 = v31;
        if (v19)
          continue;
        break;
      }
      v17 = 0;
      v7 = v30;
LABEL_19:
      v16 = 0;
      v9 = v29;
      a1 = v20;
    }
    else
    {
      v17 = 0;
    }

  }
  v28 = *(_QWORD *)(a1 + 56);
  if (v28)
    (*(void (**)(uint64_t, id, void *))(v28 + 16))(v28, v17, v16);

}

void __63__HMDCloudManager___fetchSubscriptionWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed fetching zone subscription with operation ID %@ and error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v13, v12);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_39532 != -1)
    dispatch_once(&logCategory__hmf_once_t2_39532, &__block_literal_global_39533);
  return (id)logCategory__hmf_once_v3_39534;
}

void __30__HMDCloudManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_39534;
  logCategory__hmf_once_v3_39534 = v0;

}

@end
