@implementation HDNanoPairingEntity

- (NSString)defaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier;
}

- (NSUUID)nanoRegistryUUID
{
  return self->_nanoRegistryUUID;
}

+ (int64_t)protectionClass
{
  return 1;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (NSUUID)persistentUUID
{
  return self->_persistentUUID;
}

+ (id)nanoPairingEntityWithRegistryUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDNanoPairingEntity.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nanoRegistryUUID != nil"));

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__81;
  v28 = __Block_byref_object_dispose__81;
  v29 = 0;
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__HDNanoPairingEntity_nanoPairingEntityWithRegistryUUID_profile_error___block_invoke;
  v19[3] = &unk_1E6CF39E0;
  v23 = a1;
  v12 = v9;
  v20 = v12;
  v22 = &v24;
  v13 = v10;
  v21 = v13;
  v14 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v19);

  if (v14)
    v15 = (void *)v25[5];
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&v24, 8);
  return v16;
}

BOOL __71__HDNanoPairingEntity_nanoPairingEntityWithRegistryUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HDNanoPairingEntity *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BOOL8 v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  id v50;
  char v51;
  _QWORD v52[9];

  v52[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoPairingEntity _predicateWithRegistryUUID:](*(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoPairingEntity _nanoPairingEntitiesWithPredicate:database:error:](*(_QWORD *)(a1 + 56), v6, v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "database");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSyncStoreEntity syncStoreEntityWithUUID:type:healthDatabase:error:](HDSyncStoreEntity, "syncStoreEntityWithUUID:type:healthDatabase:error:", v13, 1, v14, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = [HDNanoPairingEntity alloc];
        v17 = *(id *)(a1 + 32);
        v18 = v15;
        v19 = v5;
        v20 = v19;
        v44 = v17;
        v45 = v18;
        if (v16)
        {
          v42 = v15;
          v43 = v19;
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 0;
            objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithNanoRegistryUUID_persistentUUID_healthDatabaseUUID_sourceBundleIdentifier_deviceIdentifier_syncStoreEntity_restoreComplete_database_error_, v16, CFSTR("HDNanoPairingEntity.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nanoRegistryUUID != nil"));

            v18 = v45;
          }
          v52[0] = CFSTR("registry_uuid");
          v52[1] = CFSTR("persistent_uuid");
          v52[2] = CFSTR("health_uuid");
          v52[3] = CFSTR("source_bundle_id");
          v52[4] = CFSTR("ids_id");
          v52[5] = CFSTR("sync_provenance");
          v52[6] = CFSTR("restored");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_opt_class();
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __170__HDNanoPairingEntity__initWithNanoRegistryUUID_persistentUUID_healthDatabaseUUID_sourceBundleIdentifier_deviceIdentifier_syncStoreEntity_restoreComplete_database_error___block_invoke;
          v46[3] = &unk_1E6CF66B8;
          v23 = v17;
          v47 = v23;
          v48 = 0u;
          v49 = 0u;
          v24 = v18;
          v50 = v24;
          v51 = 0;
          v25 = (void *)v22;
          v20 = v43;
          objc_msgSend(v25, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v43, v21, a3, v46);
          v26 = objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v27 = objc_msgSend(v23, "copy");
            v28 = *(void **)(v26 + 24);
            *(_QWORD *)(v26 + 24) = v27;

            v29 = objc_msgSend(0, "copy");
            v30 = *(void **)(v26 + 32);
            *(_QWORD *)(v26 + 32) = v29;

            v31 = objc_msgSend(0, "copy");
            v32 = *(void **)(v26 + 40);
            *(_QWORD *)(v26 + 40) = v31;

            v33 = objc_msgSend(0, "copy");
            v34 = *(void **)(v26 + 48);
            *(_QWORD *)(v26 + 48) = v33;

            v35 = objc_msgSend(0, "copy");
            v36 = *(void **)(v26 + 56);
            *(_QWORD *)(v26 + 56) = v35;

            *(_QWORD *)(v26 + 64) = objc_msgSend(v24, "persistentID");
            *(_BYTE *)(v26 + 16) = 0;
          }
          v16 = (HDNanoPairingEntity *)(id)v26;

          v15 = v42;
        }

        v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v38 = *(void **)(v37 + 40);
        *(_QWORD *)(v37 + 40) = v16;

      }
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    v39 = v12 != 0;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

