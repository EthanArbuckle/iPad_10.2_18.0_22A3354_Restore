@implementation EDProtectedDatabasePersistence

- (void)detachProtectedOrJournalDatabaseFromConnectionIfNecessary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1D824B334]();
  if (-[EDProtectedDatabasePersistence supportsJournaling](self, "supportsJournaling")
    && objc_msgSend(v5, "protectedDatabaseAttached")
    && !-[EDProtectedDatabasePersistence protectedDataAvailable](self, "protectedDataAvailable"))
  {
    -[EDProtectedDatabasePersistence _detachProtectedDatabaseFromConnection:](self, "_detachProtectedDatabaseFromConnection:", v5);
  }
  objc_autoreleasePoolPop(v4);

}

- (void)attachProtectedOrJournalDatabaseToConnectionIfNecessary:(id)a3 withSchema:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D824B334]();
  if (-[EDProtectedDatabasePersistence supportsJournaling](self, "supportsJournaling"))
  {
    if (!-[EDProtectedDatabasePersistence protectedDataAvailable](self, "protectedDataAvailable"))
    {
      if (objc_msgSend(v7, "protectedDatabaseAttached"))
      {
        -[EDProtectedDatabasePersistence _detachProtectedDatabaseFromConnection:](self, "_detachProtectedDatabaseFromConnection:", v7);
      }
      else if ((objc_msgSend(v7, "journalDatabaseAttached") & 1) != 0)
      {
        goto LABEL_19;
      }
      -[EDProtectedDatabasePersistence _attachJournalDatabaseToConnection:withSchema:](self, "_attachJournalDatabaseToConnection:withSchema:", v7, v8);
      goto LABEL_19;
    }
    if ((objc_msgSend(v7, "protectedDatabaseAttached") & 1) == 0)
    {
      if (objc_msgSend(v7, "journalDatabaseAttached"))
      {
        if (-[EDProtectedDatabasePersistence _performOnDemandReconciliationForConnection:withSchema:](self, "_performOnDemandReconciliationForConnection:withSchema:", v7, v8))
        {
          -[EDProtectedDatabasePersistence _ensureProtectedDatabaseOrJournalIsAttachedToConnection:withSchema:](self, "_ensureProtectedDatabaseOrJournalIsAttachedToConnection:withSchema:", v7, v8);
        }
        else
        {
          -[EDProtectedDatabasePersistence _ensureJournalIsAttachedToConnection:withSchema:](self, "_ensureJournalIsAttachedToConnection:withSchema:", v7, v8);
        }
      }
      else
      {
        v18 = 0;
        v10 = -[EDProtectedDatabasePersistence _attachProtectedDatabaseToConnection:withSchema:error:](self, "_attachProtectedDatabaseToConnection:withSchema:error:", v7, v8, &v18);
        v11 = v18;
        if (!v10)
        {
          if (+[EDProtectedDatabasePersistence _isRecoverableError:](EDProtectedDatabasePersistence, "_isRecoverableError:", v11))
          {
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v11, "ef_publicDescription");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = EFProtectedDataAvailable();
              -[EDProtectedDatabasePersistence database](self, "database");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "protectedDatabaseIsAvailable");
              *(_DWORD *)buf = 138543874;
              v20 = v14;
              v21 = 1024;
              v22 = v15;
              v23 = 1024;
              v24 = v17;
              _os_log_error_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_ERROR, "Got error %{public}@ attaching protected database.  ProtectedDataAvailable = %d, protectedDatabaseIsAvailable = %d", buf, 0x18u);

            }
            -[EDProtectedDatabasePersistence _attachJournalDatabaseToConnection:withSchema:](self, "_attachJournalDatabaseToConnection:withSchema:", v7, v8);
          }
          else
          {
            objc_msgSend(v7, "handleError:message:", v11, CFSTR("Unable to attach protected database"));
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDProtectedDatabasePersistence.m"), 142, CFSTR("Unable to attach protected database"));

          }
        }

      }
    }
  }
LABEL_19:
  objc_autoreleasePoolPop(v9);

}

- (BOOL)protectedDataAvailable
{
  void *v2;
  char v3;

  -[EDProtectedDatabasePersistence database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "protectedDatabaseIsAvailable");

  return v3;
}

- (id)database
{
  return objc_loadWeakRetained((id *)&self->_database);
}

