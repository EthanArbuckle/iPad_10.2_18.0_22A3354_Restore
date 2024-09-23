@implementation HDServiceEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)allServicesWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__65;
  v30 = __Block_byref_object_dispose__65;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__65;
  v24 = __Block_byref_object_dispose__65;
  v25 = 0;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__HDServiceEntity_allServicesWithProfile_error___block_invoke;
  v15[3] = &unk_1E6CF3A08;
  v17 = &v26;
  v19 = a1;
  v9 = v6;
  v16 = v9;
  v18 = &v20;
  v10 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v15);

  if ((v10 & 1) != 0)
  {
    if (objc_msgSend((id)v21[5], "count"))
    {
      objc_msgSend(v9, "database");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __48__HDServiceEntity_allServicesWithProfile_error___block_invoke_2;
      v14[3] = &unk_1E6CF3A30;
      v14[4] = &v20;
      v14[5] = a1;
      objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v11, a4, v14);

    }
    v12 = (id)v27[5];
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

uint64_t __48__HDServiceEntity_allServicesWithProfile_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v8 = a2;
  v9 = v3;
  v10 = (void *)objc_opt_self();
  v11 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v11, "setEntityClass:", v10);
  objc_msgSend(v11, "setLimitCount:", *MEMORY[0x1E0D29968]);
  v12 = objc_alloc(MEMORY[0x1E0D29898]);
  objc_msgSend(v8, "databaseForEntityClass:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDatabase:descriptor:", v13, v11);

  v26 = v9;
  objc_msgSend(v10, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v9, v8, 1, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__65;
  v35 = __Block_byref_object_dispose__65;
  v36 = 0;
  objc_msgSend(v15, "orderedProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__HDServiceEntity__servicesWithDatabaseTransaction_profile_removals___block_invoke;
  v27[3] = &unk_1E6CF3A78;
  v18 = v15;
  v28 = v18;
  v30 = &v31;
  v19 = v16;
  v29 = v19;
  objc_msgSend(v14, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v17, 0, v27);

  v20 = (void *)v32[5];
  if (v20)
    v6 = objc_retainAutorelease(v20);
  v21 = v29;
  v22 = v19;

  _Block_object_dispose(&v31, 8);
  objc_storeStrong(v5, v6);
  v23 = *(_QWORD *)(a1[5] + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  return 1;
}

+ (id)databaseTable
{
  return CFSTR("devices");
}

+ (id)tableAliases
{
  return &unk_1E6DF8DF8;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_33;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("device_uuid");
  v3[1] = CFSTR("device_service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertOrUpdateService:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *, uint64_t);
  void *v28;
  id v29;
  id v30;
  _BYTE *v31;
  id v32;
  uint8_t v33[4];
  id v34;
  __int16 v35;
  void *v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v38 = __Block_byref_object_copy__65;
    v39 = __Block_byref_object_dispose__65;
    v40 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke;
    v28 = &unk_1E6CF39E0;
    v32 = a1;
    v11 = v8;
    v29 = v11;
    v31 = buf;
    v30 = v10;
    if ((objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v30, a5, &v25) & 1) != 0)
    {
      v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    else
    {
      _HKInitializeLogging();
      v15 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v22 = (id)objc_opt_class();
        objc_msgSend(v11, "identifier", v25, v26, v27, v28, v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v33 = 138543618;
        v34 = v22;
        v35 = 2114;
        v36 = v24;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: cannot insert service %{public}@ into database", v33, 0x16u);

      }
      v12 = 0;
    }
    v14 = v12;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v17 = v13;
      v18 = (void *)objc_opt_class();
      v19 = v18;
      objc_msgSend(v8, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: invalid parameters, service: %{public}@", buf, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

uint64_t __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double Current;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  double v39;
  _QWORD v40[7];
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 56), "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?"), *MEMORY[0x1E0D29618], CFSTR("device_last_connect"), v8, CFSTR("device_uuid"), CFSTR("device_service"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v46 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_2;
  v41[3] = &unk_1E6CE9508;
  v42 = *(id *)(a1 + 32);
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_3;
  v40[3] = &unk_1E6CF39B8;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v40[5] = &v43;
  v40[6] = v12;
  v40[4] = v11;
  if ((objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a3, v41, v40) & 1) == 0)
  {
    v22 = 0;
    goto LABEL_12;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = *(id *)(a1 + 40);
      objc_msgSend(v32, "profile");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "daemon");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "analyticsSubmissionCoordinator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "profile");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "healthService_reportServiceTypeAdded:profileType:", v24, objc_msgSend(v25, "profileType"));

    }
    v48[0] = CFSTR("device_uuid");
    v48[1] = CFSTR("device_name");
    v48[2] = CFSTR("device_service");
    v48[3] = CFSTR("device_last_connect");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(a1 + 56);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_4;
    v37[3] = &unk_1E6CECA50;
    v38 = *(id *)(a1 + 32);
    v39 = Current;
    objc_msgSend(v27, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v6, v26, a3, v37);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v14, "profile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "analyticsSubmissionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v44[3];
    objc_msgSend(v14, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "healthService_reportServiceType:duration:profileType:", v17, objc_msgSend(v19, "profileType"), Current - v18);

  }
  v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v47 = CFSTR("device_last_connect");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_5;
  v36[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  *(double *)&v36[4] = Current;
  v22 = objc_msgSend(v20, "updateProperties:database:error:bindingHandler:", v21, v6, a3, v36);

  if ((_DWORD)v22)
LABEL_11:
    v22 = 1;
LABEL_12:

  _Block_object_dispose(&v43, 8);
  return v22;
}

uint64_t __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "type"));
}

