@implementation _DKSync2Coordinator

- (_DKSync2Coordinator)initWithStorage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DKSyncContext *v12;
  _DKSync2Coordinator *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "directory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.coreduet.sync.context:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_DKSyncContext initWithName:]([_DKSyncContext alloc], "initWithName:", v11);
  -[_DKSyncContext setStorage:](v12, "setStorage:", v5);

  v13 = -[_DKSync2Coordinator initWithContext:](self, "initWithContext:", v12);
  return v13;
}

- (_DKSync2Coordinator)initWithContext:(id)a3
{
  id v4;
  _DKSync2Coordinator *v5;
  uint64_t v6;
  NSMutableSet *busyTransactions;
  uint64_t v8;
  _DKKnowledgeStorage *storage;
  _DKKnowledgeStorage *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  _DKKeyValueStore *keyValueStore;
  _DKThrottledActivity *v15;
  _DKThrottledActivity *activityThrottler;
  uint64_t v17;
  NSMutableArray *insertedSyncedEvents;
  uint64_t v19;
  NSMutableArray *deletedSyncedEvents;
  uint64_t v21;
  NSMutableSet *activatedPeers;
  uint64_t v23;
  NSMutableSet *streamNamesObservedForAdditions;
  uint64_t v25;
  NSMutableSet *streamNamesObservedForDeletions;
  void *v27;
  NSMutableSet *v28;
  void *v29;
  NSMutableSet *v30;
  void *v31;
  void *v32;
  NSMutableSet *v33;
  void *v34;
  NSMutableSet *v35;
  void *v36;
  void *v37;
  NSMutableSet *v38;
  void *v39;
  NSMutableSet *v40;
  void *v41;
  uint64_t v42;
  NSString *triggeredSyncDelayActivityName;
  uint64_t v44;
  NSString *syncActivityName;
  uint64_t v46;
  _DKSyncToggle *syncEnabledToggler;
  uint64_t v48;
  _DKSyncToggle *someTransportIsAvailableToggler;
  uint64_t v50;
  _DKSyncToggle *cloudIsAvailableToggler;
  uint64_t v52;
  _DKSyncToggle *rapportIsAvailableToggler;
  _DKDataProtectionStateMonitor *v54;
  _DKDataProtectionStateMonitor *dataProtectionMonitor;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  _QWORD v62[4];
  _DKSync2Coordinator *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id location;
  objc_super v69;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_DKSync2Coordinator;
  v5 = -[_DKSyncContextObject initWithContext:](&v69, sel_initWithContext_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    busyTransactions = v5->_busyTransactions;
    v5->_busyTransactions = (NSMutableSet *)v6;

    objc_msgSend(v4, "storage");
    v8 = objc_claimAutoreleasedReturnValue();
    storage = v5->_storage;
    v5->_storage = (_DKKnowledgeStorage *)v8;

    objc_storeStrong((id *)&_DKSyncKnowledgeStorage, v5->_storage);
    v10 = v5->_storage;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKKnowledgeStorage keyValueStoreForDomain:](v10, "keyValueStoreForDomain:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    keyValueStore = v5->_keyValueStore;
    v5->_keyValueStore = (_DKKeyValueStore *)v13;

    v15 = -[_DKThrottledActivity initWithStore:namespace:]([_DKThrottledActivity alloc], "initWithStore:namespace:", v5->_keyValueStore, CFSTR("_DKSync2Coordinator"));
    activityThrottler = v5->_activityThrottler;
    v5->_activityThrottler = v15;

    v17 = objc_opt_new();
    insertedSyncedEvents = v5->_insertedSyncedEvents;
    v5->_insertedSyncedEvents = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    deletedSyncedEvents = v5->_deletedSyncedEvents;
    v5->_deletedSyncedEvents = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    activatedPeers = v5->_activatedPeers;
    v5->_activatedPeers = (NSMutableSet *)v21;

    v23 = objc_opt_new();
    streamNamesObservedForAdditions = v5->_streamNamesObservedForAdditions;
    v5->_streamNamesObservedForAdditions = (NSMutableSet *)v23;

    v25 = objc_opt_new();
    streamNamesObservedForDeletions = v5->_streamNamesObservedForDeletions;
    v5->_streamNamesObservedForDeletions = (NSMutableSet *)v25;

    -[_DKSync2Coordinator policyForSyncTransportType:](v5, "policyForSyncTransportType:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "syncDisabled") & 1) == 0)
    {
      v28 = v5->_streamNamesObservedForAdditions;
      objc_msgSend(v27, "streamNamesWithAdditionsTriggeringSync");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](v28, "addObjectsFromArray:", v29);

      v30 = v5->_streamNamesObservedForDeletions;
      objc_msgSend(v27, "streamNamesWithDeletionsTriggeringSync");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](v30, "addObjectsFromArray:", v31);

    }
    -[_DKSync2Coordinator policyForSyncTransportType:](v5, "policyForSyncTransportType:", 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "syncDisabled") & 1) == 0)
    {
      v33 = v5->_streamNamesObservedForAdditions;
      objc_msgSend(v32, "streamNamesWithAdditionsTriggeringSync");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](v33, "addObjectsFromArray:", v34);

      v35 = v5->_streamNamesObservedForDeletions;
      objc_msgSend(v32, "streamNamesWithDeletionsTriggeringSync");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](v35, "addObjectsFromArray:", v36);

    }
    -[_DKSync2Coordinator policyForSyncTransportType:](v5, "policyForSyncTransportType:", 8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "syncDisabled") & 1) == 0)
    {
      v38 = v5->_streamNamesObservedForAdditions;
      objc_msgSend(v37, "streamNamesWithAdditionsTriggeringSync");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](v38, "addObjectsFromArray:", v39);

      v40 = v5->_streamNamesObservedForDeletions;
      objc_msgSend(v37, "streamNamesWithDeletionsTriggeringSync");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](v40, "addObjectsFromArray:", v41);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SyncCoordinatorTriggeredSyncDelay"));
    v42 = objc_claimAutoreleasedReturnValue();
    triggeredSyncDelayActivityName = v5->_triggeredSyncDelayActivityName;
    v5->_triggeredSyncDelayActivityName = (NSString *)v42;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SyncCoordinatorSync"));
    v44 = objc_claimAutoreleasedReturnValue();
    syncActivityName = v5->_syncActivityName;
    v5->_syncActivityName = (NSString *)v44;

    +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, CFSTR("sync enabled"), (uint64_t)sel__syncEnabledToggle, (uint64_t)sel__syncDisabledToggle);
    v46 = objc_claimAutoreleasedReturnValue();
    syncEnabledToggler = v5->_syncEnabledToggler;
    v5->_syncEnabledToggler = (_DKSyncToggle *)v46;

    +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, CFSTR("some transport is available"), (uint64_t)sel__someTransportIsAvailableToggle, (uint64_t)sel__noTransportIsAvailableToggle);
    v48 = objc_claimAutoreleasedReturnValue();
    someTransportIsAvailableToggler = v5->_someTransportIsAvailableToggler;
    v5->_someTransportIsAvailableToggler = (_DKSyncToggle *)v48;

    +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, CFSTR("Cloud is available"), (uint64_t)sel__cloudIsAvailableToggle, (uint64_t)sel__cloudIsUnavailableToggle);
    v50 = objc_claimAutoreleasedReturnValue();
    cloudIsAvailableToggler = v5->_cloudIsAvailableToggler;
    v5->_cloudIsAvailableToggler = (_DKSyncToggle *)v50;

    +[_DKSyncToggle toggleWithObject:name:enableSelector:disableSelector:]((uint64_t)_DKSyncToggle, v5, CFSTR("Rapport is available"), (uint64_t)sel__rapportIsAvailableToggle, (uint64_t)sel__rapportIsUnavailableToggle);
    v52 = objc_claimAutoreleasedReturnValue();
    rapportIsAvailableToggler = v5->_rapportIsAvailableToggler;
    v5->_rapportIsAvailableToggler = (_DKSyncToggle *)v52;

    v54 = objc_alloc_init(_DKDataProtectionStateMonitor);
    dataProtectionMonitor = v5->_dataProtectionMonitor;
    v5->_dataProtectionMonitor = v54;

    objc_initWeak(&location, v5);
    v56 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __39___DKSync2Coordinator_initWithContext___block_invoke;
    v66[3] = &unk_1E26E2ED0;
    objc_copyWeak(&v67, &location);
    -[_DKDataProtectionStateMonitor setChangeHandler:](v5->_dataProtectionMonitor, "setChangeHandler:", v66);
    v61 = v27;
    +[_DKSyncUrgencyTracker sharedInstance]();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v56;
    v64[1] = 3221225472;
    v64[2] = __39___DKSync2Coordinator_initWithContext___block_invoke_2;
    v64[3] = &unk_1E26E2EF8;
    objc_copyWeak(&v65, &location);
    objc_msgSend(v58, "addObserver:name:sender:queue:usingBlock:", v5, CFSTR("_DKSyncUrgencyDidChangeNotification"), v57, v59, v64);

    v62[0] = v56;
    v62[1] = 3221225472;
    v62[2] = __39___DKSync2Coordinator_initWithContext___block_invoke_3;
    v62[3] = &unk_1E26E2F20;
    v63 = v5;
    +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v62);

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (void)handleDataProtectionChangeFor:(int)a3 willBeAvailable:
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1 && objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2AC0]))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("unavailable");
      *(_DWORD *)buf = 138543874;
      v12 = v8;
      v13 = 2112;
      if (a3)
        v9 = CFSTR("available");
      v14 = v6;
      v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Data protection availability changed for %@ to %@", buf, 0x20u);

    }
    if (a3)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69___DKSync2Coordinator_handleDataProtectionChangeFor_willBeAvailable___block_invoke;
      v10[3] = &unk_1E26E2F20;
      v10[4] = a1;
      +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v10);
    }
  }

}

