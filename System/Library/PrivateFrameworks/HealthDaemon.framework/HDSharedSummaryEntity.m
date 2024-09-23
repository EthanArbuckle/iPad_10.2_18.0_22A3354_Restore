@implementation HDSharedSummaryEntity

+ (id)databaseTable
{
  return CFSTR("shared_summaries");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("transaction_id");
  +[HDHealthEntity defaultForeignKey](HDSharedSummaryTransactionEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("package");
  v3[1] = CFSTR("name");
  v3[2] = CFSTR("transaction_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertOrReplaceWithUUID:(id)a3 package:(id)a4 name:(id)a5 version:(id)a6 compatibilityVersion:(id)a7 transactionID:(unint64_t)a8 summaryData:(id)a9 databaseTransaction:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  _QWORD v41[10];

  v41[8] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  objc_msgSend(a10, "databaseForEntityClass:", a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = CFSTR("uuid");
  v41[1] = CFSTR("package");
  v41[2] = CFSTR("name");
  v41[3] = CFSTR("version");
  v41[4] = CFSTR("compatibility_version");
  v41[5] = CFSTR("transaction_id");
  v41[6] = CFSTR("summary_data");
  v41[7] = CFSTR("synced");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __143__HDSharedSummaryEntity_insertOrReplaceWithUUID_package_name_version_compatibilityVersion_transactionID_summaryData_databaseTransaction_error___block_invoke;
  v33[3] = &unk_1E6CEE8F8;
  v34 = v31;
  v35 = v16;
  v36 = v17;
  v37 = v18;
  v39 = v20;
  v40 = a8;
  v38 = v19;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v31;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v21, v22, a11, v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void __143__HDSharedSummaryEntity_insertOrReplaceWithUUID_package_name_version_compatibilityVersion_transactionID_summaryData_databaseTransaction_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), a1[4]);
  MEMORY[0x1BCCAB144](a2, CFSTR("package"), a1[5]);
  MEMORY[0x1BCCAB144](a2, CFSTR("name"), a1[6]);
  MEMORY[0x1BCCAB144](a2, CFSTR("version"), a1[7]);
  MEMORY[0x1BCCAB144](a2, CFSTR("compatibility_version"), a1[8]);
  MEMORY[0x1BCCAB114](a2, CFSTR("transaction_id"), a1[10]);
  MEMORY[0x1BCCAB0D8](a2, CFSTR("summary_data"), a1[9]);
  JUMPOUT(0x1BCCAB0CCLL);
}

+ (BOOL)deleteAllSummariesWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryWithDatabase:predicate:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v8, "deleteAllEntitiesWithError:", a4);
  return (char)a4;
}

+ (BOOL)enumerateEntitiesWithTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 databaseTransaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v14, "numberWithUnsignedLongLong:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = +[HDSharedSummaryEntity _enumerateEntitiesWithTransactionID:package:names:reuseTransactionID:databaseTransaction:error:enumerationHandler:]((uint64_t)a1, v19, v18, v17, 0, v16, (uint64_t)a7, v15);

  return (char)a7;
}

+ (uint64_t)_enumerateEntitiesWithTransactionID:(void *)a3 package:(void *)a4 names:(void *)a5 reuseTransactionID:(void *)a6 databaseTransaction:(uint64_t)a7 error:(void *)a8 enumerationHandler:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = a2;
  v20 = (void *)objc_opt_self();
  +[HDSharedSummaryEntity _predicateForTransactionID:package:names:reuseTransactionID:]((uint64_t)HDSharedSummaryEntity, v19, v18, v17, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "databaseForEntityClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "queryWithDatabase:predicate:", v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __139__HDSharedSummaryEntity__enumerateEntitiesWithTransactionID_package_names_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E6CE84F0;
  v28 = v14;
  v24 = v14;
  v25 = objc_msgSend(v23, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", MEMORY[0x1E0C9AA60], a7, v27);

  return v25;
}

+ (BOOL)enumerateEntitiesWithReuseTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 databaseTransaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v14, "numberWithUnsignedLongLong:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = +[HDSharedSummaryEntity _enumerateEntitiesWithTransactionID:package:names:reuseTransactionID:databaseTransaction:error:enumerationHandler:]((uint64_t)a1, 0, v18, v17, v19, v16, (uint64_t)a7, v15);

  return (char)a7;
}

