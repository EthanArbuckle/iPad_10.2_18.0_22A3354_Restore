@implementation HDUserDomainConceptProcessingManager

- (HDUserDomainConceptProcessingManager)init
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

- (HDUserDomainConceptProcessingManager)initWithProfile:(id)a3
{
  id v4;
  HDUserDomainConceptProcessingManager *v5;
  HDUserDomainConceptProcessingManager *v6;
  HDAssertion *databaseAssertion;
  id WeakRetained;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDUserDomainConceptProcessingManager;
  v5 = -[HDUserDomainConceptProcessingManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_hasScheduledProcessing = 0;
    *(int64x2_t *)&v6->_batchSize = vdupq_n_s64(0x32uLL);
    databaseAssertion = v6->_databaseAssertion;
    v6->_databaseAssertion = 0;

    atomic_store(0, (unsigned __int8 *)&v6->_isDisabledForHealthDaemonLifetime);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "ontologyDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOntologyDatabaseAvailabilityObserver:", self);

  objc_msgSend(v11, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ontologyUpdateCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOntologyShardImporterObserver:queue:", self, 0);

  objc_msgSend(v11, "userDomainConceptManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUserDomainConceptObserver:queue:", self, 0);

  objc_msgSend(v11, "ontologyDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isAvailable");

  if ((_DWORD)v6)
  {
    objc_msgSend(v11, "ontologyDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDUserDomainConceptProcessingManager ontologyDatabase:didBecomeAvailable:](self, "ontologyDatabase:didBecomeAvailable:", v10, 1);

  }
}

- (void)ontologyDatabase:(id)a3 didBecomeAvailable:(BOOL)a4
{
  if (a4)
    -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationIfEnabledWithReason:]((uint64_t)self, CFSTR("Ontology Became Available"));
}

- (void)_scheduleProcessingOperationIfEnabledWithReason:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "healthAppNotInstalled");

    v7 = atomic_load((unsigned __int8 *)(a1 + 56));
    v8 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v8, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "performsAutomaticUserDomainConceptProcessing") && !*(_BYTE *)(a1 + 57))
    {

      if (((v6 | v7) & 1) == 0)
      {
        -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationWithReason:](a1, v19);
        goto LABEL_8;
      }
    }
    else
    {

    }
    _HKInitializeLogging();
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HKStringFromBool();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v13, "daemon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "behavior");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performsAutomaticUserDomainConceptProcessing");
      HKStringFromBool();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKStringFromBool();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HKStringFromBool();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v21 = a1;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot automatically schedule UDC processing. Health App Installed %{public}@, performsAutomaticUserDomainConceptProcessing %{public}@, ignoresAutomaticProcessingTriggers %{public}@, _isDisabledForHealthDaemonLifetime %{public}@", buf, 0x34u);

    }
  }
LABEL_8:

}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "schemaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5750]);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Ontology Imported %@ %ld"), v8, objc_msgSend(v10, "availableVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationIfEnabledWithReason:]((uint64_t)self, v9);
  }

}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationIfEnabledWithReason:]((uint64_t)self, CFSTR("User domain concepts added"));
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationIfEnabledWithReason:]((uint64_t)self, CFSTR("User domain concepts updated"));
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  HDAssertion *databaseAssertion;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  databaseAssertion = self->_databaseAssertion;
  if (databaseAssertion)
    -[HDAssertion invalidate](databaseAssertion, "invalidate");
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)HDUserDomainConceptProcessingManager;
  -[HDUserDomainConceptProcessingManager dealloc](&v5, sel_dealloc);
}

- (void)_scheduleProcessingOperationWithReason:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(_BYTE *)(a1 + 32))
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (v5)
      {
        HKLogHealthOntology();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          CFAbsoluteTimeGetCurrent();
          HKDiagnosticStringFromDuration();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = a1;
          v37 = 2114;
          v38 = v7;
          _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@: Already scheduled processing %{public}@ ago", buf, 0x16u);

        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      *(_BYTE *)(a1 + 32) = 1;
      *(CFAbsoluteTime *)(a1 + 40) = CFAbsoluteTimeGetCurrent();
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      v8 = *(void **)(a1 + 48);
      if (v8)
      {
        v9 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "database");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v17, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v15, &v34, 300.0);
        v18 = objc_claimAutoreleasedReturnValue();
        v9 = v34;
        v19 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v18;

        v8 = *(void **)(a1 + 48);
      }
      v20 = v8;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v20)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __79__HDUserDomainConceptProcessingManager__scheduleProcessingOperationWithReason___block_invoke;
        v31[3] = &unk_1E6CF6E20;
        v31[4] = a1;
        v21 = v3;
        v32 = v21;
        v33 = v20;
        +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", v21, v31);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        HKLogHealthOntology();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v36 = a1;
          v37 = 2114;
          v38 = v21;
          _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling User Domain Concept processing on maintenance coordinator with reason: %{public}@", buf, 0x16u);
        }

        v24 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v24, "daemon");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "maintenanceWorkCoordinator");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "enqueueMaintenanceOperation:", v22);

      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

        if (v28)
        {
          HKLogHealthOntology();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "localizedDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = a1;
            v37 = 2114;
            v38 = v30;
            _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_INFO, "%{public}@: unable to take accessibility assertion with error: %{public}@.", buf, 0x16u);

          }
        }
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        *(_BYTE *)(a1 + 32) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }

    }
  }

}