+ (id)_predicateWithRegistryUUID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v2, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("registry_uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_nanoPairingEntitiesWithPredicate:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18[0] = CFSTR("registry_uuid");
  v18[1] = CFSTR("persistent_uuid");
  v18[2] = CFSTR("health_uuid");
  v18[3] = CFSTR("source_bundle_id");
  v18[4] = CFSTR("ids_id");
  v18[5] = CFSTR("sync_provenance");
  v18[6] = CFSTR("restored");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryWithDatabase:predicate:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__HDNanoPairingEntity__nanoPairingEntitiesWithPredicate_database_error___block_invoke;
  v16[3] = &unk_1E6CE9FC0;
  v17 = v9;
  v12 = v9;
  if (objc_msgSend(v11, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v10, a4, v16))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

+ (id)databaseTable
{
  return CFSTR("nano_pairing");
}

uint64_t __72__HDNanoPairingEntity__nanoPairingEntitiesWithPredicate_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HDNanoPairingEntity *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = -[HDSQLiteEntity initWithPersistentID:]([HDNanoPairingEntity alloc], "initWithPersistentID:", a2);
  MEMORY[0x1BCCAB1E0](a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v7, v8, 24);

  MEMORY[0x1BCCAB1E0](a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoPairingEntity setPersistentUUID:](v6, "setPersistentUUID:", v9);

  MEMORY[0x1BCCAB1E0](a4, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoPairingEntity setHealthDatabaseUUID:](v6, "setHealthDatabaseUUID:", v10);

  MEMORY[0x1BCCAB1D4](a4, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoPairingEntity setDefaultSourceBundleIdentifier:](v6, "setDefaultSourceBundleIdentifier:", v11);

  MEMORY[0x1BCCAB1D4](a4, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoPairingEntity setDeviceIdentifier:](v6, "setDeviceIdentifier:", v12);

  v13 = HDSQLiteColumnAsInt64();
  if (v6)
    v6->_syncProvenance = v13;
  -[HDNanoPairingEntity setRestoreComplete:](v6, "setRestoreComplete:", MEMORY[0x1BCCAB174](a4, 6));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  return 1;
}

- (void)setPersistentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDefaultSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setRestoreComplete:(BOOL)a3
{
  self->_restoreComplete = a3;
}

- (BOOL)isRestoreComplete
{
  return self->_restoreComplete;
}

void __170__HDNanoPairingEntity__initWithNanoRegistryUUID_persistentUUID_healthDatabaseUUID_sourceBundleIdentifier_deviceIdentifier_syncStoreEntity_restoreComplete_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("registry_uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB168](a2, CFSTR("persistent_uuid"), *(_QWORD *)(a1 + 40));
  MEMORY[0x1BCCAB168](a2, CFSTR("health_uuid"), *(_QWORD *)(a1 + 48));
  MEMORY[0x1BCCAB144](a2, CFSTR("source_bundle_id"), *(_QWORD *)(a1 + 56));
  MEMORY[0x1BCCAB144](a2, CFSTR("ids_id"), *(_QWORD *)(a1 + 64));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), objc_msgSend(*(id *)(a1 + 72), "persistentID"));
  JUMPOUT(0x1BCCAB0CCLL);
}

+ (id)nanoPairingEntityWithRegistryUUID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  +[HDNanoPairingEntity _predicateWithRegistryUUID:]((uint64_t)a1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoPairingEntity _nanoPairingEntitiesWithPredicate:database:error:]((uint64_t)a1, v9, v8, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sourceEntityForRegistryUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDNanoPairingEntity.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registryUUID != nil"));

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__81;
  v28 = __Block_byref_object_dispose__81;
  v29 = 0;
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__HDNanoPairingEntity_sourceEntityForRegistryUUID_profile_error___block_invoke;
  v19[3] = &unk_1E6CF39E0;
  v23 = a1;
  v12 = v9;
  v20 = v12;
  v22 = &v24;
  v13 = v10;
  v21 = v13;
  v14 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v19);

  if (v14)
    v15 = (void *)v25[5];
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&v24, 8);
  return v16;
}

