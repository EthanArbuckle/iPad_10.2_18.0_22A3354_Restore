@implementation HDPeriodicCountryMonitor

- (HDPeriodicCountryMonitor)initWithProfile:(id)a3 nanoSyncManager:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HDPeriodicCountryMonitor *v10;

  v6 = (void *)MEMORY[0x1E0C99EA0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDPeriodicCountryMonitor initWithProfile:nanoSyncManager:countryCodeProvider:userDefaults:](self, "initWithProfile:nanoSyncManager:countryCodeProvider:userDefaults:", v8, v7, &__block_literal_global_13, v9);

  return v10;
}

- (HDPeriodicCountryMonitor)initWithProfile:(id)a3 nanoSyncManager:(id)a4 countryCodeProvider:(id)a5 userDefaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDPeriodicCountryMonitor *v14;
  HDPeriodicCountryMonitor *v15;
  void *v16;
  id countryCodeProvider;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HKSynchronousObserverSet *observers;
  uint64_t v23;
  OS_dispatch_queue *observerQueue;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HDPeriodicCountryMonitor;
  v14 = -[HDPeriodicCountryMonitor init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_nanoSyncManager, a4);
    v16 = _Block_copy(v12);
    countryCodeProvider = v15->_countryCodeProvider;
    v15->_countryCodeProvider = v16;

    objc_storeStrong((id *)&v15->_userDefaults, a6);
    v18 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    -[HDPeriodicCountryMonitor hk_classNameWithTag:](v15, "hk_classNameWithTag:", CFSTR("observers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithName:loggingCategory:", v19, v20);
    observers = v15->_observers;
    v15->_observers = (HKSynchronousObserverSet *)v21;

    v15->_state = 0;
    v15->_lock_shouldBypassNextBuildVersionLimit = 0;
    v15->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    observerQueue = v15->_observerQueue;
    v15->_observerQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(v11, "addObserver:", v15);
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v15);

  }
  return v15;
}

- (void)registerObserver:(id)a3
{
  -[HKSynchronousObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[HKSynchronousObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client requesting immediate fetch", (uint8_t *)&v12, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldBypassNextBuildVersionLimit = 1;
  v7 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:]((uint64_t)self, 3);
  os_unfair_lock_unlock(&self->_lock);
  if ((v7 & 1) != 0)
  {
    -[HDPeriodicCountryMonitor _fetchCountryIfNeededWithCompletion:]((uint64_t)self, v4);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v12 = 138543362;
      v13 = v10;
      v11 = v10;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to enter fetching state. Returning error to client.", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("A fetch is already in progress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v9);

  }
}

- (uint64_t)_lock_enterStateIfPossible:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 48));
    v4 = *(_QWORD *)(v3 + 56);
    switch(v4)
    {
      case 0:
        if (((a2 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
          goto LABEL_4;
        goto LABEL_11;
      case 1:
        if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
          goto LABEL_11;
        goto LABEL_4;
      case 2:
      case 3:
        if ((a2 & 0xFFFFFFFFFFFFFFFBLL) != 0)
          goto LABEL_4;
        goto LABEL_11;
      case 4:
        if (!a2)
          goto LABEL_11;
LABEL_4:
        _HKInitializeLogging();
        HKLogInfrastructure();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v11 = (void *)objc_opt_class();
          if ((unint64_t)(v4 - 1) > 3)
            v12 = CFSTR("WaitingForPairingChanges");
          else
            v12 = off_1E6CE9C78[v4 - 1];
          if ((unint64_t)(a2 - 1) > 3)
            v13 = CFSTR("WaitingForPairingChanges");
          else
            v13 = off_1E6CE9C78[a2 - 1];
          v15 = 138543874;
          v16 = v11;
          v17 = 2114;
          v18 = v12;
          v19 = 2114;
          v20 = v13;
          v14 = v11;
          _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Invalid attempt to change state from %{public}@ to %{public}@", (uint8_t *)&v15, 0x20u);

        }
        result = 0;
        break;
      default:
LABEL_11:
        _HKInitializeLogging();
        HKLogInfrastructure();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = (void *)objc_opt_class();
          if ((unint64_t)(v4 - 1) > 3)
            v8 = CFSTR("WaitingForPairingChanges");
          else
            v8 = off_1E6CE9C78[v4 - 1];
          if ((unint64_t)(a2 - 1) > 3)
            v9 = CFSTR("WaitingForPairingChanges");
          else
            v9 = off_1E6CE9C78[a2 - 1];
          v15 = 138543874;
          v16 = v7;
          v17 = 2114;
          v18 = v8;
          v19 = 2114;
          v20 = v9;
          v10 = v7;
          _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] State will change from %{public}@ to %{public}@", (uint8_t *)&v15, 0x20u);

        }
        *(_QWORD *)(v3 + 56) = a2;
        result = 1;
        break;
    }
  }
  return result;
}

