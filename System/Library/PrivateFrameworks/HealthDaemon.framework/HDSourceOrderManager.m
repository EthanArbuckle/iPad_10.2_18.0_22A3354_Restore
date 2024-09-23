@implementation HDSourceOrderManager

BOOL __60__HDSourceOrderManager__sourceCacheItemForObjectType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _HDSourceOrderTransactionCache *v6;
  id WeakRetained;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;

  v5 = a2;
  v6 = [_HDSourceOrderTransactionCache alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v8 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v6->super.isa, WeakRetained);

  -[HDSourceOrderManager _sourceCacheItemForObjectType:transactionCache:transaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v8, v5, a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v12;
}

- (HDSourceOrderManager)initWithProfile:(id)a3
{
  id v5;
  HDSourceOrderManager *v6;
  HDSourceOrderManager *v7;
  HDDatabaseValueCache *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  HDDatabaseValueCache *sourceOrdersForTypeCache;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceOrderManager.mm"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HDSourceOrderManager;
  v6 = -[HDSourceOrderManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    v8 = [HDDatabaseValueCache alloc];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDDatabaseValueCache initWithName:](v8, "initWithName:", v10);
    sourceOrdersForTypeCache = v7->_sourceOrdersForTypeCache;
    v7->_sourceOrdersForTypeCache = (HDDatabaseValueCache *)v11;

  }
  return v7;
}

- (BOOL)resetCacheWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HDSourceOrderManager_resetCacheWithError___block_invoke;
  v8[3] = &unk_1E6CF4340;
  v8[4] = self;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, v8);

  return (char)a3;
}

uint64_t __44__HDSourceOrderManager_resetCacheWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "resetCacheWithTransaction:", a2);
  return 1;
}

- (void)resetCacheWithTransaction:(id)a3
{
  -[HDDatabaseValueCache removeAllObjectsWithTransaction:](self->_sourceOrdersForTypeCache, "removeAllObjectsWithTransaction:", a3);
}

- (BOOL)createSourceOrdersWithCodables:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HDSourceOrderManager_createSourceOrdersWithCodables_error___block_invoke;
  v11[3] = &unk_1E6CF4608;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v11);

  return (char)a4;
}

uint64_t __61__HDSourceOrderManager_createSourceOrdersWithCodables_error___block_invoke(uint64_t a1, void *a2)
{
  _HDSourceOrderTransactionCache *v3;
  id WeakRetained;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  uint64_t v10;
  id obj;
  id v13;
  id *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v3 = [_HDSourceOrderTransactionCache alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v3->super.isa, WeakRetained);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v14 = v5;
        v15 = v13;
        v9 = HKWithAutoreleasePool();

        if (!v9)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

BOOL __61__HDSourceOrderManager_createSourceOrdersWithCodables_error___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  __int128 buf;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  v8 = *(void **)(a1 + 56);
  v9 = v4;
  v45 = v6;
  v10 = WeakRetained;
  v46 = v8;
  if (!v5)
    goto LABEL_19;
  if ((objc_msgSend(v9, "hasSyncIdentity") & 1) == 0)
  {
    objc_msgSend(v10, "syncIdentityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "legacySyncIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "codableSyncIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSyncIdentity:", v14);

  }
  v15 = v9;
  if (!objc_msgSend(v15, "hasObjectType")
    || !objc_msgSend(v15, "hasUserOrdered")
    || !objc_msgSend(v15, "hasSourceUUIDs")
    || (objc_msgSend(v15, "hasSyncIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 3, CFSTR("Invalid codable source order %@"), v15);

LABEL_19:
    v23 = 0;
LABEL_20:

    goto LABEL_21;
  }

  objc_msgSend(v15, "decodedDataTypeCode");
  if ((_HKValidDataTypeCode() & 1) == 0)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v15, "objectType");
      _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Ignoring source order for invalid data type code %lld", (uint8_t *)&buf, 0xCu);
    }

    v23 = 2;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", objc_msgSend(v15, "decodedDataTypeCode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    _HKInitializeLogging();
    v34 = (id)*MEMORY[0x1E0CB52B0];
    v44 = v34;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v15, "objectType");
      _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Ignoring source order for unknown data type code %lld", (uint8_t *)&buf, 0xCu);
    }
    v23 = 2;
    goto LABEL_39;
  }
  -[HDSourceOrderManager _sourceCacheItemForObjectType:transactionCache:transaction:error:](v5, v16, v45, v46, (uint64_t)a2);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v44 = (void *)v17;
    +[HDLogicalSourceOrderEntity syncIdentityForType:profile:transaction:error:](HDLogicalSourceOrderEntity, "syncIdentityForType:profile:transaction:error:", v16, v10, v46, a2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v41 = v16;
      v19 = objc_loadWeakRetained((id *)(v5 + 8));
      objc_msgSend(v19, "syncIdentityManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentSyncIdentity");
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = v41;
      v18 = v21;
    }
    v43 = (void *)v18;
    -[HDSourceOrderManager _sourceOrderForCodableSourceOrder:transactionCache:transaction:error:](v5, v15, v45, v46, (uint64_t)a2);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v42 = (void *)v22;
    if (v22 && (void *)v22 != v44)
    {
      objc_msgSend(v15, "syncIdentity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v24, a2);
      v25 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v25;
      if (v25)
      {
        v26 = objc_loadWeakRetained((id *)(v5 + 8));
        objc_msgSend(v26, "syncIdentityManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v25, 1, v46, a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]((uint64_t)&buf, v5, v44, v42, v43, v28);
          v39 = (id)buf;
          v29 = *((id *)&buf + 1);
          objc_msgSend(v29, "entity");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[HDSourceOrderManager _updateSourceOrder:type:syncIdentity:transactionCache:transaction:error:](v5, v39, v16, objc_msgSend(v30, "persistentID"), v46, (uint64_t)a2);

          v23 = v31;
        }
        else
        {
          v28 = 0;
          _HKInitializeLogging();
          v36 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            v38 = *a2;
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v38;
            _os_log_fault_impl(&dword_1B7802000, v36, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&buf, 0xCu);
          }
          v23 = 0;
        }

      }
      else
      {
        _HKInitializeLogging();
        v35 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          v37 = *a2;
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v37;
          _os_log_fault_impl(&dword_1B7802000, v35, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", (uint8_t *)&buf, 0xCu);
        }
        v23 = 0;
      }

    }
LABEL_39:

    goto LABEL_40;
  }
  v23 = 0;

LABEL_40:
  if ((v23 | 2) == 2)
    return v23 != 0;
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", objc_msgSend(*(id *)(a1 + 40), "decodedDataTypeCode"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:transaction:", v10, *(_QWORD *)(a1 + 56));
LABEL_21:

  return v23 != 0;
}

- (id)orderedSourcesForObjectType:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  if (self)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__69;
    v21 = __Block_byref_object_dispose__69;
    v22 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__HDSourceOrderManager__sourceCacheItemForObjectType_error___block_invoke;
    v14[3] = &unk_1E6CF4720;
    v14[4] = self;
    v16 = &v17;
    v15 = v6;
    v9 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v14);

    if (v9)
      v10 = (void *)v18[5];
    else
      v10 = 0;
    v11 = v10;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  -[_HDCachedSourceOrder sources]((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)orderedSourceIDsForObjectType:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
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
  v18 = __Block_byref_object_copy__69;
  v19 = __Block_byref_object_dispose__69;
  v20 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HDSourceOrderManager_orderedSourceIDsForObjectType_error___block_invoke;
  v12[3] = &unk_1E6CF4630;
  v14 = &v15;
  v9 = v6;
  v13 = v9;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

BOOL __60__HDSourceOrderManager_orderedSourceIDsForObjectType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v5 = a2;
  +[HDLogicalSourceOrderEntity sourceIDsWithDataType:transaction:error:](HDLogicalSourceOrderEntity, "sourceIDsWithDataType:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  return v9;
}

- (id)orderedSourceIDsWithUnorderedIDs:(id)a3 objectType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__69;
  v24 = __Block_byref_object_dispose__69;
  v25 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__HDSourceOrderManager_orderedSourceIDsWithUnorderedIDs_objectType_error___block_invoke;
  v16[3] = &unk_1E6CF4658;
  v19 = &v20;
  v12 = v9;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v16);

  v14 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v14;
}

BOOL __74__HDSourceOrderManager_orderedSourceIDsWithUnorderedIDs_objectType_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v5 = a2;
  +[HDLogicalSourceOrderEntity sourceIDsWithDataType:unorderedIDs:transaction:error:](HDLogicalSourceOrderEntity, "sourceIDsWithDataType:unorderedIDs:transaction:error:", a1[4], a1[5], v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
  return v9;
}

- (BOOL)updateOrderedSources:(id)a3 forObjectType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke;
  v15[3] = &unk_1E6CF42F0;
  v15[4] = self;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

BOOL __65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _HDSourceOrderTransactionCache *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _HDCachedSourceOrder *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  id v19;
  char *obj;
  id *v21;
  uint64_t v22[7];
  id *v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  __n128 (*v34)(__n128 *, __n128 *);
  void (*v35)(uint64_t);
  void *v36;
  _QWORD v37[3];
  void **v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v5 = [_HDSourceOrderTransactionCache alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v21 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v5->super.isa, WeakRetained);

  v31 = 0;
  v32 = &v31;
  v33 = 0x4812000000;
  v34 = __Block_byref_object_copy__195;
  v35 = __Block_byref_object_dispose__196;
  v36 = &unk_1B805FAAD;
  memset(v37, 0, sizeof(v37));
  std::vector<_HDWrappedSource>::reserve(v37, objc_msgSend(*(id *)(a1 + 40), "count"));
  objc_msgSend(v19, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (char *)*(id *)(a1 + 40);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    v10 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v22[3] = v10;
        v22[4] = 3221225472;
        v22[5] = (uint64_t)__65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke_197;
        v22[6] = (uint64_t)&unk_1E6CF4680;
        v23 = v21;
        v24 = v12;
        v25 = v7;
        v26 = &v31;
        LODWORD(v12) = HKWithAutoreleasePool();

        if (!(_DWORD)v12)
        {
          v17 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = [_HDCachedSourceOrder alloc];
  memset(v22, 0, 24);
  std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v22, v32[6], v32[7], 0xAAAAAAAAAAAAAAABLL * ((v32[7] - v32[6]) >> 3));
  obj = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v13, v22, 1, 0);
  v38 = (void **)v22;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v38);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 48);
  v16 = objc_loadWeakRetained((id *)(v14 + 8));
  v17 = -[HDSourceOrderManager _updateSourceOrder:type:syncIdentity:transactionCache:transaction:error:](v14, obj, v15, objc_msgSend(v16, "currentSyncIdentityPersistentID"), v19, a3);

