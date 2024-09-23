@implementation HDFixInvalidContributorInDataProvenancesTable

uint64_t ___HDFixInvalidContributorInDataProvenancesTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C809B0];
  if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) & 0x8000000000000000) == 0)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM contributors WHERE uuid = %@('00000000-0000-0000-0000-000000000000')"), *MEMORY[0x1E0D297B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = ___HDFixInvalidContributorInDataProvenancesTable_block_invoke_2;
  v28[3] = &unk_1E6CE8540;
  v28[4] = *(_QWORD *)(a1 + 56);
  v9 = objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v7, a3, 0, v28);

  if (v9)
  {
LABEL_3:
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = -1;
    objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = &v24;
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = ___HDFixInvalidContributorInDataProvenancesTable_block_invoke_3;
    v23[3] = &unk_1E6CF2EE0;
    v23[4] = *(_QWORD *)(a1 + 56);
    v23[5] = a2;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = ___HDFixInvalidContributorInDataProvenancesTable_block_invoke_4;
    v22[3] = &unk_1E6CE8540;
    v11 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID from data_provenances WHERE sync_provenance = ? AND origin_product_type = ? AND origin_build = ? AND local_product_type = ? AND local_build = ? AND source_id = ? AND device_id = ? AND contributor_id = ? AND source_version = ? AND tz_name = ? AND origin_major_version = ? AND origin_minor_version = ? AND origin_patch_version = ?"), a3, v23, v22);

    if ((v11 & 1) == 0)
    {
      v19 = 0;
LABEL_13:
      _Block_object_dispose(&v24, 8);
      return v19;
    }
    v12 = HDSQLiteColumnWithNameAsInt64();
    if (v25[3] < 1)
    {
      v20 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE objects SET provenance = %lld WHERE provenance = %lld"), v25[3], v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "executeSQLStatements:error:", v15, a3);

      if ((v16 & 1) == 0)
      {
        v19 = 0;
        goto LABEL_12;
      }
      v17 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

    }
    v19 = 1;
LABEL_12:

    goto LABEL_13;
  }
  return 0;
}

uint64_t ___HDFixInvalidContributorInDataProvenancesTable_block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  return 0;
}

uint64_t ___HDFixInvalidContributorInDataProvenancesTable_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  sqlite3_int64 v9;
  sqlite3_int64 v10;
  void *v11;
  void *v12;
  sqlite3_int64 v13;
  sqlite3_int64 v14;
  sqlite3_int64 v15;

  v4 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 1, v4);
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  HDSQLiteColumnWithNameAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  HDSQLiteColumnWithNameAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  v9 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 6, v9);
  v10 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 7, v10);
  sqlite3_bind_int64(a2, 8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  HDSQLiteColumnWithNameAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  HDSQLiteColumnWithNameAsString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  v13 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 11, v13);
  v14 = HDSQLiteColumnWithNameAsInt64();
  sqlite3_bind_int64(a2, 12, v14);
  v15 = HDSQLiteColumnWithNameAsInt64();
  return sqlite3_bind_int64(a2, 13, v15);
}

uint64_t ___HDFixInvalidContributorInDataProvenancesTable_block_invoke_4(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  return 0;
}

@end