void __79__HDUserDomainConceptProcessingManager__scheduleProcessingOperationWithReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(void);

  v7 = a2;
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", *(_QWORD *)(a1 + 32), CFSTR("processing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[HDUserDomainConceptProcessingManager _processUserDomainConceptsWithReason:accessibilityAssertion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48)) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v4 + 8));
      *(_BYTE *)(v4 + 32) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
    }
  }
  v7[2]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v3, "invalidate");

}

- (uint64_t)_processUserDomainConceptsWithReason:(void *)a3 accessibilityAssertion:
{
  __CFString *v5;
  id v6;
  unsigned __int8 v7;
  HDMutableDatabaseTransactionContext *v8;
  NSObject *v9;
  double Current;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  HDMutableDatabaseTransactionContext *v32;
  id v34;
  _QWORD v35[7];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  double v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = atomic_load((unsigned __int8 *)(a1 + 56));
    if ((v7 & 1) != 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v46 = a1;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "%{public}@: User Domain Concept Processing has been disabled for the reamining lifecycle of healthd, since we detected a non-terminating condition while processing in a previous run.", buf, 0xCu);
      }

      v32 = (HDMutableDatabaseTransactionContext *)_Block_copy(*(const void **)(a1 + 72));
      v8 = v32;
      if (v32)
        ((void (*)(HDMutableDatabaseTransactionContext *, uint64_t, _QWORD, _QWORD))v32->super._cacheScope)(v32, 1, 0, 0);
      v15 = 1;
    }
    else
    {
      v8 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext setCacheScope:](v8, "setCacheScope:", 1);
      if (v6)
        -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v8, "addAccessibilityAssertion:", v6);
      _HKInitializeLogging();
      HKLogHealthOntology();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v46 = a1;
        v47 = 2114;
        v48 = v5;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning processing of user domain concepts with reason: %{public}@.", buf, 0x16u);
      }

      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 0;
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend((id)a1, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userDomainConceptManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openObserverTransaction");

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(WeakRetained, "database");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __100__HDUserDomainConceptProcessingManager__processUserDomainConceptsWithReason_accessibilityAssertion___block_invoke;
      v35[3] = &unk_1E6CF6E48;
      v35[4] = a1;
      v35[5] = &v41;
      v35[6] = &v37;
      v15 = objc_msgSend(v14, "performWithTransactionContext:error:block:", v8, &v36, v35);
      v16 = v36;

      if (*((_BYTE *)v38 + 24))
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v46 = a1;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: While performing UDC procesing, detected an infinite processing loop. Disabling UDC Processing for the remainder of healthd's lifecycle.", buf, 0xCu);
        }

        atomic_store(1u, (unsigned __int8 *)(a1 + 56));
      }
      v18 = v42[3];
      v19 = *(_QWORD *)(a1 + 16);
      if (v18 % v19 <= 0)
        v20 = v18 / v19;
      else
        v20 = v18 / v19 + 1;
      _HKInitializeLogging();
      HKLogHealthOntology();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v6;
        v22 = v5;
        if ((_DWORD)v15)
          v23 = CFSTR("Success");
        else
          v23 = CFSTR("Failure");
        v24 = v42[3];
        v25 = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v16, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v46 = a1;
        v47 = 2114;
        v48 = v23;
        v49 = 2048;
        v50 = v24;
        v51 = 2048;
        v52 = v20;
        v53 = 2114;
        v5 = v22;
        v54 = v22;
        v55 = 2048;
        v56 = v25 - Current;
        v57 = 2114;
        v58 = v26;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ processing %ld user domain concepts in %ld batches with reason %{public}@, duration: %.3f seconds, Error: %{public}@", buf, 0x48u);

        v6 = v34;
      }

      objc_msgSend((id)a1, "profile");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userDomainConceptManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "closeObserverTransaction");

      v29 = _Block_copy(*(const void **)(a1 + 72));
      v30 = v29;
      if (v29)
        (*((void (**)(void *, uint64_t, uint64_t, id))v29 + 2))(v29, v15, v42[3], v16);

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __100__HDUserDomainConceptProcessingManager__processUserDomainConceptsWithReason_accessibilityAssertion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  double Current;
  void *v10;
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFAbsoluteTime v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  CFAbsoluteTime v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  v27 = *(_QWORD *)(a1[6] + 8);
  v28 = *(_QWORD *)(a1[5] + 8);
  v6 = objc_loadWeakRetained((id *)(v3 + 64));
  v31 = objc_opt_self();
  v32 = v6;
  objc_msgSend(v6, "userDomainConceptManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyValueDomain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = -1;
  while (1)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v32, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __169__HDUserDomainConceptProcessingManager__performUserDomainConceptProcessingOperationWithBatchSize_batchLimit_outNumberOfConceptsProcessed_outDidDetectLoop_profile_error___block_invoke;
    v33[3] = &unk_1E6CF6E70;
    v36 = &v46;
    v11 = v30;
    v39 = v31;
    v34 = v11;
    v37 = v45;
    v12 = v32;
    v40 = v5;
    v35 = v12;
    v38 = &v41;
    v13 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, a2, v33);

    if (!v13)
    {
      *(_QWORD *)(v28 + 24) = v8;

      _Block_object_dispose(&v41, 8);
      goto LABEL_16;
    }
    v14 = v42[3];
    _HKInitializeLogging();
    HKLogHealthOntology();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v8;
      v16 = v11;
      v17 = v12;
      v18 = v13;
      v19 = v4;
      v20 = a2;
      v21 = v47[3];
      v22 = v42[3];
      v23 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138544386;
      v51 = v31;
      v52 = 2048;
      v53 = v21;
      v54 = 2048;
      v55 = v22;
      v56 = 2048;
      v57 = v5;
      v58 = 2048;
      v59 = v23 - Current;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished batch %ld of size %ld / %lld. Duration: %.3f seconds", buf, 0x34u);
      a2 = v20;
      v4 = v19;
      v13 = v18;
      v12 = v17;
      v11 = v16;
      v8 = v29;
    }

    v8 += v14;
    v24 = v47[3] >= v4 && v14 >= v5;
    if (v24)
      break;

    _Block_object_dispose(&v41, 8);
    if (v14 < v5)
      goto LABEL_15;
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v31;
    _os_log_fault_impl(&dword_1B7802000, v25, OS_LOG_TYPE_FAULT, "%{public}@: Reached batch limit during UDC Processing. This usually happens during an infinite processing loop.", buf, 0xCu);
  }

  _Block_object_dispose(&v41, 8);