LABEL_11:
  _Block_object_dispose(&v31, 8);
  v38 = (void **)v37;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v38);

  return v17;
}

BOOL __65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke_197(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  CFAbsoluteTime Current;
  int64x2_t *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  CFAbsoluteTime *v21;
  unint64_t v22;
  uint64_t v23;
  CFAbsoluteTime *v24;
  uint64_t v25;
  uint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  uint64_t v30;
  int64x2_t v31;
  uint64_t v32;
  int64x2_t *v33;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDSourceOrderTransactionCache orderedSourceIDsForBundleIdentifier:database:error:](v4, v5, *(void **)(a1 + 48), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(id *)(a1 + 40);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(int64x2_t **)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v9[3].u64[1];
    v11 = v9[4].u64[0];
    if (v10 >= v11)
    {
      v13 = v9[3].i64[0];
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v13) >> 3);
      if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v13) >> 3);
      v16 = 2 * v15;
      if (2 * v15 <= v14 + 1)
        v16 = v14 + 1;
      if (v15 >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      v33 = v9 + 4;
      if (v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v17);
        v20 = v19;
      }
      else
      {
        v18 = 0;
        v20 = 0;
      }
      v21 = (CFAbsoluteTime *)&v18[24 * v14];
      *(_QWORD *)v21 = v7;
      v21[1] = Current;
      *((_BYTE *)v21 + 16) = 1;
      v23 = v9[3].i64[0];
      v22 = v9[3].u64[1];
      if (v22 == v23)
      {
        v27 = vdupq_n_s64(v22);
        v24 = v21;
      }
      else
      {
        v24 = v21;
        do
        {
          v25 = *(_QWORD *)(v22 - 24);
          v22 -= 24;
          *(_QWORD *)v22 = 0;
          *((_QWORD *)v24 - 3) = v25;
          v24 -= 3;
          v26 = *(_QWORD *)(v22 + 8);
          *((_BYTE *)v24 + 16) = *(_BYTE *)(v22 + 16);
          *((_QWORD *)v24 + 1) = v26;
        }
        while (v22 != v23);
        v27 = v9[3];
      }
      v12 = (char *)(v21 + 3);
      v9[3].i64[0] = (uint64_t)v24;
      v9[3].i64[1] = (uint64_t)v12;
      v31 = v27;
      v28 = v9[4].i64[0];
      v9[4].i64[0] = (uint64_t)&v18[24 * v20];
      v32 = v28;
      v30 = v27.i64[0];
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      *(_QWORD *)v10 = v7;
      *(CFAbsoluteTime *)(v10 + 8) = Current;
      *(_BYTE *)(v10 + 16) = 1;
      v12 = (char *)(v10 + 24);
    }
    v9[3].i64[1] = (uint64_t)v12;

  }
  return v6 != 0;
}

- (BOOL)_updateSourceOrder:(uint64_t)a1 type:(void *)a2 syncIdentity:(void *)a3 transactionCache:(uint64_t)a4 transaction:(void *)a5 error:(uint64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  os_log_t *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqual:", v11) & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:transaction:", v11, v12, v13);
      _HKInitializeLogging();
      v16 = (os_log_t *)MEMORY[0x1E0CB52B0];
      v17 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
      {
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[_HDCachedSourceOrder sources]((uint64_t)v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v12;
          v29 = 2112;
          v30 = v22;
          _os_log_debug_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEBUG, "Updating source order for type %@ sources (%@)", buf, 0x16u);

        }
      }
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __96__HDSourceOrderManager__updateSourceOrder_type_syncIdentity_transactionCache_transaction_error___block_invoke;
      v23[3] = &unk_1E6CF46F8;
      v24 = v11;
      v25 = v13;
      v26 = a4;
      v15 = +[HDLogicalSourceOrderEntity updateOrderedLogicalSourcesForType:transaction:error:updateHandler:](HDLogicalSourceOrderEntity, "updateOrderedLogicalSourcesForType:transaction:error:updateHandler:", v12, v25, a6, v23);
      if (!v15)
      {
        _HKInitializeLogging();
        v19 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v12;
          v29 = 2114;
          v30 = 0;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to update source order for type %@: %{public}@.", buf, 0x16u);
        }
      }

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (char)_sourceOrderForCodableSourceOrder:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  _HDCachedSourceOrder *v21;
  char *v22;
  id v24;
  id obj;
  void *v26;
  id v27;
  id v28;
  uint64_t v29[7];
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  __n128 (*v44)(__n128 *, __n128 *);
  void (*v45)(uint64_t);
  void *v46;
  _QWORD v47[3];
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  void **v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v27 = a3;
  v28 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "sourceUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke;
  v48[3] = &unk_1E6CF46A8;
  v24 = v9;
  v49 = v24;
  v13 = v11;
  v50 = v13;
  v14 = v10;
  v51 = v14;
  v15 = +[HDSourceEntity enumerateBundleIdentifiersForSourcesForUUIDData:transaction:error:enumerationHandler:](HDSourceEntity, "enumerateBundleIdentifiersForSourcesForUUIDData:transaction:error:enumerationHandler:", v12, v28, a5, v48);

  if (v15)
  {
    v41 = 0;
    v42 = &v41;
    v44 = __Block_byref_object_copy__195;
    v45 = __Block_byref_object_dispose__196;
    v43 = 0x4812000000;
    v46 = &unk_1B805FAAD;
    memset(v47, 0, sizeof(v47));
    std::vector<_HDWrappedSource>::reserve(v47, objc_msgSend(v14, "count", v11, v9, v10));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "sourceManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v14;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          v29[3] = MEMORY[0x1E0C809B0];
          v29[4] = 3221225472;
          v29[5] = (uint64_t)__93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke_2;
          v29[6] = (uint64_t)&unk_1E6CF46D0;
          v30 = v26;
          v31 = v20;
          v32 = v13;
          v33 = a1;
          v34 = v27;
          v35 = v28;
          v36 = &v41;
          LODWORD(v20) = HKWithAutoreleasePool();

          if (!(_DWORD)v20)
          {

            v22 = 0;
            goto LABEL_13;
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        if (v17)
          continue;
        break;
      }
    }

    v21 = [_HDCachedSourceOrder alloc];
    memset(v29, 0, 24);
    std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v29, v42[6], v42[7], 0xAAAAAAAAAAAAAAABLL * ((v42[7] - v42[6]) >> 3));
    v22 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v21, v29, objc_msgSend(v24, "userOrdered"), 0);
    v52 = (void **)v29;
    std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v52);
LABEL_13:

    _Block_object_dispose(&v41, 8);
    v52 = (void **)v47;
    std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v52);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke(id *a1, unint64_t a2, void *a3)
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = 0.0;
  if (objc_msgSend(a1[4], "modificationDatesCount") > a2)
    v5 = *(double *)(objc_msgSend(a1[4], "modificationDates") + 8 * a2);
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    if (v9 < v5)
      v9 = v5;
    objc_msgSend(v8, "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v11, v12);

    objc_msgSend(a1[6], "addObject:", v12);
  }

}

