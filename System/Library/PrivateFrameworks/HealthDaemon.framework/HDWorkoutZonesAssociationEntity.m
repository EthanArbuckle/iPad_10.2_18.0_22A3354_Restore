@implementation HDWorkoutZonesAssociationEntity

+ (id)databaseTable
{
  return CFSTR("workout_zones_associations");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_30;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("workout_id");
  v3[1] = CFSTR("zones_sample_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("workout_id");
  +[HDDataEntity defaultForeignKey](HDWorkoutEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("zones_sample_id");
  v7[0] = v2;
  +[HDDataEntity defaultForeignKey](HDWorkoutZonesSampleEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (BOOL)associateZonesSamplesWithUUIDs:(id)a3 withWorkoutUUID:(id)a4 transaction:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  LOBYTE(a7) = +[HDWorkoutZonesAssociationEntity _insertAssociationsForZonesSamplesWithUUIDs:withWorkoutUUID:syncProvenance:syncIdentity:ignoreDeletedObjects:transaction:error:]((uint64_t)a1, v14, v13, 0, objc_msgSend(a6, "currentSyncIdentityPersistentID"), 0, v12, a7);

  return (char)a7;
}

+ (uint64_t)_insertAssociationsForZonesSamplesWithUUIDs:(void *)a3 withWorkoutUUID:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(int)a6 ignoreDeletedObjects:(void *)a7 transaction:(_QWORD *)a8 error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  _QWORD v44[6];

  v44[4] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a7;
  v14 = objc_opt_self();
  objc_msgSend(v13, "databaseForEntityClass:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = CFSTR("workout_id");
  v44[1] = CFSTR("zones_sample_id");
  v44[2] = CFSTR("sync_provenance");
  v44[3] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDWorkoutEntity, "anyInDatabase:predicate:error:", v15, v17, &v41);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v41;

  if (v18)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke;
    v30[3] = &unk_1E6CF3320;
    v39 = a6;
    v31 = v15;
    v36 = v14;
    v32 = v13;
    v33 = v12;
    v34 = v16;
    v35 = v18;
    v37 = a4;
    v38 = a5;
    v20 = objc_msgSend(v11, "hk_enumerateUUIDsWithError:block:", a8, v30);

    goto LABEL_16;
  }
  if (!v19)
  {
    if (a6)
    {
      v40 = 0;
      v21 = +[HDWorkoutZonesAssociationEntity _wasDeletedObjectWithUUID:transaction:error:](v14, v12, v13, (uint64_t)&v40);
      v19 = v40;
      if (v21)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v43 = v12;
          _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "Not inserting zones associations since workout %{public}@ was previously deleted", buf, 0xCu);
        }
        goto LABEL_13;
      }
    }
  }
  if (v19)
  {
    v19 = v19;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v12, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_error:format:", 118, CFSTR("Workout %@ does not exist when associating zones"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v25;
    if (!v19)
    {
LABEL_13:
      v20 = 1;
      goto LABEL_16;
    }
  }
  if (a8)
    *a8 = objc_retainAutorelease(v19);
  else
    _HKLogDroppedError();

  v20 = 0;
LABEL_16:

  return v20;
}

+ (BOOL)associateSyncedZonesSamplesWithUUIDs:(id)a3 withWorkoutUUID:(id)a4 syncIdentity:(id)a5 syncProvenance:(int64_t)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:transaction:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:transaction:error:", a5, v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[HDWorkoutZonesAssociationEntity _insertAssociationsForZonesSamplesWithUUIDs:withWorkoutUUID:syncProvenance:syncIdentity:ignoreDeletedObjects:transaction:error:]((uint64_t)a1, v14, v15, a6, objc_msgSend(v19, "persistentID"), 1, v16, a8);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)enumerateZonesSamplesWithWorkoutPersistentID:(unint64_t)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0D29838];
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = a5;
  objc_msgSend(v15, "numberWithUnsignedLongLong:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithProperty:equalToValue:", CFSTR("workout_id"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "databaseForEntityClass:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("zones_sample_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __114__HDWorkoutZonesAssociationEntity_enumerateZonesSamplesWithWorkoutPersistentID_profile_transaction_error_handler___block_invoke;
  v25[3] = &unk_1E6CF32D0;
  v26 = v12;
  v27 = v13;
  v22 = v13;
  v23 = v12;
  LOBYTE(a6) = objc_msgSend(v20, "enumerateProperties:error:enumerationHandler:", v21, a6, v25);

  return (char)a6;
}

uint64_t __114__HDWorkoutZonesAssociationEntity_enumerateZonesSamplesWithWorkoutPersistentID_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", HDSQLiteColumnWithNameAsInt64());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity objectWithID:encodingOptions:profile:error:](HDWorkoutZonesSampleEntity, "objectWithID:encodingOptions:profile:error:", v6, 0, *(_QWORD *)(a1 + 32), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v8 = 0;

  return v8;
}

- (id)workoutUUIDWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("workout_id"), v6, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    HDDataEntityPredicateForRowID(v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutZonesAssociationEntity _dataObjectUUIDWithPredicate:transaction:error:]((uint64_t)self, v9, v6, (uint64_t)a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dataObjectUUIDWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v6 = a3;
    v7 = a2;
    objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDSQLiteEntity propertyValueForAnyInDatabase:property:predicate:error:](HDDataEntity, "propertyValueForAnyInDatabase:property:predicate:error:", v8, CFSTR("uuid"), v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _HDUUIDForSQLiteValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)zonesUUIDWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("zones_sample_id"), v6, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    HDDataEntityPredicateForRowID(v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutZonesAssociationEntity _dataObjectUUIDWithPredicate:transaction:error:]((uint64_t)self, v9, v6, (uint64_t)a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_wasDeletedObjectWithUUID:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  +[HDDeletedObjectEntity deletedObjectEntityWithUUID:transaction:error:](HDDeletedObjectEntity, "deletedObjectEntityWithUUID:transaction:error:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

BOOL __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  HDDataEntityPredicateForDataUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDWorkoutZonesSampleEntity, "anyInDatabase:predicate:error:", v7, v8, &v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v31;

  if (v9)
  {
    v11 = *(void **)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 56);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke_215;
    v26[3] = &unk_1E6CF32F8;
    v27 = v9;
    v28 = *(id *)(a1 + 64);
    v29 = *(_OWORD *)(a1 + 80);
    objc_msgSend(v11, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v12, v13, a4, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

    goto LABEL_13;
  }
  if (v10)
    goto LABEL_4;
  if (!*(_BYTE *)(a1 + 96))
    goto LABEL_15;
  v16 = *(_QWORD *)(a1 + 72);
  v17 = *(void **)(a1 + 40);
  v30 = 0;
  v18 = +[HDWorkoutZonesAssociationEntity _wasDeletedObjectWithUUID:transaction:error:](v16, v6, v17, (uint64_t)&v30);
  v19 = v30;
  v10 = v19;
  if (v18)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v6;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Not inserting zones associations since zones sample %{public}@ was previously deleted", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (!v19)
  {
LABEL_15:
    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v6, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hk_error:format:", 118, CFSTR("Zones sample %@ does not exist when associating with workout %@"), v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v25;
    if (v10)
      goto LABEL_5;
LABEL_16:
    v15 = 1;
    goto LABEL_13;
  }
LABEL_4:
  v10 = v10;
LABEL_5:
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  else
    _HKLogDroppedError();

  v15 = 0;
LABEL_13:

  return v15;
}

void __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke_215(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("zones_sample_id"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_id"), objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 48));
  JUMPOUT(0x1BCCAB114);
}

@end
