@implementation HMDHomeManagerHH2SharedUserLastSyncManager

- (HMDHomeManagerHH2SharedUserLastSyncManager)initWithHomeManager:(id)a3 archivePaths:(id)a4
{
  id v6;
  id v7;
  HMDHomeManagerHH2SharedUserLastSyncManager *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  uint64_t v14;
  NSMutableDictionary *homeToUserMap;
  uint64_t v16;
  NSMutableArray *userLastSyncs;
  uint64_t v18;
  NSMutableSet *managedMergeIDs;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HMDHomeManagerHH2SharedUserLastSync *v26;
  HMDHomeManagerHH2SharedUserLastSync *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HMDHomeManagerHH2SharedUserLastSyncManager;
  v8 = -[HMDHomeManagerHH2SharedUserLastSyncManager init](&v33, sel_init);
  if (v8)
  {
    HMDispatchQueueNameString();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    homeToUserMap = v8->_homeToUserMap;
    v8->_homeToUserMap = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    userLastSyncs = v8->_userLastSyncs;
    v8->_userLastSyncs = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    managedMergeIDs = v8->_managedMergeIDs;
    v8->_managedMergeIDs = (NSMutableSet *)v18;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24);
          v26 = [HMDHomeManagerHH2SharedUserLastSync alloc];
          v27 = -[HMDHomeManagerHH2SharedUserLastSync initWithArchivePath:](v26, "initWithArchivePath:", v25, (_QWORD)v29);
          -[NSMutableArray addObject:](v8->_userLastSyncs, "addObject:", v27);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v22);
    }

  }
  return v8;
}

- (void)configure
{
  void *v3;
  HMDHomeManagerHH2SharedUserLastSyncManager *v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *userLastSyncs;
  NSMutableArray *v8;
  uint64_t v9;
  __int128 v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableSet *managedMergeIDs;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id Property;
  const char *v28;
  void *v29;
  HMDHomeManagerHH2SharedUserLastSyncManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  HMDHomeManagerHH2SharedUserLastSyncManager *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *workQueue;
  void *v43;
  HMDHomeManagerHH2SharedUserLastSyncManager *v44;
  NSObject *v45;
  void *v46;
  __int128 v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD block[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Determining pre-migration last users sync data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  if (v4)
    userLastSyncs = v4->_userLastSyncs;
  else
    userLastSyncs = 0;
  v8 = userLastSyncs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  v11 = &OBJC_IVAR___HMDAccessoryBrowser__workQueue;
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v53;
    *(_QWORD *)&v10 = 138543618;
    v47 = v10;
    v49 = *(_QWORD *)v53;
    v48 = v8;
    do
    {
      v14 = 0;
      v50 = v12;
      do
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
        objc_msgSend(v15, "configure", v47);
        if (objc_msgSend(v15, "isValid"))
        {
          objc_msgSend(v15, "user");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accountIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "senderCorrelationIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            if (v4)
              managedMergeIDs = v4->_managedMergeIDs;
            else
              managedMergeIDs = 0;
            -[NSMutableSet addObject:](managedMergeIDs, "addObject:", v18);
          }
          if (v4)
            v20 = *(Class *)((char *)&v4->super.super.isa + v11[159]);
          else
            v20 = 0;
          v21 = v20;
          objc_msgSend(v15, "homeUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v4)
              v24 = *(Class *)((char *)&v4->super.super.isa + v11[159]);
            else
              v24 = 0;
            v25 = v24;
            objc_msgSend(v15, "homeUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v26);

          }
          Property = (id)objc_msgSend(v23, "addObject:", v15);
          if (!v4 || (Property = objc_getProperty(v4, v28, 56, 1)) == 0)
          {
            v29 = (void *)MEMORY[0x227676638](Property);
            v30 = v4;
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "creationDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v47;
              v57 = v32;
              v58 = 2112;
              v59 = v33;
              _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Using creationDate from %@", buf, 0x16u);

              v13 = v49;
              v8 = v48;
            }

            objc_autoreleasePoolPop(v29);
            objc_msgSend(v15, "creationDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v4)
              objc_setProperty_atomic(v30, v34, v35, 56);

            v11 = &OBJC_IVAR___HMDAccessoryBrowser__workQueue;
          }

          v12 = v50;
        }
        else
        {
          v36 = (void *)MEMORY[0x227676638]();
          v37 = v4;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v57 = v39;
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Problem unarchiving last user sync data, removing archive", buf, 0xCu);

            v13 = v49;
          }

          objc_autoreleasePoolPop(v36);
          objc_msgSend(v15, "removeArchiveFromLocalDisk");
        }
        ++v14;
      }
      while (v12 != v14);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      v12 = v40;
    }
    while (v40);
  }

  if (v4)
  {
    objc_storeStrong((id *)&v4->_userLastSyncs, 0);
    v41 = *(Class *)((char *)&v4->super.super.isa + v11[159]);
  }
  else
  {
    v41 = 0;
  }
  if (objc_msgSend(v41, "count"))
  {
    if (v4)
    {
      v4->_valid = 1;
      workQueue = v4->_workQueue;
    }
    else
    {
      workQueue = 0;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__HMDHomeManagerHH2SharedUserLastSyncManager_configure__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v4;
    dispatch_async(workQueue, block);
  }
  else
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = v4;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v46;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@No pre-migration last users sync data found", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
  }
}

