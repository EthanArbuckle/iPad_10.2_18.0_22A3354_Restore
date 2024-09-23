@implementation HMDPersonSettingsManager

- (HMDPersonSettingsManager)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDPersonSettingsManagerDependencyFactory *v10;
  HMDPersonSettingsManager *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HMDPersonSettingsManagerDependencyFactory);
  v11 = -[HMDPersonSettingsManager initWithHome:backingStoreContext:dependencyFactory:workQueue:](self, "initWithHome:backingStoreContext:dependencyFactory:workQueue:", v7, v9, v10, v6);

  return v11;
}

- (HMDPersonSettingsManager)initWithHome:(id)a3 backingStoreContext:(id)a4 dependencyFactory:(id)a5 workQueue:(id)a6
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
    v18 = (void *)MEMORY[0x24BDD78B0];
    objc_msgSend(v10, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "personSettingsManagerUUIDFromHomeUUID:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v20;

    objc_storeStrong((id *)&v15->_backingStoreContext, a4);
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

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDPersonSettingsManager", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPersonSettingsManager _maybeMigrateSettings](v5, "_maybeMigrateSettings");
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
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  HMDPersonSettingsManager *v16;
  id v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching classification notification settings from MKFLocalPersonClassificationRegistration", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x2020000000;
  v21 = 1;
  -[HMDPersonSettingsManager backingStoreContext](v6, "backingStoreContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__HMDPersonSettingsManager_areClassificationNotificationsEnabledForPersonUUID___block_invoke;
  v14[3] = &unk_24E79B5F8;
  v10 = v4;
  v15 = v10;
  v16 = v6;
  v11 = v9;
  v17 = v11;
  p_buf = &buf;
  objc_msgSend(v11, "unsafeSynchronousBlock:", v14);
  v12 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v12;
}

- (void)remove
{
  void *v3;
  HMDPersonSettingsManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HMDPersonSettingsManager *v11;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing person settings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPersonSettingsManager backingStoreContext](v4, "backingStoreContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__HMDPersonSettingsManager_remove__block_invoke;
  v9[3] = &unk_24E79C268;
  v10 = v7;
  v11 = v4;
  v8 = v7;
  objc_msgSend(v8, "performBlock:", v9);

}

- (NSURL)personSettingsManagerMigrationFileURL
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  -[HMDPersonSettingsManager UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/HMDPersonSettingsManager-%@.plist"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (id)_localPersonClassificationSettings
{
  void *v3;
  void *v4;
  void *v5;
  MKFLocalPersonClassificationSettings *v6;
  void *v7;
  HMDPersonSettingsManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonSettingsManager backingStoreContext](self, "backingStoreContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hmd_assertIsExecuting");
  -[HMDPersonSettingsManager UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalPersonClassificationSettings fetchPersonClassificationSettingsForModelID:managedObjectContext:](MKFLocalPersonClassificationSettings, "fetchPersonClassificationSettingsForModelID:managedObjectContext:", v5, v4);
  v6 = (MKFLocalPersonClassificationSettings *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Person classification settings do not exist, assuming it has not been created yet", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = -[MKFLocalPersonClassificationSettings initWithContext:]([MKFLocalPersonClassificationSettings alloc], "initWithContext:", v4);
    -[HMDPersonSettingsManager UUID](v8, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFLocalPersonClassificationSettings setModelID:](v6, "setModelID:", v11);

  }
  return v6;
}

- (void)_setClassificationNotificationsEnabled:(BOOL)a3 personUUID:(id)a4 settings:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MKFLocalPersonClassificationRegistration *v13;
  void *v14;
  HMDPersonSettingsManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[HMDPersonSettingsManager backingStoreContext](self, "backingStoreContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hmd_assertIsExecuting");
  objc_msgSend(v9, "modelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalPersonClassificationRegistration fetchPersonClassificationRegistrationForPersonUUID:settingsModelUUID:managedObjectContext:](MKFLocalPersonClassificationRegistration, "fetchPersonClassificationRegistrationForPersonUUID:settingsModelUUID:managedObjectContext:", v8, v12, v11);
  v13 = (MKFLocalPersonClassificationRegistration *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v17;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Person classification registration setting does not exist for person %@, assuming it has not been created yet", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = -[MKFLocalPersonClassificationRegistration initWithContext:]([MKFLocalPersonClassificationRegistration alloc], "initWithContext:", v11);
    -[MKFLocalPersonClassificationRegistration setPersonUUID:](v13, "setPersonUUID:", v8);
    objc_msgSend(v9, "addClassificationRegistrationsObject:", v13);
  }
  -[MKFLocalPersonClassificationRegistration setEnabled:](v13, "setEnabled:", v6);

}

- (void)_removeMigrationSettingsFileFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDPersonSettingsManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonSettingsManager personSettingsManagerMigrationFileURL](self, "personSettingsManagerMigrationFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonSettingsManager dependencyFactory](self, "dependencyFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "removeItemAtURL:error:", v3, &v11);
  v6 = v11;

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing migration settings file from disk : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_maybeMigrateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  HMDPersonSettingsManager *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDPersonSettingsManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDPersonSettingsManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDPersonSettingsManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonSettingsManager personSettingsManagerMigrationFileURL](self, "personSettingsManagerMigrationFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonSettingsManager dependencyFactory](self, "dependencyFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "fileExistsAtURL:", v3) & 1) != 0)
  {
    v40 = 0;
    objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v3, 2, &v40);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v40;
    if (v6)
    {
      v8 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend((id)objc_opt_class(), "_allowedClassesForMigrationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v7;
      objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v39);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v39;

      if (v10)
      {
        v12 = v10;
        objc_opt_class();
        v13 = objc_opt_isKindOfClass() & 1;
        if (v13)
          v14 = v12;
        else
          v14 = 0;
        v35 = v14;

        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v13)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v19;
            v43 = 2112;
            v44 = v12;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Found HH1 classification settings: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
          -[HMDPersonSettingsManager backingStoreContext](v16, "backingStoreContext", v35);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke;
          v36[3] = &unk_24E79BBD0;
          v36[4] = v16;
          v37 = v12;
          v38 = v20;
          v21 = v20;
          objc_msgSend(v21, "unsafeSynchronousBlock:", v36);
          -[HMDPersonSettingsManager _removeMigrationSettingsFileFromDisk](v16, "_removeMigrationSettingsFileFromDisk");

        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v34;
            v43 = 2112;
            v44 = v12;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
        }

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
          *(_DWORD *)buf = 138543618;
          v42 = v33;
          v43 = 2112;
          v44 = v11;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
      }

      v7 = v11;
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
        *(_DWORD *)buf = 138543874;
        v42 = v29;
        v43 = 2112;
        v44 = v3;
        v45 = 2112;
        v46 = v7;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from file %@: %@", buf, 0x20u);

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
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v25;
      v43 = 2112;
      v44 = v3;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@HH1 classification settings file does not exist : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }

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

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch classification notifications enabled for person message with payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD69D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[HMDPersonSettingsManager areClassificationNotificationsEnabledForPersonUUID:](v7, "areClassificationNotificationsEnabledForPersonUUID:", v11);
    v13 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding with classificationNotificationsEnabledForPerson: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12, *MEMORY[0x24BDD69C8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v19);

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
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because we could not find the person UUID in the message payload", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
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

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update classification notifications enabled for person message with payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD69D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD69C8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch classification notifications enabled because information is missing from the message payload - personUUID: %@, enabled:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v19);
  }
  else
  {
    -[HMDPersonSettingsManager _setClassificationNotificationsEnabled:forPersonUUID:](v7, "_setClassificationNotificationsEnabled:forPersonUUID:", v12, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __89__HMDPersonSettingsManager__handleSetClassificationNotificationsEnabledForPersonMessage___block_invoke;
    v21[3] = &unk_24E78FCE0;
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

  v10[2] = *MEMORY[0x24BDAC8D0];
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
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonSettingsManager messageDispatcher](self, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD69D0], self, v7, sel__handleFetchClassificationNotificationsEnabledForPersonMessage_);

  -[HMDPersonSettingsManager messageDispatcher](self, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD69E0], self, v7, sel__handleSetClassificationNotificationsEnabledForPersonMessage_);

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
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPersonSettingsManager workQueue](self, "workQueue");
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
    v30 = v12;
    v31 = 2112;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating the local person registration with classification notifications enabled: %@, for person with UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDPersonSettingsManager backingStoreContext](v10, "backingStoreContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __81__HMDPersonSettingsManager__setClassificationNotificationsEnabled_forPersonUUID___block_invoke;
  v24[3] = &unk_24E79AD20;
  v24[4] = v10;
  v25 = v6;
  v26 = v7;
  v27 = v13;
  v28 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v7;
  v18 = v6;
  objc_msgSend(v16, "performBlock:", v24);
  v19 = (void *)MEMORY[0x24BE6B628];
  -[HMDPersonSettingsManager workQueue](v10, "workQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "schedulerWithDispatchQueue:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reschedule:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
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

- (HMCContext)backingStoreContext
{
  return (HMCContext *)objc_getProperty(self, a2, 16, 1);
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
  objc_storeStrong((id *)&self->_backingStoreContext, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __81__HMDPersonSettingsManager__setClassificationNotificationsEnabled_forPersonUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_localPersonClassificationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setClassificationNotificationsEnabled:personUUID:settings:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(_QWORD *)(a1 + 48), v2);
  v3 = *(void **)(a1 + 56);
  v11 = 0;
  v4 = objc_msgSend(v3, "save:", &v11);
  v5 = v11;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to save person classification settings for person %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }
  objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v5);

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

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v16, v15);

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

