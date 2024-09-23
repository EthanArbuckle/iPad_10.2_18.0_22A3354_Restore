@implementation SGSqliteDatabase

- (BOOL)runQuery:(id)a3 onRow:(id)a4 onError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SGSqliteDatabaseSharedLock *sharedWriterLock;
  id v13;
  NSObject *v14;
  char v15;
  unint64_t lastBusyWaitEnded;
  unint64_t v17;
  double v18;
  const char *v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v26;
  double v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = mach_absolute_time();
  sharedWriterLock = self->_sharedWriterLock;
  if (sharedWriterLock)
  {
    if (!-[SGSqliteDatabaseSharedLock writeTransactionDepth](sharedWriterLock, "writeTransactionDepth"))
    {
      v13 = objc_retainAutorelease(v8);
      if (!sqlite3_stmt_readonly((sqlite3_stmt *)objc_msgSend(v13, "stmt")))
      {
        sgLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          v26 = 136315138;
          v27 = COERCE_DOUBLE(sqlite3_sql((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v13), "stmt")));
          _os_log_fault_impl(&dword_1C3607000, v14, OS_LOG_TYPE_FAULT, "Write statement should be run in a write transaction: %s", (uint8_t *)&v26, 0xCu);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria())
          abort();
      }
    }
  }
  v15 = -[SGSqliteDatabaseImpl runQuery:onRow:onError:](self->_impl, "runQuery:onRow:onError:", v8, v9, v10);
  lastBusyWaitEnded = self->_lastBusyWaitEnded;
  if (runQuery_onRow_onError__onceToken != -1)
    dispatch_once(&runQuery_onRow_onError__onceToken, &__block_literal_global_80_13297);
  v17 = lastBusyWaitEnded - v11;
  if (lastBusyWaitEnded < v11)
    v17 = 0;
  v18 = (double)(v17 * runQuery_onRow_onError__machTimebaseInfo / *(unsigned int *)algn_1ED5297FC)
      / 1000000000.0;
  if (v18 > 0.5 && os_variant_has_internal_diagnostics())
  {
    v19 = sqlite3_sql((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v8), "stmt"));
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v21)
      {
        v26 = 134218242;
        v27 = v18 * 1000.0;
        v28 = 2080;
        v29 = v19;
        v22 = "This query was delayed %0.2f ms waiting for db file locked by another sqlite connection: %s";
        v23 = v20;
        v24 = 22;
LABEL_18:
        _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v26, v24);
      }
    }
    else if (v21)
    {
      v26 = 134217984;
      v27 = v18 * 1000.0;
      v22 = "This query was delayed %0.2f ms waiting for db file locked by another sqlite connection -- unknown SQL";
      v23 = v20;
      v24 = 12;
      goto LABEL_18;
    }

  }
  return v15;
}

void __55__SGSqliteDatabase_prepAndRunSQL_onPrep_onRow_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "runQuery:onRow:onError:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (BOOL)prepAndRunSQL:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__SGSqliteDatabase_prepAndRunSQL_onPrep_onRow_onError___block_invoke;
  v19[3] = &unk_1E7DACD50;
  v15 = v11;
  v23 = &v24;
  v19[4] = self;
  v20 = v15;
  v16 = v12;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  -[SGSqliteDatabase _prepQuery:onPrep:onError:](self, "_prepQuery:onPrep:onError:", v10, v19, v17);

  objc_autoreleasePoolPop(v14);
  LOBYTE(self) = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return (char)self;
}

- (BOOL)_prepQuery:(id)a3 onPrep:(id)a4 onError:(id)a5
{
  id v9;
  id v10;
  id v11;
  char v12;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSqliteDatabase.m"), 668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSqliteDatabase.m"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("onPrep"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[SGSqliteDatabaseImpl prepQuery:onPrep:onError:](self->_impl, "prepQuery:onPrep:onError:", v9, v10, v11);

  return v12;
}

- (void)readTransaction:(id)a3
{
  -[SGSqliteDatabaseImpl readTransaction:](self->_impl, "readTransaction:", a3);
}

- (SGSqliteDatabase)initWithFilename:(id)a3 withProtection:(BOOL)a4 sharedLock:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  SGSqliteDatabase *v13;
  id *p_isa;
  uint64_t v15;
  SGSqliteDatabaseImpl *v16;
  id v17;
  sqlite3 *v18;
  NSObject *v19;
  uint64_t function_v2;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void **v26;
  const __CFString **v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t busy;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  _QWORD v52[4];
  id *v53;
  objc_super v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  uint8_t buf[4];
  int v68;
  uint64_t v69;

  v8 = a4;
  v69 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSqliteDatabase.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

  }
  v54.receiver = self;
  v54.super_class = (Class)SGSqliteDatabase;
  v13 = -[SGSqliteDatabase init](&v54, sel_init);
  p_isa = (id *)&v13->super.isa;
  if (!v13)
    goto LABEL_46;
  if (v8)
    v15 = 1376262;
  else
    v15 = 3473414;
  v13->_usesDataProtection = v8;
  v16 = -[SGSqliteDatabaseImpl initWithFilename:flags:error:sgDb:]([SGSqliteDatabaseImpl alloc], "initWithFilename:flags:error:sgDb:", v11, v15, a6, v13);
  v17 = p_isa[1];
  p_isa[1] = v16;

  if (!p_isa[1])
    goto LABEL_34;
  objc_storeStrong(p_isa + 3, a5);
  v18 = (sqlite3 *)objc_msgSend(p_isa[1], "handle");
  if (sqlite3_db_config(v18, 1001, 0, 96, 64) == 5)
  {
    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C3607000, v19, OS_LOG_TYPE_FAULT, "Unable to change SQLite lookaside configuration.", buf, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  function_v2 = sqlite3_create_function_v2(v18, "hasInhumanTag", 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))hasInhumanTag, 0, 0, 0);
  if ((_DWORD)function_v2)
  {
    v21 = function_v2;
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v68 = v21;
      _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "Could not install hasInhumanTag() sqlite function (rc = %i)", buf, 8u);
    }

    if (a6)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v65 = CFSTR("sqliteCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v24;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v66;
      v27 = &v65;
LABEL_32:
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v23;
      v39 = 5;
LABEL_33:
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("SGSqliteDatabaseError"), v39, v37);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_34:
      a6 = 0;
      goto LABEL_47;
    }
    goto LABEL_47;
  }
  v28 = sqlite3_create_function_v2(v18, "tagsHaveEscapedTag", 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))tagsHaveEscapedTag, 0, 0, 0);
  if (!(_DWORD)v28)
  {
    v31 = sqlite3_create_function_v2(v18, "delimitedString", 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))delimitedString, 0, 0, 0);
    if ((_DWORD)v31)
    {
      v32 = v31;
      sgLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v68 = v32;
        _os_log_error_impl(&dword_1C3607000, v33, OS_LOG_TYPE_ERROR, "Could not install delimitedString() sqlite function (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v61 = CFSTR("sqliteCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v62;
        v27 = &v61;
        goto LABEL_32;
      }
      goto LABEL_47;
    }
    v34 = sqlite3_create_function_v2(v18, "firstStringAfterPrefix", 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))firstStringAfterPrefix, 0, 0, 0);
    if ((_DWORD)v34)
    {
      v35 = v34;
      sgLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v68 = v35;
        _os_log_error_impl(&dword_1C3607000, v36, OS_LOG_TYPE_ERROR, "Could not install firstStringAfterPrefix() sqlite function (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v59 = CFSTR("sqliteCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v60;
        v27 = &v59;
        goto LABEL_32;
      }
      goto LABEL_47;
    }
    busy = sqlite3_busy_timeout(v18, 300000);
    if ((_DWORD)busy)
    {
      v41 = busy;
      sgLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v68 = v41;
        _os_log_error_impl(&dword_1C3607000, v42, OS_LOG_TYPE_ERROR, "Sqlite could not install busy timeout. (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v43 = (void *)MEMORY[0x1E0CB35C8];
        v57 = CFSTR("sqliteCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v43;
        v39 = 2;
        goto LABEL_33;
      }
      goto LABEL_47;
    }
    v44 = sqlite3_busy_handler(v18, (int (__cdecl *)(void *, int))wrappedBusyCallbackForTiming, p_isa);
    if ((_DWORD)v44)
    {
      v45 = v44;
      sgLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v68 = v45;
        _os_log_error_impl(&dword_1C3607000, v46, OS_LOG_TYPE_ERROR, "Sqlite could not install busy handler. (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v47 = (void *)MEMORY[0x1E0CB35C8];
        v55 = CFSTR("sqliteCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("SGSqliteDatabaseError"), 6, v49);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
      goto LABEL_47;
    }
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __69__SGSqliteDatabase_initWithFilename_withProtection_sharedLock_error___block_invoke;
    v52[3] = &unk_1E7DB56F0;
    v53 = p_isa;
    objc_msgSend(v53, "runWithWriteLockAcquired:", v52);

LABEL_46:
    a6 = p_isa;
    goto LABEL_47;
  }
  v29 = v28;
  sgLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v68 = v29;
    _os_log_error_impl(&dword_1C3607000, v30, OS_LOG_TYPE_ERROR, "Could not install tagsHaveEscapedTag() sqlite function (rc = %i)", buf, 8u);
  }

  if (a6)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v63 = CFSTR("sqliteCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v24;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v64;
    v27 = &v63;
    goto LABEL_32;
  }
LABEL_47:

  return (SGSqliteDatabase *)a6;
}

