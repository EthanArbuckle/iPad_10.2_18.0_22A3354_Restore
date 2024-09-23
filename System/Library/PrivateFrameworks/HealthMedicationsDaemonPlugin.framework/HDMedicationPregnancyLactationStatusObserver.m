@implementation HDMedicationPregnancyLactationStatusObserver

- (HDMedicationPregnancyLactationStatusObserver)initWithProfile:(id)a3
{
  id v4;
  HDMedicationPregnancyLactationStatusObserver *v5;
  HDMedicationPregnancyLactationStatusObserver *v6;
  id v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationPregnancyLactationStatusObserver;
  v5 = -[HDMedicationPregnancyLactationStatusObserver init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_profile, v4);
    atomic_store(0, (unsigned __int8 *)&v6->_shouldAttemptToDeletePregnancyDismissedInteractions);
    atomic_store(1u, (unsigned __int8 *)&v6->_shouldQueryLactationSampleToDeleteDismissedInteractionsIfNeeded);
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = v7;
    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (uint64_t)doesMostRecentLactationSampleHaveDistantFutureEndDateWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4900]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D29430];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v14 = 0;
  objc_msgSend(v5, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v4, WeakRetained, 0, 0, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  v9 = v8;
  if (v9)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError();
  }

  if (v7)
  {
    objc_msgSend(v7, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
      v12 = 1;
    else
      v12 = 2;

  }
  else
  {
    v12 = 2 * (v9 == 0);
  }

  return v12;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (a4)
  {
    -[HDMedicationPregnancyLactationStatusObserver _deletePregancyInteractionsOnProtectedDataAvailabilityIfNeeded]((uint64_t)self);
    -[HDMedicationPregnancyLactationStatusObserver _deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded]((uint64_t)self);
  }
  -[HDMedicationPregnancyLactationStatusObserver _protectedDataDidBecomeAvailable:]((uint64_t)self, v4);
}

- (void)_protectedDataDidBecomeAvailable:(uint64_t)a1
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  if (a1)
  {
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 40));
    if (v4)
    {
      v5 = v4;
      v4[2](v4, a1, a2);
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
    }

  }
}

- (void)_deletePregancyInteractionsOnProtectedDataAvailabilityIfNeeded
{
  void *v2;
  unsigned __int8 v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    HKSensitiveLogItem();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = atomic_load((unsigned __int8 *)(a1 + 24));
    if ((v3 & 1) == 0)
    {
LABEL_9:

      return;
    }
    v11 = 0;
    v4 = -[HDMedicationPregnancyLactationStatusObserver _deletePregnancyInteractionsWithReason:error:](a1, CFSTR("protected data available"), (uint64_t)&v11);
    v5 = v11;
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:

        atomic_store(v4 ^ 1, (unsigned __int8 *)(a1 + 24));
        goto LABEL_9;
      }
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v2;
      v9 = v8;
      _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interaction objects", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      v14 = 2114;
      v15 = v2;
      v16 = 2114;
      v17 = v5;
      v9 = v10;
      _os_log_error_impl(&dword_1B815E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to delete %{public}@ dismissal items, error: %{public}@", buf, 0x20u);
    }

    goto LABEL_8;
  }
}

- (void)_deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded
{
  unsigned __int8 v2;
  void *v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  unsigned __int8 v8;
  _QWORD v9[5];
  id v10;

  if (a1)
  {
    v2 = atomic_load((unsigned __int8 *)(a1 + 25));
    if ((v2 & 1) != 0)
    {
      v3 = (void *)MEMORY[0x1E0D29578];
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[4] = a1;
      v10 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __111__HDMedicationPregnancyLactationStatusObserver__deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded__block_invoke;
      v9[3] = &unk_1E6DFFFA8;
      v6 = objc_msgSend(v3, "performWriteTransactionWithHealthDatabase:error:block:", v5, &v10, v9);
      v7 = v10;

      if ((v6 & 1) != 0)
        v8 = 0;
      else
        v8 = objc_msgSend(v7, "hk_isDatabaseAccessibilityError");
      atomic_store(v8, (unsigned __int8 *)(a1 + 25));

    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  HKMCPregnancyModelProvidingInterface *v10;
  HKMCPregnancyModelProvidingInterface *provider;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v18 = 138543362;
      *(_QWORD *)&v18[4] = objc_opt_class();
      v8 = *(id *)&v18[4];
      _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Profile did become ready, registering for observers", v18, 0xCu);

    }
  }
  objc_msgSend(v4, "profileExtensionsConformingToProtocol:", &unk_1EF1BD2E0, *(_OWORD *)v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (HKMCPregnancyModelProvidingInterface *)objc_claimAutoreleasedReturnValue();
  provider = self->_provider;
  self->_provider = v10;

  -[HKMCPregnancyModelProvidingInterface getPregnancyModelProvider](self->_provider, "getPregnancyModelProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerObserver:isUserInitiated:", self, 0);

  objc_msgSend(v4, "dataManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4900]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:forDataType:", self, v14);

  objc_msgSend(v4, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addProtectedDataObserver:", self);

  objc_msgSend(v4, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "isProtectedDataAvailable");
  if (v17)
    -[HDMedicationPregnancyLactationStatusObserver _deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded]((uint64_t)self);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_2))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    HKSensitiveLogItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ sample(s) added"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:]((uint64_t)self, v9);
  }
  -[HDMedicationPregnancyLactationStatusObserver _samplesWereAdded:anchor:]((uint64_t)self, v10, v6);

}