BOOL __93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  int64x2_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  int64x2_t v31;
  uint64_t v32;
  id v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  int64x2_t v38;
  uint64_t v39;
  int64x2_t *v40;

  objc_msgSend(*(id *)(a1 + 32), "clientSourceForBundleIdentifier:error:", *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v34 = v6;
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v35 = v8;

    v36 = 1;
    v9 = -[HDSourceOrderManager _updateOrderedSourceIDsForWrappedSource:transactionCache:transaction:error:](*(_QWORD *)(a1 + 56), &v34, *(void **)(a1 + 64), *(void **)(a1 + 72), a2);
    if (v9)
    {
      v10 = *(int64x2_t **)(*(_QWORD *)(a1 + 80) + 8);
      v11 = v10[3].u64[1];
      v12 = v10[4].u64[0];
      if (v11 >= v12)
      {
        v15 = v10[3].i64[0];
        v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v15) >> 3);
        if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - v15) >> 3);
        v18 = 2 * v17;
        if (2 * v17 <= v16 + 1)
          v18 = v16 + 1;
        if (v17 >= 0x555555555555555)
          v19 = 0xAAAAAAAAAAAAAAALL;
        else
          v19 = v18;
        v40 = v10 + 4;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v19);
          v22 = v21;
        }
        else
        {
          v20 = 0;
          v22 = 0;
        }
        v23 = &v20[24 * v16];
        v24 = v6;
        v23[16] = v36;
        v25 = v35;
        *(_QWORD *)v23 = v24;
        *((_QWORD *)v23 + 1) = v25;
        v27 = v10[3].i64[0];
        v26 = v10[3].u64[1];
        if (v26 == v27)
        {
          v6 = v24;
          v31 = vdupq_n_s64(v26);
          v28 = v23;
        }
        else
        {
          v28 = v23;
          do
          {
            v29 = *(_QWORD *)(v26 - 24);
            v26 -= 24;
            *(_QWORD *)v26 = 0;
            *((_QWORD *)v28 - 3) = v29;
            v28 -= 24;
            v30 = *(_QWORD *)(v26 + 8);
            v28[16] = *(_BYTE *)(v26 + 16);
            *((_QWORD *)v28 + 1) = v30;
          }
          while (v26 != v27);
          v31 = v10[3];
          v6 = v34;
        }
        v14 = v23 + 24;
        v10[3].i64[0] = (uint64_t)v28;
        v10[3].i64[1] = (uint64_t)(v23 + 24);
        v38 = v31;
        v32 = v10[4].i64[0];
        v10[4].i64[0] = (uint64_t)&v20[24 * v22];
        v39 = v32;
        v37 = v31.i64[0];
        std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v37);
      }
      else
      {
        v6 = v6;
        v13 = v35;
        *(_QWORD *)v11 = v6;
        *(_QWORD *)(v11 + 8) = v13;
        *(_BYTE *)(v11 + 16) = v36;
        v14 = (char *)(v11 + 24);
      }
      v10[3].i64[1] = (uint64_t)v14;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_updateOrderedSourceIDsForWrappedSource:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;

  v9 = a3;
  v10 = a4;
  if (a1)
  {
    objc_msgSend(*a2, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "databaseForEntityClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDSourceOrderTransactionCache orderedSourceIDsForBundleIdentifier:database:error:]((uint64_t)v9, v11, v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_mergedSourceOrderForExistingOrder:(void *)a3 incomingOrder:(void *)a4 existingSyncIdentity:(void *)a5 incomingSyncIdentity:(void *)a6
{
  _BYTE *v10;
  _BYTE *v11;
  id *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  _QWORD *v19;
  id v20;
  id v21;
  void *v22;
  id *j;
  id *v24;
  id v25;
  id v26;
  void *v27;
  id *v28;
  id *v29;
  id v30;
  char v31;
  id *v32;
  uint64_t v33;
  char v34;
  char *v35;
  id *v36;
  uint64_t v37;
  char v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  char v54;
  char *v55;
  char *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  int64x2_t v63;
  char *v64;
  id v65;
  char *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  int64x2_t v73;
  char *v74;
  id v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  int64x2_t v89;
  char *v90;
  id v91;
  uint64_t v92;
  uint64_t k;
  id v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  int64x2_t v113;
  char *v114;
  _HDCachedSourceOrder *v115;
  char *v116;
  void *v117;
  char *v118;
  void *v119;
  _HDCachedSourceOrder *v120;
  char *v121;
  void *v122;
  _BYTE *v123;
  _BYTE *v124;
  uint64_t v126[3];
  __int128 v127;
  _QWORD v128[6];
  uint64_t *p_i;
  int64x2_t v130;
  char *v131;
  id *p_location;
  id *v133;
  uint64_t *v134;
  id *v135;
  id *v136;
  id *i;
  id *v138;
  id *v139;
  _QWORD v140[3];
  __int128 v141;
  char *v142;
  id v143;
  uint64_t v144;
  uint64_t v145[3];
  id location;
  id v147;
  id v148;
  uint64_t v149;
  int64x2_t v150;
  char *v151;
  char **v152;

  v10 = a3;
  v11 = a4;
  v148 = a5;
  v147 = a6;
  v12 = (id *)(a2 + 8);
  WeakRetained = objc_loadWeakRetained((id *)(a2 + 8));
  objc_msgSend(WeakRetained, "syncIdentityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentSyncIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  location = v15;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (v10[9])
  {
    *(_QWORD *)a1 = v11;
    *(_QWORD *)(a1 + 8) = v147;
    goto LABEL_120;
  }
  v123 = v11;
  v124 = v10;
  if ((v10[8] != 0) == (v11[8] != 0))
  {
    v26 = objc_loadWeakRetained(v12);
    objc_msgSend(v26, "syncIdentityManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentSyncIdentity");
    v144 = objc_claimAutoreleasedReturnValue();

    v142 = 0;
    v143 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v141 = 0uLL;
    -[_HDCachedSourceOrder orderedSources]((char *)v140, (uint64_t)v10);
    -[_HDCachedSourceOrder orderedSources]((char *)&v138, (uint64_t)v11);
    v28 = (id *)v140[0];
    v29 = v138;
    v136 = v138;
    for (i = (id *)v140[0]; ; v28 = i)
    {
      if (v28 == (id *)v140[1])
      {
        if (v29 == v139)
        {
          v120 = [_HDCachedSourceOrder alloc];
          memset(v126, 0, sizeof(v126));
          std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v126, v141, *((uint64_t *)&v141 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v141 + 1) - v141) >> 3));
          v10 = v124;
          v121 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v120, v126, v124[8], 0);
          p_i = v126;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
          *(_QWORD *)a1 = v121;
          *(_QWORD *)(a1 + 8) = location;
          p_i = (uint64_t *)&v138;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
          p_i = v140;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
          p_i = (uint64_t *)&v141;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);

          v119 = (void *)v144;
          goto LABEL_119;
        }
        if ((objc_msgSend(v143, "containsObject:", *v29) & 1) == 0)
        {
          v32 = v136;
          v33 = *((_QWORD *)&v141 + 1);
          if (*((_QWORD *)&v141 + 1) >= (unint64_t)v142)
          {
            v40 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v141 + 1) - v141) >> 3);
            v41 = v40 + 1;
            if (v40 + 1 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_121;
            if (0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3) > v41)
              v41 = 0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v142[-v141] >> 3) >= 0x555555555555555)
              v42 = 0xAAAAAAAAAAAAAAALL;
            else
              v42 = v41;
            p_location = (id *)&v142;
            if (v42)
            {
              v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v42);
              v45 = v44;
            }
            else
            {
              v43 = 0;
              v45 = 0;
            }
            v56 = &v43[24 * v40];
            *(_QWORD *)v56 = *v32;
            v57 = v32[1];
            v56[16] = *((_BYTE *)v32 + 16);
            *((_QWORD *)v56 + 1) = v57;
            v58 = *((_QWORD *)&v141 + 1);
            v59 = v141;
            if (*((_QWORD *)&v141 + 1) == (_QWORD)v141)
            {
              v63 = vdupq_n_s64(*((unint64_t *)&v141 + 1));
              v60 = v56;
            }
            else
            {
              v60 = v56;
              do
              {
                v61 = *(_QWORD *)(v58 - 24);
                v58 -= 24;
                *(_QWORD *)v58 = 0;
                *((_QWORD *)v60 - 3) = v61;
                v60 -= 24;
                v62 = *(_QWORD *)(v58 + 8);
                v60[16] = *(_BYTE *)(v58 + 16);
                *((_QWORD *)v60 + 1) = v62;
              }
              while (v58 != v59);
              v63 = (int64x2_t)v141;
            }
            v35 = v56 + 24;
            *(_QWORD *)&v141 = v60;
            *((_QWORD *)&v141 + 1) = v56 + 24;
            v130 = v63;
            v64 = v142;
            v142 = &v43[24 * v45];
            v131 = v64;
            p_i = (uint64_t *)v63.i64[0];
            std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&p_i);
          }
          else
          {
            *(_QWORD *)v33 = *v136;
            v34 = *((_BYTE *)v32 + 16);
            *(_QWORD *)(v33 + 8) = v32[1];
            *(_BYTE *)(v33 + 16) = v34;
            v35 = (char *)(v33 + 24);
          }
          *((_QWORD *)&v141 + 1) = v35;
          objc_msgSend(v143, "addObject:", *v136);
          if (location == v147)
            v65 = v147;
          else
            v65 = (id)v144;
          objc_storeStrong(&location, v65);
        }
LABEL_63:
        v136 += 3;
        goto LABEL_76;
      }
      v30 = *v28;
      if (v29 == v139)
        break;
      if (objc_msgSend(v143, "containsObject:", v30))
        goto LABEL_75;
      if (objc_msgSend(v143, "containsObject:", *v136))
        goto LABEL_63;
      p_i = (uint64_t *)&i;
      v130.i64[0] = (uint64_t)&v136;
      v130.i64[1] = (uint64_t)&v143;
      v131 = (char *)&v141;
      p_location = &location;
      v133 = &v148;
      v134 = &v144;
      v135 = &v147;
      *(_QWORD *)&v127 = &i;
      *((_QWORD *)&v127 + 1) = &v136;
      v128[0] = &v143;
      v128[1] = &v141;
      v128[2] = &location;
      v128[3] = &v148;
      v128[4] = &v144;
      v128[5] = &v147;
      if (v124[8])
      {
        if ((-[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_2::operator()(&p_i) & 1) != 0)
          goto LABEL_76;
        v31 = -[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_3::operator()((HKSource ****)&v127);
      }
      else
      {
        if ((-[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_3::operator()((HKSource ****)&v127) & 1) != 0)
          goto LABEL_76;
        v31 = -[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_2::operator()(&p_i);
      }
      if ((v31 & 1) == 0)
      {
        objc_msgSend(v143, "addObject:", *i);
        v52 = i;
        v53 = *((_QWORD *)&v141 + 1);
        if (*((_QWORD *)&v141 + 1) >= (unint64_t)v142)
        {
          v76 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v141 + 1) - v141) >> 3);
          v77 = v76 + 1;
          if (v76 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3) > v77)
            v77 = 0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v142[-v141] >> 3) >= 0x555555555555555)
            v78 = 0xAAAAAAAAAAAAAAALL;
          else
            v78 = v77;
          v152 = &v142;
          if (v78)
          {
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v78);
            v81 = v80;
          }
          else
          {
            v79 = 0;
            v81 = 0;
          }
          v82 = &v79[24 * v76];
          *(_QWORD *)v82 = *v52;
          v83 = v52[1];
          v82[16] = *((_BYTE *)v52 + 16);
          *((_QWORD *)v82 + 1) = v83;
          v84 = *((_QWORD *)&v141 + 1);
          v85 = v141;
          if (*((_QWORD *)&v141 + 1) == (_QWORD)v141)
          {
            v89 = vdupq_n_s64(*((unint64_t *)&v141 + 1));
            v86 = v82;
          }
          else
          {
            v86 = v82;
            do
            {
              v87 = *(_QWORD *)(v84 - 24);
              v84 -= 24;
              *(_QWORD *)v84 = 0;
              *((_QWORD *)v86 - 3) = v87;
              v86 -= 24;
              v88 = *(_QWORD *)(v84 + 8);
              v86[16] = *(_BYTE *)(v84 + 16);
              *((_QWORD *)v86 + 1) = v88;
            }
            while (v84 != v85);
            v89 = (int64x2_t)v141;
          }
          v55 = v82 + 24;
          *(_QWORD *)&v141 = v86;
          *((_QWORD *)&v141 + 1) = v82 + 24;
          v150 = v89;
          v90 = v142;
          v142 = &v79[24 * v81];
          v151 = v90;
          v149 = v89.i64[0];
          std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v149);
        }
        else
        {
          *(_QWORD *)v53 = *i;
          v54 = *((_BYTE *)v52 + 16);
          *(_QWORD *)(v53 + 8) = v52[1];
          *(_BYTE *)(v53 + 16) = v54;
          v55 = (char *)(v53 + 24);
        }
        *((_QWORD *)&v141 + 1) = v55;
        i += 3;
        if (location == v148)
          v91 = v148;
        else
          v91 = (id)v144;
        objc_storeStrong(&location, v91);
      }
