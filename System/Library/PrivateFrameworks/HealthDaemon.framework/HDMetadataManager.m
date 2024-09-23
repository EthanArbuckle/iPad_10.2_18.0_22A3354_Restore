@implementation HDMetadataManager

- (BOOL)insertMetadata:(id)a3 forObjectID:(id)a4 sourceID:(id)a5 externalSyncObjectCode:(int64_t)a6 objectDeleted:(BOOL)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id WeakRetained;
  void *v18;
  BOOL v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  BOOL v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (objc_msgSend(v14, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __100__HDMetadataManager_insertMetadata_forObjectID_sourceID_externalSyncObjectCode_objectDeleted_error___block_invoke;
    v21[3] = &unk_1E6CFE5A8;
    v21[4] = self;
    v22 = v14;
    v23 = v15;
    v24 = v16;
    v25 = a6;
    v26 = a7;
    v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMetadataValueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v18, a8, v21);

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

uint64_t __100__HDMetadataManager_insertMetadata_forObjectID_sourceID_externalSyncObjectCode_objectDeleted_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:transaction:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), a2, a3);
}

- (id)metadataForObjectID:(int64_t)a3 baseMetadata:(id)a4 keyFilter:(id)a5 statement:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  unsigned int (**v29)(id, _QWORD);
  id v30;
  _BOOL4 v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id *v38;
  id v39;
  id v40;
  id v41[5];
  id v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  id *v46;
  id v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v12 = a5;
  v13 = a6;
  v40 = 0;
  v14 = a4;
  v15 = v12;
  v16 = v13;
  if (self)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__127;
    v51 = __Block_byref_object_dispose__127;
    v52 = v14;
    v17 = (void *)MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke;
    aBlock[3] = &unk_1E6CFE530;
    v45 = v15;
    v46 = &v47;
    v18 = _Block_copy(aBlock);
    objc_msgSend(v16, "transaction");
    v41[0] = v17;
    v41[1] = (id)3221225472;
    v41[2] = __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke_2;
    v41[3] = &unk_1E6CFE558;
    v41[4] = self;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v42 = v19;
    v20 = v18;
    v43 = v20;
    if (objc_msgSend(v16, "enumerateResultsForObjectID:error:block:", a3, &v40, v41))
      v21 = v48[5];
    else
      v21 = 0;
    v22 = v21;

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    v22 = 0;
  }

  v23 = v40;
  v24 = v23;
  if (v22 || !v23)
  {
    v38 = a7;
    objc_msgSend(v16, "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v24;
    v28 = v22;
    v29 = (unsigned int (**)(id, _QWORD))v15;
    v30 = v27;
    if (self && (!v29 || v29[2](v29, *MEMORY[0x1E0CB55D0]) && v29[2](v29, *MEMORY[0x1E0CB55D8])))
    {
      v41[0] = 0;
      v47 = 0;
      v31 = +[HDDataExternalSyncIdentifierEntity populateSyncInfoForObjectID:database:localSourceIDOut:externalSyncObjectCodeOut:syncIdentifierOut:syncVersionOut:deletedOut:errorOut:](HDDataExternalSyncIdentifierEntity, "populateSyncInfoForObjectID:database:localSourceIDOut:externalSyncObjectCodeOut:syncIdentifierOut:syncVersionOut:deletedOut:errorOut:", a3, v30, 0, 0, v41, &v47, 0, &v39);
      v32 = v41[0];
      v33 = v47;
      v34 = 0;
      if (v31)
      {
        v35 = v33;
        v34 = v28;
        if (v32)
        {
          if (!v22)
            v34 = (id)objc_opt_new();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CB55D0]);
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0CB55D8]);
        }
        v33 = v35;
      }

    }
    else
    {
      v34 = 0;
    }

    v25 = v39;
    if (v34 || !v25)
    {
      v36 = (void *)MEMORY[0x1E0C9AA70];
      if (v34)
        v36 = v34;
      v26 = v36;

    }
    else if (v38)
    {
      v25 = objc_retainAutorelease(v25);
      v26 = 0;
      *v38 = v25;
    }
    else
    {
      _HKLogDroppedError();
      v26 = 0;
    }
  }
  else if (a7)
  {
    v25 = objc_retainAutorelease(v23);
    v26 = 0;
    *a7 = v25;
  }
  else
  {
    _HKLogDroppedError();
    v26 = 0;
    v25 = v24;
  }

  return v26;
}

