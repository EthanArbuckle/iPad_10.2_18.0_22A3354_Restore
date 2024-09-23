@implementation HDNotificationInstructionEntity

+ (BOOL)attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  +[HDHealthEntity transactionContextForWriting:baseContext:](HDDataEntity, "transactionContextForWriting:baseContext:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__HDNotificationInstructionEntity_attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase_error_block___block_invoke;
  v14[3] = &unk_1E6CF69D0;
  v16 = v9;
  v17 = a1;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  LOBYTE(a4) = objc_msgSend(v12, "performTransactionWithContext:error:block:inaccessibilityHandler:", v10, a4, v11, v14);

  return (char)a4;
}

uint64_t __120__HDNotificationInstructionEntity_attemptProtectedReadTransactionWithUnprotectedFallbackWithHealthDatabase_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "transactionContextForWriting:baseContext:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "performTransactionWithContext:error:block:inaccessibilityHandler:", v6, a3, *(_QWORD *)(a1 + 40), 0);

  return v7;
}

+ (BOOL)enumerateNotificationInstructionsWithClientIdentifier:(id)a3 action:(int64_t)a4 notExpiredBeforeDate:(id)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v26 = (void *)MEMORY[0x1E0D29840];
  v12 = (void *)MEMORY[0x1E0D29838];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  objc_msgSend(v13, "numberWithInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("action"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("client_identifier"), v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v29[1] = v20;
  HDNotificationInstructionPredicateForIsValid(1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("expiration_date"), v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateMatchingAllPredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v21) = objc_msgSend(a1, "enumerateAllNotificationInstructionsWithTransaction:predicate:limit:ascending:error:enumerationHandler:", v15, v24, 0, 1, a7, v14);
  return (char)v21;
}

+ (BOOL)enumerateNotificationInstructionsWithSetCriteriaNotExpiredBeforeDate:(id)a3 transaction:(id)a4 limit:(unint64_t)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0D29840];
  v13 = (void *)MEMORY[0x1E0D29880];
  v14 = a7;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v13, "isNotNullPredicateWithProperty:", CFSTR("criteria"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HDNotificationInstructionPredicateForIsValid(1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("expiration_date"), v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateMatchingAllPredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = objc_msgSend(a1, "enumerateAllNotificationInstructionsWithTransaction:predicate:limit:ascending:error:enumerationHandler:", v15, v21, a5, 1, a6, v14);
  return (char)a6;
}

+ (BOOL)enumerateAllNotificationInstructionsWithTransaction:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 ascending:(BOOL)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  void *v26;
  _QWORD v27[14];

  v9 = a6;
  v27[12] = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a4;
  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], a1, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v16, v15, a5, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = CFSTR("action");
  v27[1] = CFSTR("category_identifier");
  v27[2] = CFSTR("client_identifier");
  v27[3] = CFSTR("criteria");
  v27[4] = CFSTR("creation_date");
  v27[5] = CFSTR("expiration_date");
  v27[6] = CFSTR("is_invalid");
  v27[7] = CFSTR("message_identifier");
  v27[8] = CFSTR("modification_date");
  v27[9] = CFSTR("received_date");
  v27[10] = CFSTR("sending_device_info");
  v27[11] = CFSTR("sending_device_name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __138__HDNotificationInstructionEntity_enumerateAllNotificationInstructionsWithTransaction_predicate_limit_ascending_error_enumerationHandler___block_invoke;
  v23[3] = &unk_1E6CEED78;
  v24 = v14;
  v25 = a1;
  v21 = v14;
  LOBYTE(a7) = objc_msgSend(v19, "enumerateProperties:error:enumerationHandler:", v20, a7, v23);

  return (char)a7;
}

uint64_t __138__HDNotificationInstructionEntity_enumerateAllNotificationInstructionsWithTransaction_predicate_limit_ascending_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDNotificationInstruction *v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  objc_opt_self();
  v16 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v3;
  v9 = -[HDNotificationInstruction initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:]([HDNotificationInstruction alloc], "initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:", v4, v14, v6, v5, v8, v7, v16, v15, v1, v2, v13, v12);

  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v10;
}

+ (BOOL)insertOrIgnoreNotificationInstruction:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke;
  v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v14[4] = a1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke_2;
  v12[3] = &unk_1E6CE9508;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertOrIgnoreNotificationInstruction_transaction_error__lookupKey, a5, v14, v12, 0);

  return (char)a5;
}

id __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES(?,  ?,  ?,  ?,  ?,  ?,  ?,  ?,  ?,  ?,  ?,  ?)"), v2, CFSTR("action"), CFSTR("category_identifier"), CFSTR("client_identifier"), CFSTR("creation_date"), CFSTR("criteria"), CFSTR("expiration_date"), CFSTR("is_invalid"), CFSTR("message_identifier"), CFSTR("modification_date"), CFSTR("received_date"), CFSTR("sending_device_info"), CFSTR("sending_device_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __91__HDNotificationInstructionEntity_insertOrIgnoreNotificationInstruction_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
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
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "criteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(*(id *)(a1 + 32), "criteria");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "action"));
  objc_msgSend(*(id *)(a1 + 32), "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(*(id *)(a1 + 32), "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int(a2, 7, objc_msgSend(*(id *)(a1 + 32), "isInvalid"));
  objc_msgSend(*(id *)(a1 + 32), "messageIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "receivedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "sendingDeviceInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "sendingDeviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

+ (BOOL)invalidateNotificationInstructionWithMessageIdentifier:(id)a3 modificationDate:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];

  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke_2;
  v16[3] = &unk_1E6CE7750;
  v17 = v11;
  v13 = v10;
  v14 = v11;
  LOBYTE(a6) = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error__lookupKey, a6, v19, v16, 0);

  return (char)a6;
}

id __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?, %@ = ? WHERE %@ = ?"), v2, CFSTR("is_invalid"), CFSTR("modification_date"), CFSTR("message_identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __125__HDNotificationInstructionEntity_invalidateNotificationInstructionWithMessageIdentifier_modificationDate_transaction_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindStringToStatement();
}

+ (BOOL)obliterateNotificationInstructionsWithTransaction:(id)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v12;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDNotificationInstructionEntity.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v8, "setEntityClass:", a1);
  objc_msgSend(v8, "setLimitCount:", *MEMORY[0x1E0D29968]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v7, v8);
  v10 = objc_msgSend(v9, "deleteAllEntitiesWithError:", a4);

  return v10;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  return CFSTR("notification_instructions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_46;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD *, void *, uint64_t);
  void *v22;
  id v23;
  uint64_t *v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanValue:", CFSTR("expiration_date"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(v10, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __72__HDNotificationInstructionEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v22 = &unk_1E6CF6410;
  v25 = a1;
  v16 = v14;
  v26 = a5;
  v23 = v16;
  v24 = &v27;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v15, a6, &v19);

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v28 + 6), v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __72__HDNotificationInstructionEntity_pruneWithProfile_nowDate_limit_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[4];
  v7 = (void *)a1[6];
  v8 = a1[7];
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, v6, v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "deleteAllEntitiesWithError:", a3);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "getChangesCount");

  return v12;
}

@end