LABEL_76:
      v29 = v136;
    }
    if ((objc_msgSend(v143, "containsObject:", v30) & 1) == 0)
    {
      v36 = i;
      v37 = *((_QWORD *)&v141 + 1);
      if (*((_QWORD *)&v141 + 1) >= (unint64_t)v142)
      {
        v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v141 + 1) - v141) >> 3);
        v47 = v46 + 1;
        if (v46 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_121:
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3) > v47)
          v47 = 0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v142[-v141] >> 3) >= 0x555555555555555)
          v48 = 0xAAAAAAAAAAAAAAALL;
        else
          v48 = v47;
        p_location = (id *)&v142;
        if (v48)
        {
          v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v48);
          v51 = v50;
        }
        else
        {
          v49 = 0;
          v51 = 0;
        }
        v66 = &v49[24 * v46];
        *(_QWORD *)v66 = *v36;
        v67 = v36[1];
        v66[16] = *((_BYTE *)v36 + 16);
        *((_QWORD *)v66 + 1) = v67;
        v68 = *((_QWORD *)&v141 + 1);
        v69 = v141;
        if (*((_QWORD *)&v141 + 1) == (_QWORD)v141)
        {
          v73 = vdupq_n_s64(*((unint64_t *)&v141 + 1));
          v70 = v66;
        }
        else
        {
          v70 = v66;
          do
          {
            v71 = *(_QWORD *)(v68 - 24);
            v68 -= 24;
            *(_QWORD *)v68 = 0;
            *((_QWORD *)v70 - 3) = v71;
            v70 -= 24;
            v72 = *(_QWORD *)(v68 + 8);
            v70[16] = *(_BYTE *)(v68 + 16);
            *((_QWORD *)v70 + 1) = v72;
          }
          while (v68 != v69);
          v73 = (int64x2_t)v141;
        }
        v39 = v66 + 24;
        *(_QWORD *)&v141 = v70;
        *((_QWORD *)&v141 + 1) = v66 + 24;
        v130 = v73;
        v74 = v142;
        v142 = &v49[24 * v51];
        v131 = v74;
        p_i = (uint64_t *)v73.i64[0];
        std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&p_i);
      }
      else
      {
        *(_QWORD *)v37 = *i;
        v38 = *((_BYTE *)v36 + 16);
        *(_QWORD *)(v37 + 8) = v36[1];
        *(_BYTE *)(v37 + 16) = v38;
        v39 = (char *)(v37 + 24);
      }
      *((_QWORD *)&v141 + 1) = v39;
      objc_msgSend(v143, "addObject:", *i);
      if (location == v148)
        v75 = v148;
      else
        v75 = (id)v144;
      objc_storeStrong(&location, v75);
    }
LABEL_75:
    i += 3;
    goto LABEL_76;
  }
  if (v10[8])
    v16 = v10;
  else
    v16 = v11;
  if (v10[8])
    v17 = v11;
  else
    v17 = v10;
  if (v10[8])
    v18 = &v148;
  else
    v18 = &v147;
  v19 = v16;
  v20 = v17;
  location = *v18;

  v127 = 0uLL;
  v128[0] = 0;
  v122 = v20;
  std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)&v127, v19[2], v19[3], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[3] - v19[2]) >> 3));
  v21 = objc_alloc(MEMORY[0x1E0C99E20]);
  v22 = (void *)objc_msgSend(v21, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v127 + 1) - v127) >> 3));
  v24 = (id *)*((_QWORD *)&v127 + 1);
  for (j = (id *)v127; j != v24; j += 3)
  {
    v25 = *j;
    objc_msgSend(v22, "addObject:", v25);

  }
  -[_HDCachedSourceOrder orderedSources]((char *)&v149, (uint64_t)v20);
  v92 = v149;
  for (k = v150.i64[0]; v92 != k; v92 += 24)
  {
    v94 = *(id *)v92;
    *(_QWORD *)&v141 = *(_QWORD *)(v92 + 8);
    BYTE8(v141) = *(_BYTE *)(v92 + 16);
    if ((objc_msgSend(v22, "containsObject:", v94) & 1) == 0)
    {
      v95 = objc_loadWeakRetained(v12);
      objc_msgSend(v95, "syncIdentityManager");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "currentSyncIdentity");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = location;
      location = v97;

      v99 = *((_QWORD *)&v127 + 1);
      if (*((_QWORD *)&v127 + 1) >= v128[0])
      {
        v101 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v127 + 1) - v127) >> 3);
        v102 = v101 + 1;
        if (v101 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)(v128[0] - v127) >> 3) > v102)
          v102 = 0x5555555555555556 * ((uint64_t)(v128[0] - v127) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v128[0] - v127) >> 3) >= 0x555555555555555)
          v103 = 0xAAAAAAAAAAAAAAALL;
        else
          v103 = v102;
        p_location = (id *)v128;
        if (v103)
        {
          v104 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v103);
          v106 = v105;
        }
        else
        {
          v104 = 0;
          v106 = 0;
        }
        v107 = &v104[24 * v101];
        *(_QWORD *)v107 = v94;
        v107[16] = BYTE8(v141);
        *((_QWORD *)v107 + 1) = v141;
        v108 = *((_QWORD *)&v127 + 1);
        v109 = v127;
        if (*((_QWORD *)&v127 + 1) == (_QWORD)v127)
        {
          v113 = vdupq_n_s64(*((unint64_t *)&v127 + 1));
          v110 = v107;
        }
        else
        {
          v110 = v107;
          do
          {
            v111 = *(_QWORD *)(v108 - 24);
            v108 -= 24;
            *(_QWORD *)v108 = 0;
            *((_QWORD *)v110 - 3) = v111;
            v110 -= 24;
            v112 = *(_QWORD *)(v108 + 8);
            v110[16] = *(_BYTE *)(v108 + 16);
            *((_QWORD *)v110 + 1) = v112;
          }
          while (v108 != v109);
          v113 = (int64x2_t)v127;
        }
        v100 = v107 + 24;
        *(_QWORD *)&v127 = v110;
        *((_QWORD *)&v127 + 1) = v100;
        v130 = v113;
        v114 = (char *)v128[0];
        v128[0] = &v104[24 * v106];
        v131 = v114;
        p_i = (uint64_t *)v113.i64[0];
        std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&p_i);
      }
      else
      {
        *(_QWORD *)v99 = v94;
        *(_QWORD *)(v99 + 8) = v141;
        *(_BYTE *)(v99 + 16) = BYTE8(v141);
        v100 = (char *)(v99 + 24);
      }
      *((_QWORD *)&v127 + 1) = v100;
    }

  }
  p_i = &v149;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
  v115 = [_HDCachedSourceOrder alloc];
  memset(v145, 0, sizeof(v145));
  std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v145, v127, *((uint64_t *)&v127 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v127 + 1) - v127) >> 3));
  v11 = v123;
  v10 = v124;
  v116 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v115, v145, 1, 0);
  p_i = v145;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
  v117 = *(void **)a1;
  *(_QWORD *)a1 = v116;
  v118 = v116;

  objc_storeStrong((id *)(a1 + 8), location);
  p_i = (uint64_t *)&v127;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);

  v119 = v19;
LABEL_119:

LABEL_120:
}

