@implementation HMDCoreData

- (HMDCoreData)initWithCloudKitContainer:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCoreData *v12;
  uint64_t v13;
  OS_os_log *logger;
  uint64_t v15;
  NSMapTable *contexts;
  uint64_t v17;
  NSHashTable *listeners;
  uint64_t v19;
  HMFFuture *firstCloudKitImportFuture;
  id v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDCoreData;
  v12 = -[HMDCoreData init](&v27, sel_init);
  if (v12)
  {
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    contexts = v12->_contexts;
    v12->_contexts = (NSMapTable *)v15;

    objc_storeStrong((id *)&v12->_container, a3);
    objc_storeStrong((id *)&v12->_notificationCenter, a4);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    listeners = v12->_listeners;
    v12->_listeners = (NSHashTable *)v17;

    v12->_firstCloudKitImportComplete = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v12->_firstCloudKitImportPromise);
    v19 = objc_claimAutoreleasedReturnValue();
    firstCloudKitImportFuture = v12->_firstCloudKitImportFuture;
    v12->_firstCloudKitImportFuture = (HMFFuture *)v19;

    HMDispatchQueueNameString();
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v24;

  }
  return v12;
}

- (HMDCoreData)initWithPersistentStoreDescriptions:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCoreData *v18;

  v8 = (objc_class *)MEMORY[0x24BDBB6D8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData managedObjectModel](HMDCoreData, "managedObjectModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithName:managedObjectModel:", v14, v15);

  v17 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v16, "setPersistentStoreDescriptions:", v17);

  v18 = -[HMDCoreData initWithCloudKitContainer:notificationCenter:userDefaults:](self, "initWithCloudKitContainer:notificationCenter:userDefaults:", v16, v10, v9);
  return v18;
}

- (BOOL)_shouldPruneWorkingStoreHistory
{
  NSUserDefaults *userDefaults;
  NSUserDefaults *v4;
  void *v5;
  void *v6;
  id v7;
  NSUserDefaults *v8;
  NSUserDefaults *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCoreData *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self)
    userDefaults = self->_userDefaults;
  else
    userDefaults = 0;
  v4 = userDefaults;
  -[NSUserDefaults objectForKey:](v4, "objectForKey:", CFSTR("workingStoreHistoryPruneRanHomeKitVersionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (self)
    v8 = self->_userDefaults;
  else
    v8 = 0;
  v9 = v8;
  -[NSUserDefaults objectForKey:](v9, "objectForKey:", CFSTR("workingStoreHistoryPruneRanDateKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v7)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v7;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Working store history was already pruned on version %{public}@ at %{public}@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "productPlatform") == 4;

  }
  return v17;
}

- (BOOL)_pruneWorkingStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:(int64_t)a3
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  HMDCoreData *v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = -[HMDCoreData newManagedObjectContext](self, "newManagedObjectContext");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__HMDCoreData__pruneWorkingStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan___block_invoke;
  v8[3] = &unk_24E7833A8;
  v6 = v5;
  v9 = v6;
  v10 = self;
  v11 = &v13;
  v12 = a3;
  objc_msgSend(v6, "performBlockAndWait:", v8);
  LOBYTE(a3) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a3;
}

- (void)startLoadingStores
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  HMFTimer *activityTimedOutTimer;
  NSUUID *activityIdentifier;
  HMDCoreDataCloudKitSetupActivityLogEvent *activityLogEvent;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  HMDCoreDataLoadErrorLogEvent *v14;
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
  NSUserDefaults *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDCoreData *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  HMDCoreData *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  if (!self)
    goto LABEL_17;
  -[HMDCoreData container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v42 = MEMORY[0x24BDAC760];
  v43 = 3221225472;
  v44 = __23__HMDCoreData__preLoad__block_invoke;
  v45 = &unk_24E781808;
  v46 = self;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v42);

  HMFUptime();
  self->_startTime = v6;
  self->_firstSetupEvent = 1;
  self->_firstSetupActivity = 1;
  activityTimedOutTimer = self->_activityTimedOutTimer;
  self->_activityTimedOutTimer = 0;

  activityIdentifier = self->_activityIdentifier;
  self->_activityIdentifier = 0;

  activityLogEvent = self->_activityLogEvent;
  self->_activityLogEvent = 0;

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__85130;
  v62 = __Block_byref_object_dispose__85131;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 4;
  -[HMDCoreData container](self, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v5;
  v43 = 3221225472;
  v44 = __20__HMDCoreData__load__block_invoke;
  v45 = &unk_24E781830;
  v46 = self;
  v47 = &v58;
  v48 = &v50;
  v49 = &v54;
  objc_msgSend(v10, "loadPersistentStoresWithCompletionHandler:", &v42);

  v11 = (void *)v59[5];
  if (v11)
  {
    v12 = v51[3];
    v13 = v11;
    v14 = -[HMDCoreDataLoadErrorLogEvent initWithReason:]([HMDCoreDataLoadErrorLogEvent alloc], "initWithReason:", v12);
    -[HMMLogEvent setError:](v14, "setError:", v13);

    +[HMDMetricsManager submitMinimalCoreAnalyticsEvent:](HMDMetricsManager, "submitMinimalCoreAnalyticsEvent:", v14);
    +[HMDMetricsManager defaultRadarInitiator](HMDMetricsManager, "defaultRadarInitiator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 834211);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:waitForResponse:", CFSTR("Failed to load persistent stores. Please file a radar against: HomeKit | Data Model."), CFSTR("Failed to load persistent stores"), CFSTR("HomeKit"), CFSTR("Data Model"), v17, 1);

  }
  if (v55[3])
  {
    +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:steps:](HMDResetConfigPostCleanup, "writePostCleanupRecordWithReason:steps:", 8);
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "relaunch");

  }
  else if (v59[5])
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend((id)v59[5], "code"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v59[5], "domain");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v59[5];
      *(_DWORD *)buf = 138544130;
      v65 = v38;
      v66 = 2112;
      v67 = v39;
      v68 = 2112;
      v69 = v40;
      v70 = 2112;
      v71 = v41;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persistent container: (%@/%@): %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v35);
    _Exit(1);
  }
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  -[HMDCoreData coordinator](self, "coordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistentStores");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v5;
  v43 = 3221225472;
  v44 = __24__HMDCoreData__postLoad__block_invoke;
  v45 = &unk_24E781880;
  v46 = self;
  objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v42);

  -[HMDCoreData workingStore](self, "workingStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  -[HMDCoreData cloudPrivateStore](self, "cloudPrivateStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  -[HMDCoreData cloudSharedStore](self, "cloudSharedStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_20:
    _HMFPreconditionFailure();
LABEL_21:
    _HMFPreconditionFailure();
  }
  -[HMDCoreData localStore](self, "localStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_21;
  if (-[HMDCoreData _shouldPruneWorkingStoreHistory](self, "_shouldPruneWorkingStoreHistory"))
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferenceForKey:", CFSTR("workingStoreMaxHistoryPercentage"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      v28 = objc_msgSend(v27, "integerValue");
    else
      v28 = 20;

    if (-[HMDCoreData _pruneWorkingStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:](self, "_pruneWorkingStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan:", v28))
    {
      +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "versionString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v30, CFSTR("workingStoreHistoryPruneRanHomeKitVersionKey"));
      v31 = (void *)MEMORY[0x24BDBCE60];
      v32 = self->_userDefaults;
      objc_msgSend(v31, "now");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](v32, "setObject:forKey:", v34, CFSTR("workingStoreHistoryPruneRanDateKey"));

    }
  }
