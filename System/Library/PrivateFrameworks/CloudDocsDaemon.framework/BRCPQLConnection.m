@implementation BRCPQLConnection

- (BRCPQLConnection)init
{
  return -[BRCPQLConnection initWithLabel:dbCorruptionHandler:](self, "initWithLabel:dbCorruptionHandler:", 0, 0);
}

- (BRCPQLConnection)initWithLabel:(id)a3 dbCorruptionHandler:(id)a4
{
  id v6;
  id v7;
  BRCPQLConnection *v8;
  BRCPQLConnection *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCPQLConnection;
  v8 = -[BRCPQLConnection init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[BRCPQLConnection _setErrorHandlerWithDBCorruptionHandler:](v8, "_setErrorHandlerWithDBCorruptionHandler:", v7);
    -[BRCPQLConnection _setLockedHandler](v9, "_setLockedHandler");
    -[BRCPQLConnection setLabel:](v9, "setLabel:", v6);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPQLConnection setTraced:](v9, "setTraced:", objc_msgSend(v10, "dbTraced"));

    -[BRCPQLConnection setCrashIfUsedAfterClose:](v9, "setCrashIfUsedAfterClose:", 1);
  }

  return v9;
}

- (void)_setErrorHandlerWithDBCorruptionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke;
  v6[3] = &unk_1E875D9D8;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[BRCPQLConnection setSqliteErrorHandler:](self, "setSqliteErrorHandler:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  id WeakRetained;
  _BYTE v21[24];
  id v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)v21 = 138413058;
      *(_QWORD *)&v21[4] = v8;
      *(_WORD *)&v21[12] = 2112;
      *(_QWORD *)&v21[14] = v7;
      *(_WORD *)&v21[22] = 2112;
      v22 = v9;
      LOWORD(v23) = 2112;
      *(_QWORD *)((char *)&v23 + 2) = v10;
      v12 = "[ERROR] Sqlite request %@ failed on %@ with error [%@]%@";
      v13 = v11;
      v14 = 42;
LABEL_15:
      _os_log_error_impl(&dword_1CBD43000, v13, (os_log_type_t)0x90u, v12, v21, v14);
    }
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)v21 = 138412802;
      *(_QWORD *)&v21[4] = v7;
      *(_WORD *)&v21[12] = 2112;
      *(_QWORD *)&v21[14] = v9;
      *(_WORD *)&v21[22] = 2112;
      v22 = v10;
      v12 = "[ERROR] Sqlite failed on %@ with error [%@]%@";
      v13 = v11;
      v14 = 32;
      goto LABEL_15;
    }
  }

  v15 = objc_msgSend(v9, "code");
  if (v15 <= 0x15 && ((1 << v15) & 0x380002) != 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke_cold_1();

  }
  v18 = objc_msgSend(v9, "code", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23);
  if (v18 <= 0x1A && ((1 << v18) & 0x5000800) != 0)
  {
    v19 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, id, id, void *))(v19 + 16))(v19, WeakRetained, v9, &__block_literal_global_1);

  }
}

void __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke_1()
{
  void *v0;
  NSObject *v1;
  void *v2;
  const char *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sqlite database became corrupted, abort..."));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412546;
    v5 = v2;
    v6 = 2112;
    v7 = v0;
    _os_log_fault_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v4, 0x16u);

  }
  brc_append_system_info_to_message();
  v3 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCPQLConnection _setErrorHandlerWithDBCorruptionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 100, v3);
}

- (void)_setLockedHandler
{
  -[BRCPQLConnection setLockedHandler:](self, "setLockedHandler:", &__block_literal_global_7);
}

uint64_t __37__BRCPQLConnection__setLockedHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v6, "currentOperationDuration");
  v10 = v9;
  if (v9 >= 60.0)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(on statement %@)"), v7);
      v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &stru_1E8769030;
    }
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ locked for more than 1 minute %@, aborting..."), v6, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2(v17, (uint64_t)v18, v19);

    brc_append_system_info_to_message();
    v20 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCPQLConnection _setLockedHandler]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 118, v20);
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ has been locked for %f seconds: %@"), v6, *(_QWORD *)&v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
    objc_msgSend(v11, "appendFormat:", CFSTR(" (for statement %@)"), v7);
  if (v10 >= 30.0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_1();
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] %@%@", buf, 0x16u);
    }
  }

  usleep(0x2710u);
  return 1;
}

- (BOOL)_registerStaticDBFunctionsWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v25 = 0;
  v5 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("fetch_and_inc64"), 1, &__block_literal_global_22, &v25);
  v6 = v25;
  v7 = v6;
  if (!v5)
    goto LABEL_15;
  v24 = v6;
  v8 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("inc_and_fetch64"), 1, &__block_literal_global_25, &v24);
  v9 = v24;

  if (!v8)
    goto LABEL_14;
  v23 = v9;
  v10 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("fetch_and_dec64"), 1, &__block_literal_global_28, &v23);
  v7 = v23;

  if (v10)
  {
    v22 = v7;
    v11 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("dec_and_fetch64"), 1, &__block_literal_global_31, &v22);
    v9 = v22;

    if (!v11)
    {
LABEL_14:
      v7 = v9;
      goto LABEL_15;
    }
    v21 = v9;
    v12 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("call_block"), 0xFFFFFFFFLL, &__block_literal_global_34, &v21);
    v7 = v21;

    if (v12)
    {
      v20 = v7;
      v13 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("indexset_contains"), 2, &__block_literal_global_38, &v20);
      v9 = v20;

      if (v13
        && -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", CFSTR("item_id_is_root"), 1, &__block_literal_global_43)&& -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", CFSTR("item_id_is_documents"), 1, &__block_literal_global_48)&& -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", CFSTR("item_id_is_app_library_root"), 1, &__block_literal_global_52)&& -[BRCPQLConnection registerFunction:nArgs:handler:](self,
                           "registerFunction:nArgs:handler:",
                           CFSTR("item_id_is_shared_root"),
                           1,
                           &__block_literal_global_56)
        && -[BRCPQLConnection registerFunction:nArgs:handler:](self, "registerFunction:nArgs:handler:", CFSTR("app_library_rowid_from_root_or_documents"), 1, &__block_literal_global_60))
      {
        v19 = v9;
        v14 = 1;
        v15 = -[PQLConnection registerFunction:nArgs:handler:error:](self, "registerFunction:nArgs:handler:error:", CFSTR("validation_key"), 1, &__block_literal_global_63, &v19);
        v7 = v19;

        if (v15)
          goto LABEL_20;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    -[BRCPQLConnection _registerStaticDBFunctionsWithError:].cold.1();

  if (a3)
  {
    v7 = objc_retainAutorelease(v7);
    v14 = 0;
    *a3 = v7;
  }
  else
  {
    v14 = 0;
  }
LABEL_20:

  return v14;
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke(uint64_t a1, sqlite3_context *a2)
{
  _QWORD *v3;
  sqlite3_int64 v4;

  v3 = (_QWORD *)pql_sqlite3_value_pointer();
  if (v3)
  {
    v4 = (*v3)++;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_2(uint64_t a1, sqlite3_context *a2)
{
  _QWORD *v3;
  sqlite3_int64 v4;

  v3 = (_QWORD *)pql_sqlite3_value_pointer();
  if (v3)
  {
    v4 = *v3 + 1;
    *v3 = v4;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_3(uint64_t a1, sqlite3_context *a2)
{
  _QWORD *v3;
  sqlite3_int64 v4;

  v3 = (_QWORD *)pql_sqlite3_value_pointer();
  if (v3)
  {
    v4 = (*v3)--;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_4(uint64_t a1, sqlite3_context *a2)
{
  _QWORD *v3;
  sqlite3_int64 v4;

  v3 = (_QWORD *)pql_sqlite3_value_pointer();
  if (v3)
  {
    v4 = *v3 - 1;
    *v3 = v4;
    sqlite3_result_int64(a2, v4);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  NSObject *v9;

  if (a3 <= 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5_cold_1();

  }
  pql_sqlite3_value_object();
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[2](v7, a2, (a3 - 1), a4 + 8);

}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_37(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;

  pql_sqlite3_value_object();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_37_cold_1();

    }
  }
  if (sqlite3_value_type(*a4) == 1)
    v7 = objc_msgSend(v6, "containsIndex:", sqlite3_value_int64(a4[1]));
  else
    v7 = 0;
  sqlite3_result_int(a2, v7);

}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_42(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  sqlite3_result_int(a2, +[BRCItemID isRootItemIDWithSQLiteValue:](BRCItemID, "isRootItemIDWithSQLiteValue:", *a4));
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_2_47(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  sqlite3_result_int(a2, +[BRCItemID isDocumentsItemIDWithSQLiteValue:](BRCItemID, "isDocumentsItemIDWithSQLiteValue:", *a4));
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_3_51(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  sqlite3_result_int(a2, +[BRCItemID isAppLibraryRootItemIDWithSQLiteValue:](BRCItemID, "isAppLibraryRootItemIDWithSQLiteValue:", *a4));
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_4_55(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  sqlite3_result_int(a2, +[BRCItemID isSharedZoneRootItemIDWithSQLiteValue:](BRCItemID, "isSharedZoneRootItemIDWithSQLiteValue:", *a4));
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5_59(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  void *v5;
  id v6;

  +[BRCItemID appLibraryRowIDFromRootOrDocumentsSQLiteValue:](BRCItemID, "appLibraryRowIDFromRootOrDocumentsSQLiteValue:", *a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    sqlite3_result_int64(a2, objc_msgSend(v5, "unsignedLongLongValue"));
  else
    sqlite3_result_null(a2);

}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_6(uint64_t a1, sqlite3_context *a2, int a3, _QWORD *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_6_cold_1();

  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteValue:", *a4);
  objc_msgSend(v6, "brc_truncatedSHA256");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    sqlite3_result_blob(a2, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_null(a2);
  }

}

- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5
{
  char v6;
  _BOOL4 v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BRCPQLConnection;
  v8 = -[BRCPQLConnection openAtURL:withFlags:error:](&v10, sel_openAtURL_withFlags_error_, a3);
  if (v8)
  {
    self->_isReadonly = v6 & 1;
    if ((v6 & 1) != 0 || (-[BRCPQLConnection setupPragmas](self, "setupPragmas") & 1) != 0)
    {
      if (-[BRCPQLConnection _registerStaticDBFunctionsWithError:](self, "_registerStaticDBFunctionsWithError:", a5))
      {
        LOBYTE(v8) = 1;
        return v8;
      }
    }
    else if (a5)
    {
      -[BRCPQLConnection lastError](self, "lastError");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[BRCPQLConnection brc_close](self, "brc_close");
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)profilingEnabled
{
  void *v2;
  BOOL v3;

  -[BRCPQLConnection profilingHook](self, "profilingHook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)changes
{
  int64_t result;
  objc_super v4;

  result = self->_changesOverride;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCPQLConnection;
    return -[BRCPQLConnection changes](&v4, sel_changes);
  }
  return result;
}

- (void)setProfilingEnabled:(BOOL)a3
{
  objc_super v3;
  objc_super v4;
  _QWORD v5[5];
  uint64_t v6;

  if (a3)
  {
    LOBYTE(v6) = self->_verboseProfilingEnabled;
    -[BRCPQLConnection setProfilingHook:](&v4, sel_setProfilingHook_, v5, v3.receiver, v3.super_class, self, BRCPQLConnection, MEMORY[0x1E0C809B0], 3221225472, __40__BRCPQLConnection_setProfilingEnabled___block_invoke, &unk_1E875DBE0, self, v6);
  }
  else
  {
    self->_changesOverride = 0;
    -[BRCPQLConnection setProfilingHook:](&v3, sel_setProfilingHook_, &__block_literal_global_79, self, BRCPQLConnection, v4.receiver, v4.super_class, v5[0], v5[1], v5[2], v5[3], v5[4], v6);
  }
}

void __40__BRCPQLConnection_setProfilingEnabled___block_invoke(uint64_t a1, void *a2, sqlite3_stmt *a3, uint64_t a4)
{
  _QWORD *v7;
  int v8;
  int v9;
  unsigned int v10;
  const char *v11;
  unint64_t v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  _BYTE v29[24];
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  _BYTE v33[44];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = sqlite3_column_count(a3);
  v9 = sqlite3_bind_parameter_count(a3);
  v10 = sqlite3_stmt_status(a3, 4, 0);
  v11 = sqlite3_sql(a3);
  if (strncmp(v11, "explain query plan", 0x12uLL))
  {
    v7[38] += v10;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = 0;
    if (v8)
    {
      v12 = (8 * v9 + 4 * v8) + (8 * v9 + 4 * v8) * a4 + 150;
      if (*(_BYTE *)(a1 + 40) || v12 < v10)
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          if (*(_BYTE *)(a1 + 40))
            v14 = "Verbose statement profile on";
          else
            v14 = "Possible slow statement on";
          queryPlanForSQL(v11, v7);
          *(_DWORD *)buf = 136317442;
          *(_QWORD *)v29 = v14;
          *(_WORD *)&v29[8] = 2112;
          *(_QWORD *)&v29[10] = v7;
          *(_WORD *)&v29[18] = 1024;
          *(_DWORD *)&v29[20] = v9;
          v30 = 1024;
          *(_DWORD *)v31 = v8;
          *(_WORD *)&v31[4] = 2048;
          *(_QWORD *)&v31[6] = a4;
          v32 = 1024;
          *(_DWORD *)v33 = v10;
          *(_WORD *)&v33[4] = 2048;
          *(_QWORD *)&v33[6] = (8 * v9 + 4 * v8) + (8 * v9 + 4 * v8) * a4 + 150;
          *(_WORD *)&v33[14] = 2080;
          *(_QWORD *)&v33[16] = v11;
          *(_WORD *)&v33[24] = 2112;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v33[26] = v15;
          *(_WORD *)&v33[34] = 2112;
          *(_QWORD *)&v33[36] = v26;
          _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %s %@:\n  binds:    %d\n  columns:  %d\n  rows:     %ld\n  vm steps: %d (max: %lu)\n  sql:      %s\n  %@%@", buf, 0x5Au);

        }
      }
    }
    else
    {
      v16 = objc_msgSend(v7, "changes");
      v12 = v16 * (8 * v9 + 175) + 175;
      if (*(_BYTE *)(a1 + 40) || v12 < v10)
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          if (*(_BYTE *)(a1 + 40))
            v18 = "Verbose statement profile on";
          else
            v18 = "Possible slow statement on";
          v25 = v18;
          queryPlanForSQL(v11, v7);
          *(_DWORD *)buf = 136317186;
          *(_QWORD *)v29 = v25;
          *(_WORD *)&v29[8] = 2112;
          *(_QWORD *)&v29[10] = v7;
          *(_WORD *)&v29[18] = 1024;
          *(_DWORD *)&v29[20] = v9;
          v30 = 2048;
          *(_QWORD *)v31 = v16;
          *(_WORD *)&v31[8] = 1024;
          *(_DWORD *)&v31[10] = v10;
          v32 = 2048;
          *(_QWORD *)v33 = v16 * (8 * v9 + 175) + 175;
          *(_WORD *)&v33[8] = 2080;
          *(_QWORD *)&v33[10] = v11;
          *(_WORD *)&v33[18] = 2112;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v33[20] = v19;
          *(_WORD *)&v33[28] = 2112;
          *(_QWORD *)&v33[30] = v27;
          _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] %s %@:\n  binds:    %d\n  changes:  %lld\n  vm steps: %d (max: %lu)\n  sql:      %s\n  %@%@", buf, 0x54u);

        }
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = v16;
      }
    }
    if (10 * v12 < v10)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v29 = v10;
        *(_WORD *)&v29[4] = 2048;
        *(_QWORD *)&v29[6] = v12;
        *(_WORD *)&v29[14] = 2080;
        *(_QWORD *)&v29[16] = v11;
        v30 = 2112;
        *(_QWORD *)v31 = v20;
        _os_log_fault_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_FAULT, "[CRIT] Significantly too slow SQL statement(vm steps: %u  max:%lu): %s%@", buf, 0x26u);
      }

      if (v11)
        v22 = v11;
      else
        v22 = "(null)";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22, v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Significantly too slow SQL statement: "), "stringByAppendingString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      abc_report_assert_with_signature();

    }
  }

}

void __40__BRCPQLConnection_setProfilingEnabled___block_invoke_78(uint64_t a1, void *a2, sqlite3_stmt *a3)
{
  _QWORD *v4;

  v4 = a2;
  v4[38] += sqlite3_stmt_status(a3, 4, 0);

}

- (BOOL)attachDBAtPath:(id)a3 as:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithFormat:", CFSTR("ATTACH \"%@\" AS %@"), v10, v9);

  v12 = -[BRCPQLConnection executeRaw:](self, "executeRaw:", v11);
  if (!v12)
  {
    -[BRCPQLConnection lastError](self, "lastError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v19 = "-[BRCPQLConnection attachDBAtPath:as:error:]";
        v20 = 2080;
        if (!a5)
          v17 = "(ignored by caller)";
        v21 = v17;
        v22 = 2112;
        v23 = v13;
        v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v13);

  }
  return v12;
}

- (void)flushToMakeEditsVisibleToIPCReaders
{
  if ((-[BRCPQLConnection isInTransaction](self, "isInTransaction") & 1) != 0)
  {
    self->_flushImmediately = 1;
    -[BRCPQLConnection forceBatchStart](self, "forceBatchStart");
  }
  else
  {
    -[BRCPQLConnection flush](self, "flush");
  }
}

- (void)scheduleFlushWithCheckpoint:(BOOL)a3 whenFlushed:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  BOOL v10;

  v8 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke;
  v9[3] = &unk_1E875DC48;
  v9[4] = self;
  v10 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke_2;
  v7[3] = &unk_1E875DC70;
  v6 = v8;
  -[BRCPQLConnection performWithFlags:action:whenFlushed:](self, "performWithFlags:action:whenFlushed:", 4, v9, v7);

}

uint64_t __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "forceBatchStart");
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "br_makeNextFlushCheckpoint");
  return 1;
}