- (BOOL)_initializeDatabase:(id)a3 withConnection:(id)a4 schema:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA %@.journal_mode = WAL;"),
                  v9);
  objc_msgSend(v10, "sqlConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "executeStatementString:error:", v12, a6);

  if (v14)
  {
    objc_msgSend(v11, "definitionWithDatabaseName:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sqlConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "executeStatementString:error:", v15, a6);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setDatabase:(id)a3
{
  objc_storeWeak((id *)&self->_database, a3);
}

- (BOOL)_updateSqliteSequenceForDatabase:(id)a3 schema:(id)a4 withConnection:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  int64_t v20;
  void *v21;
  int64_t v22;
  NSObject *v23;
  void *v24;
  int64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id obj;
  id v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  int64_t v67;
  __int16 v68;
  int64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v45 = a4;
  v9 = a5;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT name FROM %@.sqlite_sequence"), v50);
  objc_msgSend(v9, "preparedStatementForQueryString:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __95__EDProtectedDatabasePersistence__updateSqliteSequenceForDatabase_schema_withConnection_error___block_invoke;
  v62[3] = &unk_1E949AF78;
  v53 = v44;
  v63 = v53;
  v43 = v10;
  if (objc_msgSend(v10, "executeUsingBlock:error:", v62, a6))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.sqlite_sequence"), v50);
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", v47);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v45, "tables");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v11)
    {
      v51 = *(_QWORD *)v59;
      do
      {
        v52 = v11;
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v59 != v51)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[EDProtectedDatabasePersistence _allReferencingColumnsForTable:](self, "_allReferencingColumnsForTable:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v15 = v14;
          v16 = 0;
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v55 != v18)
                  objc_enumerationMutation(v15);
                v20 = -[EDProtectedDatabasePersistence _maxRowIDForColumn:withConnection:](self, "_maxRowIDForColumn:withConnection:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j), v9);
                if (v16 <= v20)
                  v16 = v20;
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
            }
            while (v17);
          }

          objc_msgSend(v13, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[EDTableMetadataPersistence largestDeletedRowIDForTableName:withConnection:](EDTableMetadataPersistence, "largestDeletedRowIDForTableName:withConnection:", v21, v9);

          +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v65 = v24;
            v66 = 2048;
            v67 = v16;
            v68 = 2048;
            v69 = v22;
            _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "%@: maxRowID: %lld, largestDeletedRowID: %lld", buf, 0x20u);

          }
          if (v16 <= v22)
            v25 = v22;
          else
            v25 = v16;
          objc_msgSend(v13, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v53, "containsObject:", v26);

          if (v27)
          {
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "fullNameWithDatabaseName:", v50);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v65 = v29;
              v66 = 2048;
              v67 = v25;
              _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "Updating sqlite_sequence %{public}@ = %lld", buf, 0x16u);

            }
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", v47);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("seq"));

            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("name"));
            objc_msgSend(v13, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "equalTo:", v33);
            v34 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setWhereClause:", v34);

            LOBYTE(v34) = objc_msgSend(v9, "executeUpdateStatement:error:", v30, a6);
            if ((v34 & 1) == 0)
            {

              v40 = 0;
              goto LABEL_33;
            }
          }
          else
          {
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "fullNameWithDatabaseName:", v50);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v65 = v36;
              v66 = 2048;
              v67 = v25;
              _os_log_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEFAULT, "Setting sqlite_sequence %{public}@ = %lld", buf, 0x16u);

            }
            objc_msgSend(v46, "addValue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "name");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, CFSTR("name"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("seq"));

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v11);
    }

    v40 = objc_msgSend(v9, "executeInsertStatement:error:", v46, a6);
LABEL_33:

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EDProtectedDatabasePersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_70 != -1)
    dispatch_once(&log_onceToken_70, block);
  return (OS_os_log *)(id)log_log_70;
}

- (int64_t)_maxRowIDForColumn:(id)a3 withConnection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "table");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT max(%@) FROM %@"), v8, v10);

  objc_msgSend(v6, "preparedStatementForQueryString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__EDProtectedDatabasePersistence__maxRowIDForColumn_withConnection___block_invoke;
  v20[3] = &unk_1E949B090;
  v20[4] = &v21;
  LOBYTE(v9) = objc_msgSend(v12, "executeUsingBlock:error:", v20, &v19);
  v13 = v19;
  if ((v9 & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "fullNameWithDatabaseName:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Finding max %@"), v15);

    objc_msgSend(v6, "handleError:message:", v13, v16);
  }
  v17 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v17;
}

- (id)_allReferencingColumnsForTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "foreignKeyReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = v7;

  objc_msgSend(v3, "associatedColumns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v8, "unionSet:", v9);

  return v8;
}

void __37__EDProtectedDatabasePersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_70;
  log_log_70 = (uint64_t)v1;

}

void __95__EDProtectedDatabasePersistence__updateSqliteSequenceForDatabase_schema_withConnection_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __68__EDProtectedDatabasePersistence__maxRowIDForColumn_withConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

uint64_t __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_reconcileJournalsWithSchema:connection:", *(_QWORD *)(a1 + 40), 0);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v2;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Completed reconciliation with result: %lu", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)reconcileJournalsWithSchema:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *reconciliationQueue;
  _QWORD block[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_reconciliationLock);
  if (!-[EDProtectedDatabasePersistence isReconciling](self, "isReconciling"))
  {
    -[EDProtectedDatabasePersistence setIsReconciling:](self, "setIsReconciling:", 1);
    os_unfair_lock_unlock(&self->_reconciliationLock);
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Triggering reconciliation", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("reconciliation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    reconciliationQueue = self->_reconciliationQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke;
    v15[3] = &unk_1E949EED8;
    v15[4] = self;
    v16 = v6;
    v17 = v11;
    v18 = v7;
    v9 = v11;
    dispatch_async(reconciliationQueue, v15);

    goto LABEL_7;
  }
  os_unfair_lock_unlock(&self->_reconciliationLock);
  if (v7)
  {
    v8 = self->_reconciliationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke_49;
    block[3] = &unk_1E949BDA0;
    v14 = v7;
    dispatch_async(v8, block);
    v9 = v14;
LABEL_7:

  }
}

- (BOOL)isReconciling
{
  return self->_isReconciling;
}