- (void)runWithWriteLockAcquired:(id)a3
{
  SGSqliteDatabaseSharedLock *sharedWriterLock;

  sharedWriterLock = self->_sharedWriterLock;
  if (sharedWriterLock)
    -[SGSqliteDatabaseSharedLock runWithLockAcquired:](sharedWriterLock, "runWithLockAcquired:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)closePermanently
{
  -[SGSqliteDatabaseImpl closePermanently](self->_impl, "closePermanently");
}

- (int64_t)lastInsertRowId
{
  return -[SGSqliteDatabaseImpl lastInsertRowId](self->_impl, "lastInsertRowId");
}

- (sqlite3)handle
{
  sqlite3 *v4;
  void *v6;

  v4 = (sqlite3 *)-[SGSqliteDatabaseImpl handle](self->_impl, "handle");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSqliteDatabase.m"), 619, CFSTR("sqlite handle unexpected nil"));

  }
  return v4;
}

- (NSString)filename
{
  return (NSString *)-[SGSqliteDatabaseImpl filename](self->_impl, "filename");
}

- (BOOL)isInMemory
{
  return -[SGSqliteDatabaseImpl isInMemory](self->_impl, "isInMemory");
}

- (BOOL)prepAndRunQuery:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a4;
  v15 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke;
  v16[3] = &unk_1E7DB00F8;
  v17 = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke_2;
  v14[3] = &unk_1E7DACD28;
  v11 = v15;
  v12 = v10;
  LOBYTE(a6) = -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", a3, v16, v14, a6);

  return (char)a6;
}

- (void)_prepAndRunQuery:(id)a3 columns:(id)a4 dictionary:(id)a5 onError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a4;
  v11 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__SGSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke;
  v14[3] = &unk_1E7DB6E80;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", a3, v14, 0, a6);

}

- (BOOL)prepAndRunNonDataQueries:(id)a3 onError:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!-[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 0, 0, v7, (_QWORD)v15))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)updateTable:(id)a3 dictionary:(id)a4 whereClause:(id)a5 onError:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v11, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v14);
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSqliteDatabase.m"), 772, CFSTR("updateTable:dictionary:whereClause: requires nonempty dictionary"));

  }
  v16 = (void *)MEMORY[0x1C3BD4F6C]();
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v15, "_pas_componentsJoinedByString:", CFSTR("=?,"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", CFSTR("=?"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v12)
  {
    objc_msgSend(CFSTR(" WHERE "), "stringByAppendingString:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("UPDATE %@ SET %@%@"), v24, v20, v21);

  }
  else
  {
    v22 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("UPDATE %@ SET %@%@"), v24, v19, &stru_1E7DB83A8);
  }

  objc_autoreleasePoolPop(v16);
  -[SGSqliteDatabase _prepAndRunQuery:columns:dictionary:onError:](self, "_prepAndRunQuery:columns:dictionary:onError:", v22, v15, v11, v13);

}

- (void)insertOrReplaceIntoTable:(id)a3 dictionary:(id)a4 onError:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v9, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSqliteDatabase.m"), 785, CFSTR("insertOrReplaceIntoTable:dictionary: requires nonempty dictionary"));

  }
  v13 = (void *)MEMORY[0x1C3BD4F6C]();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  qmarksSeparatedByCommas(objc_msgSend(v12, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@) VALUES (%@)"), v19, v15, v16);

  objc_autoreleasePoolPop(v13);
  -[SGSqliteDatabase _prepAndRunQuery:columns:dictionary:onError:](self, "_prepAndRunQuery:columns:dictionary:onError:", v17, v12, v9, v10);

}

- (id)selectColumns:(id)a3 fromTable:(id)a4 whereClause:(id)a5 onPrep:(id)a6 onError:(id)a7
{
  return (id)-[SGSqliteDatabaseImpl selectColumns:fromTable:whereClause:onPrep:onError:](self->_impl, "selectColumns:fromTable:whereClause:onPrep:onError:", a3, a4, a5, a6, a7);
}

- (void)writeTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SGSqliteDatabase_writeTransaction___block_invoke;
  v6[3] = &unk_1E7DB7578;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SGSqliteDatabase runWithWriteLockAcquired:](self, "runWithWriteLockAcquired:", v6);

}

- (BOOL)frailWriteTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SGSqliteDatabase_frailWriteTransaction___block_invoke;
  v7[3] = &unk_1E7DADB60;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[SGSqliteDatabase runWithWriteLockAcquired:](self, "runWithWriteLockAcquired:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)frailReadTransaction:(id)a3
{
  return -[SGSqliteDatabaseImpl frailReadTransaction:](self->_impl, "frailReadTransaction:", a3);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSqliteDatabaseImpl filename](self->_impl, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@: %@ <%p>]"), v5, v6, -[SGSqliteDatabaseImpl handle](self->_impl, "handle"));

  return v7;
}

- (BOOL)createSnapshot:(id)a3
{
  return -[SGSqliteDatabaseImpl createSnapshot:](self->_impl, "createSnapshot:", a3);
}

- (unsigned)userVersion
{
  return -[SGSqliteDatabaseImpl userVersion](self->_impl, "userVersion");
}

