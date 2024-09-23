@implementation HDWorkoutEffortRelationshipQueryServer

- (HDWorkoutEffortRelationshipQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDWorkoutEffortRelationshipQueryServer *v11;
  uint64_t v12;
  _HKWorkoutEffortRelationshipQueryServerConfiguration *ratingOfExertionAssociationQueryServerConfiguration;
  void *v14;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDWorkoutEffortRelationshipQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    ratingOfExertionAssociationQueryServerConfiguration = v11->_ratingOfExertionAssociationQueryServerConfiguration;
    v11->_ratingOfExertionAssociationQueryServerConfiguration = (_HKWorkoutEffortRelationshipQueryServerConfiguration *)v12;

    -[_HKWorkoutEffortRelationshipQueryServerConfiguration anchor](v11->_ratingOfExertionAssociationQueryServerConfiguration, "anchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_anchor = objc_msgSend(v14, "_rowid");

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  id v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)HDWorkoutEffortRelationshipQueryServer;
  -[HDQueryServer _queue_start](&v37, sel__queue_start);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB5C88];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forDataType:", self, v6);

  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "associationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB5DD8];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forDataType:", self, v10);

  -[HDQueryServer queryUUID](self, "queryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "authorizationOracle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v18, "readAuthorizationStatusesForTypes:error:", v16, &v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v36;

  if (v20)
  {
    -[HDWorkoutEffortRelationshipQueryServer queryClient](self, "queryClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "client_deliverError:forQuery:", v20, v11);

  }
  else
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v22 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke;
    v27[3] = &unk_1E6D0CF38;
    v27[4] = &v32;
    v27[5] = &v28;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v27);
    if (*((_BYTE *)v33 + 24) && *((_BYTE *)v29 + 24))
    {
      v25[0] = v22;
      v25[1] = 3221225472;
      v25[2] = __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke_2;
      v25[3] = &unk_1E6D0CF60;
      v25[4] = self;
      v26 = v11;
      -[HDWorkoutEffortRelationshipQueryServer _queue_fetchAssociatedEffortSamplesWithHandler:](self, "_queue_fetchAssociatedEffortSamplesWithHandler:", v25);

    }
    else
    {
      -[HDWorkoutEffortRelationshipQueryServer queryClient](self, "queryClient");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKWorkoutEffortRelationshipQueryServerConfiguration anchor](self->_ratingOfExertionAssociationQueryServerConfiguration, "anchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E0C9AA60], 1, v24, v11);

    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }

}

void __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {
    v7 = objc_msgSend(v5, "canRead");

    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (objc_msgSend(v5, "canRead"))
  {
    v8 = *(_QWORD *)(a1 + 40);
    goto LABEL_7;
  }
LABEL_8:

}

void __54__HDWorkoutEffortRelationshipQueryServer__queue_start__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v11)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = 138543618;
      v21 = v19;
      v22 = 2114;
      v23 = v11;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch associated effort samples: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "queryClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "client_deliverError:forQuery:", v11, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v14 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v14, "_filteredRelationships:anchor:", v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v20 = 138543619;
        v21 = v17;
        v22 = 2113;
        v23 = v15;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Delivering relationships to client: %{private}@", (uint8_t *)&v20, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "queryClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", v15, a4, v10, *(_QWORD *)(a1 + 40));

    }
    else
    {
      objc_msgSend(v14, "queryClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E0C9AA60], a4, v10, *(_QWORD *)(a1 + 40));
    }

  }
}

- (id)_filteredRelationships:(id)a3 anchor:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  id obj;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  HDWorkoutEffortRelationshipQueryServer *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v9 = v7;
    v27 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 138543618;
    v24 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "samples", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[HDQueryServer client](self, "client");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "authorizationOracle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "samples");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v26, "_rowid"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          objc_msgSend(v14, "filteredObjectsForReadAuthorization:anchor:error:", v15, v16, &v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v29;

          if (!v17)
          {
            _HKInitializeLogging();
            v19 = *MEMORY[0x1E0CB5348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              v35 = self;
              v36 = 2112;
              v37 = v18;
              _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed for workout samples with error: %@", buf, 0x16u);
            }
          }

        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v11, "workout");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDWorkoutEffortRelationshipQueryServer _relationshipForWorkout:activity:samples:](self, "_relationshipForWorkout:activity:samples:", v20, v21, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "addObject:", v22);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v9);
  }

  return v28;
}

