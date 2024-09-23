@implementation HDRepairECGSymptomsStatusForNilSymptomsMetadata

uint64_t ___HDRepairECGSymptomsStatusForNilSymptomsMetadata_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];

  v5 = HDSQLiteColumnAsInt64();
  v6 = 1;
  if ((HDSQLiteColumnIsNonNull() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = ___HDRepairECGSymptomsStatusForNilSymptomsMetadata_block_invoke_2;
    v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v10[4] = v5;
    v6 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", v8, a3, v10, 0);

  }
  return v6;
}

uint64_t ___HDRepairECGSymptomsStatusForNilSymptomsMetadata_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 32));
}

@end