- (BOOL)setUserVersion:(unsigned int)a3
{
  return -[SGSqliteDatabaseImpl setUserVersion:](self->_impl, "setUserVersion:", *(_QWORD *)&a3);
}

- (int64_t)maxIdForTable:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  int64_t v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__SGSqliteDatabase_maxIdForTable___block_invoke;
  v10[3] = &unk_1E7DB74A0;
  v6 = v4;
  v11 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __34__SGSqliteDatabase_maxIdForTable___block_invoke_2;
  v9[3] = &unk_1E7DB7510;
  v9[4] = &v12;
  -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("SELECT seq FROM sqlite_sequence WHERE name = :tableName"), v10, v9, 0);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)hasTableNamed:(id)a3
{
  return -[SGSqliteDatabaseImpl hasTableNamed:](self->_impl, "hasTableNamed:", a3);
}

- (id)tablesWithColumnNamed:(id)a3
{
  return (id)-[SGSqliteDatabaseImpl tablesWithColumnNamed:](self->_impl, "tablesWithColumnNamed:", a3);
}

- (BOOL)hasColumnOnTable:(id)a3 named:(id)a4
{
  return -[SGSqliteDatabaseImpl hasColumnOnTable:named:](self->_impl, "hasColumnOnTable:named:", a3, a4);
}

- (BOOL)hasIndexNamed:(id)a3
{
  return -[SGSqliteDatabaseImpl hasIndexNamed:](self->_impl, "hasIndexNamed:", a3);
}

- (unint64_t)numberOfRowsInTable:(id)a3
{
  return -[SGSqliteDatabaseImpl numberOfRowsInTable:](self->_impl, "numberOfRowsInTable:", a3);
}

- (id)languageForFTSTable:(id)a3
{
  return (id)-[SGSqliteDatabaseImpl languageForFTSTable:](self->_impl, "languageForFTSTable:", a3);
}

- (void)performIntegrityCheck
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__SGSqliteDatabase_performIntegrityCheck__block_invoke_2;
  v2[3] = &unk_1E7DB77D8;
  v2[4] = self;
  -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("PRAGMA integrity_check"), 0, &__block_literal_global_129, v2);
}

- (unint64_t)pageCount
{
  unint64_t v2;
  _QWORD v4[6];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[5] = &v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__SGSqliteDatabase_pageCount__block_invoke;
  v5[3] = &unk_1E7DB7510;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__SGSqliteDatabase_pageCount__block_invoke_2;
  v4[3] = &unk_1E7DB7788;
  v4[4] = self;
  -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("PRAGMA page_count"), 0, v5, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (unint64_t)freelistCount
{
  unint64_t v2;
  _QWORD v4[6];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[5] = &v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SGSqliteDatabase_freelistCount__block_invoke;
  v5[3] = &unk_1E7DB7510;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SGSqliteDatabase_freelistCount__block_invoke_2;
  v4[3] = &unk_1E7DB7788;
  v4[4] = self;
  -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("PRAGMA freelist_count"), 0, v5, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (unint64_t)_pagesToVacuum
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  unint64_t result;
  NSObject *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[SGSqliteDatabase pageCount](self, "pageCount");
  v4 = -[SGSqliteDatabase freelistCount](self, "freelistCount");
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134218240;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "Calculating pages to vacuum -- pageCount %tu freeCount %tu", (uint8_t *)&v8, 0x16u);
  }

  result = 0;
  if (v4)
  {
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      result = 0;
      if (v3)
      {
        if (v3 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((double)(v3 - v4) / (double)v3 <= 0.85 || v4 > 0x3FF)
          {
            return (unint64_t)((double)v4 * 0.8);
          }
          else
          {
            sgLogHandle();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            {
              v8 = 134218240;
              v9 = v3;
              v10 = 2048;
              v11 = v4;
              _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
                (uint8_t *)&v8,
                0x16u);
            }

            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)vacuumMode
{
  unint64_t v2;
  _QWORD v4[6];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[5] = &v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SGSqliteDatabase_vacuumMode__block_invoke;
  v5[3] = &unk_1E7DB7510;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SGSqliteDatabase_vacuumMode__block_invoke_2;
  v4[3] = &unk_1E7DB7788;
  v4[4] = self;
  -[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("PRAGMA auto_vacuum"), 0, v5, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)vacuum
{
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  _xpc_activity_s *v18;
  xpc_activity_state_t state;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL8 v25;
  NSObject *v26;
  SGSqliteDatabase *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  _QWORD v33[6];
  uint8_t v34[4];
  SGSqliteDatabase *v35;
  __int16 v36;
  _BYTE v37[18];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (self->_usesDataProtection && objc_msgSend(MEMORY[0x1E0D81590], "lockState") - 1 <= 1)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "Will not vacuum db %@ due to device lock state", (uint8_t *)&buf, 0xCu);
    }

    return;
  }
  v4 = -[SGSqliteDatabase _pagesToVacuum](self, "_pagesToVacuum");
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "Called to vacuum %tu pages", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    v6 = -[SGSqliteDatabase vacuumMode](self, "vacuumMode");
    v7 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__13207;
      v41 = __Block_byref_object_dispose__13208;
      v42 = 0;
      if (v6 == 2)
        goto LABEL_11;
      v23 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __26__SGSqliteDatabase_vacuum__block_invoke;
      v33[3] = &unk_1E7DB78A0;
      v33[4] = self;
      v33[5] = &buf;
      -[SGSqliteDatabase runWithWriteLockAcquired:](self, "runWithWriteLockAcquired:", v33);
      if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        if (v7)
        {
LABEL_11:
          sgLogHandle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v4 + 499) / 0x1F4);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v34 = 134218498;
            v35 = (SGSqliteDatabase *)v4;
            v36 = 2112;
            *(_QWORD *)v37 = v9;
            *(_WORD *)&v37[8] = 2112;
            *(_QWORD *)&v37[10] = self;
            _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "performing INCREMENTAL VACUUM to free %lu pages with %@ iterations for db: %@", v34, 0x20u);

          }
          if (v4 + 499 >= 0x1F4)
          {
            v10 = 0;
            if ((v4 + 499) / 0x1F4 <= 1)
              v11 = 1;
            else
              v11 = (v4 + 499) / 0x1F4;
            v12 = v4;
            while (1)
            {
              if (v12 >= 0x1F4)
                v13 = 500;
              else
                v13 = v12;
              sgLogHandle();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v34 = 134218496;
                v35 = (SGSqliteDatabase *)v13;
                v36 = 1024;
                *(_DWORD *)v37 = v10;
                *(_WORD *)&v37[4] = 2048;
                *(_QWORD *)&v37[6] = v4;
                _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "Performing incremental vacuum for %tu pages on iteration %d for total pages to free %tu", v34, 0x1Cu);
              }

              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA incremental_vacuum(%lu)"), v13);
              v30[0] = MEMORY[0x1E0C809B0];
              v30[1] = 3221225472;
              v30[2] = __26__SGSqliteDatabase_vacuum__block_invoke_152;
              v30[3] = &unk_1E7DB6A30;
              v30[4] = self;
              v16 = v15;
              v31 = v16;
              -[SGSqliteDatabase runWithWriteLockAcquired:](self, "runWithWriteLockAcquired:", v30);
              +[SGXPCActivityManager sharedInstance](SGXPCActivityManager, "sharedInstance");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "activityForActivityId:", 1);
              v18 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();

              v12 -= v13;
              if (v18)
              {
                state = xpc_activity_get_state(v18);
                sgLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", state);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v34 = 138412802;
                  v35 = (SGSqliteDatabase *)v18;
                  v36 = 2112;
                  *(_QWORD *)v37 = v21;
                  *(_WORD *)&v37[8] = 2112;
                  *(_QWORD *)&v37[10] = v22;
                  _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "We have a vacuum activity %@ with activity state %@ after %@ batches", v34, 0x20u);

                }
                if (xpc_activity_should_defer(v18))
                  break;
              }

              if (v11 == ++v10)
                goto LABEL_37;
            }
            v25 = xpc_activity_set_state(v18, 3);
            sgLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
              v27 = (SGSqliteDatabase *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 - v12);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v34 = 138412802;
              v35 = v27;
              v36 = 2112;
              *(_QWORD *)v37 = v28;
              *(_WORD *)&v37[8] = 2112;
              *(_QWORD *)&v37[10] = v29;
              _os_log_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEFAULT, "We got back that we should defer the vacuuming activity after %@ iterations and having vacuumed %@ pages with deferral success %@", v34, 0x20u);

            }
          }
          goto LABEL_37;
        }
        sgLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v34 = 138412290;
          v35 = self;
          _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_INFO, "performing FULL VACUUM to make INCREMENTAL effected for db: %@", v34, 0xCu);
        }

        v32[0] = v23;
        v32[1] = 3221225472;
        v32[2] = __26__SGSqliteDatabase_vacuum__block_invoke_146;
        v32[3] = &unk_1E7DB56F0;
        v32[4] = self;
        -[SGSqliteDatabase runWithWriteLockAcquired:](self, "runWithWriteLockAcquired:", v32);
      }
