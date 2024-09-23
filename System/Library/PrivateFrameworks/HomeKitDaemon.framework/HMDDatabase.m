@implementation HMDDatabase

- (HMDDatabase)initWithFileURL:(id)a3 cloudConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDDatabase *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ECA8]), "initWithDataVersion:legacyDataVersion:", v8, v8);
  v10 = objc_alloc_init(MEMORY[0x24BE4ECF8]);
  objc_msgSend(v10, "setModelContainer:", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4EC80]), "initWithDatastorePath:configuration:", v6, v10);
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4EC50]), "initWithLocalDatabase:configuration:", v11, v7);
    if (v12)
    {
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HMDDatabase initWithLocalDatabase:cloudDatabase:logEventSubmitter:](self, "initWithLocalDatabase:cloudDatabase:logEventSubmitter:", v11, v12, v13);

      v14 = self;
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      self = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create cloud database with configuration %@", buf, 0x16u);

        v18 = v22;
      }

      objc_autoreleasePoolPop(v18);
      v14 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v17;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local database with file URL %@ and cloud configuration %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (HMDDatabase)initWithLocalDatabase:(id)a3 cloudDatabase:(id)a4 logEventSubmitter:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDDatabase *v12;
  HMDDatabase *v13;
  uint64_t v14;
  NSHashTable *delegates;
  uint64_t v16;
  NSMapTable *zoneDelegatesByLocalZone;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDDatabase;
  v12 = -[HMDDatabase init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localDatabase, a3);
    -[HMBLocalDatabase setDelegate:](v13->_localDatabase, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_cloudDatabase, a4);
    -[HMBCloudDatabase setDelegate:](v13->_cloudDatabase, "setDelegate:", v13);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    delegates = v13->_delegates;
    v13->_delegates = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    zoneDelegatesByLocalZone = v13->_zoneDelegatesByLocalZone;
    v13->_zoneDelegatesByLocalZone = (NSMapTable *)v16;

    objc_storeStrong((id *)&v13->_logEventSubmitter, a5);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  HMDDatabase *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating database", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDDatabase;
  -[HMDDatabase dealloc](&v7, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDDatabase delegates](self, "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDDatabase delegates](self, "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDDatabase *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDDatabase hasStarted](self, "hasStarted"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[HMDDatabase setHasStarted:](self, "setHasStarted:", 1);
    os_unfair_lock_unlock(p_lock);
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting database", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDDatabase cloudDatabase](v5, "cloudDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performInitialCloudSync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __20__HMDDatabase_start__block_invoke;
    v11[3] = &unk_24E798920;
    v11[4] = v5;
    v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v11);

  }
}

- (id)registerSharedSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering shared subscription for external record type %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDatabase start](v6, "start");
  -[HMDDatabase cloudDatabase](v6, "cloudDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerSharedSubscriptionForExternalRecordType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)unregisterSharedSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering shared subscription for external record type %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDatabase start](v6, "start");
  -[HMDDatabase cloudDatabase](v6, "cloudDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unregisterSharedSubscriptionForExternalRecordType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)existingPrivateZonesWithName:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDDatabase *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching existing private zones with name %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDDatabase start](v14, "start");
  v17 = objc_alloc(MEMORY[0x24BDB91F8]);
  v18 = (void *)objc_msgSend(v17, "initWithZoneName:ownerName:", v10, *MEMORY[0x24BDB8E88]);
  -[HMDDatabase zonesWithID:isPrivate:shouldCreate:configuration:delegate:error:](v14, "zonesWithID:isPrivate:shouldCreate:configuration:delegate:error:", v18, 1, 0, v11, v12, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)privateZonesWithName:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDDatabase *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching private zones with name %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDDatabase start](v14, "start");
  v17 = objc_alloc(MEMORY[0x24BDB91F8]);
  v18 = (void *)objc_msgSend(v17, "initWithZoneName:ownerName:", v10, *MEMORY[0x24BDB8E88]);
  -[HMDDatabase zonesWithID:isPrivate:shouldCreate:configuration:delegate:error:](v14, "zonesWithID:isPrivate:shouldCreate:configuration:delegate:error:", v18, 1, 1, v11, v12, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)existingSharedZoneIDWithName:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Finding shared zone ID with zone name %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDatabase start](v6, "start");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDDatabase cloudDatabase](v6, "cloudDatabase", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharedZoneIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "zoneID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "zoneName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v4);

        if ((v17 & 1) != 0)
        {
          v11 = v14;
          goto LABEL_13;
        }
      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  return v11;
}

