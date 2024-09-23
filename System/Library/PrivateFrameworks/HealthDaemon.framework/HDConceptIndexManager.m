@implementation HDConceptIndexManager

- (HDConceptIndexManager)init
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

- (HDConceptIndexManager)initWithProfile:(id)a3
{
  id v4;
  HDConceptIndexManager *v5;

  v4 = a3;
  v5 = -[HDConceptIndexManager initWithConceptIndexerClass:batchSize:profile:](self, "initWithConceptIndexerClass:batchSize:profile:", objc_opt_class(), 20, v4);

  return v5;
}

- (HDConceptIndexManager)initWithConceptIndexerClass:(Class)a3 batchSize:(unint64_t)a4 profile:(id)a5
{
  id v9;
  void *v10;
  HDConceptIndexManager *v11;
  HDConceptIndexManager *v12;
  uint64_t v13;
  OS_dispatch_queue *delayedOperationQueue;
  id v15;
  uint64_t v16;
  HKObserverSet *observerSet;
  NSCountedSet *v18;
  NSCountedSet *cachedReasonsForReindex;
  id v20;
  OS_dispatch_queue *v21;
  uint64_t v22;
  _HKDelayedOperation *updateIndexOperation;
  id WeakRetained;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v9 = a5;
  v10 = v9;
  if (a4)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDConceptIndexManager.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batchSize"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDConceptIndexManager.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)HDConceptIndexManager;
  v11 = -[HDConceptIndexManager init](&v31, sel_init);
  v12 = v11;
  if (v11)
  {
    atomic_store(0, (unsigned __int8 *)&v11->_isInvalidated);
    *(_WORD *)&v11->_hasScheduledIndexing = 0;
    v11->_stateLock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    delayedOperationQueue = v12->_delayedOperationQueue;
    v12->_delayedOperationQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v12->_profile, v10);
    v12->_conceptIndexerClass = a3;
    v12->_batchSize = a4;
    v15 = objc_alloc(MEMORY[0x1E0CB6988]);
    v16 = objc_msgSend(v15, "initWithName:loggingCategory:", CFSTR("concept-index-scheduler-observers"), *MEMORY[0x1E0CB52C0]);
    observerSet = v12->_observerSet;
    v12->_observerSet = (HKObserverSet *)v16;

    v12->_conceptIndexUpdateDebounceIntervalOverride = 0.25;
    v18 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    cachedReasonsForReindex = v12->_cachedReasonsForReindex;
    v12->_cachedReasonsForReindex = v18;

    objc_initWeak(&location, v12);
    v20 = objc_alloc(MEMORY[0x1E0CB6F80]);
    v21 = v12->_delayedOperationQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __71__HDConceptIndexManager_initWithConceptIndexerClass_batchSize_profile___block_invoke;
    v28[3] = &unk_1E6CECE78;
    objc_copyWeak(&v29, &location);
    v22 = objc_msgSend(v20, "initWithMode:queue:delay:block:", 1, v21, v28, 2.0);
    updateIndexOperation = v12->_updateIndexOperation;
    v12->_updateIndexOperation = (_HKDelayedOperation *)v22;

    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v12, 0);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __71__HDConceptIndexManager_initWithConceptIndexerClass_batchSize_profile___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  void *v2;
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  char v14;
  NSObject *v15;
  os_unfair_lock_s *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t v36[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  _BYTE buf[24];
  void *v41;
  id v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v32 = (uint64_t)WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[8]);
    v3 = *(id *)(v32 + 72);
    v4 = objc_msgSend(v3, "count");
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6 = v5;
    if (v4 >= 2)
      objc_msgSend(v5, "appendString:", CFSTR("["));
    v7 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __HDStringForIndexTriggerReasons_block_invoke;
    v41 = &unk_1E6CFBCE8;
    v8 = v3;
    v42 = v8;
    objc_msgSend(v6, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v8, buf);
    if (v4 >= 2)
      objc_msgSend(v6, "appendString:", CFSTR("]"));

    objc_msgSend(*(id *)(v32 + 72), "removeAllObjects");
    v9 = v6;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v32 + 64));
    v10 = v32;
    if (*(_BYTE *)(v32 + 61))
    {
      _HKInitializeLogging();
      HKLogConceptIndex();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v32;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting concept index.", buf, 0xCu);
      }

      v12 = *(void **)(v32 + 48);
      v13 = objc_loadWeakRetained((id *)(v32 + 16));
      v35 = 0;
      v14 = objc_msgSend(v12, "resetIndexManagerStateForProfile:withError:", v13, &v35);
      v15 = v35;

      if ((v14 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogConceptIndex();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v15;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset concept index with error :%{public}@", buf, 0x16u);
        }
        goto LABEL_20;
      }
      *(_BYTE *)(v32 + 61) = 0;

      v10 = v32;
    }
    if (-[HDConceptIndexManager _computeIsEnabled](v10))
    {
      v16 = (os_unfair_lock_s *)(v32 + 56);
      os_unfair_lock_lock((os_unfair_lock_t)(v32 + 56));
      if (*(_BYTE *)(v32 + 60))
      {
        os_unfair_lock_unlock(v16);
        _HKInitializeLogging();
        HKLogConceptIndex();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

        if (!v18)
        {
LABEL_22:

          v2 = (void *)v32;
          goto LABEL_23;
        }
        HKLogConceptIndex();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v32;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_INFO, "%{public}@: Skipping scheduling of indexing operation, we already have a scheduled operation.", buf, 0xCu);
        }
      }
      else
      {
        *(_BYTE *)(v32 + 60) = 1;
        os_unfair_lock_unlock(v16);
        objc_msgSend(*(id *)(v32 + 32), "invalidate");
        v34 = 0;
        -[HDConceptIndexManager _takeAssertionWithError:](v32, &v34);
        v20 = objc_claimAutoreleasedReturnValue();
        v15 = v34;
        v21 = *(void **)(v32 + 32);
        *(_QWORD *)(v32 + 32) = v20;

        v22 = v32;
        if (!*(_QWORD *)(v32 + 32))
        {
          _HKInitializeLogging();
          HKLogConceptIndex();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            -[NSObject localizedDescription](v15, "localizedDescription");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v31;
            _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Was not able to take out initial acessibility assertion with error %{public}@. Proceeding to schedule indexing work, and try to take assertion later.", buf, 0x16u);

          }
          v22 = v32;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Indexing operation with reason %@"), v22, v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v7;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke;
        v41 = &unk_1E6CFBC98;
        v42 = (id)v32;
        v25 = v9;
        v43 = v25;
        v33[0] = v7;
        v33[1] = 3221225472;
        v33[2] = __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke_2;
        v33[3] = &unk_1E6CE9B90;
        v33[4] = v32;
        +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:canceledBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:canceledBlock:", v24, buf, v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        HKLogConceptIndex();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v36 = 138543618;
          v37 = v32;
          v38 = 2114;
          v39 = v25;
          _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling Indexing operation on maintenance coordinator with reason: %{public}@", v36, 0x16u);
        }

        v28 = objc_loadWeakRetained((id *)(v32 + 16));
        objc_msgSend(v28, "daemon");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "maintenanceWorkCoordinator");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "enqueueMaintenanceOperation:", v26);

      }