- (void)_fetchCountryIfNeededWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 80);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke;
    v6[3] = &unk_1E6CE9C08;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

- (void)enqueueMaintenanceFetch
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client requesting maintenance fetch", (uint8_t *)&v5, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldBypassNextBuildVersionLimit = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[HDPeriodicCountryMonitor _enqueueMaintenanceOperationIfNeeded]((uint64_t)self);
}

- (void)_enqueueMaintenanceOperationIfNeeded
{
  os_unfair_lock_s *v2;
  char v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v3 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](a1, 1);
    os_unfair_lock_unlock(v2);
    if ((v3 & 1) != 0)
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__HDPeriodicCountryMonitor__enqueueMaintenanceOperationIfNeeded__block_invoke;
      v10[3] = &unk_1E6CE9B90;
      v10[4] = a1;
      +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", v5, v10);
      v6 = objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "daemon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "maintenanceWorkCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enqueueMaintenanceOperation:", v6);

    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      *(_DWORD *)buf = 138543362;
      v12 = (id)objc_opt_class();
      WeakRetained = v12;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to enter maintenance operation state", buf, 0xCu);
    }

LABEL_6:
  }
}

- (NSDate)lastCheckAttemptDate
{
  return (NSDate *)-[NSUserDefaults hk_dateForKey:](self->_userDefaults, "hk_dateForKey:", *MEMORY[0x1E0CB5780]);
}

- (NSString)lastFetchAttemptBuild
{
  return -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("HDPeriodicCountryMonitor_LastFetchAttemptBuild"));
}

- (NSDate)lastFetchAttemptDate
{
  return (NSDate *)-[NSUserDefaults hk_dateForKey:](self->_userDefaults, "hk_dateForKey:", CFSTR("HDPeriodicCountryMonitor_LastFetchAttemptDate"));
}

- (HDKeyValueDomain)_lastActivePairedBuildIdentifiersDomain
{
  HDKeyValueDomain *v2;
  id WeakRetained;
  HDKeyValueDomain *v4;

  v2 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v2, "initWithCategory:domainName:profile:", 0, CFSTR("HDPeriodicCountryMonitor_ActivePairedBuildIdentifiers"), WeakRetained);

  return v4;
}

- (_HDPeriodicCountryMonitorPairedBuildIdentifiers)_currentPairedBuildIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _HDPeriodicCountryMonitorPairedBuildIdentifiers *v10;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentOSBuild");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 16), "pairedDevicesSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeDeviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "sourceBundleIdentifier");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "systemBuildVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%@"), v3, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
    else
    {
      v6 = CFSTR("NO_ACTIVE_PAIRED_DEVICE");
    }
    v10 = -[_HDPeriodicCountryMonitorPairedBuildIdentifiers initWithPairingIdentifier:buildIdentifier:]([_HDPeriodicCountryMonitorPairedBuildIdentifiers alloc], "initWithPairingIdentifier:buildIdentifier:", v6, v3);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)_recordSuccessfulFetchForCurrentPairedBuilds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HDPeriodicCountryMonitor _currentPairedBuildIdentifiers]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v16 = 0;
  if (self)
  {
    v7 = v5;
    v8 = v4;
    -[HDPeriodicCountryMonitor _lastActivePairedBuildIdentifiersDomain]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "setString:forKey:error:", v8, v7, &v16);

    v11 = v16;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v12 = v11;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      v15 = v14;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Error recording successful fetch for current paired builds", buf, 0xCu);

    }
  }

}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2112;
    v11 = v5;
    v7 = v9;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observed paired devices snapshot change: %@", (uint8_t *)&v8, 0x16u);

  }
  -[HDPeriodicCountryMonitor _enqueueMaintenanceOperationIfNeeded]((uint64_t)self);

}