LABEL_17:
  -[HMDCoreData _checkFirstCloudKitImportComplete](self);
}

- (void)startWatchingManagedObjectChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HMDCoreData notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBB498];
  -[HMDCoreData container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePersistentCloudKitContainerEventChangedNotification_, v4, v5);

  -[HMDCoreData notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBB510];
  -[HMDCoreData container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleChangeNotification_, v7, v9);

  -[HMDCoreData notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleWillResetSyncNotification_, *MEMORY[0x24BDBB3F0], 0);

  -[HMDCoreData notificationCenter](self, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleDidResetSyncNotification_, *MEMORY[0x24BDBB3E0], 0);

  -[HMDCoreData notificationCenter](self, "notificationCenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__handlePersistentCloudKitContainerActivityChangedNotification_, *MEMORY[0x24BDBB490], 0);

}

- (void)stopWatchingManagedObjectChanges
{
  id v3;

  -[HMDCoreData notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_handleChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 firstCloudKitImportComplete;
  NSObject *v15;
  void *v16;
  HMDCoreData *v17;
  NSObject *v18;
  void *v19;
  _QWORD block[5];
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBB588]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDCoreData _currentNotificationListeners]((char *)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __41__HMDCoreData__handleChangeNotification___block_invoke;
    v21[3] = &unk_24E7818A8;
    v21[4] = self;
    v11 = v8;
    v22 = v11;
    objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
    -[HMDCoreData workingStore](self, "workingStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v13);

    if ((_DWORD)v11)
    {
      os_unfair_lock_lock_with_options();
      if (!self)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)0x10);
        goto LABEL_8;
      }
      os_unfair_lock_assert_owner(&self->_lock);
      firstCloudKitImportComplete = self->_firstCloudKitImportComplete;
      os_unfair_lock_unlock(&self->_lock);
      if (!firstCloudKitImportComplete)
      {
LABEL_8:
        dispatch_get_global_queue(25, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __41__HMDCoreData__handleChangeNotification___block_invoke_2;
        block[3] = &unk_24E79C240;
        block[4] = self;
        dispatch_async(v15, block);

      }
    }

    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v19;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Notification with unexpected userInfo: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
LABEL_13:

}

- (void)_handlePersistentCloudKitContainerEventChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  OS_os_log *v17;
  NSObject *v18;
  os_signpost_id_t setupSignpostID;
  void *v20;
  void *v21;
  HMDCoreData *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCoreData *v26;
  NSObject *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  HMDCoreData *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *logger;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDCoreDataCloudKitOperationLogEvent *v47;
  void *v48;
  void *v49;
  BOOL firstSetupEvent;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  HMDCoreData *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[5];
  id v79;
  id v80;
  uint64_t v81;
  BOOL v82;
  char v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDBB4A0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBB4A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() & 1;
    if (v9)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    if (!v9)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v85 = v28;
        v86 = 2114;
        v87 = v6;
        v88 = 2112;
        v89 = v4;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in notification: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      goto LABEL_56;
    }
    objc_msgSend(v8, "storeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "type");
    if (v13 == 1)
    {
      v29 = 1;
    }
    else
    {
      if (!v13)
      {
        v14 = v8;
        v15 = v14;
        if (!self)
        {
LABEL_54:

LABEL_55:
LABEL_56:

          goto LABEL_57;
        }
        objc_msgSend(v14, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v37 = (void *)MEMORY[0x227676638]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "storeIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = v40;
            v86 = 2114;
            v87 = v41;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Beginning setup for store with identifier %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v37);
          logger = v38->_logger;
          if (os_signpost_enabled(logger))
          {
            v43 = logger;
            objc_msgSend(v15, "storeIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v85 = v44;
            _os_signpost_emit_with_name_impl(&dword_2218F0000, v43, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CoreDataCloudTransformSetup", "storeIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);

          }
          v38->_setupSignpostID = 0xEEEEB0B5B2B2EEEELL;
          goto LABEL_54;
        }
        v17 = self->_logger;
        v18 = v17;
        setupSignpostID = self->_setupSignpostID;
        if (setupSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v17))
        {
          objc_msgSend(v15, "storeIdentifier");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "succeeded");
          HMFBooleanToString();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "error");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71)
          {
            v20 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v15, "error");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v70, "code"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v72;
          }
          objc_msgSend(v15, "error");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            objc_msgSend(v15, "error");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "domain");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v85 = v75;
          v86 = 2112;
          v87 = v73;
          v88 = 2112;
          v89 = v72;
          v90 = 2112;
          v91 = (uint64_t)v46;
          _os_signpost_emit_with_name_impl(&dword_2218F0000, v18, OS_SIGNPOST_INTERVAL_END, setupSignpostID, "CoreDataCloudTransformSetup", "storeIdentifier=%{signpost.description:attribute}@ succeeded=%{signpost.description:attribute}@ errorCode=%{signpost.description:attribute}@ errorDomain=%{signpost.description:attribute}@ ", buf, 0x2Au);
          if (v45)
          {

            v46 = v69;
          }

          if (v71)
        }

        self->_setupSignpostID = 0;
        objc_msgSend(v15, "storeIdentifier");
        v47 = (HMDCoreDataCloudKitOperationLogEvent *)objc_claimAutoreleasedReturnValue();
        -[HMDCoreData cloudPrivateStore](self, "cloudPrivateStore");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[HMDCoreDataCloudKitOperationLogEvent isEqualToString:](v47, "isEqualToString:", v49))
        {
          firstSetupEvent = self->_firstSetupEvent;

          v51 = 0.0;
          if (!firstSetupEvent)
          {
LABEL_48:
            v57 = objc_msgSend(v15, "succeeded");
            v58 = (void *)MEMORY[0x227676638]();
            v59 = self;
            HMFGetOSLogHandle();
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v60;
            if (v57)
            {
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "storeIdentifier");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                +[HMDCoreData afterTimeInterval:](v51);
                v76 = v58;
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v85 = v62;
                v86 = 2114;
                v87 = v63;
                v88 = 2112;
                v89 = v64;
                _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@Finished setup for store with identifier %{public}@ %@", buf, 0x20u);

                v58 = v76;
              }
            }
            else if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "storeIdentifier");
              v77 = v58;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "error");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDCoreData afterTimeInterval:](v51);
              v67 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v85 = v74;
              v86 = 2114;
              v87 = v65;
              v88 = 2114;
              v89 = v66;
              v90 = 2112;
              v91 = v67;
              v68 = (void *)v67;
              _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Setup failed for store with identifier %{public}@: %{public}@ %@", buf, 0x2Au);

              v58 = v77;
            }

            objc_autoreleasePoolPop(v58);
            goto LABEL_54;
          }
          HMFUptime();
          v51 = v52 - self->_startTime;
          v47 = -[HMDCoreDataCloudKitOperationLogEvent initWithOperationType:interval:]([HMDCoreDataCloudKitOperationLogEvent alloc], "initWithOperationType:interval:", 3, v51);
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "error");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "submitLogEvent:error:", v47, v54);

          if ((objc_msgSend(v15, "succeeded") & 1) == 0 && v51 <= 300.0)
          {
LABEL_47:

            goto LABEL_48;
          }
          +[HMDMainDriver driver](HMDMainDriver, "driver");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "currentAccessorySetupMetricDispatcher");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "error");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "markFirstCoreDataContainerSetupDuration:error:", v56, v51);

          self->_firstSetupEvent = 0;
        }
        else
        {

          v51 = 0.0;
        }

        goto LABEL_47;
      }
      v29 = 0;
    }
    objc_msgSend(v8, "endDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v8, "endDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceDate:", v32);
      v34 = v33;

    }
    else
    {
      v34 = 0;
    }
    v35 = v30 == 0;
    -[HMDCoreData _currentNotificationListeners]((char *)self);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __74__HMDCoreData__handlePersistentCloudKitContainerEventChangedNotification___block_invoke;
    v78[3] = &unk_24E7818D0;
    v82 = v35;
    v83 = v29;
    v78[4] = self;
    v79 = v12;
    v80 = v8;
    v81 = v34;
    objc_msgSend(v36, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v78);

    goto LABEL_55;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v85 = v24;
    v86 = 2114;
    v87 = v6;
    v88 = 2112;
    v89 = v4;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@No '%{public}@' for notification: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v21);