uint64_t __60__BRCPQLConnection_scheduleFlushWithCheckpoint_whenFlushed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setProfilingHook:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setting profiling hook is not supported on %@"), objc_opt_class());
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_fault_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);

  }
  brc_append_system_info_to_message();
  v7 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCPQLConnection setProfilingHook:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 392, v7);
}

- (id)fetchWithSlowStatementRadar:(id)a3 sql:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  uint64_t *v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v17 = 0;
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:].cold.1();

  }
  v17 = &v18;
  v16.receiver = self;
  v16.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection profilingHook](&v16, sel_profilingHook);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v15, sel_setProfilingHook_, 0);
  v12 = -[BRCPQLConnection fetch:args:](self, "fetch:args:", v6, v17);

  v14.receiver = self;
  v14.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v14, sel_setProfilingHook_, v11);

  return v12;
}

- (id)fetchWithSlowStatementRadar:(id)a3 objectOfClass:(Class)a4 sql:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  uint64_t *v19;
  uint64_t v20;

  v8 = a5;
  v9 = a3;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v19 = 0;
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:].cold.1();

  }
  v19 = &v20;
  v18.receiver = self;
  v18.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection profilingHook](&v18, sel_profilingHook);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v17, sel_setProfilingHook_, 0);
  v14 = -[BRCPQLConnection fetchObjectOfClass:sql:args:](self, "fetchObjectOfClass:sql:args:", a4, v8, v19);

  v16.receiver = self;
  v16.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v16, sel_setProfilingHook_, v13);

  return v14;
}

