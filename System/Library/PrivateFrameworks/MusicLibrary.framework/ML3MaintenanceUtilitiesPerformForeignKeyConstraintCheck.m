@implementation ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck

uint64_t __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  os_log_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  _QWORD v26[4];
  id v27;
  os_log_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "executeUpdate:", CFSTR("PRAGMA foreign_keys = ON")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeQuery:", CFSTR("PRAGMA foreign_key_check"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke_35;
    v29[3] = &unk_1E5B639C0;
    v8 = v4;
    v30 = v8;
    v9 = v5;
    v31 = v9;
    objc_msgSend(v6, "enumerateRowsWithBlock:", v29);
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke_2;
    v26[3] = &unk_1E5B61978;
    v10 = v3;
    v27 = v10;
    v11 = (os_log_t)v8;
    v28 = v11;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v26);
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke_3;
    v22[3] = &unk_1E5B619A0;
    v25 = *(_BYTE *)(a1 + 40);
    v12 = v9;
    v23 = v12;
    v13 = v10;
    v24 = v13;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v22);
    if (-[NSObject count](v11, "count"))
    {
      v14 = (void *)MEMORY[0x1E0D4D030];
      v15 = *MEMORY[0x1E0D4CE40];
      v32 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("DatabaseIntegrity"), CFSTR("ForeignKeyIntegrityCheck"), 0, v16, 0);

    }
    v17 = objc_msgSend(v13, "executeUpdate:", CFSTR("PRAGMA foreign_keys = OFF"));
    if ((v17 & 1) == 0)
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "databasePath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v34 = v19;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Error disabling foreign_key constraint for library at path %{private}@", buf, 0xCu);

      }
    }

  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "databasePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v34 = v20;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Error enabling foreign_key constraint for library at path %{private}@", buf, 0xCu);

    }
    v17 = 0;
  }

  return v17;
}

void __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v9);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

void __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SELECT name FROM pragma_table_info(\"%@\") WHERE cid=%@"), v6, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "executeQuery:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForFirstRowAndColumn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

}

void __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  uint32_t v22;
  void *v23;
  NSObject *log;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v25 = a3;
  LODWORD(a3) = *(unsigned __int8 *)(a1 + 48);
  log = os_log_create("com.apple.amp.medialibrary", "Default");
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
  if ((_DWORD)a3)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v32 = objc_msgSend(v7, "count");
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_1AC149000, log, OS_LOG_TYPE_ERROR, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Removing %lu broken entries in %@", buf, 0x16u);

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    log = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(log);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@=%@"), v5, v25, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(a1 + 40);
          v26 = 0;
          v15 = objc_msgSend(v14, "executeUpdate:withParameters:error:", v13, MEMORY[0x1E0C9AA60], &v26);
          v16 = v26;
          v17 = os_log_create("com.apple.amp.medialibrary", "Default");
          v18 = v17;
          if (v15)
          {
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_15;
            *(_DWORD *)buf = 138412290;
            v32 = (uint64_t)v13;
            v19 = v18;
            v20 = OS_LOG_TYPE_DEFAULT;
            v21 = "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Successfully executed statement: %@";
            v22 = 12;
          }
          else
          {
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              goto LABEL_15;
            *(_DWORD *)buf = 138412802;
            v32 = v12;
            v33 = 2112;
            v34 = v5;
            v35 = 2112;
            v36 = v16;
            v19 = v18;
            v20 = OS_LOG_TYPE_ERROR;
            v21 = "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck Error deleteing %@ from %@. err=%@";
            v22 = 32;
          }
          _os_log_impl(&dword_1AC149000, v19, v20, v21, buf, v22);
LABEL_15:

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v9);
    }
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v32 = objc_msgSend(v23, "count");
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_1AC149000, log, OS_LOG_TYPE_ERROR, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Found %lu broken entries in %@. Skipping deletion.", buf, 0x16u);

  }
}

@end