LABEL_57:

}

- (void)_handleWillResetSyncNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMDCoreData *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = reasonFromResetSyncNotification(v4);
  stringFromResetSyncReason(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Core Data is about to reset all of our CloudKit data with reason: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)_handleDidResetSyncNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMDCoreData *v8;
  NSObject *v9;
  void *v10;
  HMDLogEventCoreDataSignificantEvent *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = reasonFromResetSyncNotification(v4);
  stringFromResetSyncReason(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Core Data has finished resetting all of our CloudKit data with reason: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if ((unint64_t)(v5 - 1) >= 2)
  {
    v11 = -[HMDLogEventCoreDataSignificantEvent initWithReason:]([HMDLogEventCoreDataSignificantEvent alloc], "initWithReason:", 3);
    -[HMDLogEventCoreDataSignificantEvent setContext:](v11, "setContext:", v6);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitLogEvent:", v11);

  }
}

- (NSPersistentStoreCoordinator)coordinator
{
  void *v2;
  void *v3;

  -[HMDCoreData container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStoreCoordinator *)v3;
}

- (id)newManagedObjectContext
{
  HMDManagedObjectContext *v3;
  void *v4;
  HMDManagedObjectContext *v5;
  HMDManagedObjectContext *v6;
  _QWORD v8[4];
  HMDManagedObjectContext *v9;
  HMDCoreData *v10;

  v3 = -[HMDManagedObjectContext initWithConcurrencyType:]([HMDManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  -[HMDCoreData coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDManagedObjectContext setPersistentStoreCoordinator:](v3, "setPersistentStoreCoordinator:", v4);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__HMDCoreData_newManagedObjectContext__block_invoke;
  v8[3] = &unk_24E79C268;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[HMDManagedObjectContext performBlockAndWait:](v5, "performBlockAndWait:", v8);
  v6 = v5;

  return v6;
}

- (HMCContext)contextWithRootPartition
{
  void *v3;
  os_unfair_lock_s *p_lock;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v5, 88, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    __contextWithContextName(self, CFSTR("HomeManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v10 = objc_getProperty(self, v9, 88, 1);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(v11, "setObject:forKey:", v8, v3);

  }
  os_unfair_lock_unlock(p_lock);

  return (HMCContext *)v8;
}

- (id)contextWithHomeUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  id Property;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v6, 88, 1);
  else
    Property = 0;
  v8 = Property;
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    HMDWorkingContextNameForHomeUUID(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __contextWithContextName(self, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v12 = objc_getProperty(self, v11, 88, 1);
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v13, "setObject:forKey:", v9, v4);

  }
  v14 = v9;

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (BOOL)isRelatedContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v4 = a3;
  -[HMDCoreData coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    do
    {
      objc_msgSend(v4, "persistentStoreCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v6 == v5;
      if (v7)
        break;
      objc_msgSend(v4, "parentContext");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }
    while (v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)allContexts
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  id Property;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v4, 88, 1);
  else
    Property = 0;
  v6 = Property;
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

- (void)addNotificationListener:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeNotificationListener:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)dumpConfiguration:(id)a3 includeFakeModels:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__85130;
  v36 = __Block_byref_object_dispose__85131;
  v37 = 0;
  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke;
  v26[3] = &unk_24E7819C0;
  v14 = v10;
  v27 = v14;
  v15 = v9;
  v28 = v15;
  v30 = &v32;
  v31 = a4;
  v16 = v12;
  v29 = v16;
  objc_msgSend(v14, "performBlockAndWait:", v26);
  v17 = (void *)v33[5];
  if (v17)
  {
    v18 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v17);
  }
  else
  {
    objc_msgSend(v16, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_6;
    v23[3] = &unk_24E7819E8;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    v25 = v16;
    objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v32, 8);

  objc_autoreleasePoolPop(v11);
  return v18;
}

- (id)dumpCloudKitConfiguration:(BOOL)a3 localConfiguration:(BOOL)a4 workingConfiguration:(BOOL)a5 includeFakeModels:(BOOL)a6 context:(id)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v11 + (unint64_t)v12 + v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDCoreData dumpConfiguration:includeFakeModels:context:error:](self, "dumpConfiguration:includeFakeModels:context:error:", CFSTR("Local"), 1, v14, a8);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_11;
    v17 = (void *)v16;
    objc_msgSend(v15, "addObject:", v16);

  }
  if (!v10)
    goto LABEL_7;
  -[HMDCoreData dumpConfiguration:includeFakeModels:context:error:](self, "dumpConfiguration:includeFakeModels:context:error:", CFSTR("Working"), 1, v14, a8);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  v19 = (void *)v18;
  objc_msgSend(v15, "addObject:", v18);

LABEL_7:
  if (!v12)
  {
LABEL_10:
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[HMDCoreData dumpConfiguration:includeFakeModels:context:error:](self, "dumpConfiguration:includeFakeModels:context:error:", CFSTR("CloudKit"), v9, v14, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v15, "addObject:", v20);

    goto LABEL_10;
  }
LABEL_12:

  return v20;
}

