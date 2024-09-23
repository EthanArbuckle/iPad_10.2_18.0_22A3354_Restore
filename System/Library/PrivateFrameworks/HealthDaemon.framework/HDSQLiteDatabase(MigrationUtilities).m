@implementation HDSQLiteDatabase(MigrationUtilities)

- (uint64_t)deleteRowsFromDataEntitySubclassTable:()MigrationUtilities intermediateTables:error:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD aBlock[18];

  aBlock[16] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30 = a1;
  if (a1)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM metadata_values WHERE object_id IN (SELECT data_id FROM %@)"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, aBlock, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@)"), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, aBlock, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v16);

  }
  else
  {
    v9 = 0;
  }

  if (!v9)
    goto LABEL_18;
  v17 = v7;
  v18 = v17;
  if (!v30)
  {

    goto LABEL_18;
  }
  *(_QWORD *)&v35 = 0;
  *((_QWORD *)&v35 + 1) = &v35;
  v36 = 0x2020000000uLL;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__HDSQLiteDatabase_MigrationUtilities___correlationCountForDataEntitySubclassTable_count_error___block_invoke;
  aBlock[3] = &unk_1E6CE8540;
  aBlock[4] = &v35;
  v19 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM correlations WHERE correlation IN (SELECT data_id FROM %@) OR object IN (SELECT data_id FROM %@)"), v18, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v30, "executeSQL:error:bindingHandler:enumerationHandler:", v20, a5, 0, v19);
  if ((v21 & 1) != 0)
    v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 24);
  else
    v22 = 0;

  _Block_object_dispose(&v35, 8);
  if (!v21)
    goto LABEL_18;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("Unable to remove samples with associations."));
LABEL_18:
    v23 = 0;
    goto LABEL_19;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v9;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v32;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v25);
        if (!objc_msgSend(v30, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), a5, 0, 0))
        {
          v23 = 0;
          goto LABEL_30;
        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v26)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_30:

LABEL_19:
  return v23;
}

- (uint64_t)deleteDataEntitySubclassTable:()MigrationUtilities intermediateTables:error:
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = a3;
  if (objc_msgSend(a1, "deleteRowsFromDataEntitySubclassTable:intermediateTables:error:", v8, a4, a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v9, a5, 0, 0);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)deleteDataEntitySubclassTablesIfExist:()MigrationUtilities intermediateTables:error:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "dumpSchemaWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v12)
    {
      v13 = v12;
      v20 = v8;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_opt_class(), "databaseSchemas:containTable:", v10, v16) & 1) != 0)
          {
            if (!objc_msgSend(a1, "deleteDataEntitySubclassTable:intermediateTables:error:", v16, v9, a5))
            {
              v18 = 0;
              goto LABEL_16;
            }
          }
          else
          {
            _HKInitializeLogging();
            v17 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v16;
              _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "Skipping deletion from nonexistent table \"%@\", buf, 0xCu);
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v13);
      v18 = 1;
LABEL_16:
      v8 = v20;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)databaseSchemas:()MigrationUtilities containTable:
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v8 = CFSTR("main");
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  return v13;
}

@end