void __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_localPersonClassificationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke_2;
  v13[3] = &unk_24E785880;
  v3 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v14 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  v5 = *(void **)(a1 + 48);
  v12 = 0;
  v6 = objc_msgSend(v5, "save:", &v12);
  v7 = v12;
  if ((v6 & 1) == 0)
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
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to save person classification settings during migration: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __49__HMDPersonSettingsManager__maybeMigrateSettings__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_setClassificationNotificationsEnabled:personUUID:settings:", objc_msgSend(a3, "BOOLValue"), v6, *(_QWORD *)(a1 + 40));

}

void __34__HMDPersonSettingsManager_remove__block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalPersonClassificationSettings fetchPersonClassificationSettingsForModelID:managedObjectContext:](MKFLocalPersonClassificationSettings, "fetchPersonClassificationSettingsForModelID:managedObjectContext:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "deleteObject:", v4);
    objc_msgSend(*(id *)(a1 + 32), "save");
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@No local person classification settings were found for removal", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __79__HMDPersonSettingsManager_areClassificationNotificationsEnabledForPersonUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalPersonClassificationRegistration fetchPersonClassificationRegistrationForPersonUUID:settingsModelUUID:managedObjectContext:](MKFLocalPersonClassificationRegistration, "fetchPersonClassificationRegistrationForPersonUUID:settingsModelUUID:managedObjectContext:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "enabled");
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Person classification registration settings do not exist, returning default setting: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

+ (id)_allowedClassesForMigrationSettings
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

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_118829 != -1)
    dispatch_once(&logCategory__hmf_once_t24_118829, &__block_literal_global_118830);
  return (id)logCategory__hmf_once_v25_118831;
}

void __39__HMDPersonSettingsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_118831;
  logCategory__hmf_once_v25_118831 = v0;

}

@end
