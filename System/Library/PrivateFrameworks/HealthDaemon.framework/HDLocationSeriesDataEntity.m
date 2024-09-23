@implementation HDLocationSeriesDataEntity

+ (id)databaseName
{
  return 0;
}

+ (id)databaseTable
{
  return CFSTR("location_series_data");
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  unsigned __int8 v3;
  int v5;
  unint64_t *v6;

  if ((v3 & 1) == 0)
  {
    v6 = a3;
    a3 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_3, 0, &dword_1B7802000);
      a3 = v6;
    }
  }
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDLocationSeriesDataEntity columnDefinitionsWithCount:]::columnDefinitions;
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

+ (id)createTableSQLWithBehavior:(id)a3
{
  objc_msgSend(a1, "createTableSQL", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)indicesWithBehavior:(id)a3
{
  objc_msgSend(a1, "indices", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)triggersWithBehavior:(id)a3
{
  objc_msgSend(a1, "triggers", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 identifier:(int64_t)a5 timestamp:(double)a6 location:(id)a7 error:(id *)a8
{
  _BOOL4 v12;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  _QWORD v25[4];
  id v26;
  int64_t v27;
  double v28;
  _QWORD v29[5];
  _QWORD aBlock[5];

  v12 = a3;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v16 = a4;
  v17 = _Block_copy(aBlock);
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_2;
  v29[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v29[4] = a1;
  v18 = _Block_copy(v29);
  v19 = v18;
  if (v12)
    v20 = &+[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:]::HDLocationSeriesDataEntityCacheKeyReplace;
  else
    v20 = &+[HDLocationSeriesDataEntity insertOrReplaceEntity:database:identifier:timestamp:location:error:]::HDLocationSeriesDataEntityCacheKeyInsert;
  if (!v12)
    v18 = v17;
  v21 = _Block_copy(v18);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_3;
  v25[3] = &unk_1E6D0B478;
  v28 = a6;
  v26 = v14;
  v27 = a5;
  v22 = v14;
  v23 = objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", v20, a8, v21, v25, 0);

  return v23;
}

id __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  HDLocationSeriesDataEntityAllProperties();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  HDLocationSeriesDataEntityAllProperties();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __97__HDLocationSeriesDataEntity_insertOrReplaceEntity_database_identifier_timestamp_location_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  sqlite3_bind_double(a2, 3, v4);
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  sqlite3_bind_double(a2, 4, v5);
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  sqlite3_bind_double(a2, 5, v6);
  objc_msgSend(*(id *)(a1 + 32), "speed");
  sqlite3_bind_double(a2, 6, v7);
  objc_msgSend(*(id *)(a1 + 32), "course");
  sqlite3_bind_double(a2, 7, v8);
  objc_msgSend(*(id *)(a1 + 32), "horizontalAccuracy");
  sqlite3_bind_double(a2, 8, v9);
  objc_msgSend(*(id *)(a1 + 32), "verticalAccuracy");
  sqlite3_bind_double(a2, 9, v10);
  objc_msgSend(*(id *)(a1 + 32), "speedAccuracy");
  sqlite3_bind_double(a2, 10, v11);
  objc_msgSend(*(id *)(a1 + 32), "courseAccuracy");
  sqlite3_bind_double(a2, 11, v12);
  return sqlite3_bind_int(a2, 12, objc_msgSend(*(id *)(a1 + 32), "signalEnvironmentType"));
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
  aBlock[2] = __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v8 = a4;
  v9 = _Block_copy(aBlock);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2;
  v11[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a3;
  LOBYTE(a5) = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &+[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:database:error:]::deleteSQLKey, a5, v9, v11, 0);

  return (char)a5;
}

id __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke(uint64_t a1)
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

uint64_t __76__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
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
  uint64_t i;
  uint64_t v16;
  BOOL v17;
  id obj;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD aBlock[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v12 = _Block_copy(aBlock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2;
        v20[3] = &unk_1E6CEB038;
        v20[4] = v16;
        v20[5] = a3;
        if (!objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &+[HDLocationSeriesDataEntity deleteSeriesDataWithIdentifier:timestamps:database:error:]::deleteSQLDatumKey, a6, v12, v20, 0))
        {
          v17 = 0;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_11:

  return v17;
}

id __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke(uint64_t a1)
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

uint64_t __87__HDLocationSeriesDataEntity_deleteSeriesDataWithIdentifier_timestamps_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 2, v4);
}

+ (BOOL)deleteAllSeriesWithDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("DELETE FROM %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v6, "executeUncachedSQL:error:", v9, a4);
  return (char)a4;
}

+ (BOOL)enumerateWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a6;
  objc_msgSend(a3, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDLocationSeriesDataEntity _enumerateWithDatabase:predicate:forValidation:error:handler:]((uint64_t)a1, v12, v10, 0, (uint64_t)a5, v11);

  return (char)a5;
}

+ (uint64_t)_enumerateWithDatabase:(void *)a3 predicate:(char)a4 forValidation:(uint64_t)a5 error:(void *)a6 handler:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a6;
  v13 = objc_opt_self();
  v14 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v14, "setEntityClass:", v13);
  objc_msgSend(v14, "setLimitCount:", 0);
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("series_identifier"), v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("timestamp"), v13, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOrderingTerms:", v17);

  objc_msgSend(v14, "setPredicate:", v11);
  HDLocationSeriesDataEntityAllProperties();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectSQLForProperties:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke;
  v28[3] = &unk_1E6CEA6E8;
  v21 = v11;
  v29 = v21;
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke_2;
  v25[3] = &unk_1E6D0B4A0;
  v27 = a4;
  v22 = v12;
  v26 = v22;
  v23 = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v19, a5, v28, v25);

  return v23;
}