LABEL_21:

      goto LABEL_22;
    }
    v15 = _Block_copy(*(const void **)(v32 + 104));
    if (!v15)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 119, CFSTR("Concept Index manager is not enabled and wont perform any work."));
    v19 = objc_claimAutoreleasedReturnValue();
    ((void (*)(NSObject *, _QWORD, _QWORD, NSObject *))v15[2].isa)(v15, 0, 0, v19);
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:

}

- (void)resetWithReindex
{
  NSObject *delayedOperationQueue;
  _QWORD block[5];

  delayedOperationQueue = self->_delayedOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HDConceptIndexManager_resetWithReindex__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(delayedOperationQueue, block);
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Post-Reset Indexing"));
}

uint64_t __41__HDConceptIndexManager_resetWithReindex__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 61))
    *(_BYTE *)(v1 + 61) = 1;
  return result;
}

- (uint64_t)_canAutomaticallyScheduleConceptIndexing
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (id *)(result + 16);
    WeakRetained = objc_loadWeakRetained((id *)(result + 16));
    objc_msgSend(WeakRetained, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "healthAppNotInstalled");

    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "performsAutomaticConceptIndexing") & 1) != 0)
    {
      if (*(_BYTE *)(v1 + 96))
        v10 = 1;
      else
        v10 = v6;

      if (v10 != 1)
        return 1;
    }
    else
    {

    }
    _HKInitializeLogging();
    HKLogConceptIndex();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HKStringFromBool();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained(v2);
      objc_msgSend(v13, "daemon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "behavior");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performsAutomaticConceptIndexing");
      HKStringFromBool();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKStringFromBool();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v1;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot automatically schedule concept indexing. Health App Installed %{public}@, performsAutomaticConceptIndexing %{public}@, ignoresAutomaticProcessingTriggers %{public}@", (uint8_t *)&v18, 0x2Au);

    }
    return 0;
  }
  return result;
}

