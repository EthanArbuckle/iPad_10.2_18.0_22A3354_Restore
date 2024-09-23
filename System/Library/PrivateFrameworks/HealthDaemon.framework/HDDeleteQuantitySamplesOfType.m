@implementation HDDeleteQuantitySamplesOfType

uint64_t ___HDDeleteQuantitySamplesOfType_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t ___HDDeleteQuantitySamplesOfType_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, sqlite3_stmt *);
  void *v16;
  uint64_t v17;

  v6 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1BCCAB204](a2, 1) & 1) != 0)
    v7 = -1;
  else
    v7 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if ((v7 & 0x8000000000000000) == 0)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = ___HDExecuteSQLWithInt64_block_invoke;
    v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v17 = v7;
    if (!objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM quantity_series_data WHERE series_identifier = ?"), a3, &v13, 0))goto LABEL_13;
  }
  v13 = v10;
  v14 = 3221225472;
  v15 = ___HDExecuteSQLWithInt64_block_invoke;
  v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17 = v6;
  if (!objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM quantity_sample_series WHERE data_id = ?"), a3, &v13, 0))goto LABEL_13;
  v13 = v10;
  v14 = 3221225472;
  v15 = ___HDExecuteSQLWithInt64_block_invoke;
  v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17 = v6;
  if (!objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM quantity_sample_statistics WHERE owner_id = ?"), a3, &v13, 0))goto LABEL_13;
  v13 = v10;
  v14 = 3221225472;
  v15 = ___HDExecuteSQLWithInt64_block_invoke;
  v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17 = v6;
  if (!objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM quantity_samples WHERE data_id = ?"), a3, &v13, 0))goto LABEL_13;
  v13 = v10;
  v14 = 3221225472;
  v15 = ___HDExecuteSQLWithInt64_block_invoke;
  v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17 = v6;
  if (!objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM samples WHERE data_id = ?"), a3, &v13, 0))goto LABEL_13;
  v13 = v10;
  v14 = 3221225472;
  v15 = ___HDExecuteSQLWithInt64_block_invoke;
  v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17 = v6;
  if (!objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM metadata_values WHERE object_id = ?"), a3, &v13, 0))goto LABEL_13;
  v13 = v10;
  v14 = 3221225472;
  v15 = ___HDExecuteSQLWithInt64_block_invoke;
  v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17 = v6;
  if (objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM external_sync_ids WHERE object_id = ?"), a3, &v13, 0))
  {
    v13 = v10;
    v14 = 3221225472;
    v15 = ___HDExecuteSQLWithInt64_block_invoke;
    v16 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v17 = v6;
    v11 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM objects WHERE data_id = ?"), a3, &v13, 0);
  }
  else
  {
LABEL_13:
    v11 = 0;
  }

  return v11;
}

@end
