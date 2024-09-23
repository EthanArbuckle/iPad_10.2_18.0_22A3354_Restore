@implementation HDQuantitySeriesDataEntity

+ (id)databaseTable
{
  return CFSTR("quantity_series_data");
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_84;
}

+ (BOOL)hasROWID
{
  return 0;
}

+ (id)primaryKeyColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("series_identifier");
  v3[1] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:isDeferred:", objc_opt_class(), CFSTR("hfd_key"), 0, 1);
  v5 = CFSTR("series_identifier");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 value:(double)a5 duration:(double)a6 timestamp:(double)a7 identifier:(int64_t)a8 error:(id *)a9
{
  _BOOL4 v14;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  char v24;
  _QWORD v26[8];
  _QWORD v27[5];
  _QWORD aBlock[5];

  v14 = a3;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v17 = a4;
  v18 = _Block_copy(aBlock);
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_2;
  v27[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v27[4] = a1;
  v19 = _Block_copy(v27);
  v20 = v19;
  v21 = !v14;
  if (v14)
    v22 = &insertOrReplaceEntity_database_value_duration_timestamp_identifier_error__replaceSQLKey;
  else
    v22 = &insertOrReplaceEntity_database_value_duration_timestamp_identifier_error__insertSQLKey;
  if (v21)
    v19 = v18;
  v23 = _Block_copy(v19);
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_3;
  v26[3] = &__block_descriptor_64_e23_v16__0__sqlite3_stmt__8l;
  v26[4] = a8;
  *(double *)&v26[5] = a7;
  *(double *)&v26[6] = a5;
  *(double *)&v26[7] = a6;
  v24 = objc_msgSend(v17, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", v22, a9, v23, v26, 0);

  return v24;
}

id __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  HDQuantitySeriesDataEntityAllProperties();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  HDQuantitySeriesDataEntityAllProperties();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __103__HDQuantitySeriesDataEntity_insertOrReplaceEntity_database_value_duration_timestamp_identifier_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 40));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  return sqlite3_bind_double(a2, 4, *(double *)(a1 + 56));
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  _QWORD aBlock[5];

  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v8 = a4;
  v9 = _Block_copy(aBlock);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2;
  v11[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a3;
  LOBYTE(a5) = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteSeriesDataWithIdentifier_database_error__deleteSQLKey, a5, v9, v11, 0);

  return (char)a5;
}

id __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?"), v2, CFSTR("series_identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __76__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 timestamps:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  BOOL v18;
  id obj;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD aBlock[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v12 = _Block_copy(aBlock);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2;
        v21[3] = &unk_1E6CE82D8;
        v21[4] = v17;
        v21[5] = a3;
        if (!objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteSeriesDataWithIdentifier_timestamps_database_error__deleteSeriesSQLKey, a6, v12, v21, 0))
        {
          v18 = 0;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_11:

  return v18;
}

id __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ? AND %@ = ?"), v2, CFSTR("series_identifier"), CFSTR("timestamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__HDQuantitySeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 2, v4);
}

+ (BOOL)deleteAllSeriesWithDatabase:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v7, "executeUncachedSQL:error:", v9, a4);
  return (char)a4;
}

+ (BOOL)enumerateWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "enumerateWithDatabase:predicate:error:handler:", v12, v11, a5, v10);

  return (char)a5;
}

+ (BOOL)enumerateWithDatabase:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0D298A0];
  v13 = a3;
  v14 = objc_alloc_init(v12);
  objc_msgSend(v14, "setEntityClass:", a1);
  objc_msgSend(v14, "setLimitCount:", 0);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("series_identifier"), a1, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("timestamp"), a1, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOrderingTerms:", v17);

  objc_msgSend(v14, "setPredicate:", v10);
  HDQuantitySeriesDataEntityAllProperties();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectSQLForProperties:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v11;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke;
  v25[3] = &unk_1E6CE9508;
  v26 = v10;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke_2;
  v23[3] = &unk_1E6CE82B0;
  v20 = v11;
  v21 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", v19, a5, v25, v23);

  return (char)a5;
}

void *__76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *result;
  int v3;

  result = *(void **)(a1 + 32);
  if (result)
  {
    v3 = 1;
    return (void *)objc_msgSend(result, "bindToStatement:bindingIndex:", a2, &v3);
  }
  return result;
}

uint64_t __76__HDQuantitySeriesDataEntity_enumerateWithDatabase_predicate_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = HDSQLiteColumnAsInt64();
  v5 = MEMORY[0x1BCCAB1A4](a2, 1);
  v6 = MEMORY[0x1BCCAB1A4](a2, 2);
  v7 = MEMORY[0x1BCCAB1A4](a2, 3);
  return (*(uint64_t (**)(uint64_t, uint64_t, double, double, double))(v3 + 16))(v3, v4, v5, v6, v7);
}

+ (BOOL)enumerateSeries:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  objc_msgSend(a1, "predicateForSeriesIdentifier:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "enumerateWithDatabase:predicate:error:handler:", v13, v12, a5, v10);
  return (char)a5;
}

+ (BOOL)enumerateSeries:(int64_t)a3 after:(double)a4 inclusive:(BOOL)a5 transaction:(id)a6 error:(id *)a7 handler:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  _QWORD v27[3];

  v10 = a5;
  v27[2] = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a6;
  objc_msgSend(a1, "predicateForSeriesIdentifier:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v19 = 6;
  else
    v19 = 5;
  objc_msgSend(v17, "predicateWithProperty:value:comparisonType:", CFSTR("timestamp"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D29840];
  v27[0] = v16;
  v27[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateMatchingAllPredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "protectedDatabase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(a1, "enumerateWithDatabase:predicate:error:handler:", v24, v23, a7, v14);
  return v25;
}

+ (BOOL)getRangeAndCountForSeriesIdentifier:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  int64_t v19;
  _QWORD v20[5];
  _QWORD aBlock[5];

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  objc_msgSend(v12, "protectedDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = a3;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_2;
  v20[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a3;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_3;
  v17[3] = &unk_1E6CEEDA0;
  v18 = v10;
  v15 = v10;
  LOBYTE(a5) = objc_msgSend(v14, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &getRangeAndCountForSeriesIdentifier_transaction_error_handler__getSeriesRangeSQLKey, a5, v13, v20, v17);

  return (char)a5;
}

id __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("timestamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("duration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("series_identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SELECT MIN(%@), MAX(%@ + MAX(%@, 0.0)), COUNT(*) FROM %@ WHERE %@=?"), v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

BOOL __92__HDQuantitySeriesDataEntity_getRangeAndCountForSeriesIdentifier_transaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;

  v6 = HDSQLiteColumnAsInt64();
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = MEMORY[0x1BCCAB1A4](a2, 0);
    v9 = MEMORY[0x1BCCAB1A4](a2, 1);
    v10 = HDSQLiteColumnAsInt64();
    (*(void (**)(uint64_t, uint64_t, double, double))(v7 + 16))(v7, v10, v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1100, CFSTR("Unrecognized quantity series identifier %lld"), *(_QWORD *)(a1 + 40));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  return v6 != 0;
}

+ (id)predicateForSeriesIdentifier:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("series_identifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