void *__91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t __91__HDLocationSeriesDataEntity__enumerateWithDatabase_predicate_forValidation_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v26;
  double v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;

  v4 = MEMORY[0x1BCCAB1A4](a2, 1);
  v27 = MEMORY[0x1BCCAB1A4](a2, 2);
  v26 = MEMORY[0x1BCCAB1A4](a2, 3);
  v5 = MEMORY[0x1BCCAB1A4](a2, 7);
  v6 = MEMORY[0x1BCCAB1A4](a2, 4);
  v7 = MEMORY[0x1BCCAB1A4](a2, 8);
  v8 = MEMORY[0x1BCCAB1A4](a2, 5);
  v9 = MEMORY[0x1BCCAB1A4](a2, 9);
  v10 = MEMORY[0x1BCCAB1A4](a2, 6);
  v11 = MEMORY[0x1BCCAB1A4](a2, 10);
  v12 = HDSQLiteColumnAsInt64();
  v13 = *MEMORY[0x1E0C9E518];
  if (*(_BYTE *)(a1 + 40))
  {
    v14 = v6;
    v6 = v14;
    v15 = v8;
    v8 = v15;
    v16 = v10;
    v10 = v16;
    v17 = v5;
    v5 = v17;
    v18 = v7;
    v7 = v18;
    v19 = v9;
    v9 = v19;
    v20 = v11;
    v11 = v20;
  }
  v28 = 0;
  v29 = v27;
  v30 = v26;
  v31 = v5;
  v32 = v6;
  v33 = v7;
  v34 = v8;
  v35 = v9;
  v36 = v10;
  v37 = v11;
  v38 = v4;
  v39 = 0;
  v40 = 0xBFF0000000000000;
  v41 = 0;
  v43 = 0;
  v42 = 0;
  v44 = 0x7FFFFFFF00000000;
  v45 = v13;
  v46 = 0;
  v47 = v12;
  v49 = 0;
  v48 = 0;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithClientLocation:", &v28);
  v22 = *(_QWORD *)(a1 + 32);
  v23 = HDSQLiteColumnAsInt64();
  v24 = (*(uint64_t (**)(uint64_t, uint64_t, void *, double))(v22 + 16))(v22, v23, v21, v4);

  return v24;
}