- (id)sharedZonesWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDDatabase *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v16;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching shared zones with zone ID %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDDatabase start](v14, "start");
  objc_msgSend(v10, "zoneID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabase zonesWithID:isPrivate:shouldCreate:configuration:delegate:error:](v14, "zonesWithID:isPrivate:shouldCreate:configuration:delegate:error:", v17, 0, 0, v11, v12, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)synchronizeSharedZones
{
  void *v3;
  HMDDatabase *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Synchronizing shared zones", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDDatabase start](v4, "start");
  -[HMDDatabase cloudDatabase](v4, "cloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeSharedZones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)removePrivateZonesWithName:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v13;
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
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing private zones with name %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc(MEMORY[0x24BDB91F8]);
  v10 = (void *)objc_msgSend(v9, "initWithZoneName:ownerName:", v4, *MEMORY[0x24BDB8E88]);
  -[HMDDatabase removeZonesWithID:isPrivate:](v6, "removeZonesWithID:isPrivate:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)removeSharedZonesWithName:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDDatabase *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
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
    v18 = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing shared zones with name %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDatabase existingSharedZoneIDWithName:](v6, "existingSharedZoneIDWithName:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabase removeZonesWithID:isPrivate:](v6, "removeZonesWithID:isPrivate:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Attempted to remove a non-existing shared zone with name: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)removeLocalAndCloudDataForLocalZone:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing local and cloud data for local zone %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDatabase localDatabase](v6, "localDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeZone:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__HMDDatabase_removeLocalAndCloudDataForLocalZone___block_invoke;
  v14[3] = &unk_24E78FCE0;
  v14[4] = v6;
  v15 = v4;
  v11 = v4;
  objc_msgSend(v10, "addCompletionBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)acceptInvitation:(id)a3
{
  id v4;
  void *v5;
  HMDDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Accepting sharing invitation %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDatabase start](v6, "start");
  -[HMDDatabase cloudDatabase](v6, "cloudDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acceptInvitation:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)zonesWithID:(id)a3 isPrivate:(BOOL)a4 shouldCreate:(BOOL)a5 configuration:(id)a6 delegate:(id)a7 error:(id *)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMDDatabase *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  HMDDatabaseFetchZonesResult *v32;
  void *v33;
  HMDDatabase *v34;
  NSObject *v35;
  id v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  id v42;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v10 = a5;
  v11 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v44 = a7;
  -[HMDDatabase cloudDatabase](self, "cloudDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
  {
    if (v10)
    {
      v48 = 0;
      v17 = (id *)&v48;
      objc_msgSend(v15, "openOrCreatePrivateZoneWithID:configuration:delegate:error:", v13, v14, self, &v48);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
      v17 = (id *)&v47;
      objc_msgSend(v15, "openExistingPrivateZoneWithID:configuration:delegate:error:", v13, v14, self, &v47);
      v18 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v46 = 0;
    v17 = (id *)&v46;
    objc_msgSend(v15, "openExistingSharedZoneWithID:configuration:delegate:error:", v13, v14, self, &v46);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  v20 = *v17;

  if (v19)
  {
    v42 = v14;
    v21 = objc_alloc_init(MEMORY[0x24BE4ED00]);
    objc_msgSend(v21, "setDelegate:", self);
    objc_msgSend(v21, "setCreateIfNeeded:", 1);
    -[HMDDatabase localDatabase](self, "localDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v20;
    objc_msgSend(v22, "openZoneWithMirror:configuration:error:", v19, v21, &v45);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v45;

    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v23)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("shared");
        *(_DWORD *)buf = 138544130;
        v50 = v29;
        v51 = 2112;
        if (v11)
          v30 = CFSTR("private");
        v52 = v30;
        v53 = 2112;
        v54 = v13;
        v55 = 2112;
        v56 = v44;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Successfully opened %@ zones with zoneID: %@, delegate: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      v31 = v44;
      if (v44)
        -[HMDDatabase addZoneDelegate:forLocalZone:](v26, "addZoneDelegate:forLocalZone:", v44, v23);
      v32 = -[HMDDatabaseFetchZonesResult initWithLocalZone:cloudZone:]([HMDDatabaseFetchZonesResult alloc], "initWithLocalZone:cloudZone:", v23, v19);
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = CFSTR("shared");
        *(_DWORD *)buf = 138544130;
        v50 = v39;
        v51 = 2112;
        if (v11)
          v40 = CFSTR("private");
        v52 = v40;
        v53 = 2112;
        v54 = v13;
        v55 = 2112;
        v56 = v24;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ local zone with zoneID %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      v32 = 0;
      if (a8)
        *a8 = objc_retainAutorelease(v24);
      v31 = v44;
    }

    v14 = v42;
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
      v36 = v14;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("shared");
      *(_DWORD *)buf = 138544130;
      v50 = v37;
      v51 = 2112;
      if (v11)
        v38 = CFSTR("private");
      v52 = v38;
      v53 = 2112;
      v54 = v13;
      v55 = 2112;
      v56 = v20;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ cloud zone with zoneID %@: %@", buf, 0x2Au);

      v14 = v36;
    }

    objc_autoreleasePoolPop(v33);
    if (a8)
    {
      v24 = objc_retainAutorelease(v20);
      v32 = 0;
      *a8 = v24;
    }
    else
    {
      v32 = 0;
      v24 = v20;
    }
    v31 = v44;
  }

  return v32;
}

- (id)removeZonesWithID:(id)a3 isPrivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMDDatabase *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  HMDDatabase *v25;
  NSObject *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  HMDDatabase *v31;
  NSObject *v32;
  void *v33;
  const __CFString *v34;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("shared");
    *(_DWORD *)buf = 138543874;
    v41 = v10;
    v42 = 2112;
    if (v4)
      v11 = CFSTR("private");
    v43 = v11;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing %@ zones with ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = objc_alloc_init(MEMORY[0x24BE4EC68]);
  -[HMDDatabase cloudDatabase](v8, "cloudDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    v39 = 0;
    v15 = (id *)&v39;
    objc_msgSend(v13, "openExistingPrivateZoneWithID:configuration:delegate:error:", v6, v12, 0, &v39);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
    v15 = (id *)&v38;
    objc_msgSend(v13, "openExistingSharedZoneWithID:configuration:delegate:error:", v6, v12, 0, &v38);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  v18 = *v15;

  if (v17)
  {
    v19 = objc_alloc_init(MEMORY[0x24BE4ED00]);
    objc_msgSend(v19, "setDelegate:", v8);
    objc_msgSend(v19, "setCreateIfNeeded:", 0);
    -[HMDDatabase localDatabase](v8, "localDatabase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    objc_msgSend(v20, "openZoneWithMirror:configuration:error:", v17, v19, &v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v37;

    if (v21)
    {
      -[HMDDatabase removeLocalAndCloudDataForLocalZone:](v8, "removeLocalAndCloudDataForLocalZone:", v21);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v8;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = v30;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = CFSTR("shared");
        *(_DWORD *)buf = 138544130;
        v41 = v33;
        v42 = 2112;
        if (v4)
          v34 = CFSTR("private");
        v43 = v34;
        v44 = 2112;
        v45 = v6;
        v46 = 2112;
        v47 = v22;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ local zone with zoneID %@: %@", buf, 0x2Au);

        v30 = v36;
      }

      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (void *)v23;

    v18 = v22;
  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v8;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("shared");
      *(_DWORD *)buf = 138544130;
      v41 = v27;
      v42 = 2112;
      if (v4)
        v28 = CFSTR("private");
      v43 = v28;
      v44 = 2112;
      v45 = v6;
      v46 = 2112;
      v47 = v18;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ cloud zone with zoneID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

- (NSHashTable)delegates
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_delegates;
}

- (void)performDelegateCallback:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDDatabase delegates](self, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSMapTable)zoneDelegatesByLocalZone
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_zoneDelegatesByLocalZone;
}

- (void)addZoneDelegate:(id)a3 forLocalZone:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDDatabase zoneDelegatesByLocalZone](self, "zoneDelegatesByLocalZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabase zoneDelegatesByLocalZone](self, "zoneDelegatesByLocalZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v6);

  }
  objc_msgSend(v9, "addObject:", v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeZoneDelegate:(id)a3 forLocalZone:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDDatabase zoneDelegatesByLocalZone](self, "zoneDelegatesByLocalZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v11);
  if (!objc_msgSend(v9, "count"))
  {
    -[HMDDatabase zoneDelegatesByLocalZone](self, "zoneDelegatesByLocalZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)performZoneDelegateCallback:(id)a3 forLocalZone:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDDatabase zoneDelegatesByLocalZone](self, "zoneDelegatesByLocalZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (id)mergedActionFutureForActionFutures:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = (objc_class *)MEMORY[0x24BE6B608];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combineAllFutures:ignoringErrors:scheduler:", v4, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__HMDDatabase_mergedActionFutureForActionFutures___block_invoke;
  v14[3] = &unk_24E792720;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v8, "addSuccessBlock:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "addFailureBlock:", v11);

  return v9;
}

- (void)localDatabase:(id)a3 detectedLocalCorruptionWithInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabase *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Local database %@ detected local corruption with info: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)localDatabase:(id)a3 willRemoveZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabase *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Local database %@ will remove zone with ID: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)cloudDatabase:(id)a3 didCreateZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabase *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDDatabase *v15;
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
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ created zone with zone ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__HMDDatabase_cloudDatabase_didCreateZoneWithID___block_invoke;
  v13[3] = &unk_24E7867F8;
  v14 = v7;
  v15 = v9;
  v12 = v7;
  -[HMDDatabase performDelegateCallback:](v9, "performDelegateCallback:", v13);

}

- (id)cloudDatabase:(id)a3 willRemoveZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabase *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  HMDDatabase *v20;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543874;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ will remove zone with zone ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__HMDDatabase_cloudDatabase_willRemoveZoneWithID___block_invoke;
  v17[3] = &unk_24E786820;
  v18 = v7;
  v19 = v12;
  v20 = v9;
  v13 = v12;
  v14 = v7;
  -[HMDDatabase performDelegateCallback:](v9, "performDelegateCallback:", v17);
  objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)cloudDatabase:(id)a3 didRemoveZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabase *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDDatabase *v15;
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
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ removed zone with zone ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__HMDDatabase_cloudDatabase_didRemoveZoneWithID___block_invoke;
  v13[3] = &unk_24E7867F8;
  v14 = v7;
  v15 = v9;
  v12 = v7;
  -[HMDDatabase performDelegateCallback:](v9, "performDelegateCallback:", v13);

}