LABEL_37:
      _Block_object_dispose(&buf, 8);

    }
  }
}

- (void)optimize:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__SGSqliteDatabase_optimize___block_invoke;
  v3[3] = &unk_1E7DB6368;
  v3[4] = self;
  v3[5] = a3;
  -[SGSqliteDatabase runWithWriteLockAcquired:](self, "runWithWriteLockAcquired:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWriterLock, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

void __29__SGSqliteDatabase_optimize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA optimize(%llX)"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "prepAndRunSQL:onPrep:onRow:onError:", v3, 0, 0, 0);

  objc_autoreleasePoolPop(v2);
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__SGSqliteDatabase_vacuum__block_invoke_2;
  v2[3] = &unk_1E7DB7788;
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("PRAGMA auto_vacuum=2"), 0, 0, v2);
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_146(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__SGSqliteDatabase_vacuum__block_invoke_2_149;
  v3[3] = &unk_1E7DB77D8;
  v3[4] = v1;
  return objc_msgSend(v1, "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("VACUUM"), 0, 0, v3);
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_152(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__SGSqliteDatabase_vacuum__block_invoke_2_153;
  v4[3] = &unk_1E7DB77D8;
  v4[4] = v2;
  return objc_msgSend(v2, "prepAndRunSQL:onPrep:onRow:onError:", v1, 0, 0, v4);
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_2_153(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "failed to incremental vacuum db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_2_149(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "failed to vacuum db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "failed to set auto_vacuum to INCREMENTAL for db: %@. error: %@", (uint8_t *)&v8, 0x16u);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __30__SGSqliteDatabase_vacuumMode__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __30__SGSqliteDatabase_vacuumMode__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "failed to get auto-vacuum mode from db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __33__SGSqliteDatabase_freelistCount__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __33__SGSqliteDatabase_freelistCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "failed to get freelist_count from db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  return *MEMORY[0x1E0D81788];
}

uint64_t __29__SGSqliteDatabase_pageCount__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __29__SGSqliteDatabase_pageCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "failed to get page_count from db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  return *MEMORY[0x1E0D81788];
}

uint64_t __41__SGSqliteDatabase_performIntegrityCheck__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("Error: failed to run integrity_check on %@: %@"), *(_QWORD *)(a1 + 32), v4);

  v6 = objc_retainAutorelease(v5);
  puts((const char *)objc_msgSend(v6, "UTF8String"));

  return *MEMORY[0x1E0D81788];
}

uint64_t __41__SGSqliteDatabase_performIntegrityCheck__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v2));
  puts((const char *)objc_msgSend(v3, "UTF8String"));

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v4;
}

uint64_t __34__SGSqliteDatabase_maxIdForTable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":tableName", *(_QWORD *)(a1 + 32));
}

uint64_t __34__SGSqliteDatabase_maxIdForTable___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __42__SGSqliteDatabase_frailWriteTransaction___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "frailWriteTransaction:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __37__SGSqliteDatabase_writeTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "writeTransaction:", *(_QWORD *)(a1 + 40));
}

void __64__SGSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v9)
      {
        objc_msgSend(v3, "bindParamToNull:", ++v4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "bindParam:toNSString:", ++v4, v7);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "bindParam:toNSData:", ++v4, v7);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v10 = objc_retainAutorelease(v7);
              v11 = (const char *)objc_msgSend(v10, "objCType");
              if (!strcmp(v11, "d") || !strcmp(v11, "f"))
                objc_msgSend(v3, "bindParam:toDoubleAsNSNumber:", ++v4, v10);
              else
                objc_msgSend(v3, "bindParam:toInt64AsNSNumber:", ++v4, v10);
            }
            else
            {
              if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1EF8E3780))
              {
                v14 = (void *)MEMORY[0x1E0C99DA0];
                v21 = CFSTR("type");
                objc_msgSend((id)objc_opt_class(), "description");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v15;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = CFSTR("Could not insert this type into sqlite");
                goto LABEL_21;
              }
              v20 = 0;
              objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v20);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v20;
              if (v13)
              {
                v18 = v13;
                v14 = (void *)MEMORY[0x1E0C99DA0];
                v23[0] = CFSTR("type");
                objc_msgSend((id)objc_opt_class(), "description");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v23[1] = CFSTR("error");
                v24[0] = v15;
                v24[1] = v18;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = CFSTR("Could not securely code this type into SQLite");
LABEL_21:
                objc_msgSend(v14, "exceptionWithName:reason:userInfo:", CFSTR("TypeError"), v17, v16);
                v19 = (id)objc_claimAutoreleasedReturnValue();

                objc_exception_throw(v19);
              }
              objc_msgSend(v3, "bindParam:toNSData:", ++v4, v12);

            }
          }
        }
      }

      objc_autoreleasePoolPop(v5);
    }
    while (objc_msgSend(*(id *)(a1 + 32), "count") > v4);
  }

}

uint64_t __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke(uint64_t result, id a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(objc_retainAutorelease(a2), "stmt"));
  return result;
}

uint64_t __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(objc_retainAutorelease(a2), "stmt"));
  else
    return *MEMORY[0x1E0D81780];
}

uint64_t __43__SGSqliteDatabase_runQuery_onRow_onError___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&runQuery_onRow_onError__machTimebaseInfo);
}

uint64_t __69__SGSqliteDatabase_initWithFilename_withProtection_sharedLock_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunSQL:onPrep:onRow:onError:", CFSTR("PRAGMA auto_vacuum=INCREMENTAL"), 0, 0, &__block_literal_global_13318);
}

