@implementation HDDeviceEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_predicateForDevice:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E0CB4C00];
  if (v5)
    v8 = v5;
  else
    v8 = *MEMORY[0x1E0CB4C00];
  objc_msgSend(v4, "predicateWithProperty:equalToValue:", CFSTR("name"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "manufacturer");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = (uint64_t)v7;
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("manufacturer"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "model");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = v16;
  else
    v18 = (uint64_t)v7;
  objc_msgSend(v15, "predicateWithProperty:equalToValue:", CFSTR("model"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "hardwareVersion");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = v21;
  else
    v23 = (uint64_t)v7;
  objc_msgSend(v20, "predicateWithProperty:equalToValue:", CFSTR("hardware"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "firmwareVersion");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = v26;
  else
    v28 = (uint64_t)v7;
  objc_msgSend(v25, "predicateWithProperty:equalToValue:", CFSTR("firmware"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "softwareVersion");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = v31;
  else
    v33 = (uint64_t)v7;
  objc_msgSend(v30, "predicateWithProperty:equalToValue:", CFSTR("software"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  v35 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "localIdentifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    v38 = v36;
  else
    v38 = (uint64_t)v7;
  objc_msgSend(v35, "predicateWithProperty:equalToValue:", CFSTR("localIdentifier"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  v40 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "UDIDeviceIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    v42 = v41;
  else
    v42 = v7;
  objc_msgSend(v40, "predicateWithProperty:equalToValue:", CFSTR("FDAUDI"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v43);

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    objc_msgSend(v3, "firstObject");
  else
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

- (id)deviceUUIDInDatabase:(id)a3 error:(id *)a4
{
  return -[HDSQLiteEntity UUIDForProperty:database:](self, "UUIDForProperty:database:", CFSTR("uuid"), a3);
}

- (id)deviceInHealthDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  +[HDDeviceEntity _propertiesForDevice](HDDeviceEntity, "_propertiesForDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__206;
  v20 = __Block_byref_object_dispose__206;
  v21 = 0;
  v8 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke;
  v13[3] = &unk_1E6CEB640;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  if (objc_msgSend(v8, "performReadTransactionWithHealthDatabase:error:block:", v6, a4, v13))
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (id)_propertiesForDevice
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("creation_date");
  v3[2] = CFSTR("name");
  v3[3] = CFSTR("manufacturer");
  v3[4] = CFSTR("model");
  v3[5] = CFSTR("hardware");
  v3[6] = CFSTR("firmware");
  v3[7] = CFSTR("software");
  v3[8] = CFSTR("localIdentifier");
  v3[9] = CFSTR("FDAUDI");
  v3[10] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntity:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  v5 = a1[5];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke_2;
  v11[3] = &unk_1E6CEEDC8;
  v11[4] = a1[6];
  objc_msgSend(v4, "getValuesForProperties:database:handler:", v5, v3, v11);
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      v7 = (void *)a1[4];
      v8 = v6;
      v9 = objc_msgSend(v7, "persistentID");
      *(_DWORD *)buf = 134217984;
      v13 = v9;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "Missing database device entity %lld", buf, 0xCu);

    }
  }

  return 1;
}

void __47__HDDeviceEntity_deviceInHealthDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = objc_opt_self();
  if (!a3)
  {
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__deviceWithRow_, v18, CFSTR("HDDeviceEntity.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row != NULL"));

  }
  v5 = objc_alloc(MEMORY[0x1E0CB65C0]);
  HDSQLiteColumnWithNameAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v5, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v6, v7, v8, v9, v10, v11, v12, v13);

  HDSQLiteColumnWithNameAsDate();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setCreationDate:", v15);

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v14;

}

+ (HDDeviceEntity)deviceEntityWithUUID:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  objc_opt_self();
  v10 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForUUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("uuid"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v12, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDDeviceEntity *)v13;
}

+ (id)databaseTable
{
  return CFSTR("source_devices");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_106;
}

+ (id)uniquedColumns
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("name");
  v3[1] = CFSTR("manufacturer");
  v3[2] = CFSTR("model");
  v3[3] = CFSTR("hardware");
  v3[4] = CFSTR("firmware");
  v3[5] = CFSTR("software");
  v3[6] = CFSTR("localIdentifier");
  v3[7] = CFSTR("FDAUDI");
  v3[8] = CFSTR("sync_provenance");
  v3[9] = CFSTR("uuid");
  v3[10] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (HDDeviceEntity)deviceEntityWithDevice:(id)a3 syncIdentity:(int64_t)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  id v21;
  int64_t v22;
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__206;
  v34 = __Block_byref_object_dispose__206;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__206;
  v28 = __Block_byref_object_dispose__206;
  v29 = 0;
  obj = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__HDDeviceEntity_deviceEntityWithDevice_syncIdentity_healthDatabase_error___block_invoke;
  v17[3] = &unk_1E6D10D78;
  v21 = a1;
  v19 = &v24;
  v12 = v10;
  v22 = a4;
  v18 = v12;
  v20 = &v30;
  objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v11, &obj, v17);
  objc_storeStrong(&v35, obj);
  v13 = (id)v31[5];
  v14 = v13;
  if (v13)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return (HDDeviceEntity *)v15;
}