- (uint64_t)_mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:
{
  uint64_t v2;
  void *v3;
  void *v4;
  HKSource ***v5;
  HKSource **v6;
  HKSource **v7;
  HKSource **v8;
  char v9;
  char *v10;
  HKSource ***v11;
  uint64_t v12;
  HKSource **v13;
  HKSource **v14;
  char v15;
  char *v16;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  HKSource *v33;
  HKSource **v34;
  HKSource **v35;
  char *v36;
  uint64_t v37;
  HKSource *v38;
  HKSource **v39;
  char *v40;
  uint64_t v41;
  HKSource **v42;
  HKSource **v43;
  char *v44;
  uint64_t v45;
  HKSource *v46;
  HKSource **v47;
  HKSource **v48;
  void **v49;
  void **v50;
  void *v51;
  HKSource **v52;
  id v53;
  void *v54;
  HKSource **v55;
  HKSource **v56;
  HKSource **v57;
  HKSource **v58;
  _QWORD *v59;

  v2 = _HDDefaultSourceOrderCompare(***a1, **a1[1]);
  if (!v2)
  {
    -[HKSource bundleIdentifier](***a1, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSource bundleIdentifier](**a1[1], "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "compare:", v4);

  }
  if (v2 == 1)
  {
    objc_msgSend(*a1[2], "addObject:", **a1[1]);
    v11 = a1[3];
    v12 = (uint64_t)*a1[1];
    v13 = v11[1];
    v14 = v11[2];
    if (v13 >= v14)
    {
      v25 = 0xAAAAAAAAAAAAAAABLL * (v13 - *v11);
      if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_46;
      v26 = 0xAAAAAAAAAAAAAAABLL * (v14 - *v11);
      v27 = 2 * v26;
      if (2 * v26 <= v25 + 1)
        v27 = v25 + 1;
      if (v26 >= 0x555555555555555)
        v28 = 0xAAAAAAAAAAAAAAALL;
      else
        v28 = v27;
      v59 = v11 + 2;
      if (v28)
      {
        v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v28);
        v31 = v30;
      }
      else
      {
        v29 = 0;
        v31 = 0;
      }
      v40 = &v29[24 * v25];
      *(_QWORD *)v40 = *(id *)v12;
      v41 = *(_QWORD *)(v12 + 8);
      v40[16] = *(_BYTE *)(v12 + 16);
      *((_QWORD *)v40 + 1) = v41;
      v43 = *v11;
      v42 = v11[1];
      if (v42 == *v11)
      {
        v47 = v11[1];
        v44 = v40;
      }
      else
      {
        v44 = v40;
        do
        {
          v45 = (uint64_t)*(v42 - 3);
          v42 -= 3;
          *v42 = 0;
          *((_QWORD *)v44 - 3) = v45;
          v44 -= 24;
          v46 = v42[1];
          v44[16] = *((_BYTE *)v42 + 16);
          *((_QWORD *)v44 + 1) = v46;
        }
        while (v42 != v43);
        v47 = *v11;
        v42 = v11[1];
      }
      v16 = v40 + 24;
      *v11 = (HKSource **)v44;
      v55 = v47;
      v56 = v47;
      v11[1] = (HKSource **)(v40 + 24);
      v57 = v42;
      v52 = v11[2];
      v11[2] = (HKSource **)&v29[24 * v31];
      v58 = v52;
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v55);
    }
    else
    {
      *v13 = (HKSource *)*(id *)v12;
      v15 = *(_BYTE *)(v12 + 16);
      v13[1] = *(HKSource **)(v12 + 8);
      *((_BYTE *)v13 + 16) = v15;
      v16 = (char *)(v13 + 3);
    }
    v11[1] = (HKSource **)v16;
    *a1[1] += 3;
    v50 = (void **)a1[4];
    v51 = *v50;
    v49 = (void **)a1[7];
    goto LABEL_42;
  }
  if (v2 != -1)
    return 0;
  objc_msgSend(*a1[2], "addObject:", ***a1);
  v5 = a1[3];
  v6 = **a1;
  v7 = v5[1];
  v8 = v5[2];
  if (v7 >= v8)
  {
    v18 = 0xAAAAAAAAAAAAAAABLL * (v7 - *v5);
    if (v18 + 1 <= 0xAAAAAAAAAAAAAAALL)
    {
      v19 = 0xAAAAAAAAAAAAAAABLL * (v8 - *v5);
      v20 = 2 * v19;
      if (2 * v19 <= v18 + 1)
        v20 = v18 + 1;
      if (v19 >= 0x555555555555555)
        v21 = 0xAAAAAAAAAAAAAAALL;
      else
        v21 = v20;
      v59 = v5 + 2;
      if (v21)
      {
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v21);
        v24 = v23;
      }
      else
      {
        v22 = 0;
        v24 = 0;
      }
      v32 = &v22[24 * v18];
      *(_QWORD *)v32 = *v6;
      v33 = v6[1];
      v32[16] = *((_BYTE *)v6 + 16);
      *((_QWORD *)v32 + 1) = v33;
      v35 = *v5;
      v34 = v5[1];
      if (v34 == *v5)
      {
        v39 = v5[1];
        v36 = v32;
      }
      else
      {
        v36 = v32;
        do
        {
          v37 = (uint64_t)*(v34 - 3);
          v34 -= 3;
          *v34 = 0;
          *((_QWORD *)v36 - 3) = v37;
          v36 -= 24;
          v38 = v34[1];
          v36[16] = *((_BYTE *)v34 + 16);
          *((_QWORD *)v36 + 1) = v38;
        }
        while (v34 != v35);
        v39 = *v5;
        v34 = v5[1];
      }
      v10 = v32 + 24;
      *v5 = (HKSource **)v36;
      v55 = v39;
      v56 = v39;
      v5[1] = (HKSource **)(v32 + 24);
      v57 = v34;
      v48 = v5[2];
      v5[2] = (HKSource **)&v22[24 * v24];
      v58 = v48;
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v55);
      goto LABEL_38;
    }
LABEL_46:
    std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
  }
  *v7 = *v6;
  v9 = *((_BYTE *)v6 + 16);
  v7[1] = v6[1];
  *((_BYTE *)v7 + 16) = v9;
  v10 = (char *)(v7 + 3);
LABEL_38:
  v5[1] = (HKSource **)v10;
  **a1 += 3;
  v50 = (void **)a1[4];
  v49 = (void **)a1[5];
  v51 = *v50;
LABEL_42:
  if (v51 != *v49)
    v51 = *a1[6];
  v53 = v51;
  v54 = *v50;
  *v50 = v53;

  return 1;
}