- (id)fetchWithSlowStatementRadar:(id)a3 objectWithConstructor:(id)a4 sql:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  objc_super v17;
  objc_super v18;
  objc_super v19;
  uint64_t *v20;
  uint64_t v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v20 = 0;
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:].cold.1();

  }
  v20 = &v21;
  v19.receiver = self;
  v19.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection profilingHook](&v19, sel_profilingHook);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v18, sel_setProfilingHook_, 0);
  v15 = -[BRCPQLConnection fetchObject:sql:args:](self, "fetchObject:sql:args:", v9, v8, v20);

  v17.receiver = self;
  v17.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v17, sel_setProfilingHook_, v14);

  return v15;
}

- (BOOL)executeWithExpectedIndex:(id)a3 sql:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCPQLConnection executeWithExpectedIndex:sql:].cold.1();

  }
  v11 = -[BRCPQLConnection execute:args:](self, "execute:args:", v6, &v13);

  return v11;
}

- (BOOL)executeWithSlowStatementRadar:(id)a3 sql:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  uint64_t *v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v17 = 0;
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCPQLConnection fetchWithSlowStatementRadar:sql:].cold.1();

  }
  v17 = &v18;
  v16.receiver = self;
  v16.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection profilingHook](&v16, sel_profilingHook);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v15, sel_setProfilingHook_, 0);
  v12 = -[BRCPQLConnection execute:args:](self, "execute:args:", v6, v17);

  v14.receiver = self;
  v14.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v14, sel_setProfilingHook_, v11);

  return v12;
}