- (void)_queue_stop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDWorkoutEffortRelationshipQueryServer;
  -[HDQueryServer _queue_stop](&v9, sel__queue_stop);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forDataType:", self, v5);

  -[HDQueryServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forDataType:", self, v8);

}

- (void)_queue_fetchAssociatedEffortSamplesWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  int64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, char);
  void *v21;
  HDWorkoutEffortRelationshipQueryServer *v22;
  id v23;
  uint64_t *v24;
  _BYTE *v25;
  _BOOL8 v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  id v33;
  uint8_t buf[4];
  HDWorkoutEffortRelationshipQueryServer *v35;
  __int16 v36;
  id v37;
  _BYTE v38[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id, uint64_t, id))a3;
  -[_HKWorkoutEffortRelationshipQueryServerConfiguration anchor](self->_ratingOfExertionAssociationQueryServerConfiguration, "anchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  +[HDHealthEntity maxRowIDForPredicate:healthDatabase:error:](HDAssociationEntity, "maxRowIDForPredicate:healthDatabase:error:", 0, v7, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", objc_msgSend(v8, "longLongValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v38 = 0;
    *(_QWORD *)&v38[8] = v38;
    *(_QWORD *)&v38[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__182;
    v40 = __Block_byref_object_dispose__182;
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v11 = -[_HKWorkoutEffortRelationshipQueryServerConfiguration options](self->_ratingOfExertionAssociationQueryServerConfiguration, "options") == 1;
    v28 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke;
    v21 = &unk_1E6D0CFB0;
    v24 = &v29;
    v22 = self;
    v12 = v5;
    v27 = v11;
    v23 = v12;
    v25 = v38;
    v26 = v11;
    v13 = -[HDWorkoutEffortRelationshipQueryServer _batchObjectsWithError:batchHandler:](self, "_batchObjectsWithError:batchHandler:", &v28, &v18);
    v14 = v28;
    -[HDWorkoutEffortRelationshipQueryServer _handleBatchedQueryResult:error:](self, "_handleBatchedQueryResult:error:", v13, v14, v18, v19, v20, v21, v22);
    if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = self;
        v36 = 2114;
        v37 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch relationships for associations: %{public}@", buf, 0x16u);
      }
      v4[2](v4, 0, v12, 1, v14);
    }
    else
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)&v38[8] + 40), "count"))
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = self;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: No sample relationships found", buf, 0xCu);
        }
      }
      v4[2](v4, *(_QWORD *)(*(_QWORD *)&v38[8] + 40), v10, *((unsigned __int8 *)v30 + 24), 0);
      self->_anchor = objc_msgSend(v8, "longLongValue");
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v38, 8);

  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 138543618;
      *(_QWORD *)&v38[4] = self;
      *(_WORD *)&v38[12] = 2114;
      *(_QWORD *)&v38[14] = v9;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch max rowID for associations table: %{public}@", v38, 0x16u);
    }
    v4[2](v4, 0, v5, 1, v9);
  }

}

void __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;

  v5 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke_2;
  v14[3] = &unk_1E6D0CF88;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v15 = v5;
  v16 = v8;
  v21 = 0;
  v14[1] = 3221225472;
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 64);
  v18 = *(_QWORD *)(a1 + 56);
  v19 = v11;
  v20 = *(_BYTE *)(a1 + 72);
  v17 = v10;
  v12 = v5;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, &v21, v14);
  v13 = v21;

}

