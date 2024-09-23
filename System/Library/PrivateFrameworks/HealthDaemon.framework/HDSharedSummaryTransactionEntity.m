@implementation HDSharedSummaryTransactionEntity

+ (id)databaseTable
{
  return CFSTR("shared_summary_transactions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryTransactionEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertWithUUID:(id)a3 sourceDevice:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("uuid");
  v21[1] = CFSTR("source_device");
  v21[2] = CFSTR("committed");
  v21[3] = CFSTR("creation_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HDSharedSummaryTransactionEntity_insertWithUUID_sourceDevice_databaseTransaction_error___block_invoke;
  v18[3] = &unk_1E6CE89A8;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v12, v13, a6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __90__HDSharedSummaryTransactionEntity_insertWithUUID_sourceDevice_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB144](a2, CFSTR("source_device"), *(_QWORD *)(a1 + 40));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("committed"), 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("creation_date"), v4);

}

+ (BOOL)enumerateTransactionsWithDatabaseTransaction:(id)a3 includeNonCommitted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a6;
  if (a4)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("committed"), MEMORY[0x1E0C9AAB0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "databaseForEntityClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __126__HDSharedSummaryTransactionEntity_enumerateTransactionsWithDatabaseTransaction_includeNonCommitted_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E6CE84F0;
  v19 = v11;
  v15 = v11;
  v16 = objc_msgSend(v14, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", MEMORY[0x1E0C9AA60], a5, v18);

  return v16;
}

uint64_t __126__HDSharedSummaryTransactionEntity_enumerateTransactionsWithDatabaseTransaction_includeNonCommitted_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDSharedSummaryTransactionEntity, "entityWithPersistentID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

+ (id)transactionEntityWithUUID:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)mostRecentTransactionCreationDateWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "databaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT MAX(%@) FROM %@"), CFSTR("creation_date"), v8);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__28;
  v18 = __Block_byref_object_dispose__28;
  v19 = 0;
  objc_msgSend(v6, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__HDSharedSummaryTransactionEntity_mostRecentTransactionCreationDateWithDatabaseTransaction_error___block_invoke;
  v13[3] = &unk_1E6CE8540;
  v13[4] = &v14;
  LOBYTE(a4) = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v9, a4, 0, v13);

  if ((a4 & 1) != 0)
    v11 = (id)v15[5];
  else
    v11 = 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __99__HDSharedSummaryTransactionEntity_mostRecentTransactionCreationDateWithDatabaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB198](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)deleteAllEntriesWithDatabaseTransaction:(id)a3 error:(id *)a4
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

- (BOOL)deleteWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = *MEMORY[0x1E0D29618];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "deleteEntitiesInDatabase:predicate:error:", v12, v11, a4);
  return (char)a4;
}

- (id)uuidInDatabaseTransaction:(id)a3 error:(id *)a4
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

- (id)sourceDeviceIdentiferInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("source_device"), a3, a4);
}

- (BOOL)setCommitted:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5
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
  LOBYTE(a5) = -[HDHealthEntity setNumber:forProperty:transaction:error:](self, "setNumber:forProperty:transaction:error:", v10, CFSTR("committed"), v9, a5);

  return (char)a5;
}

- (BOOL)committedInDatabaseTransaction:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("committed"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)creationDateInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("creation_date"), a3, a4);
}

- (BOOL)unit_testSetCreationDate:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("creation_date"), a4, a5);
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v9 = a3;
  v10 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__HDSharedSummaryTransactionEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v15[3] = &unk_1E6CEC9E0;
  v18 = a1;
  v12 = v10;
  v16 = v12;
  v17 = &v19;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v11, a6, v15);

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v20 + 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __73__HDSharedSummaryTransactionEntity_pruneWithProfile_nowDate_limit_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  id v17;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", -1209600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("committed"), MEMORY[0x1E0C9AAA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanValue:", CFSTR("creation_date"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D29840];
  v20[0] = v8;
  v20[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v13 = objc_msgSend((id)objc_opt_class(), "deleteEntitiesInDatabase:predicate:error:", v6, v12, &v19);
  v14 = v19;
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "getChangesCount");
    v16 = 1;
  }
  else
  {
    v17 = v14;
    v16 = v17 == 0;
    if (v17)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

  }
  return v16;
}

@end