- (void)_reregisterPeriodicJob
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(&dword_18DDBE000, v1, v2, "%{public}@: Checking whether periodic job should be re-scheduled with isSingleDevice=%{BOOL}d", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_performSyncTogglesChangedActions
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Performing sync toggles change actions", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_observerToken)
  {
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeStatusChangeObserver:", self->_observerToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)_DKSync2Coordinator;
  -[_DKSync2Coordinator dealloc](&v4, sel_dealloc);
}

- (NSUUID)deviceUUID
{
  return -[_DKKnowledgeStorage deviceUUID](self->_storage, "deviceUUID");
}

+ (id)storage
{
  objc_opt_self();
  return (id)_DKSyncKnowledgeStorage;
}

+ (id)keyValueStoreForDomain:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend((id)_DKSyncKnowledgeStorage, "keyValueStoreForDomain:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_syncEnabledToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _registerSyncPolicyChangedObserver]((uint64_t)self);
  -[_DKSync2Coordinator _registerRapportAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _registerCloudSyncAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _registerSiriSyncEnabledObserver](self);
  -[_DKSync2Coordinator _registerRapportLaunchOnDemandHandler]((uint64_t)self);
  -[_DKSync2Coordinator _performEnableAndStart]((uint64_t)self);
  -[_DKSync2Coordinator _deleteSiriEventsIfSiriCloudSyncHasBeenDisabled]((uint64_t)self);
}

- (void)_registerSyncPolicyChangedObserver
{
  id v2;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 117))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__syncPolicyDidChange_, CFSTR("_DKSync2PolicyDidChangeNotification"), 0);
      *(_BYTE *)(a1 + 117) = 1;

    }
  }
}

- (void)_registerRapportAvailablityObserver
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (!*(_BYTE *)(a1 + 115))
    {
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __58___DKSync2Coordinator__registerRapportAvailablityObserver__block_invoke;
      v5[3] = &unk_1E26E3140;
      v5[4] = a1;
      objc_msgSend(v3, "addObserver:name:sender:queue:usingBlock:", a1, CFSTR("_DKRapportTransportAvailablityChangedNotification"), 0, v4, v5);

      *(_BYTE *)(a1 + 115) = 1;
    }
  }
}

- (void)_registerCloudSyncAvailablityObserver
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (!*(_BYTE *)(a1 + 114))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__cloudSyncAvailabilityDidChange_, CFSTR("_DKCloudSyncAvailablityChangedNotification"), 0);
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __60___DKSync2Coordinator__registerCloudSyncAvailablityObserver__block_invoke;
      v6[3] = &unk_1E26E3140;
      v6[4] = a1;
      objc_msgSend(v4, "addObserver:name:sender:queue:usingBlock:", a1, CFSTR("_DKCloudTransportAvailablityChangedNotification"), 0, v5, v6);

      *(_BYTE *)(a1 + 114) = 1;
    }
  }
}

- (void)_registerSiriSyncEnabledObserver
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;
  __CFNotificationCenter *v5;
  const __CFString *v6;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (!a1[116])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v4 = (const __CFString *)getkAFCloudStorageDeletedByUserDarwinNotification();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_siriSyncEnabledDidChangeCallback, v4, 0, (CFNotificationSuspensionBehavior)0);
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      v6 = (const __CFString *)getkAFCloudSyncPreferenceDidChangeDarwinNotification();
      CFNotificationCenterAddObserver(v5, a1, (CFNotificationCallback)_siriSyncEnabledDidChangeCallback, v6, 0, (CFNotificationSuspensionBehavior)0);
      a1[116] = 1;
    }
  }
}

- (void)_registerRapportLaunchOnDemandHandler
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "com.apple.rapport.matching";
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Registering xpc_set_event_stream_handler(\"%s\", (uint8_t *)&v3);
}

- (void)_performEnableAndStart
{
  NSObject *v2;
  _QWORD v3[5];

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (!*(_BYTE *)(a1 + 73))
    {
      if (objc_msgSend(*(id *)(a1 + 64), "isDataAvailableFor:", *MEMORY[0x1E0CB2AC0]))
      {
        v3[0] = MEMORY[0x1E0C809B0];
        v3[1] = 3221225472;
        v3[2] = __45___DKSync2Coordinator__performEnableAndStart__block_invoke;
        v3[3] = &unk_1E26E2F20;
        v3[4] = a1;
        +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v3);
        *(_BYTE *)(a1 + 73) = 1;
      }
    }
  }
}

- (void)_deleteSiriEventsIfSiriCloudSyncHasBeenDisabled
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 216), "objectForKey:", CFSTR("_DKSiriCloudSyncEnabled"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[objc_class sharedPreferences](getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudSyncEnabled");

  if (!v8)
  {
    v4 = 0;
    if (!(_DWORD)v3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4 = objc_msgSend(v8, "BOOLValue") & (v3 ^ 1);
  if ((_DWORD)v3)
LABEL_4:
    objc_msgSend(*(id *)(a1 + 216), "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("NeedsSiriCloudDelete"));
LABEL_5:
  v5 = *(void **)(a1 + 216);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("_DKSiriCloudSyncEnabled"));

  if (v4)
  {
    -[_DKSync2Coordinator _deleteForeignSiriEvents](a1);
    -[_DKSync2Coordinator _deleteSiriCloudEvents](a1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 216), "objectForKey:", CFSTR("NeedsSiriCloudDelete"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
      -[_DKSync2Coordinator _deleteSiriCloudEvents](a1);

  }
}

- (void)_syncDisabledToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _unregisterRapportAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterCloudSyncAvailablityObserver]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterSiriSyncEnabledObserver](self);
}

- (void)_unregisterRapportAvailablityObserver
{
  NSObject *v2;
  id v3;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (*(_BYTE *)(a1 + 115))
    {
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:name:", a1, CFSTR("_DKRapportTransportAvailablityChangedNotification"));
      *(_BYTE *)(a1 + 115) = 0;

    }
  }
}

- (void)_unregisterCloudSyncAvailablityObserver
{
  void *v2;
  id v3;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 114))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:name:object:", a1, CFSTR("_DKCloudSyncAvailablityChangedNotification"), 0);
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObserver:name:", a1, CFSTR("_DKCloudTransportAvailablityChangedNotification"));
      *(_BYTE *)(a1 + 114) = 0;

    }
  }
}

- (void)_unregisterSiriSyncEnabledObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v3;
  __CFNotificationCenter *v4;
  const __CFString *v5;

  if (a1)
  {
    if (a1[116])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v3 = (const __CFString *)getkAFCloudStorageDeletedByUserDarwinNotification();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, v3, 0);
      v4 = CFNotificationCenterGetDarwinNotifyCenter();
      v5 = (const __CFString *)getkAFCloudSyncPreferenceDidChangeDarwinNotification();
      CFNotificationCenterRemoveObserver(v4, a1, v5, 0);
      a1[116] = 0;
    }
  }
}

- (void)_someTransportIsAvailableToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _registerPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _registerDatabaseObservers]((uint64_t)self);
  -[_DKSync2Coordinator _registerTriggeredSyncActivityWithIsStartup:](self, 1);
}

- (void)_registerPeriodicJob
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(&dword_18DDBE000, v1, v2, "%{public}@: Checking whether periodic job should be scheduled with isSingleDevice=%{BOOL}d", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_registerDatabaseObservers
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Registering sync database observers", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_registerTriggeredSyncActivityWithIsStartup:(_BYTE *)a1
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD handler[4];
  id v8;
  char v9;
  id location;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    if (!a1[184])
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Coordinator _registerTriggeredSyncActivityWithIsStartup:].cold.1();

      a1[184] = 1;
      objc_initWeak(&location, a1);
      v6 = (void *)*MEMORY[0x1E0C80748];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke;
      handler[3] = &unk_1E26E3208;
      objc_copyWeak(&v8, &location);
      v9 = a2;
      xpc_activity_register("com.apple.coreduet.sync.triggered", v6, handler);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_noTransportIsAvailableToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _unregisterPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterDatabaseObservers]((uint64_t)self);
}

- (void)_unregisterPeriodicJob
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Unscheduling periodic sync job", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (uint64_t)_unregisterDatabaseObservers
{
  uint64_t v1;
  NSObject *v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 112))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Coordinator _unregisterDatabaseObservers].cold.1();

      objc_msgSend(*(id *)(v1 + 208), "removeKnowledgeStorageEventNotificationDelegate:", v1);
      result = objc_msgSend(*(id *)(v1 + 208), "decrementInsertsAndDeletesObserverCount");
      *(_BYTE *)(v1 + 112) = 0;
    }
  }
  return result;
}

- (void)_cloudIsAvailableToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[_DKSync2Policy setOkToDownloadPolicyUpdates:](_DKSync2Policy, "setOkToDownloadPolicyUpdates:", 1);
  -[_DKSync2Coordinator _createPushConnection]((uint64_t)self);
  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _registerCloudDeviceCountChangedObserver]((uint64_t)self);
  -[_DKSync2Coordinator _deleteSiriEventsIfSiriCloudSyncHasBeenDisabled]((uint64_t)self);
  -[_DKSync2Coordinator _possiblyPerformInitialSync]((id *)&self->super.super.isa);
}

- (void)_createPushConnection
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(&unk_1E272BB18, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v2, v3, "%{public}@: Created connection for topics: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)_registerCloudDeviceCountChangedObserver
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (!*(_BYTE *)(a1 + 113))
    {
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __63___DKSync2Coordinator__registerCloudDeviceCountChangedObserver__block_invoke;
      v5[3] = &unk_1E26E3140;
      v5[4] = a1;
      objc_msgSend(v3, "addObserver:name:sender:queue:usingBlock:", a1, CFSTR("_DKCloudDeviceCountChangedNotification"), 0, v4, v5);

      *(_BYTE *)(a1 + 113) = 1;
    }
  }
}