void __64__HDPeriodicCountryMonitor__enqueueMaintenanceOperationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v2;
  void (**v3)(_QWORD);
  char v4;
  _QWORD v5[4];
  void (**v6)(_QWORD);

  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    os_unfair_lock_lock(v2 + 12);
    v4 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:]((uint64_t)v2, 2);
    os_unfair_lock_unlock(v2 + 12);
    if ((v4 & 1) != 0)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __67__HDPeriodicCountryMonitor__runMaintenanceOperationWithCompletion___block_invoke;
      v5[3] = &unk_1E6CE9BB8;
      v6 = v3;
      -[HDPeriodicCountryMonitor _fetchCountryIfNeededWithCompletion:]((uint64_t)v2, v5);

    }
    else
    {
      v3[2](v3);
    }
  }

}

uint64_t __67__HDPeriodicCountryMonitor__runMaintenanceOperationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id WeakRetained;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  uint64_t (*v67)(uint64_t);
  void *v68;
  id v69;
  _QWORD v70[5];
  id v71;
  _BYTE buf[24];
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(v2 + 24), "setObject:forKey:", v3, *MEMORY[0x1E0CB5780]);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_2;
  v70[3] = &unk_1E6CE9BE0;
  v70[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v4, "hk_containsObjectPassingTest:", v70);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      v21 = v20;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping fetch as we have no observers", buf, 0xCu);

    }
    -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](*(_QWORD *)(a1 + 32), 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
    v22 = *(_QWORD *)(a1 + 40);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFSTR("Skipped fetch due to no observers");
    v25 = 11;
    goto LABEL_31;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
    goto LABEL_28;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 48));
  if (*(_BYTE *)(v7 + 64))
  {
    *(_BYTE *)(v7 + 64) = 0;
    goto LABEL_7;
  }
  -[HDPeriodicCountryMonitor _currentPairedBuildIdentifiers](v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "buildIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pairingIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v71 = 0;
  v30 = v28;
  -[HDPeriodicCountryMonitor _lastActivePairedBuildIdentifiersDomain](v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringForKey:error:", v30, &v71);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v71;
  v34 = v33;
  if (!v32 && v33)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v59 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v59;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v34;
      v60 = v59;
      _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Error attempting to read last active paired build identifier: %{public}@", buf, 0x16u);

    }
    goto LABEL_28;
  }
  if (v32)
  {
    v36 = objc_msgSend(v32, "isEqualToString:", v29);

    if (v36)
    {
LABEL_28:
      _HKInitializeLogging();
      HKLogInfrastructure();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v38;
        v39 = v38;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping fetch as we've already fetched for this paired build configuration", buf, 0xCu);

      }
      -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](*(_QWORD *)(a1 + 32), 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
      v22 = *(_QWORD *)(a1 + 40);
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = CFSTR("Background check already performed on this build configuration");
      v25 = 130;
      goto LABEL_31;
    }
  }
  else
  {

  }
LABEL_7:
  v8 = -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](*(_QWORD *)(a1 + 32), 4);
  _HKInitializeLogging();
  HKLogInfrastructure();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v57 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v57;
      v58 = v57;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to enter fetching state", buf, 0xCu);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
    v22 = *(_QWORD *)(a1 + 40);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFSTR("A fetch is already in progress");
    v25 = 100;