- (unint64_t)_reconcileJournalsWithSchema:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D824B334]();
  if (objc_msgSend(v7, "isWriter"))
  {
    v9 = v7;
  }
  else
  {
    -[EDProtectedDatabasePersistence database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "checkOutConnectionIsWriter:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[EDProtectedDatabasePersistence _runReconciliationWithSchema:connection:](self, "_runReconciliationWithSchema:connection:", v6, v9);
  if (v9 != v7)
  {
    -[EDProtectedDatabasePersistence database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "checkInConnection:", v9);

  }
  -[EDProtectedDatabasePersistence finishJournalReconciliation:](self, "finishJournalReconciliation:", v11);
  os_unfair_lock_lock(&self->_reconciliationLock);
  -[EDProtectedDatabasePersistence setIsReconciling:](self, "setIsReconciling:", 0);
  os_unfair_lock_unlock(&self->_reconciliationLock);
  if (!v11)
  {
    -[EDProtectedDatabasePersistence hookRegistry](self, "hookRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistenceDidReconcileProtectedData");

  }
  objc_autoreleasePoolPop(v8);

  return v11;
}

- (void)setIsReconciling:(BOOL)a3
{
  self->_isReconciling = a3;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (unint64_t)_runReconciliationWithSchema:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  BOOL v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  double v39;
  __int128 v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint8_t v48[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  +[EDProtectedDatabasePersistence signpostLog](EDProtectedDatabasePersistence, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[EDProtectedDatabasePersistence signpostID](self, "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EDProtectedDatabasePersistenceReconciliation", "Starting reconciliation of protected data", buf, 2u);
  }

  if (!-[EDProtectedDatabasePersistence protectedDataAvailable](self, "protectedDataAvailable"))
  {
    v24 = 1;
    goto LABEL_49;
  }
  if (objc_msgSend(v7, "journalDatabaseAttached"))
    -[EDProtectedDatabasePersistence _detachJournalDatabaseFromConnection:](self, "_detachJournalDatabaseFromConnection:", v7);
  if ((objc_msgSend(v7, "protectedDatabaseAttached") & 1) == 0)
  {
    v47 = 0;
    v10 = -[EDProtectedDatabasePersistence _attachProtectedDatabaseToConnection:withSchema:error:](self, "_attachProtectedDatabaseToConnection:withSchema:error:", v7, v6, &v47);
    v11 = v47;
    v12 = v11;
    if (!v10)
    {
      v24 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v7, 0, v11, CFSTR("Unable to attach protected database"));

      goto LABEL_49;
    }

  }
  v45 = 0;
  v46 = 0;
  -[EDProtectedDatabasePersistence journalManager](self, "journalManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oldestJournal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_33:
    v24 = 0;
    goto LABEL_43;
  }
  *(_QWORD *)&v15 = 134217984;
  v41 = v15;
  while (1)
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log", v41);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v14, "number");
      *(_DWORD *)buf = v41;
      v53 = v17;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Reconciling journal %lu", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v19 = objc_msgSend(v7, "attachJournalDatabase:withName:error:", v14, v18, &v44);
    v20 = v44;

    if ((v19 & 1) == 0)
      break;
    v43 = v20;
    v21 = -[EDProtectedDatabasePersistence _upgradeJournalWithConnection:schema:error:](self, "_upgradeJournalWithConnection:schema:error:", v7, v6, &v43);
    v22 = v43;

    v20 = v22;
    if (!v21)
    {
      +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = objc_msgSend(v14, "number");
        objc_msgSend(v22, "ef_publicDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDProtectedDatabasePersistence _runReconciliationWithSchema:connection:].cold.1(v36, (uint64_t)buf, v35);
      }

      v33 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v7, 0, v22, CFSTR("Upgrading journal for merging"));
      goto LABEL_41;
    }
    v23 = -[EDProtectedDatabasePersistence _mergeSchema:connection:journaledRows:newRows:](self, "_mergeSchema:connection:journaledRows:newRows:", v6, v7, &v46, &v45);
    v24 = v23;
    if (v23 == 2)
    {
      if (-[EDProtectedDatabasePersistence _isJournalMalformedForSchema:connection:](self, "_isJournalMalformedForSchema:connection:", v6, v7))
      {
        +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v28 = objc_msgSend(v14, "number");
          *(_DWORD *)buf = v41;
          v53 = v28;
          _os_log_error_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_ERROR, "Skipped merging data due to malformed schema for journal %lu", buf, 0xCu);
        }
        v24 = 0;
      }
      else
      {
        +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v29 = objc_msgSend(v14, "number");
          *(_DWORD *)buf = v41;
          v53 = v29;
          _os_log_error_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_ERROR, "Permanently failed to merge data for journal %lu", buf, 0xCu);
        }
        v24 = 2;
      }
    }
    else
    {
      if (v23 != 1)
        goto LABEL_29;
      +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = objc_msgSend(v14, "number");
        *(_DWORD *)buf = v41;
        v53 = v27;
        _os_log_error_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_ERROR, "Temporarily failed to merge data for journal %lu", buf, 0xCu);
      }
      v24 = 1;
    }

LABEL_29:
    -[EDProtectedDatabasePersistence _detachJournalDatabaseFromConnection:](self, "_detachJournalDatabaseFromConnection:", v7);
    if (v24)
      goto LABEL_42;
    objc_msgSend(v13, "mergedJournal:", v14);
    objc_msgSend(v13, "oldestJournal");
    v26 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v26;
    if (!v26)
      goto LABEL_33;
  }
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = objc_msgSend(v14, "number");
    objc_msgSend(v20, "ef_publicDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDProtectedDatabasePersistence _runReconciliationWithSchema:connection:].cold.2(v32, (uint64_t)buf, v31);
  }

  v33 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v7, 0, v20, CFSTR("Attaching journal for merging"));
LABEL_41:
  v24 = v33;
LABEL_42:

LABEL_43:
  +[EDProtectedDatabasePersistence signpostLog](EDProtectedDatabasePersistence, "signpostLog");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = -[EDProtectedDatabasePersistence signpostID](self, "signpostID");
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_DWORD *)v48 = 134349312;
    v49 = v46;
    v50 = 2050;
    v51 = v45;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v37, OS_SIGNPOST_INTERVAL_END, v38, "EDProtectedDatabasePersistenceReconciliation", "TotalJournaledRows=%{public,signpost.telemetry:number1}lu, NewJournaledRows=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", v48, 0x16u);
  }

  objc_msgSend(v42, "timeIntervalSinceNow");
  if (v39 < -10.0)
    EFSaveTailspin();

LABEL_49:
  return v24;
}

- (BOOL)_attachProtectedDatabaseToConnection:(id)a3 withSchema:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  BOOL v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "protectedDatabaseName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "attachProtectedDatabaseWithName:error:", v10, a5);

  if (!v11)
    goto LABEL_9;
  os_unfair_lock_lock(&self->_initializationLock);
  if (-[EDProtectedDatabasePersistence isInitialized](self, "isInitialized"))
  {
    os_unfair_lock_unlock(&self->_initializationLock);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "protectedDatabaseName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EDProtectedDatabasePersistence _initializeDatabase:withConnection:schema:error:](self, "_initializeDatabase:withConnection:schema:error:", v12, v8, v9, a5);

    -[EDProtectedDatabasePersistence setIsInitialized:](self, "setIsInitialized:", v13);
    os_unfair_lock_unlock(&self->_initializationLock);
    if (!v13)
    {
LABEL_8:
      objc_msgSend(v8, "detachProtectedDatabase");
LABEL_9:
      v16 = 0;
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v8, "isWriter"))
  {
    objc_msgSend((id)objc_opt_class(), "protectedDatabaseName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[EDProtectedDatabasePersistence _updateSqliteSequenceForDatabase:schema:withConnection:error:](self, "_updateSqliteSequenceForDatabase:schema:withConnection:error:", v14, v9, v8, a5);

    if (!v15)
      goto LABEL_8;
  }
  v16 = 1;
LABEL_10:

  return v16;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EDProtectedDatabasePersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_6 != -1)
    dispatch_once(&signpostLog_onceToken_6, block);
  return (OS_os_log *)(id)signpostLog_log_6;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (EDPersistenceDatabaseJournalManager)journalManager
{
  return self->_journalManager;
}