- (void)_dispatchDelayedOperationWithReason:(uint64_t)a1
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
    v5 = *(NSObject **)(a1 + 64);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__HDConceptIndexManager__dispatchDelayedOperationWithReason___block_invoke;
    v6[3] = &unk_1E6CE8080;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

- (void)invalidateAndWait
{
  void *v3;
  id WeakRetained;

  atomic_store(1u, (unsigned __int8 *)&self->_isInvalidated);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "ontologyDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeOntologyDatabaseAvailabilityObserver:", self);

}

- (unint64_t)currentExecutionState
{
  os_unfair_lock_s *p_stateLock;
  unint64_t v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_hasScheduledIndexing)
    v4 = 2;
  else
    v4 = 1;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  -[HDConceptIndexManager _setObservationForDataManager:]((uint64_t)self, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProtectedDataObserver:", self);

  -[_HKDelayedOperation invalidate](self->_updateIndexOperation, "invalidate");
  -[HDAssertion invalidate](self->_preparedDatabaseAccessibilityAssertion, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)HDConceptIndexManager;
  -[HDConceptIndexManager dealloc](&v5, sel_dealloc);
}

- (void)_setObservationForDataManager:(uint64_t)a1
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (id *)(a1 + 16);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "daemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "behavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "futureMigrationsEnabled"))
      v8 = 8;
    else
      v8 = 0;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(MEMORY[0x1E0CB6B00], "medicalRecordTypesWithOptions:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v15 = objc_loadWeakRetained(v4);
          objc_msgSend(v15, "dataManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (a2)
            objc_msgSend(v16, "addObserver:forDataType:", a1, v14);
          else
            objc_msgSend(v16, "removeObserver:forDataType:", a1, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
}

- (void)addObserver:(id)a3
{
  HKObserverSet *observerSet;
  id v5;
  HKObserverSet *v6;
  _QWORD v7[5];

  observerSet = self->_observerSet;
  v5 = a3;
  -[HKObserverSet registerObserver:](observerSet, "registerObserver:", v5);
  v6 = self->_observerSet;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HDConceptIndexManager_addObserver___block_invoke;
  v7[3] = &unk_1E6CFBC50;
  v7[4] = self;
  -[HKObserverSet notifyObserver:handler:](v6, "notifyObserver:handler:", v5, v7);

}

void __37__HDConceptIndexManager_addObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "conceptIndexManagerDidChangeExecutionState:", objc_msgSend(v2, "currentExecutionState"));

}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observerSet, "unregisterObserver:", a3);
}