uint64_t __69__SGSqliteDatabase_initWithFilename_withProtection_sharedLock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "unable to set auto_vacuum to INCREMENTAL: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

+ (SGSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4
{
  id v5;
  SGSqliteDatabase *v6;

  v5 = a3;
  v6 = -[SGSqliteDatabase initWithFilename:withProtection:sharedLock:error:]([SGSqliteDatabase alloc], "initWithFilename:withProtection:sharedLock:error:", v5, 0, 0, a4);

  return v6;
}

+ (id)sqliteDatabaseInMemoryWithError:(id *)a3
{
  return -[SGSqliteDatabase initWithFilename:withProtection:sharedLock:error:]([SGSqliteDatabase alloc], "initWithFilename:withProtection:sharedLock:error:", CFSTR(":memory:"), 0, 0, a3);
}

+ (BOOL)isInMemoryPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR(":memory:")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "containsString:", CFSTR("mode=memory"));

  return v4;
}

+ (id)inMemoryPath
{
  return CFSTR(":memory:");
}

+ (id)randomlyNamedInMemoryPathWithBaseName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("file:"), "stringByAppendingString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("?mode=memory&cache=shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v9;
}

+ (void)truncateDatabaseAtPath:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", a3);
}

+ (int)bindParamToNull:(sqlite3_stmt *)a3 name:(const char *)a4
{
  int v5;

  v5 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_null(a3, v5);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 int:(int)a5
{
  int v7;

  v7 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_int(a3, v7, a5);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 int64:(int64_t)a5
{
  int v7;

  v7 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_int64(a3, v7, a5);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 double:(double)a5
{
  int v7;

  v7 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_double(a3, v7, a5);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 nsstring:(id)a5
{
  id v7;
  id v8;
  const char *v9;

  v7 = a5;
  LODWORD(a4) = _indexForBindParam(a3, (char *)a4);
  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  return sqlite3_bind_text(a3, (int)a4, v9, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 nsdata:(id)a5
{
  id v7;
  int v8;

  v7 = a5;
  v8 = _indexForBindParam(a3, (char *)a4);
  LODWORD(a4) = sqlite3_bind_nsdata(a3, v8, v7);

  return (int)a4;
}

- (id)freeSpace
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[8];
  uint64_t v16;

  if (-[SGSqliteDatabase isInMemory](self, "isInMemory"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSqliteDatabase filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "attributesOfFileSystemForPath:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v7)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "Cannot calculate free space", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v8;
        v9 = v8;
        goto LABEL_7;
      }
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "Free space attribute is not an NSNumber", v13, 2u);
      }

    }
    else
    {
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "Free space attribute is missing", v14, 2u);
      }

      v8 = 0;
    }
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)dbErrorWithCode:(unint64_t)a3 sqliteReturnValue:(int)a4 lastErrno:(int)a5 query:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  if ((unint64_t)objc_msgSend(v10, "length") >= 0x65)
  {
    objc_msgSend(v10, "substringToIndex:", 100);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("..."));
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_errmsg(-[SGSqliteDatabase handle](self, "handle")));
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Error(%d): %@"), v7, v15);

  if (v10)
  {
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" (SQL: %@)"), v10);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  if (a3 != 1 && !a5)
  {
    v29 = 0;
    if (sqlite3_file_control(-[SGSqliteDatabase handle](self, "handle"), 0, 4, &v29))
      goto LABEL_11;
    a5 = v29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(". May be due to previous POSIX error %@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
    goto LABEL_12;
  }
LABEL_11:
  v18 = 0;
LABEL_12:
  -[SGSqliteDatabase freeSpace](self, "freeSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setNumberStyle:", 1);
    objc_msgSend(v21, "setUsesGroupingSeparator:", 1);
    objc_msgSend(v21, "setGroupingSeparator:", CFSTR(","));
    objc_msgSend(v21, "setUsesSignificantDigits:", 1);
    objc_msgSend(v21, "setMinimumSignificantDigits:", 1);
    objc_msgSend(v21, "setMaximumSignificantDigits:", 1);
    objc_msgSend(v21, "stringFromNumber:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(". Free space (rounded to 1 significant digit): %@ bytes"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v23;
  }
  v24 = (void *)objc_opt_new();
  v25 = v24;
  if (v10)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, CFSTR("sql"));
  if (v18)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB3388]);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v16, CFSTR("reason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("sqliteCode"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGSqliteDatabaseError"), a3, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v11);
  return v27;
}

- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v7 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setErrorCode:", v7);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackScalarForMessage:", v12);

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v12, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@.%@"), v15, v16);

  objc_msgSend(v12, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[SGSqliteDatabase dbErrorWithCode:sqliteReturnValue:lastErrno:query:](self, "dbErrorWithCode:sqliteReturnValue:lastErrno:query:", a3, v7, 0, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "SQLite error: %@", buf, 0xCu);
  }

  v21 = -[SGSqliteDatabase _handle_sqlite_error_code:error:onError:](self, "_handle_sqlite_error_code:error:onError:", v7, v19, v10);
  return v21;
}

- (id)corruptionMarkerPath
{
  void *v2;
  void *v3;

  -[SGSqliteDatabase filename](self, "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSqliteDatabase corruptionMarkerPathForPath:](SGSqliteDatabase, "corruptionMarkerPathForPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)placeCorruptionMarker
{
  int has_internal_diagnostics;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (has_internal_diagnostics)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "db corruption detected, leaving behind marker so we recover", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "db corruption detected, leaving behind marker so we recover", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSqliteDatabase corruptionMarkerPath](self, "corruptionMarkerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createFileAtPath:contents:attributes:", v7, 0, 0);

}

- (BOOL)_abortDueToSqliteError:(id)a3 onError:(id)a4
{
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("reason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v14, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  v7 = (uint64_t (**)(_QWORD, _QWORD))v6;
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  v9 = (((uint64_t (**)(_QWORD, id))v7)[2](v7, v5) & 1) == 0;
  objc_autoreleasePoolPop(v8);

  return v9;
}

- (BOOL)_handle_UNKNOWN_ERROR:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_FULL:(id)a3 onError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "suggestd exiting due to lack of disk space", v9, 2u);
  }

  SGDExit(2);
}

- (BOOL)_handle_SQLITE_CORRUPT:(id)a3 onError:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (!-[SGSqliteDatabase isInMemory](self, "isInMemory"))
    -[SGSqliteDatabase placeCorruptionMarker](self, "placeCorruptionMarker");
  v8 = -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", v6, v7);

  return v8;
}

- (BOOL)_handle_SQLITE_CORRUPT_VTAB:(id)a3 onError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "suggestd exiting due to corrupt SQL vtable.", v9, 2u);
  }

  SGDExit(4);
}

- (BOOL)_handle_SQLITE_NOTADB:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_CORRUPT:onError:](self, "_handle_SQLITE_CORRUPT:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_SHORT_READ:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_CORRUPT:onError:](self, "_handle_SQLITE_CORRUPT:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CANTOPEN:(id)a3 onError:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (*__error() == 28)
    -[SGSqliteDatabase _handle_SQLITE_FULL:onError:](self, "_handle_SQLITE_FULL:onError:", v6, v7);
  v8 = -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", v6, v7);

  return v8;
}

