@implementation HDWorkoutClusterManager

- (HDWorkoutClusterManager)initWithProfile:(id)a3
{
  id v4;
  HDWorkoutClusterManager *v5;
  HDWorkoutClusterManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDWorkoutClusterManager;
  v5 = -[HDWorkoutClusterManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutClusterManager;
  -[HDWorkoutClusterManager dealloc](&v3, sel_dealloc);
}

- (void)takeAccessibilityAssertionIfNeeded
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v5;
  objc_class *v6;
  void *v7;
  HDAssertion *v8;
  id v9;
  HDAssertion *accessibilityAssertion;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_accessibilityAssertion)
  {
    os_unfair_lock_unlock(p_lock);
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v7, &v18, 600.0);
  v8 = (HDAssertion *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  accessibilityAssertion = self->_accessibilityAssertion;
  self->_accessibilityAssertion = v8;

  if (!self->_accessibilityAssertion)
  {
    v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5380];
    v13 = *MEMORY[0x1E0CB5380];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = v12;
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v15;
        v21 = 2114;
        v22 = v9;
        v16 = v15;
        _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to acquire accessibility assertion with error=%{public}@", buf, 0x16u);
LABEL_10:

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v9;
      v16 = v17;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to acquire accessibility assertion with error=%{public}@", buf, 0x16u);
      goto LABEL_10;
    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (id)accessibilityAssertion
{
  os_unfair_lock_s *p_lock;
  HDAssertion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_accessibilityAssertion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)performUsingAccessibilityAssertionWithError:(id *)a3 block:(id)a4
{
  HDProfile **p_profile;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  p_profile = &self->_profile;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v9, "performWithTransactionContext:error:block:", v10, a3, v7);

  return (char)a3;
}

- (HDMutableDatabaseTransactionContext)_transactionContextWithAccessibilityAssertion
{
  HDMutableDatabaseTransactionContext *v2;
  void *v3;

  if (a1)
  {
    v2 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    objc_msgSend(a1, "accessibilityAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v2, "addAccessibilityAssertion:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)workoutCountWithFilter:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HDWorkoutClusterManager *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__133;
  v22 = __Block_byref_object_dispose__133;
  v23 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutClusterManager_workoutCountWithFilter_error___block_invoke;
  v14[3] = &unk_1E6CE8DD8;
  v17 = &v18;
  v10 = v6;
  v15 = v10;
  v16 = self;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDWorkoutEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v8, v9, a4, v14);

  if ((_DWORD)a4)
    v11 = (void *)v19[5];
  else
    v11 = 0;
  v12 = v11;

  _Block_object_dispose(&v18, 8);
  return v12;
}

BOOL __56__HDWorkoutClusterManager_workoutCountWithFilter_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0D29620];
  v8 = (void *)a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  objc_msgSend(v8, "predicateWithProfile:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity countValueForProperty:predicate:database:error:](HDWorkoutEntity, "countValueForProperty:predicate:database:error:", v7, v10, v6, a3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
  return v14;
}

- (id)workoutsWithFilter:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 newAnchor:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
  objc_msgSend(MEMORY[0x1E0CB6B00], "workoutType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDWorkoutEntity, "entityEnumeratorWithType:profile:", v14, WeakRetained);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "predicateWithProfile:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v18);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "_rowid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchor:", v19);

  }
  objc_msgSend(v16, "setLimitCount:", a5);
  -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDatabaseTransactionContext:", v20);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v31 = objc_msgSend(v12, "_rowid");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__HDWorkoutClusterManager_workoutsWithFilter_anchor_limit_newAnchor_error___block_invoke;
  v25[3] = &unk_1E6CE7E78;
  v21 = v13;
  v26 = v21;
  v27 = &v28;
  if (objc_msgSend(v16, "enumerateWithError:handler:", a7, v25))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", v29[3]);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)objc_msgSend(v21, "copy");
  }
  else
  {
    v22 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v22;
}

uint64_t __75__HDWorkoutClusterManager_workoutsWithFilter_anchor_limit_newAnchor_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  return 1;
}

