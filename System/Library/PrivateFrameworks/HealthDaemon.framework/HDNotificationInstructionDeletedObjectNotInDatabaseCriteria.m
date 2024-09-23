@implementation HDNotificationInstructionDeletedObjectNotInDatabaseCriteria

+ (id)criteriaIdentifier
{
  return CFSTR("HDNotificationInstructionDeletedObjectNotInDatabaseCriteria");
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 6, CFSTR("Protected database is inaccessible"));
    goto LABEL_5;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__HDNotificationInstructionDeletedObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2;
  v12[3] = &unk_1E6CE9508;
  v12[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__HDNotificationInstructionDeletedObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3;
  v11[3] = &unk_1E6CE8540;
  v11[4] = &v13;
  if (!objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &isValidWithDatabaseTransaction_error__lookupKey, a4, &__block_literal_global_191, v12, v11))
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = v14[3];
LABEL_6:

  _Block_object_dispose(&v13, 8);
  return v9;
}

id __100__HDNotificationInstructionDeletedObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? AND %@ = ? LIMIT 1"), v1, CFSTR("uuid"), CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __100__HDNotificationInstructionDeletedObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 2, 2);
}

uint64_t __100__HDNotificationInstructionDeletedObjectNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  return 0;
}

@end