uint64_t __60__HDConceptIndexManager__notifyObserversWithExecutionState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conceptIndexManagerDidChangeExecutionState:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_computeIsEnabled
{
  unsigned __int8 v2;
  NSObject *WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL8 v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = atomic_load((unsigned __int8 *)(a1 + 40));
    if ((v2 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      -[NSObject daemon](WeakRetained, "daemon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "behavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "supportsOntology");

      if ((v6 & 1) != 0)
      {
        -[NSObject daemon](WeakRetained, "daemon");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "behavior");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "ontologyIndexingEnabled");

        _HKInitializeLogging();
        if ((v9 & 1) != 0)
        {
          HKLogHealthOntology();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = 1;
          v12 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

          if (v12)
          {
            HKLogHealthOntology();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v20 = 138543362;
              v21 = a1;
              _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "%{public}@: Concept Indexing Is Enabled", (uint8_t *)&v20, 0xCu);
            }
            goto LABEL_21;
          }
LABEL_22:

          return v11;
        }
        HKLogConceptIndex();
        v18 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

        if (!v11)
          goto LABEL_22;
        HKLogConceptIndex();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v20 = 138543362;
          v21 = a1;
          v17 = "%{public}@: Indexing not enabled: behavior for indexing disabled";
          goto LABEL_19;
        }
      }
      else
      {
        _HKInitializeLogging();
        HKLogConceptIndex();
        v16 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

        if (!v11)
          goto LABEL_22;
        HKLogConceptIndex();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v20 = 138543362;
          v21 = a1;
          v17 = "%{public}@: Indexing not enabled: behavior does not support ontology";
LABEL_19:
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v20, 0xCu);
        }
      }
      v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    _HKInitializeLogging();
    HKLogConceptIndex();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      HKLogConceptIndex();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
      {
        v20 = 138543362;
        v21 = a1;
        _os_log_impl(&dword_1B7802000, WeakRetained, OS_LOG_TYPE_INFO, "%{public}@: Indexing is not enabled: either ontology is currently updating, or the index manager has been invalidated.", (uint8_t *)&v20, 0xCu);
      }
      v11 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

- (id)_takeAssertionWithError:(uint64_t)a1
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v11, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v9, &v19, 300.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (!v12)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      HKLogHealthOntology();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "localizedDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = a1;
        v22 = 2114;
        v23 = v17;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "%{public}@: unable to take accessibility assertion with error: %{public}@.", buf, 0x16u);

      }
    }
  }
  if (a2)
    *a2 = objc_retainAutorelease(v13);

  return v12;
}

void __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = a2;
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", *(_QWORD *)(a1 + 32), CFSTR("indexing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_updateConceptIndexWithReason:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    -[HDConceptIndexManager _clearHasScheduledIndexing](*(_QWORD *)(a1 + 32));
    v4 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 112));
    v5 = v4;
    if (v4)
      (*((void (**)(void *))v4 + 2))(v4);

  }
  v6[2]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  objc_msgSend(v3, "invalidate");

}

- (void)_clearHasScheduledIndexing
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) = 0;
    os_unfair_lock_unlock(v2);
  }
}

void __85__HDConceptIndexManager__delayedOperationQueue_scheduleConceptIndexUpdateWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(void);

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = a2;
  objc_msgSend(v2, "invalidate");
  v3[2]();

}

