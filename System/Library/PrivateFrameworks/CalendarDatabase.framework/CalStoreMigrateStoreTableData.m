@implementation CalStoreMigrateStoreTableData

uint64_t ___CalStoreMigrateStoreTableData_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_value *v4;
  sqlite3_value *v5;
  sqlite3_value *v6;
  sqlite3_value *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = sqlite3_column_value(*(sqlite3_stmt **)(a2 + 8), 0);
  v5 = sqlite3_column_value(*(sqlite3_stmt **)(a2 + 8), 1);
  v6 = sqlite3_value_dup(v4);
  v7 = sqlite3_value_dup(v5);
  if (sqlite3_value_type(v6) != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_value_int64(v6));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  if (sqlite3_value_type(v7) != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_value_int64(v7));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  sqlite3_value_free(v6);
  sqlite3_value_free(v7);
  return 0;
}

@end