uint64_t __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 1);
  return 0;
}

void __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("device_uuid"), v4);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("device_name"), v5);

  MEMORY[0x1BCCAB114](a2, CFSTR("device_service"), objc_msgSend(*(id *)(a1 + 32), "type"));
  JUMPOUT(0x1BCCAB0F0);
}

void __62__HDServiceEntity_insertOrUpdateService_healthDatabase_error___block_invoke_5()
{
  JUMPOUT(0x1BCCAB0F0);
}

+ (BOOL)deleteService:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  NSObject *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *, _QWORD *);
  void *v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __54__HDServiceEntity_deleteService_healthDatabase_error___block_invoke;
  v23 = &unk_1E6CEA620;
  v26 = a1;
  v11 = v9;
  v24 = v11;
  v12 = v10;
  v25 = v12;
  v27 = a2;
  v13 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a5, &v20);
  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    v14 = (id)*MEMORY[0x1E0CB5358];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "identifier", v20, v21, v22, v23, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (a5)
        v19 = *a5;
      else
        v19 = 0;
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      v30 = 2114;
      v31 = v19;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Cannot delete service %{public}@ from database. Error: %{public}@", buf, 0x16u);

    }
  }

  return v13;
}

uint64_t __54__HDServiceEntity_deleteService_healthDatabase_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  objc_opt_self();
  v8 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("device_uuid"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D29838];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend(v7, "type");

  objc_msgSend(v13, "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("device_service"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D29840];
  v29[0] = v11;
  v29[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateMatchingAllPredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyInDatabase:predicate:error:", v5, v19, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 56), CFSTR("Could not find the health service in the database."));
      v27 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v27 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v20, "deleteFromDatabase:error:", v5, a3))
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v21, "profile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "daemon");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "analyticsSubmissionCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "profile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "healthService_reportServiceTypeRemoved:profileType:", v25, objc_msgSend(v26, "profileType"));
  }
  v27 = 1;
LABEL_9:

  return v27;
}

uint64_t __48__HDServiceEntity_allServicesWithProfile_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "entityWithPersistentID:", v10, v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v12 = objc_msgSend(v11, "deleteFromDatabase:error:", v3, &v17);
        v13 = v17;
        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x1E0CB5358];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5358], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            v23 = v10;
            v24 = 2114;
            v25 = v13;
            _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Failed to delete expired service with id %@: %{public}@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  return 1;
}

+ (BOOL)healthUpdatesEnabledForDevice:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v9 = (void *)MEMORY[0x1E0D29838];
    _HDSQLiteValueForUUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithProperty:equalToValue:", CFSTR("device_uuid"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    v25[0] = CFSTR("device_enabled");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__HDServiceEntity_healthUpdatesEnabledForDevice_inDatabase_error___block_invoke;
    v16[3] = &unk_1E6CF0538;
    v16[4] = &v21;
    v16[5] = &v17;
    LOBYTE(v12) = objc_msgSend((id)v12, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v13, v11, v8, a5, v16);

    if ((v12 & 1) != 0)
    {
      if (!*((_BYTE *)v18 + 24))
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 313, CFSTR("device not found"));
      v14 = *((_BYTE *)v22 + 24) != 0;
    }
    else
    {
      v14 = 0;
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

uint64_t __66__HDServiceEntity_healthUpdatesEnabledForDevice_inDatabase_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MEMORY[0x1BCCAB174](a4, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return 0;
}

+ (BOOL)setHealthUpdatesEnabled:(BOOL)a3 forDevice:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  BOOL v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0D29838];
  v10 = a5;
  _HDSQLiteValueForUUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithProperty:equalToValue:", CFSTR("device_uuid"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("device_enabled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HDServiceEntity_setHealthUpdatesEnabled_forDevice_inDatabase_error___block_invoke;
  v15[3] = &__block_descriptor_33_e34_v16__0__HDSQLiteStatementBinder__8l;
  v16 = a3;
  LOBYTE(a6) = objc_msgSend(a1, "updateProperties:predicate:healthDatabase:error:bindingHandler:", v13, v12, v10, a6, v15);

  return (char)a6;
}

void __70__HDServiceEntity_setHealthUpdatesEnabled_forDevice_inDatabase_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0CCLL);
}

uint64_t __69__HDServiceEntity__servicesWithDatabaseTransaction_profile_removals___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v6, "objectForPersistentID:row:error:", a2, a4, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else if (v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to instantiate non-deprecated service: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

  }
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDServiceEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDServiceEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
