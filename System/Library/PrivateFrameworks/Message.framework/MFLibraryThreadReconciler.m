@implementation MFLibraryThreadReconciler

- (MFLibraryThreadReconciler)initWithHookRegistry:(id)a3 persistence:(id)a4
{
  id v7;
  id v8;
  MFLibraryThreadReconciler *v9;
  MFLibraryThreadReconciler *v10;
  uint64_t v11;
  EDThreadPersistence *threadPersistence;
  uint64_t v13;
  EDPersistenceDatabase *database;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFLibraryThreadReconciler;
  v9 = -[MFLibraryThreadReconciler init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hookRegistry, a3);
    objc_msgSend(v8, "threadPersistence");
    v11 = objc_claimAutoreleasedReturnValue();
    threadPersistence = v10->_threadPersistence;
    v10->_threadPersistence = (EDThreadPersistence *)v11;

    objc_msgSend(v8, "database");
    v13 = objc_claimAutoreleasedReturnValue();
    database = v10->_database;
    v10->_database = (EDPersistenceDatabase *)v13;

  }
  return v10;
}

uint64_t __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "threadScopesByDatabaseID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(_QWORD *)(a1 + 48);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_2;
    v47[3] = &unk_1E4E8CC80;
    v41 = v38;
    v48 = v41;
    v6 = v39;
    v49 = v6;
    v7 = v4;
    v50 = v7;
    if ((objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v5, v47, 0) & 1) != 0)
    {
      v8 = objc_msgSend(v7, "count");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v8;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8 > 0x18;
      MFReconciliationLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v40 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD **)(a1 + 40);
            if (v20)
              v20 = (_QWORD *)v20[3];
            v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            v22 = v20;
            objc_msgSend(v22, "setPriorityForDisplayMessageSenderForThreadObjectID:", v21);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v17);
      }

      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "in:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("threads"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E4F69CD0, CFSTR("journaled"));
      objc_msgSend(v25, "setWhereClause:", v24);
      v42 = 0;
      v26 = objc_msgSend(v3, "executeUpdateStatement:rowsChanged:", v25, &v42);
      if ((v26 & 1) != 0)
      {
        MFReconciliationLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_2((uint64_t)&v42, v27, v28, v29, v30, v31, v32, v33);

        if (v42 != v40)
        {
          MFReconciliationLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_1(&v42, v40, v34);

        }
        v35 = *(_QWORD *)(a1 + 40);
        if (v35)
          v36 = *(void **)(v35 + 8);
        else
          v36 = 0;
        objc_msgSend(v36, "persistenceIsReconcilingJournaledThreadsWithObjectIDs:generationWindow:", v16, *(_QWORD *)(a1 + 32));
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v26 = 1;
  }

  return v26;
}

- (void)reconcileAllObjectsWithWindow:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFReconciliationSignpostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  MFReconciliationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Starting thread reconciliation for all threads", (uint8_t *)&v17, 2u);
  }

  MFReconciliationSignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MFLibraryThreadReconciliation", "Starting reconciliation of all threads enableTelemetry=YES ", (uint8_t *)&v17, 2u);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[MFLibraryThreadReconciler _journaledExpression]((uint64_t)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MFLibraryThreadReconciler _performReconciliationWithExpression:window:]((uint64_t)self, v11, v4);
  MFReconciliationLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = v12;
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Finished thread reconciliation for all threads. Reconciled %lu threads", (uint8_t *)&v17, 0xCu);
  }

  MFReconciliationSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v17 = 134349056;
    v18 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v15, OS_SIGNPOST_INTERVAL_END, v6, "MFLibraryThreadReconciliation", "ThreadsReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(v10, "timeIntervalSinceNow");
  if (v16 < -10.0)
    EFSaveTailspin();

}

- (uint64_t)_performReconciliationWithExpression:(void *)a3 window:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a2;
  v12 = a3;
  if (a1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("conversation"), CFSTR("threads"));
    objc_msgSend(v6, "addResultColumn:", CFSTR("scope"));
    objc_msgSend(v6, "addResultColumn:", *MEMORY[0x1E0D1EE00]);
    objc_msgSend(v6, "setWhere:", v5);
    objc_msgSend(v6, "setLimit:", 25);
    objc_msgSend(v6, "orderByColumn:ascending:", CFSTR("date"), 0);
    objc_msgSend(v6, "orderByColumn:ascending:", CFSTR("conversation"), 1);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      if (!*((_BYTE *)v21 + 24))
        break;
      v8 = *(id *)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFLibraryThreadReconciler _performReconciliationWithExpression:window:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke;
      v13[3] = &unk_1E4E8CCA8;
      v17 = &v24;
      v14 = v12;
      v15 = a1;
      v16 = v6;
      v18 = &v28;
      v19 = &v20;
      objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

      v10 = *(id *)(a1 + 8);
      objc_msgSend(v10, "persistenceDidFinishThreadUpdates");

    }
    while (*((_BYTE *)v25 + 24));
    a1 = v29[3];
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);

  }
  return a1;
}

- (id)_journaledExpression
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("journaled"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "equalTo:", &unk_1E4F69CB8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_expressionForConversationIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "in:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reconcileWithThreadsWithConversationIDs:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  double v23;
  int v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MFReconciliationSignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  MFReconciliationLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Starting context based thread reconciliation for threads", (uint8_t *)&v24, 2u);
  }

  MFReconciliationSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MFLibraryThreadContextBasedReconciliation", "Starting context based reconciliation enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v14 = objc_alloc(MEMORY[0x1E0D1EF90]);
  -[MFLibraryThreadReconciler _journaledExpression]((uint64_t)self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  -[MFLibraryThreadReconciler _expressionForConversationIDs:]((uint64_t)self, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithExpressions:", v17);

  v19 = -[MFLibraryThreadReconciler _performReconciliationWithExpression:window:]((uint64_t)self, v18, v7);
  MFReconciliationLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134217984;
    v25 = v19;
    _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "Finished context based thread reconciliation for threads. Reconciled %lu threads", (uint8_t *)&v24, 0xCu);
  }

  MFReconciliationSignpostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    v24 = 134349056;
    v25 = v19;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v22, OS_SIGNPOST_INTERVAL_END, v9, "MFLibraryThreadContextBasedReconciliation", "ThreadsReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend(v13, "timeIntervalSinceNow");
  if (v23 < -10.0)
    EFSaveTailspin();

}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E380]), "initWithConversationID:threadScope:", v4, v9);
  objc_msgSend(a1[5], "addObject:", v10);
  objc_msgSend(a1[6], "addObject:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = v3;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Reconciled %lu threads in batch, but marked %lu threads as reconciled", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, a2, a3, "Marked %lu threads as reconciled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, a2, a3, "Reconciling %lu threads in batch", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
