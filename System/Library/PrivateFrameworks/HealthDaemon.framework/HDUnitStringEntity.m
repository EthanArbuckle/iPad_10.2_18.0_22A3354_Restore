@implementation HDUnitStringEntity

+ (id)storeUnitString:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__118;
  v25 = __Block_byref_object_dispose__118;
  v26 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke;
  v19[3] = &unk_1E6CE9508;
  v10 = v7;
  v20 = v10;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_2;
  v18[3] = &unk_1E6CE8540;
  v18[4] = &v21;
  objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM unit_strings WHERE unit_string=?"), a5, v19, v18);
  v11 = (void *)v22[5];
  if (!v11)
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_3;
    v16[3] = &unk_1E6CE9508;
    v17 = v10;
    if (objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO unit_strings (unit_string) VALUES (?)"), a5, v16, 0))
    {
      objc_msgSend(v8, "lastInsertRowID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v22[5];
      v22[5] = v12;

    }
    v11 = (void *)v22[5];
  }
  v14 = v11;

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("unit_strings");
}

uint64_t __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __53__HDUnitStringEntity_storeUnitString_database_error___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_59;
}

@end
