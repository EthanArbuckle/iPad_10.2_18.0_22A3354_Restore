@implementation ML3ValidationBuildDatabaseTables

BOOL ___ML3ValidationBuildDatabaseTables_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  __int16 v18;
  uint8_t buf[2];
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;

  v2 = *(void **)(a1 + 32);
  +[ML3MusicLibrary allSchemaSQL](ML3MusicLibrary, "allSchemaSQL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _ML3ValidationExecuteSQLArray(v2, v3);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = 0;
      v15 = "Failed to build tables with schema.";
      v16 = (uint8_t *)&v23;
      goto LABEL_19;
    }
LABEL_20:

    v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    return v13 != 0;
  }
  v4 = *(id *)(a1 + 32);
  +[ML3MusicLibrary indexSchemaSQL](ML3MusicLibrary, "indexSchemaSQL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _ML3ValidationExecuteSQLArray(v4, v6);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = 0;
      v15 = "Failed to create indexes on database connection.";
      v16 = (uint8_t *)&v22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v8 = *(id *)(a1 + 32);
  +[ML3MusicLibrary allTriggersSQL](ML3MusicLibrary, "allTriggersSQL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _ML3ValidationExecuteSQLArray(v8, v9);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = 0;
      v15 = "Failed to create triggers on database connection.";
      v16 = (uint8_t *)&v21;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ML3ValidationRunInitialInsertStatements(*(void **)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v15 = "Failed to complete initial insertion statements.";
      v16 = (uint8_t *)&v20;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d;"), 2200070);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "executeUpdate:", v12);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Failed to set latest database version on connection.";
      v16 = buf;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeUpdate:", CFSTR("ANALYZE"));
  v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v15 = "Failed to prepare SQLite query optimizer.";
      v16 = (uint8_t *)&v18;
LABEL_19:
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  return v13 != 0;
}

@end
