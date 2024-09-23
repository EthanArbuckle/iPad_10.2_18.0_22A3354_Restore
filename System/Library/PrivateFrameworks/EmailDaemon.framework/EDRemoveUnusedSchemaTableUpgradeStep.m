@implementation EDRemoveUnusedSchemaTableUpgradeStep

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EDRemoveUnusedSchemaTableUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_73 != -1)
    dispatch_once(&log_onceToken_73, block);
  return (OS_os_log *)(id)log_log_73;
}

void __43__EDRemoveUnusedSchemaTableUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_73;
  log_log_73 = (uint64_t)v1;

}

+ (int)_createTempMessagesTable:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15[5];

  v15[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sqlConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v5 = objc_msgSend(v4, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS messages_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,message_id INTEGER NOT NULL DEFAULT 0,remote_id INTEGER,document_id TEXT COLLATE BINARY,sender INTEGER,subject_prefix TEXT COLLATE BINARY,subject INTEGER NOT NULL,summary INTEGER,date_sent INTEGER,date_received INTEGER,mailbox INTEGER NOT NULL,remote_mailbox INTEGER,flags INTEGER NOT NULL DEFAULT 0,read INTEGER NOT NULL DEFAULT 0,flagged INTEGER NOT NULL DEFAULT 0,deleted INTEGER NOT NULL DEFAULT 0,size INTEGER NOT NULL DEFAULT 0,conversation_id INTEGER NOT NULL DEFAULT 0,date_last_viewed INTEGER,original_mailbox INTEGER,visible INTEGER,sender_vip INTEGER,encoding INTEGER,content_type INTEGER,sequence_identifier INTEGER DEFAULT 0,external_id TEXT COLLATE BINARY,unique_id INTEGER,content_index_transaction_id INTEGER,list_id_hash INTEGER,journaled INTEGER,flag_color INTEGER);"),
         v15);
  v6 = v15[0];

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "sqlConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v8 = objc_msgSend(v7, "executeStatementString:error:", CFSTR("ALTER TABLE messages RENAME TO messages_old"), &v14);
    v9 = v14;

    if ((v8 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EDRemoveUnusedSchemaTableUpgradeStep _createTempMessagesTable:].cold.1();
      }

      v10 = objc_msgSend(v9, "code");
    }
    v6 = v9;
  }
  else
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _createTempMessagesTable:].cold.2();
    }

    v10 = objc_msgSend(v6, "code");
  }

  return v10;
}

+ (int)_recreateMessagesIndices:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  id obj;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE buf[24];
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(&unk_1E94E5740, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      v8 = v4;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS %@;"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sqlConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v8;
        v12 = objc_msgSend(v11, "executeStatementString:error:", v10, &v25);
        v4 = v25;

        if ((v12 & 1) == 0)
        {
          +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "ef_publicDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v14;
            _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "Failed to drop index: %{public}@ %{public}@", buf, 0x16u);

          }
        }

        ++v7;
        v8 = v4;
      }
      while (v5 != v7);
      v3 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v31 = 1;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke;
  v21[3] = &unk_1E94A0648;
  v24 = buf;
  v15 = v20;
  v22 = v15;
  v16 = v4;
  v23 = v16;
  objc_msgSend(&unk_1E94E5740, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v17 = 0;
  else
    v17 = objc_msgSend(v16, "code");

  _Block_object_dispose(buf, 8);
  return v17;
}

void __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sqlConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v11 = objc_msgSend(v10, "executeStatementString:error:", v9, v14);
  v12 = v14[0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke_cold_1();
    }

    *a4 = 1;
  }

}

+ (int)_copyMessagesData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  int v9;
  NSObject *v10;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(&unk_1E94E5590, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO messages_new (%@) SELECT %@ FROM messages_old"), v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sqlConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v7 = objc_msgSend(v6, "executeStatementString:error:", v5, v12);
  v8 = v12[0];

  if ((v7 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _copyMessagesData:].cold.1();
    }

    v9 = objc_msgSend(v8, "code");
  }

  return v9;
}