- (void)_handlePersistentCloudKitContainerActivityChangedNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDCoreData__handlePersistentCloudKitContainerActivityChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)timerDidFire:(id)a3
{
  NSObject *queue;
  HMFTimer *v5;
  HMFTimer *activityTimedOutTimer;
  HMDCoreDataCloudKitSetupActivityLogEvent *v7;
  BOOL firstSetupActivity;
  void *v9;
  HMDCoreData *v10;
  NSObject *v11;
  void *v12;
  HMDCoreDataCloudKitSetupActivityLogEvent *activityLogEvent;
  void *v14;
  void *v15;
  HMDCoreDataCloudKitSetupActivityLogEvent *v16;
  NSUUID *activityIdentifier;
  int v18;
  void *v19;
  __int16 v20;
  HMDCoreDataCloudKitSetupActivityLogEvent *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5 = (HMFTimer *)a3;
  dispatch_assert_queue_V2(queue);
  activityTimedOutTimer = self->_activityTimedOutTimer;

  if (activityTimedOutTimer == v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v7 = self->_activityLogEvent;
    if (v7)
    {
      firstSetupActivity = self->_firstSetupActivity;

      if (firstSetupActivity)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          activityLogEvent = v10->_activityLogEvent;
          v18 = 138543618;
          v19 = v12;
          v20 = 2112;
          v21 = activityLogEvent;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Cloudkit setup activity timedout. Submit cloudkit setup activity metric %@", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "submitLogEvent:error:", v10->_activityLogEvent, v14);

        v10->_firstSetupActivity = 0;
        v16 = v10->_activityLogEvent;
        v10->_activityLogEvent = 0;

        activityIdentifier = v10->_activityIdentifier;
        v10->_activityIdentifier = 0;

      }
    }
    objc_storeStrong((id *)&self->_activityTimedOutTimer, 0);
  }
}

- (NSPersistentCloudKitContainer)container
{
  return self->_container;
}

- (NSPersistentStore)workingStore
{
  return self->_workingStore;
}

- (NSPersistentStore)cloudPrivateStore
{
  return self->_cloudPrivateStore;
}

- (NSPersistentStore)cloudSharedStore
{
  return self->_cloudSharedStore;
}

- (NSPersistentStore)localStore
{
  return self->_localStore;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMFFuture)firstCloudKitImportFuture
{
  return self->_firstCloudKitImportFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCloudKitImportFuture, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_activityLogEvent, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityTimedOutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_firstCloudKitImportPromise, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_cloudSharedStore, 0);
  objc_storeStrong((id *)&self->_cloudPrivateStore, 0);
  objc_storeStrong((id *)&self->_workingStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __77__HMDCoreData__handlePersistentCloudKitContainerActivityChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  HMDCoreDataCloudKitSetupActivity *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  HMDCoreDataCloudKitSetupActivity *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDCoreDataCloudKitSetupActivityLogEvent *v61;
  void *v62;
  HMDCoreDataCloudKitSetupActivityLogEvent *v63;
  void *v64;
  void *v65;
  id v66;
  int v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 && (*(_BYTE *)(v1 + 35) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("activityDictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 40);
        v67 = 138543618;
        v68 = v29;
        v69 = 2112;
        v70 = v30;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@No activityDictionary for notification: %@", (uint8_t *)&v67, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      goto LABEL_38;
    }
    v5 = -[HMDCoreDataCloudKitSetupActivity initWithDictionary:]([HMDCoreDataCloudKitSetupActivity alloc], "initWithDictionary:", v4);
    -[HMDCoreDataCloudKitSetupActivity activityType](v5, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 138543618;
        v68 = v34;
        v69 = 2112;
        v70 = v4;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@No activity type for activityDictionary: %@", (uint8_t *)&v67, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      goto LABEL_37;
    }
    -[HMDCoreDataCloudKitSetupActivity activityType](v5, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("event"));

    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = v5;
      if (v9)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v9 + 120));
        -[HMDCoreDataCloudKitSetupActivity endDate](v10, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if ((*(_BYTE *)(v9 + 35) & 1) != 0)
          {
            -[HMDCoreDataCloudKitSetupActivity endDate](v10, "endDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCoreDataCloudKitSetupActivity startDate](v10, "startDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timeIntervalSinceDate:", v13);
            v15 = v14;

            v16 = *(id *)(v9 + 144);
            -[HMDCoreDataCloudKitSetupActivity activityType](v10, "activityType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setDurationForPhase:duration:", v17, v15);

            v18 = (void *)MEMORY[0x227676638]();
            v19 = (id)v9;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)*((_QWORD *)v19 + 18);
              v67 = 138543618;
              v68 = v21;
              v69 = 2112;
              v70 = v22;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Submit cloudkit setup activity metric %@", (uint8_t *)&v67, 0x16u);

            }
            objc_autoreleasePoolPop(v18);
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = *((id *)v19 + 18);
            -[HMDCoreDataCloudKitSetupActivity error](v10, "error");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "submitLogEvent:error:", v24, v25);

            objc_storeStrong((id *)v19 + 18, 0);
            objc_storeStrong((id *)v19 + 17, 0);
            *((_BYTE *)v19 + 35) = 0;
          }
          goto LABEL_36;
        }
        if (*(_QWORD *)(v9 + 136))
        {
          v50 = MEMORY[0x227676638]();
          v51 = (id)v9;
          HMFGetOSLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 138543362;
            v68 = v53;
            _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Cloudkit setup activity is ongoing", (uint8_t *)&v67, 0xCu);

          }
          v54 = (void *)v50;
LABEL_32:
          objc_autoreleasePoolPop(v54);
          goto LABEL_36;
        }
        +[HMDMainDriver driver](HMDMainDriver, "driver");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "currentAccessorySetupMetricDispatcher");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setupSessionIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = [HMDCoreDataCloudKitSetupActivityLogEvent alloc];
        -[HMDCoreDataCloudKitSetupActivity identifier](v10, "identifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = -[HMDCoreDataCloudKitSetupActivityLogEvent initWithActivityIdentifier:setupSessionIdentifier:](v61, "initWithActivityIdentifier:setupSessionIdentifier:", v62, v48);
        objc_storeStrong((id *)(v9 + 144), v63);

        -[HMDCoreDataCloudKitSetupActivity identifier](v10, "identifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v9 + 136), v64);

        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 900.0);
        objc_storeStrong((id *)(v9 + 128), v65);

        objc_msgSend(*(id *)(v9 + 128), "setDelegate:", v9);
        objc_msgSend(*(id *)(v9 + 128), "setDelegateQueue:", *(_QWORD *)(v9 + 120));
        objc_msgSend(*(id *)(v9 + 128), "resume");
LABEL_35:

      }
    }
    else
    {
      -[HMDCoreDataCloudKitSetupActivity activityType](v5, "activityType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqual:", CFSTR("setup-phase"));

      if (!v36)
      {
LABEL_37:

LABEL_38:
        return;
      }
      v37 = *(_QWORD *)(a1 + 32);
      v10 = v5;
      if (v37)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v37 + 120));
        if (*(_QWORD *)(v37 + 136))
        {
          -[HMDCoreDataCloudKitSetupActivity parentActivityIdentifier](v10, "parentActivityIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqual:", *(_QWORD *)(v37 + 136));

          if ((v39 & 1) == 0)
          {
            v55 = MEMORY[0x227676638]();
            v56 = (id)v37;
            HMFGetOSLogHandle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = 138543362;
              v68 = v58;
              _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Received setup-phase of different Cloudkit setup activity", (uint8_t *)&v67, 0xCu);

            }
            v54 = (void *)v55;
            goto LABEL_32;
          }
          -[HMDCoreDataCloudKitSetupActivity endDate](v10, "endDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
          {
            v66 = *(id *)(v37 + 144);
            -[HMDCoreDataCloudKitSetupActivity phase](v10, "phase");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setDurationForPhase:duration:", v48, -1.0);

            goto LABEL_35;
          }
          -[HMDCoreDataCloudKitSetupActivity endDate](v10, "endDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCoreDataCloudKitSetupActivity startDate](v10, "startDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "timeIntervalSinceDate:", v42);
          v44 = v43;

          v45 = *(id *)(v37 + 144);
          -[HMDCoreDataCloudKitSetupActivity phase](v10, "phase");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setDurationForPhase:duration:", v46, v44);

          if (!-[HMDCoreDataCloudKitSetupActivity succeeded](v10, "succeeded"))
          {
            v47 = *(id *)(v37 + 144);
            -[HMDCoreDataCloudKitSetupActivity phase](v10, "phase");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCoreDataCloudKitSetupActivity error](v10, "error");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setErrorForPhase:error:", v48, v49);

            goto LABEL_35;
          }
        }
      }
    }