- (EDProtectedDatabasePersistence)initWithBasePath:(id)a3 hookRegistry:(id)a4
{
  id v6;
  id v7;
  EDPersistenceDatabaseJournalManager *v8;
  EDProtectedDatabasePersistence *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[EDPersistenceDatabaseJournalManager initWithBasePath:]([EDPersistenceDatabaseJournalManager alloc], "initWithBasePath:", v6);
  v9 = -[EDProtectedDatabasePersistence initWithJournalManager:hookRegistry:](self, "initWithJournalManager:hookRegistry:", v8, v7);

  return v9;
}

- (EDProtectedDatabasePersistence)initWithJournalManager:(id)a3 hookRegistry:(id)a4
{
  id v7;
  id v8;
  EDProtectedDatabasePersistence *v9;
  EDProtectedDatabasePersistence *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *reconciliationQueue;
  id v15;
  void *v16;
  uint64_t v17;
  EFLocked *reconciliationMergeHandlers;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)EDProtectedDatabasePersistence;
  v9 = -[EDProtectedDatabasePersistence init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_journalManager, a3);
    objc_storeStrong((id *)&v10->_hookRegistry, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.email.protectedDatabasePersistence.reconciliationQueue", v12);
    reconciliationQueue = v10->_reconciliationQueue;
    v10->_reconciliationQueue = (OS_dispatch_queue *)v13;

    *(_QWORD *)&v10->_initializationLock._os_unfair_lock_opaque = 0;
    v15 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithObject:", v16);
    reconciliationMergeHandlers = v10->_reconciliationMergeHandlers;
    v10->_reconciliationMergeHandlers = (EFLocked *)v17;

  }
  return v10;
}

- (void)registerMergeHandler:(id)a3 forTable:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  EDProtectedDatabasePersistence *v14;
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  -[EDProtectedDatabasePersistence reconciliationMergeHandlers](self, "reconciliationMergeHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__EDProtectedDatabasePersistence_registerMergeHandler_forTable___block_invoke;
  v12[3] = &unk_1E94A0130;
  v10 = v8;
  v16 = a2;
  v13 = v10;
  v14 = self;
  v11 = v7;
  v15 = v11;
  objc_msgSend(v9, "performWhileLocked:", v12);

}

- (EFLocked)reconciliationMergeHandlers
{
  return self->_reconciliationMergeHandlers;
}

void __45__EDProtectedDatabasePersistence_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_6;
  signpostLog_log_6 = (uint64_t)v1;

}

void __64__EDProtectedDatabasePersistence_registerMergeHandler_forTable___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKey:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("EDProtectedDatabasePersistence.m"), 947, CFSTR("Merge handler already registered for table"));

  }
  objc_msgSend(v5, "setObject:forKey:", a1[6], a1[4]);

}

+ (NSString)protectedDatabaseName
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[EDProtectedDatabasePersistence protectedDatabaseName]", "EDProtectedDatabasePersistence.m", 65, "0");
}

+ (NSString)journalDatabaseName
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[EDProtectedDatabasePersistence journalDatabaseName]", "EDProtectedDatabasePersistence.m", 69, "0");
}

+ (id)deleteMergeHandler
{
  return +[_EDDeleteReconciliationMergeHandler sharedInstance](_EDDeleteReconciliationMergeHandler, "sharedInstance");
}

+ (id)replaceMergeHandler
{
  return +[_EDReplaceReconciliationMergeHandler sharedInstance](_EDReplaceReconciliationMergeHandler, "sharedInstance");
}

- (void)_ensureJournalIsAttachedToConnection:(id)a3 withSchema:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "protectedDatabaseAttached"))
    -[EDProtectedDatabasePersistence _detachProtectedDatabaseFromConnection:](self, "_detachProtectedDatabaseFromConnection:", v7);
  if ((objc_msgSend(v7, "journalDatabaseAttached") & 1) == 0)
    -[EDProtectedDatabasePersistence _attachJournalDatabaseToConnection:withSchema:](self, "_attachJournalDatabaseToConnection:withSchema:", v7, v6);

}

- (void)_ensureProtectedDatabaseOrJournalIsAttachedToConnection:(id)a3 withSchema:(id)a4
{
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "protectedDatabaseAttached") & 1) != 0)
  {
    v9 = 0;
    goto LABEL_4;
  }
  v17 = 0;
  v10 = -[EDProtectedDatabasePersistence _attachProtectedDatabaseToConnection:withSchema:error:](self, "_attachProtectedDatabaseToConnection:withSchema:error:", v7, v8, &v17);
  v9 = v17;
  if (v10)
  {
LABEL_4:
    if (objc_msgSend(v7, "journalDatabaseAttached"))
      -[EDProtectedDatabasePersistence _detachJournalDatabaseFromConnection:](self, "_detachJournalDatabaseFromConnection:", v7);
    goto LABEL_12;
  }
  if (+[EDProtectedDatabasePersistence _isRecoverableError:](EDProtectedDatabasePersistence, "_isRecoverableError:", v9))
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = EFProtectedDataAvailable();
      -[EDProtectedDatabasePersistence database](self, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "protectedDatabaseIsAvailable");
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      v20 = 1024;
      v21 = v14;
      v22 = 1024;
      v23 = v16;
      _os_log_error_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_ERROR, "Got error %{public}@ attaching protected database.  ProtectedDataAvailable = %d, protectedDatabaseIsAvailable = %d", buf, 0x18u);

    }
    if ((objc_msgSend(v7, "journalDatabaseAttached") & 1) == 0)
      -[EDProtectedDatabasePersistence _attachJournalDatabaseToConnection:withSchema:](self, "_attachJournalDatabaseToConnection:withSchema:", v7, v8);
  }
  else
  {
    objc_msgSend(v7, "handleError:message:", v9, CFSTR("Unable to attach protected database"));
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDProtectedDatabasePersistence.m"), 214, CFSTR("Unable to attach protected database"));

  }
