@implementation HDMedicationPregnancyListConceptObserver

- (HDMedicationPregnancyListConceptObserver)init
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

- (HDMedicationPregnancyListConceptObserver)initWithProfile:(id)a3
{
  id v5;
  HDMedicationPregnancyListConceptObserver *v6;
  HDMedicationPregnancyListConceptObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMedicationPregnancyListConceptObserver;
  v6 = -[HDMedicationPregnancyListConceptObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    atomic_store(1u, (unsigned __int8 *)&v7->_shouldQueryMedicationListToDeleteDismissedInteractionsIfNeeded);
    -[HDProfile registerProfileReadyObserver:queue:](v7->_profile, "registerProfileReadyObserver:queue:", v7, 0);
  }

  return v7;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned __int8 v7;
  id v8;

  v4 = a4;
  v6 = a3;
  if (self)
  {
    if (v4)
    {
      v7 = atomic_load((unsigned __int8 *)&self->_shouldQueryMedicationListToDeleteDismissedInteractionsIfNeeded);
      if ((v7 & 1) != 0)
      {
        v8 = v6;
        -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, 0);
        v6 = v8;
      }
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
  void *v10;
  void *v11;
  int v12;
  unsigned __int8 v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = objc_opt_class();
      v8 = *(id *)&v14[4];
      _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Profile did become ready, registering for observers", v14, 0xCu);

    }
  }
  objc_msgSend(v4, "userDomainConceptManager", *(_OWORD *)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSynchronousUserDomainConceptObserver:", self);

  objc_msgSend(v4, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addProtectedDataObserver:", self);

  objc_msgSend(v4, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isProtectedDataAvailable");
  if (self && v12)
  {
    v13 = atomic_load((unsigned __int8 *)&self->_shouldQueryMedicationListToDeleteDismissedInteractionsIfNeeded);
    if ((v13 & 1) != 0)
      -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, 0);
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (self && objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_3))
    -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, v9);

}

- (void)_deleteNonactiveDismissedInteractionsWithTransaction:(uint64_t)a1
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  unsigned __int8 v6;
  NSObject *v7;

  if (a1)
  {
    v7 = 0;
    v3 = -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:error:](a1, a2, &v7);
    v4 = v7;
    v5 = v4;
    if (v3)
      v6 = 0;
    else
      v6 = -[NSObject hk_isDatabaseAccessibilityError](v4, "hk_isDatabaseAccessibilityError");
    atomic_store(v6, (unsigned __int8 *)(a1 + 16));

  }
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (self && objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_3))
    -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, v9);

}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (self && objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_3))
    -[HDMedicationPregnancyListConceptObserver _deleteNonactiveDismissedInteractionsWithTransaction:]((uint64_t)self, v9);

}

+ (id)_predicateForNonactiveDismissedInteractions
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v0, "setEntityClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", *MEMORY[0x1E0D293C0], *MEMORY[0x1E0CB5388]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D29840];
  v12[0] = v2;
  v12[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingAllPredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPredicate:", v5);

  v6 = (void *)MEMORY[0x1E0D29838];
  v11 = *MEMORY[0x1E0D293B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("medication_identifier"), 7, v0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)_deleteNonactiveDismissedInteractionsWithTransaction:(NSObject *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    HKSensitiveLogItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDMedicationPregnancyListConceptObserver _predicateForNonactiveDismissedInteractions]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v9 = +[HDSQLiteEntity deleteEntitiesInDatabase:predicate:error:](HDDismissedPregnancyLactationInteractionEntity, "deleteEntitiesInDatabase:predicate:error:", v8, v7, &v25);
      v10 = v25;

      if (v9)
      {
LABEL_4:
        _HKInitializeLogging();
        HKLogMedication();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v27 = v12;
          v28 = 2112;
          v29 = v6;
          v13 = v12;
          _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ dismissed interactions for non-active medications", buf, 0x16u);

        }
        a1 = 1;
        goto LABEL_15;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0D295B0];
      objc_msgSend(*(id *)(a1 + 8), "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __103__HDMedicationPregnancyListConceptObserver__deleteNonactiveDismissedInteractionsWithTransaction_error___block_invoke;
      v22[3] = &unk_1E6DFFFA8;
      v23 = v7;
      v16 = objc_msgSend(v14, "performWriteTransactionWithHealthDatabase:error:block:", v15, &v24, v22);
      v10 = v24;

      if (v16)
        goto LABEL_4;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v10;
      v21 = v20;
      _os_log_error_impl(&dword_1B815E000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Error deleting %@ dismissed interactions for non-active medications: %@", buf, 0x20u);

    }
    v18 = v10;
    v11 = v18;
    if (v18)
    {
      if (a3)
      {
        v11 = objc_retainAutorelease(v18);
        a1 = 0;
        *a3 = v11;
        v10 = v11;
LABEL_15:

        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
    a1 = 0;
    v10 = v11;
    goto LABEL_15;
  }
LABEL_16:

  return a1;
}

BOOL __103__HDMedicationPregnancyListConceptObserver__deleteNonactiveDismissedInteractionsWithTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[HDSQLiteEntity deleteEntitiesInDatabase:predicate:error:](HDDismissedPregnancyLactationInteractionEntity, "deleteEntitiesInDatabase:predicate:error:", v6, *(_QWORD *)(a1 + 32), a3);
  return v7;
}

BOOL __94__HDMedicationPregnancyListConceptObserver__doUserDomainConceptsContainListUserDomainConcept___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "listType") == 2;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