- (void)cloudDatabase:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabase *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ received message with user info %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__HMDDatabase_cloudDatabase_didReceiveMessageWithUserInfo___block_invoke;
  v13[3] = &unk_24E7867F8;
  v13[4] = v9;
  v14 = v7;
  v12 = v7;
  -[HMDDatabase performDelegateCallback:](v9, "performDelegateCallback:", v13);

}

- (void)cloudDatabase:(id)a3 encounteredError:(id)a4 withOperation:(id)a5 onZone:(id)a6
{
  id v8;
  id v9;
  HMDBackingStoreCKOperationZoneCompletionEvent *v10;
  id v11;

  v8 = a6;
  v9 = a4;
  -[HMDDatabase logEventSubmitter](self, "logEventSubmitter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHMBLogEvent initWithCloudZoneID:]([HMDBackingStoreCKOperationZoneCompletionEvent alloc], "initWithCloudZoneID:", v8);

  objc_msgSend(v11, "submitLogEvent:error:", v10, v9);
}

- (void)cloudDatabase:(id)a3 encounteredError:(id)a4 withOperation:(id)a5 onContainer:(id)a6
{
  id v8;
  id v9;
  HMDDatabaseCKOperationCompletionEvent *v10;
  void *v11;
  HMDDatabaseCKOperationCompletionEvent *v12;
  id v13;

  v8 = a6;
  v9 = a4;
  -[HMDDatabase logEventSubmitter](self, "logEventSubmitter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v10 = [HMDDatabaseCKOperationCompletionEvent alloc];
  objc_msgSend(v8, "containerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDDatabaseCKOperationCompletionEvent initWithContainerIdentifier:](v10, "initWithContainerIdentifier:", v11);
  objc_msgSend(v13, "submitLogEvent:error:", v12, v9);

}

- (void)localZone:(id)a3 didCompleteProcessingWithResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__HMDDatabase_localZone_didCompleteProcessingWithResult___block_invoke;
  v10[3] = &unk_24E786848;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HMDDatabase performZoneDelegateCallback:forLocalZone:](self, "performZoneDelegateCallback:forLocalZone:", v10, v9);

}

- (void)cloudZone:(id)a3 didUpdateParticipantWithClientIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__HMDDatabase_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke;
  v11[3] = &unk_24E786848;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v10 = v6;
  objc_msgSend(v10, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabase performZoneDelegateCallback:forLocalZone:](self, "performZoneDelegateCallback:forLocalZone:", v11, v9);

}