LABEL_36:

    goto LABEL_37;
  }
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  char v11;

  v2 = (void *)MEMORY[0x227676638]();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitiesForConfiguration:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_2;
  v8[3] = &unk_24E781998;
  v9 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v6 = (id)v7;
  v10 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

  objc_autoreleasePoolPop(v2);
}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  char v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a2;
  if ((objc_msgSend(v6, "isAbstract") & 1) == 0)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__85130;
    v29 = __Block_byref_object_dispose__85131;
    v30 = 0;
    objc_msgSend(v6, "relationshipsByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_3;
    v24[3] = &unk_24E781920;
    v24[4] = &v25;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v24);

    v9 = objc_alloc(MEMORY[0x24BDBB678]);
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithEntityName:", v10);

    objc_msgSend(v11, "setFetchBatchSize:", 10);
    objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
    if (v26[5])
      objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:");
    v12 = *(void **)(a1 + 32);
    v23 = 0;
    objc_msgSend(v12, "executeFetchRequest:error:", v11, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    v15 = v14;
    if (v13)
    {
      if (objc_msgSend(v13, "count"))
      {
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_4;
        v19[3] = &unk_24E781970;
        v22 = *(_BYTE *)(a1 + 56);
        v21 = &v25;
        v20 = *(id *)(a1 + 40);
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);

      }
    }
    else
    {
      HMDSanitizeCoreDataError(v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      *a4 = 1;
    }

    _Block_object_dispose(&v25, 8);
  }

}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(a3, "isToMany"))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v9);
  }

}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a2;
  if (*(_BYTE *)(a1 + 48)
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v3 = 0) : (v3 = v12),
        v4 = v3,
        v5 = objc_msgSend(v4, "isFake"),
        v4,
        v6 = v12,
        (v5 & 1) == 0))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_5;
    v13[3] = &unk_24E781948;
    v8 = v12;
    v14 = v8;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v8, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    v6 = v12;
  }

}

void __65__HMDCoreData_dumpConfiguration_includeFakeModels_context_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "count");
}

void __38__HMDCoreData_newManagedObjectContext__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x227676638]();
  objc_msgSend(*(id *)(a1 + 32), "setHmd_coreData:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (id)_currentNotificationListeners
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v1[10], "allObjects");
    v1 = (id *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __74__HMDCoreData__handlePersistentCloudKitContainerEventChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a2;
  if (!*(_BYTE *)(a1 + 64))
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "succeeded") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(_BYTE *)(a1 + 65))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "coreData:cloudKitImportFinishedForStoreWithIdentifier:duration:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *(double *)(a1 + 56));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "coreData:cloudKitExportFinishedForStoreWithIdentifier:duration:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *(double *)(a1 + 56));
    }

    goto LABEL_16;
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v3 = objc_opt_respondsToSelector();
    v4 = v7;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v7, "coreData:cloudKitImportStartedForStoreWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_16:
      v4 = v7;
    }
  }
  else
  {
    v6 = objc_opt_respondsToSelector();
    v4 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "coreData:cloudKitExportStartedForStoreWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      goto LABEL_16;
    }
  }

}

+ (__CFString)afterTimeInterval:(double)a1
{
  __CFString *v2;

  objc_opt_self();
  if (a1 <= 0.0)
  {
    v2 = &stru_24E79DB48;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("after: %fs"), *(_QWORD *)&a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __41__HMDCoreData__handleChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coreData:persistentStoreWithIdentifierDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __41__HMDCoreData__handleChangeNotification___block_invoke_2(uint64_t a1)
{
  -[HMDCoreData _checkFirstCloudKitImportComplete](*(void **)(a1 + 32));
}

- (void)_checkFirstCloudKitImportComplete
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  if (a1)
  {
    v2 = (void *)objc_msgSend(a1, "newManagedObjectContext");
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __48__HMDCoreData__checkFirstCloudKitImportComplete__block_invoke;
    v4[3] = &unk_24E79C268;
    v4[4] = a1;
    v5 = v2;
    v3 = v2;
    objc_msgSend(v3, "performBlock:", v4);

  }
}

void __48__HMDCoreData__checkFirstCloudKitImportComplete__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud sync metadata", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  +[MKFCloudSyncMetadata fetchRequest](MKFCloudSyncMetadata, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = CFSTR("historyTokenForCloudStore");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v7);

  objc_msgSend(*(id *)(a1 + 32), "workingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAffectedStores:", v9);

  v10 = *(void **)(a1 + 40);
  v30 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v6, &v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v30;
  if (v11)
  {
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
      goto LABEL_11;
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2114;
      v34 = v11;
      v17 = "%{public}@Fetched too many cloud sync metadata objects: %{public}@";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2114;
      v34 = v12;
      v17 = "%{public}@Failed to fetch cloud sync metadata: %{public}@";
      goto LABEL_9;
    }
  }

  objc_autoreleasePoolPop(v13);
LABEL_11:
  objc_msgSend(v11, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "historyTokenForCloudStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      objc_autoreleasePoolPop(v20);
      -[HMDCoreData _markFirstCloudKitImportComplete](*(_QWORD *)(a1 + 32));
      goto LABEL_21;
    }
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v23;
    v24 = "%{public}@Cloud sync has previous history token";
LABEL_14:
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

    goto LABEL_15;
  }
  v25 = *(_QWORD *)(a1 + 32);
  if (!v25 || !*(_BYTE *)(v25 + 33))
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v23;
    v24 = "%{public}@Not using CloudKit so marking first import complete";
    goto LABEL_14;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v29;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@No previous cloud sync token, waiting for initial import", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
LABEL_21:

}