uint64_t __89__HDWorkoutEffortRelationshipQueryServer__queue_fetchAssociatedEffortSamplesWithHandler___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  id v51;
  uint64_t v52;
  void *v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = *(id *)(a1 + 32);
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v55)
  {
    v7 = *(_QWORD *)v63;
    *(_QWORD *)&v6 = 138543874;
    v50 = v6;
    v51 = v5;
    v52 = *(_QWORD *)v63;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(obj);
        v56 = v8;
        v9 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * v8);
        objc_msgSend(v5, "protectedDatabase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v9;
        objc_msgSend(v9, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForDataUUID();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDataEntity anyInDatabase:predicate:error:](HDDataEntity, "anyInDatabase:predicate:error:", v10, v12, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v13;
        if (v13)
        {
          +[HDAssociationEntity countOfObjectsAssociatedWithObjectPID:excludeDeleted:associationType:anchor:transaction:error:](HDAssociationEntity, "countOfObjectsAssociatedWithObjectPID:excludeDeleted:associationType:anchor:transaction:error:", objc_msgSend(v13, "persistentID"), 1, 1, objc_msgSend(*(id *)(a1 + 48), "_rowid"), v5, a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v57;
            if (objc_msgSend(v15, "intValue"))
            {
              v53 = v16;
              v18 = v13;
              objc_msgSend(v57, "_subActivities");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");

              if (v20)
              {
                v60 = 0u;
                v61 = 0u;
                v58 = 0u;
                v59 = 0u;
                objc_msgSend(v57, "_subActivities");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v59;
                  do
                  {
                    for (i = 0; i != v23; ++i)
                    {
                      v26 = a3;
                      if (*(_QWORD *)v59 != v24)
                        objc_enumerationMutation(v21);
                      v27 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
                      v28 = *(void **)(a1 + 40);
                      v29 = objc_msgSend(v18, "persistentID", v50);
                      v30 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "options");
                      v31 = v28;
                      a3 = v26;
                      objc_msgSend(v31, "_fetchSamplesForWorkoutPID:activity:options:limit:sortDescending:error:", v29, v27, v30, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), v26);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(a1 + 40), "_relationshipForWorkout:activity:samples:", v57, v27, v32);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v33);

                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
                  }
                  while (v23);
                }

                v5 = v51;
                v7 = v52;
                v17 = v57;
              }
              objc_msgSend(*(id *)(a1 + 40), "_fetchSamplesForWorkoutPID:activity:options:limit:sortDescending:error:", objc_msgSend(v18, "persistentID", v50), 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "options"), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), a3);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "_relationshipForWorkout:activity:samples:", v17, 0, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v35);

              v14 = v18;
              v16 = v53;
              goto LABEL_26;
            }
            _HKInitializeLogging();
            v46 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
            {
              v47 = *(_QWORD *)(a1 + 40);
              v43 = v46;
              objc_msgSend(v57, "UUID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(*(id *)(a1 + 48), "_rowid");
              *(_DWORD *)buf = v50;
              v68 = v47;
              v7 = v52;
              v69 = 2114;
              v70 = v44;
              v71 = 2048;
              v72 = v48;
              _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_INFO, "%{public}@: No new sample associations found for workout: %{public}@, after anchor:%lld", buf, 0x20u);
LABEL_25:

            }
          }
          else
          {
            _HKInitializeLogging();
            v41 = (void *)*MEMORY[0x1E0CB52B0];
            v17 = v57;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              v42 = *(_QWORD *)(a1 + 40);
              v43 = v41;
              objc_msgSend(v57, "UUID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = *a3;
              *(_DWORD *)buf = v50;
              v68 = v42;
              v7 = v52;
              v69 = 2114;
              v70 = v44;
              v71 = 2114;
              v72 = v45;
              _os_log_error_impl(&dword_1B7802000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get count of objects loosely associated to workout: %{public}@, %{public}@", buf, 0x20u);
              goto LABEL_25;
            }
          }
LABEL_26:

          goto LABEL_27;
        }
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x1E0CB52B0];
        v17 = v57;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          v37 = *(_QWORD *)(a1 + 40);
          v38 = v36;
          objc_msgSend(v57, "UUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *a3;
          *(_DWORD *)buf = v50;
          v68 = v37;
          v7 = v52;
          v69 = 2114;
          v70 = v39;
          v71 = 2114;
          v72 = v40;
          _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get persisted if for workout: %{public}@, %{public}@", buf, 0x20u);

        }