- (void)cloudZone:(id)a3 didRemoveParticipantWithClientIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__HMDDatabase_cloudZone_didRemoveParticipantWithClientIdentifier___block_invoke;
  v11[3] = &unk_24E786848;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v10 = v6;
  objc_msgSend(v10, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabase performZoneDelegateCallback:forLocalZone:](self, "performZoneDelegateCallback:forLocalZone:", v11, v9);

}

- (void)cloudZone:(id)a3 didChangeRebuildStatus:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDBackingStoreCKRebuildEvent *v10;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDDatabase logEventSubmitter](self, "logEventSubmitter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDBackingStoreCKRebuildEvent initWithCloudZoneID:rebuildStatus:]([HMDBackingStoreCKRebuildEvent alloc], "initWithCloudZoneID:rebuildStatus:", v8, v11);
    objc_msgSend(v9, "submitLogEvent:", v10);

  }
}

- (void)cloudZone:(id)a3 didEncounterZoneDisabledError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HMDDatabase_cloudZone_didEncounterZoneDisabledError___block_invoke;
  v11[3] = &unk_24E786848;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v10 = v6;
  objc_msgSend(v10, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabase performZoneDelegateCallback:forLocalZone:](self, "performZoneDelegateCallback:forLocalZone:", v11, v9);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDDatabase cloudDatabase](self, "cloudDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMBLocalDatabase)localDatabase
{
  return (HMBLocalDatabase *)objc_getProperty(self, a2, 16, 1);
}

- (HMBCloudDatabase)cloudDatabase
{
  return (HMBCloudDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_zoneDelegatesByLocalZone, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_cloudDatabase, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
}

void __55__HMDDatabase_cloudZone_didEncounterZoneDisabledError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cloudZone:didEncounterZoneDisabledError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __66__HMDDatabase_cloudZone_didRemoveParticipantWithClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cloudZone:didRemoveParticipantWithClientIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __66__HMDDatabase_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cloudZone:didUpdateParticipantWithClientIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__HMDDatabase_localZone_didCompleteProcessingWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "localZone:didCompleteProcessingWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__HMDDatabase_cloudDatabase_didReceiveMessageWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "database:didReceiveMessageWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __49__HMDDatabase_cloudDatabase_didRemoveZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "scope");
    if (v3 == 3)
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v8 = v11;
      v9 = v6;
      v10 = 0;
      goto LABEL_6;
    }
    if (v3 == 2)
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v8 = v4;
      v9 = v6;
      v10 = 1;