- (id)workoutsWithFilter:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithCapacity:", a4);
  objc_msgSend(MEMORY[0x1E0CB6B00], "workoutType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDSampleEntity entityEnumeratorWithType:profile:](HDWorkoutEntity, "entityEnumeratorWithType:profile:", v14, WeakRetained);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v12, "predicateWithProfile:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPredicate:", v18);
  objc_msgSend(v16, "setLimitCount:", a4);
  objc_msgSend(v16, "setSortDescriptors:", v11);

  -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDatabaseTransactionContext:", v19);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__HDWorkoutClusterManager_workoutsWithFilter_limit_sortDescriptors_error___block_invoke;
  v23[3] = &unk_1E6CF89B8;
  v20 = v13;
  v24 = v20;
  if (objc_msgSend(v16, "enumerateWithError:handler:", a6, v23))
    v21 = (void *)objc_msgSend(v20, "copy");
  else
    v21 = 0;

  return v21;
}

uint64_t __74__HDWorkoutClusterManager_workoutsWithFilter_limit_sortDescriptors_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (BOOL)enumerateRouteLocationsForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  HDWorkoutClusterManager *v24;
  id v25;
  id v26;
  unint64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke;
  v22[3] = &unk_1E6CFF2E8;
  v23 = v12;
  v24 = self;
  v25 = v13;
  v26 = v14;
  v27 = a5;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSeriesSampleEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v16, v17, a6, v22);

  return (char)a6;
}

uint64_t __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  id v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v33;
  void *v34;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  _BYTE v51[128];
  const __CFString *v52;
  void *v53;
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v36 = a2;
  +[HDWorkoutClusterEntity workoutEntityForUUID:transaction:error:](HDWorkoutClusterEntity, "workoutEntityForUUID:transaction:error:", *(_QWORD *)(a1 + 32));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(v36, "databaseForEntityClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_19;
    v4 = (objc_class *)MEMORY[0x1E0C99DE8];
    v5 = v33;
    v6 = v34;
    v7 = objc_alloc_init(v4);
    v8 = objc_alloc_init(MEMORY[0x1E0D298A0]);
    objc_msgSend(MEMORY[0x1E0CB6B50], "workoutRouteType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataType(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v6, "persistentID");
    HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D29840];
    v54[0] = v10;
    v54[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateMatchingAllPredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v15);

    objc_msgSend(v8, "setEntityClass:", objc_opt_class());
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOrderingTerms:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v5, v8);
    v52 = CFSTR("hfd_key");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = (uint64_t)__76__HDWorkoutClusterManager__routeSeriesIdentifiersForWorkout_database_error___block_invoke;
    v49 = &unk_1E6CF6008;
    v50 = v7;
    v20 = v7;
    LODWORD(v7) = objc_msgSend(v18, "enumerateProperties:error:enumerationHandler:", v19, a3, &v46);

    v21 = (_DWORD)v7 ? v20 : 0;
    v22 = v21;

    if (v22)
    {
      v46 = 0;
      v47 = (uint64_t)&v46;
      v48 = 0x2020000000;
      v49 = 0;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v43 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            v28 = *(void **)(a1 + 48);
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke_2;
            v37[3] = &unk_1E6CFF2C0;
            v29 = v28;
            v38 = v29;
            v39 = *(id *)(a1 + 56);
            v40 = &v46;
            v41 = *(_QWORD *)(a1 + 64);
            if (!+[HDLocationSeriesSampleEntity enumerateLocationDataWithTransaction:HFDKey:startDate:error:handler:](HDLocationSeriesSampleEntity, "enumerateLocationDataWithTransaction:HFDKey:startDate:error:handler:", v36, v27, v29, a3, v37))
            {

              v31 = 0;
              goto LABEL_21;
            }
            v30 = *(_QWORD *)(v47 + 24) < *(_QWORD *)(a1 + 64);

            if (!v30)
              goto LABEL_18;
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          v31 = 1;
          if (v24)
            continue;
          break;
        }
      }
      else
      {
LABEL_18:
        v31 = 1;
      }
