@implementation HMDUserActionPredictionManager

- (HMDUserActionPredictionManager)initWithHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDDatabaseZoneManager *v15;
  void *v16;
  HMDDatabaseZoneManager *v17;
  HMDUserActionPredictionManager *v18;
  HMDUserActionPredictionManager *v20;
  SEL v21;
  id v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9A1A9B9D-BE90-4E26-A5EC-70FE027E74EA"));
    v9 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v7, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmf_UUIDWithNamespace:data:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("user-action-prediction-data-"), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = [HMDDatabaseZoneManager alloc];
    +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:messageTargetUUID:workQueue:](v15, "initWithDatabase:zoneName:home:messageTargetUUID:workQueue:", v16, v14, v4, v12, v5);

    v18 = -[HMDUserActionPredictionManager initWithZoneManager:workQueue:](self, "initWithZoneManager:workQueue:", v17, v5);
    return v18;
  }
  else
  {
    v20 = (HMDUserActionPredictionManager *)_HMFPreconditionFailure();
    return -[HMDUserActionPredictionManager initWithZoneManager:workQueue:](v20, v21, v22, v23);
  }
}

- (HMDUserActionPredictionManager)initWithZoneManager:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  HMDUserActionPredictionManager *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserActionPredictionManager;
  v9 = -[HMDUserActionPredictionManager init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setZoneOwner:", 1);
    objc_msgSend(v11, "setShouldCreateZone:", 0);
    objc_msgSend(v7, "setDefaultConfiguration:", v11);
    objc_storeStrong((id *)&v9->_workQueue, a4);
    objc_storeStrong((id *)&v9->_zoneManager, a3);

  }
  return v9;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  -[HMDUserActionPredictionManager zoneManager](self, "zoneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[HMDUserActionPredictionManager zoneManager](self, "zoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  -[HMDUserActionPredictionManager zoneManager](self, "zoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configure");

  -[HMDUserActionPredictionManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMDUserActionPredictionManager_configure__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)removeZones
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDUserActionPredictionManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDUserActionPredictionManager_removeZones__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setLocalZone:(id)a3
{
  HMBLocalZone *v4;
  HMBLocalZone *localZone;

  v4 = (HMBLocalZone *)a3;
  os_unfair_lock_lock_with_options();
  localZone = self->_localZone;
  self->_localZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMBLocalZone)localZone
{
  os_unfair_lock_s *p_lock;
  HMBLocalZone *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_localZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_removeZones
{
  NSObject *v3;
  void *v4;
  HMDUserActionPredictionManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDUserActionPredictionManager workQueue](self, "workQueue");
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
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing all user action prediction manager data", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDUserActionPredictionManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remove");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  NSObject *v4;

  -[HMDUserActionPredictionManager workQueue](self, "workQueue", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return 0;
}

- (void)zoneManagerDidStart:(id)a3
{
  NSObject *v5;
  void *v6;
  HMDUserActionPredictionManager *v7;
  NSObject *v8;
  void *v9;
  id v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  HMDUserActionPredictionManager *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  HMDUserActionPredictionManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDUserActionPredictionManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  -[HMDUserActionPredictionManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v52 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@User Action zone manager started", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = objc_alloc(MEMORY[0x1E0D28540]);
  v11 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B8D08](v7, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@, %s:%ld"), v12, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/User/User Action Predictions/HMDUserActionPredictionManager.m", 135);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithName:", v13);

  -[HMDUserActionPredictionManager zoneManager](v7, "zoneManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionManager setLocalZone:](v7, "setLocalZone:", v16);

  -[HMDUserActionPredictionManager localZone](v7, "localZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startUp");

  v43 = v14;
  objc_msgSend(v14, "markWithReason:", CFSTR("Fetch models from backing store"));
  -[HMDUserActionPredictionManager localZone](v7, "localZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v18, "fetchModelsOfType:error:", objc_opt_class(), &v50);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v50;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v19;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[HMDUserActionPredictionManager localZone](v7, "localZone");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v7;
        v27 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v24, "hmbModelID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setWithArray:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Remove no longer used user action prediction"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (id)objc_msgSend(v25, "removeModelIDs:options:", v30, v31);

        v7 = v26;
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v21);
  }

  if (v42)
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = v7;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v36;
      v53 = 2112;
      v54 = v42;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@User Action model fetch failed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
  }
  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = v7;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v40;
    v53 = 2112;
    v54 = v41;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Startup User Action model fetch of %@ existing models is complete", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v37);
  objc_msgSend(v43, "invalidate");

}

- (void)zoneManagerDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUserActionPredictionManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserActionPredictionManager workQueue](self, "workQueue");
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
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@User Action zone manager stopped", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDUserActionPredictionManager setLocalZone:](v7, "setLocalZone:", 0);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

id __45__HMDUserActionPredictionManager_removeZones__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_removeZones");
}

void __43__HMDUserActionPredictionManager_configure__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "start");

}

@end
