@implementation NTKCompanionAppLibrary

+ (id)sharedAppLibrary
{
  if (sharedAppLibrary_onceToken != -1)
    dispatch_once(&sharedAppLibrary_onceToken, &__block_literal_global_71);
  return (id)sharedAppLibrary_appLibrary;
}

- (BOOL)isRestrictedSystemApp:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((-[CLKDevice isRunningGraceOrLater](self->_device, "isRunningGraceOrLater") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[NTKSystemAppStateCache sharedInstance](NTKSystemAppStateCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isRestrictedSystemApp:", v4);

  }
  return v5;
}

- (BOOL)isRemovedSystemApp:(id)a3
{
  id v4;
  CLKDevice *device;
  void *v6;
  NSSet *v7;
  _BOOL4 appConduitLoaded;
  int v9;

  v4 = a3;
  if (-[CLKDevice isRunningGraceOrLater](self->_device, "isRunningGraceOrLater"))
  {
    device = self->_device;
    if (!device
      || (-[CLKDevice nrDevice](device, "nrDevice"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      LOBYTE(v9) = 0;
      goto LABEL_9;
    }
    -[NSRecursiveLock lock](self->_internalLock, "lock");
    v7 = self->_installedSystemApplicationIdentifiers;
    appConduitLoaded = self->_appConduitLoaded;
    -[NSRecursiveLock unlock](self->_internalLock, "unlock");
    if (appConduitLoaded)
      v9 = !-[NSSet containsObject:](v7, "containsObject:", v4);
    else
      LOBYTE(v9) = 0;
  }
  else
  {
    +[NTKSystemAppStateCache sharedInstance](NTKSystemAppStateCache, "sharedInstance");
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = -[NSSet isRemovedSystemApp:](v7, "isRemovedSystemApp:", v4);
  }

LABEL_9:
  return v9;
}

void __42__NTKCompanionAppLibrary_sharedAppLibrary__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedAppLibrary_appLibrary;
  sharedAppLibrary_appLibrary = v0;

}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKSystemAppStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __35__NTKCompanionAppLibrary__loadApps__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadApps");
}

- (void)setUpdateProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateProcessingQueue, a3);
}

- (void)setObserverCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerCallbackQueue, a3);
}

- (void)setInternalLock:(id)a3
{
  objc_storeStrong((id *)&self->_internalLock, a3);
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setChangeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_changeObservers, a3);
}

- (void)setAppProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_appProcessingQueue, a3);
}

- (void)prewarmCompanionDaemonWithCompletion:(id)a3
{
  void (**v4)(void);
  void *v5;
  void *v6;
  NSArray *v7;
  NSMutableArray *prewarmCallbacks;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void (**v13)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v13 = v4;
    -[NTKCompanionAppLibrary device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nrDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSRecursiveLock lock](self->_internalLock, "lock");
      v7 = self->_allApps;
      prewarmCallbacks = self->_prewarmCallbacks;
      if (!prewarmCallbacks)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v10 = self->_prewarmCallbacks;
        self->_prewarmCallbacks = v9;

        prewarmCallbacks = self->_prewarmCallbacks;
      }
      v11 = (void *)objc_msgSend(v13, "copy");
      v12 = _Block_copy(v11);
      -[NSMutableArray addObject:](prewarmCallbacks, "addObject:", v12);

      -[NSRecursiveLock unlock](self->_internalLock, "unlock");
      if (v7)
        v13[2]();

    }
    else
    {
      v13[2]();
    }
    v4 = v13;
  }

}

- (NTKCompanionAppLibrary)init
{
  NTKCompanionAppLibrary *v2;
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKCompanionAppLibrary;
  v2 = -[NTKCompanionAppLibrary init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
    -[NTKCompanionAppLibrary setInternalLock:](v2, "setInternalLock:", v3);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.ntk.companionapplibrary.updates", v4);
    -[NTKCompanionAppLibrary setUpdateProcessingQueue:](v2, "setUpdateProcessingQueue:", v5);

    v6 = dispatch_queue_create("com.apple.ntk.companionapplibrary.observercallback", v4);
    -[NTKCompanionAppLibrary setObserverCallbackQueue:](v2, "setObserverCallbackQueue:", v6);

    v7 = dispatch_queue_create("com.apple.ntk.companionapplibrary.appconduit", v4);
    -[NTKCompanionAppLibrary setAppProcessingQueue:](v2, "setAppProcessingQueue:", v7);

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionAppLibrary setChangeObservers:](v2, "setChangeObservers:", v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__activeDeviceChanged, *MEMORY[0x1E0C93E48], 0);

    -[NTKCompanionAppLibrary _load](v2, "_load");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleAppConduitApplicationsChangedNotification_0, (CFStringRef)*MEMORY[0x1E0CF8828], v2, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v2);

  }
  return v2;
}