- (BOOL)_updateConceptIndexWithReason:(id)a3
{
  id v4;
  HDAssertion *v5;
  HDAssertion *preparedDatabaseAccessibilityAssertion;
  id v7;
  HKObserverSet *observerSet;
  uint64_t v9;
  HDMutableDatabaseTransactionContext *v10;
  NSObject *v11;
  double Current;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t batchSize;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  HKObserverSet *v31;
  HKObserverSet *v32;
  HDAssertion *v34;
  void *v35;
  HDMutableDatabaseTransactionContext *v36;
  _QWORD v37[6];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD v44[5];
  _BYTE buf[24];
  void *v46;
  _BYTE v47[20];
  __int16 v48;
  double v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_preparedDatabaseAccessibilityAssertion;
  preparedDatabaseAccessibilityAssertion = self->_preparedDatabaseAccessibilityAssertion;
  self->_preparedDatabaseAccessibilityAssertion = 0;

  if (v5)
  {
    v7 = 0;
LABEL_4:
    observerSet = self->_observerSet;
    v9 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __60__HDConceptIndexManager__notifyObserversWithExecutionState___block_invoke;
    v46 = &__block_descriptor_40_e41_v16__0___HDConceptIndexManagerObserver__8l;
    *(_QWORD *)v47 = 2;
    -[HKObserverSet notifyObservers:](observerSet, "notifyObservers:", buf);
    v10 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    -[HDMutableDatabaseTransactionContext setCacheScope:](v10, "setCacheScope:", 1);
    -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v10, "addAccessibilityAssertion:", v5);
    _HKInitializeLogging();
    HKLogConceptIndex();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning concept indexing with reason: %{public}@.", buf, 0x16u);
    }

    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke;
    v37[3] = &unk_1E6CF1288;
    v37[4] = self;
    v37[5] = &v39;
    v38 = v7;
    v15 = objc_msgSend(v14, "performWithTransactionContext:error:block:", v10, &v38, v37);
    v16 = v38;

    v17 = v40[3];
    batchSize = self->_batchSize;
    if (v17 % batchSize)
      v19 = v17 / batchSize + 1;
    else
      v19 = v17 / batchSize;
    _HKInitializeLogging();
    HKLogConceptIndex();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v10;
      v21 = v15;
      v22 = v4;
      v23 = v21;
      if ((_DWORD)v21)
        v24 = CFSTR("Success");
      else
        v24 = CFSTR("Failure");
      v25 = (void *)v40[3];
      v26 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v16, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2048;
      v46 = v25;
      *(_WORD *)v47 = 2048;
      *(_QWORD *)&v47[2] = v19;
      *(_WORD *)&v47[10] = 2114;
      v4 = v22;
      *(_QWORD *)&v47[12] = v22;
      v48 = 2048;
      v49 = v26 - Current;
      v50 = 2114;
      v51 = v27;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ indexing %ld records in %ld batches with reason %{public}@, duration: %.3f seconds, Error: %{public}@", buf, 0x48u);

      v9 = MEMORY[0x1E0C809B0];
      v15 = v23;
      v10 = v36;
    }

    v28 = v40[3];
    v7 = v16;
    v29 = _Block_copy(self->_unitTesting_conceptIndexManagerDidFinish);
    v30 = v29;
    if (v29)
      (*((void (**)(void *, uint64_t, uint64_t, id))v29 + 2))(v29, v15, v28, v7);
    v31 = self->_observerSet;
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __90__HDConceptIndexManager__notifyObserversBecameIdleWithSampleProcessedCount_success_error___block_invoke;
    v46 = &unk_1E6CFBCC0;
    *(_QWORD *)v47 = self;
    *(_QWORD *)&v47[8] = v28;
    -[HKObserverSet notifyObservers:](v31, "notifyObservers:", buf, v36);
    v32 = self->_observerSet;
    v44[0] = v9;
    v44[1] = 3221225472;
    v44[2] = __60__HDConceptIndexManager__notifyObserversWithExecutionState___block_invoke;
    v44[3] = &__block_descriptor_40_e41_v16__0___HDConceptIndexManagerObserver__8l;
    v44[4] = 1;
    -[HKObserverSet notifyObservers:](v32, "notifyObservers:", v44);

    -[HDAssertion invalidate](v5, "invalidate");
    _Block_object_dispose(&v39, 8);
    goto LABEL_17;
  }
  v43 = 0;
  -[HDConceptIndexManager _takeAssertionWithError:]((uint64_t)self, &v43);
  v5 = (HDAssertion *)objc_claimAutoreleasedReturnValue();
  v7 = v43;
  if (v5)
    goto LABEL_4;
  v34 = (HDAssertion *)_Block_copy(self->_unitTesting_conceptIndexManagerDidFinish);
  v5 = v34;
  if (v34)
    ((void (*)(HDAssertion *, _QWORD, _QWORD, id))v34->_state)(v34, 0, 0, v7);
  _HKInitializeLogging();
  HKLogConceptIndex();
  v10 = (HDMutableDatabaseTransactionContext *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "localizedDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v35;
    _os_log_error_impl(&dword_1B7802000, &v10->super.super, OS_LOG_TYPE_ERROR, "%{public}@: Was not able to take out inner acessibility assertion with error %{public}@. Cannot perform concept index work.", buf, 0x16u);

  }
  LOBYTE(v15) = 0;