LABEL_12:

}

- (void)_detachProtectedDatabaseFromConnection:(id)a3
{
  objc_msgSend(a3, "detachProtectedDatabase");
}

- (void)_attachJournalDatabaseToConnection:(id)a3 withSchema:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isWriter"))
  {
    -[EDProtectedDatabasePersistence journalManager](self, "journalManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentJournalCreateIfNeeded:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "attachJournalDatabase:withName:", v10, v11);

    if (v12)
    {
      objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v14 = -[EDProtectedDatabasePersistence _initializeDatabase:withConnection:schema:error:](self, "_initializeDatabase:withConnection:schema:error:", v13, v7, v8, &v22);
      v15 = v22;

      if (v14)
      {
        objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v15;
        v17 = -[EDProtectedDatabasePersistence _updateSqliteSequenceForDatabase:schema:withConnection:error:](self, "_updateSqliteSequenceForDatabase:schema:withConnection:error:", v16, v8, v7, &v21);
        v18 = v21;

        v15 = v18;
        if (v17)
          goto LABEL_9;
      }
      +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[EDProtectedDatabasePersistence _attachJournalDatabaseToConnection:withSchema:].cold.1(v19);

      objc_msgSend(v7, "detachJournalDatabase");
      -[EDProtectedDatabasePersistence journalManager](self, "journalManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mergedJournal:", v10);

      objc_msgSend(v7, "handleError:message:", v15, CFSTR("Initializing journal database"));
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDProtectedDatabasePersistence.m"), 271, CFSTR("Unable to attach journal database"));
LABEL_9:

  }
}

- (void)_detachJournalDatabaseFromConnection:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "detachJournalDatabase") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDProtectedDatabasePersistence.m"), 277, CFSTR("Unable to detach journal database"));

  }
}

- (BOOL)_upgradeJournalWithConnection:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[EDProtectedDatabasePersistence _initializeDatabase:withConnection:schema:error:](self, "_initializeDatabase:withConnection:schema:error:", v10, v8, v9, a5);

  return (char)a5;
}

- (BOOL)_performOnDemandReconciliationForConnection:(id)a3 withSchema:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  BOOL v10;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v9 = "Skipping on-demand reconciliation from the main thread";
LABEL_10:
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((EFProtectedDataAvailable() & 1) == 0)
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v9 = "Skipping on-demand reconciliation because protected data isn't available";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_reconciliationLock);
  if (-[EDProtectedDatabasePersistence isReconciling](self, "isReconciling"))
  {
    os_unfair_lock_unlock(&self->_reconciliationLock);
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v9 = "Skipping on-demand reconciliation because we're already reconciling";
      goto LABEL_10;
    }
LABEL_11:
    v10 = 1;
    goto LABEL_12;
  }
  -[EDProtectedDatabasePersistence setIsReconciling:](self, "setIsReconciling:", 1);
  os_unfair_lock_unlock(&self->_reconciliationLock);
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Triggering on-demand reconciliation", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("on-demand reconciliation"));
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = -[EDProtectedDatabasePersistence _reconcileJournalsWithSchema:connection:](self, "_reconcileJournalsWithSchema:connection:", v7, v6);
  v10 = v13 == 0;
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v13;
    _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Completed on-demand reconciliation with result: %lu", (uint8_t *)&v15, 0xCu);
  }

  -[NSObject invalidate](v8, "invalidate");
LABEL_12:

  return v10;
}

uint64_t __78__EDProtectedDatabasePersistence_reconcileJournalsWithSchema_completionBlock___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)_mergeSchema:(id)a3 connection:(id)a4 journaledRows:(unint64_t *)a5 newRows:(unint64_t *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a3, "tables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v11);
      v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
      v18 = 0;
      v19 = 0;
      v16 = -[EDProtectedDatabasePersistence _mergeTable:connection:journaledRows:newRows:](self, "_mergeTable:connection:journaledRows:newRows:", v15, v10, &v19, &v18);
      if (v16)
        break;
      if (a5)
        *a5 += v19;
      if (a6)
        *a6 += v18;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v16 = 0;
  }

  return v16;
}