BOOL __75__HDDeviceEntity_deviceEntityWithDevice_syncIdentity_healthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 56);
  v6 = a2;
  objc_msgSend(v6, "databaseForEntityClass:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "deviceEntityWithDevice:transaction:error:", *(_QWORD *)(a1 + 32), v6, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v36 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timeIntervalSinceReferenceDate");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "manufacturer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hardwareVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firmwareVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "softwareVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UDIDeviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 64);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v21 + 40);
    v38 = v7;
    objc_msgSend(v36, "_insertDeviceWithUUID:creationDate:name:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:syncProvenance:syncIdentity:database:error:", v40, v39, v13, v14, v15, v16, v12, v17, v18, v19, 0, v20, v7, &obj);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v21 + 40), obj);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB52B0];
    v27 = *MEMORY[0x1E0CB52B0];
    if (v25)
    {
      v7 = v38;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v29 = v26;
        v30 = objc_msgSend(v28, "persistentID");
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v43 = v30;
        v44 = 2114;
        v45 = v31;
        _os_log_debug_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEBUG, "Inserted new device entity %lld for device: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      v7 = v38;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v43 = v32;
        v44 = 2114;
        v45 = v33;
        _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_INFO, "Insert new device %@ failed: %{public}@", buf, 0x16u);
      }
    }
  }
  v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

  return v34;
}

