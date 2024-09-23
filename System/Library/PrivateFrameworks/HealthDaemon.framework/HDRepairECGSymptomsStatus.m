@implementation HDRepairECGSymptomsStatus

uint64_t ___HDRepairECGSymptomsStatus_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unsigned __int8 IsNonNull;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];

  v5 = HDSQLiteColumnAsInt64();
  IsNonNull = HDSQLiteColumnIsNonNull();
  v7 = HDSQLiteColumnAsInt64();
  if ((IsNonNull & (v7 < 2)) != 0)
    v8 = v7;
  else
    v8 = 2;
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___HDRepairECGSymptomsStatus_block_invoke_2;
  v13[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = v8;
  v13[5] = v5;
  v11 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v10, a3, v13, 0);

  return v11;
}

uint64_t ___HDRepairECGSymptomsStatus_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