- (id)disabledComplicationTypes
{
  void *v3;
  NSIndexSet *v4;
  NSIndexSet *v5;
  NSIndexSet *disabledComplicationTypesCache;

  -[NTKCompanionAppLibrary device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v4 = self->_disabledComplicationTypesCache;
  if (!v4)
  {
    _NTKDisabledComplicationTypesForDevice(v3);
    v4 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    v5 = (NSIndexSet *)-[NSIndexSet copy](v4, "copy");
    disabledComplicationTypesCache = self->_disabledComplicationTypesCache;
    self->_disabledComplicationTypesCache = v5;

  }
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");

  return v4;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)_queue_loadApps
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *firstPartyApps;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSArray *v19;
  NSArray *allApps;
  void *v21;
  NSMutableArray *prewarmCallbacks;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSObject *observerCallbackQueue;
  NSArray *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  NSArray *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateProcessingQueue);
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v3 = self->_allApps;
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  -[NTKCompanionAppLibrary _loadWatchApps](self, "_loadWatchApps");
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__25;
  v53 = __Block_byref_object_dispose__25;
  v54 = 0;
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  -[NTKCompanionAppLibrary device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCompanion1stPartyApp allAppsForDevice:](NTKCompanion1stPartyApp, "allAppsForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global_42);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  firstPartyApps = self->_firstPartyApps;
  self->_firstPartyApps = v7;

  v9 = -[NSArray mutableCopy](self->_thirdPartyApps, "mutableCopy");
  v10 = (void *)v50[5];
  v50[5] = v9;

  objc_msgSend((id)v50[5], "addObjectsFromArray:", self->_firstPartyApps);
  objc_msgSend((id)v50[5], "addObjectsFromArray:", self->_watchSystemApps);
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  v11 = MEMORY[0x1E0C809B0];
  v12 = (void *)v50[5];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_2;
  v48[3] = &unk_1E6BD3348;
  v48[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v48);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45[0] = v11;
  v45[1] = 3221225472;
  v45[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_3;
  v45[3] = &unk_1E6BD3370;
  v47 = &v49;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v15;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v45);
  v16 = (void *)v50[5];
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_4;
  v41[3] = &unk_1E6BD3398;
  v31 = v3;
  v42 = v31;
  v17 = v14;
  v43 = v17;
  v18 = v13;
  v44 = v18;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v41);
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v19 = (NSArray *)objc_msgSend((id)v50[5], "copy");
  allApps = self->_allApps;
  self->_allApps = v19;

  v21 = (void *)-[NSMutableArray copy](self->_prewarmCallbacks, "copy");
  prewarmCallbacks = self->_prewarmCallbacks;
  self->_prewarmCallbacks = 0;

  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  v32 = v17;
  v23 = (void *)v6;
  v24 = v5;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v25);
        v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        observerCallbackQueue = self->_observerCallbackQueue;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_5;
        block[3] = &unk_1E6BCDF60;
        block[4] = v29;
        dispatch_async(observerCallbackQueue, block);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v55, 16, v31);
    }
    while (v26);
  }

  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_6;
  v35[3] = &unk_1E6BD3348;
  v35[4] = self;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v35);
  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_7;
  v34[3] = &unk_1E6BD3348;
  v34[4] = self;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v34);
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_8;
  v33[3] = &unk_1E6BD3348;
  v33[4] = self;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v33);

  _Block_object_dispose(&v49, 8);
}

- (void)_load
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanionAppLibrary setDevice:](self, "setDevice:", v3);

  -[NTKCompanionAppLibrary _loadApps](self, "_loadApps");
}