LABEL_15:
  *(_BYTE *)(v27 + 24) = v24;
  *(_QWORD *)(v28 + 24) = v8;
LABEL_16:
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);

  return v13;
}

uint64_t __169__HDUserDomainConceptProcessingManager__performUserDomainConceptProcessingOperationWithBatchSize_batchLimit_outNumberOfConceptsProcessed_outDidDetectLoop_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v3;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HDUserDomainConceptProcessingState *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BYTE buf[12];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  +[HDUserDomainConceptProcessingState fetchFromKeyValueDomain:error:](HDUserDomainConceptProcessingState, "fetchFromKeyValueDomain:error:", *(_QWORD *)(a1 + 32), a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (id)v7;
    _HKInitializeLogging();
    HKLogHealthOntology();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 72);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      v33 = 2048;
      v34 = v11;
      v35 = 2114;
      v36 = v8;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Start batch %ld, current state %{public}@", buf, 0x20u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "anchor");
    objc_msgSend(*(id *)(a1 + 40), "ontologyDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ontologyContentVersionWithError:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    +[HDUserDomainConceptProcessingManager _maximumSyncAnchorForUserDomainConceptsWithTransaction:error:](*(_QWORD *)(a1 + 72), v6, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_24;
    objc_msgSend(v8, "ontologyVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v15)
      goto LABEL_13;
    objc_msgSend(v8, "ontologyVersion");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_16:
      v18 = v15;
      goto LABEL_17;
    }
    v3 = (void *)v16;
    objc_msgSend(v8, "ontologyVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqual:"))
    {
LABEL_13:
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != -1
        && objc_msgSend(v8, "maximumPropertyType") >= 180000)
      {
        v29 = objc_msgSend(v14, "longLongValue");
        v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v13 == v15)
        {

        }
        else
        {

        }
        if (v29 >= v30)
        {
LABEL_19:
          *(_QWORD *)buf = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          if (+[HDUserDomainConceptProcessor processUserDomainConceptsAfter:transactionLimit:outAnchor:outProcessedConceptsCount:profile:transaction:error:](HDUserDomainConceptProcessor, "processUserDomainConceptsAfter:transactionLimit:outAnchor:outProcessedConceptsCount:profile:transaction:error:", a3))
          {
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= *(_QWORD *)(a1 + 80))
            {
              v28 = (void *)objc_msgSend(v8, "copyByUpdatingAnchor:", *(_QWORD *)buf);

              v17 = objc_msgSend(v28, "persistInKeyValueDomain:error:", *(_QWORD *)(a1 + 32), a3);
              v8 = v28;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 40), "userDomainConceptManager");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "processingManager");
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = *(void **)(a1 + 32);
              v8 = v8;
              v23 = v22;
              if (v21)
              {
                v24 = v6;
                os_unfair_lock_lock((os_unfair_lock_t)(v21 + 8));
                *(_BYTE *)(v21 + 32) = 0;
                os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 8));
                +[HDUserDomainConceptProcessingManager _maximumSyncAnchorForUserDomainConceptsWithTransaction:error:]((uint64_t)HDUserDomainConceptProcessingManager, v24, a3);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25)
                {
                  v26 = (void *)objc_msgSend(v8, "copyByUpdatingAnchor:", objc_msgSend(v25, "longLongValue"));
                  v17 = objc_msgSend(v26, "persistInKeyValueDomain:error:", v23, a3);

                }
                else
                {
                  v17 = 0;
                }

              }
              else
              {
                v17 = 0;
              }

            }
            goto LABEL_25;
          }