- (BOOL)isManagingUserWithMergeID:(id)a3
{
  if (self)
    self = (HMDHomeManagerHH2SharedUserLastSyncManager *)self->_managedMergeIDs;
  return -[HMDHomeManagerHH2SharedUserLastSyncManager containsObject:](self, "containsObject:", a3);
}

- (double)_interval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("hh2SharedUserLastSyncInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)_expireInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("hh2SharedUserLastSyncExpire"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)_pushInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("hh2SharedUserLastSyncPushInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (BOOL)_shouldPushNow
{
  SEL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SEL v8;
  double v9;
  double v10;
  SEL v11;
  void *v12;
  SEL v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeManagerHH2SharedUserLastSyncManager *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  HMDHomeManagerHH2SharedUserLastSyncManager *v21;
  void *v22;
  void *v23;
  HMDHomeManagerHH2SharedUserLastSyncManager *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (objc_getProperty(self, v3, 56, 1))
    {
      -[HMDHomeManagerHH2SharedUserLastSyncManager _interval](self, "_interval");
      v5 = v4;
      -[HMDHomeManagerHH2SharedUserLastSyncManager _pushInterval](self, "_pushInterval");
      v7 = v6;
      objc_msgSend(objc_getProperty(self, v8, 56, 1), "timeIntervalSinceNow");
      v10 = v5 * (double)(uint64_t)(v9 / v5);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", objc_getProperty(self, v11, 56, 1), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", objc_getProperty(self, v13, 56, 1), v7 + v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "compare:", v12) == 1 && objc_msgSend(v15, "compare:", v14) == -1)
      {
        v16 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        v20 = 1;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543874;
          v29 = v22;
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v14;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Pushing now because current time falls between start of interval, %@, and end of push interval, %@", (uint8_t *)&v28, 0x20u);

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
          v28 = 138543874;
          v29 = v19;
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v14;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Not pushing now because does not fall between start of interval, %@, and end of push interval, %@", (uint8_t *)&v28, 0x20u);

        }
        v20 = 0;
      }

      objc_autoreleasePoolPop(v16);
      return v20;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@No creationDate determined, cannot determine if push can start now", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  return 0;
}

