@implementation BRCSafeDBHolder

+ (id)newSafeDBHolder:(id)a3 withDatabaseURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BRCSafeDBHolder *v9;
  void *v10;
  NSObject *v11;
  int v13;
  BRCSafeDBHolder *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v9 = objc_alloc_init(BRCSafeDBHolder);
    objc_storeStrong((id *)&v9->_db, a3);
    objc_storeStrong((id *)&v9->_databaseURL, a4);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134218498;
      v14 = v9;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] <BRCSafeDBHolder %p> - Creating for db in path: %@%@", (uint8_t *)&v13, 0x20u);
    }

  }
  return v9;
}

- (void)closeDatabaseSynchronously:(BOOL)a3 dispatchToSerialQueue:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  BRCSafeDBHolder *v9;
  BRCPQLConnection *v10;
  BRCPQLConnection *db;
  void *v12;
  id v13;
  BRCPQLConnection *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  BRCPQLConnection *v20;
  id v21;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_db;
  db = v9->_db;
  v9->_db = 0;

  objc_sync_exit(v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BRCSafeDBHolder %p>"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke;
    v18[3] = &unk_1E875EB70;
    v13 = v12;
    v19 = v13;
    v14 = v10;
    v20 = v14;
    v21 = v8;
    v15 = MEMORY[0x1D17A6DB0](v18);
    v16 = (void *)v15;
    if (v6)
    {
      if (!v5)
      {
        (*(void (**)(uint64_t))(v15 + 16))(v15);
        goto LABEL_10;
      }
      -[BRCPQLConnection serialQueue](v14, "serialQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v17, v16);
    }
    else
    {
      -[BRCPQLConnection serialQueue](v14, "serialQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v17, v16);
    }

LABEL_10:
    goto LABEL_11;
  }
  if (v8)
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
LABEL_11:

}

void __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_2((uint64_t)a1);

  v4 = (void *)a1[5];
  v11 = 0;
  v5 = objc_msgSend(v4, "brc_closeWithError:", &v11);
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_1((uint64_t)a1);
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_fault_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_FAULT, "[CRIT] %@ - Error closing BRCPendingChangesStream DB connection: %@%@", buf, 0x20u);
    }
  }

  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);

}

- (BOOL)closeWithError:(id *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__28;
  v14 = __Block_byref_object_dispose__28;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__BRCSafeDBHolder_closeWithError___block_invoke;
  v9[3] = &unk_1E875EB20;
  v9[4] = &v10;
  -[BRCSafeDBHolder closeDatabaseSynchronously:dispatchToSerialQueue:completionHandler:](self, "closeDatabaseSynchronously:dispatchToSerialQueue:completionHandler:", 1, 0, v9);
  v4 = (id)v11[5];
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      v8 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v17 = "-[BRCSafeDBHolder closeWithError:]";
      v18 = 2080;
      if (!a3)
        v8 = "(ignored by caller)";
      v19 = v8;
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v5;
      _os_log_error_impl(&dword_1CBD43000, v6, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v4);

  _Block_object_dispose(&v10, 8);
  return v4 == 0;
}

void __34__BRCSafeDBHolder_closeWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)asyncClose
{
  -[BRCSafeDBHolder asyncCloseWithCompletionHandler:](self, "asyncCloseWithCompletionHandler:", 0);
}

- (void)asyncCloseWithCompletionHandler:(id)a3
{
  -[BRCSafeDBHolder closeDatabaseSynchronously:dispatchToSerialQueue:completionHandler:](self, "closeDatabaseSynchronously:dispatchToSerialQueue:completionHandler:", 0, 1, a3);
}

- (void)dealloc
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] <BRCSafeDBHolder %p> - dealloc called%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - Database closed%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - Closing the database%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