BOOL __68__HDMedicationPregnancyLactationStatusObserver_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4900]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (void)_queryAndDeleteLactationInteractionsWithReason:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  unsigned __int8 v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0D29578];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__HDMedicationPregnancyLactationStatusObserver__queryAndDeleteLactationInteractionsWithReason___block_invoke;
    v10[3] = &unk_1E6E00240;
    v10[4] = a1;
    v11 = v3;
    v7 = objc_msgSend(v4, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v12, v10);
    v8 = v12;

    if ((v7 & 1) != 0)
      v9 = 0;
    else
      v9 = objc_msgSend(v8, "hk_isDatabaseAccessibilityError");
    atomic_store(v9, (unsigned __int8 *)(a1 + 25));

  }
}

- (void)_samplesWereAdded:(void *)a3 anchor:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 48));
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a1, v8, v5);

  }
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_253))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    HKSensitiveLogItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ sample(s) removed"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:]((uint64_t)self, v9);
  }
  -[HDMedicationPregnancyLactationStatusObserver _samplesOfTypesWereRemoved:anchor:]((uint64_t)self, v10, v6);

}

BOOL __81__HDMedicationPregnancyLactationStatusObserver_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB6380];
  v3 = *MEMORY[0x1E0CB4900];
  v4 = a2;
  objc_msgSend(v2, "categoryTypeForIdentifier:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)_samplesOfTypesWereRemoved:(void *)a3 anchor:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 56));
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a1, v8, v5);

  }
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v4, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    HKSensitiveLogItem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("responding to update to new %@ state: %@"), v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v10 = -[HDMedicationPregnancyLactationStatusObserver _deletePregnancyInteractionsWithReason:error:]((uint64_t)self, v9, (uint64_t)&v21);
    v11 = v21;
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v5;
        v15 = v14;
        _os_log_impl(&dword_1B815E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interaction objects", buf, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v23 = v19;
        v24 = 2114;
        v25 = v5;
        v26 = 2114;
        v27 = v11;
        v20 = v19;
        _os_log_error_impl(&dword_1B815E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to delete %{public}@ dismissal items, error: %{public}@", buf, 0x20u);

      }
      if (objc_msgSend(v11, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        HKLogMedication();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          v18 = v17;
          _os_log_impl(&dword_1B815E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will re-attempt delete on protected data availability", buf, 0xCu);

        }
        atomic_store(1u, (unsigned __int8 *)&self->_shouldAttemptToDeletePregnancyDismissedInteractions);
      }
    }

  }
  -[HDMedicationPregnancyLactationStatusObserver _pregnancyModelWasUpdated:]((uint64_t)self, v4);

}

- (uint64_t)_deletePregnancyInteractionsWithReason:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0D29578];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__HDMedicationPregnancyLactationStatusObserver__deletePregnancyInteractionsWithReason_error___block_invoke;
    v11[3] = &unk_1E6E00240;
    v11[4] = a1;
    v12 = v5;
    v9 = objc_msgSend(v6, "performWriteTransactionWithHealthDatabase:error:block:", v8, a3, v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_pregnancyModelWasUpdated:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    v3 = MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 64));
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v5);

  }
}

- (BOOL)_deleteAllPregnancyLactationInteractionsOfType:(void *)a3 transaction:(void *)a4 reason:(uint64_t)a5 error:
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a1)
  {
    v10 = CFSTR("lactation");
    if (a2 == 1)
      v10 = CFSTR("pregnancy");
    v11 = v10;
    v12 = a3;
    _HKInitializeLogging();
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      HKSensitiveLogItem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1B815E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will delete %@ dismissed interaction objects, %@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HDDismissedPregnancyLactationInteractionPredicateForInteractionTypes((uint64_t)v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "databaseForEntityClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = +[HDSQLiteEntity deleteEntitiesInDatabase:predicate:error:](HDDismissedPregnancyLactationInteractionEntity, "deleteEntitiesInDatabase:predicate:error:", v20, v19, a5);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

BOOL __93__HDMedicationPregnancyLactationStatusObserver__deletePregnancyInteractionsWithReason_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDMedicationPregnancyLactationStatusObserver _deleteAllPregnancyLactationInteractionsOfType:transaction:reason:error:](*(_QWORD *)(a1 + 32), 1, a2, *(void **)(a1 + 40), a3);
}