- (unint64_t)_mergeTable:(id)a3 connection:(id)a4 journaledRows:(unint64_t *)a5 newRows:(unint64_t *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  int v28;
  uint64_t *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  _BOOL4 v35;
  unint64_t v36;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t v40;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  EDProtectedDatabasePersistence *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  EDProtectedDatabasePersistence *v53;
  id v54;
  id v55;
  uint64_t *v56;
  uint64_t *v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  EDProtectedDatabasePersistence *v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  _BYTE *v73;
  SEL v74;
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE buf[24];
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v44 = a4;
  v45 = v10;
  v48 = self;
  objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fullNameWithDatabaseName:", v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "protectedDatabaseName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fullNameWithDatabaseName:", v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  -[EDProtectedDatabasePersistence _allReferencingColumnsForTable:](v48, "_allReferencingColumnsForTable:", v10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueColumns");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = a5;
  v39 = a6;
  objc_msgSend(v13, "firstObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 2114;
      v85 = v47;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_INFO, "Merging table %{public}@ with unique columns: %{public}@\n  referencing columns: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_INFO, "Merging table %{public}@ without unique columns", buf, 0xCu);

    }
  }

  v40 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v85 = 0;
  v17 = &v76;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  do
  {
    v17[3] = 0;
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v75 = 0;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke;
    v63[3] = &unk_1E94A0040;
    v19 = v43;
    v64 = v19;
    v20 = v46;
    v65 = v20;
    v21 = v42;
    v74 = a2;
    v66 = v21;
    v67 = v48;
    v22 = v18;
    v68 = v22;
    v71 = &v76;
    v72 = &v80;
    v23 = v45;
    v69 = v23;
    v24 = v44;
    v70 = v24;
    v73 = buf;
    v25 = objc_msgSend(v24, "performWithOptions:transactionError:block:", 3, &v75, v63);
    v26 = v75;
    if (v81[3]
      || (v27 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v24, v25, v26, CFSTR("Committing merge batch transaction")), (v81[3] = v27) != 0))
    {
      v28 = 0;
    }
    else
    {
      v29 = &v59;
      v59 = 0;
      v60 = &v59;
      v61 = 0x2020000000;
      v62 = 0;
      v30 = v26;
      do
      {
        v29[3] = 0;
        v58 = v30;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_74;
        v49[3] = &unk_1E94A0090;
        v50 = v22;
        v51 = v23;
        v31 = v47;
        v56 = &v80;
        v52 = v31;
        v53 = v48;
        v32 = v24;
        v54 = v32;
        v57 = &v59;
        v55 = v19;
        v33 = objc_msgSend(v32, "performWithOptions:transactionError:block:", 3, &v58, v49);
        v26 = v58;

        v34 = v81[3];
        if (!v34)
        {
          v34 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v32, v33, v26, CFSTR("Committing update batch transaction"));
          v81[3] = v34;
        }
        v35 = v34 == 0;

        if (!v35)
          break;
        v29 = v60;
        v30 = v26;
      }
      while (v60[3]);
      if (!v81[3])
        v40 += v77[3];
      _Block_object_dispose(&v59, 8);
      v28 = 1;
    }

    if (!v28)
      break;
    v17 = v77;
  }
  while (v77[3]);
  if (v38)
    *v38 = v40;
  if (v39)
    *v39 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  v36 = v81[3];
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v80, 8);
  return v36;
}

BOOL __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  v5 = *MEMORY[0x1E0D1EE00];
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], *(_QWORD *)(a1 + 32));
  v7 = objc_msgSend(*(id *)(a1 + 40), "count");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2;
    v43[3] = &unk_1E949FFF0;
    v9 = *(void **)(a1 + 40);
    v44 = *(id *)(a1 + 48);
    v45 = *(id *)(a1 + 32);
    objc_msgSend(v9, "ef_map:", v43);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 56), CFSTR("EDProtectedDatabasePersistence.m"), 596, CFSTR("We must have at least one join constraint"));

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF90]), "initWithExpressions:", v10);
    objc_msgSend(v6, "leftOuterJoin:on:", *(_QWORD *)(a1 + 48), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addResultColumn:", v5);

    v13 = v44;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addResult:alias:", v13, v5);
  }

  objc_msgSend(v6, "setLimit:", 500);
  v14 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v39[0] = v8;
  v39[1] = 3221225472;
  v39[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_3;
  v39[3] = &unk_1E94A0018;
  v40 = *(id *)(a1 + 64);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 88);
  v41 = v15;
  v42 = v16;
  v38 = 0;
  v17 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v39, &v38);
  v18 = v38;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v3, v17, v18, CFSTR("Selecting ROWIDs to merge"));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "hookRegistry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 72), "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "persistenceWillAddProtectedDatabaseIDsFromJournal:andReplaceJournalDatabaseIDsWithProtectedDatabaseIDs:forTable:", v15, v21, v22);

    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v15;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_INFO, "Inserting %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 72), "rowIDColumn");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "columnExpression");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "in:", v15);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v27 = *(_QWORD *)(a1 + 48);
    v28 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v37, "ef_SQLExpression");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ SELECT * FROM %@ WHERE %@"), v27, v28, v29);

    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 72), "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("Unable to insert new rows into protected database for table %@"), v32);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_executeStatementString:onConnection:errorMessage:", v30, *(_QWORD *)(a1 + 80), v33);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      v19 = 0;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_deleteRowIDs:fromJournal:withConnection:", v15, *(_QWORD *)(a1 + 32), v3);
      v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      if (!v34)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) += objc_msgSend(v15, "count");
        v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      }
      v19 = v34 == 0;
    }

  }
  return v19;
}

id __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1EFC0];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "table:column:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D1EFC0];
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "table:column:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", v4);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

