@implementation HDProcessStateManager

- (BOOL)registerObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  _BOOL4 v11;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BKSApplicationStateMonitor *v20;
  BKSApplicationStateMonitor *applicationMonitor;
  NSObject *v22;
  NSObject *v23;
  BKSApplicationStateMonitor *v24;
  BKSApplicationStateMonitor *v25;
  void *v27;
  void *v28;
  id location[5];
  _BYTE buf[24];
  void *v31;
  id v32[2];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5340];
  v10 = *MEMORY[0x1E0CB5340];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_debug_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEBUG, "Registering observer %@ for process state changes for %@", buf, 0x16u);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v13 = v6;
    v14 = v7;
    if (!self)
      goto LABEL_23;
    os_unfair_lock_assert_owner(&self->_lock);
    -[NSMutableDictionary objectForKey:](self->_processObserversByBundleID, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "addObject:", v13);
      LOBYTE(self) = 1;
LABEL_22:

LABEL_23:
      os_unfair_lock_unlock(p_lock);
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v13);
    -[NSMutableDictionary setObject:forKey:](self->_processObserversByBundleID, "setObject:forKey:", v16, v14);
    -[BKSApplicationStateMonitor interestedBundleIDs](self->_applicationMonitor, "interestedBundleIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_applicationMonitor)
    {
      if ((objc_msgSend(v28, "containsObject:", v14) & 1) != 0)
      {
LABEL_20:
        LOBYTE(self) = 1;
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v28, "arrayByAddingObject:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v18 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_debug_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEBUG, "Updating application state observer for processes: %@", buf, 0xCu);
      }
      -[BKSApplicationStateMonitor updateInterestedBundleIDs:](self->_applicationMonitor, "updateInterestedBundleIDs:", v17);

    }
    else
    {
      -[HDProcessStateManager applicationStateMonitorProvider](self, "applicationStateMonitorProvider");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "createApplicationStateMonitorWithBundleIDs:states:elevatedPriority:", v19, 15, 1);
      v20 = (BKSApplicationStateMonitor *)objc_claimAutoreleasedReturnValue();
      applicationMonitor = self->_applicationMonitor;
      self->_applicationMonitor = v20;

      LODWORD(v19) = self->_applicationMonitor == 0;
      _HKInitializeLogging();
      v22 = *v9;
      v23 = *v9;
      if ((_DWORD)v19)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v14;
          _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Failed to create an application state monitor for %@.", buf, 0xCu);
        }
        LOBYTE(self) = 0;
        goto LABEL_21;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_debug_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEBUG, "Created an application state monitor for bundle identifier %@.", buf, 0xCu);
      }
      objc_initWeak(location, self);
      v24 = self->_applicationMonitor;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke;
      v31 = &unk_1E6CF52F0;
      objc_copyWeak(v32, location);
      -[BKSApplicationStateMonitor setHandler:](v24, "setHandler:", buf);
      objc_destroyWeak(v32);
      objc_destroyWeak(location);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_processInfoByBundleID, "removeObjectForKey:", v14);
    v25 = self->_applicationMonitor;
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke_198;
    location[3] = &unk_1E6CF5318;
    location[4] = self;
    -[BKSApplicationStateMonitor applicationInfoForApplication:completion:](v25, "applicationInfoForApplication:completion:", v14, location);
    goto LABEL_20;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEBUG, "Failed to register process missing a bundle identifier.", buf, 2u);
  }
  LOBYTE(self) = 0;
LABEL_24:

  return (char)self;
}

- (BOOL)isApplicationStateSuspendedForBundleIdentifier:(id)a3
{
  return -[HDProcessStateManager applicationStateForBundleIdentifier:](self, "applicationStateForBundleIdentifier:", a3) == 2;
}