- (void)_possiblyPerformInitialSync
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Scheduling initial sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_cloudIsUnavailableToggle
{
  NSObject *v3;
  APSConnection *connection;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      self->_connection = 0;

    }
  }
  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
  -[_DKSync2Coordinator _unregisterCloudDeviceCountChangedObserver]((uint64_t)self);
}

- (void)_unregisterCloudDeviceCountChangedObserver
{
  NSObject *v2;
  id v3;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (*(_BYTE *)(a1 + 113))
    {
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:name:", a1, CFSTR("_DKCloudDeviceCountChangedNotification"));
      *(_BYTE *)(a1 + 113) = 0;

    }
  }
}

- (void)_rapportIsAvailableToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
}

- (void)_rapportIsUnavailableToggle
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
}

- (void)configureTracker
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_initWeak(&location, a1);
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39___DKSync2Coordinator_configureTracker__block_invoke;
    v6[3] = &unk_1E26E2F48;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "addStatusChangeObserverWithBlock:", v6);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[3];
    a1[3] = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setupStorage
{
  NSObject *v3;
  _DKSyncLocalKnowledgeStorage *v4;
  _DKSyncLocalKnowledgeStorage *localStorage;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  _DKSyncRemoteKnowledgeStorage *v10;
  _DKSyncRemoteKnowledgeStorage *transportRapport;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  _DKSyncRemoteKnowledgeStorage *v22;
  _DKSyncRemoteKnowledgeStorage *transportCloudDown;
  _DKSyncRemoteKnowledgeStorage *v24;
  _DKSyncRemoteKnowledgeStorage *transportCloudUp;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (_DKSyncLocalKnowledgeStorage *)-[_DKSyncLocalKnowledgeStorage initWithKnowledgeStorage:]((id *)[_DKSyncLocalKnowledgeStorage alloc], self->_storage);
  localStorage = self->_localStorage;
  self->_localStorage = v4;

  -[_DKSync2Coordinator policyForSyncTransportType:](self, "policyForSyncTransportType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "syncDisabled") & 1) != 0)
  {

  }
  else
  {
    v7 = +[_DKSync2Policy rapportSyncDisabled](_DKSync2Policy, "rapportSyncDisabled");

    if (!v7)
    {
      +[_DKSyncRapportKnowledgeStorage sharedInstance](_DKSyncRapportKnowledgeStorage, "sharedInstance");
      v10 = (_DKSyncRemoteKnowledgeStorage *)objc_claimAutoreleasedReturnValue();
      transportRapport = self->_transportRapport;
      self->_transportRapport = v10;

      -[_DKSyncRemoteKnowledgeStorage setFetchDelegate:](self->_transportRapport, "setFetchDelegate:", self);
      goto LABEL_8;
    }
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138543362;
    *(_QWORD *)&v26[4] = v9;
    _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_INFO, "%{public}@: Rapport transport disabled by policy", v26, 0xCu);

  }
LABEL_8:
  -[_DKSync2Coordinator policyForSyncTransportType:](self, "policyForSyncTransportType:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "syncDisabled") & 1) != 0)
  {

LABEL_11:
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend((id)objc_opt_class(), "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138543362;
    *(_QWORD *)&v26[4] = v15;
    v16 = "%{public}@: Cloud(Down) transport disabled by policy";
LABEL_13:
    _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_INFO, v16, v26, 0xCu);

    goto LABEL_14;
  }
  v13 = +[_DKSync2Policy cloudSyncDisabled](_DKSync2Policy, "cloudSyncDisabled");

  if (v13)
    goto LABEL_11;
  if (!+[_DKCloudUtilities isCloudKitEnabled](_DKCloudUtilities, "isCloudKitEnabled"))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    objc_msgSend((id)objc_opt_class(), "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138543362;
    *(_QWORD *)&v26[4] = v15;
    v16 = "%{public}@: Cloud(Down) transport is not enabled";
    goto LABEL_13;
  }
  +[_DKSyncDownCloudKitKnowledgeStorage sharedInstance](_DKSyncDownCloudKitKnowledgeStorage, "sharedInstance");
  v22 = (_DKSyncRemoteKnowledgeStorage *)objc_claimAutoreleasedReturnValue();
  transportCloudDown = self->_transportCloudDown;
  self->_transportCloudDown = v22;

  -[_DKSyncRemoteKnowledgeStorage setFetchDelegate:](self->_transportCloudDown, "setFetchDelegate:", self);
LABEL_15:
  -[_DKSync2Coordinator policyForSyncTransportType:](self, "policyForSyncTransportType:", 8, *(_OWORD *)v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "syncDisabled") & 1) != 0)
  {

    goto LABEL_18;
  }
  v18 = +[_DKSync2Policy cloudSyncDisabled](_DKSync2Policy, "cloudSyncDisabled");

  if (v18)
  {
LABEL_18:
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v20;
      v21 = "%{public}@: Cloud(Up) transport disabled by policy";
LABEL_20:
      _os_log_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_INFO, v21, v26, 0xCu);

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (+[_DKCloudUtilities isCloudKitEnabled](_DKCloudUtilities, "isCloudKitEnabled"))
  {
    +[_DKSyncUpCloudKitKnowledgeStorage sharedInstance](_DKSyncUpCloudKitKnowledgeStorage, "sharedInstance");
    v24 = (_DKSyncRemoteKnowledgeStorage *)objc_claimAutoreleasedReturnValue();
    transportCloudUp = self->_transportCloudUp;
    self->_transportCloudUp = v24;

    -[_DKSyncRemoteKnowledgeStorage setFetchDelegate:](self->_transportCloudUp, "setFetchDelegate:", self);
    return;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138543362;
    *(_QWORD *)&v26[4] = v20;
    v21 = "%{public}@: Cloud(Up) transport is not enabled";
    goto LABEL_20;
  }
LABEL_21:

}

- (void)start
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Will start transport Rapport", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (id)policyForSyncTransportType:(int64_t)a3
{
  return +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", a3);
}

+ (uint64_t)shouldDeferSyncOperationWithClass:(void *)a3 syncType:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _xpc_activity_s *v15;
  _xpc_activity_s *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  int v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v28;
  char *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  const char *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_self();
  if (shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounterInitialized != -1)
    dispatch_once(&shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounterInitialized, &__block_literal_global_3);
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (!objc_msgSend(v13, "canDeferSyncOperationWithSyncType:", v10))
    goto LABEL_20;
  -[_DKSyncType xpcActivity]((uint64_t)v10);
  v15 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || !xpc_activity_should_defer(v15))
  {

LABEL_20:
    v25 = 0;
    v26 = CFSTR("no");
    goto LABEL_21;
  }
  if (!xpc_activity_set_state(v16, 3))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:].cold.1();

    xpc_activity_set_state(v16, 5);
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v19)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "transportType") == 8)
        v20 = "up to";
      else
        v20 = "down from";
      v21 = objc_msgSend(v12, "me");
      v22 = &stru_1E26E9728;
      v23 = CFSTR("pseudo ");
      if (!v21)
        v23 = &stru_1E26E9728;
      v33 = v23;
      objc_msgSend(v12, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "model");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v20;
      if (v24)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "model");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v32);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v38 = v36;
      v39 = 2112;
      v40 = a2;
      v41 = 2082;
      v42 = v34;
      v43 = 2114;
      v44 = v33;
      v45 = 2114;
      v46 = v35;
      v47 = 2114;
      v48 = v22;
      v49 = 2114;
      v50 = v31;
      _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ operation because activity should be deferred", buf, 0x48u);

      if (v24)
      {

      }
    }
  }
  else if (v19)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v29 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v28;
    v39 = 2112;
    v40 = a2;
    v41 = 2114;
    v42 = v29;
    _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping %{public}@ sync operation because activity should be deferred", buf, 0x20u);

  }
  v26 = CFSTR("yes");
  v25 = 1;
LABEL_21:
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounter, 1, v26);

  return v25;
}

