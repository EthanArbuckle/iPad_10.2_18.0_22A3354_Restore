@implementation HMDPersonSettingsManager

- (HMDPersonSettingsManager)initWithHome:(id)a3 localZone:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDPersonSettingsManagerDependencyFactory *v11;
  HMDPersonSettingsManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDPersonSettingsManagerDependencyFactory);
  v12 = -[HMDPersonSettingsManager initWithHome:localZone:dependencyFactory:workQueue:](self, "initWithHome:localZone:dependencyFactory:workQueue:", v10, v9, v11, v8);

  return v12;
}

- (HMDPersonSettingsManager)initWithHome:(id)a3 localZone:(id)a4 dependencyFactory:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDPersonSettingsManager *v14;
  HMDPersonSettingsManager *v15;
  uint64_t v16;
  HMFMessageDispatcher *messageDispatcher;
  void *v18;
  void *v19;
  uint64_t v20;
  NSUUID *UUID;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDPersonSettingsManager;
  v14 = -[HMDPersonSettingsManager init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    objc_msgSend(v10, "msgDispatcher");
    v16 = objc_claimAutoreleasedReturnValue();
    messageDispatcher = v15->_messageDispatcher;
    v15->_messageDispatcher = (HMFMessageDispatcher *)v16;

    objc_storeStrong((id *)&v15->_dependencyFactory, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
    v18 = (void *)MEMORY[0x1E0CBA758];
    objc_msgSend(v10, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "personSettingsManagerUUIDFromHomeUUID:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v20;

    objc_storeStrong((id *)&v15->_localZone, a4);
  }

  return v15;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  HMDPersonSettingsManager *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDPersonSettingsManager", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPersonSettingsManager _registerForMessages](v5, "_registerForMessages");
}

- (BOOL)areClassificationNotificationsEnabledForPersonUUID:(id)a3
{
  id v4;
  void *v5;
  HMDPersonSettingsManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDPersonSettingsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDPersonSettingsManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching classification notification settings from HMDPersonSettingsModel", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonSettingsManager localZone](v6, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPersonSettingsModel sentinelModelUUID](HMDPersonSettingsModel, "sentinelModelUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchModelWithModelID:ofType:error:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "classificationNotificationsEnabledForPersonUUID:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v6;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v23;
        v28 = 2112;
        v29 = v4;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@No classification notification setting has been set for person with uuid: %@, so returning default value: %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v14 = 1;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Person settings model does not exist, returning default setting: %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 1;
  }

  return v14;
}

- (void)remove
{
  void *v3;
  HMDPersonSettingsManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing person settings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPersonSettingsManager localZone](v4, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  +[HMDPersonSettingsModel sentinelModelUUID](HMDPersonSettingsModel, "sentinelModelUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Remove Person Settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeModelIDs:options:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__HMDPersonSettingsManager_remove__block_invoke;
  v14[3] = &unk_1E89B8308;
  v14[4] = v4;
  v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v14);

}

- (NSURL)personSettingsManagerMigrationFileURL
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  -[HMDPersonSettingsManager UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/HMDPersonSettingsManager-%@.plist"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (void)savePersonManagerSettingsToLocalDiskForMigration
{
  void *v3;
  HMDPersonSettingsManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDPersonSettingsManager *v10;
  void *v11;
  void *v12;
  HMDPersonSettingsManager *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  HMDPersonSettingsManager *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDPersonSettingsManager *v22;
  HMDPersonSettingsManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDPersonSettingsManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *context;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  HMDPersonSettingsManager *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Saving person classification settings to disk for migration", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPersonSettingsManager localZone](v4, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPersonSettingsModel sentinelModelUUID](HMDPersonSettingsModel, "sentinelModelUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchModelWithModelID:ofType:error:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "faceClassificationNotificationsEnabledByPersonUUID");
  v10 = (HMDPersonSettingsManager *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  if (v9 && v10)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v4;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v15;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Saving person classification settings %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v33);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (HMDPersonSettingsManager *)v33;
    if (v16)
    {
      -[HMDPersonSettingsManager personSettingsManagerMigrationFileURL](v13, "personSettingsManagerMigrationFileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPersonSettingsManager dependencyFactory](v13, "dependencyFactory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "persistentStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "writeData:toStorePath:dataLabel:", v16, v21, CFSTR("PersonClassificationSettings"));
      v22 = (HMDPersonSettingsManager *)objc_claimAutoreleasedReturnValue();

      context = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v13;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v25;
        v36 = 2112;
        v37 = v22;
        v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Saved [%@] bytes to [%@]", buf, 0x20u);

        v11 = v31;
      }

      objc_autoreleasePoolPop(context);
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v13;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v30;
        v36 = 2112;
        v37 = v17;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      v16 = 0;
    }
  }
  else
  {
    v17 = v4;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@No person classification settings found, skipping", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v11);
}