+ (BOOL)_enumerateSeriesForValidation:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("series_identifier"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = +[HDLocationSeriesDataEntity _enumerateWithDatabase:predicate:forValidation:error:handler:]((uint64_t)a1, v10, v14, 1, (uint64_t)a5, v11);
  return (char)a5;
}

+ (BOOL)enumerateSeries:(int64_t)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("series_identifier"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "enumerateWithTransaction:predicate:error:handler:", v10, v14, a5, v11);
  return (char)a5;
}

+ (BOOL)enumerateSeries:(int64_t)a3 database:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v33;
  id v34;

  v34 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0D29838];
  v33 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithProperty:equalToValue:", CFSTR("series_identifier"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a1;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v19, 0);
  if (v14)
  {
    v22 = (void *)MEMORY[0x1E0D29838];
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("timestamp"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v25);
  }
  if (v15)
  {
    v26 = (void *)MEMORY[0x1E0D29838];
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    objc_msgSend(v27, "numberWithDouble:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("timestamp"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v29);
  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[HDLocationSeriesDataEntity _enumerateWithDatabase:predicate:forValidation:error:handler:]((uint64_t)v20, v34, v30, 0, (uint64_t)a7, v33);

  return v31;
}

+ (BOOL)getRangeAndCountForSeriesIdentifier:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  _QWORD v19[5];
  _QWORD aBlock[5];

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  v18 = a3;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_2;
  v19[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a3;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_3;
  v16[3] = &unk_1E6D0B4C8;
  v17 = v10;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &+[HDLocationSeriesDataEntity getRangeAndCountForSeriesIdentifier:database:error:handler:]::getSeriesRangeSQLKey, a5, v13, v19, v16);

  return (char)a5;
}

id __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("timestamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("series_identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SELECT MIN(%@), MAX(%@), COUNT(*) FROM %@ WHERE %@=?"), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

BOOL __89__HDLocationSeriesDataEntity_getRangeAndCountForSeriesIdentifier_database_error_handler___block_invoke_3(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  void *v11;

  v6 = HDSQLiteColumnAsInt64();
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = MEMORY[0x1BCCAB1A4](a2, 0);
    v9 = MEMORY[0x1BCCAB1A4](a2, 1);
    (*(void (**)(uint64_t, uint64_t, double, double))(v7 + 16))(v7, v6, v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1100, CFSTR("Unrecognized location series identifier %lld"), *(_QWORD *)(a1 + 40));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  return v6 != 0;
}

+ (BOOL)copySeriesDataWithIdentifier:(int64_t)a3 toSeriesIdentifier:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__HDLocationSeriesDataEntity_copySeriesDataWithIdentifier_toSeriesIdentifier_database_error___block_invoke;
  v13[3] = &unk_1E6D0B4F0;
  v14 = v10;
  v15 = a1;
  v16 = a4;
  v11 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "enumerateSeries:database:startDate:endDate:error:handler:", a3, v11, 0, 0, a6, v13);

  return (char)a6;
}

uint64_t __93__HDLocationSeriesDataEntity_copySeriesDataWithIdentifier_toSeriesIdentifier_database_error___block_invoke(_QWORD *a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v8 = a1[4];
  v7 = (void *)a1[5];
  v9 = a1[6];
  v14 = 0;
  v10 = objc_msgSend(v7, "insertOrReplaceEntity:database:identifier:timestamp:location:error:", 1, v8, v9, v6, &v14, a2);
  v11 = v14;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to insert location data with error: %{public}@", buf, 0xCu);
    }
  }

  return v10;
}

+ (BOOL)unitTesting_deleteSeriesDataWithIdentifier:(int64_t)a3 timestamp:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(a1, "deleteSeriesDataWithIdentifier:timestamps:database:error:", a3, v12, v11, a6);

  return (char)a6;
}

@end