void __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v11))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v11);
  }

}

- (HDMetadataManager)initWithProfile:(id)a3
{
  id v4;
  HDMetadataManager *v5;
  HDMetadataManager *v6;
  HDDatabaseValueCache *v7;
  void *v8;
  uint64_t v9;
  HDDatabaseValueCache *keyEntityCache;
  HDDatabaseValueCache *v11;
  void *v12;
  uint64_t v13;
  HDDatabaseValueCache *keyCache;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDMetadataManager;
  v5 = -[HDMetadataManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDDatabaseValueCache alloc];
    -[HDMetadataManager hk_classNameWithTag:](v6, "hk_classNameWithTag:", CFSTR("entities"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDDatabaseValueCache initWithName:](v7, "initWithName:", v8);
    keyEntityCache = v6->_keyEntityCache;
    v6->_keyEntityCache = (HDDatabaseValueCache *)v9;

    v11 = [HDDatabaseValueCache alloc];
    -[HDMetadataManager hk_classNameWithTag:](v6, "hk_classNameWithTag:", CFSTR("keys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDDatabaseValueCache initWithName:](v11, "initWithName:", v12);
    keyCache = v6->_keyCache;
    v6->_keyCache = (HDDatabaseValueCache *)v13;

  }
  return v6;
}

BOOL __81__HDMetadataManager__metadataForObjectID_baseMetadata_keyFilter_statement_error___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v7 = a3;
  v8 = a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[5];
  v11 = v9;
  v12 = v11;
  if (v8)
  {
    v13 = *(void **)(v8 + 24);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__HDMetadataManager__keyForKeyID_transaction_error___block_invoke;
    v26[3] = &unk_1E6CFE640;
    v27 = v11;
    objc_msgSend(v13, "fetchObjectForKey:transaction:error:faultHandler:", v27, v10, a4, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  if (v14)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v15 = a1[4];
    v16 = (void *)a1[6];
    v17 = v14;
    v18 = v7;
    v19 = v16;
    if (!v15)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB72B0])
      || objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB72A0]))
    {
      v20 = (_QWORD *)MEMORY[0x1E0CB5520];
LABEL_8:
      (*((void (**)(id, _QWORD, id))v19 + 2))(v19, *v20, v18);
      goto LABEL_9;
    }
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB7298]))
    {
      objc_msgSend(v18, "integerValue");
      v22 = HKHeartRateMotionContextForPrivateHeartRateContext();
      v23 = (uint64_t *)MEMORY[0x1E0CB5528];
    }
    else
    {
      if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB7240]))
      {
        v20 = (_QWORD *)MEMORY[0x1E0CB5478];
        goto LABEL_8;
      }
      if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB7258]))
        goto LABEL_9;
      v22 = HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString();
      v23 = (uint64_t *)MEMORY[0x1E0CB5478];
    }
    v24 = *v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v19 + 2))(v19, v24, v25);

    goto LABEL_9;
  }
LABEL_10:

  return v14 != 0;
}

- (id)unitTest_metadataForObjectID:(int64_t)a3 keyFilter:(id)a4 error:(id *)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__127;
  v22 = __Block_byref_object_dispose__127;
  v23 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDMetadataManager_unitTest_metadataForObjectID_keyFilter_error___block_invoke;
  v14[3] = &unk_1E6CFE580;
  v16 = &v18;
  v17 = a3;
  v14[4] = self;
  v11 = v8;
  v15 = v11;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMetadataValueEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __66__HDMetadataManager_unitTest_metadataForObjectID_keyFilter_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  +[HDMetadataValueStatement metadataValueStatementWithTransaction:](HDMetadataValueStatement, "metadataValueStatementWithTransaction:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadataForObjectID:baseMetadata:keyFilter:statement:error:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 40), v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v5, "finish");
  return 1;
}

