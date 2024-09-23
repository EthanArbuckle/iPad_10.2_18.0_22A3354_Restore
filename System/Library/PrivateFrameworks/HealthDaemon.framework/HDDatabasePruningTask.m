@implementation HDDatabasePruningTask

- (HDDatabasePruningTask)initWithProfile:(id)a3
{
  id v5;
  HDDatabasePruningTask *v6;
  HDDatabasePruningTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDatabasePruningTask;
  v6 = -[HDDatabasePruningTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profile, a3);

  return v7;
}

- (void)enqueueMaintenanceOperationOnCoordinator:(id)a3 takeAccessibilityAssertion:(BOOL)a4 nowDate:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  HDDatabasePruningTask *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v8 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v8)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDProfile database](self->_profile, "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v19, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v18, &v38, 300.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v38;

    if (!v20)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v40 = self;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_INFO, "%{public}@: unable to take accessibility assertion: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    v20 = 0;
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  -[HDProfile profileIdentifier](self->_profile, "profileIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Database Pruning (%@)"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke;
  v34[3] = &unk_1E6D0FAD0;
  v34[4] = self;
  v35 = v20;
  v36 = v11;
  v37 = v12;
  v32[0] = v27;
  v32[1] = 3221225472;
  v32[2] = __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke_2;
  v32[3] = &unk_1E6CE9B90;
  v33 = v35;
  v28 = v35;
  v29 = v12;
  v30 = v11;
  +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:canceledBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:canceledBlock:", v26, v34, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueMaintenanceOperation:", v31);

}

void __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  id v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v8 = 0;
  v6 = a2;
  objc_msgSend(v3, "pruneDatabaseWithAccessibilityAssertion:nowDate:error:", v4, v5, &v8);
  v7 = v8;
  objc_msgSend((id)a1[5], "invalidate");
  (*(void (**)(void))(a1[7] + 16))();

  v6[2](v6);
}

void __112__HDDatabasePruningTask_enqueueMaintenanceOperationOnCoordinator_takeAccessibilityAssertion_nowDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(void);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "invalidate");
  v3[2]();

}

- (BOOL)pruneDatabaseWithAccessibilityAssertion:(id)a3 nowDate:(id)a4 error:(id *)a5
{
  return -[HDDatabasePruningTask pruneDatabaseWithAccessibilityAssertion:nowDate:prunedObjectLimit:prunedObjectTransactionLimit:error:](self, "pruneDatabaseWithAccessibilityAssertion:nowDate:prunedObjectLimit:prunedObjectTransactionLimit:error:", a3, a4, 20000, 1000, a5);
}

- (BOOL)pruneDatabaseWithAccessibilityAssertion:(id)a3 nowDate:(id)a4 prunedObjectLimit:(unint64_t)a5 prunedObjectTransactionLimit:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  HDMutableDatabaseTransactionContext *v14;
  void *v15;
  id v16;
  char v17;
  _QWORD v19[5];
  id v20;
  unint64_t v21;
  unint64_t v22;

  v12 = a3;
  v13 = a4;
  v14 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  -[HDMutableDatabaseTransactionContext setCacheScope:](v14, "setCacheScope:", 1);
  if (v12)
    -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v14, "addAccessibilityAssertion:", v12);
  -[HDProfile database](self->_profile, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __126__HDDatabasePruningTask_pruneDatabaseWithAccessibilityAssertion_nowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke;
  v19[3] = &unk_1E6D0FAF8;
  v19[4] = self;
  v20 = v13;
  v21 = a5;
  v22 = a6;
  v16 = v13;
  v17 = objc_msgSend(v15, "performWithTransactionContext:error:block:", v14, a7, v19);

  return v17;
}