LABEL_17:

  return v15;
}

uint64_t __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  double Current;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  const __CFString *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke_2;
  v30[3] = &unk_1E6CE8D70;
  v30[4] = *(_QWORD *)(a1 + 32);
  v30[5] = &v31;
  v6 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicalRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v5, a2, v30);

  if (v6)
  {
    if (*((_BYTE *)v32 + 24))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      v9 = *(_QWORD *)(v7 + 8);
      v10 = objc_loadWeakRetained((id *)(v7 + 16));
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = v10;
      v29 = objc_opt_self();
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v35 = 0;
        Current = CFAbsoluteTimeGetCurrent();
        _HKInitializeLogging();
        HKLogConceptIndex();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (v16)
        {
          HKLogConceptIndex();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v37 = v29;
            v38 = 2048;
            v39 = v12;
            _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "%{public}@: Start concept indexing batch %ld", buf, 0x16u);
          }

        }
        v18 = objc_msgSend(v8, "indexSamplesForProfile:limit:outIndexedSamplesCount:error:", v11, v9, &v35, a2);
        v19 = v35;
        _HKInitializeLogging();
        HKLogConceptIndex();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

        if (v21)
        {
          HKLogConceptIndex();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = v35;
            v24 = CFAbsoluteTimeGetCurrent();
            v25 = CFSTR("Failure");
            if ((_DWORD)v18)
              v25 = CFSTR("Success");
            *(_DWORD *)buf = 138544386;
            v37 = v29;
            v38 = 2112;
            v39 = v25;
            v40 = 2048;
            v41 = v12;
            v42 = 2048;
            v43 = v23;
            v44 = 2048;
            v45 = v24 - Current;
            _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_INFO, "%{public}@: %@ concept indexing batch %ld (%ld) in %0.3f", buf, 0x34u);
          }

        }
        v13 += v19;
        if ((v18 & 1) == 0)
          break;
        if (v35 < v9)
        {
          objc_msgSend(v11, "conceptIndexManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDConceptIndexManager _clearHasScheduledIndexing]((uint64_t)v26);

          break;
        }
        v12 = (const __CFString *)((char *)v12 + 1);
      }
      *(_QWORD *)(v28 + 24) = v13;

    }
    else
    {
      -[HDConceptIndexManager _clearHasScheduledIndexing](*(_QWORD *)(a1 + 32));
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v31, 8);
  return v18;
}

BOOL __55__HDConceptIndexManager__updateConceptIndexWithReason___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = v6;
  v9 = WeakRetained;
  v10 = objc_opt_self();
  objc_msgSend(v9, "conceptIndexManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(WeakRetained) = -[HDConceptIndexManager _computeIsEnabled]((uint64_t)v11);
  if ((WeakRetained & 1) != 0)
  {
    objc_msgSend(v8, "protectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[HDDataEntity anyInDatabase:predicate:error:](HDMedicalRecordEntity, "anyInDatabase:predicate:error:", v12, 0, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    if (v13)
    {
      v15 = 1;
    }
    else
    {
      _HKInitializeLogging();
      HKLogConceptIndex();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[NSObject localizedDescription](v14, "localizedDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v22 = v10;
          v23 = 2112;
          v24 = v19;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Error when determining if concept index manager should schedule work: %@", buf, 0x16u);

        }
        if (a3)
        {
          v15 = 0;
          *a3 = objc_retainAutorelease(v14);
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v10;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Should not proceed with updating concept index because there are no medical records in the database", buf, 0xCu);
        }

        v15 = 2;
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    HKLogConceptIndex();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Should not proceed with updating concept index because index manager is not enabled", buf, 0xCu);
    }
    v15 = 2;
  }

  if (v15 == 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return v15 != 0;
}

uint64_t __90__HDConceptIndexManager__notifyObserversBecameIdleWithSampleProcessedCount_success_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conceptIndexManagerDidBecomeQuiescent:samplesProcessedCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__HDConceptIndexManager__dispatchDelayedOperationWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (_HDIsUnitTesting)
    v3 = *(double *)(v2 + 88);
  else
    v3 = 2.0;
  return objc_msgSend(*(id *)(v2 + 80), "executeWithDelay:", v3);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Samples Added"));
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Samples Removed"));
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
      -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Protected Data Became Available"));
  }
}