+ (BOOL)enumerateSummariesWithTransactionID:(unint64_t)a3 package:(id)a4 names:(id)a5 includedObjectTypes:(id)a6 databaseTransaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  char v49;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[6];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  objc_msgSend(v14, "numberWithUnsignedLongLong:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v17;
  v23 = v16;
  v52 = v15;
  v24 = v21;
  v25 = v18;
  v26 = v19;
  v27 = v20;
  v28 = (void *)objc_opt_self();
  +[HDSharedSummaryEntity _predicateForTransactionID:package:names:reuseTransactionID:]((uint64_t)HDSharedSummaryEntity, v27, v26, v25, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v25;
  v53 = v26;

  v54 = v27;
  v30 = 0x1E0C99000;
  if (v22)
  {
    objc_msgSend(v22, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hk_map:", &__block_literal_global_42);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hk_map:", &__block_literal_global_240);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSharedSummaryObjectTypeEntity, "disambiguatedDatabaseTable");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v24;
    +[HDSharedSummaryEntity databaseTable](HDSharedSummaryEntity, "databaseTable");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("EXISTS (SELECT * FROM %@ WHERE %@ = %@.%@ AND %@ IN (%@))"), v37, CFSTR("summary_id"), v38, *MEMORY[0x1E0D29618], CFSTR("object_type"), v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D298B0], "predicateWithSQL:overProperties:values:", v39, MEMORY[0x1E0C9AA60], v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x1E0D29840];
    v61[0] = v29;
    v61[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "predicateMatchingAllPredicates:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v24 = v51;
    v30 = 0x1E0C99000uLL;

    v29 = (void *)v43;
  }
  objc_msgSend(v23, "databaseForEntityClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "queryWithDatabase:predicate:", v44, v29);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = CFSTR("uuid");
  v60[1] = CFSTR("package");
  v60[2] = CFSTR("name");
  v60[3] = CFSTR("version");
  v60[4] = CFSTR("compatibility_version");
  v60[5] = CFSTR("summary_data");
  objc_msgSend(*(id *)(v30 + 3360), "arrayWithObjects:count:", v60, 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke_3;
  v57[3] = &unk_1E6CEE9A0;
  v58 = v23;
  v59 = v52;
  v47 = v52;
  v48 = v23;
  v49 = objc_msgSend(v45, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v46, a8, v57);

  return v49;
}

+ (id)entityWithUUID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0D29838];
  v10 = a4;
  objc_msgSend(v9, "predicateWithProperty:equalToValue:", CFSTR("uuid"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntityClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v12, v11, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  v15 = v14;
  if (!v13)
  {
    if (v14)
    {
      v15 = v14;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v8, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hk_error:format:", 118, CFSTR("Cannot find summary with UUID %@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v18;
      if (!v15)
        goto LABEL_9;
    }
    if (a5)
      *a5 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();

  }
LABEL_9:

  return v13;
}

+ (BOOL)reuseSummariesForTransactionID:(unint64_t)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];

  v8 = a4;
  objc_msgSend(v8, "databaseForEntityClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v15[4] = a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke;
  v16[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v16[4] = a1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_2;
  v15[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  if (objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &reuseSummariesForTransactionID_databaseTransaction_error__reuseIntoTransactionKey, a5, v16, v15, 0))
  {
    v13[4] = a3;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_3;
    v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v14[4] = a1;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_4;
    v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v11 = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &reuseSummariesForTransactionID_databaseTransaction_error__clearReuseTransactionKey, a5, v14, v13, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE OR IGNORE %@ SET %@=? WHERE %@=?"), v2, CFSTR("transaction_id"), CFSTR("reuse_transaction_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 32));
}