- (BOOL)executeWithErrorHandler:(id)a3 sql:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  objc_super v11;
  objc_super v12;
  objc_super v13;
  uint64_t *v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v14 = &v15;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)BRCPQLConnection;
    -[BRCPQLConnection sqliteErrorHandler](&v13, sel_sqliteErrorHandler);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)BRCPQLConnection;
    -[BRCPQLConnection setSqliteErrorHandler:](&v12, sel_setSqliteErrorHandler_, v6);
    v9 = -[BRCPQLConnection execute:args:](self, "execute:args:", v7, v14);
    v11.receiver = self;
    v11.super_class = (Class)BRCPQLConnection;
    -[BRCPQLConnection setSqliteErrorHandler:](&v11, sel_setSqliteErrorHandler_, v8);

  }
  else
  {
    v9 = -[BRCPQLConnection execute:args:](self, "execute:args:", v7, v14);
  }

  return v9;
}

- (void)disableProfilingForQueriesInBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v4 = (void (**)(_QWORD))a3;
  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  if (!v4)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCPQLConnection disableProfilingForQueriesInBlock:].cold.1();

  }
  v10.receiver = self;
  v10.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection profilingHook](&v10, sel_profilingHook);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v9, sel_setProfilingHook_, 0);
  v4[2](v4);

  v8.receiver = self;
  v8.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection setProfilingHook:](&v8, sel_setProfilingHook_, v5);

}