- (void)_markFirstCloudKitImportComplete
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  dispatch_group_t v11;
  uint64_t v12;
  NSObject *v13;
  intptr_t v14;
  NSObject *v15;
  _QWORD block[5];
  _QWORD v17[5];
  dispatch_group_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (*(_BYTE *)(a1 + 32))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
      *(_BYTE *)(a1 + 32) = 1;
      os_unfair_lock_unlock(v2);
      objc_msgSend((id)a1, "allContexts");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count"))
      {
        v4 = (void *)MEMORY[0x227676638]();
        v5 = (id)a1;
        HMFGetOSLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v3, "count");
          v9 = objc_msgSend(v3, "count");
          v10 = "s";
          *(_DWORD *)buf = 138543874;
          v20 = v7;
          if (v9 == 1)
            v10 = "";
          v21 = 2048;
          v22 = v8;
          v23 = 2080;
          v24 = v10;
          _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Flushing %ld context%s before resolving first CloudKit import promise", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v4);
        v11 = dispatch_group_create();
        v12 = MEMORY[0x24BDAC760];
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke;
        v17[3] = &unk_24E7818F8;
        v17[4] = v5;
        v18 = v11;
        v13 = v11;
        objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);
        v14 = HMDCurrentQOSWithFloor();
        dispatch_get_global_queue(v14, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = v12;
        block[1] = 3221225472;
        block[2] = __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_210;
        block[3] = &unk_24E79C240;
        block[4] = v5;
        dispatch_group_notify(v13, v15, block);

      }
      else
      {
        -[HMDCoreData _resolveFirstCloudKitImportPromise]((void *)a1);
      }

    }
  }
}

- (void)_resolveFirstCloudKitImportPromise
{
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = a1;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@First CloudKit import promise resolved", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = v3[1];
    if (os_signpost_enabled(v6))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CoreDataFirstImportComplete", ", (uint8_t *)&v11, 2u);
    }
    v7 = (void *)v3[12];
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolveWithFuture:", v8);

    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentAccessorySetupMetricDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "markSetupEndStage:error:", 13, 0);
  }
}

void __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v7;
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Flushing '%{mask.hash}@' context before resolving first CloudKit import promise", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_208;
  v11[3] = &unk_24E79BBD0;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v10, "performBlock:", v11);

}

void __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_210(uint64_t a1)
{
  -[HMDCoreData _resolveFirstCloudKitImportPromise](*(void **)(a1 + 32));
}

void __47__HMDCoreData__markFirstCloudKitImportComplete__block_invoke_208(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2160;
    v10 = 1752392040;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Flushed '%{mask.hash}@' context", (uint8_t *)&v7, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __24__HMDCoreData__postLoad__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(v4, "configurationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Working"));

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      objc_storeStrong((id *)(v7 + 48), a2);
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544130;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      v28 = 2160;
      v29 = 1752392040;
      v30 = 2112;
      v31 = v13;
      v14 = "%{public}@Found working store with identifier %{public}@ at '%{mask.hash}@'";
LABEL_23:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v24, 0x2Au);

      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(v4, "configurationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Local"));

    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        objc_storeStrong((id *)(v17 + 72), a2);
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138544130;
        v25 = v11;
        v26 = 2114;
        v27 = v12;
        v28 = 2160;
        v29 = 1752392040;
        v30 = 2112;
        v31 = v13;
        v14 = "%{public}@Found local store with identifier %{public}@ at '%{mask.hash}@'";
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v4, "configurationName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("CloudKit"));

      if ((v19 & 1) != 0)
      {
        objc_msgSend(v4, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsString:", CFSTR("shared"));

        v23 = *(_QWORD *)(a1 + 32);
        if (v22)
        {
          if (v23)
            objc_storeStrong((id *)(v23 + 64), a2);
          v8 = (void *)MEMORY[0x227676638]();
          v9 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "URL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138544130;
            v25 = v11;
            v26 = 2114;
            v27 = v12;
            v28 = 2160;
            v29 = 1752392040;
            v30 = 2112;
            v31 = v13;
            v14 = "%{public}@Found shared cloud store with identifier %{public}@ at '%{mask.hash}@'";
            goto LABEL_23;
          }
        }
        else
        {
          if (v23)
            objc_storeStrong((id *)(v23 + 56), a2);
          v8 = (void *)MEMORY[0x227676638]();
          v9 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "URL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138544130;
            v25 = v11;
            v26 = 2114;
            v27 = v12;
            v28 = 2160;
            v29 = 1752392040;
            v30 = 2112;
            v31 = v13;
            v14 = "%{public}@Found private cloud store with identifier %{public}@ at '%{mask.hash}@'";
            goto LABEL_23;
          }
        }
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
          v24 = 138543618;
          v25 = v11;
          v26 = 2114;
          v27 = v4;
          _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Found store with unexpected configuration: %{public}@", (uint8_t *)&v24, 0x16u);
LABEL_24:

        }
      }
    }
  }

  objc_autoreleasePoolPop(v8);
}

void __20__HMDCoreData__load__block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543874;
      v52 = v11;
      v53 = 2112;
      v54 = (uint64_t)v12;
      v55 = 2112;
      v56 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_FAULT, "%{public}@Failed to load persistent store at '%@': %@", (uint8_t *)&v51, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138544130;
      v52 = v16;
      v53 = 2160;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v17;
      v57 = 2114;
      v58 = v6;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persistent store at '%{mask.hash}@': %{public}@", (uint8_t *)&v51, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      HMDSanitizeCoreDataError(v6);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    if (+[HMDCoreData isDatabaseCorruptedFromError:](HMDCoreData, "isDatabaseCorruptedFromError:", v6))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v5, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("CloudKit"));

      if (v22)
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 138543362;
          v52 = v26;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Will clean up with steps for cloudkit stores", (uint8_t *)&v51, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v28 = *(_QWORD *)(v27 + 24) | 0x16;
      }
      else
      {
        objc_msgSend(v5, "configuration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("Local"));

        if (v36)
        {
          v37 = (void *)MEMORY[0x227676638]();
          v38 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138543362;
            v52 = v40;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Will clean up with steps for local store", (uint8_t *)&v51, 0xCu);

          }
          objc_autoreleasePoolPop(v37);
          v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v28 = *(_QWORD *)(v27 + 24) | 8;
        }
        else
        {
          objc_msgSend(v5, "configuration");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("Working"));

          v43 = (void *)MEMORY[0x227676638]();
          v44 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
          if (v42)
          {
            if (v46)
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = 138543362;
              v52 = v47;
              _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Will clean up with steps for working store", (uint8_t *)&v51, 0xCu);

            }
            objc_autoreleasePoolPop(v43);
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v28 = *(_QWORD *)(v27 + 24) | 2;
          }
          else
          {
            if (v46)
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "URL");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "configuration");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = 138544130;
              v52 = v48;
              v53 = 2160;
              v54 = 1752392040;
              v55 = 2112;
              v56 = v49;
              v57 = 2114;
              v58 = v50;
              _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Can't decide cleanup steps - unknown store configuration '%{mask.hash}@': %{public}@", (uint8_t *)&v51, 0x2Au);

            }
            objc_autoreleasePoolPop(v43);
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v28 = 2;
          }
        }
      }