- (id)unitTest_rawMetadataForObject:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  void *v19;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v21 = a3;
  v19 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataValueEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataKeyEntity, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataKeyEntity, "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ INNER JOIN %@ ON %@ = %@ INNER JOIN %@ ON %@ = %@.%@ WHERE %@ = ?"), CFSTR("key"), CFSTR("value_type"), CFSTR("string_value"), CFSTR("numerical_value"), CFSTR("date_value"), CFSTR("data_value"), v4, v5, CFSTR("data_id"), CFSTR("object_id"), v6, CFSTR("key_id"), v7, *MEMORY[0x1E0D29618], CFSTR("uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke;
  v23[3] = &unk_1E6CEB3F8;
  v24 = v8;
  v25 = v21;
  v26 = v9;
  v12 = v9;
  v13 = v21;
  v14 = v8;
  v15 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a4, v23);

  if (v15)
    v16 = v12;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

uint64_t __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_2;
  v12[3] = &unk_1E6CE9508;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_3;
  v10[3] = &unk_1E6CE8CF8;
  v11 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, v12, v10);

  return v8;
}

void __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __57__HDMetadataManager_unitTest_rawMetadataForObject_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(HDSQLiteColumnWithNameAsInt64())
  {
    case 0:
      HDSQLiteColumnWithNameAsString();
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      HDSQLiteColumnWithNameAsNumber();
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      HDSQLiteColumnWithNameAsDate();
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v5 = (void *)MEMORY[0x1E0CB6A28];
      v6 = (void *)MEMORY[0x1E0CB6CD0];
      HDSQLiteColumnWithNameAsString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unitFromString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsDouble();
      objc_msgSend(v5, "quantityWithUnit:doubleValue:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 4:
      HDSQLiteColumnWithNameAsData();
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v3;
LABEL_9:
      if (v2)
        v9 = v4 == 0;
      else
        v9 = 1;
      if (!v9)
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v2);
      break;
    default:
      v4 = 0;
      break;
  }

  return 1;
}

- (BOOL)insertMetadata:(id)a3 forObjectID:(id)a4 sourceID:(id)a5 externalSyncObjectCode:(int64_t)a6 objectDeleted:(BOOL)a7 transaction:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  HDProfile **p_profile;
  id WeakRetained;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  BOOL v41;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = v13;
  v18 = v14;
  v19 = v16;
  v20 = v19;
  if (self)
  {
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 1;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__127;
    v61 = __Block_byref_object_dispose__127;
    v62 = 0;
    v21 = objc_msgSend(v18, "longLongValue");
    objc_msgSend(v20, "databaseForEntityClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __67__HDMetadataManager__insertMetadata_forObjectID_transaction_error___block_invoke;
    v50[3] = &unk_1E6CFE5D0;
    v50[4] = self;
    v23 = v17;
    v51 = v23;
    v24 = v20;
    v52 = v24;
    v54 = &v57;
    v55 = &v63;
    v56 = v21;
    v25 = v22;
    v53 = v25;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v50);
    v49 = v17;
    if (*((_BYTE *)v64 + 24))
    {
      v26 = 1;
    }
    else
    {
      v27 = (id)v58[5];
      v28 = v27;
      if (v27)
      {
        if (a9)
          *a9 = objc_retainAutorelease(v27);
        else
          _HKLogDroppedError();
      }

      v26 = *((_BYTE *)v64 + 24) != 0;
    }

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);

    if (v26)
    {
      v45 = v15;
      v46 = v18;
      v29 = v15;
      v30 = v24;
      v31 = *MEMORY[0x1E0CB55D0];
      v32 = v23;
      objc_msgSend(v32, "objectForKeyedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v44 = v30;
        p_profile = &self->_profile;
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "sourceManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localSourceForSourceID:copyIfNecessary:error:", v29, 1, a9);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v39 = objc_loadWeakRetained((id *)p_profile);
          objc_msgSend(v44, "databaseForEntityClass:", objc_opt_class());
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v43) = a7;
          v41 = +[HDDataExternalSyncIdentifierEntity insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:](HDDataExternalSyncIdentifierEntity, "insertSyncIdentifierWithProfile:database:objectID:localSourceID:externalSyncObjectCode:syncIdentifier:syncVersion:deleted:errorOut:", v39, v40, objc_msgSend(v46, "longLongValue"), objc_msgSend(v38, "persistentID"), a6, v33, v34, v43, a9);

        }
        else
        {
          v41 = 0;
        }
        v15 = v45;
        v17 = v49;

        v30 = v44;
      }
      else
      {
        v41 = 1;
        v15 = v45;
        v17 = v49;
      }

    }
    else
    {
      v41 = 0;
      v17 = v49;
    }
  }
  else
  {

    v41 = 0;
  }

  return v41;
}