- (BOOL)_shouldFlushWithChangeCount:(int)a3
{
  br_pacer *v5;
  void *v6;
  br_pacer *v7;
  br_pacer *batchingPacer;
  int changeCount;
  BOOL v10;
  void *v11;
  NSObject *v12;
  id v14;
  id location;

  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  if (a3 == -2)
  {
    if (!self->_batchingPacer)
    {
      -[BRCPQLConnection serialQueue](self, "serialQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      br_pacer_create();
      v7 = (br_pacer *)objc_claimAutoreleasedReturnValue();
      batchingPacer = self->_batchingPacer;
      self->_batchingPacer = v7;

      objc_initWeak(&location, self);
      objc_copyWeak(&v14, &location);
      br_pacer_set_event_handler();
      br_pacer_resume();
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    br_pacer_signal_at_most_after_min_interval();
  }
  else if (a3 == -1)
  {
    v5 = self->_batchingPacer;
    if (!v5)
      return (char)v5;
    br_pacer_pretend_event_handler_fired();
  }
  else
  {
    changeCount = self->_changeCount;
    if (changeCount)
      v10 = changeCount <= a3;
    else
      v10 = 0;
    if (v10 || self->_flushImmediately)
    {
      self->_flushImmediately = 0;
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    if (!self->_batchingPacer)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCPQLConnection _shouldFlushWithChangeCount:].cold.1();

    }
    br_pacer_signal();
  }
  LOBYTE(v5) = 0;
  return (char)v5;
}

void __48__BRCPQLConnection__shouldFlushWithChangeCount___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[280] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "flush");
    WeakRetained = v2;
  }

}

- (void)usePacedBatchingOnTargetQueue:(id)a3 withInterval:(double)a4 changeCount:(int)a5
{
  _QWORD v5[5];

  self->_changeCount = a5;
  self->_flushInterval = a4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__BRCPQLConnection_usePacedBatchingOnTargetQueue_withInterval_changeCount___block_invoke;
  v5[3] = &unk_1E875DCC0;
  v5[4] = self;
  -[BRCPQLConnection useBatchingOnTargetQueue:withPolicyHandler:](self, "useBatchingOnTargetQueue:withPolicyHandler:", a3, v5);
}

