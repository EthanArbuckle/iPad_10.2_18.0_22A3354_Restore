@implementation HDAdvanceUDCSyncAnchors

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];
  _QWORD v11[4];
  id v12;

  v5 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___HDAdvanceUDCSyncAnchors_block_invoke_4;
  v11[3] = &unk_1E6CEB2F8;
  v12 = *(id *)(a1 + 40);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = ___HDAdvanceUDCSyncAnchors_block_invoke_5;
  v10[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = *(_QWORD *)(a1 + 48);
  v10[5] = v5;
  v8 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_HDAdvanceUDCSyncAnchors_statementKey, a3, v11, v10, 0);

  return v8;
}

id ___HDAdvanceUDCSyncAnchors_block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t ___HDAdvanceUDCSyncAnchors_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