- (id)_sourceCacheItemForObjectType:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = *(void **)(a1 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__HDSourceOrderManager__sourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke;
    v15[3] = &unk_1E6CF4748;
    v15[4] = a1;
    v16 = v9;
    v17 = v10;
    objc_msgSend(v12, "fetchObjectForKey:transaction:error:faultHandler:", v16, v11, a5, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL __54__HDSourceOrderManager__updateSourceOrder_type_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  _HDSourceOrderTransactionCache *v6;
  id WeakRetained;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;

  v5 = a2;
  v6 = [_HDSourceOrderTransactionCache alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v8 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v6->super.isa, WeakRetained);

  v9 = a1[4];
  v10 = (void *)a1[5];
  v11 = (void *)a1[6];
  v12 = objc_loadWeakRetained((id *)(v9 + 8));
  v13 = -[HDSourceOrderManager _updateSourceOrder:type:syncIdentity:transactionCache:transaction:error:](v9, v10, v11, objc_msgSend(v12, "currentSyncIdentityPersistentID"), v5, a3);

  return v13;
}

void __96__HDSourceOrderManager__updateSourceOrder_type_syncIdentity_transactionCache_transaction_error___block_invoke(uint64_t *a1, void *a2)
{
  void (**v3)(id, uint64_t, _BOOL8, _QWORD, uint64_t, double);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE buf[12];
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[_HDCachedSourceOrder orderedSources]((char *)&v16, a1[4]);
  v4 = v16;
  v5 = v17;
  if (v16 == v17)
    goto LABEL_13;
  while (!*(_BYTE *)(v4 + 16))
  {
LABEL_7:
    v4 += 24;
    if (v4 == v5)
      goto LABEL_13;
  }
  objc_msgSend(*(id *)v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v15 = 0;
  +[HDLogicalSourceEntity logicalSourceIDForBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "logicalSourceIDForBundleIdentifier:transaction:error:", v6, v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (v8)
  {
    v10 = objc_msgSend(v8, "longLongValue");
    v11 = a1[4];
    if (v11)
      v12 = *(unsigned __int8 *)(v11 + 8) != 0;
    else
      v12 = 0;
    v3[2](v3, v10, v12, 0, a1[6], *(double *)(v4 + 8));

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v13 = (id)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)v4, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v14;
    v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch logical source ID for bundle ID %@, %{public}@.", buf, 0x16u);

  }
LABEL_13:
  *(_QWORD *)buf = &v16;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

}

char *__89__HDSourceOrderManager__sourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint64_t v12;
  id *v13;
  id *i;
  id *v15;
  id *v16;
  uint64_t v17;
  char v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  int64x2_t v33;
  uint64_t v34;
  _HDCachedSourceOrder *v35;
  char *v36;
  void *v37;
  id *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  _HDCachedSourceOrder *v50;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  uint64_t *v61;
  void ***v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  void **v68;
  void ***v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, _QWORD *);
  uint64_t (*v72)(uint64_t);
  _BYTE v73[32];
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  __n128 (*v79)(__n128 *, __n128 *);
  void (*v80)(uint64_t);
  void *v81;
  _QWORD v82[3];
  uint64_t v83[7];
  id *v84;
  uint64_t v85;
  id v86;
  __int128 *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  _QWORD v94[4];
  void **v95;
  id *v96;
  int64x2_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  v56 = *(id *)(a1 + 40);
  v55 = v6;
  v7 = a2;
  v54 = v7;
  if (!v5)
  {
    v36 = 0;
    goto LABEL_45;
  }
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  objc_msgSend(WeakRetained, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0;
  v77 = &v76;
  v78 = 0x4812000000;
  v79 = __Block_byref_object_copy__212;
  v80 = __Block_byref_object_dispose__213;
  v81 = &unk_1B805FAAD;
  memset(v82, 0, sizeof(v82));
  v68 = 0;
  v69 = &v68;
  v70 = 0x5812000000;
  v71 = __Block_byref_object_copy__215;
  v72 = __Block_byref_object_dispose__216;
  memset(v73, 0, sizeof(v73));
  v74 = 0;
  v75 = 1065353216;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __94__HDSourceOrderManager__fetchSourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke;
  v58[3] = &unk_1E6CF4798;
  v61 = &v64;
  v59 = v10;
  v11 = v8;
  v60 = v11;
  v62 = &v68;
  v63 = &v76;
  v53 = v59;
  if (+[HDLogicalSourceOrderEntity enumerateOrderedSourceIDsForType:transaction:error:block:](HDLogicalSourceOrderEntity, "enumerateOrderedSourceIDsForType:transaction:error:block:", v56, v11, a3, v58))
  {
    v12 = v77[7] - v77[6];
    if (v12)
    {
      v92 = 0uLL;
      v93[0] = 0;
      std::vector<_HDWrappedSource>::reserve(&v92, v12 >> 3);
      v13 = (id *)v77[6];
      for (i = (id *)v77[7]; v13 != i; ++v13)
      {
        *(_QWORD *)&v88 = *v13;
        v96 = (id *)&v88;
        v15 = (id *)std::__hash_table<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,std::__unordered_map_hasher<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectHash,HDNSObjectEqual,true>,std::__unordered_map_equal<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectEqual,HDNSObjectHash,true>,std::allocator<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>>>::__emplace_unique_key_args<HKSource * {__strong},std::piecewise_construct_t const&,std::tuple<HKSource * const {__strong}&>,std::tuple<>>((uint64_t *)v69 + 6, (id *)&v88, &v96);
        v16 = v15;
        v17 = *((_QWORD *)&v92 + 1);
        if (*((_QWORD *)&v92 + 1) >= v93[0])
        {
          v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v92 + 1) - v92) >> 3);
          v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v93[0] - v92) >> 3) > v21)
            v21 = 0x5555555555555556 * ((uint64_t)(v93[0] - v92) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v93[0] - v92) >> 3) >= 0x555555555555555)
            v22 = 0xAAAAAAAAAAAAAAALL;
          else
            v22 = v21;
          v99 = v93;
          if (v22)
          {
            v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v22);
            v25 = v24;
          }
          else
          {
            v23 = 0;
            v25 = 0;
          }
          v26 = &v23[24 * v20];
          *(_QWORD *)v26 = v16[3];
          v27 = v16[4];
          v26[16] = *((_BYTE *)v16 + 40);
          *((_QWORD *)v26 + 1) = v27;
          v28 = *((_QWORD *)&v92 + 1);
          v29 = v92;
          if (*((_QWORD *)&v92 + 1) == (_QWORD)v92)
          {
            v33 = vdupq_n_s64(*((unint64_t *)&v92 + 1));
            v30 = v26;
          }
          else
          {
            v30 = v26;
            do
            {
              v31 = *(_QWORD *)(v28 - 24);
              v28 -= 24;
              *(_QWORD *)v28 = 0;
              *((_QWORD *)v30 - 3) = v31;
              v30 -= 24;
              v32 = *(_QWORD *)(v28 + 8);
              v30[16] = *(_BYTE *)(v28 + 16);
              *((_QWORD *)v30 + 1) = v32;
            }
            while (v28 != v29);
            v33 = (int64x2_t)v92;
          }
          v19 = v26 + 24;
          *(_QWORD *)&v92 = v30;
          *((_QWORD *)&v92 + 1) = v26 + 24;
          v97 = v33;
          v34 = v93[0];
          v93[0] = &v23[24 * v25];
          v98 = v34;
          v96 = (id *)v33.i64[0];
          std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v96);
        }
        else
        {
          *(_QWORD *)v17 = v15[3];
          v18 = *((_BYTE *)v16 + 40);
          *(_QWORD *)(v17 + 8) = v16[4];
          *(_BYTE *)(v17 + 16) = v18;
          v19 = (char *)(v17 + 24);
        }
        *((_QWORD *)&v92 + 1) = v19;

      }
      v35 = [_HDCachedSourceOrder alloc];
      v96 = 0;
      v97 = 0uLL;
      std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)&v96, v92, *((uint64_t *)&v92 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v92 + 1) - v92) >> 3));
      v36 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v35, (uint64_t *)&v96, *((_BYTE *)v65 + 24), 0);
      *(_QWORD *)&v88 = &v96;
      std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&v88);
      *(_QWORD *)&v88 = &v92;
      std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&v88);
      goto LABEL_44;
    }
    objc_msgSend(v11, "databaseForEntityClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (id *)v55;
    v57 = v37;
    if (v38)
    {
      v39 = v38[2];
      if (v39)
      {
        v52 = v39;

LABEL_32:
        *(_QWORD *)&v92 = 0;
        *((_QWORD *)&v92 + 1) = &v92;
        v93[0] = 0x4812000000;
        v93[1] = __Block_byref_object_copy__195;
        v93[2] = __Block_byref_object_dispose__196;
        v93[3] = &unk_1B805FAAD;
        memset(v94, 0, 24);
        std::vector<_HDWrappedSource>::reserve(v94, objc_msgSend(v52, "count"));
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v45 = v52;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v88, &v96, 16);
        if (v46)
        {
          v47 = *(_QWORD *)v89;
          while (2)
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v89 != v47)
                objc_enumerationMutation(v45);
              v49 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
              v83[3] = MEMORY[0x1E0C809B0];
              v83[4] = 3221225472;
              v83[5] = (uint64_t)__83__HDSourceOrderManager__defaultSourceCacheItemWithTransactionCache_database_error___block_invoke;
              v83[6] = (uint64_t)&unk_1E6CF4680;
              v84 = v38;
              v85 = v49;
              v86 = v57;
              v87 = &v92;
              LODWORD(v49) = HKWithAutoreleasePool();

              if (!(_DWORD)v49)
              {

                v36 = 0;
                goto LABEL_42;
              }
            }
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v88, &v96, 16);
            if (v46)
              continue;
            break;
          }
        }

        v50 = [_HDCachedSourceOrder alloc];
        memset(v83, 0, 24);
        std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v83, *(_QWORD *)(*((_QWORD *)&v92 + 1) + 48), *(_QWORD *)(*((_QWORD *)&v92 + 1) + 56), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(*((_QWORD *)&v92 + 1) + 56) - *(_QWORD *)(*((_QWORD *)&v92 + 1) + 48)) >> 3));
        v36 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v50, v83, 0, 1);
        v95 = (void **)v83;
        std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v95);
LABEL_42:
        _Block_object_dispose(&v92, 8);
        v95 = (void **)v94;
        std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v95);
        goto LABEL_43;
      }
      objc_msgSend(v38[1], "sourceManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "allSourcesWithError:", a3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v42 = v41;
        objc_opt_self();
        objc_msgSend(v42, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_72);
        v43 = objc_claimAutoreleasedReturnValue();

        v44 = v38[2];
        v38[2] = (id)v43;

        v52 = v38[2];
      }
      else
      {
        v52 = 0;
      }

      if (v52)
        goto LABEL_32;
    }
    else
    {

    }
    v45 = 0;
    v36 = 0;
LABEL_43:

    goto LABEL_44;
  }
  v36 = 0;
LABEL_44:

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  std::__hash_table<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,std::__unordered_map_hasher<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectHash,HDNSObjectEqual,true>,std::__unordered_map_equal<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectEqual,HDNSObjectHash,true>,std::allocator<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>>>::~__hash_table((uint64_t)&v73[8]);
  _Block_object_dispose(&v76, 8);
  v68 = (void **)v82;
  std::vector<HKSource * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v68);

LABEL_45:
  return v36;
}

uint64_t __94__HDSourceOrderManager__fetchSourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = HKWithAutoreleasePool();
  v6 = 0;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v12 = a2;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "Failed to lookup source order information for %lld: %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

BOOL __94__HDSourceOrderManager__fetchSourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  char *v8;
  double *v9;
  id *v10;
  double v11;
  _QWORD *v12;
  id v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  id obj;
  id *p_obj;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uncachedClientSourceForPersistentID:transaction:error:", v5, *(_QWORD *)(a1 + 40), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v6;

  if (v6)
  {
    v7 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
    p_obj = &obj;
    v8 = (char *)std::__hash_table<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,std::__unordered_map_hasher<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectHash,HDNSObjectEqual,true>,std::__unordered_map_equal<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectEqual,HDNSObjectHash,true>,std::allocator<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>>>::__emplace_unique_key_args<HKSource * {__strong},std::piecewise_construct_t const&,std::tuple<HKSource * const {__strong}&>,std::tuple<>>(v7, &obj, &p_obj);
    v9 = (double *)v8;
    v10 = (id *)(v8 + 24);
    if (*((_QWORD *)v8 + 3))
    {
      v11 = *((double *)v8 + 4);
    }
    else
    {
      v12 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
      v13 = obj;
      v15 = (_QWORD *)v12[7];
      v14 = v12[8];
      if ((unint64_t)v15 >= v14)
      {
        v17 = v12[6];
        v18 = ((uint64_t)v15 - v17) >> 3;
        if ((unint64_t)(v18 + 1) >> 61)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v19 = v14 - v17;
        v20 = v19 >> 2;
        if (v19 >> 2 <= (unint64_t)(v18 + 1))
          v20 = v18 + 1;
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
        {
          if (v21 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = (char *)operator new(8 * v21);
        }
        else
        {
          v22 = 0;
        }
        v23 = &v22[8 * v18];
        v24 = &v22[8 * v21];
        *(_QWORD *)v23 = v13;
        v16 = v23 + 8;
        v25 = (_QWORD *)v12[6];
        v26 = (_QWORD *)v12[7];
        if (v26 == v25)
        {
          v12[6] = v23;
          v12[7] = v16;
          v12[8] = v24;
        }
        else
        {
          do
          {
            v27 = *--v26;
            *v26 = 0;
            *((_QWORD *)v23 - 1) = v27;
            v23 -= 8;
          }
          while (v26 != v25);
          v26 = (_QWORD *)v12[6];
          v28 = (_QWORD *)v12[7];
          v12[6] = v23;
          v12[7] = v16;
          v12[8] = v24;
          while (v28 != v26)
          {
            v29 = (void *)*--v28;

          }
        }
        if (v26)
          operator delete(v26);
      }
      else
      {
        *v15 = obj;
        v16 = v15 + 1;
      }
      v12[7] = v16;
      objc_storeStrong(v10, obj);
      v11 = *(double *)(a1 + 72);
      v9[4] = v11;
      *((_BYTE *)v9 + 40) = 1;
    }
    if (v11 < *(double *)(a1 + 72))
      v11 = *(double *)(a1 + 72);
    v9[4] = v11;

  }
  return v6 != 0;
}