+ (uint64_t)canPerformSyncOperationWithClass:(void *)a3 syncType:(void *)a4 history:(void *)a5 transport:(void *)a6 peer:(void *)a7 policy:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  int v24;
  __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v30;
  const char *v31;
  int v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  os_log_t v40;
  uint64_t v41;
  const char *v42;
  int v43;
  const __CFString *v44;
  uint64_t v45;
  const char *v46;
  int v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  NSObject *v60;
  const char *v61;
  const __CFString *v62;
  const char *v63;
  __CFString *v64;
  void *v65;
  const char *v66;
  void *v67;
  os_log_t log;
  os_log_t loga;
  os_log_t logb;
  void *v71;
  uint64_t v72;
  void *v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  os_log_t v83;
  __int16 v84;
  __CFString *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_opt_self();
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (objc_msgSend(v14, "isAvailable"))
  {
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "transportType");
    v20 = -[NSObject activeTransportsForPeer:](v18, "activeTransportsForPeer:", v15);
    if (!v15 || (v20 & v19) != 0)
    {
      if (v13)
      {
        objc_msgSend(v13, "lastSyncDate");
        v21 = objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v16, "canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:", v12, v21, objc_msgSend(v13, "lastDaySyncCount"), +[_DKSync2Coordinator isOnPower]());
        if ((v27 & 1) == 0)
        {
          v72 = a2;
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v14, "transportType");
            v46 = "down from";
            if (v45 == 8)
              v46 = "up to";
            v54 = v46;
            v47 = objc_msgSend(v15, "me");
            v48 = CFSTR("pseudo ");
            if (!v47)
              v48 = &stru_1E26E9728;
            v53 = v48;
            objc_msgSend(v15, "identifier");
            v60 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "model");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
            {
              v50 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v15, "model");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "stringWithFormat:", CFSTR(" (%@)"), v52);
              v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v64 = &stru_1E26E9728;
            }
            objc_msgSend(v14, "name");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v75 = v67;
            v76 = 2112;
            v77 = v72;
            v78 = 2082;
            v79 = v54;
            v80 = 2114;
            v81 = v53;
            v82 = 2114;
            v83 = v60;
            v84 = 2114;
            v85 = v64;
            v86 = 2114;
            v87 = v51;
            _os_log_debug_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because of policy", buf, 0x48u);

            if (v56)
            {

            }
          }

        }
        goto LABEL_19;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v14, "transportType");
        v42 = "down from";
        if (v41 == 8)
          v42 = "up to";
        v63 = v42;
        v43 = objc_msgSend(v15, "me");
        v25 = &stru_1E26E9728;
        v44 = CFSTR("pseudo ");
        if (!v43)
          v44 = &stru_1E26E9728;
        v59 = v44;
        objc_msgSend(v15, "identifier");
        logb = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "model");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          v49 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "model");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringWithFormat:", CFSTR(" (%@)"), v55);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v75 = v71;
        v76 = 2112;
        v77 = a2;
        v78 = 2082;
        v79 = v63;
        v80 = 2114;
        v81 = v59;
        v82 = 2114;
        v40 = logb;
        v83 = logb;
        v84 = 2114;
        v85 = v25;
        v86 = 2114;
        v87 = v39;
        _os_log_error_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_ERROR, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because history is unavailable", buf, 0x48u);
        goto LABEL_46;
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v14, "transportType");
        v23 = "down from";
        if (v22 == 8)
          v23 = "up to";
        v61 = v23;
        v24 = objc_msgSend(v15, "me");
        v25 = &stru_1E26E9728;
        v26 = CFSTR("pseudo ");
        if (!v24)
          v26 = &stru_1E26E9728;
        v58 = v26;
        objc_msgSend(v15, "identifier");
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "model");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          v38 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "model");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR(" (%@)"), v55);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v75 = v71;
        v76 = 2112;
        v77 = a2;
        v78 = 2082;
        v79 = v61;
        v80 = 2114;
        v81 = v58;
        v82 = 2114;
        v40 = log;
        v83 = log;
        v84 = 2114;
        v85 = v25;
        v86 = 2114;
        v87 = v39;
        _os_log_debug_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because not currently active on transport", buf, 0x48u);
LABEL_46:

        if (v65)
        {

        }
      }
    }
    v27 = 0;
LABEL_19:

    goto LABEL_20;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v14, "transportType");
    v31 = "down from";
    if (v30 == 8)
      v31 = "up to";
    v66 = v31;
    v32 = objc_msgSend(v15, "me");
    v33 = &stru_1E26E9728;
    v34 = CFSTR("pseudo ");
    if (!v32)
      v34 = &stru_1E26E9728;
    v62 = v34;
    objc_msgSend(v15, "identifier");
    loga = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "model");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "model");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), v57);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v75 = v73;
    v76 = 2112;
    v77 = a2;
    v78 = 2082;
    v79 = v66;
    v80 = 2114;
    v81 = v62;
    v82 = 2114;
    v83 = loga;
    v84 = 2114;
    v85 = v33;
    v86 = 2114;
    v87 = v37;
    _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: (%@) Skipping sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ because transport is not available", buf, 0x48u);

    if (v35)
    {

    }
  }
  v27 = 0;
LABEL_20:

  return v27;
}

+ (BOOL)isOnPower
{
  CFTypeRef v0;
  const __CFString *v1;
  CFComparisonResult v2;
  NSObject *v3;
  void *v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  IOPSGetPercentRemaining();
  v0 = IOPSCopyPowerSourcesInfo();
  v1 = IOPSGetProvidingPowerSourceType(v0);
  v2 = CFStringCompare(v1, CFSTR("AC Power"), 1uLL);
  if (v0)
    CFRelease(v0);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v7 = v5;
    v8 = 1024;
    v9 = 0;
    v10 = 1024;
    v11 = v2 == kCFCompareEqualTo;
    v12 = 1024;
    v13 = v11;
    _os_log_debug_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Checking AC power found isCharging = %{BOOL}d and isOnAC = %{BOOL}d so isOnPower = %{BOOL}d", buf, 0x1Eu);

  }
  return v2 == kCFCompareEqualTo;
}

- (void)handleStatusChangeForPeer:(id)a3 previousTransports:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activeTransportsForPeer:", v10);

  if (v8 != a4)
  {
    if (a4 && v8)
    {
LABEL_7:
      if ((v8 & ~a4) == 0)
        goto LABEL_10;
      goto LABEL_8;
    }
    -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)self);
  }
  if (a4 || !v8)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v10, "sourceDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    -[_DKSync2Coordinator fetchSourceDeviceIDFromPeer:]((uint64_t)self, v10);
LABEL_10:

}

- (void)fetchSourceDeviceIDFromPeer:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    -[_DKSync2Coordinator createBusyTransactionWithName:](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 248);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51___DKSync2Coordinator_fetchSourceDeviceIDFromPeer___block_invoke;
    v8[3] = &unk_1E26E2F70;
    v8[4] = a1;
    v9 = v3;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v6, "fetchSourceDeviceIDFromPeer:highPriority:completion:", v9, 1, v8);

  }
}

- (void)possiblyUpdateIsBusyProperty
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Setting sync coordinator state to idle", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (id)createBusyTransactionWithName:(uint64_t)a1
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = (void *)os_transaction_create();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    -[_DKSync2Coordinator possiblyUpdateIsBusyProperty](a1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)handleFetchedSourceDeviceID:(void *)a3 version:(void *)a4 fromPeer:(void *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v13);

    if (v12)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &stru_1E26E9728;
        if (objc_msgSend(v11, "me"))
          v16 = CFSTR("pseudo ");
        else
          v16 = &stru_1E26E9728;
        objc_msgSend(v11, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "model");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "model");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR(" (%@)"), v29);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v33 = v30;
        v34 = 2114;
        v35 = v16;
        v36 = 2114;
        v37 = v17;
        v38 = 2114;
        v39 = v15;
        v40 = 2114;
        v41 = v22;
        v42 = 2048;
        v43 = objc_msgSend(v12, "code");
        v44 = 2112;
        v45 = v12;
        _os_log_error_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed while requesting source device id from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v18)
        {

        }
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      v14 = v19;
      if (v9)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = &stru_1E26E9728;
          if (objc_msgSend(v11, "me"))
            v24 = CFSTR("pseudo ");
          else
            v24 = &stru_1E26E9728;
          objc_msgSend(v11, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "model");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v11, "model");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR(" (%@)"), v29);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v33 = v31;
          v34 = 2114;
          v35 = v24;
          v36 = 2114;
          v37 = v25;
          v38 = 2114;
          v39 = v23;
          v40 = 2114;
          v41 = v28;
          _os_log_debug_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Received source device id %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x34u);

          if (v26)
          {

          }
        }

        objc_msgSend(v9, "UUIDString");
        v14 = objc_claimAutoreleasedReturnValue();
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSourceDeviceID:version:peer:", v14, v10, v11);

      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[_DKSync2Coordinator handleFetchedSourceDeviceID:version:fromPeer:error:].cold.1(a1, v11, v14);
      }
    }

  }
}

- (uint64_t)removeBusyTransaction:(uint64_t)result
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  _QWORD v5[5];

  if (result)
  {
    v2 = result;
    v3 = a2;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(*(id *)(v2 + 32), "removeObject:", v3);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45___DKSync2Coordinator_removeBusyTransaction___block_invoke;
    v5[3] = &unk_1E26E2F20;
    v5[4] = v2;
    return +[_DKSyncSerializer performAfter:block:](_DKSyncSerializer, "performAfter:block:", v5, 0.0001);
  }
  return result;
}

- (void)syncWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", *MEMORY[0x1E0CB2AC0]))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37___DKSync2Coordinator_syncWithReply___block_invoke;
    v8[3] = &unk_1E26E2FC0;
    v8[4] = self;
    v9 = v4;
    +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v8);

  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "%{public}@: Not syncing because storage is not yet available", buf, 0xCu);

    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

    }
  }

}

- (void)_performSyncWithForceSync:(void *)a3 completion:
{
  id v5;
  NSObject *v6;
  _DKSyncType *v7;
  char v8;
  _BYTE *v9;

  if (a1)
  {
    v5 = a3;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = [_DKSyncType alloc];
    v8 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)a1);
    v9 = -[_DKSyncType initWithIsSingleDevice:](v7, v8);
    -[_DKSyncType setForceSync:]((uint64_t)v9, a2);
    -[_DKSync2Coordinator _performSyncWithSyncType:completion:](a1, v9, v5);

  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (-[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", *MEMORY[0x1E0CB2AC0]))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke;
    v13[3] = &unk_1E26E3010;
    v13[4] = self;
    v16 = a3;
    v14 = v8;
    v15 = v9;
    +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v13);

  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "%{public}@: Not urgently syncing because storage is not yet available", buf, 0xCu);

    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);

    }
  }

}

