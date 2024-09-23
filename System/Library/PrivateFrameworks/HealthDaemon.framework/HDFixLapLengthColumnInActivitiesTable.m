@implementation HDFixLapLengthColumnInActivitiesTable

uint64_t ___HDFixLapLengthColumnInActivitiesTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v5 = 1;
  MEMORY[0x1BCCAB18C](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v7)
    {

      v5 = 1;
    }
    else
    {
      v9 = HDSQLiteColumnAsInt64();
      v11 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = ___HDFixLapLengthColumnInActivitiesTable_block_invoke_2;
      v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v13[4] = v9;
      v5 = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v10, a3, v13, 0);
    }

  }
  return v5;
}

uint64_t ___HDFixLapLengthColumnInActivitiesTable_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