- (void)_loadWatchApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSIndexSet *disabledComplicationTypesCache;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  uint8_t buf[8];
  _QWORD v27[5];
  id v28;
  _QWORD aBlock[5];
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  char v35;
  _QWORD block[6];

  -[CLKDevice nrDevice](self->_device, "nrDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CLKDevice isRunningGraceOrLater](self->_device, "isRunningGraceOrLater");
    v8 = dispatch_semaphore_create(0);
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2;
    aBlock[3] = &unk_1E6BD32B8;
    aBlock[4] = self;
    v23 = v5;
    v30 = v23;
    v35 = v7;
    v10 = v6;
    v31 = v10;
    v11 = v4;
    v32 = v11;
    v12 = v8;
    v33 = v12;
    v13 = v3;
    v34 = v13;
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_37;
    v27[3] = &unk_1E6BD32E0;
    v27[4] = self;
    v14 = _Block_copy(aBlock);
    v28 = v14;
    v15 = _Block_copy(v27);
    -[NSRecursiveLock lock](self->_internalLock, "lock");
    self->_appConduitLoaded = 0;
    disabledComplicationTypesCache = self->_disabledComplicationTypesCache;
    self->_disabledComplicationTypesCache = 0;

    -[NSRecursiveLock unlock](self->_internalLock, "unlock");
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "Loading apps on watch…", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "enumerateInstalledApplicationsOnPairedDevice:withBlock:", v13, v15);

      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v21 = "Apps on watch loaded.";
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "Loading possible 3rd party apps from phone…", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection", v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "enumerateLocallyAvailableApplicationsForPairedDevice:options:withBlock:", v13, 3, v15);

      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v21 = "Possible 3rd party apps on watch loaded.";
    }
    _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_13:

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_40;
    v25[3] = &unk_1E6BCD5F0;
    v25[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v25);

    goto LABEL_14;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_14:

}

- (void)_loadApps
{
  NSObject *updateProcessingQueue;
  _QWORD block[5];

  updateProcessingQueue = self->_updateProcessingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NTKCompanionAppLibrary__loadApps__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(updateProcessingQueue, block);
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E48], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CF8828], self);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)NTKCompanionAppLibrary;
  -[NTKCompanionAppLibrary dealloc](&v7, sel_dealloc);
}

