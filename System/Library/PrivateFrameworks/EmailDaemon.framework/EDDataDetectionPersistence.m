@implementation EDDataDetectionPersistence

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(a1, "_dataDetectionResultsTableSchemaWithName:", CFSTR("data_detection_results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_dataDetectionResultsTableSchemaWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("global_message_id"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("category"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("value"), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithName:rowIDType:columns:", v3, 1, v8);

  v12[0] = CFSTR("global_message_id");
  v12[1] = CFSTR("category");
  v12[2] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addUniquenessConstraintForColumns:conflictResolution:", v10, 1);

  return v9;
}

- (EDDataDetectionPersistence)initWithDatabase:(id)a3 messagePersistence:(id)a4 hookResponder:(id)a5
{
  id v10;
  id v11;
  id v12;
  EDDataDetectionPersistence *v13;
  EDDataDetectionPersistence *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDDataDetectionPersistence;
  v13 = -[EDDataDetectionPersistence init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_database, a3);
    objc_storeWeak((id *)&v14->_hookResponder, v12);
    objc_storeStrong((id *)&v14->_messagePersistence, a4);
    if (v12)
    {
      if (!-[EDDataDetectionPersistence _hookResponderRespondsToRequiredMethods:](v14, "_hookResponderRespondsToRequiredMethods:", v12))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("EDDataDetectionPersistence.m"), 68, CFSTR("HookResponder does not respond to all of the methods required by EDDataDetectionPersistence."));

      }
    }
  }

  return v14;
}

- (BOOL)_hookResponderRespondsToRequiredMethods:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

void ___ef_log_EDDataDetectionPersistence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDDataDetectionPersistence");
  v1 = (void *)_ef_log_EDDataDetectionPersistence_log;
  _ef_log_EDDataDetectionPersistence_log = (uint64_t)v0;

}

- (BOOL)addDataDetectionResults:(id)a3 globalMessageID:(int64_t)a4
{
  id v6;
  EDPersistenceDatabaseGenerationWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  EDDataDetectionPersistence *v20;
  id v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDDataDetectionPersistence hookResponder](self, "hookResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistenceWillBeginUpdates");

    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    -[EDDataDetectionPersistence database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDDataDetectionPersistence addDataDetectionResults:globalMessageID:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __70__EDDataDetectionPersistence_addDataDetectionResults_globalMessageID___block_invoke;
    v19 = &unk_1E949C190;
    v22 = &v24;
    v20 = self;
    v21 = v6;
    v23 = a4;
    objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, &v16);

    -[EDDataDetectionPersistence _getPersistedMessagesFromGlobalMessageID:](self, "_getPersistedMessagesFromGlobalMessageID:", a4, v16, v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDDataDetectionPersistence hookResponder](self, "hookResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistenceDidAddDataDetectionResults:generationWindow:", v11, v7);

    -[EDDataDetectionPersistence hookResponder](self, "hookResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistenceDidFinishUpdates");

    v14 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __70__EDDataDetectionPersistence_addDataDetectionResults_globalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addDataDetectionResults:withGlobalMessageID:toTable:withConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), CFSTR("data_detection_results"), v3);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v4;
}

- (BOOL)_addDataDetectionResults:(id)a3 withGlobalMessageID:(int64_t)a4 toTable:(id)a5 withConnection:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  v33 = (id)0xAAAAAAAAAAAAAAAALL;
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", v10, 4);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __98__EDDataDetectionPersistence__addDataDetectionResults_withGlobalMessageID_toTable_withConnection___block_invoke;
  v27[3] = &unk_1E949C1B8;
  v27[4] = &v28;
  v27[5] = a4;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
  v12 = v29[5];
  v26 = 0;
  v13 = objc_msgSend(v11, "executeInsertStatement:error:", v12, &v26);
  v14 = v26;
  _ef_log_EDDataDetectionPersistence();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v13 & 1) != 0)
  {
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedDictionary:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDDataDetectionPersistence _addDataDetectionResults:withGlobalMessageID:toTable:withConnection:].cold.1(v18, buf, v17);
    }

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[EDDataDetectionPersistence _addDataDetectionResults:withGlobalMessageID:toTable:withConnection:].cold.2((uint64_t)v14, v16, v19, v20, v21, v22, v23, v24);

    objc_msgSend(v11, "handleError:message:", v14, CFSTR("Inserting into the data detection results table"));
  }

  _Block_object_dispose(&v28, 8);
  return v13;
}