- (void)_synchronizeWithUrgency:(void *)a3 client:(void *)a4 completion:
{
  id v7;
  id v8;
  NSObject *v9;
  id *v10;
  _DKSyncType *v11;
  char v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    +[_DKSyncUrgencyTracker sharedInstance]();
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    v11 = [_DKSyncType alloc];
    v12 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)a1);
    v13 = -[_DKSyncType initWithIsSingleDevice:](v11, v12);
    -[_DKSyncType setForceSync:]((uint64_t)v13, 1);
    if (objc_msgSend(a1[31], "isAvailable"))
      v14 = objc_msgSend(a1[31], "transportType");
    else
      v14 = 0;
    if (objc_msgSend(a1[29], "isAvailable"))
      v15 = objc_msgSend(a1[29], "transportType");
    else
      v15 = 0;
    v16 = v15 | v14;
    if (objc_msgSend(a1[30], "isAvailable"))
      v17 = objc_msgSend(a1[30], "transportType");
    else
      v17 = 0;
    +[_DKSync2Policy disabledFeaturesForSyncType:transports:](_DKSync2Policy, "disabledFeaturesForSyncType:transports:", v13, v16 | v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("UsageTracking"))
      && objc_msgSend(v18, "containsObject:", CFSTR("DigitalHealth")))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Coordinator _synchronizeWithUrgency:client:completion:].cold.1();

    }
    else
    {
      -[_DKSyncUrgencyTracker updateUrgency:forClient:](v10, a2, v7);
      if (a2 >= 7)
      {
        v20 = -[_DKEventData version]((uint64_t)v10);
        -[_DKSyncType setUrgency:]((uint64_t)v13, v20);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __65___DKSync2Coordinator__synchronizeWithUrgency_client_completion___block_invoke;
        v21[3] = &unk_1E26E2F98;
        v21[4] = a1;
        v22 = v8;
        -[_DKSync2Coordinator _performSyncWithSyncType:completion:](a1, v13, v21);

LABEL_20:
        goto LABEL_21;
      }
    }
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    goto LABEL_20;
  }
LABEL_21:

}

- (void)deleteRemoteStateWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (!-[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", *MEMORY[0x1E0CB2AC0]))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "%{public}@: Not deleting remote state because storage is not yet available", (uint8_t *)&v8, 0xCu);

    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v7);

    }
  }

}

- (BOOL)isSingleDevice
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "foreignPeersCount") == 0;

  return v2;
}

- (void)_performSyncWithSyncType:(void *)a3 completion:
{
  id v3;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t *v9;
  uint64_t *v10;
  const char *v11;
  _BOOL4 v12;
  const char *v13;
  _QWORD *v14;
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  const char *v20;
  id v21;
  void *v22;
  const char *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  SEL v33;
  id v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  id v39;
  id v40;
  const char *v41;
  id v42;
  id v43;
  void *v44;
  id Property;
  _QWORD v46[5];
  uint64_t *v47;
  id v48;
  id location;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    v9 = (uint64_t *)a1[12];
    if (!v9)
    {
      v14 = -[_DKSync2State initWithType:completion:]([_DKSync2State alloc], v6, v7);
      v15 = a1[12];
      a1[12] = v14;

      v10 = (uint64_t *)a1[12];
      goto LABEL_42;
    }
    v10 = v9;
    v12 = -[_DKSyncType forceSync]((_BOOL8)v6);
    if (v12)
    {
      v3 = objc_getProperty(v10, v11, 16, 1);
      if (!-[_DKSyncType forceSync]((_BOOL8)v3))
      {

        goto LABEL_19;
      }
      if (!-[_DKSyncType isPeriodicSync]((_BOOL8)v6))
      {

LABEL_12:
        if ((v10[1] & 1) == 0)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.1();
LABEL_23:

          -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
LABEL_59:
          Property = objc_getProperty(v10, v23, 16, 1);
          if (-[_DKSyncType isTriggeredSync]((_BOOL8)Property))
            -[_DKSync2Coordinator _updateTriggeredSyncActivity]((uint64_t)a1);
          goto LABEL_61;
        }
        v19 = objc_getProperty(v10, v13, 16, 1);
        if (-[_DKSyncType isTriggeredSync]((_BOOL8)v19))
        {
          v21 = objc_getProperty(v10, v20, 16, 1);
          -[_DKSyncType xpcActivity]((uint64_t)v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {

          }
          else
          {
            -[_DKSyncType xpcActivity]((uint64_t)v6);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.3();

            }
          }
          -[_DKSyncType mergeType:](v10[2], v6);
          v34 = objc_getProperty(v10, v33, 16, 1);
          -[_DKSyncType xpcActivity]((uint64_t)v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v35 != 0;
        }
        else
        {
          v27 = 0;
        }
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.2();

        -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
        if (!v27)
          goto LABEL_59;
        goto LABEL_42;
      }
    }
    else if (!-[_DKSyncType isPeriodicSync]((_BOOL8)v6))
    {
      goto LABEL_12;
    }
    v16 = objc_getProperty(v10, v13, 16, 1);
    v17 = -[_DKSyncType isPeriodicSync]((_BOOL8)v16);
    if (v12)

    if (v17)
      goto LABEL_12;
LABEL_19:
    if ((v10[1] & 1) == 0)
    {
      if (!objc_getProperty(v10, v13, 24, 1))
      {
        v28 = -[_DKSyncType forceSync]((_BOOL8)v6);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30)
            -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.4();
        }
        else if (v30)
        {
          -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.5();
        }

        -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
        -[_DKSyncType mergeType:](v10[2], v6);
        goto LABEL_59;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.6();
      goto LABEL_23;
    }
    v24 = -[_DKSyncType forceSync]((_BOOL8)v6);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24)
    {
      if (v26)
        -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.7();
    }
    else if (v26)
    {
      -[_DKSync2Coordinator _performSyncWithSyncType:completion:].cold.8();
    }

    -[_DKSync2State addCompletionBlock:]((uint64_t)v10, (uint64_t)v7);
    -[_DKSyncType mergeType:](v10[2], v6);
    *((_BYTE *)v10 + 8) = 0;
    -[_DKSync2Coordinator _unregisterTriggeredSyncActivity]((uint64_t)a1);
LABEL_42:
    objc_initWeak(&location, a1);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke;
    v46[3] = &unk_1E26E3038;
    v46[4] = a1;
    v10 = v10;
    v47 = v10;
    objc_copyWeak(&v48, &location);
    v38 = (void *)MEMORY[0x193FEEAF4](v46);
    if (v10)
      v39 = objc_getProperty(v10, v37, 16, 1);
    else
      v39 = 0;
    v40 = v39;
    if (-[_DKSyncType isTriggeredSync]((_BOOL8)v40))
    {
      if (v10)
        v42 = objc_getProperty(v10, v41, 16, 1);
      else
        v42 = 0;
      v43 = v42;
      -[_DKSyncType xpcActivity]((uint64_t)v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        if (v10)
          *((_BYTE *)v10 + 8) = 1;
        -[_DKSync2Coordinator _registerTriggeredSyncActivityWithIsStartup:](a1, 0);
LABEL_55:

        objc_destroyWeak(&v48);
        objc_destroyWeak(&location);
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {

    }
    if (v10)
      *((_BYTE *)v10 + 8) = 0;
    -[_DKSync2Coordinator __performSyncWithCompletion:](a1, v38);
    goto LABEL_55;
  }
LABEL_62:

}

- (void)_unregisterTriggeredSyncActivity
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (*(_BYTE *)(a1 + 184))
    {
      xpc_activity_unregister("com.apple.coreduet.sync.triggered");
      *(_BYTE *)(a1 + 184) = 0;
      v3 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = 0;

    }
  }
}