LABEL_31:
      *(_QWORD *)(v27 + 24) = v28;
      goto LABEL_32;
    }
    if (+[HMDCoreData isDiskFullFromError:](HMDCoreData, "isDiskFullFromError:", v6))
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543362;
        v52 = v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Disk full error. Exit.", (uint8_t *)&v51, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v28 = 3;
      goto LABEL_31;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543874;
      v52 = v29;
      v53 = 2160;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v30;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Loaded persistent store at '%{mask.hash}@'", (uint8_t *)&v51, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
LABEL_32:

}

void __23__HMDCoreData__preLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Starting '%{public}@' database at '%{mask.hash}@'", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "cloudKitContainerOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      *(_BYTE *)(v11 + 33) = 1;
  }

}

void __82__HMDCoreData__pruneWorkingStoreHistoryWhenHistoryPercentageOfStoreIsGreaterThan___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  double v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  double v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  +[MKFCloudSyncMetadata fetchRequest](MKFCloudSyncMetadata, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v3 = *(void **)(a1 + 32);
  v46 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v46);
  v4 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v5 = COERCE_DOUBLE(v46);
  if (v4 == 0.0)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v31;
      v49 = 2114;
      v50 = v5;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFCloudSyncMetadata: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
  }
  else if (objc_msgSend(*(id *)&v4, "count"))
  {
    if ((unint64_t)objc_msgSend(*(id *)&v4, "count") >= 2)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v9;
        v49 = 2114;
        v50 = v4;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@More than one MKFCloudSyncMetadata object (using first): %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
    objc_msgSend(*(id *)&v4, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "historyTokenForWorkingStore");
    v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11 == 0.0)
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v36;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@No last history token for working store, this must be a new device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v48 = v16;
        v49 = 2114;
        v50 = v11;
        v51 = 2050;
        v52 = v17;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Will prune working store history before history token %{public}@ when history percentage is > %{public}zd%%", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v19 = v18;
      objc_msgSend(MEMORY[0x24BDBB710], "deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:", *(_QWORD *)&v11, *(_QWORD *)(a1 + 56));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 32);
      v45 = v5;
      v22 = (id)objc_msgSend(v21, "executeRequest:error:", v20, &v45);
      v23 = COERCE_DOUBLE(*(id *)&v45);

      if (v23 == 0.0)
      {
        v37 = objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v39 = v38;
        v40 = (void *)MEMORY[0x227676638](v37);
        v41 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = v40;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v43;
          v49 = 2050;
          v50 = v39 - v19;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Successfully pruned working store history in %{public}.3lf seconds", buf, 0x16u);

          v40 = v44;
        }

        objc_autoreleasePoolPop(v40);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v27;
          v49 = 2114;
          v50 = v23;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Pruning working store history failed with %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
      }

      v5 = v23;
    }

  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@No MKFCloudSyncMetadata found, this must be a new device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

+ (HMDCoreData)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HMDCoreData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_onceToken != -1)
    dispatch_once(&_onceToken, block);
  return (HMDCoreData *)(id)_sharedInstance;
}

+ (void)cleanUpSharedInstance
{
  void *v2;

  objc_msgSend((id)_sharedInstance, "stopWatchingManagedObjectChanges");
  v2 = (void *)_sharedInstance;
  _sharedInstance = 0;

}

+ (NSManagedObjectModel)managedObjectModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMDCoreData_managedObjectModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (managedObjectModel_once != -1)
    dispatch_once(&managedObjectModel_once, block);
  return (NSManagedObjectModel *)(id)managedObjectModel_model;
}

+ (NSURL)managedObjectModelURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HMDCoreData_managedObjectModelURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (managedObjectModelURL_onceTokenForURL != -1)
    dispatch_once(&managedObjectModelURL_onceTokenForURL, block);
  return (NSURL *)(id)managedObjectModelURL_managedObjectModelURL;
}

+ (BOOL)isUsingProductionObjectModel
{
  void *v3;
  void *v4;
  char v5;

  +[HMDCoreData productionManagedObjectModelURL]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectModelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();

  return v5;
}

+ (id)sharedInstanceWithoutLiveCloudKit
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_onceToken != -1)
    dispatch_once(&_onceToken, block);
  return (id)_sharedInstance;
}

+ (id)createWithPersistentStoreDescriptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createWithPersistentStoreDescriptions:notificationCenter:userDefaults:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)createWithPersistentStoreDescriptions:(id)a3 notificationCenter:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreDescriptions:notificationCenter:userDefaults:", v10, v9, v8);

  return v11;
}

+ (id)storeNameForConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "isUsingProductionObjectModel") & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dev-%@"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (NSPersistentStoreDescription)cloudPrivateStoreDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeNameForConfiguration:", CFSTR("core-cloudkit.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, CFSTR("CloudKit"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HMDCoreDataCloudKitContainerOptions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudKitContainerOptions:", v5);

  return (NSPersistentStoreDescription *)v4;
}

+ (NSPersistentStoreDescription)cloudSharedStoreDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "storeNameForConfiguration:", CFSTR("core-cloudkit-shared.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, CFSTR("CloudKit"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HMDCoreDataCloudKitContainerOptions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudKitContainerOptions:", v5);

  objc_msgSend(v4, "cloudKitContainerOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDatabaseScope:", 3);

  return (NSPersistentStoreDescription *)v4;
}

+ (NSPersistentStoreDescription)localStoreDescription
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "storeNameForConfiguration:", CFSTR("core-local.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, CFSTR("Local"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStoreDescription *)v4;
}

+ (NSPersistentStoreDescription)workingStoreDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "storeNameForConfiguration:", CFSTR("core.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData _storeDescriptionForConfiguration:storeName:]((uint64_t)a1, CFSTR("Working"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB520]);
  v8 = *MEMORY[0x24BDBB4B8];
  objc_msgSend(a1, "entitiesExcludedFromWorkingStoreHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setOption:forKey:", v6, *MEMORY[0x24BDBB4C8]);
  return (NSPersistentStoreDescription *)v4;
}

+ (NSArray)entitiesExcludedFromWorkingStoreHistory
{
  return (NSArray *)&unk_24E970E20;
}

+ (NSArray)defaultPersistentStoreDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cloudPrivateStoreDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(a1, "cloudSharedStoreDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(a1, "localStoreDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(a1, "workingStoreDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

+ (BOOL)isDatabaseCorruptedFromError:(id)a3
{
  return +[HMDCoreData isError:domain:fromError:]((uint64_t)HMDCoreData, 11, (void *)*MEMORY[0x24BDBB568], a3);
}

+ (BOOL)isDiskFullFromError:(id)a3
{
  return +[HMDCoreData isError:domain:fromError:]((uint64_t)HMDCoreData, 13, (void *)*MEMORY[0x24BDBB568], a3);
}

+ (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)+[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t82 != -1)
    dispatch_once(&logCategory__hmf_once_t82, &__block_literal_global_85311);
  return (id)logCategory__hmf_once_v83;
}

void __26__HMDCoreData_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v83;
  logCategory__hmf_once_v83 = v0;

}