uint64_t __75__BRCPQLConnection_usePacedBatchingOnTargetQueue_withInterval_changeCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldFlushWithChangeCount:");
}

- (BOOL)brc_closeWithError:(id *)a3
{
  br_pacer *batchingPacer;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  BRCPQLConnection *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_batchingPacer)
  {
    br_pacer_cancel();
    batchingPacer = self->_batchingPacer;
    self->_batchingPacer = 0;

  }
  v11 = 0;
  v6 = -[BRCPQLConnection close:](self, "close:", &v11);
  v7 = v11;
  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_fault_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_FAULT, "[CRIT] error closing connection %@: %@%@", buf, 0x20u);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

- (void)brc_close
{
  BOOL v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;

  v10 = 0;
  v3 = -[BRCPQLConnection brc_closeWithError:](self, "brc_closeWithError:", &v10);
  v4 = v10;
  v5 = v4;
  if (!v3)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error closing connection %@: %@"), self, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2(v6, (uint64_t)v7, v8);

    brc_append_system_info_to_message();
    v9 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCPQLConnection brc_close]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCPQLConnection.m", 615, v9);
  }

}

- (int64_t)sizeInBytes
{
  id v3;
  id v4;
  uint64_t v5;
  int64_t v6;

  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  v3 = -[PQLConnection numberWithSQL:](self, "numberWithSQL:", CFSTR("pragma page_count"));
  v4 = -[PQLConnection numberWithSQL:](self, "numberWithSQL:", CFSTR("pragma page_size"));
  v5 = objc_msgSend(v3, "integerValue");
  v6 = objc_msgSend(v4, "integerValue") * v5;

  return v6;
}

- (BOOL)needsAutovacuum
{
  void *v3;
  float v4;
  BOOL v5;
  uint64_t v7;
  double v8;
  float v9;

  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dbAutovacuumRatio");
  v5 = v4 != 0.0
    && objc_msgSend(v3, "dbAutovacuumBatchSize")
    && (v7 = -[BRCPQLConnection autovacuumableSpaceInBytes](self, "autovacuumableSpaceInBytes"),
        v8 = (double)v7 * 100.0 / (double)-[BRCPQLConnection sizeInBytes](self, "sizeInBytes"),
        objc_msgSend(v3, "dbAutovacuumRatio"),
        v8 >= v9)
    && v7 >= objc_msgSend(v3, "dbAutovacuumBatchSize");

  return v5;
}

- (void)autovacuumIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[BRCPQLConnection assertOnQueue](self, "assertOnQueue");
  if (!self->_autovacuumInProgress && -[BRCPQLConnection needsAutovacuum](self, "needsAutovacuum"))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPQLConnection incrementalVacuum:](self, "incrementalVacuum:", objc_msgSend(v3, "dbAutovacuumBatchSize"));
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "connectedToPowerSource");

    if (v5)
    {
      objc_initWeak(&location, self);
      self->_autovacuumInProgress = 1;
      -[BRCPQLConnection serialQueue](self, "serialQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __38__BRCPQLConnection_autovacuumIfNeeded__block_invoke;
      v7[3] = &unk_1E875DC98;
      objc_copyWeak(&v8, &location);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }

  }
}

void __38__BRCPQLConnection_autovacuumIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[281] = 0;
  objc_msgSend(WeakRetained, "autovacuumIfNeeded");

}

- (BOOL)_validateIsRunningWithCorrectPersona
{
  BRCPQLConnection *v2;
  void *v3;
  void *v4;
  void *v6;
  NSObject *v7;

  if (!self->_assertionPersonaIdentifier)
    return 1;
  v2 = self;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "isEqualToString:", v2->_assertionPersonaIdentifier);

  if ((v2 & 1) != 0)
    return 1;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[BRCPQLConnection _validateIsRunningWithCorrectPersona].cold.1();

  return 0;
}

- (void)assertOnQueue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCPQLConnection;
  -[BRCPQLConnection assertOnQueue](&v3, sel_assertOnQueue);
  -[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona");
}

- (BOOL)execute:(id)a3
{
  uint64_t v4;

  return -[BRCPQLConnection execute:args:](self, "execute:args:", a3, &v4);
}