- (BOOL)_shouldExpire
{
  SEL v3;
  double v4;
  double v5;
  SEL v6;
  double v7;
  void *v9;
  HMDHomeManagerHH2SharedUserLastSyncManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (objc_getProperty(self, v3, 56, 1))
    {
      -[HMDHomeManagerHH2SharedUserLastSyncManager _expireInterval](self, "_expireInterval");
      v5 = v4;
      objc_msgSend(objc_getProperty(self, v6, 56, 1), "timeIntervalSinceNow");
      return v7 >= v5;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@No creationDate determined, cannot determine pushes have expired", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  return 1;
}

- (double)_nextInterval
{
  SEL v3;
  double v4;
  double v5;
  SEL v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  HMDHomeManagerHH2SharedUserLastSyncManager *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!self)
  {
    dispatch_assert_queue_V2(0);
LABEL_7:
    _HMFPreconditionFailure();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!objc_getProperty(self, v3, 56, 1))
    goto LABEL_7;
  -[HMDHomeManagerHH2SharedUserLastSyncManager _interval](self, "_interval");
  v5 = v4;
  v7 = objc_msgSend(objc_getProperty(self, v6, 56, 1), "timeIntervalSinceNow");
  v9 = -(v8 - (double)((uint64_t)(v8 / v5) + 1) * v5);
  v10 = (void *)MEMORY[0x227676638](v7);
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2048;
    v18 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Determined next interval to be %f from now", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  return v9;
}

- (void)scheduleNextPush
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__HMDHomeManagerHH2SharedUserLastSyncManager_scheduleNextPush__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_scheduleNextPush
{
  HMDHomeManagerHH2SharedUserLastSyncManager *v2;
  void *v3;
  HMDHomeManagerHH2SharedUserLastSyncManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeManagerHH2SharedUserLastSyncManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  SEL v15;
  SEL v16;
  id Property;
  void *v18;
  HMDHomeManagerHH2SharedUserLastSyncManager *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v2 = self;
  v25 = *MEMORY[0x24BDAC8D0];
  if (self)
    self = (HMDHomeManagerHH2SharedUserLastSyncManager *)self->_workQueue;
  dispatch_assert_queue_V2(&self->super.super);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = v2;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Scheduling last push to shared users after migration.", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (-[HMDHomeManagerHH2SharedUserLastSyncManager _shouldExpire](v4, "_shouldExpire"))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = v4;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Pushes have expired, removing last user sync data.", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDHomeManagerHH2SharedUserLastSyncManager _removeAllUserLastSyncData](v8, "_removeAllUserLastSyncData");
  }
  if (-[HMDHomeManagerHH2SharedUserLastSyncManager isValid](v4, "isValid"))
  {
    v11 = objc_alloc(MEMORY[0x24BE3F298]);
    -[HMDHomeManagerHH2SharedUserLastSyncManager _nextInterval](v4, "_nextInterval");
    v12 = (void *)objc_msgSend(v11, "initWithTimeInterval:options:", 1);
    v14 = v12;
    if (v2)
    {
      objc_setProperty_atomic(v4, v13, v12, 64);

      objc_msgSend(objc_getProperty(v4, v15, 64, 1), "setDelegate:", v4);
      Property = objc_getProperty(v4, v16, 64, 1);
    }
    else
    {

      objc_msgSend(0, "setDelegate:", 0);
      Property = 0;
    }
    objc_msgSend(Property, "resume");
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v4;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@No longer valid, not scheduling another push", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    if (v2)
      objc_setProperty_atomic(v19, v22, 0, 64);
  }
}

- (void)_removeAllUserLastSyncData
{
  NSMutableDictionary *homeToUserMap;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  HMDHomeManagerHH2SharedUserLastSyncManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    homeToUserMap = self->_homeToUserMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    homeToUserMap = 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
  }
  obj = homeToUserMap;
  v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v21 = v4;
        if (self)
          v6 = self->_homeToUserMap;
        else
          v6 = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v5);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v22);
              v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              v12 = (void *)MEMORY[0x227676638]();
              v13 = self;
              HMFGetOSLogHandle();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "user");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v32 = v15;
                v33 = 2112;
                v34 = v16;
                _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing last sync for %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v12);
              objc_msgSend(v11, "removeArchiveFromLocalDisk");
            }
            v8 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          }
          while (v8);
        }

        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      v20 = v17;
    }
    while (v17);
  }

  if (self)
  {
    objc_storeStrong((id *)&self->_homeToUserMap, 0);
    self->_valid = 0;
  }
}