LABEL_6:
      objc_msgSend(v7, "database:didRemoveZoneWithName:isPrivate:", v8, v9, v10);

    }
  }

}

void __50__HMDDatabase_cloudDatabase_willRemoveZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "scope");
    if (v3 == 3)
    {
      v5 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoneName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      v9 = v12;
      v10 = v7;
      v11 = 0;
      goto LABEL_6;
    }
    if (v3 == 2)
    {
      v5 = *(void **)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoneName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      v9 = v4;
      v10 = v7;
      v11 = 1;
LABEL_6:
      objc_msgSend(v8, "database:willRemoveZoneWithName:isPrivate:", v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
  }

}

void __49__HMDDatabase_cloudDatabase_didCreateZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "scope");
    if (v3 == 3)
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v8 = v11;
      v9 = v6;
      v10 = 0;
      goto LABEL_6;
    }
    if (v3 == 2)
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoneName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v8 = v4;
      v9 = v6;
      v10 = 1;
LABEL_6:
      objc_msgSend(v7, "database:didCreateZoneWithName:isPrivate:", v8, v9, v10);

    }
  }

}

void __50__HMDDatabase_mergedActionFutureForActionFutures___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BE4ECE0];
  v4 = a2;
  v6 = objc_alloc_init(v3);
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_126825);

  objc_msgSend(v6, "setShouldUpdateClients:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v6);

}

uint64_t __50__HMDDatabase_mergedActionFutureForActionFutures___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldUpdateClients");
}

void __51__HMDDatabase_removeLocalAndCloudDataForLocalZone___block_invoke(uint64_t a1, void *a2, void *a3)
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v13 = "%{public}@Successfully removed local and cloud data for local zone %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_INFO;
      v16 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 138543874;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v6;
    v13 = "%{public}@Failed to remove local and cloud data for local zone %@: %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __20__HMDDatabase_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  HMDDatabaseCKOperationCompletionEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDDatabaseCKOperationCompletionEvent *v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "logEventSubmitter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [HMDDatabaseCKOperationCompletionEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDDatabaseCKOperationCompletionEvent initWithContainerIdentifier:](v6, "initWithContainerIdentifier:", v9);
  objc_msgSend(v11, "submitLogEvent:error:", v10, v5);

}