- (void)__performSyncWithCompletion:(id *)a1
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  id Property;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  int v27;
  int v28;
  _BOOL4 v29;
  _BOOL4 v30;
  int v31;
  _BOOL4 v32;
  int v33;
  uint64_t v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  void *v45;
  id *v46;
  void *v47;
  void *v48;
  const char *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id newValue;
  id v69;
  id v70;
  void *v71;
  id *val;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id location;
  _QWORD v86[5];
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v69 = a2;
  val = a1;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    if ((objc_msgSend(val[8], "isDataAvailableFor:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(val, "deviceUUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUIDString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v5;
        v90 = 2114;
        v91 = v7;
        _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "%{public}@: Starting sync on %{public}@", buf, 0x16u);

      }
      -[_DKSync2Coordinator createBusyTransactionWithName:]((uint64_t)val);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      Property = val[12];
      if (Property)
        Property = objc_getProperty(Property, v8, 16, 1);
      v70 = Property;
      +[_DKSync2Coordinator _updateEventStatsWithSyncType:]((uint64_t)_DKSync2Coordinator, v70);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v11;
        v90 = 2114;
        v91 = v70;
        _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "%{public}@: Sync type: %{public}@", buf, 0x16u);

      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKSyncedFeatures sharedInstance]();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v13;
        v90 = 2114;
        v91 = v14;
        _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "%{public}@: Sync features: %{public}@", buf, 0x16u);

      }
      v15 = val[30];
      if (v15)
        v16 = objc_msgSend(v15, "isAvailable");
      else
        v16 = 0;
      v19 = val[29];
      if (v19)
        v20 = objc_msgSend(v19, "isAvailable");
      else
        v20 = 0;
      v21 = val[31];
      if (v21)
        v22 = objc_msgSend(v21, "isAvailable");
      else
        v22 = 0;
      if (!-[_DKSyncType forceSync]((_BOOL8)v70))
      {
        if (-[_DKSyncType isTriggeredSync]((_BOOL8)v70))
        {
          if (!objc_msgSend(val[5], "count"))
            objc_msgSend(val[6], "count");
          objc_msgSend(val, "policyForSyncTransportType:", 8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(val[27], "numberForKey:", CFSTR("DeletedSyncedEventCount"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
            v26 = objc_msgSend(v24, "unsignedIntegerValue");
          else
            v26 = 0;
          if (v26 >= objc_msgSend(v23, "numChangesTriggeringSync"))
            v27 = v16;
          else
            v27 = 0;

          v28 = v22;
        }
        else
        {
          v27 = 0;
          v28 = 0;
        }
        v29 = -[_DKSyncType isPeriodicSync]((_BOOL8)v70);
        if (v29)
          v27 = v16;
        v30 = -[_DKSyncType isInitialSync]((_BOOL8)v70);
        if (-[_DKSyncType didActivatePeer]((_BOOL8)v70) || v30 || v29)
          v31 = v22;
        else
          v31 = v28;
        v32 = -[_DKSyncType didReceivePush]((_BOOL8)v70);
        if (!objc_msgSend(val[7], "count"))
        {
          v20 &= v32 || v30 || v29;
          v22 = v31;
        }
        if (*((_BYTE *)val + 201))
          v33 = 0;
        else
          v33 = v16;
        if (v33 == 1 && -[_DKSyncType isPeriodicSync]((_BOOL8)v70))
          v16 = !-[_DKSyncToggle isEnabled]((_BOOL8)v70) | v27;
        else
          v16 = v27;
      }
      v71 = (void *)objc_opt_new();
      v34 = MEMORY[0x1E0C809B0];
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke;
      v86[3] = &unk_1E26E2F20;
      v86[4] = val;
      +[_DKSyncBlockCompositeOperation blockCompositeOperationWithBlock:]((uint64_t)_DKSyncBlockCompositeOperation, v86);
      newValue = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(val, "policyForSyncTransportType:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[_DKPerformSyncDownOperation initWithParent:localStorage:transport:peers:policy:type:]([_DKPerformSyncDownOperation alloc], (uint64_t)newValue, val[28], val[31], 0, v35, v70);
        if (objc_msgSend(v71, "count"))
        {
          objc_msgSend(v71, "lastObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addDependency:", v37);

        }
        objc_msgSend(v71, "addObject:", v36);

      }
      if (v20)
      {
        objc_msgSend(val, "policyForSyncTransportType:", 4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[_DKPerformSyncDownOperation initWithParent:localStorage:transport:peers:policy:type:]([_DKPerformSyncDownOperation alloc], (uint64_t)newValue, val[28], val[29], 0, v38, v70);
        if (objc_msgSend(v71, "count"))
        {
          objc_msgSend(v71, "lastObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addDependency:", v40);

        }
        objc_msgSend(v71, "addObject:", v39);

      }
      if (v16)
      {
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "pseudoPeerForSyncTransportCloudUp");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(val, "policyForSyncTransportType:", 8);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[_DKPerformSyncDownPeerDeletionsOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncDownPeerDeletionsOperation alloc], (uint64_t)newValue, val[28], val[30], v42, v43, v70);
        if (objc_msgSend(v71, "count"))
        {
          objc_msgSend(v71, "lastObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addDependency:", v45);

        }
        objc_msgSend(v71, "addObject:", v44);
        v46 = -[_DKPerformSyncUpHistoryOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncUpHistoryOperation alloc], (uint64_t)newValue, val[28], val[30], v42, v43, v70);
        if (objc_msgSend(v71, "count"))
        {
          objc_msgSend(v71, "lastObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addDependency:", v47);

        }
        objc_msgSend(v71, "addObject:", v46);
        objc_initWeak((id *)buf, val);
        objc_initWeak(&location, v46);
        v82[0] = v34;
        v82[1] = 3221225472;
        v82[2] = __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_439;
        v82[3] = &unk_1E26E3060;
        objc_copyWeak(&v83, &location);
        objc_copyWeak(&v84, (id *)buf);
        +[_DKSyncBlockOperation blockOperationWithBlock:](_DKSyncBlockOperation, "blockOperationWithBlock:", v82);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addDependency:", v46);
        objc_msgSend(v71, "addObject:", v48);

        objc_destroyWeak(&v84);
        objc_destroyWeak(&v83);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);

      }
      if (objc_msgSend(v71, "count"))
      {
        v50 = val[12];
        if (v50)
          objc_setProperty_atomic(v50, v49, newValue, 24);
        objc_initWeak(&location, val);
        v77[0] = v34;
        v77[1] = 3221225472;
        v77[2] = __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_2;
        v77[3] = &unk_1E26E3088;
        v63 = &v81;
        objc_copyWeak(&v81, &location);
        v78 = v65;
        v79 = v66;
        v80 = v69;
        +[_DKSyncBlockOperation blockOperationWithBlock:](_DKSyncBlockOperation, "blockOperationWithBlock:", v77);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addDependency:", newValue);
        objc_msgSend(v71, "addObject:", v64);
        objc_msgSend(v71, "insertObject:atIndex:", newValue, 0);
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v51 = v71;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
        if (v52)
        {
          v53 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v74 != v53)
                objc_enumerationMutation(v51);
              v55 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              +[_CDLogging syncChannel](_CDLogging, "syncChannel", v63);
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "debugDescription");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v89 = v57;
                v90 = 2114;
                v91 = v58;
                _os_log_debug_impl(&dword_18DDBE000, v56, OS_LOG_TYPE_DEBUG, "%{public}@: Queuing operation %{public}@", buf, 0x16u);

              }
            }
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
          }
          while (v52);
        }

        +[_DKSyncSerializer addOperations:waitUntilFinished:](_DKSyncSerializer, "addOperations:waitUntilFinished:", v51, 0);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSync2Coordinator __performSyncWithCompletion:].cold.2(v60, (uint64_t)buf, v59);
        }

        objc_destroyWeak(v63);
        objc_destroyWeak(&location);
      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          -[_DKSync2Coordinator __performSyncWithCompletion:].cold.1();

        objc_msgSend(newValue, "cancel");
        -[_DKSync2Coordinator __finishSyncWithTransaction:startDate:completion:]((uint64_t)val, v65, v66, v69);
      }
      +[_DKSyncUrgencyTracker sharedInstance]();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKSyncUrgencyTracker ageUrgencies]((uint64_t)v62);

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v89 = v18;
        _os_log_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_INFO, "%{public}@: Not starting sync because storage is not yet available", buf, 0xCu);

      }
      if (v69)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v69 + 2))(v69, v67);

      }
    }
  }

}

- (void)_updateTriggeredSyncActivity
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: No triggered sync type to update activity with", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)_updateEventStatsWithSyncType:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  _BOOL4 v4;
  __CFString *v5;

  v2 = a2;
  objc_opt_self();
  if (_updateEventStatsWithSyncType__isSingleDeviceSyncCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithSyncType__isSingleDeviceSyncCounterInitialized, &__block_literal_global_440);
  v3 = _updateEventStatsWithSyncType__isSingleDeviceSyncCounter;
  v4 = -[_DKSyncToggle isEnabled]((_BOOL8)v2);

  if (v4)
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](v3, 1, v5);
}

- (void)__finishSyncWithTransaction:(void *)a3 startDate:(void *)a4 completion:
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  NSObject *v10;
  const char *v11;
  id Property;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = a3;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    Property = *(id *)(a1 + 96);
    if (Property)
      Property = objc_getProperty(Property, v11, 24, 1);
    objc_msgSend(Property, "errors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 96);
    if (v15)
      objc_setProperty_atomic(v15, v13, 0, 24);
    if (v8)
    {
      objc_msgSend(v14, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v16);

    }
    -[_DKSync2Coordinator removeBusyTransaction:](a1, v7);
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "debugLogPeers");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSync2Coordinator _updateEventStatsWithSyncElapsedTimeStartDate:endDate:]((uint64_t)_DKSync2Coordinator, v9, v18);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_INFO, "%{public}@: Done syncing", (uint8_t *)&v21, 0xCu);

    }
  }

}

+ (void)_updateEventStatsWithSyncElapsedTimeStartDate:(void *)a3 endDate:
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  if (_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounterInitialized, &__block_literal_global_451);
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounter, (uint64_t)v5, v4);

}

- (void)_performInitialSync
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Running scheduled initial sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_finishActivityWithError:(uint64_t)a1
{
  id v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  NSObject *v7;
  NSObject *v8;
  xpc_activity_state_t v9;
  NSObject *v10;
  NSObject *v11;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 176), "activity");
    v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (v3 && +[_DKCKError isShouldDeferError:]((uint64_t)_DKCKError, v3))
      {
        state = xpc_activity_get_state(v4);
        if (state != 3 && state != 5)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Coordinator _finishActivityWithError:].cold.6(a1, v3);

          if (!xpc_activity_set_state(v4, 3))
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              -[_DKSync2Coordinator _finishActivityWithError:].cold.5();

            xpc_activity_set_state(v4, 5);
          }
        }
      }
      v9 = xpc_activity_get_state(v4);
      if (v9 == 5)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[_DKSync2Coordinator _finishActivityWithError:].cold.4();
      }
      else
      {
        if (v9 != 3)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[_DKSync2Coordinator _finishActivityWithError:].cold.2();

          xpc_activity_set_state(v4, 5);
          goto LABEL_27;
        }
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[_DKSync2Coordinator _finishActivityWithError:].cold.3();
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[_DKSync2Coordinator _finishActivityWithError:].cold.1();
    }

LABEL_27:
  }

}

- (void)_performPeriodicJob
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Running periodic sync job", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (double)_intervalForJobGivenIsSingleDevice:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v16;
  BOOL v19;
  double v20;
  double v21;

  if (!a1)
    return 0.0;
  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncUrgencyTracker sharedInstance]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DKEventData version]((uint64_t)v7);
  v9 = -1.0;
  v10 = -1.0;
  if (objc_msgSend(a1[31], "isAvailable"))
  {
    objc_msgSend(v4, "hoursBetweenSyncsWhenIsSingleDevice:urgency:", a2, v8);
    v10 = v11;
  }
  if (objc_msgSend(a1[29], "isAvailable"))
  {
    objc_msgSend(v5, "hoursBetweenSyncsWhenIsSingleDevice:urgency:", a2, v8);
    v9 = v12;
  }
  v13 = objc_msgSend(a1[30], "isAvailable");
  v14 = -1.0;
  if (v13)
    objc_msgSend(v6, "hoursBetweenSyncsWhenIsSingleDevice:urgency:", a2, v8, -1.0);
  if (v10 >= 1.79769313e308 || v10 <= 0.0)
    v16 = 1.79769313e308;
  else
    v16 = v10;
  if (v9 < v16 && v9 > 0.0)
    v16 = v9;
  if (v14 >= v16 || v14 <= 0.0)
    v14 = v16;
  v19 = v14 >= 1.79769313e308 || v14 <= 0.0;
  v20 = v14 * 60.0 * 60.0;
  if (v19)
    v21 = 0.0;
  else
    v21 = v20;

  return v21;
}