- (NSArray)thirdPartyApps
{
  NSArray *v3;

  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v3 = self->_thirdPartyApps;
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  return v3;
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  CLKDevice *device;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  device = self->_device;
  v8 = a4;
  -[CLKDevice nrDevice](device, "nrDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if (v11)
    -[NTKCompanionAppLibrary _loadApps](self, "_loadApps");
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Received installed applications: %@", (uint8_t *)&v14, 0xCu);

  }
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  CLKDevice *device;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  device = self->_device;
  v8 = a4;
  -[CLKDevice nrDevice](device, "nrDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if (v11)
    -[NTKCompanionAppLibrary _loadApps](self, "_loadApps");
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Received updated applications: %@", (uint8_t *)&v14, 0xCu);

  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  CLKDevice *device;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  device = self->_device;
  v8 = a4;
  -[CLKDevice nrDevice](device, "nrDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if (v11)
    -[NTKCompanionAppLibrary _loadApps](self, "_loadApps");
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Received uninstalled applications: %@", (uint8_t *)&v14, 0xCu);

  }
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  CLKDevice *device;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t v10[16];

  device = self->_device;
  v5 = a3;
  -[CLKDevice nrDevice](device, "nrDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if (v8)
    -[NTKCompanionAppLibrary _loadApps](self, "_loadApps");
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Application database did resync", v10, 2u);
  }

}

- (void)addObserver:(id)a3
{
  NSRecursiveLock *internalLock;
  id v5;

  internalLock = self->_internalLock;
  v5 = a3;
  -[NSRecursiveLock lock](internalLock, "lock");
  -[NSHashTable addObject:](self->_changeObservers, "addObject:", v5);

  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
}

- (void)removeObserver:(id)a3
{
  NSRecursiveLock *internalLock;
  id v5;

  internalLock = self->_internalLock;
  v5 = a3;
  -[NSRecursiveLock lock](internalLock, "lock");
  -[NSHashTable removeObject:](self->_changeObservers, "removeObject:", v5);

  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
}

- (void)_notifyAppAdded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *observerCallbackQueue;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v5 = (void *)-[NSHashTable copy](self->_changeObservers, "copy");
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __42__NTKCompanionAppLibrary__notifyAppAdded___block_invoke;
          block[3] = &unk_1E6BCDCB8;
          block[4] = v11;
          block[5] = self;
          v14 = v4;
          dispatch_async(observerCallbackQueue, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __42__NTKCompanionAppLibrary__notifyAppAdded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appLibrary:didAddApp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyAppUpdated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *observerCallbackQueue;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v5 = (void *)-[NSHashTable copy](self->_changeObservers, "copy");
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __44__NTKCompanionAppLibrary__notifyAppUpdated___block_invoke;
          block[3] = &unk_1E6BCDCB8;
          block[4] = v11;
          block[5] = self;
          v14 = v4;
          dispatch_async(observerCallbackQueue, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __44__NTKCompanionAppLibrary__notifyAppUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appLibrary:didUpdateApp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyAppRemoved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *observerCallbackQueue;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v5 = (void *)-[NSHashTable copy](self->_changeObservers, "copy");
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __44__NTKCompanionAppLibrary__notifyAppRemoved___block_invoke;
          block[3] = &unk_1E6BCDCB8;
          block[4] = v11;
          block[5] = self;
          v14 = v4;
          dispatch_async(observerCallbackQueue, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __44__NTKCompanionAppLibrary__notifyAppRemoved___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appLibrary:didRemoveApp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyAppIconUpdated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *observerCallbackQueue;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v5 = (void *)-[NSHashTable copy](self->_changeObservers, "copy");
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__NTKCompanionAppLibrary__notifyAppIconUpdated___block_invoke;
          block[3] = &unk_1E6BCDCB8;
          block[4] = v11;
          block[5] = self;
          v14 = v4;
          dispatch_async(observerCallbackQueue, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

uint64_t __48__NTKCompanionAppLibrary__notifyAppIconUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appLibrary:didUpdateAppIcon:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  char *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  dispatch_semaphore_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t (**v45)(_QWORD, id);
  void *v46;
  int v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  dispatch_semaphore_t v55;
  id v56;
  _QWORD aBlock[5];
  char *v58;
  id v59;
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  NSObject *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v7))
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v7;
        _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Already added app with bundleID: %@", buf, 0xCu);
      }
      goto LABEL_40;
    }
    objc_msgSend(v5, "companionAppBundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);
      objc_msgSend(v12, "applicationState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isRestricted");

      if (v14)
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v62 = v7;
          v63 = 2112;
          v64 = v8;
          _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, "App is restricted with bundleID: %@ - %@ on companion", buf, 0x16u);
        }

        goto LABEL_39;
      }

    }
    +[NTKCompanion1stPartyApp appForBundleIdentifier:](NTKCompanion1stPartyApp, "appForBundleIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v7;
        _os_log_impl(&dword_1B72A3000, v30, OS_LOG_TYPE_DEFAULT, "1st party app with bundleID: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
      goto LABEL_39;
    }
    v31 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29;
    aBlock[3] = &unk_1E6BD3290;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v32 = v7;
    v58 = v32;
    v59 = *(id *)(a1 + 40);
    v60 = *(id *)(a1 + 56);
    v33 = _Block_copy(aBlock);
    if (!*(_BYTE *)(a1 + 80))
    {
      v38 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v31;
      v41 = v33;
      v42 = (void *)v39;
      v43 = *(_QWORD *)(a1 + 72);
      v53[0] = v40;
      v53[1] = 3221225472;
      v53[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_32;
      v53[3] = &unk_1E6BCF828;
      v56 = v41;
      v54 = v5;
      v55 = v38;
      v44 = v38;
      objc_msgSend(v42, "applicationIsInstalledOnPairedDevice:withBundleID:completion:", v43, v32, v53);

      v33 = v41;
      dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);

LABEL_38:
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    objc_msgSend(v5, "complicationPrincipalClass");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v62 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke_2";
        v36 = "%s - processRemoteApplication non-nil principal class";
LABEL_30:
        _os_log_impl(&dword_1B72A3000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
      }
    }
    else
    {
      v45 = (uint64_t (**)(_QWORD, id))v33;
      +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "bundleComplicationExistsForAppBundleIdentifier:", v32);

      if (v47)
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
          _os_log_impl(&dword_1B72A3000, v48, OS_LOG_TYPE_DEFAULT, "%s - processRemoteApplication bundleComplicationExistsForAppBundleIdentifier", buf, 0xCu);
        }

        v33 = v45;
        v37 = (void *)v45[2](v45, v5);
        goto LABEL_37;
      }
      objc_msgSend(*(id *)(a1 + 32), "device");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      NTKComplicationTypesForDeviceWithBundleID(v50, v32);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      v33 = v45;
      if (!v52)
        goto LABEL_38;
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v62 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
        v36 = "%s - processRemoteApplication NTKComplicationTypesForDeviceWithBundleID > 0";
        goto LABEL_30;
      }
    }

    v37 = (void *)(*((uint64_t (**)(void *, id))v33 + 2))(v33, v5);
