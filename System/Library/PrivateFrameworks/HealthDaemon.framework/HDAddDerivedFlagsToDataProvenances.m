@implementation HDAddDerivedFlagsToDataProvenances

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = HDSQLiteColumnAsInt64();
  v6 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___HDAddDerivedFlagsToDataProvenances_block_invoke_2;
  v15[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___HDAddDerivedFlagsToDataProvenances_block_invoke_3;
  v11[3] = &unk_1E6CF04C0;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  v14 = v5;
  v9 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", v8, a3, v15, v11);

  return v9;
}

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  v5 = MEMORY[0x1BCCAB174](a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___HDAddDerivedFlagsToDataProvenances_block_invoke_4;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11[4] = v5;
  v11[5] = v8;
  v9 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, v11, 0);

  return v9;
}

uint64_t ___HDAddDerivedFlagsToDataProvenances_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