- (BOOL)_handle_SQLITE_CANTOPEN_NOTEMPDIR:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_CANTOPEN:onError:](self, "_handle_SQLITE_CANTOPEN:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CANTOPEN_ISDIR:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_CANTOPEN:onError:](self, "_handle_SQLITE_CANTOPEN:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CANTOPEN_FULLPATH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_CANTOPEN:onError:](self, "_handle_SQLITE_CANTOPEN:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CANTOPEN_CONVPATH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_CANTOPEN:onError:](self, "_handle_SQLITE_CANTOPEN:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR:(id)a3 onError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unsigned int v9;
  __CFString *v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D81590];
  v8 = a4;
  v9 = objc_msgSend(v7, "lockState");
  if (v9 > 3)
    v10 = 0;
  else
    v10 = off_1E7DB76D8[v9];
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGSqliteDatabase IOERR (device lock state %@): %@", (uint8_t *)&v14, 0x16u);
  }

  v12 = -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", v6, v8);
  return v12;
}

- (BOOL)_handle_SQLITE_IOERR_SHMSIZE:(id)a3 onError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sql"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsString:", CFSTR("PRAGMA journal_mode"));

  if (v10)
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "suggestd exiting due to lack of disk space while setting journal_mode.", v14, 2u);
    }

    SGDExit(2);
  }
  v11 = -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", v6, v7);

  return v11;
}

- (BOOL)_handle_SQLITE_IOERR_READ:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_WRITE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_FSYNC:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_DIR_FSYNC:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_TRUNCATE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_FSTAT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_UNLOCK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_RDLOCK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_DELETE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_BLOCKED:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_NOMEM:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_ACCESS:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_LOCK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_CLOSE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_DIR_CLOSE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_SHMOPEN:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_SHMLOCK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_SHMMAP:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_SEEK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_DELETE_NOENT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_MMAP:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_GETTEMPPATH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_CONVPATH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_VNODE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_IOERR_AUTH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_ERROR:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_INTERNAL:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_PERM:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_ABORT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_BUSY:(id)a3 onError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "exiting due to repeated SQLITE_BUSY", v9, 2u);
  }

  SGDExit(5);
}

- (BOOL)_handle_SQLITE_LOCKED:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_NOMEM:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_READONLY:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_INTERRUPT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_NOTFOUND:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_PROTOCOL:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_EMPTY:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_SCHEMA:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_TOOBIG:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_MISMATCH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_MISUSE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_NOLFS:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_AUTH:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_FORMAT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_RANGE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_NOTICE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_WARNING:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_LOCKED_SHAREDCACHE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_BUSY_RECOVERY:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_BUSY_SNAPSHOT:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_READONLY_RECOVERY:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_READONLY_CANTLOCK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_READONLY_ROLLBACK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_READONLY_DBMOVED:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_ABORT_ROLLBACK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_CHECK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_COMMITHOOK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FOREIGNKEY:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FUNCTION:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_NOTNULL:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_PRIMARYKEY:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_TRIGGER:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_UNIQUE:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_VTAB:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_ROWID:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_WAL:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_WARNING_AUTOINDEX:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_SQLITE_AUTH_USER:(id)a3 onError:(id)a4
{
  return -[SGSqliteDatabase _abortDueToSqliteError:onError:](self, "_abortDueToSqliteError:onError:", a3, a4);
}