BOOL __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _BOOL8 v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, _BYTE *);
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_76;
  v17 = &unk_1E94A0068;
  v5 = *(void **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v6 = v3;
  v24 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v20 = v6;
  v21 = v7;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  v22 = v9;
  v25 = v10;
  v11 = v4;
  v23 = v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v14);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v12 = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_deleteRowIDs:fromJournal:withConnection:", v11, *(_QWORD *)(a1 + 72), v6, v14, v15, v16, v17, v18, v19, v20, v21, v22);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsForKeys:", v11);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0;
  }

  return v12;
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_76(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  id v47;
  _QWORD v48[4];
  id v49;
  _BYTE *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[4];
  id v57;
  __int16 v58;
  uint64_t v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v46 = a2;
  v45 = a3;
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v46;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v45;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "Replacing %{public}@ with %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("subjects"));

  if (v8)
  {
    +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v45;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Mapping subjectID %{public}@ to %{public}@", buf, 0x16u);
    }

  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(a1 + 40);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v10)
  {
    v43 = *(_QWORD *)v53;
    while (2)
    {
      v44 = v10;
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v53 != v43)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v12, "table");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", v14);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v45, v15);
        objc_msgSend(v12, "columnExpression");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "equalTo:", v46);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWhereClause:", v18);

        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v12, "table");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("Unable to merge journal for table %@"), v21);

        v23 = *(void **)(a1 + 48);
        v51 = 0;
        v24 = objc_msgSend(v23, "executeUpdateStatement:error:", v16, &v51);
        v25 = v51;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", *(_QWORD *)(a1 + 48), v24, v25, v22);
        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        if (v26)
        {
          if (v26 != 2)
          {
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 32), "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "fullNameWithDatabaseName:", 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_76_cold_1(v39, v40, (uint64_t)buf, v38);
            }

            *a4 = 1;
            goto LABEL_32;
          }
          +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2114;
            v61 = v46;
            LOWORD(v62) = 2114;
            *(_QWORD *)((char *)&v62 + 2) = v45;
            _os_log_error_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_ERROR, "Conflict merging table %{public}@.%{public}@ %{public}@ with %{public}@", buf, 0x2Au);
          }

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v61 = __Block_byref_object_copy__25;
          *(_QWORD *)&v62 = __Block_byref_object_dispose__25;
          *((_QWORD *)&v62 + 1) = 0;
          objc_msgSend(*(id *)(a1 + 56), "reconciliationMergeHandlers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_81;
          v48[3] = &unk_1E949F0A0;
          v50 = buf;
          v29 = v14;
          v49 = v29;
          objc_msgSend(v28, "performWhileLocked:", v48);

          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v56 = 138543362;
              v57 = v29;
              _os_log_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_DEFAULT, "Merge handler found for table %{public}@", v56, 0xCu);
            }

            v31 = *(void **)(*(_QWORD *)&buf[8] + 40);
            v32 = *(_QWORD *)(a1 + 64);
            v33 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24;
            v47 = v25;
            v34 = objc_msgSend(v31, "handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:", v29, v15, v16, v46, v45, v32, v33, &v47);
            v35 = v47;

            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v34;
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
              *(_DWORD *)v56 = 138543618;
              v57 = v29;
              v58 = 2048;
              v59 = v37;
              _os_log_impl(&dword_1D2F2C000, v36, OS_LOG_TYPE_DEFAULT, "Merge handler for table %{public}@ returned with result %lu", v56, 0x16u);
            }
          }
          else
          {
            +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v56 = 138543362;
              v57 = v29;
              _os_log_error_impl(&dword_1D2F2C000, v36, OS_LOG_TYPE_ERROR, "No merge handler found for table %{public}@", v56, 0xCu);
            }
            v35 = v25;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += sqlite3_changes((sqlite3 *)objc_msgSend(*(id *)(a1 + 48), "sqlDB"));
          v35 = v25;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_32:

  objc_msgSend(*(id *)(a1 + 72), "addObject:", v46);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) >= 0x1F4uLL)
    *a4 = 1;

}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)_deleteRowIDs:(id)a3 fromJournal:(id)a4 withConnection:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[EDProtectedDatabasePersistence _deleteRowIDs:fromJournal:withConnection:].cold.1((uint64_t)v7, v10);

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "in:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", v8, v12);
  v19 = 0;
  v14 = objc_msgSend(v9, "executeDeleteStatement:error:", v13, &v19);
  v15 = v19;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to delete rows from journal for table %@"), v8);
  v17 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v9, v14, v15, v16);

  return v17;
}

- (void)scheduleRecurringActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD aBlock[5];

  if (-[EDProtectedDatabasePersistence supportsJournaling](self, "supportsJournaling"))
  {
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke;
    aBlock[3] = &unk_1E949BC90;
    aBlock[4] = self;
    v4 = _Block_copy(aBlock);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke_2;
    v6[3] = &unk_1E949BC90;
    v6[4] = self;
    v5 = _Block_copy(v6);
    ef_xpc_activity_register();

  }
}

void __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808D0], 0);
  objc_msgSend(*(id *)(a1 + 32), "addAdditionalCriteriaToCleanupActivity:", xdict);

}

void __59__EDProtectedDatabasePersistence_scheduleRecurringActivity__block_invoke_2(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Starting clean up", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "database", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectedSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v7);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if (xpc_activity_should_defer(v3) && xpc_activity_set_state(v3, 3))
        break;
      objc_msgSend(*(id *)(a1 + 32), "_databaseIDsToDeleteForTable:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
        objc_msgSend(*(id *)(a1 + 32), "_deleteDatabaseIDs:fromTable:", v12, v11);

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (id)_databaseIDsToDeleteForTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  EDProtectedDatabasePersistence *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[4];

  v4 = a3;
  -[EDProtectedDatabasePersistence _allReferencingColumnsForTable:](self, "_allReferencingColumnsForTable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke;
  v23[3] = &unk_1E94A00B8;
  v25 = v26;
  v8 = v6;
  v24 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v23);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[EDProtectedDatabasePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDProtectedDatabasePersistence _databaseIDsToDeleteForTable:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_2;
  v18[3] = &unk_1E949D860;
  v12 = v4;
  v19 = v12;
  v20 = self;
  v13 = v8;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v18);

  v15 = v22;
  v16 = v14;

  _Block_object_dispose(v26, 8);
  return v16;
}

void __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" UNION "));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v9, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullNameWithDatabaseName:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("SELECT DISTINCT %@ FROM %@"), v4, v6);

  if (objc_msgSend(v9, "nullable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v9, "columnExpressionWithFullName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isNotNull");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ef_renderSQLExpressionInto:", *(_QWORD *)(a1 + 32));

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "rowIDColumn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "protectedDatabaseName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullNameWithDatabaseName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("SELECT %1$@ FROM %2$@ WHERE %1$@ NOT IN (%3$@)"), v6, v9, *(_QWORD *)(a1 + 48));

    objc_msgSend(v3, "preparedStatementForQueryString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_3;
    v14[3] = &unk_1E949AF78;
    v15 = *(id *)(a1 + 56);
    v12 = objc_msgSend(v11, "executeUsingBlock:error:", v14, 0);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

void __63__EDProtectedDatabasePersistence__databaseIDsToDeleteForTable___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_deleteDatabaseIDs:(id)a3 fromTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(id *, void *);
  void *v21;
  id v22;
  EDProtectedDatabasePersistence *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  -[EDProtectedDatabasePersistence _allReferencingColumnsForTable:](self, "_allReferencingColumnsForTable:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDProtectedDatabasePersistence database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDProtectedDatabasePersistence _deleteDatabaseIDs:fromTable:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke;
  v21 = &unk_1E949D860;
  v12 = v9;
  v22 = v12;
  v23 = self;
  v13 = v8;
  v24 = v13;
  v14 = v7;
  v25 = v14;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, &v18);

  +[EDProtectedDatabasePersistence log](EDProtectedDatabasePersistence, "log", v18, v19, v20, v21);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v13, "count");
    objc_msgSend(v14, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v27 = v16;
    v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Deleted %lu rows from %{public}@", buf, 0x16u);

  }
}