- (id)_executionCriteriaWithInterval:(uint64_t)a1
{
  char *v2;
  char *v3;
  char *v4;
  xpc_object_t v5;
  void *v6;
  uint64_t i;
  xpc_object_t values[6];
  char *keys[7];

  keys[6] = *(char **)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (char *)*MEMORY[0x1E0C80898];
  keys[0] = *(char **)MEMORY[0x1E0C807A8];
  keys[1] = v2;
  v3 = (char *)*MEMORY[0x1E0C80868];
  keys[2] = *(char **)MEMORY[0x1E0C80878];
  keys[3] = v3;
  v4 = (char *)*MEMORY[0x1E0C808B8];
  keys[4] = *(char **)MEMORY[0x1E0C808D0];
  keys[5] = v4;
  values[0] = xpc_int64_create((uint64_t)a2);
  values[1] = xpc_BOOL_create(1);
  values[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80880]);
  values[3] = xpc_BOOL_create(1);
  values[4] = xpc_BOOL_create(1);
  values[5] = xpc_BOOL_create(1);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
  +[_DKSyncUrgencyTracker sharedInstance]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[_DKEventData version]((uint64_t)v6) <= 6)
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808D8], 1);

  for (i = 5; i != -1; --i)
  return v5;
}

- (void)_registerPeriodicJobWithInterval:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_DKSync2Coordinator _registerPeriodicJobWithInterval:].cold.1(a2);

    objc_initWeak(&location, (id)a1);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __56___DKSync2Coordinator__registerPeriodicJobWithInterval___block_invoke;
    v15 = &unk_1E26E2C60;
    objc_copyWeak(&v16, &location);
    v6 = (void *)MEMORY[0x193FEEAF4](&v12);
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue", v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDPeriodicSchedulerJob jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:](_CDPeriodicSchedulerJob, "jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:", CFSTR("com.apple.knowledgestore.sync"), v7, 1, v6, a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 176);
    *(_QWORD *)(a1 + 176) = v8;

    -[_DKSync2Coordinator _executionCriteriaWithInterval:](a1, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 176), "setExecutionCriteria:", v10);
    +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerJob:", *(_QWORD *)(a1 + 176));

    *(double *)(a1 + 104) = a2;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)_cloudSyncAvailabilityDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___DKSync2Coordinator__cloudSyncAvailabilityDidChange___block_invoke;
  v3[3] = &unk_1E26E2F20;
  v3[4] = self;
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v3);
}

- (void)_syncPolicyDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44___DKSync2Coordinator__syncPolicyDidChange___block_invoke;
  v3[3] = &unk_1E26E2F20;
  v3[4] = self;
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v3);
}

- (void)_deleteForeignSiriEvents
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Deleted %@ foreign Siri events", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_deleteSiriCloudEvents
{
  id v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 216), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NeedsSiriCloudDelete"));
    if (objc_msgSend(*(id *)(a1 + 240), "isAvailable"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:](a1, v2);

    }
  }
}

- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:(uint64_t)a1
{
  id v3;
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
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  void *v41;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x193FEE914]();
    +[_CDPortraitStreams entityStream](_CDPortraitStreams, "entityStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v6;
    +[_CDPortraitStreams topicStream](_CDPortraitStreams, "topicStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 224);
    v39 = 0;
    objc_msgSend(v13, "sortedEventsFromSyncWindows:streamNames:limit:fetchOrder:error:", v12, v9, 1000, 1, &v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v39;
    if (v15)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:].cold.2();

    }
    else if (objc_msgSend(v14, "count"))
    {
      v29 = v9;
      v30 = v4;
      v31 = v3;
      objc_msgSend(*(id *)(a1 + 208), "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_opt_new();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v14;
      v20 = v14;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "UUID", v28);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKSyncDeletedEventIDs addDeletedEventID:forSourceDeviceID:]((uint64_t)v19, v25, v18);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v22);
      }

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:].cold.1();

      v27 = *(void **)(a1 + 240);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke;
      v32[3] = &unk_1E26E3190;
      v33 = v20;
      v34 = a1;
      objc_msgSend(v27, "updateStorageWithAddedEvents:deletedEventIDs:highPriority:completion:", 0, v19, 1, v32);

      v4 = v30;
      v3 = v31;
      v14 = v28;
      v9 = v29;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 216), "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("NeedsSiriCloudDelete"));
    }

    objc_autoreleasePoolPop(v4);
  }

}

+ (id)streamNamesToTombstone
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamNamesToSyncWithDisabledFeatures:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamNamesToSyncWithDisabledFeatures:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streamNamesToSyncWithDisabledFeatures:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  return v2;
}

+ (NSObject)_syncTypeFromActivity:(uint64_t)a1
{
  _xpc_activity_s *v2;
  xpc_object_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const void *bytes_ptr;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;

  v2 = a2;
  objc_opt_self();
  v3 = xpc_activity_copy_criteria(v2);

  if (v3 && MEMORY[0x193FEEFF8](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "_DKSyncType");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5 && MEMORY[0x193FEEFF8](v5) == MEMORY[0x1E0C812E8])
    {
      v8 = (void *)MEMORY[0x1E0C99D50];
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      objc_msgSend(v8, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v6));
      v7 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v7, "length"))
      {
        v15 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v15);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v15;
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            +[_DKSync2Coordinator _syncTypeFromActivity:].cold.4();

          v4 = 0;
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            +[_DKSync2Coordinator _syncTypeFromActivity:].cold.3();

          v4 = v10;
        }

      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[_DKSync2Coordinator _syncTypeFromActivity:].cold.2();
        v4 = 0;
      }

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[_DKSync2Coordinator _syncTypeFromActivity:].cold.1();
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_updatedExecutionCriteriaFromType:(uint64_t)a1
{
  id v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  xpc_object_t v10;
  void *v11;
  int64_t int64;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  uint64_t i;
  NSObject *v20;
  id v21;
  xpc_object_t values[4];
  char *keys[5];

  keys[4] = *(char **)MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = *(void **)(a1 + 192);
    if (v6)
    {
      +[_DKSync2Coordinator _syncTypeFromActivity:]((uint64_t)_DKSync2Coordinator, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (-[_DKSyncType isEqualToSyncType:]((uint64_t)v4, v7))
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:].cold.3();
        v5 = 0;
        goto LABEL_27;
      }
      v10 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 192));
      v11 = v10;
      if (v10 && MEMORY[0x193FEEFF8](v10) == MEMORY[0x1E0C812F8])
      {
        int64 = xpc_dictionary_get_int64(v11, (const char *)*MEMORY[0x1E0C80760]);
        if (int64 >= 0)
          v13 = int64;
        else
          v13 = int64 + 1;
        v9 = v13 >> 1;
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:].cold.4();

      }
      else
      {
        v9 = 10;
      }

    }
    else
    {
      v9 = 10;
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v21);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v7)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:].cold.2();
    }
    else
    {
      v16 = objc_retainAutorelease(v8);
      v15 = xpc_data_create((const void *)-[NSObject bytes](v16, "bytes"), -[NSObject length](v16, "length"));
      if (v15)
      {
        v17 = (char *)*MEMORY[0x1E0C80790];
        keys[0] = *(char **)MEMORY[0x1E0C80760];
        keys[1] = v17;
        keys[2] = *(char **)MEMORY[0x1E0C80878];
        keys[3] = "_DKSyncType";
        values[0] = xpc_int64_create(v9);
        values[1] = xpc_int64_create(v9);
        values[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80888]);
        v15 = v15;
        values[3] = v15;
        v5 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
        for (i = 3; i != -1; --i)

        goto LABEL_26;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_DKSync2Coordinator _updatedExecutionCriteriaFromType:].cold.1();

    }
    v5 = 0;
LABEL_26:

LABEL_27:
  }

  return v5;
}

- (void)_checkInTriggeredSyncActivity:(int)a3 isStartup:
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v6 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_DKSync2Coordinator _checkInTriggeredSyncActivity:isStartup:].cold.2();

    objc_storeStrong((id *)(a1 + 192), a2);
    +[_DKSync2Coordinator _syncTypeFromActivity:]((uint64_t)_DKSync2Coordinator, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_DKSync2Coordinator _checkInTriggeredSyncActivity:isStartup:].cold.1();

    }
    else if (a3)
    {
      -[_DKSync2Coordinator _unregisterTriggeredSyncActivity](a1);
    }
    else
    {
      -[_DKSync2Coordinator _updateTriggeredSyncActivity](a1);
    }

  }
}