- (BOOL)_handle_sqlite_error_code:(int)a3 error:(id)a4 onError:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;

  v8 = a4;
  v9 = a5;
  if (a3 > 530)
  {
    if (a3 > 2569)
    {
      if (a3 > 4873)
      {
        if (a3 > 6153)
        {
          if (a3 <= 6665)
          {
            if (a3 == 6154)
            {
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_MMAP:onError:](self, "_handle_SQLITE_IOERR_MMAP:onError:", v8, v9);
              goto LABEL_146;
            }
            if (a3 == 6410)
            {
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_GETTEMPPATH:onError:](self, "_handle_SQLITE_IOERR_GETTEMPPATH:onError:", v8, v9);
              goto LABEL_146;
            }
          }
          else
          {
            switch(a3)
            {
              case 6666:
                v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_CONVPATH:onError:](self, "_handle_SQLITE_IOERR_CONVPATH:onError:", v8, v9);
                goto LABEL_146;
              case 6922:
                v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_VNODE:onError:](self, "_handle_SQLITE_IOERR_VNODE:onError:", v8, v9);
                goto LABEL_146;
              case 7178:
                v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_AUTH:onError:](self, "_handle_SQLITE_IOERR_AUTH:onError:", v8, v9);
                goto LABEL_146;
            }
          }
        }
        else if (a3 <= 5385)
        {
          if (a3 == 4874)
          {
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_SHMSIZE:onError:](self, "_handle_SQLITE_IOERR_SHMSIZE:onError:", v8, v9);
            goto LABEL_146;
          }
          if (a3 == 5130)
          {
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_SHMLOCK:onError:](self, "_handle_SQLITE_IOERR_SHMLOCK:onError:", v8, v9);
            goto LABEL_146;
          }
        }
        else
        {
          switch(a3)
          {
            case 5386:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_SHMMAP:onError:](self, "_handle_SQLITE_IOERR_SHMMAP:onError:", v8, v9);
              goto LABEL_146;
            case 5642:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_SEEK:onError:](self, "_handle_SQLITE_IOERR_SEEK:onError:", v8, v9);
              goto LABEL_146;
            case 5898:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_DELETE_NOENT:onError:](self, "_handle_SQLITE_IOERR_DELETE_NOENT:onError:", v8, v9);
              goto LABEL_146;
          }
        }
      }
      else if (a3 > 3593)
      {
        if (a3 <= 4105)
        {
          if (a3 == 3594)
          {
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_CHECKRESERVEDLOCK:onError:](self, "_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:onError:", v8, v9);
            goto LABEL_146;
          }
          if (a3 == 3850)
          {
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_LOCK:onError:](self, "_handle_SQLITE_IOERR_LOCK:onError:", v8, v9);
            goto LABEL_146;
          }
        }
        else
        {
          switch(a3)
          {
            case 4106:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_CLOSE:onError:](self, "_handle_SQLITE_IOERR_CLOSE:onError:", v8, v9);
              goto LABEL_146;
            case 4362:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_DIR_CLOSE:onError:](self, "_handle_SQLITE_IOERR_DIR_CLOSE:onError:", v8, v9);
              goto LABEL_146;
            case 4618:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_SHMOPEN:onError:](self, "_handle_SQLITE_IOERR_SHMOPEN:onError:", v8, v9);
              goto LABEL_146;
          }
        }
      }
      else if (a3 <= 2825)
      {
        if (a3 == 2570)
        {
          v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_DELETE:onError:](self, "_handle_SQLITE_IOERR_DELETE:onError:", v8, v9);
          goto LABEL_146;
        }
        if (a3 == 2579)
        {
          v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_ROWID:onError:](self, "_handle_SQLITE_CONSTRAINT_ROWID:onError:", v8, v9);
          goto LABEL_146;
        }
      }
      else
      {
        switch(a3)
        {
          case 2826:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_BLOCKED:onError:](self, "_handle_SQLITE_IOERR_BLOCKED:onError:", v8, v9);
            goto LABEL_146;
          case 3082:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_NOMEM:onError:](self, "_handle_SQLITE_IOERR_NOMEM:onError:", v8, v9);
            goto LABEL_146;
          case 3338:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_ACCESS:onError:](self, "_handle_SQLITE_IOERR_ACCESS:onError:", v8, v9);
            goto LABEL_146;
        }
      }
    }
    else if (a3 > 1289)
    {
      if (a3 > 1810)
      {
        if (a3 <= 2066)
        {
          if (a3 == 1811)
          {
            v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_TRIGGER:onError:](self, "_handle_SQLITE_CONSTRAINT_TRIGGER:onError:", v8, v9);
            goto LABEL_146;
          }
          if (a3 == 2058)
          {
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_UNLOCK:onError:](self, "_handle_SQLITE_IOERR_UNLOCK:onError:", v8, v9);
            goto LABEL_146;
          }
        }
        else
        {
          switch(a3)
          {
            case 2067:
              v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_UNIQUE:onError:](self, "_handle_SQLITE_CONSTRAINT_UNIQUE:onError:", v8, v9);
              goto LABEL_146;
            case 2314:
              v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_RDLOCK:onError:](self, "_handle_SQLITE_IOERR_RDLOCK:onError:", v8, v9);
              goto LABEL_146;
            case 2323:
              v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_VTAB:onError:](self, "_handle_SQLITE_CONSTRAINT_VTAB:onError:", v8, v9);
              goto LABEL_146;
          }
        }
      }
      else if (a3 <= 1545)
      {
        if (a3 == 1290)
        {
          v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_DIR_FSYNC:onError:](self, "_handle_SQLITE_IOERR_DIR_FSYNC:onError:", v8, v9);
          goto LABEL_146;
        }
        if (a3 == 1299)
        {
          v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_NOTNULL:onError:](self, "_handle_SQLITE_CONSTRAINT_NOTNULL:onError:", v8, v9);
          goto LABEL_146;
        }
      }
      else
      {
        switch(a3)
        {
          case 1546:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_TRUNCATE:onError:](self, "_handle_SQLITE_IOERR_TRUNCATE:onError:", v8, v9);
            goto LABEL_146;
          case 1555:
            v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_PRIMARYKEY:onError:](self, "_handle_SQLITE_CONSTRAINT_PRIMARYKEY:onError:", v8, v9);
            goto LABEL_146;
          case 1802:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_FSTAT:onError:](self, "_handle_SQLITE_IOERR_FSTAT:onError:", v8, v9);
            goto LABEL_146;
        }
      }
    }
    else if (a3 > 786)
    {
      if (a3 <= 1033)
      {
        if (a3 == 787)
        {
          v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_FOREIGNKEY:onError:](self, "_handle_SQLITE_CONSTRAINT_FOREIGNKEY:onError:", v8, v9);
          goto LABEL_146;
        }
        if (a3 == 1032)
        {
          v10 = -[SGSqliteDatabase _handle_SQLITE_READONLY_DBMOVED:onError:](self, "_handle_SQLITE_READONLY_DBMOVED:onError:", v8, v9);
          goto LABEL_146;
        }
      }
      else
      {
        switch(a3)
        {
          case 1034:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_FSYNC:onError:](self, "_handle_SQLITE_IOERR_FSYNC:onError:", v8, v9);
            goto LABEL_146;
          case 1038:
            v10 = -[SGSqliteDatabase _handle_SQLITE_CANTOPEN_CONVPATH:onError:](self, "_handle_SQLITE_CANTOPEN_CONVPATH:onError:", v8, v9);
            goto LABEL_146;
          case 1043:
            v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_FUNCTION:onError:](self, "_handle_SQLITE_CONSTRAINT_FUNCTION:onError:", v8, v9);
            goto LABEL_146;
        }
      }
    }
    else if (a3 <= 775)
    {
      if (a3 == 531)
      {
        v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_COMMITHOOK:onError:](self, "_handle_SQLITE_CONSTRAINT_COMMITHOOK:onError:", v8, v9);
        goto LABEL_146;
      }
      if (a3 == 539)
      {
        v10 = -[SGSqliteDatabase _handle_SQLITE_NOTICE_RECOVER_ROLLBACK:onError:](self, "_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:onError:", v8, v9);
        goto LABEL_146;
      }
    }
    else
    {
      switch(a3)
      {
        case 776:
          v10 = -[SGSqliteDatabase _handle_SQLITE_READONLY_ROLLBACK:onError:](self, "_handle_SQLITE_READONLY_ROLLBACK:onError:", v8, v9);
          goto LABEL_146;
        case 778:
          v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_WRITE:onError:](self, "_handle_SQLITE_IOERR_WRITE:onError:", v8, v9);
          goto LABEL_146;
        case 782:
          v10 = -[SGSqliteDatabase _handle_SQLITE_CANTOPEN_FULLPATH:onError:](self, "_handle_SQLITE_CANTOPEN_FULLPATH:onError:", v8, v9);
          goto LABEL_146;
      }
    }