uint64_t __52__HDSourceOrderManager__defaultOrderingWithSources___block_invoke(int a1, HKSource *a2, HKSource *a3)
{
  return _HDDefaultSourceOrderCompare(a2, a3);
}

BOOL __83__HDSourceOrderManager__defaultSourceCacheItemWithTransactionCache_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int64x2_t *v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  uint64_t v30;
  int64x2_t v31;
  uint64_t v32;
  int64x2_t *v33;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDSourceOrderTransactionCache orderedSourceIDsForBundleIdentifier:database:error:](v4, v5, *(void **)(a1 + 48), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(id *)(a1 + 40);
    v8 = v7;
    v9 = *(int64x2_t **)(*(_QWORD *)(a1 + 56) + 8);
    v10 = (_QWORD *)v9[3].i64[1];
    v11 = v9[4].u64[0];
    if ((unint64_t)v10 >= v11)
    {
      v13 = v9[3].i64[0];
      v14 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v10 - v13) >> 3);
      if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v13) >> 3);
      v16 = 2 * v15;
      if (2 * v15 <= v14 + 1)
        v16 = v14 + 1;
      if (v15 >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      v33 = v9 + 4;
      if (v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v17);
        v20 = v19;
      }
      else
      {
        v18 = 0;
        v20 = 0;
      }
      v21 = &v18[24 * v14];
      *(_QWORD *)v21 = v8;
      *((_QWORD *)v21 + 1) = 0;
      v23 = v9[3].i64[0];
      v22 = v9[3].u64[1];
      if (v22 == v23)
      {
        v27 = vdupq_n_s64(v22);
        v24 = v21;
      }
      else
      {
        v24 = v21;
        do
        {
          v25 = *(_QWORD *)(v22 - 24);
          v22 -= 24;
          *(_QWORD *)v22 = 0;
          *((_QWORD *)v24 - 3) = v25;
          v24 -= 24;
          v26 = *(_QWORD *)(v22 + 8);
          v24[16] = *(_BYTE *)(v22 + 16);
          *((_QWORD *)v24 + 1) = v26;
        }
        while (v22 != v23);
        v27 = v9[3];
      }
      v12 = v21 + 24;
      v9[3].i64[0] = (uint64_t)v24;
      v9[3].i64[1] = (uint64_t)v12;
      v31 = v27;
      v28 = v9[4].i64[0];
      v9[4].i64[0] = (uint64_t)&v18[24 * v20];
      v32 = v28;
      v30 = v27.i64[0];
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      *v10 = v7;
      v10[1] = 0;
      v12 = v10 + 3;
    }
    v9[3].i64[1] = (uint64_t)v12;

  }
  return v6 != 0;
}

- (BOOL)addOrderedSource:(id)a3 objectTypes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HDSourceOrderManager_addOrderedSource_objectTypes_error___block_invoke;
  v15[3] = &unk_1E6CF42F0;
  v15[4] = self;
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