+ (NSURL)defaultLocalDatabaseFileURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = (id)storeDirectoryPath;
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("datastore3.sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

+ (void)registerQueries
{
  +[HMBModel hmbPrepareQueries](HMDCameraClipModel, "hmbPrepareQueries");
  +[HMBModel hmbPrepareQueries](HMDFaceCropModel, "hmbPrepareQueries");
  +[HMBModel hmbPrepareQueries](HMDUnassociatedFaceCropModel, "hmbPrepareQueries");
  +[HMBModel hmbPrepareQueries](HMDCameraSignificantEventNotificationModel, "hmbPrepareQueries");
  +[HMBModel hmbPrepareQueries](HMDIDSActivityRegistrationModel, "hmbPrepareQueries");
}

+ (HMDDatabase)defaultDatabase
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&defaultDatabase_defaultDatabase);
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceForKey:", CFSTR("defaultContainerIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding default container identifier to %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v6, "stringValue");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("com.apple.homekit");
    }
    v13 = objc_alloc(MEMORY[0x24BDB9038]);
    v14 = (void *)objc_msgSend(v13, "initWithContainerIdentifier:environment:", v12, cloudKitContainerEnvironment);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ECE8]), "initWithContainerID:", v14);
    objc_msgSend(v15, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.willowd.homekit"));
    objc_msgSend(v15, "setManateeContainer:", 1);
    objc_msgSend(v15, "setSubscriptionPushRegistrationAction:", 2);
    v16 = objc_alloc((Class)a1);
    +[HMDDatabase defaultLocalDatabaseFileURL](HMDDatabase, "defaultLocalDatabaseFileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithFileURL:cloudConfiguration:", v17, v15);

    objc_storeWeak(&defaultDatabase_defaultDatabase, v18);
    v4 = v18;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HMDDatabaseSharedInstanceLock);
  return (HMDDatabase *)v4;
}

+ (HMDDatabase)cameraClipsDatabase
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&cameraClipsDatabase_cameraClipsDatabase);
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceForKey:", CFSTR("cameraClipsContainerIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding camera clips container identifier to %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v6, "stringValue");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("com.apple.homekit.camera.clips");
    }
    v13 = objc_alloc(MEMORY[0x24BDB9038]);
    v14 = (void *)objc_msgSend(v13, "initWithContainerIdentifier:environment:", v12, cloudKitContainerEnvironment);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ECE8]), "initWithContainerID:", v14);
    objc_msgSend(v15, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.willowd.homekit.camera.clips"));
    objc_msgSend(v15, "setManateeContainer:", 1);
    objc_msgSend(v15, "setSubscriptionPushRegistrationAction:", 2);
    v16 = objc_alloc((Class)a1);
    +[HMDDatabase defaultLocalDatabaseFileURL](HMDDatabase, "defaultLocalDatabaseFileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithFileURL:cloudConfiguration:", v17, v15);

    objc_storeWeak(&cameraClipsDatabase_cameraClipsDatabase, v18);
    v4 = v18;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HMDDatabaseSharedInstanceLock);
  return (HMDDatabase *)v4;
}

+ (HMDDatabase)hindsightDatabase
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&hindsightDatabase_hindsightDatabase);
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    HMVConfigurationCloudKitContainerID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ECE8]), "initWithContainerID:", v5);
    objc_msgSend(v6, "setManateeContainer:", 1);
    v7 = objc_alloc((Class)a1);
    +[HMDDatabase defaultLocalDatabaseFileURL](HMDDatabase, "defaultLocalDatabaseFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFileURL:cloudConfiguration:", v8, v6);

    objc_storeWeak(&hindsightDatabase_hindsightDatabase, v9);
    v4 = v9;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HMDDatabaseSharedInstanceLock);
  return (HMDDatabase *)v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t43_126895 != -1)
    dispatch_once(&logCategory__hmf_once_t43_126895, &__block_literal_global_74_126896);
  return (id)logCategory__hmf_once_v44_126897;
}

void __26__HMDDatabase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v44_126897;
  logCategory__hmf_once_v44_126897 = v0;

}

@end