LABEL_37:
    v49 = v37;
    goto LABEL_38;
  }
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2_cold_1((uint64_t)v6, v10, v11);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v62 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "%s - processRemoteApplication non-error completion", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "lock");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v6 == 0;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 56);
  *(_QWORD *)(v16 + 56) = 0;

  v18 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 24);
  *(_QWORD *)(v19 + 24) = v18;

  if (*(_BYTE *)(a1 + 80))
  {
    v21 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    v24 = objc_msgSend(*(id *)(a1 + 56), "copy");
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 48);
  *(_QWORD *)(v27 + 48) = v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "unlock");
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v62 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
    _os_log_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_DEFAULT, "%s - processRemoteApplication signaling", buf, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
LABEL_41:

}

id __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:](NTKCompanion3rdPartyApp, "companion3rdPartyRemoteApp:device:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Adding app with bundleID: %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29_cold_1(v3, v7);
  }

  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
  return v5;
}

intptr_t __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_32(uint64_t a1, int a2)
{
  id v3;

  if (a2)
    v3 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "%s - handleRemoteApplication", buf, 0xCu);
  }

  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_38;
  block[3] = &unk_1E6BD00D8;
  v15 = v6;
  v16 = v8;
  v14 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

  return 1;
}

uint64_t __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_38(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_40(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKSystemAppStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "containerApplicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v2, 1, 0);
    objc_msgSend(v3, "applicationState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRestricted") ^ 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_4(id *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(a1[4], "indexOfObject:");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(a1[4], "objectAtIndex:", v3), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1[6], "addObject:", v8);
  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v8;
    else
      v7 = 0;
    if (objc_msgSend(v7, "applicationHasBeenUpdated:", v6))
      objc_msgSend(a1[5], "addObject:", v8);

  }
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAppRemoved:", a2);
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAppUpdated:", a2);
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAppAdded:", a2);
}

- (NSArray)allApps
{
  NSArray *v3;

  -[NSRecursiveLock lock](self->_internalLock, "lock");
  v3 = self->_allApps;
  -[NSRecursiveLock unlock](self->_internalLock, "unlock");
  return v3;
}

- (void)setAllApps:(id)a3
{
  objc_storeStrong((id *)&self->_allApps, a3);
}

- (void)setThirdPartyApps:(id)a3
{
  objc_storeStrong((id *)&self->_thirdPartyApps, a3);
}

- (NSArray)firstPartyApps
{
  return self->_firstPartyApps;
}

- (void)setFirstPartyApps:(id)a3
{
  objc_storeStrong((id *)&self->_firstPartyApps, a3);
}

- (NSArray)watchSystemApps
{
  return self->_watchSystemApps;
}

- (void)setWatchSystemApps:(id)a3
{
  objc_storeStrong((id *)&self->_watchSystemApps, a3);
}

- (NSSet)installedSystemApplicationIdentifiers
{
  return self->_installedSystemApplicationIdentifiers;
}

- (void)setInstalledSystemApplicationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_installedSystemApplicationIdentifiers, a3);
}

- (BOOL)appConduitLoaded
{
  return self->_appConduitLoaded;
}

- (void)setAppConduitLoaded:(BOOL)a3
{
  self->_appConduitLoaded = a3;
}

- (NSIndexSet)disabledComplicationTypesCache
{
  return self->_disabledComplicationTypesCache;
}

- (void)setDisabledComplicationTypesCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (NSRecursiveLock)internalLock
{
  return self->_internalLock;
}

- (OS_dispatch_queue)updateProcessingQueue
{
  return self->_updateProcessingQueue;
}

- (OS_dispatch_queue)observerCallbackQueue
{
  return self->_observerCallbackQueue;
}

- (OS_dispatch_queue)appProcessingQueue
{
  return self->_appProcessingQueue;
}

- (NSMutableArray)prewarmCallbacks
{
  return self->_prewarmCallbacks;
}

- (void)setPrewarmCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_prewarmCallbacks, 0);
  objc_storeStrong((id *)&self->_appProcessingQueue, 0);
  objc_storeStrong((id *)&self->_observerCallbackQueue, 0);
  objc_storeStrong((id *)&self->_updateProcessingQueue, 0);
  objc_storeStrong((id *)&self->_internalLock, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_disabledComplicationTypesCache, 0);
  objc_storeStrong((id *)&self->_installedSystemApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_watchSystemApps, 0);
  objc_storeStrong((id *)&self->_firstPartyApps, 0);
  objc_storeStrong((id *)&self->_thirdPartyApps, 0);
  objc_storeStrong((id *)&self->_allApps, 0);
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "Could not enumerate applications with complications. Third party applications may be missing from Gallery. Error: %@", (uint8_t *)&v3);
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v4, "Failed to create application object for watch application with bundleId: %@. It will not be displayed in Gallery.", (uint8_t *)&v5);

}

@end