BOOL __95__HDMedicationPregnancyLactationStatusObserver__queryAndDeleteLactationInteractionsWithReason___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  return -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:transaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2, a3) != 0;
}

- (uint64_t)_queryAndDeleteLactationInteractionsWithReason:(void *)a3 transaction:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_24;
  }
  HKSensitiveLogItem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v10 = -[HDMedicationPregnancyLactationStatusObserver doesMostRecentLactationSampleHaveDistantFutureEndDateWithError:](a1, &v27);
  v11 = v27;
  if (v10 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, no %@ sample with distant future end date found"), v7, v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v11;
    v16 = -[HDMedicationPregnancyLactationStatusObserver _deleteAllPregnancyLactationInteractionsOfType:transaction:reason:error:](a1, 2, v8, v14, (uint64_t)&v26);
    v15 = v26;

    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2112;
        v31 = v9;
        v20 = v19;
        _os_log_impl(&dword_1B815E000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interaction objects", buf, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v29 = v24;
        v30 = 2114;
        v31 = v9;
        v32 = 2114;
        v33 = v15;
        v25 = v24;
        _os_log_error_impl(&dword_1B815E000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to delete %{public}@ dismissal interaction objects, error: %{public}@", buf, 0x20u);

      }
      v15 = v15;
      if (v15)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v15);
        else
          _HKLogDroppedError();
      }

      v10 = 0;
    }
    goto LABEL_22;
  }
  if (!v10)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v9;
      v32 = 2114;
      v33 = v11;
      v23 = v22;
      _os_log_error_impl(&dword_1B815E000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch any %{public}@ sample, error: %{public}@", buf, 0x20u);

    }
    v13 = v11;
    v14 = v13;
    if (v13)
    {
      if (a4)
      {
        v14 = objc_retainAutorelease(v13);
        v10 = 0;
        *a4 = v14;
        v15 = v14;
LABEL_22:

        v11 = v15;
        goto LABEL_23;
      }
      _HKLogDroppedError();
    }
    v10 = 0;
    v15 = v14;
    goto LABEL_22;
  }
LABEL_23:

LABEL_24:
  return v10;
}

BOOL __111__HDMedicationPregnancyLactationStatusObserver__deleteLactationInteractionsOnProtectedDataAvailabilityIfNeeded__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  return -[HDMedicationPregnancyLactationStatusObserver _queryAndDeleteLactationInteractionsWithReason:transaction:error:](*(_QWORD *)(a1 + 32), CFSTR("protected data available"), a2, a3) != 0;
}

- (BOOL)_unitTest_shouldAttemptToDeletePregnancyDismissedInteractions
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldAttemptToDeletePregnancyDismissedInteractions);
  return v2 & 1;
}

- (BOOL)_unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldQueryLactationSampleToDeleteDismissedInteractionsIfNeeded);
  return v2 & 1;
}

- (void)set_unitTest_shouldAttemptToDeletePregnancyDismissedInteractions:(BOOL)a3
{
  self->__unitTest_shouldAttemptToDeletePregnancyDismissedInteractions = a3;
}

- (void)set_unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions:(BOOL)a3
{
  self->__unitTest_shouldQueryLactationSampleToDeleteDismissedInteractions = a3;
}

- (id)unitTesting_protectedDataDidBecomeAvailable
{
  return self->_unitTesting_protectedDataDidBecomeAvailable;
}

- (void)setUnitTesting_protectedDataDidBecomeAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)unitTesting_samplesAdded
{
  return self->_unitTesting_samplesAdded;
}

- (void)setUnitTesting_samplesAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)unitTesting_samplesOfTypesWereRemoved
{
  return self->_unitTesting_samplesOfTypesWereRemoved;
}

- (void)setUnitTesting_samplesOfTypesWereRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)unitTesting_pregnancyModelDidUpdate
{
  return self->_unitTesting_pregnancyModelDidUpdate;
}

- (void)setUnitTesting_pregnancyModelDidUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_pregnancyModelDidUpdate, 0);
  objc_storeStrong(&self->_unitTesting_samplesOfTypesWereRemoved, 0);
  objc_storeStrong(&self->_unitTesting_samplesAdded, 0);
  objc_storeStrong(&self->_unitTesting_protectedDataDidBecomeAvailable, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