void __98__EDDataDetectionPersistence__addDataDetectionResults_withGlobalMessageID_toTable_withConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("value"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("category"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("global_message_id"));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)getDataDetectionResultsForGlobalMessageID:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = (id)0xAAAAAAAAAAAAAAAALL;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EDDataDetectionPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDDataDetectionPersistence getDataDetectionResultsForGlobalMessageID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke;
  v14[3] = &unk_1E949B778;
  v14[4] = &v15;
  v14[5] = a3;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v14);

  v7 = objc_msgSend((id)v16[5], "count");
  _ef_log_EDDataDetectionPersistence();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedDictionary:", v16[5]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v22 = a3;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Database read data detection results for message %{public}lld: %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v22 = a3;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Did not find any data detection results for message %{public}lld", buf, 0xCu);
  }

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

uint64_t __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  _QWORD v18[5];

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("value"), CFSTR("data_detection_results"));
  objc_msgSend(v4, "addResultColumn:", CFSTR("category"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "is:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v7);

  v17 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_2;
  v18[3] = &unk_1E949B090;
  v18[4] = *(_QWORD *)(a1 + 32);
  LOBYTE(v7) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v18, &v17);
  v8 = v17;
  if ((v7 & 1) == 0)
  {
    _ef_log_EDDataDetectionPersistence();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Reading data detection results"));
  }

  return 1;
}

void __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v6, v4);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

- (id)getDataDetectionResultRowIDsForGlobalMessageID:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[8];
  _QWORD v10[5];
  id v11;
  _QWORD v12[3];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = (id)0xAAAAAAAAAAAAAAAALL;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__6;
  v10[4] = __Block_byref_object_dispose__6;
  v11 = 0;
  -[EDDataDetectionPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDDataDetectionPersistence getDataDetectionResultRowIDsForGlobalMessageID:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke;
  v9[3] = &unk_1E949C1E0;
  v9[4] = v12;
  v9[5] = &v14;
  v9[6] = v10;
  v9[7] = a3;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  v7 = (id)v15[5];
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

uint64_t __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  _QWORD v21[5];

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("ROWID"), CFSTR("data_detection_results"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "is:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v7);

  v21[1] = 3221225472;
  v21[2] = __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_2;
  v21[3] = &unk_1E949B090;
  v9 = (uint64_t)(a1 + 6);
  v8 = a1[6];
  v21[4] = a1[5];
  v10 = *(_QWORD *)(v8 + 8);
  obj = *(id *)(v10 + 40);
  v21[0] = MEMORY[0x1E0C809B0];
  v11 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v21, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v11;
  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    _ef_log_EDDataDetectionPersistence();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_cold_1(v9, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(v3, "handleError:message:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40), CFSTR("Getting data detection results from message ID"));
  }

  return 1;
}

void __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_getPersistedMessagesFromGlobalMessageID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[EDDataDetectionPersistence messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistedMessageIDsForGlobalMessageIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDDataDetectionPersistence messagePersistence](self, "messagePersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDMessageChangeHookResponder)hookResponder
{
  return (EDMessageChangeHookResponder *)objc_loadWeakRetained((id *)&self->_hookResponder);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hookResponder);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_addDataDetectionResults:(os_log_t)log withGlobalMessageID:toTable:withConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Successfully detected and persisted data detection results: %@", buf, 0xCu);

}

- (void)_addDataDetectionResults:(uint64_t)a3 withGlobalMessageID:(uint64_t)a4 toTable:(uint64_t)a5 withConnection:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Error: %@ unable to persist all results into data_detection_results table", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __72__EDDataDetectionPersistence_getDataDetectionResultsForGlobalMessageID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Error reading data detection results: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __77__EDDataDetectionPersistence_getDataDetectionResultRowIDsForGlobalMessageID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Error getting data detection results from message ID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