+ (id)deviceEntitiesWithDevice:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[HDDeviceEntity _predicateForDevice:]((uint64_t)a1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceEntity _deviceEntitiesWithPredicate:healthDatabase:error:]((uint64_t)a1, v9, v8, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_deviceEntitiesWithPredicate:(void *)a3 healthDatabase:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_self();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__206;
  v21 = __Block_byref_object_dispose__206;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke;
  v13[3] = &unk_1E6CEC9E0;
  v16 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v17;
  if (objc_msgSend(v8, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v13))
    v10 = (void *)v18[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (id)deviceEntitiesWithProperty:(id)a3 matchingValues:(id)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id *v31;
  _QWORD v32[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a3;
  v12 = a4;
  objc_opt_self();
  v13 = v11;
  objc_opt_self();
  v14 = *MEMORY[0x1E0CB4C20];
  *(_QWORD *)&v33 = *MEMORY[0x1E0CB4C30];
  *((_QWORD *)&v33 + 1) = v14;
  v32[0] = CFSTR("name");
  v32[1] = CFSTR("manufacturer");
  v15 = *MEMORY[0x1E0CB4C10];
  *(_QWORD *)&v34 = *MEMORY[0x1E0CB4C28];
  *((_QWORD *)&v34 + 1) = v15;
  v32[2] = CFSTR("model");
  v32[3] = CFSTR("hardware");
  v16 = *MEMORY[0x1E0CB4C38];
  *(_QWORD *)&v35 = *MEMORY[0x1E0CB4C08];
  *((_QWORD *)&v35 + 1) = v16;
  v32[4] = CFSTR("firmware");
  v32[5] = CFSTR("software");
  v17 = *MEMORY[0x1E0CB4C40];
  *(_QWORD *)&v36 = *MEMORY[0x1E0CB4C18];
  *((_QWORD *)&v36 + 1) = v17;
  v32[6] = CFSTR("localIdentifier");
  v32[7] = CFSTR("FDAUDI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v33, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v30 = v10;
    v31 = a6;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", v19, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      }
      while (v23);
    }

    if ((unint64_t)objc_msgSend(v20, "count") < 2)
      objc_msgSend(v20, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;
    a6 = v31;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[HDDeviceEntity _deviceEntitiesWithPredicate:healthDatabase:error:]((uint64_t)a1, v27, v10, (uint64_t)a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke_2;
  v7[3] = &unk_1E6D10DA0;
  v4 = a1[4];
  v5 = (void *)a1[6];
  v7[4] = a1[5];
  objc_msgSend(v5, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v3, v4, 0, v7);

  return 1;
}

uint64_t __68__HDDeviceEntity__deviceEntitiesWithPredicate_healthDatabase_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  return 1;
}

+ (HDDeviceEntity)deviceEntityWithDevice:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceEntity _predicateForDevice:]((uint64_t)a1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDDeviceEntity *)v11;
}

- (id)deviceUUIDInHealthDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("uuid"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDUUIDForSQLiteValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)creationDateInHealthDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("creation_date"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDDateForSQLiteValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_insertDeviceWithUUID:(id)a3 creationDate:(double)a4 name:(id)a5 manufacturer:(id)a6 model:(id)a7 hardwareVersion:(id)a8 firmwareVersion:(id)a9 softwareVersion:(id)a10 localIdentifier:(id)a11 UDIDeviceIdentifier:(id)a12 syncProvenance:(int64_t)a13 syncIdentity:(int64_t)a14 database:(id)a15 error:(id *)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  double v67;
  int64_t v68;
  int64_t v69;
  _QWORD block[6];

  v55 = a3;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a8;
  v51 = a9;
  v52 = a10;
  v53 = a11;
  v27 = a12;
  v28 = a15;
  v29 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED552568 != -1)
    dispatch_once(&qword_1ED552568, block);
  v30 = _MergedGlobals_227;
  v57[0] = v29;
  v57[1] = 3221225472;
  v57[2] = __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke_2;
  v57[3] = &unk_1E6D10DC8;
  v56 = v55;
  v58 = v56;
  v67 = a4;
  v31 = v23;
  v59 = v31;
  v32 = v24;
  v60 = v32;
  v33 = v25;
  v61 = v33;
  v34 = v26;
  v62 = v34;
  v35 = v51;
  v63 = v35;
  v36 = v52;
  v64 = v36;
  v37 = v53;
  v65 = v37;
  v38 = v27;
  v66 = v38;
  v68 = a13;
  v69 = a14;
  v39 = objc_msgSend(v28, "executeSQL:error:bindingHandler:enumerationHandler:", v30, a16, v57, 0);
  v40 = 0;
  if (v39)
  {
    objc_msgSend(v28, "lastInsertRowID");
    v54 = v38;
    v41 = v37;
    v42 = v36;
    v43 = v35;
    v44 = v34;
    v45 = v33;
    v46 = v28;
    v47 = v32;
    v48 = v31;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteEntity entityWithPersistentID:](HDDeviceEntity, "entityWithPersistentID:", v49);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v48;
    v32 = v47;
    v28 = v46;
    v33 = v45;
    v34 = v44;
    v35 = v43;
    v36 = v42;
    v37 = v41;
    v38 = v54;
  }

  return v40;
}

void __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"),
         v5,
         CFSTR("uuid"),
         CFSTR("creation_date"),
         CFSTR("name"),
         CFSTR("manufacturer"),
         CFSTR("model"),
         CFSTR("hardware"),
         CFSTR("firmware"),
         CFSTR("software"),
         CFSTR("localIdentifier"),
         CFSTR("FDAUDI"),
         CFSTR("sync_provenance"),
         CFSTR("sync_identity"),
         0);
  v4 = (void *)_MergedGlobals_227;
  _MergedGlobals_227 = v3;

}

uint64_t __204__HDDeviceEntity__insertDeviceWithUUID_creationDate_name_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_syncProvenance_syncIdentity_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_double(a2, 2, *(double *)(a1 + 104));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 11, *(_QWORD *)(a1 + 112));
  return sqlite3_bind_int64(a2, 12, *(_QWORD *)(a1 + 120));
}

+ (BOOL)insertCodableDevices:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke;
  v16[3] = &unk_1E6CEA620;
  v17 = v10;
  v18 = v11;
  v19 = a1;
  v20 = a4;
  v13 = v11;
  v14 = v10;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDeviceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