LABEL_31:
    objc_msgSend(v23, "hk_error:description:", v25, v24);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v22 + 16))(v22, 0, 0, v40);
    goto LABEL_32;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    v12 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching country code during maintenance operation", buf, 0xCu);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  v66[0] = v5;
  v66[1] = 3221225472;
  v67 = __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_214;
  v68 = &unk_1E6CE9BB8;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v69 = v14;
  if (v13)
  {
    v15 = v66;
    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 48));
    if (*(_QWORD *)(v13 + 56) != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", sel__fetchCountryCodeWithCompletion_, v13, CFSTR("HDPeriodicCountryMonitor.m"), 461, CFSTR("Must be in the fetching state"));

    }
    (*(void (**)(void))(*(_QWORD *)(v13 + 32) + 16))();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v13 + 72);
    *(_QWORD *)(v13 + 72) = v16;

    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 48));
    objc_msgSend(*(id *)(v13 + 72), "currentEstimate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v65 = 0;
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v61 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = 0;
        v62 = v61;
        _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching mobile country code: %{public}@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 109, CFSTR("Unexpectedly did not receive a countryCode"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = v18;
    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 48));
    if (*(_QWORD *)(v13 + 56) != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", sel__processCountryCodeResult_, v13, CFSTR("HDPeriodicCountryMonitor.m"), 482, CFSTR("Must be in the fetching state"));

    }
    v43 = *(void **)(v13 + 72);
    *(_QWORD *)(v13 + 72) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 48));
    if (v18)
    {
      v44 = objc_msgSend(v42, "provenance");
      v45 = *(NSObject **)(v13 + 80);
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke;
      v73 = &unk_1E6CE9C58;
      v74 = v13;
      v75 = v42;
      v76 = v44;
      dispatch_async(v45, buf);
      objc_msgSend((id)v13, "_recordSuccessfulFetchForCurrentPairedBuilds");

    }
    v46 = *(void **)(v13 + 88);
    v47 = v15;
    if (v46)
    {
      v48 = v46;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    v49 = v48;
    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 48));
    objc_msgSend(*(id *)(v13 + 24), "setObject:forKey:", v49, CFSTR("HDPeriodicCountryMonitor_LastFetchAttemptDate"));

    v50 = *(void **)(v13 + 24);
    WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
    objc_msgSend(WeakRetained, "healthDaemon");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "behavior");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "currentOSBuild");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setObject:forKey:", v54, CFSTR("HDPeriodicCountryMonitor_LastFetchAttemptBuild"));

    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 48));
    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 48));
    -[HDPeriodicCountryMonitor _lock_enterStateIfPossible:](v13, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 48));

    objc_msgSend(v42, "ISOCode");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v42, "provenance");
    ((void (*)(void *, void *, uint64_t, void *))v67)(v47, v55, v56, v65);

    v40 = v69;
  }
  else
  {
    v40 = v14;
  }
LABEL_32:

}

uint64_t __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEligibleForFetchByPeriodicCountryMonitor:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__HDPeriodicCountryMonitor__fetchCountryIfNeededWithCompletion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    v15 = v3;
    v16 = 2112;
    v17 = v4;
    v5 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of country code: %@", buf, 0x16u);

  }
  v6 = a1[4];
  v7 = (void *)a1[5];
  v8 = *(void **)(v6 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke_227;
  v11[3] = &unk_1E6CE9C30;
  v11[4] = v6;
  v9 = v7;
  v10 = a1[6];
  v12 = v9;
  v13 = v10;
  objc_msgSend(v8, "notifyObservers:", v11);

}

void __54__HDPeriodicCountryMonitor__processCountryCodeResult___block_invoke_227(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "ISOCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "periodicCountryMonitor:didFetchISOCountryCode:countryCodeProvenance:", v3, v6, a1[6]);

}

- (id)diagnosticDescription
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  v5 = self->_state - 1;
  if (v5 > 3)
    v6 = CFSTR("WaitingForPairingChanges");
  else
    v6 = off_1E6CE9C78[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("Current State: %@\n"), v6);
  -[HDPeriodicCountryMonitor lastCheckAttemptDate](self, "lastCheckAttemptDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Last Ran: %@\n"), v7);

  -[HDPeriodicCountryMonitor lastFetchAttemptDate](self, "lastFetchAttemptDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Last Fetched: %@\n"), v8);

  -[HDPeriodicCountryMonitor lastFetchAttemptBuild](self, "lastFetchAttemptBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Last Build: %@\n"), v9);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_countryCodeManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_countryCodeProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_nanoSyncManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