- (void)_runTriggeredSyncActivity:(void *)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_DKSync2Coordinator _runTriggeredSyncActivity:].cold.1();

    +[_DKSync2Coordinator _syncTypeFromActivity:]((uint64_t)_DKSync2Coordinator, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKSyncType setXpcActivity:]((uint64_t)v6, v3);
    objc_initWeak(&location, a1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke;
    v7[3] = &unk_1E26E31B8;
    objc_copyWeak(&v8, &location);
    v7[4] = a1;
    -[_DKSync2Coordinator _performSyncWithSyncType:completion:](a1, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportRapport, 0);
  objc_storeStrong((id *)&self->_transportCloudUp, 0);
  objc_storeStrong((id *)&self->_transportCloudDown, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_triggeredSyncActivity, 0);
  objc_storeStrong((id *)&self->_periodicJob, 0);
  objc_storeStrong((id *)&self->_rapportIsAvailableToggler, 0);
  objc_storeStrong((id *)&self->_cloudIsAvailableToggler, 0);
  objc_storeStrong((id *)&self->_someTransportIsAvailableToggler, 0);
  objc_storeStrong((id *)&self->_syncEnabledToggler, 0);
  objc_storeStrong((id *)&self->_streamNamesObservedForDeletions, 0);
  objc_storeStrong((id *)&self->_streamNamesObservedForAdditions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_syncState, 0);
  objc_storeStrong((id *)&self->_syncActivityName, 0);
  objc_storeStrong((id *)&self->_triggeredSyncDelayActivityName, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_activatedPeers, 0);
  objc_storeStrong((id *)&self->_deletedSyncedEvents, 0);
  objc_storeStrong((id *)&self->_insertedSyncedEvents, 0);
  objc_storeStrong((id *)&self->_busyTransactions, 0);
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_activityThrottler, 0);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceivePublicToken:].cold.1();

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  NSObject *v6;
  _DKSyncType *v7;
  char v8;
  _BYTE *v9;
  _QWORD v10[5];

  v5 = a4;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceiveIncomingMessage:].cold.1();

  v7 = [_DKSyncType alloc];
  v8 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)self);
  v9 = -[_DKSyncType initWithIsSingleDevice:](v7, v8);
  -[_DKSyncType setIsTriggeredSync:]((uint64_t)v9, 1);
  -[_DKSyncType setDidReceivePush:]((uint64_t)v9, 1);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke;
  v10[3] = &unk_1E26E3118;
  v10[4] = self;
  -[_DKSync2Coordinator _performSyncWithSyncType:completion:]((id *)&self->super.super.isa, v9, v10);

}

- (void)knowledgeStorage:(id)a3 didHaveInsertsAndDeletesWithCount:(unint64_t)a4
{
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", &__block_literal_global_648, a4);
}

- (void)_databaseDidDeleteFromStreamNameCounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _DKKeyValueStore *keyValueStore;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  _DKSyncType *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DKKeyValueStore numberForKey:](self->_keyValueStore, "numberForKey:", CFSTR("DeletedSyncedEventCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_streamNamesObservedForDeletions;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v7 += objc_msgSend(v4, "countForObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v10);
  }

  if (v7)
  {
    keyValueStore = self->_keyValueStore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKKeyValueStore setNumber:forKey:](keyValueStore, "setNumber:forKey:", v14, CFSTR("DeletedSyncedEventCount"));

    LODWORD(v14) = -[_DKSync2Coordinator isSingleDevice]((uint64_t)self);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)v14)
    {
      if (v16)
        -[_DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate) _databaseDidDeleteFromStreamNameCounts:].cold.2();
    }
    else
    {
      if (v16)
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v19;
        v30 = 2112;
        v31 = v20;
        v32 = 2112;
        v33 = v21;
        _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Delete from %@ event streams is triggering sync attempt due to event count of %@", buf, 0x20u);

      }
      v17 = [_DKSyncType alloc];
      v18 = -[_DKSync2Coordinator isSingleDevice]((uint64_t)self);
      v15 = -[_DKSyncType initWithIsSingleDevice:](v17, v18);
      -[_DKSyncType setIsTriggeredSync:]((uint64_t)v15, 1);
      -[_DKSyncType setDidDeleteSyncedEvents:]((uint64_t)v15, 1);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke;
      v22[3] = &unk_1E26E3190;
      v22[4] = self;
      v23 = v4;
      -[_DKSync2Coordinator _performSyncWithSyncType:completion:]((id *)&self->super.super.isa, v15, v22);

    }
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate) _databaseDidDeleteFromStreamNameCounts:].cold.1((uint64_t)self, v4, v15);
  }

}

- (void)knowledgeStorage:(id)a3 didDeleteEventsWithStreamNameCounts:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate) knowledgeStorage:didDeleteEventsWithStreamNameCounts:].cold.1();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate__knowledgeStorage_didDeleteEventsWithStreamNameCounts___block_invoke;
  v8[3] = &unk_1E26E3250;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v8);

}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 fetchOrder:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a4;
  v13 = a3;
  +[_DKCompatibility currentCompatibility](_DKCompatibility, "currentCompatibility");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSync2Coordinator sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:](self, "sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:", v13, v12, v14, a5, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 compatibility:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;

  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  -[_DKSyncLocalKnowledgeStorage sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:](self->_localStorage, "sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:", v16, v15, v14, a6, a7, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)deletedEventIDsSinceDate:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 endDate:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[_DKSyncLocalKnowledgeStorage tombstonesSinceDate:streamNames:limit:endDate:error:](self->_localStorage, "tombstonesSinceDate:streamNames:limit:endDate:error:", v12, v13, a5, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v36 = v13;
    v37 = v12;
    v38 = (id)objc_opt_new();
    +[_DKSystemEventStreams appWebUsageStream](_DKSystemEventStreams, "appWebUsageStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v35 = v15;
    obj = v15;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v22, "metadata");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKTombstoneMetadataKey eventSourceDeviceID](_DKTombstoneMetadataKey, "eventSourceDeviceID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_9;
          objc_msgSend(v22, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v26) = objc_msgSend(v28, "isEqualToString:", v17);
          if ((_DWORD)v26)
          {
LABEL_9:
            objc_msgSend(v22, "stringValue");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v29);
              if (v30)
              {
                objc_msgSend(v38, "addObject:", v30);
              }
              else
              {
                +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v45 = v33;
                  v46 = 2112;
                  v47 = v29;
                  _os_log_error_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to malformed tombstone uuid: %@", buf, 0x16u);

                }
              }
            }
            else
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v45 = v31;
                v46 = 2112;
                v47 = v22;
                _os_log_error_impl(&dword_18DDBE000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to missing tombstone uuid: %@", buf, 0x16u);

              }
            }

          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v19);
    }

    v13 = v36;
    v12 = v37;
    v15 = v35;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (_DKSyncType)syncType
{
  NSObject *v3;
  const char *v4;
  void *syncState;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  syncState = self->_syncState;
  if (syncState)
    syncState = objc_getProperty(syncState, v4, 16, 1);
  return (_DKSyncType *)syncState;
}

- (void)_registerTriggeredSyncActivityWithIsStartup:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Registering triggered sync activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_unregisterDatabaseObservers
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Unregistering sync database observers", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Failed to defer activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)handleFetchedSourceDeviceID:(NSObject *)a3 version:fromPeer:error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &stru_1E26E9728;
  if (objc_msgSend(a2, "me"))
    v7 = CFSTR("pseudo ");
  else
    v7 = &stru_1E26E9728;
  objc_msgSend(a2, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "model");
    a2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(" (%@)"), a2);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  *(_DWORD *)buf = 138544130;
  v12 = v5;
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  v17 = 2114;
  v18 = v6;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Missing source device id requested from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
  if (v9)
  {

  }
}

- (void)_synchronizeWithUrgency:client:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Skipping urgent sync, %{public}@ feature is disabled", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_performSyncWithSyncType:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Sync in progress, queueing completion block", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Sync pending, queueing completion block", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Triggered sync pending and received another triggered sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Sync not yet started, upgrading to forced sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Sync not yet started, upgrading to periodic sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Currently syncing, will leave current sync type unchanged", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Sync pending, upgrading to forced sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_performSyncWithSyncType:completion:.cold.8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Sync pending, upgrading to periodic sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)__performSyncWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: No sync operations to queue", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)__performSyncWithCompletion:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a3, (uint64_t)a3, "%{public}@: Done queuing sync operations", (uint8_t *)a2);

}

- (void)_finishActivityWithError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_23(&dword_18DDBE000, v1, v2, "%{public}@: Missing periodic job activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_finishActivityWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = v2;
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 176), "jobName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v4;
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_29(&dword_18DDBE000, v0, v7, "%{public}@: Unexpected state for running activity %@: %@", (uint8_t *)&v8);

}

- (void)_finishActivityWithError:.cold.3()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 176), "jobName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Deferred running activity %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_finishActivityWithError:.cold.4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 176), "jobName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Done running activity %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_finishActivityWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 176), "jobName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Failed to defer activity %@", v4, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)_finishActivityWithError:(uint64_t)a1 .cold.6(uint64_t a1, void *a2)
{
  void *v2;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 176), "jobName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_25(&dword_18DDBE000, v7, v8, "%{public}@: Deferring activity %@ due to : %{public}@:%lld (%@)", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_22();
}

- (void)_registerPeriodicJobWithInterval:(double)a1 .cold.1(double a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v4, v5, "%{public}@: Scheduling periodic sync job with interval %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_18_0();
}

- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:.cold.1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncDeletedEventIDs count](v0));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Deleting %@ Siri events", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_28(*MEMORY[0x1E0C80C00]), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed while deleting foreign Siri events: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

+ (void)_syncTypeFromActivity:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Sync type data unexpectedly missing from the activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)_syncTypeFromActivity:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Cannot create NSData from the sync type xpc data", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)_syncTypeFromActivity:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Deserialized sync type from xpc activity: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)_syncTypeFromActivity:.cold.4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_28(*MEMORY[0x1E0C80C00]), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Error deserializing syncType: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

- (void)_updatedExecutionCriteriaFromType:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Error creating syncType xpc data", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_updatedExecutionCriteriaFromType:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_28(*MEMORY[0x1E0C80C00]), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Error serializing syncType: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

- (void)_updatedExecutionCriteriaFromType:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Triggered sync type already matches the one in xpc activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_updatedExecutionCriteriaFromType:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Pushing out triggered sync's delay by %lld seconds", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_checkInTriggeredSyncActivity:isStartup:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Found previously scheduled triggered sync activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_checkInTriggeredSyncActivity:isStartup:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Checking in for triggered sync activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_runTriggeredSyncActivity:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Running triggered sync activity", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