uint64_t __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = a1[4];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v18;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(a1[5], "_removeExistingDatabaseIDs:withColumn:connection:", a1[6], *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7), v3) & 1) == 0)
          {
            v11 = 0;
            goto LABEL_13;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(a1[6], "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke_2;
    v13[3] = &unk_1E94A00E0;
    v9 = a1[7];
    v10 = a1[5];
    v14 = v9;
    v15 = v10;
    v16 = v3;
    objc_msgSend(v8, "ef_enumerateObjectsInBatchesOfSize:block:", 45000, v13);

    v11 = 1;
    v4 = v14;
LABEL_13:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

void __63__EDProtectedDatabasePersistence__deleteDatabaseIDs_fromTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "rowIDColumn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnExpressionWithFullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "in:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D1EFE0]);
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "protectedDatabaseName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullNameWithDatabaseName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithTable:where:", v10, v6);

  v12 = *(void **)(a1 + 48);
  v13 = 0;
  objc_msgSend(v12, "executeDeleteStatement:error:", v11, &v13);

}

- (BOOL)_removeExistingDatabaseIDs:(id)a3 withColumn:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v10 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fullNameWithDatabaseName:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithResultColumn:table:", v11, v13);

  objc_msgSend(v8, "columnExpressionWithFullName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke;
  v22[3] = &unk_1E94A0108;
  v17 = v14;
  v23 = v17;
  v18 = v15;
  v24 = v18;
  v27 = &v28;
  v19 = v9;
  v25 = v19;
  v20 = v7;
  v26 = v20;
  objc_msgSend(v16, "ef_enumerateObjectsInBatchesOfSize:block:", 45000, v22);

  LOBYTE(v7) = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return (char)v7;
}

void __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 40), "in:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setWhere:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke_2;
  v8[3] = &unk_1E949AF78;
  v7 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v7, "executeSelectStatement:withBlock:error:", v6, v8, 0);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) ^ 1;

}

void __83__EDProtectedDatabasePersistence__removeExistingDatabaseIDs_withColumn_connection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

- (BOOL)_isJournalMalformedForSchema:(id)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  id obj;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  v23 = v5;
  objc_msgSend((id)objc_opt_class(), "journalDatabaseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "tables");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v7, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v26, "tableExists:inDatabase:", v8, v6);

        if ((v9 & 1) == 0)
        {
LABEL_20:
          v19 = 1;
          goto LABEL_22;
        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "columns");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              v27 = 4;
              objc_msgSend(v14, "name");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v26, "columnExists:inTable:database:type:", v15, v16, v6, &v27);

              if (v17)
              {
                v18 = v27;
                if (v18 == objc_msgSend(v14, "type"))
                  continue;
              }

              goto LABEL_20;
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v19 = 0;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

- (unint64_t)_executeUpdateStatement:(id)a3 onConnection:(id)a4 errorMessage:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v14 = 0;
  v10 = objc_msgSend(v8, "executeUpdateStatement:error:", v7, &v14);
  v11 = v14;
  v12 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v8, v10, v11, v9);

  return v12;
}

- (unint64_t)_executeStatementString:(id)a3 onConnection:(id)a4 errorMessage:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "sqlConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "executeStatementString:error:", v7, &v15);
  v12 = v15;

  v13 = +[EDProtectedDatabasePersistence _resultForConnection:success:error:errorMessage:](EDProtectedDatabasePersistence, "_resultForConnection:success:error:errorMessage:", v8, v11, v12, v9);
  return v13;
}

+ (BOOL)_isRecoverableError:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "code");
  return v3 == 23 || v3 == 10;
}

+ (unint64_t)_resultForConnection:(id)a3 success:(BOOL)a4 error:(id)a5 errorMessage:(id)a6
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4)
  {
    v12 = 0;
  }
  else if ((objc_msgSend(v9, "hadIOError") & 1) != 0
         || +[EDProtectedDatabasePersistence _isRecoverableError:](EDProtectedDatabasePersistence, "_isRecoverableError:", v10))
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v9, "handleError:message:", v10, v11);
    v12 = 2;
  }

  return v12;
}

- (BOOL)supportsJournaling
{
  -[EDProtectedDatabasePersistence doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDProtectedDatabasePersistence supportsJournaling]", "EDProtectedDatabasePersistence.m", 955, "0");
}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDProtectedDatabasePersistence.m"), 971, CFSTR("%s can only be called from unit tests"), "-[EDProtectedDatabasePersistence test_tearDown]");

  }
  -[EDProtectedDatabasePersistence journalManager](self, "journalManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

}

- (OS_dispatch_queue)reconciliationQueue
{
  return self->_reconciliationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconciliationMergeHandlers, 0);
  objc_storeStrong((id *)&self->_reconciliationQueue, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_journalManager, 0);
  objc_destroyWeak((id *)&self->_database);
}

- (void)_attachJournalDatabaseToConnection:(os_log_t)log withSchema:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to initialize the journal database. Mark the current journal as merged to get it deleted.", v1, 2u);
}

- (void)_runReconciliationWithSchema:(uint64_t)a3 connection:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to upgrade journal %lu for reconciliation due to error %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_runReconciliationWithSchema:(uint64_t)a3 connection:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to attach journal %lu for reconciliation due to error %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __79__EDProtectedDatabasePersistence__mergeTable_connection_journaledRows_newRows___block_invoke_2_76_cold_1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to merge table %{public}@ for %{public}@", (uint8_t *)a3, a4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_deleteRowIDs:(uint64_t)a1 fromJournal:(NSObject *)a2 withConnection:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_DEBUG, "Deleting from journal: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