+ (int)_swapMessagesTables:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("messages_old"), v4);
  if (!v5)
  {
    objc_msgSend(v4, "sqlConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 0;
    v7 = objc_msgSend(v6, "executeStatementString:error:", CFSTR("ALTER TABLE messages_new RENAME TO messages"), v11);
    v8 = v11[0];

    if ((v7 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EDRemoveUnusedSchemaTableUpgradeStep _swapMessagesTables:].cold.1();
      }

      v5 = objc_msgSend(v8, "code");
    }

  }
  return v5;
}

+ (int)_recreateThreadsTable:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  int v7;
  NSObject *v8;
  id v10[5];

  v10[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sqlConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v5 = objc_msgSend(v4, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS threads (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,scope INTEGER NOT NULL REFERENCES thread_scopes(ROWID) ON DELETE CASCADE,conversation INTEGER NOT NULL REFERENCES conversations(conversation_id) ON DELETE CASCADE,newest_read_message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL,display_message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL,date INTEGER NOT NULL,read INTEGER NOT NULL DEFAULT 0,deleted INTEGER NOT NULL DEFAULT 0,flagged INTEGER NOT NULL DEFAULT 0,has_red_flag INTEGER NOT NULL DEFAULT 0,has_orange_flag INTEGER NOT NULL DEFAULT 0,has_yellow_flag INTEGER NOT NULL DEFAULT 0,has_green_flag INTEGER NOT NULL DEFAULT 0,has_blue_flag INTEGER NOT NULL DEFAULT 0,has_purple_flag INTEGER NOT NULL DEFAULT 0,has_gray_flag INTEGER NOT NULL DEFAULT 0,draft INTEGER NOT NULL DEFAULT 0,replied INTEGER NOT NULL DEFAULT 0,forwarded INTEGER NOT NULL DEFAULT 0,redirected INTEGER NOT NULL DEFAULT 0,junk_level_set_by_user INTEGER NOT NULL DEFAULT 0,junk_level INTEGER NOT NULL DEFAULT 0,has_unflagged INTEGER NOT NULL DEFAULT 0,has_attachments INTEGER NOT NULL DEFAULT 0,count INTEGER NOT NULL,journaled INTEGER NOT NULL DEFAULT 0,UNIQUE(scope, conversation) ON CONFLICT ABORT);"),
         v10);
  v6 = v10[0];

  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _recreateThreadsTable:].cold.1();
    }

    v7 = objc_msgSend(v6, "code");
  }

  return v7;
}

+ (int)_recreateThreadsIndices:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  id obj;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE buf[24];
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(&unk_1E94E5768, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      v8 = v4;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS %@;"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sqlConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v8;
        v12 = objc_msgSend(v11, "executeStatementString:error:", v10, &v25);
        v4 = v25;

        if ((v12 & 1) == 0)
        {
          +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "ef_publicDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v14;
            _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "Failed to drop index: %{public}@ %{public}@", buf, 0x16u);

          }
        }

        ++v7;
        v8 = v4;
      }
      while (v5 != v7);
      v3 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v31 = 1;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__EDRemoveUnusedSchemaTableUpgradeStep__recreateThreadsIndices___block_invoke;
  v21[3] = &unk_1E94A0648;
  v24 = buf;
  v15 = v20;
  v22 = v15;
  v16 = v4;
  v23 = v16;
  objc_msgSend(&unk_1E94E5768, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v17 = 0;
  else
    v17 = objc_msgSend(v16, "code");

  _Block_object_dispose(buf, 8);
  return v17;
}

void __64__EDRemoveUnusedSchemaTableUpgradeStep__recreateThreadsIndices___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sqlConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v11 = objc_msgSend(v10, "executeStatementString:error:", v9, v14);
  v12 = v14[0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke_cold_1();
    }

    *a4 = 1;
  }

}