BOOL __65__HDNanoPairingEntity_sourceEntityForRegistryUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoPairingEntity _predicateWithRegistryUUID:](*(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "propertyValueForAnyInDatabase:property:predicate:error:", v5, CFSTR("source_bundle_id"), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "sourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localSourceForBundleIdentifier:error:", v7, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a3, 100, CFSTR("missing source bundle identifier for registry UUID %@"), v8);
  }

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v13;
}

- (BOOL)saveWithHealthDatabase:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("persistent_uuid");
  v11[1] = CFSTR("health_uuid");
  v11[2] = CFSTR("source_bundle_id");
  v11[3] = CFSTR("ids_id");
  v11[4] = CFSTR("sync_provenance");
  v11[5] = CFSTR("restored");
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v11, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HDNanoPairingEntity_saveWithHealthDatabase_error___block_invoke;
  v10[3] = &unk_1E6CE84C8;
  v10[4] = self;
  LOBYTE(a4) = -[HDHealthEntity updateProperties:healthDatabase:error:bindingHandler:](self, "updateProperties:healthDatabase:error:bindingHandler:", v8, v7, a4, v10);

  return (char)a4;
}

void __52__HDNanoPairingEntity_saveWithHealthDatabase_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("persistent_uuid"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  MEMORY[0x1BCCAB168](a2, CFSTR("health_uuid"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  MEMORY[0x1BCCAB144](a2, CFSTR("source_bundle_id"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  MEMORY[0x1BCCAB144](a2, CFSTR("ids_id"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  JUMPOUT(0x1BCCAB0CCLL);
}

- (id)resetProvenanceForProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
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
  v18 = __Block_byref_object_copy__81;
  v19 = __Block_byref_object_dispose__81;
  v20 = 0;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HDNanoPairingEntity_resetProvenanceForProfile_error___block_invoke;
  v12[3] = &unk_1E6CEB640;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  LODWORD(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDNanoPairingEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, a4, v12);

  if ((_DWORD)a4)
    v9 = (void *)v16[5];
  else
    v9 = 0;
  v10 = v9;

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __55__HDNanoPairingEntity_resetProvenanceForProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  +[HDSyncStoreEntity recreateSyncStoreWithUUID:type:profile:error:](HDSyncStoreEntity, "recreateSyncStoreWithUUID:type:profile:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 1, *(_QWORD *)(a1 + 40), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (+[HDNanoPairingEntity nanoPairingEntityWithRegistryUUID:profile:error:](HDNanoPairingEntity, "nanoPairingEntityWithRegistryUUID:profile:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40), a3), v6 = objc_claimAutoreleasedReturnValue(), v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v8 = *(void **)(v7 + 40), *(_QWORD *)(v7 + 40) = v6, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "persistentUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPersistentUUID:", v9);

    objc_msgSend(*(id *)(a1 + 32), "healthDatabaseUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setHealthDatabaseUUID:", v10);

    objc_msgSend(*(id *)(a1 + 32), "defaultSourceBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDefaultSourceBundleIdentifier:", v11);

    objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDeviceIdentifier:", v12);

    v13 = objc_msgSend(v5, "persistentID");
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v14)
      *(_QWORD *)(v14 + 64) = v13;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRestoreComplete:", objc_msgSend(*(id *)(a1 + 32), "isRestoreComplete"));
    v15 = *(void **)(a1 + 40);
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v15, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "saveWithHealthDatabase:error:", v17, a3);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_45;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("sync_provenance");
  +[HDHealthEntity defaultForeignKey](HDSyncStoreEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_nanoRegistryUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_persistentUUID, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_healthDatabaseUUID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p registry:%@ persistent:%@ health:%@ device:%@>"), v4, self, v5, v6, v7, self->_deviceIdentifier, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)healthDatabaseUUID
{
  return self->_healthDatabaseUUID;
}

- (void)setHealthDatabaseUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_healthDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_persistentUUID, 0);
  objc_storeStrong((id *)&self->_nanoRegistryUUID, 0);
}

@end
