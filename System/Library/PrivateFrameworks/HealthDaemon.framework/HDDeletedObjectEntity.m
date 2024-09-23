@implementation HDDeletedObjectEntity

+ (BOOL)deleteObjectsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a4;
  objc_msgSend(a1, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke;
  v14[3] = &unk_1E6CE9280;
  v16 = v9;
  v17 = a1;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v14);

  return (char)a5;
}

+ (BOOL)requiresSampleTypePredicate
{
  return 1;
}

+ (int64_t)preferredEntityType
{
  return 2;
}

uint64_t __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  HDDataEntityDeletionContext *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDDataEntityDeletionContext *v11;
  uint64_t v12;
  _QWORD v14[4];
  HDDataEntityDeletionContext *v15;
  uint64_t v16;

  v5 = a2;
  v6 = -[HDDataEntityDeletionContext initWithProfile:transaction:]([HDDataEntityDeletionContext alloc], "initWithProfile:transaction:", a1[4], v5);
  v7 = (void *)a1[6];
  objc_msgSend(v5, "databaseForEntityClass:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "queryWithDatabase:predicate:", v8, a1[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke_2;
  v14[3] = &unk_1E6CEC918;
  v10 = a1[6];
  v15 = v6;
  v16 = v10;
  v11 = v6;
  v12 = objc_msgSend(v9, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a3, v14);

  return v12;
}

+ (id)insertDeletedObject:(id)a3 provenanceIdentifier:(id)a4 deletionDate:(id)a5 inDatabase:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __96__HDDeletedObjectEntity_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error___block_invoke_2;
  v21[3] = &unk_1E6CE7C30;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = objc_msgSend(v14, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error__insertKey, a7, &__block_literal_global_33, v21, 0);
  v19 = 0;
  if (v18)
  {
    objc_msgSend(v14, "lastInsertRowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

id __96__HDDeletedObjectEntity_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)"), v1, CFSTR("uuid"), CFSTR("provenance"), CFSTR("type"), CFSTR("creation_date"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __96__HDDeletedObjectEntity_insertDeletedObject_provenanceIdentifier_deletionDate_inDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 2);
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __66__HDDeletedObjectEntity_deleteObjectsWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteObjectWithPersistentID:entityClass:error:", a2, *(_QWORD *)(a1 + 40));
  return 1;
}

+ (id)deletedObjectEntityForDeletedObject:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__27;
  v23 = __Block_byref_object_dispose__27;
  v24 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HDDeletedObjectEntity_deletedObjectEntityForDeletedObject_profile_error___block_invoke;
  v15[3] = &unk_1E6CEC940;
  v17 = &v19;
  v18 = a1;
  v11 = v8;
  v16 = v11;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __75__HDDeletedObjectEntity_deletedObjectEntityForDeletedObject_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = (void *)a1[6];
  v6 = (void *)a1[4];
  v7 = a2;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletedObjectEntityWithUUID:transaction:error:", v8, v7, a3);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
}

+ (id)deletedObjectEntityWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (Class)baseDataEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)deleteEntitiesWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  objc_super v11;

  v8 = a4;
  objc_msgSend(a1, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDDeletedObjectEntity;
  LOBYTE(a5) = objc_msgSendSuper2(&v11, sel_deleteEntitiesWithPredicate_healthDatabase_error_, v9, v8, a5);

  return (char)a5;
}

@end