id __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@=NULL WHERE %@=?"), v2, CFSTR("reuse_transaction_id"), CFSTR("reuse_transaction_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__HDSharedSummaryEntity_reuseSummariesForTransactionID_databaseTransaction_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

+ (int64_t)countOfObjectsForTransactionID:(int64_t)a3 healthDatabase:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = (void *)MEMORY[0x1E0D29838];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("transaction_id"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = +[HDHealthEntity countOfObjectsWithPredicate:healthDatabase:error:](HDSharedSummaryEntity, "countOfObjectsWithPredicate:healthDatabase:error:", v11, v9, a5);
  return v12;
}

- (BOOL)setSynced:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[HDHealthEntity setNumber:forProperty:transaction:error:](self, "setNumber:forProperty:transaction:error:", v10, CFSTR("synced"), v9, a5);

  return (char)a5;
}

- (BOOL)syncedInDatabaseTransaction:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("synced"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)UUIDInDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSQLiteEntity UUIDForProperty:database:](self, "UUIDForProperty:database:", CFSTR("uuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)packageInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("package"), a3, a4);
}

- (id)nameInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("name"), a3, a4);
}

- (id)versionInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("version"), a3, a4);
}

- (id)compatibilityVersionInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("compatibility_version"), a3, a4);
}

- (id)summaryDataInDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSQLiteEntity valueForProperty:database:](self, "valueForProperty:database:", CFSTR("summary_data"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transactionIDInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("transaction_id"), a3, a4);
}

- (BOOL)setReuseTransactionID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("reuse_transaction_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__HDSharedSummaryEntity_setReuseTransactionID_databaseTransaction_error___block_invoke;
  v14[3] = &unk_1E6CE84C8;
  v15 = v8;
  v12 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v10, a5, v14);

  return (char)a5;
}

void __73__HDSharedSummaryEntity_setReuseTransactionID_databaseTransaction_error___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "unsignedLongLongValue");
    JUMPOUT(0x1BCCAB114);
  }
  JUMPOUT(0x1BCCAB120);
}

- (id)reuseTransactionIDInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("reuse_transaction_id"), a3, a4);
}

+ (id)_predicateForTransactionID:(void *)a3 package:(void *)a4 names:(void *)a5 reuseTransactionID:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_self();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("transaction_id"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("reuse_transaction_id"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "disjunctionWithPredicate:otherPredicate:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("package"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v12, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }
  if (v10)
  {
    v26 = v12;
    v27 = v11;
    v28 = v10;
    v29 = v9;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v30 = v8;
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v32;
      do
      {
        v22 = 0;
        v23 = v20;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v17);
          objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("name"), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29890], "disjunctionWithPredicate:otherPredicate:", v23, v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          ++v22;
          v23 = v20;
        }
        while (v19 != v22);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v26, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v29;
    v8 = v30;
    v11 = v27;
    v10 = v28;
  }

  return v12;
}

uint64_t __139__HDSharedSummaryEntity__enumerateEntitiesWithTransactionID_package_names_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDSharedSummaryEntity, "entityWithPersistentID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

const __CFString *__160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("?");
}

uint64_t __160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "code"));
}

uint64_t __160__HDSharedSummaryEntity__enumerateSummariesWithTransactionID_package_names_includedObjectTypes_reuseTransactionID_databaseTransaction_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;

  +[HDSharedSummaryAuthorizationIdentifierEntity authorizationIdentifiersForSummaryID:databaseTransaction:error:](HDSharedSummaryAuthorizationIdentifierEntity, "authorizationIdentifiersForSummaryID:databaseTransaction:error:", a2, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HDSharedSummaryObjectTypeEntity objectTypesForSummaryID:databaseTransaction:error:](HDSharedSummaryObjectTypeEntity, "objectTypesForSummaryID:databaseTransaction:error:", a2, *(_QWORD *)(a1 + 32), a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      HDSQLiteColumnWithNameAsUUID();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsData();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B58]), "_initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:", v18, v10, v11, v12, v13, v8, v9, v14);
      v16 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
