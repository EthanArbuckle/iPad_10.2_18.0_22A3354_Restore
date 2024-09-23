@implementation HDOTAFeatureAvailabilityManager

- (HDOTAFeatureAvailabilityManager)initWithDaemon:(id)a3
{
  id v4;
  HDOTAFeatureAvailabilityManager *v5;
  HDOTAFeatureAvailabilityManager *v6;
  uint64_t v7;
  TRIClient *trialClient;
  uint64_t v9;
  OS_os_log *loggingCategory;
  id v11;
  void *v12;
  uint64_t v13;
  HKObserverSet *observers;
  uint64_t v15;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v17;
  NSMutableDictionary *lock_factorFileCache;
  id WeakRetained;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDOTAFeatureAvailabilityManager;
  v5 = -[HDOTAFeatureAvailabilityManager init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 275);
    v7 = objc_claimAutoreleasedReturnValue();
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v7;

    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    loggingCategory = v6->_loggingCategory;
    v6->_loggingCategory = (OS_os_log *)v9;

    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    -[HDOTAFeatureAvailabilityManager hk_classNameWithTag:](v6, "hk_classNameWithTag:", CFSTR("observers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithName:loggingCategory:", v12, v6->_loggingCategory);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v13;

    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v15;

    v6->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_factorFileCache = v6->_lock_factorFileCache;
    v6->_lock_factorFileCache = v17;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    objc_msgSend(WeakRetained, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TRIClient removeUpdateHandlerForToken:](self->_trialClient, "removeUpdateHandlerForToken:", self->_trialToken);
  v3.receiver = self;
  v3.super_class = (Class)HDOTAFeatureAvailabilityManager;
  -[HDOTAFeatureAvailabilityManager dealloc](&v3, sel_dealloc);
}

- (void)downloadWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HDOTAFeatureAvailabilityManager_downloadWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__HDOTAFeatureAvailabilityManager_downloadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "downloadImmediatelyWithError:", &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)downloadImmediatelyWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  TRIClient *trialClient;
  void *v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = (id)objc_opt_class();
    v6 = v18;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting immediate download from Trial", buf, 0xCu);

  }
  trialClient = self->_trialClient;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB56B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = -[TRIClient immediateDownloadForNamespaceNames:allowExpensiveNetworking:error:](trialClient, "immediateDownloadForNamespaceNames:allowExpensiveNetworking:error:", v8, 1, &v16);
  v10 = v16;

  if ((v9 & 1) == 0)
  {
    v11 = v10;
    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v18 = v13;
    v14 = v13;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending immediate download from Trial", buf, 0xCu);

  }
  return v9;
}

- (void)daemonReady:(id)a3
{
  id v4;
  TRIClient *trialClient;
  uint64_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  TRINotificationToken *v9;
  TRINotificationToken *trialToken;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  void *v15;
  OS_dispatch_queue *v16;
  void *v17;
  void (**unitTest_daemonReadyObserverDidFinish)(void);
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  trialClient = self->_trialClient;
  v6 = *MEMORY[0x1E0CB56B0];
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke;
  v21[3] = &unk_1E6CF6C48;
  objc_copyWeak(&v22, &location);
  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:](trialClient, "addUpdateHandlerForNamespaceName:queue:usingBlock:", v6, queue, v21);
  v9 = (TRINotificationToken *)objc_claimAutoreleasedReturnValue();
  trialToken = self->_trialToken;
  self->_trialToken = v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCompanionCapable");

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(v14, "maintenanceWorkCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_queue;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke_2;
    v19[3] = &unk_1E6CECE78;
    objc_copyWeak(&v20, &location);
    +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", CFSTR("HDOTAFeatureAvailabilityManager:syncDisableAndExpiryConditionsToLegacyPairedWatches"), v16, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enqueueMaintenanceOperation:", v17);

    objc_destroyWeak(&v20);
  }
  unitTest_daemonReadyObserverDidFinish = (void (**)(void))self->_unitTest_daemonReadyObserverDidFinish;
  if (unitTest_daemonReadyObserverDidFinish)
    unitTest_daemonReadyObserverDidFinish[2]();
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDOTAFeatureAvailabilityManager _queue_refreshClientAndNotifyObservers]((uint64_t)WeakRetained);

}