+ (int)_dropTable:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  NSObject *v12;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqlConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v9 = objc_msgSend(v8, "executeStatementString:error:", v7, v14);
  v10 = v14[0];

  if ((v9 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _dropTable:connection:].cold.1();
    }

    v11 = objc_msgSend(v10, "code");
  }

  return v11;
}

+ (int)_truncateTable:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  NSObject *v12;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqlConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v9 = objc_msgSend(v8, "executeStatementString:error:", v7, v14);
  v10 = v14[0];

  if ((v9 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _truncateTable:connection:].cold.1();
    }

    v11 = objc_msgSend(v10, "code");
  }

  return v11;
}

+ (int)_dropThreadCategoriesIndex:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  int v7;
  NSObject *v8;
  id v10[5];

  v10[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sqlConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v5 = objc_msgSend(v4, "executeStatementString:error:", CFSTR("DROP INDEX IF EXISTS thread_categories_type_active_user_override_thread_index;"),
         v10);
  v6 = v10[0];

  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    +[EDRemoveUnusedSchemaTableUpgradeStep log](EDRemoveUnusedSchemaTableUpgradeStep, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _dropThreadCategoriesIndex:].cold.1();
    }

    v7 = objc_msgSend(v6, "code");
  }

  return v7;
}

+ (int)runWithConnection:(id)a3
{
  id v4;
  int v5;
  int v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("interaction_log"), v4);
  if (!v5)
  {
    v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("thread_categories"), v4);
    if (!v5)
    {
      v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("read_later"), v4);
      if (!v5)
      {
        v5 = objc_msgSend(a1, "_dropThreadCategoriesIndex:", v4);
        if (!v5)
        {
          v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("categorization_sender_rules"), v4);
          if (!v5)
          {
            v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("categorization_conversation_rules"), v4);
            if (!v5)
            {
              v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("categorization_group_rules"), v4);
              if (!v5)
              {
                v7 = objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("category_active_types"), CFSTR("messages"), 0);
                if (((v7 | objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("times_viewed"), CFSTR("messages"), 0)) != 1|| (v5 = objc_msgSend(a1, "_createTempMessagesTable:", v4)) == 0&& (v5 = objc_msgSend(a1, "_recreateMessagesIndices:", v4)) == 0&& (v5 = objc_msgSend(a1, "_copyMessagesData:", v4)) == 0&& (v5 = objc_msgSend(a1, "_swapMessagesTables:", v4)) == 0)&& (!objc_msgSend(v4, "columnExists:inTable:type:", CFSTR("read_later_date"), CFSTR("threads"), 0)|| (v5 = objc_msgSend(a1, "_dropTable:connection:", CFSTR("threads"), v4)) == 0&& (v5 = objc_msgSend(a1, "_truncateTable:connection:", CFSTR("thread_senders"), v4)) == 0&& (v5 = objc_msgSend(a1, "_truncateTable:connection:", CFSTR("thread_mailboxes"), v4)) == 0&& (v5 = objc_msgSend(a1, "_truncateTable:connection:", CFSTR("thread_scopes"), v4)) == 0
                   && (v5 = objc_msgSend(a1, "_truncateTable:connection:", CFSTR("thread_recipients"), v4)) == 0
                   && (v5 = objc_msgSend(a1, "_recreateThreadsTable:", v4)) == 0
                   && (v5 = objc_msgSend(a1, "_recreateThreadsIndices:", v4)) == 0))
                {
                  v5 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v5;
}

+ (void)_createTempMessagesTable:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to rename messages_old: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_createTempMessagesTable:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to create new messages table: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to create index: %{public}@ %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_copyMessagesData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to drop copy messages data: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_swapMessagesTables:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to rename new messages: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_recreateThreadsTable:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to create new threads table: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_dropTable:connection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to drop table %{public}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_truncateTable:connection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to truncate table %{public}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_dropThreadCategoriesIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to drop thread_categories_type_active_user_override_thread_index: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