void __67__HDMetadataManager__insertMetadata_forObjectID_transaction_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  id obj;

  v7 = a2;
  v8 = a3;
  v10 = a1[4];
  v9 = (void *)a1[5];
  v11 = v7;
  v12 = v9;
  if (!v10)
    goto LABEL_8;
  if (qword_1ED552478 != -1)
    dispatch_once(&qword_1ED552478, &__block_literal_global_152);
  v13 = (id)_MergedGlobals_216;
  v14 = objc_msgSend(v13, "containsObject:", v11);

  if ((v14 & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB5528])
    && (objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7298]),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {

  }
  else
  {
LABEL_8:

    v16 = a1[4];
    v17 = a1[6];
    v18 = *(_QWORD *)(a1[8] + 8);
    obj = *(id *)(v18 + 40);
    -[HDMetadataManager _keyEntityForKey:createIfNecessary:transaction:error:](v16, v11, 1, v17, (uint64_t)&obj);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v18 + 40), obj);
    if (!v19
      || (v20 = objc_msgSend(v19, "persistentID"),
          v21 = a1[10],
          v22 = a1[7],
          v23 = *(_QWORD *)(a1[8] + 8),
          v25 = *(id *)(v23 + 40),
          v24 = +[HDMetadataValueEntity _insertMetadataValueWithKeyID:objectID:value:database:error:](HDMetadataValueEntity, "_insertMetadataValueWithKeyID:objectID:value:database:error:", v20, v21, v8, v22, &v25), objc_storeStrong((id *)(v23 + 40), v25), !v24))
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
    }

  }
}

- (id)_keyEntityForKey:(char)a3 createIfNecessary:(uint64_t)a4 transaction:(uint64_t)a5 error:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  char v16;

  v9 = a2;
  v10 = v9;
  if (a1)
  {
    v11 = *(void **)(a1 + 16);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__HDMetadataManager__keyEntityForKey_createIfNecessary_transaction_error___block_invoke;
    v14[3] = &unk_1E6CFE618;
    v15 = v9;
    v16 = a3;
    objc_msgSend(v11, "fetchObjectForKey:transaction:error:faultHandler:", v15, a4, a5, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __49__HDMetadataManager__ignoredInsertedMetadataKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB55D0], *MEMORY[0x1E0CB55D8], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_216;
  _MergedGlobals_216 = v0;

}

- (BOOL)updateMetadataValue:(id)a3 forKey:(id)a4 object:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  HDMetadataManager *v24;
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMetadataManager.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __61__HDMetadataManager_updateMetadataValue_forKey_object_error___block_invoke;
  v22[3] = &unk_1E6CF26F8;
  v23 = v13;
  v24 = self;
  v25 = v12;
  v26 = v11;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMetadataValueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v15, a6, v22);

  return v19;
}