- (uint64_t)_queue_refreshClientAndNotifyObservers
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 16), "refresh");
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    objc_msgSend(WeakRetained, "behavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCompanionCapable");

    if (v4)
      -[HDOTAFeatureAvailabilityManager _queue_syncDisableAndExpiryConditionsToLegacyPairedWatches](v1);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 56));
    objc_msgSend(*(id *)(v1 + 64), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    _HKInitializeLogging();
    v5 = *(NSObject **)(v1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      *(_DWORD *)buf = 138543362;
      v11 = (id)objc_opt_class();
      v7 = v11;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of new feature availability information", buf, 0xCu);

    }
    v8 = *(void **)(v1 + 24);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__HDOTAFeatureAvailabilityManager__queue_refreshClientAndNotifyObservers__block_invoke;
    v9[3] = &unk_1E6CF6C70;
    v9[4] = v1;
    return objc_msgSend(v8, "notifyObservers:", v9);
  }
  return result;
}

void __47__HDOTAFeatureAvailabilityManager_daemonReady___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDOTAFeatureAvailabilityManager _queue_syncDisableAndExpiryConditionsToLegacyPairedWatches]((uint64_t)WeakRetained);

}

- (void)_queue_syncDisableAndExpiryConditionsToLegacyPairedWatches
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = *(void **)(a1 + 80);
    if (v2)
    {
      v3 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "hk_remoteFeatureAvailabilityUserDefaults");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    v28 = 0;
    objc_msgSend((id)a1, "disableAndExpiryConditionsDictionaryWithError:", &v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v28;
    if (v5)
    {
      objc_msgSend(v4, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hk_filter:", &__block_literal_global_87);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v11;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v5, "objectForKeyedSubscript:", v17, (_QWORD)v24);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v18, v17);

          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v14);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HKSynchronizeNanoPreferencesUserDefaults();

      notify_post((const char *)*MEMORY[0x1E0CB5E18]);
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (!v21)
      {
LABEL_18:

        return;
      }
      HKLogInfrastructure();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        v32 = 2114;
        v33 = v6;
        v23 = v22;
        _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] No disable and expiry conditions found: %{public}@", buf, 0x16u);

      }
    }

    goto LABEL_18;
  }
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_unitTest_refreshClientAndNotifyObservers
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HDOTAFeatureAvailabilityManager__unitTest_refreshClientAndNotifyObservers__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __76__HDOTAFeatureAvailabilityManager__unitTest_refreshClientAndNotifyObservers__block_invoke(uint64_t a1)
{
  return -[HDOTAFeatureAvailabilityManager _queue_refreshClientAndNotifyObservers](*(_QWORD *)(a1 + 32));
}

uint64_t __73__HDOTAFeatureAvailabilityManager__queue_refreshClientAndNotifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:", *(_QWORD *)(a1 + 32));
}

- (NSString)factorPackID
{
  void *v2;
  void *v3;
  void *v4;

  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", *MEMORY[0x1E0CB56B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "factorPackId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (id)_fileURLForFileNamed:(id)a3 factorPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.plist"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fileURLWithPath:isDirectory:relativeToURL:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_infoDictionaryRepresentationForFileNamed:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v5 = a2;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_24;
  }
  v6 = *(void **)(a1 + 72);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "levelForFactor:withNamespaceName:", CFSTR("Feature Availability"), *MEMORY[0x1E0CB56B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "directoryValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasPath"))
    {
      objc_msgSend(v9, "path");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("Asset factor not downloaded"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

      v7 = 0;
      v12 = 0;
      goto LABEL_23;
    }
  }
  objc_msgSend((id)a1, "_fileURLForFileNamed:factorPath:", v5, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_unfair_lock_s *)(a1 + 56);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v10, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v12, v10);
    if (!v12)
    {
      if ((objc_msgSend(v13, "hk_isCocoaNoSuchFileError") & 1) == 0 && v13)
      {
        v13 = v13;
LABEL_17:
        if (a3)
          *a3 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();

        goto LABEL_21;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No plist found with name %@"), v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_error:description:underlyingError:", 11, v16, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v17;
      if (v13)
        goto LABEL_17;
    }
LABEL_21:

  }
  os_unfair_lock_unlock(v11);