- (BOOL)execute:(id)a3 args:(char *)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  if (-[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona"))
  {
    v9.receiver = self;
    v9.super_class = (Class)BRCPQLConnection;
    v7 = -[BRCPQLConnection execute:args:](&v9, sel_execute_args_, v6, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)executeRaw:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona"))
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCPQLConnection;
    v5 = -[BRCPQLConnection executeRaw:](&v7, sel_executeRaw_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fetch:(id)a3
{
  uint64_t v4;

  return -[BRCPQLConnection fetch:args:](self, "fetch:args:", a3, &v4);
}

- (id)fetch:(id)a3 args:(char *)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a3;
  if (-[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona"))
  {
    v9.receiver = self;
    v9.super_class = (Class)BRCPQLConnection;
    v7 = -[BRCPQLConnection fetch:args:](&v9, sel_fetch_args_, v6, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  uint64_t v6;

  return -[BRCPQLConnection fetchObjectOfClass:initializer:sql:args:](self, "fetchObjectOfClass:initializer:sql:args:", a3, a4, a5, &v6);
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6
{
  id v10;
  id v11;
  objc_super v13;

  v10 = a5;
  if (-[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona"))
  {
    v13.receiver = self;
    v13.super_class = (Class)BRCPQLConnection;
    v11 = -[BRCPQLConnection fetchObjectOfClass:initializer:sql:args:](&v13, sel_fetchObjectOfClass_initializer_sql_args_, a3, a4, v10, a6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4
{
  uint64_t v5;

  return -[BRCPQLConnection fetchObjectOfClass:sql:args:](self, "fetchObjectOfClass:sql:args:", a3, a4, &v5);
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5
{
  id v8;
  id v9;
  objc_super v11;

  v8 = a4;
  if (-[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona"))
  {
    v11.receiver = self;
    v11.super_class = (Class)BRCPQLConnection;
    v9 = -[BRCPQLConnection fetchObjectOfClass:sql:args:](&v11, sel_fetchObjectOfClass_sql_args_, a3, v8, a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchObject:(id)a3 sql:(id)a4
{
  uint64_t v5;

  return -[BRCPQLConnection fetchObject:sql:args:](self, "fetchObject:sql:args:", a3, a4, &v5);
}

- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  if (-[BRCPQLConnection _validateIsRunningWithCorrectPersona](self, "_validateIsRunningWithCorrectPersona"))
  {
    v12.receiver = self;
    v12.super_class = (Class)BRCPQLConnection;
    v10 = -[BRCPQLConnection fetchObject:sql:args:](&v12, sel_fetchObject_sql_args_, v8, v9, a5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)vmStepsExecuted
{
  return self->_vmStepsExecuted;
}

- (BOOL)isReadonly
{
  return self->_isReadonly;
}

- (BOOL)verboseProfilingEnabled
{
  return self->_verboseProfilingEnabled;
}

- (void)setVerboseProfilingEnabled:(BOOL)a3
{
  self->_verboseProfilingEnabled = a3;
}

- (NSString)assertionPersonaIdentifier
{
  return self->_assertionPersonaIdentifier;
}

- (void)setAssertionPersonaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assertionPersonaIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionPersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_batchingPacer, 0);
}

void __60__BRCPQLConnection__setErrorHandlerWithDBCorruptionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: Got really unexpected error: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

void __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] %@%@");
  OUTLINED_FUNCTION_2();
}

void __37__BRCPQLConnection__setLockedHandler__block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  brc_append_system_info_to_message();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a3, v5, "[CRIT] %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_registerStaticDBFunctionsWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] _registerStaticDBFunctions failed with %@%@");
  OUTLINED_FUNCTION_2();
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: argc >= 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !set || [set isKindOfClass:[NSIndexSet class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCPQLConnection__registerStaticDBFunctionsWithError___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: argc == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchWithSlowStatementRadar:sql:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: you need to provide a radar%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)executeWithExpectedIndex:sql:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: you need to an index to use%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)disableProfilingForQueriesInBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: block%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldFlushWithChangeCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _batchingPacer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_validateIsRunningWithCorrectPersona
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Running on the connection with the wrong persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