- (void)accountExistenceNotifier:(id)a3 didChangeHealthRecordAccountExistence:(BOOL)a4
{
  if (a4)
  {
    if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
      -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Account Existence Notified"));
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addProtectedDataObserver:", self);

  v7 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v7, "ontologyDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOntologyDatabaseAvailabilityObserver:", self);

  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "healthRecordsAccountExistenceNotifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAccountExistenceObserver:", self);

  v11 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v11, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ontologyUpdateCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "importer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOntologyShardImporterObserver:queue:", self, 0);

  -[HDConceptIndexManager _setObservationForDataManager:]((uint64_t)self, 1);
  if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
    -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Daemon Ready"));
}

- (void)ontologyDatabase:(id)a3 didBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    if (-[HDConceptIndexManager _canAutomaticallyScheduleConceptIndexing]((uint64_t)self))
      -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, CFSTR("Ontology did become available"));
  }
}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  HDConceptIndexManager *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "schemaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB5750]);

  if (v7)
  {
    _HKInitializeLogging();
    HKLogConceptIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v9;
      v14 = 2048;
      v15 = objc_msgSend(v5, "availableVersion");
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Request reset concept index due to importing %{public}@ %ld", (uint8_t *)&v10, 0x20u);

    }
    -[HDConceptIndexManager resetWithReindex](self, "resetWithReindex");
  }

}

- (void)unitTest_scheduleUpdateWithDescription:(id)a3
{
  -[HDConceptIndexManager _dispatchDelayedOperationWithReason:]((uint64_t)self, a3);
}

- (BOOL)performanceTest_triggerConceptIndexing
{
  return -[HDConceptIndexManager _updateConceptIndexWithReason:](self, "_updateConceptIndexWithReason:", CFSTR("Performance Testing"));
}

- (void)unitTest_debounceUpdateDelayOverride:(double)a3
{
  self->_conceptIndexUpdateDebounceIntervalOverride = a3;
}

- (void)unitTest_setHasScheduledIndexing:(BOOL)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_hasScheduledIndexing = a3;
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)unitTest_hasScheduledIndexing
{
  HDConceptIndexManager *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_hasScheduledIndexing;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)ignoresAutomaticProcessingTriggers
{
  return self->_ignoresAutomaticProcessingTriggers;
}

- (void)setIgnoresAutomaticProcessingTriggers:(BOOL)a3
{
  self->_ignoresAutomaticProcessingTriggers = a3;
}

- (id)unitTesting_conceptIndexManagerDidFinish
{
  return self->_unitTesting_conceptIndexManagerDidFinish;
}

- (void)setUnitTesting_conceptIndexManagerDidFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)unitTesting_scheduledConceptIndexWorkDidFailAndClearState
{
  return self->_unitTesting_scheduledConceptIndexWorkDidFailAndClearState;
}

- (void)setUnitTesting_scheduledConceptIndexWorkDidFailAndClearState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_scheduledConceptIndexWorkDidFailAndClearState, 0);
  objc_storeStrong(&self->_unitTesting_conceptIndexManagerDidFinish, 0);
  objc_storeStrong((id *)&self->_updateIndexOperation, 0);
  objc_storeStrong((id *)&self->_cachedReasonsForReindex, 0);
  objc_storeStrong((id *)&self->_delayedOperationQueue, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
