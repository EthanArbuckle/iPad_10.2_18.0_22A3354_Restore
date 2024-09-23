@implementation HDMigrateAndDeleteProtectedOnboardingCompletionTable

uint64_t ___HDMigrateAndDeleteProtectedOnboardingCompletionTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___HDMigrateAndDeleteProtectedOnboardingCompletionTable_block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11[4] = a2;
  v11[5] = v8;
  v9 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, v11, 0);

  return v9;
}

uint64_t ___HDMigrateAndDeleteProtectedOnboardingCompletionTable_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  sqlite3_int64 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  sqlite3_int64 v11;

  HDSQLiteColumnWithNameAsUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  v6 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 3, v6);
  HDSQLiteColumnWithNameAsDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteColumnWithNameAsDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  v10 = HDSQLiteColumnWithNameAsBoolean();
  sqlite3_bind_int(a2, 7, v10);
  v11 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 8, v11);
  return sqlite3_bind_int64(a2, 9, *(_QWORD *)(a1 + 40));
}

uint64_t ___HDMigrateAndDeleteProtectedOnboardingCompletionTable_block_invoke_3(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, 54);
}

@end