LABEL_27:

        v8 = v56 + 1;
      }
      while (v56 + 1 != v55);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v55);
  }

  return 1;
}

- (id)_fetchSamplesForWorkoutPID:(int64_t)a3 activity:(id)a4 options:(int64_t)a5 limit:(unint64_t)a6 sortDescending:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  _QWORD v27[3];

  v9 = a7;
  v27[2] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB6978];
  v15 = *MEMORY[0x1E0CB5DD8];
  v16 = a4;
  objc_msgSend(v14, "quantityTypeForIdentifier:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  HDReferenceForAssociatableObject(v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer profile](self, "profile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAssociationEntity objectsAssociatedWithObjectPID:subObjectReference:dataTypes:associationType:limit:sortDescending:profile:error:](HDAssociationEntity, "objectsAssociatedWithObjectPID:subObjectReference:dataTypes:associationType:limit:sortDescending:profile:error:", a3, v20, v19, 1, a6, v9, v21, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 1 && (unint64_t)objc_msgSend(v22, "count") >= 2)
  {
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }

  return v22;
}

- (id)_relationshipForWorkout:(id)a3 activity:(id)a4 samples:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v8 = (id)MEMORY[0x1E0C9AA60];
  if (a5)
    v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CB6E40];
  v10 = v8;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v9 alloc], "initWithWorkout:activity:samples:", v13, v12, v10);

  return v14;
}

- (int64_t)_batchObjectsWithError:(id *)a3 batchHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = a4;
  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity entityEnumeratorWithProfile:](HDWorkoutEntity, "entityEnumeratorWithProfile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilter:", v9);

  if (v8)
    v10 = -[HDBatchedQueryServer batchObjectsWithEnumerator:error:handler:](self, "batchObjectsWithEnumerator:error:handler:", v8, a3, v6);
  else
    v10 = 1;

  return v10;
}

- (void)_handleBatchedQueryResult:(int64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  int v15;
  HDWorkoutEffortRelationshipQueryServer *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  switch(a3)
  {
    case 1:
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        v15 = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v6;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating update results: %{public}@", (uint8_t *)&v15, 0x16u);
        if (v6)
          goto LABEL_5;
      }
      else if (v6)
      {
LABEL_5:
        -[HDWorkoutEffortRelationshipQueryServer queryClient](self, "queryClient");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryServer queryUUID](self, "queryUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "client_deliverError:forQuery:", v6, v9);

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Sample enumeration failed without reporting an error."));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        v15 = 138543362;
        v16 = self;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized", (uint8_t *)&v15, 0xCu);
      }
      -[HDWorkoutEffortRelationshipQueryServer queryClient](self, "queryClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKWorkoutEffortRelationshipQueryServerConfiguration anchor](self->_ratingOfExertionAssociationQueryServerConfiguration, "anchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryServer queryUUID](self, "queryUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E0C9AA60], 1, v11, v12);

LABEL_9:
      goto LABEL_15;
    case 3:
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v15 = 138543362;
      v16 = self;
      v14 = "%{public}@: Suspended during enumeration";
      goto LABEL_14;
    case 4:
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      v15 = 138543362;
      v16 = self;
      v14 = "%{public}@: Canceled during enumeration";
LABEL_14:
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v15, 0xCu);
LABEL_15:

      return;
    default:
      goto LABEL_15;
  }
}

- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  HDWorkoutEffortRelationshipQueryServer *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  HDWorkoutEffortRelationshipQueryServer *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[HDQueryServer clientProxy](self, "clientProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v11;
    v18 = "%{public}@: Object is not a Workout: %{public}@";
LABEL_9:
    _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_10;
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      v29 = v12;
      v18 = "%{public}@: SubObject is not a WorkoutActivity: %{public}@";
      goto LABEL_9;
    }
  }
  -[HDQueryServer queryQueue](self, "queryQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke;
  v19[3] = &unk_1E6CFEFF0;
  v20 = v14;
  v21 = self;
  v22 = v15;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  dispatch_async(v16, v19);

LABEL_10:
}