- (void)_handleBackboardApplicationInfoChanged:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _HDProcessInfo *v11;
  void *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _DWORD *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  os_unfair_lock_s *v55;
  void *v56;
  id v57;
  id obj;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  _BYTE buf[40];
  unint64_t v69;
  _BYTE v70[10];
  __int16 v71;
  _BOOL8 v72;
  __int16 v73;
  _BOOL8 v74;
  __int16 v75;
  _BOOL8 v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = (os_unfair_lock_s *)(a1 + 48);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = a1;
  v6 = v4;
  os_unfair_lock_assert_owner(v3);
  v7 = *MEMORY[0x1E0CFE2A8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_29;
  v9 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
  v54 = v6;
  v10 = v6;
  objc_opt_self();
  v11 = objc_alloc_init(_HDProcessInfo);
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  bundleIdentifier = v11->_bundleIdentifier;
  v11->_bundleIdentifier = (NSString *)v13;

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_applicationState = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v11->_pid = objc_msgSend(v16, "intValue");
  v53 = v8;
  objc_msgSend(*(id *)(v5 + 64), "setObject:forKeyedSubscript:", v11, v8);

  v17 = v9;
  os_unfair_lock_assert_owner(v3);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(v5 + 64), "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v60 = v17;
  objc_msgSend(v17, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v22 = v18;
  v23 = v21;
  obj = v22;
  v24 = v5;
  v61 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  v62 = v5;
  v56 = v21;
  if (!v61)
    goto LABEL_25;
  v59 = *(_QWORD *)v64;
  v55 = v3;
  do
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v64 != v59)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v25);
      objc_msgSend(*(id *)(v24 + 64), "objectForKeyedSubscript:", v26);
      v27 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", v26);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v27)
      {
        v30 = v27[2];
        v31 = v27[3];
        if (!v28)
          goto LABEL_10;
      }
      else
      {
        v30 = 0;
        if (!v28)
        {
          v31 = 0;
LABEL_10:
          v32 = 0;
          goto LABEL_14;
        }
        v31 = *(_DWORD *)(v28 + 12);
      }
      v32 = *(_DWORD *)(v28 + 8);
LABEL_14:
      v33 = v26;
      os_unfair_lock_assert_owner(v3);
      if (v30 != v32)
      {
        _HKInitializeLogging();
        v34 = (void *)*MEMORY[0x1E0CB5340];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          HDBKSApplicationStateString(v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          HDBKSApplicationStateString(v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414338;
          *(_QWORD *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v31;
          *(_WORD *)&buf[18] = 2114;
          *(_QWORD *)&buf[20] = v36;
          *(_WORD *)&buf[28] = 2114;
          *(_QWORD *)&buf[30] = v37;
          *(_WORD *)&buf[38] = 2048;
          v69 = v32 == 2;
          *(_WORD *)v70 = 2048;
          *(_QWORD *)&v70[2] = v30 == 2;
          v71 = 2048;
          v72 = v32 == 8;
          v73 = 2048;
          v74 = v30 == 8;
          v75 = 2048;
          v76 = v30 < 2;
          _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "Process %@ (%d) state changed %{public}@ -> %{public}@: suspended %ld -> %ld, foreground %ld -> %ld, terminated %ld", buf, 0x58u);

          v3 = v55;
          v24 = v62;

        }
        objc_msgSend(*(id *)(v24 + 8), "objectForKeyedSubscript:", v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "allObjects");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = *(NSObject **)(v62 + 56);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __141__HDProcessStateManager__lock_notifyObserversProcessWithBundleIdentifier_processIdentifier_applicationStateChanged_previousApplicationState___block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E6CF5340;
        *(_QWORD *)&buf[32] = v39;
        *(_DWORD *)v70 = v32;
        *(_DWORD *)&v70[4] = v30;
        v69 = (unint64_t)v33;
        v70[8] = v32 == 2;
        v70[9] = v30 == 2;
        LOBYTE(v71) = v32 == 8;
        HIBYTE(v71) = v30 == 8;
        LOBYTE(v72) = v30 < 2;
        v41 = v39;
        dispatch_async(v40, buf);

        v24 = v62;
        v23 = v56;
      }

      v42 = v23;
      if (v30 == 8 || (v42 = v57, v32 == 8))
        objc_msgSend(v42, "addObject:", v33);

      ++v25;
    }
    while (v61 != v25);
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    v61 = v43;
  }
  while (v43);
LABEL_25:

  if ((objc_msgSend(v23, "isEqual:", v57) & 1) == 0 && (objc_msgSend(*(id *)(v24 + 24), "isEqual:", v23) & 1) == 0)
  {
    objc_msgSend(*(id *)(v24 + 16), "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v56, "copy");
    v46 = (void *)objc_msgSend(v57, "copy");
    v47 = *(NSObject **)(v24 + 56);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __83__HDProcessStateManager__lock_handleProcessInfoChangedWithAllPreviousProcessInfos___block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E6CE7FB8;
    *(_QWORD *)&buf[32] = v44;
    v69 = (unint64_t)v45;
    *(_QWORD *)v70 = v46;
    v48 = v46;
    v49 = v45;
    v50 = v44;
    dispatch_async(v47, buf);

    v24 = v62;
    v23 = v56;
  }
  v51 = objc_msgSend(v23, "copy");
  v52 = *(void **)(v24 + 24);
  *(_QWORD *)(v24 + 24) = v51;

  v8 = v53;
  v6 = v54;
LABEL_29:

  os_unfair_lock_unlock(v3);
}