LABEL_23:
LABEL_24:

  return v12;
}

- (id)disableAndExpiryConditionsDictionaryWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAppleInternalInstall") & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("HDFeatureAvailabilityAssetManagerTestMode"));

  if (!v7)
  {
LABEL_7:
    -[HDOTAFeatureAvailabilityManager _infoDictionaryRepresentationForFileNamed:error:]((uint64_t)self, CFSTR("DisableAndExpireConditions"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/HXMobileAssetTester/ActiveOverride"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Conditions.plist"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543618;
    v16 = (id)objc_opt_class();
    v17 = 2112;
    v18 = v9;
    v14 = v16;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Running in HXMobileAssetTester test mode, looking for asset in %@", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v9, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_dictionaryByAddingEntriesFromDictionary:", &unk_1E6DFEF00);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)featureAvailabilityInfoForFeature:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  HDOTAFeatureAvailabilityInfo *v10;
  HDOTAFeatureAvailabilityInfo *v11;
  HDOTAFeatureAvailabilityInfo *v12;
  HDOTAFeatureAvailabilityInfo *v13;
  id v15;

  v6 = a3;
  v15 = 0;
  -[HDOTAFeatureAvailabilityManager _infoDictionaryRepresentationForFileNamed:error:]((uint64_t)self, v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (!v7)
  {
    v13 = (HDOTAFeatureAvailabilityInfo *)v8;
    v11 = v13;
    if (v13)
    {
      if (a4)
      {
        v11 = objc_retainAutorelease(v13);
        v12 = 0;
        *a4 = v11;
        goto LABEL_10;
      }
      _HKLogDroppedError();
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v10 = -[HDOTAFeatureAvailabilityInfo initWithDictionaryRepresentation:]([HDOTAFeatureAvailabilityInfo alloc], "initWithDictionaryRepresentation:", v7);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Could not decode info %@ for feature %@"), v7, v6);
    v11 = 0;
    goto LABEL_9;
  }
  v11 = v10;
  v12 = v11;
LABEL_10:

  return v12;
}

uint64_t __93__HDOTAFeatureAvailabilityManager__queue_syncDisableAndExpiryConditionsToLegacyPairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v2, "hasPrefix:", CFSTR("Expire")) & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("Disable"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSDictionary)unitTest_factorFileCache
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_lock_factorFileCache, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSString)unitTest_factorPath
{
  return self->_unitTest_factorPath;
}

- (void)setUnitTest_factorPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSUserDefaults)unitTest_legacyDisableAndExpiryDefaults
{
  return self->_unitTest_legacyDisableAndExpiryDefaults;
}

- (void)setUnitTest_legacyDisableAndExpiryDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_legacyDisableAndExpiryDefaults, a3);
}

- (id)unitTest_daemonReadyObserverDidFinish
{
  return self->_unitTest_daemonReadyObserverDidFinish;
}

- (void)setUnitTest_daemonReadyObserverDidFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_daemonReadyObserverDidFinish, 0);
  objc_storeStrong((id *)&self->_unitTest_legacyDisableAndExpiryDefaults, 0);
  objc_storeStrong((id *)&self->_unitTest_factorPath, 0);
  objc_storeStrong((id *)&self->_lock_factorFileCache, 0);
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