LABEL_21:

      _Block_object_dispose(&v46, 8);
    }
    else
    {
LABEL_19:
      v23 = 0;
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

BOOL __95__HDWorkoutClusterManager_enumerateRouteLocationsForWorkoutUUID_startDate_limit_error_handler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = v3;
  if (a1[4]
    && (objc_msgSend(v3, "timestamp"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", a1[4]),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    v7 = ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) < a1[7];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __76__HDWorkoutClusterManager__routeSeriesIdentifiersForWorkout_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

- (BOOL)createWorkoutCluster:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HDWorkoutClusterManager *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HDWorkoutClusterManager_createWorkoutCluster_error___block_invoke;
  v9[3] = &unk_1E6CF9188;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = -[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a4, v9);

  return (char)a4;
}

BOOL __54__HDWorkoutClusterManager_createWorkoutCluster_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  +[HDWorkoutClusterEntity insertWorkoutCluster:profile:error:](HDWorkoutClusterEntity, "insertWorkoutCluster:profile:error:", v3, WeakRetained, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (id)allWorkoutClustersWithError:(id *)a3
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__133;
  v11 = __Block_byref_object_dispose__133;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HDWorkoutClusterManager_allWorkoutClustersWithError___block_invoke;
  v6[3] = &unk_1E6CF1500;
  v6[4] = self;
  v6[5] = &v7;
  if (-[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a3, v6))
  {
    v3 = (void *)v8[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __55__HDWorkoutClusterManager_allWorkoutClustersWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  +[HDWorkoutClusterEntity workoutClustersForProfile:limit:error:](HDWorkoutClusterEntity, "workoutClustersForProfile:limit:error:", WeakRetained, *MEMORY[0x1E0D29968], a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)workoutClusterContainingWorkoutUUID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HDWorkoutClusterManager *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__133;
  v19 = __Block_byref_object_dispose__133;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HDWorkoutClusterManager_workoutClusterContainingWorkoutUUID_error___block_invoke;
  v11[3] = &unk_1E6CF1528;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  v13 = self;
  if (-[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a4, v11))
  {
    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

BOOL __69__HDWorkoutClusterManager_workoutClusterContainingWorkoutUUID_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  +[HDWorkoutClusterEntity workoutClusterContainingWorkoutUUID:profile:error:](HDWorkoutClusterEntity, "workoutClusterContainingWorkoutUUID:profile:error:", v4, WeakRetained, a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

- (id)workoutClustersContainingWorkoutUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HDWorkoutClusterManager *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__133;
  v19 = __Block_byref_object_dispose__133;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HDWorkoutClusterManager_workoutClustersContainingWorkoutUUIDs_error___block_invoke;
  v11[3] = &unk_1E6CF1528;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  v13 = self;
  if (-[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a4, v11))
  {
    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

BOOL __71__HDWorkoutClusterManager_workoutClustersContainingWorkoutUUIDs_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  +[HDWorkoutClusterEntity clusterUUIDsForWorkoutUUIDs:profile:error:](HDWorkoutClusterEntity, "clusterUUIDsForWorkoutUUIDs:profile:error:", v4, WeakRetained, a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

- (id)allWorkoutUUIDsForClusterUUID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HDWorkoutClusterManager *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__133;
  v19 = __Block_byref_object_dispose__133;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HDWorkoutClusterManager_allWorkoutUUIDsForClusterUUID_error___block_invoke;
  v11[3] = &unk_1E6CF1528;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  v13 = self;
  if (-[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a4, v11))
  {
    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

BOOL __63__HDWorkoutClusterManager_allWorkoutUUIDsForClusterUUID_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  +[HDWorkoutClusterEntity workoutUUIDsForClusterUUID:profile:error:](HDWorkoutClusterEntity, "workoutUUIDsForClusterUUID:profile:error:", v4, WeakRetained, a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

- (id)workoutRouteSnapshotForClusterUUID:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__133;
  v21 = __Block_byref_object_dispose__133;
  v22 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutClusterManager _transactionContextWithAccessibilityAssertion](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HDWorkoutClusterManager_workoutRouteSnapshotForClusterUUID_error___block_invoke;
  v14[3] = &unk_1E6CE8D70;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDWorkoutClusterEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v8, v9, a4, v14);

  if ((_DWORD)a4)
    v11 = (void *)v18[5];
  else
    v11 = 0;
  v12 = v11;

  _Block_object_dispose(&v17, 8);
  return v12;
}

BOOL __68__HDWorkoutClusterManager_workoutRouteSnapshotForClusterUUID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;

  v5 = a2;
  +[HDWorkoutClusterEntity entityForClusterUUID:transaction:error:](HDWorkoutClusterEntity, "entityForClusterUUID:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "workoutRouteSnapshotWithTransaction:error:", v5, a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRouteSnapshot:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  HDWorkoutClusterManager *v16;

  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteSnapshot_error___block_invoke;
  v13[3] = &unk_1E6CF0678;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v10 = v9;
  v11 = v8;
  LOBYTE(a5) = -[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a5, v13);

  return (char)a5;
}

BOOL __79__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteSnapshot_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  _BOOL8 v6;

  v3 = a1[4];
  v4 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 24));
  v6 = +[HDWorkoutClusterEntity updateWorkoutClusterWithUUID:routeSnapshot:profile:error:](HDWorkoutClusterEntity, "updateWorkoutClusterWithUUID:routeSnapshot:profile:error:", v3, v4, WeakRetained, a2);

  return v6;
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRouteLabel:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  HDWorkoutClusterManager *v16;

  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteLabel_error___block_invoke;
  v13[3] = &unk_1E6CF0678;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v10 = v9;
  v11 = v8;
  LOBYTE(a5) = -[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a5, v13);

  return (char)a5;
}

BOOL __76__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRouteLabel_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  _BOOL8 v6;

  v3 = a1[4];
  v4 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 24));
  v6 = +[HDWorkoutClusterEntity updateWorkoutClusterWithUUID:routeLabel:profile:error:](HDWorkoutClusterEntity, "updateWorkoutClusterWithUUID:routeLabel:profile:error:", v3, v4, WeakRetained, a2);

  return v6;
}

- (BOOL)updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  HDWorkoutClusterManager *v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __164__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke;
  v28[3] = &unk_1E6CFF310;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  v35 = self;
  v21 = v20;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  LOBYTE(self) = -[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a9, v28);

  return (char)self;
}

BOOL __164__HDWorkoutClusterManager_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  _BOOL8 v10;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  WeakRetained = objc_loadWeakRetained((id *)(a1[10] + 24));
  v10 = +[HDWorkoutClusterEntity updateWorkoutClusterWithUUID:relevanceValue:lastWorkoutUUID:bestWorkoutUUID:workoutUUIDsToAssociate:workoutUUIDsToRemove:profile:error:](HDWorkoutClusterEntity, "updateWorkoutClusterWithUUID:relevanceValue:lastWorkoutUUID:bestWorkoutUUID:workoutUUIDsToAssociate:workoutUUIDsToRemove:profile:error:", v3, v4, v5, v6, v7, v8, WeakRetained, a2);

  return v10;
}

- (BOOL)deleteWorkoutClusterWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HDWorkoutClusterManager *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HDWorkoutClusterManager_deleteWorkoutClusterWithUUID_error___block_invoke;
  v9[3] = &unk_1E6CF9188;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = -[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](self, "performUsingAccessibilityAssertionWithError:block:", a4, v9);

  return (char)a4;
}

BOOL __62__HDWorkoutClusterManager_deleteWorkoutClusterWithUUID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  _BOOL8 v5;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  v5 = +[HDWorkoutClusterEntity deleteWorkoutClusterWithUUID:profile:error:](HDWorkoutClusterEntity, "deleteWorkoutClusterWithUUID:profile:error:", v3, WeakRetained, a2);

  return v5;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
}

@end