- (BOOL)isApplicationStateForegroundForBundleIdentifier:(id)a3
{
  return -[HDProcessStateManager applicationStateForBundleIdentifier:](self, "applicationStateForBundleIdentifier:", a3) == 8;
}

- (void)unregisterObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5340];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "Unregistering observer %@ for process state changes for %@", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(&self->_lock);
    v11 = v7;
    if (self)
    {
      v12 = v6;
      os_unfair_lock_assert_owner(&self->_lock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_processObserversByBundleID, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v12);

      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (!v15)
        -[NSMutableDictionary removeObjectForKey:](self->_processObserversByBundleID, "removeObjectForKey:", v11);

    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "Failed to unregister process, empty bundle identifier.", (uint8_t *)&v16, 2u);
  }

}

- (void)registerForegroundClientProcessObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSHashTable addObject:](self->_foregroundClientProcessObservers, "addObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }
}

- (HDProcessStateManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDProcessStateManager)initWithApplicationStateMonitorProvider:(id)a3
{
  id v4;
  HDProcessStateManager *v5;
  HDProcessStateManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *processObserversByBundleID;
  uint64_t v9;
  OS_dispatch_queue *clientCalloutQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *processInfoByBundleID;
  uint64_t v13;
  NSHashTable *foregroundClientProcessObservers;
  NSSet *v15;
  NSSet *foregroundClientBundleIdentifiers;
  id WeakRetained;
  uint64_t v18;
  HDRBSProcessStateProvider *rbsProcessStateProvider;
  void *v20;
  HDProcessStateManager *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HDProcessStateManager;
  v5 = -[HDProcessStateManager init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_applicationStateMonitorProvider, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    processObserversByBundleID = v6->_processObserversByBundleID;
    v6->_processObserversByBundleID = v7;

    v6->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    clientCalloutQueue = v6->_clientCalloutQueue;
    v6->_clientCalloutQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    processInfoByBundleID = v6->_processInfoByBundleID;
    v6->_processInfoByBundleID = v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    foregroundClientProcessObservers = v6->_foregroundClientProcessObservers;
    v6->_foregroundClientProcessObservers = (NSHashTable *)v13;

    v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    foregroundClientBundleIdentifiers = v6->_foregroundClientBundleIdentifiers;
    v6->_foregroundClientBundleIdentifiers = v15;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_applicationStateMonitorProvider);
    objc_msgSend(WeakRetained, "createRBSProcessStateProvider");
    v18 = objc_claimAutoreleasedReturnValue();
    rbsProcessStateProvider = v6->_rbsProcessStateProvider;
    v6->_rbsProcessStateProvider = (HDRBSProcessStateProvider *)v18;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v6);

    v21 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDProcessStateManager;
  -[HDProcessStateManager dealloc](&v4, sel_dealloc);
}

- (void)unregisterForegroundClientProcessObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSHashTable removeObject:](self->_foregroundClientProcessObservers, "removeObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }
}

- (unsigned)applicationStateForBundleIdentifier:(id)a3
{
  id v4;
  _DWORD *v5;
  BKSApplicationStateMonitor *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_processInfoByBundleID, "objectForKeyedSubscript:", v4);
    v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v6 = self->_applicationMonitor;
    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      v7 = v5[2];
    }
    else if (v6)
    {
      v7 = -[BKSApplicationStateMonitor applicationStateForApplication:](v6, "applicationStateForApplication:", v4);
    }
    else
    {
      -[HDProcessStateManager applicationStateMonitorProvider](self, "applicationStateMonitorProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createApplicationStateMonitor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v9, "applicationStateForApplication:", v4);
      objc_msgSend(v9, "invalidate");

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isApplicationInExtendedRuntimeSessionForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", -[HDProcessStateManager processIdentifierForApplicationIdentifier:](self, "processIdentifierForApplicationIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRBSProcessStateProvider stateForProcessIdentifier:](self->_rbsProcessStateProvider, "stateForProcessIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "tags", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToString:", CFSTR("CSLExtendedRuntimeSession")) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isApplicationFrontBoardVisibleForBundleIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v13;
  HDProcessStateManager *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB5340];
  v6 = *MEMORY[0x1E0CB5340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Verifying FrontBoard visibility for %{public}@", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", -[HDProcessStateManager processIdentifierForApplicationIdentifier:](self, "processIdentifierForApplicationIdentifier:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRBSProcessStateProvider stateForProcessIdentifier:](self->_rbsProcessStateProvider, "stateForProcessIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endowmentNamespaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D22E58]);

  if (v10)
  {
    _HKInitializeLogging();
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Current process identifier %{public}@ has FBS scene visibility endowment", (uint8_t *)&v13, 0x16u);
    }
  }

  return v10;
}