- (void)removeUserLastSyncData:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMDHomeManagerHH2SharedUserLastSyncManager_removeUserLastSyncData___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)_pushAllUserSyncData
{
  NSMutableDictionary *homeToUserMap;
  uint64_t v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMDHomeManagerHH2SharedUserLastSyncManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    homeToUserMap = self->_homeToUserMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    homeToUserMap = 0;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
  }
  obj = homeToUserMap;
  v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        if (self)
          v5 = self->_homeToUserMap;
        else
          v5 = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v6)
        {
          v22 = *(_QWORD *)v26;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v26 != v22)
                objc_enumerationMutation(v21);
              v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
              v9 = (void *)MEMORY[0x227676638]();
              v10 = self;
              HMFGetOSLogHandle();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "user");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v34 = v12;
                v35 = 2112;
                v36 = v13;
                _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Pushing last sync for %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v9);
              objc_initWeak((id *)buf, v10);
              if (self)
                WeakRetained = objc_loadWeakRetained((id *)&v10->_homeManager);
              else
                WeakRetained = 0;
              v23[0] = MEMORY[0x24BDAC760];
              v23[1] = 3221225472;
              v23[2] = __66__HMDHomeManagerHH2SharedUserLastSyncManager__pushAllUserSyncData__block_invoke;
              v23[3] = &unk_24E790D00;
              objc_copyWeak(&v24, (id *)buf);
              v23[4] = v8;
              objc_msgSend(WeakRetained, "pushChangesForHH2SharedUserLastSync:completion:", v8, v23);

              objc_destroyWeak(&v24);
              objc_destroyWeak((id *)buf);
              ++v7;
            }
            while (v6 != v7);
            v15 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            v6 = v15;
          }
          while (v15);
        }

        ++v20;
      }
      while (v20 != v19);
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      v19 = v16;
    }
    while (v16);
  }

}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  void *v7;
  HMDHomeManagerHH2SharedUserLastSyncManager *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 64, 1);
  else
    Property = 0;
  if (Property == v5)
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer fired, pushing last sync to shared users", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    if (self)
      workQueue = v8->_workQueue;
    else
      workQueue = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HMDHomeManagerHH2SharedUserLastSyncManager_timerDidFire___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v8;
    dispatch_async(workQueue, block);
  }

}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_managedMergeIDs, 0);
  objc_storeStrong((id *)&self->_homeToUserMap, 0);
  objc_storeStrong((id *)&self->_userLastSyncs, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __59__HMDHomeManagerHH2SharedUserLastSyncManager_timerDidFire___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushAllUserSyncData");
}

void __66__HMDHomeManagerHH2SharedUserLastSyncManager__pushAllUserSyncData__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "removeUserLastSyncData:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "scheduleNextPush");

}

void __69__HMDHomeManagerHH2SharedUserLastSyncManager_removeUserLastSyncData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
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
    objc_msgSend(*(id *)(a1 + 40), "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v5;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing user after sync %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "removeArchiveFromLocalDisk");
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[5];
  v9 = *(void **)(a1 + 40);
  v10 = v8;
  objc_msgSend(v9, "homeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(v12, "count"))
  {
    v13 = *(_QWORD **)(a1 + 32);
    if (v13)
      v13 = (_QWORD *)v13[5];
    v14 = *(void **)(a1 + 40);
    v15 = v13;
    objc_msgSend(v14, "homeUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v16);

  }
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    v18 = *(void **)(v17 + 40);
  else
    v18 = 0;
  if (!objc_msgSend(v18, "count"))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Last user archive removed", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      *(_BYTE *)(v23 + 12) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleNextPush");

}

uint64_t __62__HMDHomeManagerHH2SharedUserLastSyncManager_scheduleNextPush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextPush");
}

uint64_t __55__HMDHomeManagerHH2SharedUserLastSyncManager_configure__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldPushNow");
  v3 = (void *)MEMORY[0x227676638]();
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
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Determined within push window, start pushing to shared users now", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_pushAllUserSyncData");
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Not within push window, scheduling pushing to shared users", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextPush");
  }
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