+ (uint64_t)isError:(void *)a3 domain:(void *)a4 fromError:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_self();
  v9 = v7;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = *MEMORY[0x24BDD1398];
    v13 = v9;
    do
    {
      objc_msgSend(v10, "addObject:", v13);
      objc_msgSend(v13, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
        v18 = v11 >= 9;
      else
        v18 = 1;
      ++v11;
      v13 = v15;
    }
    while (!v18);
    v19 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v19 = (void *)MEMORY[0x24BDBD1A8];
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = v8;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@all underlying errors : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __40__HMDCoreData_isError_domain_fromError___block_invoke;
  v27[3] = &unk_24E781858;
  v28 = v6;
  v29 = a2;
  v30 = v21;
  v24 = v6;
  v25 = objc_msgSend(v19, "na_any:", v27);

  return v25;
}

BOOL __40__HMDCoreData_isError_domain_fromError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v5 = objc_msgSend(v3, "code");
    v6 = *(_QWORD *)(a1 + 40);

    if (v5 == v6)
    {
      v7 = 1;
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v18 = 138544130;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Found the %@ error domain and error code : %@, %@", (uint8_t *)&v18, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v7 = objc_msgSend(v11, "integerValue") == *(_QWORD *)(a1 + 40);
  }
  else
  {
    v7 = 0;
  }

LABEL_14:
  return v7;
}

+ (id)_storeDescriptionForConfiguration:(void *)a3 storeName:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_self();
  v7 = (id)storeDirectoryPath;
  v8 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBB740], "persistentStoreDescriptionWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfiguration:", v4);
  v12 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v11, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB4C8]);
  objc_msgSend(v11, "setOption:forKey:", v12, *MEMORY[0x24BDBB518]);
  objc_msgSend(v11, "setOption:forKey:", &unk_24E96B1B0, *MEMORY[0x24BDBB4D0]);
  if ((objc_msgSend(v6, "isUsingProductionObjectModel") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Disabling automatic store migration for: [%@ / %@]", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v11, "setShouldMigrateStoreAutomatically:", 0);
  }

  return v11;
}

void __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "defaultPersistentStoreDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke_2;
  v9[3] = &__block_descriptor_40_e45_v32__0__NSPersistentStoreDescription_8Q16_B24l;
  v9[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9));
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating HMDCoreData instance without Live CloudKit", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "createWithPersistentStoreDescriptions:", v2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_sharedInstance;
  _sharedInstance = v7;

  objc_msgSend((id)_sharedInstance, "startWatchingManagedObjectChanges");
  objc_msgSend((id)_sharedInstance, "startLoadingStores");

}

void __48__HMDCoreData_sharedInstanceWithoutLiveCloudKit__block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Not configuring [%@] with cloud kit container options", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "setCloudKitContainerOptions:", 0);

}

+ (id)productionManagedObjectModelURL
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDCoreData_productionManagedObjectModelURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (productionManagedObjectModelURL_onceTokenForBundle != -1)
    dispatch_once(&productionManagedObjectModelURL_onceTokenForBundle, block);
  return (id)productionManagedObjectModelURL_sProductionURL;
}

void __46__HMDCoreData_productionManagedObjectModelURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _BYTE v19[24];
  const __CFString *v20;
  _BYTE v21[10];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("HomeKitCoreDataModel"), CFSTR("momd"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)productionManagedObjectModelURL_sProductionURL;
  productionManagedObjectModelURL_sProductionURL = v3;

  if (!productionManagedObjectModelURL_sProductionURL)
  {
    v5 = objc_opt_self();
    *(_QWORD *)v19 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v19[8] = 3221225472;
    *(_QWORD *)&v19[16] = __47__HMDCoreData_developmentManagedObjectModelURL__block_invoke;
    v20 = (const __CFString *)&__block_descriptor_40_e5_v8__0l;
    *(_QWORD *)v21 = v5;
    if (developmentManagedObjectModelURL_onceTokenForBundle != -1)
      dispatch_once(&developmentManagedObjectModelURL_onceTokenForBundle, v19);
    v6 = (id)developmentManagedObjectModelURL_developmentManagedObjectModelURL;
    objc_msgSend(v6, "path", *(_QWORD *)v19, *(_QWORD *)&v19[8], *(_QWORD *)&v19[16], v20, *(_QWORD *)v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138544386;
      *(_QWORD *)&v19[4] = v11;
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = CFSTR("HomeKitCoreDataModel");
      *(_WORD *)&v19[22] = 2112;
      v20 = CFSTR("momd");
      *(_WORD *)v21 = 2112;
      *(_QWORD *)&v21[2] = v2;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to find [%@.%@] in bundle [%@]. Going to look into development momd directory: %@", v19, 0x34u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1488], "pathForResource:ofType:inDirectory:", CFSTR("Production"), CFSTR("mom"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v12);
    v14 = (void *)productionManagedObjectModelURL_sProductionURL;
    productionManagedObjectModelURL_sProductionURL = v13;

  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v19 = 138543618;
    *(_QWORD *)&v19[4] = v18;
    *(_WORD *)&v19[12] = 2112;
    *(_QWORD *)&v19[14] = productionManagedObjectModelURL_sProductionURL;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Production URL: %@", v19, 0x16u);

  }
  objc_autoreleasePoolPop(v15);

}

void __47__HMDCoreData_developmentManagedObjectModelURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("HomeKitCoreDataModel-Development"), CFSTR("momd"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)developmentManagedObjectModelURL_developmentManagedObjectModelURL;
  developmentManagedObjectModelURL_developmentManagedObjectModelURL = v3;

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = developmentManagedObjectModelURL_developmentManagedObjectModelURL;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Development URL: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __36__HMDCoreData_managedObjectModelURL__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_self();
  if (isInternalBuild())
  {
    v1 = (void *)MEMORY[0x227676638]();
    v2 = v0;
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v4;
      v10 = 2112;
      v11 = v7;
      v12 = 1024;
      v13 = 0;
      _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@%@, RVC: %{BOOL}d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v1);
  }

  +[HMDCoreData productionManagedObjectModelURL]();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)managedObjectModelURL_managedObjectModelURL;
  managedObjectModelURL_managedObjectModelURL = v5;

  if (!managedObjectModelURL_managedObjectModelURL)
    _HMFPreconditionFailure();

}

void __33__HMDCoreData_managedObjectModel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectModelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Using : %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if (!v2)
    _HMFPreconditionFailure();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v2);
  v8 = (void *)managedObjectModel_model;
  managedObjectModel_model = v7;

  objc_msgSend((id)managedObjectModel_model, "hmd_makeImmutable");
}

uint64_t __29__HMDCoreData_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)objc_opt_self();
  objc_msgSend(v0, "defaultPersistentStoreDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "createWithPersistentStoreDescriptions:", v1);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)_sharedInstance;
  _sharedInstance = v2;

  objc_msgSend((id)_sharedInstance, "startWatchingManagedObjectChanges");
  return objc_msgSend((id)_sharedInstance, "startLoadingStores");
}

@end