- (void)_handleFetchClassificationNotificationsEnabledForPersonMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDPersonSettingsManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDPersonSettingsManager *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch classification notifications enabled for person message with payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB9870]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[HMDPersonSettingsManager areClassificationNotificationsEnabledForPersonUUID:](v7, "areClassificationNotificationsEnabledForPersonUUID:", v11);
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding with classificationNotificationsEnabledForPerson: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12, *MEMORY[0x1E0CB9860]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v19);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because we could not find the person UUID in the message payload", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);
  }

}

- (void)_handleSetClassificationNotificationsEnabledForPersonMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonSettingsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  HMDPersonSettingsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update classification notifications enabled for person message with payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB9870]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9860]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because information is missing from the message payload - personUUID: %@, enabled:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v19);
  }
  else
  {
    -[HMDPersonSettingsManager _setClassificationNotificationsEnabled:forPersonUUID:](v7, "_setClassificationNotificationsEnabled:forPersonUUID:", v12, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke;
    v21[3] = &unk_1E89B8190;
    v21[4] = v7;
    v22 = v4;
    v20 = (id)objc_msgSend(v19, "addCompletionBlock:", v21);

  }
}

- (void)_registerForMessages
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 8197);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonSettingsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonSettingsManager messageDispatcher](self, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9868], self, v7, sel__handleFetchClassificationNotificationsEnabledForPersonMessage_);

  -[HMDPersonSettingsManager messageDispatcher](self, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9878], self, v7, sel__handleSetClassificationNotificationsEnabledForPersonMessage_);

}

- (id)_setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDPersonSettingsManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPersonSettingsModel *v15;
  void *v16;
  HMDPersonSettingsManager *v17;
  NSObject *v18;
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
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543874;
    v31 = v12;
    v32 = 2112;
    v33 = v6;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating the HMDPersonSettingsModel with classification notifications enabled: %@, for person with UUID: %@", (uint8_t *)&v30, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDPersonSettingsManager localZone](v10, "localZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDPersonSettingsModel sentinelModelUUID](HMDPersonSettingsModel, "sentinelModelUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchModelWithModelID:ofType:error:", v14, objc_opt_class(), 0);
  v15 = (HMDPersonSettingsModel *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Did not find HMDPersonSettingsModel, assuming it has not been created yet", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = objc_alloc_init(HMDPersonSettingsModel);
  }
  -[HMDPersonSettingsModel setClassificationNotificationsEnabled:forPersonUUID:](v15, "setClassificationNotificationsEnabled:forPersonUUID:", v6, v7);
  -[HMDPersonSettingsManager localZone](v10, "localZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Update classification notifications settings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addModels:options:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D519E8];
  -[HMDPersonSettingsManager workQueue](v10, "workQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "schedulerWithDispatchQueue:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reschedule:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "flatMap:", &__block_literal_global_83660);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPersonSettingsManager UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMDPersonSettingsManagerDependencyFactory)dependencyFactory
{
  return (HMDPersonSettingsManagerDependencyFactory *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_home);
}

uint64_t __81__HMDPersonSettingsManager__setClassificationNotificationsEnabled_forPersonUUID___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

void __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
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
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      v12 = "%{public}@Responding with error: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    v12 = "%{public}@Responding with success";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:error:", 0, v6);

}

void __34__HMDPersonSettingsManager_remove__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
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
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@Successfully removed person settings";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
      v15 = 12;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v12 = "%{public}@Failed to remove person settings with error: %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_83706 != -1)
    dispatch_once(&logCategory__hmf_once_t21_83706, &__block_literal_global_40_83707);
  return (id)logCategory__hmf_once_v22_83708;
}

void __39__HMDPersonSettingsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22_83708;
  logCategory__hmf_once_v22_83708 = v0;

}

@end