- (BOOL)isApplicationStateBackgroundRunningForBundleIdentifier:(id)a3
{
  return -[HDProcessStateManager applicationStateForBundleIdentifier:](self, "applicationStateForBundleIdentifier:", a3) == 4;
}

- (BOOL)applicationIsForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDProcessStateManager applicationStateMonitorProvider](self, "applicationStateMonitorProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createApplicationStateMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "applicationStateForApplication:", v4);
  objc_msgSend(v6, "invalidate");

  return (_DWORD)v5 == 8;
}

- (BOOL)processIsForeground:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[HDProcessStateManager applicationStateMonitorProvider](self, "applicationStateMonitorProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createApplicationStateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v5, "mostElevatedApplicationStateForPID:", v3);
  objc_msgSend(v5, "invalidate");

  return (_DWORD)v3 == 8;
}

- (int)processIdentifierForApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDProcessStateManager applicationStateMonitorProvider](self, "applicationStateMonitorProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createApplicationStateMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applicationInfoForApplication:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CFE2C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "intValue");
  else
    v10 = -1;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CFE2C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  if (v12 == 1 && v10 != -1)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_INFO))
    {
      v16 = 138543618;
      v17 = v4;
      v18 = 1026;
      v19 = v10;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Process %{public}@ is terminated but monitor reported pid %{public}d. Returning -1.", (uint8_t *)&v16, 0x12u);
    }
    v10 = -1;
  }

  return v10;
}

void __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  -[HDProcessStateManager _handleBackboardApplicationInfoChanged:]((uint64_t)WeakRetained, v3);

}

void __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke_198(uint64_t a1, void *a2)
{
  -[HDProcessStateManager _handleBackboardApplicationInfoChanged:](*(_QWORD *)(a1 + 32), a2);
}

void __83__HDProcessStateManager__lock_handleProcessInfoChangedWithAllPreviousProcessInfos___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "foregroundClientProcessesDidChange:previouslyForegroundBundleIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __141__HDProcessStateManager__lock_notifyObserversProcessWithBundleIdentifier_processIdentifier_applicationStateChanged_previousApplicationState___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "processWithBundleIdentifier:didTransitionFromState:toState:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
        v8 = *(unsigned __int8 *)(a1 + 57);
        if (!*(_BYTE *)(a1 + 56))
          goto LABEL_15;
        if (!*(_BYTE *)(a1 + 57))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "processResumed:", *(_QWORD *)(a1 + 40));
          if (!*(_BYTE *)(a1 + 56))
          {
            v8 = *(unsigned __int8 *)(a1 + 57);
LABEL_15:
            if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v7, "processSuspended:", *(_QWORD *)(a1 + 40));
          }
        }
        v9 = *(unsigned __int8 *)(a1 + 59);
        if (!*(_BYTE *)(a1 + 58))
          goto LABEL_24;
        if (!*(_BYTE *)(a1 + 59))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "processDidEnterBackground:", *(_QWORD *)(a1 + 40));
          if (!*(_BYTE *)(a1 + 58))
          {
            v9 = *(unsigned __int8 *)(a1 + 59);
LABEL_24:
            if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v7, "processDidEnterForeground:", *(_QWORD *)(a1 + 40));
          }
        }
        if (*(_BYTE *)(a1 + 60) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "processTerminated:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Client processes:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_processInfoByBundleID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (v9)
        {
          v10 = *(id *)(v9 + 16);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v9 + 12));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_DWORD *)(v9 + 8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
          v12 = 0;
        }
        HDBKSApplicationStateString(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ (%@) %@"), v10, v11, v13);

        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 = v14;
    }
    while (v14);
  }

  return v3;
}

- (HDApplicationStateMonitorProvider)applicationStateMonitorProvider
{
  return (HDApplicationStateMonitorProvider *)objc_loadWeakRetained((id *)&self->_applicationStateMonitorProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationStateMonitorProvider);
  objc_storeStrong((id *)&self->_processInfoByBundleID, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_rbsProcessStateProvider, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_foregroundClientBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_foregroundClientProcessObservers, 0);
  objc_storeStrong((id *)&self->_processObserversByBundleID, 0);
}

@end