void __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[6];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  id v54;
  void *v55;
  uint8_t v56[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int128 buf;
  uint64_t v63;
  char v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  v3 = *(_QWORD **)(a1 + 40);
  if (v2 <= v3[28])
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "%{public}@: Anchor is less then or equal to anchor returned in initial results. Skipping update", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v3, "queryUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authorizationOracle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v11, "readAuthorizationStatusesForTypes:error:", v9, &v54);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v54;

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v13, v4);
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v63 = 0x2020000000;
      v64 = 0;
      v50 = 0;
      v51 = &v50;
      v52 = 0x2020000000;
      v53 = 0;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke_206;
      v49[3] = &unk_1E6D0CF38;
      v49[4] = &buf;
      v49[5] = &v50;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v49);
      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24) && *((_BYTE *)v51 + 24))
      {
        objc_msgSend(*(id *)(a1 + 56), "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForDataUUID();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "profile");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "database");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDDataEntity, "anyWithPredicate:healthDatabase:error:", v17, v19, &v48);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v48;

        if (!v45)
        {
          _HKInitializeLogging();
          v21 = (id)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v40 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 56), "UUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v56 = 138543874;
            v57 = v40;
            v58 = 2114;
            v59 = v41;
            v60 = 2114;
            v61 = v20;
            _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get persisted if for workout: %{public}@, %{public}@", v56, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v20, v4);
        }
        v22 = *(void **)(a1 + 40);
        v23 = objc_msgSend(v45, "persistentID");
        v24 = *(_QWORD *)(a1 + 64);
        v25 = objc_msgSend(*(id *)(a1 + 72), "count");
        v47 = v20;
        objc_msgSend(v22, "_fetchSamplesForWorkoutPID:activity:options:limit:sortDescending:error:", v23, v24, 1, v25, 1, &v47);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v47;

        if (v27)
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v39 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)v56 = 138543618;
            v57 = v39;
            v58 = 2114;
            v59 = v27;
            _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch associated effort samples: %{public}@", v56, 0x16u);
          }
          objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v27, v4);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "client");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "authorizationOracle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(_QWORD *)(a1 + 32);
          v46 = 0;
          objc_msgSend(v31, "filteredObjectsForReadAuthorization:anchor:error:", v26, v32, &v46);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v46;

          if (v44)
          {
            v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6E40]), "initWithWorkout:activity:samples:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v44);
            _HKInitializeLogging();
            v33 = *MEMORY[0x1E0CB5348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
            {
              v34 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)v56 = 138543619;
              v57 = v34;
              v58 = 2113;
              v59 = v43;
              _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Delivering relationships to client: %{private}@", v56, 0x16u);
            }
            v35 = *(void **)(a1 + 48);
            v55 = v43;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6A80], "anchorFromValue:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", v36, 1, v37, v4);

          }
          else
          {
            _HKInitializeLogging();
            v38 = *MEMORY[0x1E0CB5348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
            {
              v42 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)v56 = 138543618;
              v57 = v42;
              v58 = 2114;
              v59 = v27;
              _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", v56, 0x16u);
            }
            objc_msgSend(*(id *)(a1 + 48), "client_deliverError:forQuery:", v27, v4);
          }

        }
      }
      else
      {
        v29 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB6A80], "anchorFromValue:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "client_deliverWorkoutEffortRelationships:isFinalBatch:anchor:forQuery:", MEMORY[0x1E0C9AA60], 1, v27, v4);
      }

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&buf, 8);
    }

  }
}

void __101__HDWorkoutEffortRelationshipQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6978], "workoutType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {
    v7 = objc_msgSend(v5, "canRead");

    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (objc_msgSend(v5, "canRead"))
  {
    v8 = *(_QWORD *)(a1 + 40);
    goto LABEL_7;
  }
LABEL_8:

}

- (_HKWorkoutEffortRelationshipQueryServerConfiguration)ratingOfExertionAssociationQueryServerConfiguration
{
  return self->_ratingOfExertionAssociationQueryServerConfiguration;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(int64_t)a3
{
  self->_anchor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingOfExertionAssociationQueryServerConfiguration, 0);
}

@end