uint64_t __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v13 = MEMORY[0x1E0C809B0];
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = *(id *)(a1 + 40);
        v16 = v3;
        v17 = v4;
        v10 = HKWithAutoreleasePool();

        if (!v10)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v13, 3221225472, __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke_2, &unk_1E6D10DF0, v14);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

uint64_t __68__HDDeviceEntity_insertCodableDevices_syncProvenance_profile_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  _QWORD *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  objc_opt_self();
  v5 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_UUIDWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v4, "hasCreationDate"))
    {

      goto LABEL_8;
    }
    v8 = CFSTR("missing creation date for codable device");
  }
  else
  {
    v8 = CFSTR("missing UUID for codable device");
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__validateCodableDevice_error_, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
LABEL_15:
    if ((objc_msgSend(v10, "hd_isConstraintViolation") & 1) != 0)
    {
      v33 = 0;
      goto LABEL_17;
    }
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v53 = v10;
      _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_INFO, "Failed to insert codable device: %{public}@", buf, 0xCu);
    }
    v36 = v10;
    v13 = v36;
    if (v36)
    {
      if (a2)
      {
        v13 = objc_retainAutorelease(v36);
        *a2 = v13;
      }
      else
      {
        _HKLogDroppedError();
      }
      v10 = v13;
    }
    else
    {
      v10 = 0;
    }
LABEL_40:

    v33 = 0;
    v34 = 0;
    goto LABEL_41;
  }
LABEL_8:
  v11 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_UUIDWithData:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "legacySyncIdentity");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "hasSyncIdentity"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v16, &v51);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v51;

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      v50 = v18;
      objc_msgSend(v19, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v17, 1, v20, &v50);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v50;

      if (v21)
      {
        v48 = v13;
        v41 = a2;

        v23 = v22;
        v24 = (void *)v21;
        goto LABEL_13;
      }
      _HKInitializeLogging();
      v38 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v22;
        _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_INFO, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v39 = v22;
      v15 = v39;
      if (v39)
      {
        if (a2)
        {
          v15 = objc_retainAutorelease(v39);
          *a2 = v15;
        }
        else
        {
          _HKLogDroppedError();
        }
        v10 = v15;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      v37 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v18;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v10 = v18;
      if (v10)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

    }
    goto LABEL_40;
  }
  v24 = v15;
  v48 = v13;
  v41 = a2;
  v23 = 0;
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "manufacturer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "model");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hardwareVersion");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firmwareVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "softwareVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fDAUDI");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v24, "entity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "persistentID");
  v32 = *(_QWORD *)(a1 + 56);
  v49 = v23;
  +[HDDeviceEntity _insertDeviceWithUUID:creationDate:name:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:syncProvenance:syncIdentity:database:error:](HDDeviceEntity, "_insertDeviceWithUUID:creationDate:name:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:syncProvenance:syncIdentity:database:error:", v48, v47, v46, v45, v44, v27, v26, v43, v42, v28, v29, v31, v32, &v49);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v49;

  if (!v33)
  {
    a2 = v41;
    goto LABEL_15;
  }
LABEL_17:
  v34 = 1;
LABEL_41:

  return v34;
}

+ (id)_codableDeviceWithRow:(HDSQLiteRow *)a3
{
  HDCodableDevice *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v16;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDeviceEntity.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row != NULL"));

  }
  v3 = objc_alloc_init(HDCodableDevice);
  HDSQLiteColumnWithNameAsData();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setUuid:](v3, "setUuid:", v4);

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableDevice setCreationDate:](v3, "setCreationDate:");
  HDSQLiteColumnWithNameAsNonEmptyString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setName:](v3, "setName:", v5);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setManufacturer:](v3, "setManufacturer:", v6);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setModel:](v3, "setModel:", v7);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setHardwareVersion:](v3, "setHardwareVersion:", v8);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setFirmwareVersion:](v3, "setFirmwareVersion:", v9);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setSoftwareVersion:](v3, "setSoftwareVersion:", v10);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setLocalIdentifier:](v3, "setLocalIdentifier:", v11);

  HDSQLiteColumnWithNameAsNonEmptyString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableDevice setFDAUDI:](v3, "setFDAUDI:", v12);

  return v3;
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

@end
