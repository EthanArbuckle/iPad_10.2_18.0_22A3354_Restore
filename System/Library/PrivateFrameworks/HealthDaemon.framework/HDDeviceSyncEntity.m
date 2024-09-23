@implementation HDDeviceSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 12;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 13);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  end = a4.end;
  start = a4.start;
  v12 = a3;
  v13 = a5;
  v24 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDeviceEntity _propertiesForDevice](HDDeviceEntity, "_propertiesForDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = -1;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25[3] = &unk_1E6D001A8;
  v17 = v15;
  v26 = v17;
  v18 = v12;
  v32 = start;
  v33 = end;
  v27 = v18;
  v31 = &v34;
  v19 = v16;
  v28 = v19;
  v20 = v13;
  v29 = v20;
  v21 = v14;
  v30 = v21;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v19, a7, v25))
  {
    v22 = objc_msgSend(v24, "sendCodableChange:resultAnchor:sequence:done:error:", v21, v35[3], 0, 1, a7);
  }
  else
  {
    v22 = 0;
  }

  _Block_object_dispose(&v34, 8);
  return v22;
}

BOOL __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E6CED2F8;
  v9 = *(_QWORD *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = v5;
  v18 = *(id *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v12 = v5;
  v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDDeviceEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v7, v11, v10, 0, v8, v9, a3, v15);

  return v13;
}

BOOL __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL8 v9;
  id v10;
  void *v11;
  id v14;

  v14 = 0;
  v9 = +[HDDeviceSyncEntity _syncCodableDevice:fromRow:profile:transaction:error:](HDDeviceSyncEntity, "_syncCodableDevice:fromRow:profile:transaction:error:", &v14, a4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a8);
  v10 = v14;
  v11 = v10;
  if (v9 && v10 != 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

  return v9;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int64_t v11;

  v9 = a3;
  objc_msgSend(a5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDDeviceEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v9, v10, a6);

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableDevice *v4;

  v3 = a3;
  v4 = -[HDCodableDevice initWithData:]([HDCodableDevice alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;

  v10 = a6;
  v11 = a3;
  LODWORD(a7) = +[HDDeviceEntity insertCodableDevices:syncProvenance:profile:error:](HDDeviceEntity, "insertCodableDevices:syncProvenance:profile:error:", v11, objc_msgSend(a5, "syncProvenance"), v10, a7);

  return a7 ^ 1;
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "syncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "syncStoreType");

  if ((unint64_t)(v5 - 3) >= 3 && v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "excludedSyncStores");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (BOOL)_syncCodableDevice:(id *)a3 fromRow:(HDSQLiteRow *)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v11 = a6;
  v12 = a5;
  +[HDDeviceEntity _codableDeviceWithRow:](HDDeviceEntity, "_codableDeviceWithRow:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(v12, "syncIdentityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(v15, "identityForEntityID:transaction:error:", v14, v11, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v22;
  if (v16)
  {
    objc_msgSend(v16, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "codableSyncIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSyncIdentity:", v19);

    if (a3)
      *a3 = objc_retainAutorelease(v13);
  }
  else
  {
    v20 = v17;
    if (v20)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

  }
  return v16 != 0;
}

@end