LABEL_143:
    if (a3 >= 0x100)
      v10 = -[SGSqliteDatabase _handle_sqlite_error_code:error:onError:](self, "_handle_sqlite_error_code:error:onError:", a3, v8, v9);
    else
      v10 = -[SGSqliteDatabase _handle_UNKNOWN_ERROR:onError:](self, "_handle_UNKNOWN_ERROR:onError:", v8, v9);
  }
  else
  {
    switch(a3)
    {
      case 1:
        v10 = -[SGSqliteDatabase _handle_SQLITE_ERROR:onError:](self, "_handle_SQLITE_ERROR:onError:", v8, v9);
        break;
      case 2:
        v10 = -[SGSqliteDatabase _handle_SQLITE_INTERNAL:onError:](self, "_handle_SQLITE_INTERNAL:onError:", v8, v9);
        break;
      case 3:
        v10 = -[SGSqliteDatabase _handle_SQLITE_PERM:onError:](self, "_handle_SQLITE_PERM:onError:", v8, v9);
        break;
      case 4:
        v10 = -[SGSqliteDatabase _handle_SQLITE_ABORT:onError:](self, "_handle_SQLITE_ABORT:onError:", v8, v9);
        break;
      case 5:
        v10 = -[SGSqliteDatabase _handle_SQLITE_BUSY:onError:](self, "_handle_SQLITE_BUSY:onError:", v8, v9);
        break;
      case 6:
        v10 = -[SGSqliteDatabase _handle_SQLITE_LOCKED:onError:](self, "_handle_SQLITE_LOCKED:onError:", v8, v9);
        break;
      case 7:
        v10 = -[SGSqliteDatabase _handle_SQLITE_NOMEM:onError:](self, "_handle_SQLITE_NOMEM:onError:", v8, v9);
        break;
      case 8:
        v10 = -[SGSqliteDatabase _handle_SQLITE_READONLY:onError:](self, "_handle_SQLITE_READONLY:onError:", v8, v9);
        break;
      case 9:
        v10 = -[SGSqliteDatabase _handle_SQLITE_INTERRUPT:onError:](self, "_handle_SQLITE_INTERRUPT:onError:", v8, v9);
        break;
      case 10:
        v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR:onError:](self, "_handle_SQLITE_IOERR:onError:", v8, v9);
        break;
      case 11:
        v10 = -[SGSqliteDatabase _handle_SQLITE_CORRUPT:onError:](self, "_handle_SQLITE_CORRUPT:onError:", v8, v9);
        break;
      case 12:
        v10 = -[SGSqliteDatabase _handle_SQLITE_NOTFOUND:onError:](self, "_handle_SQLITE_NOTFOUND:onError:", v8, v9);
        break;
      case 13:
        v10 = -[SGSqliteDatabase _handle_SQLITE_FULL:onError:](self, "_handle_SQLITE_FULL:onError:", v8, v9);
        break;
      case 14:
        v10 = -[SGSqliteDatabase _handle_SQLITE_CANTOPEN:onError:](self, "_handle_SQLITE_CANTOPEN:onError:", v8, v9);
        break;
      case 15:
        v10 = -[SGSqliteDatabase _handle_SQLITE_PROTOCOL:onError:](self, "_handle_SQLITE_PROTOCOL:onError:", v8, v9);
        break;
      case 16:
        v10 = -[SGSqliteDatabase _handle_SQLITE_EMPTY:onError:](self, "_handle_SQLITE_EMPTY:onError:", v8, v9);
        break;
      case 17:
        v10 = -[SGSqliteDatabase _handle_SQLITE_SCHEMA:onError:](self, "_handle_SQLITE_SCHEMA:onError:", v8, v9);
        break;
      case 18:
        v10 = -[SGSqliteDatabase _handle_SQLITE_TOOBIG:onError:](self, "_handle_SQLITE_TOOBIG:onError:", v8, v9);
        break;
      case 19:
        v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT:onError:](self, "_handle_SQLITE_CONSTRAINT:onError:", v8, v9);
        break;
      case 20:
        v10 = -[SGSqliteDatabase _handle_SQLITE_MISMATCH:onError:](self, "_handle_SQLITE_MISMATCH:onError:", v8, v9);
        break;
      case 21:
        v10 = -[SGSqliteDatabase _handle_SQLITE_MISUSE:onError:](self, "_handle_SQLITE_MISUSE:onError:", v8, v9);
        break;
      case 22:
        v10 = -[SGSqliteDatabase _handle_SQLITE_NOLFS:onError:](self, "_handle_SQLITE_NOLFS:onError:", v8, v9);
        break;
      case 23:
        v10 = -[SGSqliteDatabase _handle_SQLITE_AUTH:onError:](self, "_handle_SQLITE_AUTH:onError:", v8, v9);
        break;
      case 24:
        v10 = -[SGSqliteDatabase _handle_SQLITE_FORMAT:onError:](self, "_handle_SQLITE_FORMAT:onError:", v8, v9);
        break;
      case 25:
        v10 = -[SGSqliteDatabase _handle_SQLITE_RANGE:onError:](self, "_handle_SQLITE_RANGE:onError:", v8, v9);
        break;
      case 26:
        v10 = -[SGSqliteDatabase _handle_SQLITE_NOTADB:onError:](self, "_handle_SQLITE_NOTADB:onError:", v8, v9);
        break;
      case 27:
        v10 = -[SGSqliteDatabase _handle_SQLITE_NOTICE:onError:](self, "_handle_SQLITE_NOTICE:onError:", v8, v9);
        break;
      case 28:
        v10 = -[SGSqliteDatabase _handle_SQLITE_WARNING:onError:](self, "_handle_SQLITE_WARNING:onError:", v8, v9);
        break;
      default:
        switch(a3)
        {
          case 261:
            v10 = -[SGSqliteDatabase _handle_SQLITE_BUSY_RECOVERY:onError:](self, "_handle_SQLITE_BUSY_RECOVERY:onError:", v8, v9);
            break;
          case 262:
            v10 = -[SGSqliteDatabase _handle_SQLITE_LOCKED_SHAREDCACHE:onError:](self, "_handle_SQLITE_LOCKED_SHAREDCACHE:onError:", v8, v9);
            break;
          case 263:
          case 265:
          case 268:
          case 269:
          case 271:
          case 272:
          case 273:
          case 274:
          case 276:
          case 277:
          case 278:
          case 280:
          case 281:
          case 282:
            goto LABEL_143;
          case 264:
            v10 = -[SGSqliteDatabase _handle_SQLITE_READONLY_RECOVERY:onError:](self, "_handle_SQLITE_READONLY_RECOVERY:onError:", v8, v9);
            break;
          case 266:
            v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_READ:onError:](self, "_handle_SQLITE_IOERR_READ:onError:", v8, v9);
            break;
          case 267:
            v10 = -[SGSqliteDatabase _handle_SQLITE_CORRUPT_VTAB:onError:](self, "_handle_SQLITE_CORRUPT_VTAB:onError:", v8, v9);
            break;
          case 270:
            v10 = -[SGSqliteDatabase _handle_SQLITE_CANTOPEN_NOTEMPDIR:onError:](self, "_handle_SQLITE_CANTOPEN_NOTEMPDIR:onError:", v8, v9);
            break;
          case 275:
            v10 = -[SGSqliteDatabase _handle_SQLITE_CONSTRAINT_CHECK:onError:](self, "_handle_SQLITE_CONSTRAINT_CHECK:onError:", v8, v9);
            break;
          case 279:
            v10 = -[SGSqliteDatabase _handle_SQLITE_AUTH_USER:onError:](self, "_handle_SQLITE_AUTH_USER:onError:", v8, v9);
            break;
          case 283:
            v10 = -[SGSqliteDatabase _handle_SQLITE_NOTICE_RECOVER_WAL:onError:](self, "_handle_SQLITE_NOTICE_RECOVER_WAL:onError:", v8, v9);
            break;
          case 284:
            v10 = -[SGSqliteDatabase _handle_SQLITE_WARNING_AUTOINDEX:onError:](self, "_handle_SQLITE_WARNING_AUTOINDEX:onError:", v8, v9);
            break;
          default:
            switch(a3)
            {
              case 516:
                v10 = -[SGSqliteDatabase _handle_SQLITE_ABORT_ROLLBACK:onError:](self, "_handle_SQLITE_ABORT_ROLLBACK:onError:", v8, v9);
                break;
              case 517:
                v10 = -[SGSqliteDatabase _handle_SQLITE_BUSY_SNAPSHOT:onError:](self, "_handle_SQLITE_BUSY_SNAPSHOT:onError:", v8, v9);
                break;
              case 520:
                v10 = -[SGSqliteDatabase _handle_SQLITE_READONLY_CANTLOCK:onError:](self, "_handle_SQLITE_READONLY_CANTLOCK:onError:", v8, v9);
                break;
              case 522:
                v10 = -[SGSqliteDatabase _handle_SQLITE_IOERR_SHORT_READ:onError:](self, "_handle_SQLITE_IOERR_SHORT_READ:onError:", v8, v9);
                break;
              case 526:
                v10 = -[SGSqliteDatabase _handle_SQLITE_CANTOPEN_ISDIR:onError:](self, "_handle_SQLITE_CANTOPEN_ISDIR:onError:", v8, v9);
                break;
              default:
                goto LABEL_143;
            }
            break;
        }
        break;
    }
  }
LABEL_146:
  v11 = v10;

  return v11;
}

+ (id)corruptionMarkerFilename
{
  return CFSTR("sg_db_corruption_marker");
}

+ (id)corruptionMarkerPathForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSqliteDatabase corruptionMarkerFilename](SGSqliteDatabase, "corruptionMarkerFilename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v7;
}

@end