BOOL __61__HDMetadataManager_updateMetadataValue_forKey_object_error___block_invoke(uint64_t *a1, void *a2, _QWORD *a3)
{
  void *v3;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  id v22;
  id v23;

  v6 = a2;
  v7 = a1[4];
  v23 = 0;
  +[HDDataEntity dataEntityForObject:transaction:error:](HDDataEntity, "dataEntityForObject:transaction:error:", v7, v6, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  v10 = v9;
  if (v8)
  {

    v11 = a1[5];
    v12 = (void *)a1[6];
    v22 = 0;
    -[HDMetadataManager _keyEntityForKey:createIfNecessary:transaction:error:](v11, v12, 0, (uint64_t)v6, (uint64_t)&v22);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    v10 = v13;
    if (v3)
    {
      v14 = objc_msgSend(v3, "persistentID");
      v15 = objc_msgSend(v8, "persistentID");
      v16 = a1[7];
      objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = +[HDMetadataValueEntity _updateMetadataValueForKeyID:objectID:value:database:error:](HDMetadataValueEntity, "_updateMetadataValueForKeyID:objectID:value:database:error:", v14, v15, v16, v17, a3);
      v19 = v10;
LABEL_22:

      v10 = v19;
LABEL_23:

      goto LABEL_24;
    }
    if (v13)
    {
      v17 = v13;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Metadata key \"%@\" not found"), a1[6]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
LABEL_15:
      if (a3)
        *a3 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();

      v3 = 0;
      v19 = 0;
      v18 = 0;
      if (v10)
        goto LABEL_23;
      goto LABEL_22;
    }
    v3 = 0;
LABEL_21:
    v19 = 0;
    v18 = 0;
    goto LABEL_22;
  }
  if (v9)
  {
    v17 = v9;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend((id)a1[4], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hk_error:format:", 118, CFSTR("Object with UUID %@ not found"), v3);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_21;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v17);
  else
    _HKLogDroppedError();

  v18 = 0;
  if (!v10)
  {
    v19 = 0;
    goto LABEL_22;
  }
LABEL_24:

  return v18;
}

- (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(+[HDMetadataManager _metadataPredicateClassForKey:]((uint64_t)HDMetadataManager, v6), "predicateWithMetadataKey:allowedValues:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_metadataPredicateClassForKey:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB55D0]) & 1) == 0)
    objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB55D8]);
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend(+[HDMetadataManager _metadataPredicateClassForKey:]((uint64_t)HDMetadataManager, v8), "predicateWithMetadataKey:value:operatorType:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  objc_msgSend(+[HDMetadataManager _metadataPredicateClassForKey:]((uint64_t)HDMetadataManager, v5), "predicateWithMetadataKey:exists:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __74__HDMetadataManager__keyEntityForKey_createIfNecessary_transaction_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;
  id v14;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  +[HDMetadataKeyEntity _entityForKey:database:error:](HDMetadataKeyEntity, "_entityForKey:database:error:", v7, v6, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = v9;
  if (!v8)
  {
    if (!*(_BYTE *)(a1 + 40)
      || v9
      || (v11 = *(_QWORD *)(a1 + 32),
          v13 = 0,
          +[HDMetadataKeyEntity _insertEntityWithKey:database:error:](HDMetadataKeyEntity, "_insertEntityWithKey:database:error:", v11, v6, &v13), v8 = (void *)objc_claimAutoreleasedReturnValue(), v10 = v13, !v8))
    {
      v10 = v10;
      if (v10)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

      v8 = 0;
    }
  }

  return v8;
}

id __52__HDMetadataManager__keyForKeyID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "databaseForEntityClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDMetadataKeyEntity _keyForPersistentID:database:](HDMetadataKeyEntity, "_keyForPersistentID:database:", *(_QWORD *)(a1 + 32), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCache, 0);
  objc_storeStrong((id *)&self->_keyEntityCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
