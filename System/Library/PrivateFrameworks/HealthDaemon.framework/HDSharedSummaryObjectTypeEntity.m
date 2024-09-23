@implementation HDSharedSummaryObjectTypeEntity

+ (id)databaseTable
{
  return CFSTR("shared_summary_object_types");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryObjectTypeEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("summary_id");
  +[HDHealthEntity defaultForeignKey](HDSharedSummaryEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("summary_id");
  v3[1] = CFSTR("object_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertWithSummaryID:(int64_t)a3 objectTypes:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v24;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = v10;
  objc_msgSend(v10, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("summary_id");
  v32[1] = CFSTR("object_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __93__HDSharedSummaryObjectTypeEntity_insertWithSummaryID_objectTypes_databaseTransaction_error___block_invoke;
        v26[3] = &unk_1E6CECA50;
        v26[4] = v19;
        v26[5] = a3;
        objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v12, v13, a6, v26);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {

          v22 = 0;
          goto LABEL_11;
        }
        v21 = (void *)v20;
        objc_msgSend(v11, "addObject:", v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
        continue;
      break;
    }
  }

  v22 = v11;
LABEL_11:

  return v22;
}

void __93__HDSharedSummaryObjectTypeEntity_insertWithSummaryID_objectTypes_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("summary_id"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "code");
  JUMPOUT(0x1BCCAB114);
}

+ (id)objectTypesForSummaryID:(int64_t)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v8 = (objc_class *)MEMORY[0x1E0C99E20];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[4] = a3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__HDSharedSummaryObjectTypeEntity_objectTypesForSummaryID_databaseTransaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17 = v10;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__HDSharedSummaryObjectTypeEntity_objectTypesForSummaryID_databaseTransaction_error___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__HDSharedSummaryObjectTypeEntity_objectTypesForSummaryID_databaseTransaction_error___block_invoke_3;
  v16[3] = &unk_1E6CE8CF8;
  v12 = v10;
  LODWORD(a5) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &objectTypesForSummaryID_databaseTransaction_error__key, a5, v19, v18, v16);

  if ((_DWORD)a5)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

id __85__HDSharedSummaryObjectTypeEntity_objectTypesForSummaryID_databaseTransaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("object_type"), v2, CFSTR("summary_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __85__HDSharedSummaryObjectTypeEntity_objectTypesForSummaryID_databaseTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __85__HDSharedSummaryObjectTypeEntity_objectTypesForSummaryID_databaseTransaction_error___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", HDSQLiteColumnWithNameAsInt64());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

@end