uint64_t __59__HDSourceOrderManager_addOrderedSource_objectTypes_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  _HDSourceOrderTransactionCache *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  HKSource *v17;
  BOOL v18;
  id v19;
  HKSource **v20;
  HKSource **v21;
  HKSource **v22;
  HKSource **v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t *v28;
  id *v29;
  uint64_t v30;
  BOOL v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  HKSource **v37;
  unint64_t v38;
  HKSource **v39;
  HKSource *v40;
  HKSource *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  HKSource *v45;
  HKSource *v46;
  HKSource *v47;
  _BOOL4 v49;
  id *v50;
  HKSource *v51;
  HKSource **v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t *i;
  void *v61;
  HKSource **v62;
  CFAbsoluteTime v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  void **v68;
  uint64_t v69;
  void **v70;
  uint64_t v71;
  void **v72;
  uint64_t v73;
  void **v74;
  void **v75;
  void *v76;
  void *v77;
  uint8_t *v78;
  void **v79;
  char v80;
  void **v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void **v90;
  void **v91;
  _BYTE *v92;
  void *v93;
  NSObject *v94;
  _HDCachedSourceOrder *v95;
  char *v96;
  char *v97;
  id v98;
  id v99;
  void *v100;
  char *v101;
  id v102;
  BOOL v103;
  BOOL v104;
  void *v105;
  void *v106;
  unsigned int v108;
  id obj;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v114;
  id *v115;
  void *v116;
  void *v117;
  id *v118;
  void *v119;
  _BYTE *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125[3];
  id v126;
  id v127;
  CFAbsoluteTime Current;
  char v129;
  __int128 v130;
  unint64_t v131;
  id v132;
  BOOL v133;
  uint8_t *v134;
  void **v135;
  uint64_t v136;
  void **v137;
  unint64_t *v138;
  _BYTE v139[128];
  uint8_t buf[24];
  void **v141;
  _QWORD *v142;
  char *v143;
  id v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v114 = a2;
  v4 = [_HDSourceOrderTransactionCache alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v115 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v4->super.isa, WeakRetained);

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
  v108 = 1;
  if (!v6)
    goto LABEL_117;
  v112 = *(_QWORD *)v122;
  v110 = a1;
  while (2)
  {
    v7 = 0;
    v111 = v6;
    do
    {
      if (*(_QWORD *)v122 != v112)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v7);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(id *)(a1 + 48);
      v11 = v8;
      v12 = v115;
      v13 = v114;
      v116 = v10;
      if (!v9)
      {

LABEL_116:
        v108 = 0;
        goto LABEL_117;
      }
      v132 = 0;
      v118 = v12;
      v119 = v13;
      v117 = v11;
      -[HDSourceOrderManager _sourceCacheItemForObjectType:transactionCache:transaction:error:](v9, v11, v12, v13, (uint64_t)&v132);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v132;
      v16 = v15;
      v120 = (_BYTE *)v14;
      if (v14)
      {
        v131 = 0;
        v130 = 0uLL;
        if (!*(_BYTE *)(v14 + 9))
        {
          memset(buf, 0, sizeof(buf));
          std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)buf, *(_QWORD *)(v14 + 16), *(_QWORD *)(v14 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v14 + 24) - *(_QWORD *)(v14 + 16)) >> 3));
          std::vector<_HDWrappedSource>::__vdeallocate((void **)&v130);
          v130 = *(_OWORD *)buf;
          v131 = *(_QWORD *)&buf[16];
          memset(buf, 0, sizeof(buf));
          v134 = buf;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&v134);
          v28 = (uint64_t *)*((_QWORD *)&v130 + 1);
          v29 = (id *)v130;
          if ((_QWORD)v130 != *((_QWORD *)&v130 + 1))
          {
            v30 = v130 + 24;
            while (*(_BYTE *)(v30 - 8))
            {
              v31 = v30 == *((_QWORD *)&v130 + 1);
              v30 += 24;
              if (v31)
                goto LABEL_76;
            }
            v56 = v30 - 24;
            if (v30 - 24 != *((_QWORD *)&v130 + 1) && v30 != *((_QWORD *)&v130 + 1))
            {
              do
              {
                if (*(_BYTE *)(v30 + 16))
                {
                  v57 = *(_QWORD *)v30;
                  *(_QWORD *)v30 = 0;
                  v58 = *(void **)v56;
                  *(_QWORD *)v56 = v57;

                  v59 = *(_QWORD *)(v30 + 8);
                  *(_BYTE *)(v56 + 16) = *(_BYTE *)(v30 + 16);
                  *(_QWORD *)(v56 + 8) = v59;
                  v56 += 24;
                }
                v30 += 24;
              }
              while ((uint64_t *)v30 != v28);
              v28 = (uint64_t *)*((_QWORD *)&v130 + 1);
              v29 = (id *)v130;
            }
            if ((uint64_t *)v56 != v28)
            {
              v28 = (uint64_t *)std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *,0>(v28, v28, v56);
              for (i = (uint64_t *)*((_QWORD *)&v130 + 1); i != v28; i -= 3)
              {
                v61 = (void *)*(i - 3);

              }
              *((_QWORD *)&v130 + 1) = v28;
              v29 = (id *)v130;
            }
LABEL_76:
            while (v29 != (id *)v28)
            {
              if ((objc_msgSend(*v29, "isEqual:", v10) & 1) != 0)
              {
                v19 = v16;
                goto LABEL_105;
              }
              v29 += 3;
            }
          }
        }
        v17 = (HKSource *)v10;
        v127 = v17;
        Current = CFAbsoluteTimeGetCurrent();
        v129 = 1;
        v126 = v16;
        v18 = -[HDSourceOrderManager _updateOrderedSourceIDsForWrappedSource:transactionCache:transaction:error:](v9, &v127, v118, v119, (uint64_t)&v126);
        v19 = v126;

        if (v18)
        {
          v20 = (HKSource **)*((_QWORD *)&v130 + 1);
          v21 = (HKSource **)v130;
          if ((_QWORD)v130 == *((_QWORD *)&v130 + 1))
          {
            v23 = (HKSource **)v130;
            v22 = (HKSource **)v130;
          }
          else
          {
            while (_HDDefaultSourceOrderCompare(v17, *v21) == 1)
            {
              v21 += 3;
              if (v21 == v20)
              {
                v21 = v20;
                break;
              }
            }
            v22 = v21;
            v21 = (HKSource **)*((_QWORD *)&v130 + 1);
            v23 = (HKSource **)v130;
          }
          v35 = ((char *)v22 - (char *)v23) / 24;
          v36 = (unint64_t)&v23[3 * v35];
          if ((unint64_t)v21 >= v131)
          {
            v53 = 1 - 0x5555555555555555 * (v21 - v23);
            if (v53 > 0xAAAAAAAAAAAAAAALL)
              std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((uint64_t)(v131 - (_QWORD)v23) >> 3) > v53)
              v53 = 0x5555555555555556 * ((uint64_t)(v131 - (_QWORD)v23) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131 - (_QWORD)v23) >> 3) >= 0x555555555555555)
              v54 = 0xAAAAAAAAAAAAAAALL;
            else
              v54 = v53;
            v138 = &v131;
            if (v54)
              v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v54);
            else
              v55 = 0;
            v64 = v54 + 24 * v35;
            v134 = (uint8_t *)v54;
            v135 = (void **)v64;
            v136 = v64;
            v137 = (void **)(v54 + 24 * v55);
            if (v35 == v55)
            {
              if ((char *)v22 - (char *)v23 < 1)
              {
                if (v23 == v22)
                  v67 = 1;
                else
                  v67 = 2 * v35;
                v142 = &v131;
                v68 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v67);
                v70 = v135;
                v71 = v136;
                v72 = v135;
                v73 = (uint64_t)&v68[3 * (v67 >> 2)];
                if ((void **)v136 != v135)
                {
                  v73 = (uint64_t)&v68[3 * (v67 >> 2)] + v136 - (_QWORD)v135;
                  v74 = &v68[3 * (v67 >> 2)];
                  v75 = v135;
                  do
                  {
                    v76 = *v75;
                    *v75 = 0;
                    *v74 = v76;
                    v77 = v75[1];
                    *((_BYTE *)v74 + 16) = *((_BYTE *)v75 + 16);
                    v74[1] = v77;
                    v74 += 3;
                    v75 += 3;
                  }
                  while (v74 != (void **)v73);
                  v72 = (void **)v71;
                }
                v78 = v134;
                v79 = v137;
                v134 = (uint8_t *)v68;
                v135 = &v68[3 * (v67 >> 2)];
                *(_QWORD *)buf = v78;
                *(_QWORD *)&buf[8] = v70;
                v136 = v73;
                v137 = &v68[3 * v69];
                *(_QWORD *)&buf[16] = v72;
                v141 = v79;
                std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)buf);
                v64 = v136;
              }
              else
              {
                v65 = v35 + 2;
                if (v35 >= -1)
                  v65 = v35 + 1;
                v66 = v64 - 24 * (v65 >> 1);
                v64 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *,0>((uint64_t *)(v54 + 24 * v35), (uint64_t *)v64, v66);
                v135 = (void **)v66;
                v136 = v64;
                v17 = (HKSource *)v127;
              }
            }
            *(_QWORD *)v64 = v17;
            v80 = v129;
            *(CFAbsoluteTime *)(v64 + 8) = Current;
            *(_BYTE *)(v64 + 16) = v80;
            v81 = v135;
            v82 = v136 + 24;
            v136 += 24;
            v83 = v130;
            if ((_QWORD)v130 != v36)
            {
              v84 = v36;
              do
              {
                v85 = *(void **)(v84 - 24);
                v84 -= 24;
                *(_QWORD *)v84 = 0;
                *(v81 - 3) = v85;
                v81 -= 3;
                v86 = *(void **)(v84 + 8);
                *((_BYTE *)v81 + 16) = *(_BYTE *)(v84 + 16);
                v81[1] = v86;
              }
              while (v84 != v83);
              v82 = v136;
            }
            v135 = v81;
            v87 = *((_QWORD *)&v130 + 1);
            if (*((_QWORD *)&v130 + 1) != v36)
            {
              do
              {
                v88 = *(_QWORD *)v36;
                *(_QWORD *)v36 = 0;
                *(_QWORD *)v82 = v88;
                v89 = *(_QWORD *)(v36 + 8);
                *(_BYTE *)(v82 + 16) = *(_BYTE *)(v36 + 16);
                *(_QWORD *)(v82 + 8) = v89;
                v82 += 24;
                v36 += 24;
              }
              while (v36 != v87);
              v81 = v135;
              v36 = *((_QWORD *)&v130 + 1);
            }
            v90 = (void **)v130;
            v91 = (void **)v131;
            *(_QWORD *)&v130 = v81;
            *((_QWORD *)&v130 + 1) = v82;
            v131 = (unint64_t)v137;
            v136 = v36;
            v137 = v91;
            v134 = (uint8_t *)v90;
            v135 = v90;
            std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v134);
          }
          else if ((HKSource **)v36 == v21)
          {
            *v21 = v17;
            v62 = &v23[3 * v35];
            v63 = Current;
            *((_BYTE *)v62 + 16) = v129;
            *((CFAbsoluteTime *)v62 + 1) = v63;
            *((_QWORD *)&v130 + 1) = v21 + 3;
          }
          else
          {
            v37 = v21 - 3;
            v38 = (unint64_t)v21;
            v39 = v21 - 3;
            if ((unint64_t)v21 >= 0x18)
            {
              do
              {
                v40 = *v39;
                *v39 = 0;
                *(_QWORD *)v38 = v40;
                v41 = v39[1];
                *(_BYTE *)(v38 + 16) = *((_BYTE *)v39 + 16);
                *(_QWORD *)(v38 + 8) = v41;
                v38 += 24;
                v39 += 3;
              }
              while (v39 < v21);
            }
            *((_QWORD *)&v130 + 1) = v38;
            if (v21 != (HKSource **)(v36 + 24))
            {
              v42 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v21 - v36 - 24) >> 3);
              v43 = (uint64_t)&v23[3 * v35 - 3];
              v44 = 24 * v42;
              do
              {
                v45 = *(HKSource **)(v43 + v44);
                *(_QWORD *)(v43 + v44) = 0;
                v46 = *v37;
                *v37 = v45;

                v47 = *(HKSource **)(v43 + v44 + 8);
                *((_BYTE *)v37 + 16) = *(_BYTE *)(v43 + v44 + 16);
                v37[1] = v47;
                v37 -= 3;
                v44 -= 24;
              }
              while (v44);
              v38 = *((_QWORD *)&v130 + 1);
            }
            v49 = v36 <= (unint64_t)&v127 && v38 > (unint64_t)&v127;
            objc_storeStrong((id *)&v23[3 * v35], v127);
            v50 = &v127 + 3 * v49;
            v51 = (HKSource *)v50[1];
            v52 = &v23[3 * v35];
            *((_BYTE *)v52 + 16) = *((_BYTE *)v50 + 16);
            v52[1] = v51;
          }

LABEL_105:
          v92 = v120;
          _HKInitializeLogging();
          v93 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
          {
            v94 = v93;
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v116, "bundleIdentifier");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v105;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v117;
              _os_log_debug_impl(&dword_1B7802000, v94, OS_LOG_TYPE_DEBUG, "Will add ordered source %@ for type %@", buf, 0x16u);

            }
            v92 = v120;
          }
          v95 = [_HDCachedSourceOrder alloc];
          memset(v125, 0, sizeof(v125));
          std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v125, v130, *((uint64_t *)&v130 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v130 + 1) - v130) >> 3));
          v96 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v95, v125, v92[8], 0);
          *(_QWORD *)buf = v125;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          v97 = v96;
          v98 = v117;
          v99 = objc_loadWeakRetained((id *)(v9 + 8));
          objc_msgSend(v99, "database");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __54__HDSourceOrderManager__updateSourceOrder_type_error___block_invoke;
          v141 = (void **)&unk_1E6CF42F0;
          v142 = (_QWORD *)v9;
          v101 = v97;
          v143 = v101;
          v102 = v98;
          v144 = v102;
          v103 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDLogicalSourceOrderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v100, a3, buf);

          v133 = v103;
          goto LABEL_110;
        }
        if (objc_msgSend(v19, "hk_isDatabaseAccessibilityError"))
        {
          _HKInitializeLogging();
          v25 = (void *)*MEMORY[0x1E0CB52B0];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
          {
LABEL_36:
            v34 = v19;
            v19 = v34;
            if (v34)
            {
              if (a3)
                *a3 = objc_retainAutorelease(v34);
              else
                _HKLogDroppedError();
            }

            v133 = 0;
LABEL_110:
            *(_QWORD *)buf = &v130;
            std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
            goto LABEL_111;
          }
          v26 = v25;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            -[HKSource bundleIdentifier](v17, "bundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v27;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v19;
            _os_log_debug_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEBUG, "Failed to update ordered source IDs for bundle identifier %{public}@: %{public}@", buf, 0x16u);

          }
        }
        else
        {
          _HKInitializeLogging();
          v26 = (id)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            -[HKSource bundleIdentifier](v17, "bundleIdentifier");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v106;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v19;
            _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Failed to update ordered source IDs for bundle identifier %{public}@: %{public}@", buf, 0x16u);

          }
        }

        goto LABEL_36;
      }
      if (objc_msgSend(v15, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        v24 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v16;
          _os_log_debug_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEBUG, "Failed to fetch ordered sources for type %@: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        _HKInitializeLogging();
        v32 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v16;
          _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch ordered sources for type %@: %{public}@", buf, 0x16u);
        }
      }
      v33 = v16;
      v19 = v33;
      if (v33)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v33);
        else
          _HKLogDroppedError();
      }

      v133 = 0;
LABEL_111:

      v104 = v133;
      if (!v104)
        goto LABEL_116;
      ++v7;
      a1 = v110;
    }
    while (v7 != v111);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
    if (v6)
      continue;
    break;
  }
  v108 = 1;
LABEL_117:

  return v108;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOrdersForTypeCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