BOOL __126__HDDatabasePruningTask_pruneDatabaseWithAccessibilityAssertion_nowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  double Current;
  void *v6;
  HDSyncAnchorMap *v7;
  HDSyncAnchorMap *v8;
  HDSyncAnchorMap *v9;
  void *v10;
  void *v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  NSObject *v37;
  uint64_t v38;
  CFAbsoluteTime v39;
  _BOOL8 v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v44;
  uint64_t v45;
  HDSyncAnchorMap *v46;
  NSObject *obj;
  __int128 v48;
  void *v49;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE *v56;
  __int128 v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE buf[24];
  double v68;
  uint8_t v69[4];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v48 = *(_OWORD *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v51 = v2;
  v49 = v3;
  if (v2)
  {
    v4 = v3;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v4, "dateByAddingTimeInterval:", -1209600.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(HDSyncAnchorMap);
    if (+[HDSyncAnchorEntity getMinimumSyncAnchorsOfType:anchorMap:updatedSince:profile:error:](HDSyncAnchorEntity, "getMinimumSyncAnchorsOfType:anchorMap:updatedSince:profile:error:", 2, v7, v6, *(_QWORD *)(v51 + 8), a2))
    {
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    v46 = v9;
    if (v9)
    {
      v63 = 0;
      v64 = &v63;
      v65 = 0x2020000000;
      v66 = 0;
      objc_msgSend(*(id *)(v51 + 8), "daemon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "behavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDatabase allEntityClassesWithBehavior:](HDDatabase, "allEntityClassesWithBehavior:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v51 + 8), "syncEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allOrderedSyncEntities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v51 + 8), "daemon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pluginManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pluginsConformingToProtocol:", &unk_1EF1ADB80);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v21 = v19;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v25, "databaseEntitiesForProtectionClass:", 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObjectsFromArray:", v26);

            objc_msgSend(v25, "databaseEntitiesForProtectionClass:", 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObjectsFromArray:", v27);

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
        }
        while (v22);
      }

      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v28;
      v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v60;
        v44 = *(_QWORD *)v60;
        while (2)
        {
          v31 = 0;
          v45 = v29;
          do
          {
            if (*(_QWORD *)v60 != v30)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v31);
            if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
            {
              if (objc_msgSend(v32, "conformsToProtocol:", &unk_1EF1AF930, v44))
              {
                objc_msgSend(v32, "syncEntityIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDSyncAnchorMap anchorIfPresentForSyncEntityIdentifier:](v46, "anchorIfPresentForSyncEntityIdentifier:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v34 = 0;
              }
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              LOBYTE(v68) = 0;
              while (1)
              {
                *(_QWORD *)&v52 = MEMORY[0x1E0C809B0];
                *((_QWORD *)&v52 + 1) = 3221225472;
                *(_QWORD *)&v53 = __104__HDDatabasePruningTask__pruneDatabaseWithNowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke;
                *((_QWORD *)&v53 + 1) = &unk_1E6D0FB20;
                v57 = v48;
                *((_QWORD *)&v55 + 1) = &v63;
                *(_QWORD *)&v54 = v51;
                v58 = v32;
                v35 = v34;
                *((_QWORD *)&v54 + 1) = v35;
                *(_QWORD *)&v55 = v49;
                v56 = buf;
                v36 = HKWithAutoreleasePool();

                if ((v36 & 1) == 0)
                  break;
                if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24) || v64[3] >= (unint64_t)v48)
                {
                  _Block_object_dispose(buf, 8);

                  v30 = v44;
                  v29 = v45;
                  goto LABEL_28;
                }
              }
              _Block_object_dispose(buf, 8);

              v40 = 0;
              v37 = obj;
              goto LABEL_34;
            }
LABEL_28:
            ++v31;
          }
          while (v31 != v29);
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          if (v29)
            continue;
          break;
        }
      }

      _HKInitializeLogging();
      HKLogInfrastructure();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v64[3];
        v39 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2048;
        v68 = v39 - Current;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished pruning %ld objects in %0.2lfs", buf, 0x20u);
      }
      v40 = 1;
LABEL_34:

      _Block_object_dispose(&v63, 8);
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v41 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);

      if (v40)
      {
        HKLogInfrastructure();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v69 = 138543362;
          v70 = v51;
          _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_INFO, "%{public}@: Failed to determine minimum frozen anchors before pruning", v69, 0xCu);
        }

        v40 = 0;
      }
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

BOOL __104__HDDatabasePruningTask__pruneDatabaseWithNowDate_prunedObjectLimit_prunedObjectTransactionLimit_error___block_invoke(_QWORD *a1, _QWORD *a2)
{
  double Current;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  CFAbsoluteTime v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v5 = (void *)a1[6];
  v6 = a1[9];
  if ((unint64_t)(v6 - *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24)) >= a1[10])
    v7 = a1[10];
  else
    v7 = v6 - *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v8 = (void *)a1[11];
  v10 = a1[4];
  v9 = (void *)a1[5];
  v27 = 0;
  v11 = v9;
  v12 = v5;
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "pruneSyncedObjectsThroughAnchor:limit:nowDate:profile:error:", v11, v7, v12, *(_QWORD *)(v10 + 8), &v27);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v14 = (void *)v13;
      goto LABEL_11;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "pruneWithProfile:nowDate:limit:error:", *(_QWORD *)(v10 + 8), v12, v7, &v27);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_11:

  v15 = v27;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    v18 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v18)
    {
      HKLogInfrastructure();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = a1[4];
        v21 = a1[11];
        v22 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 138544130;
        v29 = v20;
        v30 = 2114;
        v31 = v21;
        v32 = 2114;
        v33 = v14;
        v34 = 2048;
        v35 = v22 - Current;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ pruned %{public}@ objects in %0.2lfs", buf, 0x2Au);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v14, "integerValue") == v7;
    if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
      usleep(0x2710u);
    if (objc_msgSend(v14, "integerValue") >= 1)
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v14, "integerValue");
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v25 = a1[4];
      v26 = a1[11];
      *(_DWORD *)buf = 138543874;
      v29 = v25;
      v30 = 2114;
      v31 = v26;
      v32 = 2114;
      v33 = v15;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Pruning failed for %{public}@: %{public}@", buf, 0x20u);
    }

    v23 = v15;
    if (v23)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v23);
      else
        _HKLogDroppedError();
    }

  }
  return v14 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