LABEL_24:
          v17 = 0;
LABEL_25:

          goto LABEL_26;
        }
LABEL_18:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v19 = -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:]([HDUserDomainConceptProcessingState alloc], "initWithAnchor:ontologyVersion:maximumPropertyType:", 0, v13, 180000);

        v8 = v19;
        goto LABEL_19;
      }
      v18 = v13;
      if (v13 == v15)
      {
LABEL_17:

        goto LABEL_18;
      }
    }

    goto LABEL_16;
  }
  v17 = 0;
LABEL_27:

  return v17;
}

+ (id)_maximumSyncAnchorForUserDomainConceptsWithTransaction:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  +[HDSQLiteEntity maxValueForProperty:predicate:database:error:](HDUserDomainConceptEntity, "maxValueForProperty:predicate:database:error:", CFSTR("sync_anchor"), 0, v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (!v6)
  {
    if (v7)
    {
      v6 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      v6 = &unk_1E6DFC368;
    }
  }

  return v6;
}

- (void)unitTesting_triggerUserDomainConceptProcessing
{
  -[HDUserDomainConceptProcessingManager _processUserDomainConceptsWithReason:accessibilityAssertion:]((uint64_t)self, CFSTR("Unit Testing Trigger"), 0);
}

- (void)unitTesting_overrideDefaultBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (void)unitTesting_overrideDefaultBatchLimit:(int64_t)a3
{
  self->_batchLimit = a3;
}

- (void)unitTesting_scheduleUserDomainConceptProcessing
{
  -[HDUserDomainConceptProcessingManager _scheduleProcessingOperationWithReason:]((uint64_t)self, CFSTR("Unit Testing Trigger"));
}

- (void)setUnitTesting_userDomainConceptProcessingManagerDidFinishProcessing:(id)a3
{
  void *v4;
  id unitTesting_userDomainConceptProcessingManagerDidFinishProcessing;

  v4 = (void *)objc_msgSend(a3, "copy");
  unitTesting_userDomainConceptProcessingManagerDidFinishProcessing = self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing;
  self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing = v4;

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (BOOL)ignoresAutomaticProcessingTriggers
{
  return self->_ignoresAutomaticProcessingTriggers;
}

- (void)setIgnoresAutomaticProcessingTriggers:(BOOL)a3
{
  self->_ignoresAutomaticProcessingTriggers = a3;
}

- (id)unitTesting_userDomainConceptProcessingManagerDidFinishProcessing
{
  return self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_userDomainConceptProcessingManagerDidFinishProcessing, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseAssertion, 0);
}

@end
