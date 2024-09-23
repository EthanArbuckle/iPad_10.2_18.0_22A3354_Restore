@implementation MFLibraryMessageReconciler

+ (unint64_t)numberOfUnreconciledMessagesWithLibrary:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithMessagePersistence:]((uint64_t)a1, v5);

  return v6;
}

+ (uint64_t)numberOfUnreconciledMessagesWithMessagePersistence:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v4, v5, MEMORY[0x1E0C9AA60], 256, 0);

  v7 = objc_msgSend(v2, "countOfJournaledMessagesMatchingQuery:", v6);
  return v7;
}

- (MFLibraryMessageReconciler)initWithLibrary:(id)a3 accountsProvider:(id)a4
{
  id v6;
  id v7;
  MFLibraryMessageReconciler *v8;
  void *v9;
  void *v10;
  void *v11;
  MFMailMessageLibraryQueryTransformer *v12;
  void *v13;
  uint64_t v14;
  MFMailMessageLibraryQueryTransformer *transformer;
  uint64_t v16;
  EDPersistenceDatabase *database;
  uint64_t v18;
  EDPersistenceHookRegistry *hookRegistry;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MFLibraryMessageReconciler;
  v8 = -[MFLibraryMessageReconciler init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "persistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messagePersistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_messagePersistence, v10);

    objc_storeStrong((id *)&v8->_accountsProvider, a4);
    objc_msgSend(v6, "persistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [MFMailMessageLibraryQueryTransformer alloc];
    objc_msgSend(v11, "messagePersistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MFMailMessageLibraryQueryTransformer initWithMessagePersistence:](v12, "initWithMessagePersistence:", v13);
    transformer = v8->_transformer;
    v8->_transformer = (MFMailMessageLibraryQueryTransformer *)v14;

    objc_msgSend(v11, "database");
    v16 = objc_claimAutoreleasedReturnValue();
    database = v8->_database;
    v8->_database = (EDPersistenceDatabase *)v16;

    objc_msgSend(v11, "hookRegistry");
    v18 = objc_claimAutoreleasedReturnValue();
    hookRegistry = v8->_hookRegistry;
    v8->_hookRegistry = (EDPersistenceHookRegistry *)v18;

  }
  return v8;
}

uint64_t __38__MFLibraryMessageReconciler__cleanup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  id v19;
  id v20;

  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1E2C0]);
    v5 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v5, v6, MEMORY[0x1E0C9AA60], 256, 0);

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));
    else
      WeakRetained = 0;
    v10 = objc_msgSend(WeakRetained, "countOfJournaledMessagesMatchingQuery:", v7);

    if (v10)
    {
      v11 = 1;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v3, "sqlConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v13 = objc_msgSend(v12, "executeStatementString:error:", CFSTR("DELETE FROM protected_message_data WHERE ROWID IN (SELECT message_data_id FROM message_data_deleted)"), &v20);
    v14 = v20;

    if (v13)
    {
      objc_msgSend(v3, "sqlConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v14;
      v16 = objc_msgSend(v15, "executeStatementString:error:", CFSTR("DELETE FROM message_data_deleted"), &v19);
      v17 = v19;

      if ((v16 & 1) != 0)
      {
        v11 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v14 = v17;
    }
    objc_msgSend(v3, "handleError:message:", v14, CFSTR("Cleaning up messages after reconciliation"));
    v11 = 0;
    v17 = v14;
    goto LABEL_12;
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (void)reconcileAllObjectsWithWindow:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  MFReconciliationSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  MFReconciliationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Starting message reconciliation for all messages", buf, 2u);
  }

  MFReconciliationSignpostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFLibraryMessageAllMessageReconciliation", "Starting all message reconciliation enableTelemetry=YES ", buf, 2u);
  }

  MFReconciliationLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Reconciling all journaled messages", buf, 2u);
  }

  v12 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v13, v14, MEMORY[0x1E0C9AA60], 256, 0);

  v20 = 0;
  -[MFLibraryMessageReconciler _performReconciliationForQuery:window:reconciledMessageCount:reconciledConversations:]((uint64_t)self, v15, v4, &v20, 0);
  -[MFLibraryMessageReconciler _cleanup]((uint64_t)self);
  MFReconciliationLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v20;
    _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "Finished message reconciliation for all messages. Reconciled %lu messages", buf, 0xCu);
  }

  MFReconciliationSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 134349056;
    v22 = v20;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v18, OS_SIGNPOST_INTERVAL_END, v7, "MFLibraryMessageAllMessageReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(v5, "timeIntervalSinceNow");
  if (v19 < -10.0)
    EFSaveTailspin();

}

- (unint64_t)numberOfUnreconciledMessages
{
  id WeakRetained;
  unint64_t v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_messagePersistence);
  else
    WeakRetained = 0;
  v3 = +[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithMessagePersistence:]((uint64_t)MFLibraryMessageReconciler, WeakRetained);

  return v3;
}

- (BOOL)_performReconciliationForQuery:(void *)a3 window:(_QWORD *)a4 reconciledMessageCount:(void *)a5 reconciledConversations:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  unint64_t v17;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    v12 = 0;
    v17 = 0;
    do
    {
      v13 = -[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:](a1, v9, v10, (uint64_t *)&v17, v11);
      v14 = v13;
      v12 += v17;
    }
    while (v17 > 0x63 && v13);
    if (a4)
      *a4 = v12;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_performReconciliationBatchForQuery:(void *)a3 window:(uint64_t *)a4 reconciledMessageCount:(void *)a5 reconciledConversations:
{
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  _BOOL8 v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v23 = a3;
  v9 = a5;
  if (a1)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(WeakRetained, "persistedMessagesMatchingQuery:limit:requireProtectedData:", v24, 100, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16, v23);
      if (v13)
      {
        v14 = *(_QWORD *)v31;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15), "conversationID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v13);
      }

    }
    if (objc_msgSend(v11, "count", v23))
    {
      v17 = *(id *)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __120__MFLibraryMessageReconciler__performReconciliationBatchForQuery_window_reconciledMessageCount_reconciledConversations___block_invoke;
      v25[3] = &unk_1E4E8A7D8;
      v26 = v23;
      v29 = &v34;
      v27 = v11;
      v28 = a1;
      objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v25);

    }
    v19 = v35;
    if (a4)
    {
      if (*((_BYTE *)v35 + 24))
      {
        v20 = objc_msgSend(v11, "count");
        v19 = v35;
      }
      else
      {
        v20 = 0;
      }
      *a4 = v20;
    }
    v21 = *((unsigned __int8 *)v19 + 24) != 0;

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_cleanup
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (a1)
  {
    MFReconciliationLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "Reconciled all messages. Cleaning up...", buf, 2u);
    }

    v3 = *(id *)(a1 + 16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFLibraryMessageReconciler _cleanup]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__MFLibraryMessageReconciler__cleanup__block_invoke;
    v5[3] = &unk_1E4E8AB20;
    v5[4] = a1;
    objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);

  }
}

- (id)reconcileWithMessageReconciliationQueries:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  double v18;
  double v19;
  NSObject *v20;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  MFReconciliationSignpostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  MFReconciliationLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "Starting context based message reconciliation batch", (uint8_t *)&v22, 2u);
  }

  MFReconciliationSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MFLibraryMessageContextBasedReconciliation", "Starting context based reconciliation enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  v15 = -[MFLibraryMessageReconciler _reconcileMessagesWithQueries:window:signpostID:reconciledConversations:]((uint64_t)self, v6, v7, v10, v11);
  MFReconciliationSignpostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v22 = 134349056;
    v23 = v15;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v17, OS_SIGNPOST_INTERVAL_END, v10, "MFLibraryMessageContextBasedReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v8, "timeIntervalSinceNow");
  v19 = v18;
  MFReconciliationLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v22 = 134217984;
    v23 = v15;
    _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_INFO, "Reconciled batch of %lu messages using message query", (uint8_t *)&v22, 0xCu);
  }

  if (v19 < -10.0)
    EFSaveTailspin();

  return v11;
}

- (uint64_t)_reconcileMessagesWithQueries:(void *)a3 window:(os_signpost_id_t)a4 signpostID:(void *)a5 reconciledConversations:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  void *v25;
  id obj;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint8_t buf[8];
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v30 = a3;
  v31 = a5;
  v29 = a1;
  v25 = v8;
  if (a1)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v8;
    v9 = 0;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16, v8);
    if (v10)
    {
      v28 = *(_QWORD *)v35;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "queryOptions") & 0x100) == 0)
        {
          v13 = objc_alloc(MEMORY[0x1E0D1E2C0]);
          v14 = objc_opt_class();
          objc_msgSend(v12, "predicate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sortDescriptors");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v12, "queryOptions");
          objc_msgSend(v12, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v13, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v14, v15, v16, v17 | 0x100, v18);

          v12 = (id)v19;
        }
        v33 = 0;
        MFReconciliationSignpostLog();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4F90000, v21, OS_SIGNPOST_EVENT, a4, "MFLibraryMessageContextBasedReconciliation", "Reconciling for query", buf, 2u);
        }

        v22 = -[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:](v29, v12, v30, &v33, v31);
        v23 = v33;

        v9 += v23;
        if (!v22)
          break;
        if (v10 == ++v11)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)reconcileWithThreadReconciliationQueries:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  double v20;
  NSObject *v21;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  MFReconciliationSignpostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "ef_map:", &__block_literal_global_38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MFReconciliationLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_INFO, "Starting context based message reconciliation batch", (uint8_t *)&v23, 2u);
  }

  MFReconciliationSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MFLibraryMessageContextBasedReconciliation", "Starting context based reconciliation enableTelemetry=YES ", (uint8_t *)&v23, 2u);
  }

  v16 = -[MFLibraryMessageReconciler _reconcileMessagesWithQueries:window:signpostID:reconciledConversations:]((uint64_t)self, v12, v7, v10, v11);
  MFReconciliationSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v23 = 134349056;
    v24 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v18, OS_SIGNPOST_INTERVAL_END, v10, "MFLibraryMessageContextBasedReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(v8, "timeIntervalSinceNow");
  v20 = v19;
  MFReconciliationLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v23 = 134217984;
    v24 = v16;
    _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_INFO, "Reconciled batch of %lu messages using thread query", (uint8_t *)&v23, 0xCu);
  }

  if (v20 < -10.0)
    EFSaveTailspin();

  return v11;
}

id __78__MFLibraryMessageReconciler_reconcileWithThreadReconciliationQueries_window___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v4 = objc_opt_class();
  objc_msgSend(v2, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "queryOptions");
  objc_msgSend(v2, "targetClassOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithTargetClass:predicate:sortDescriptors:limit:queryOptions:targetClassOptions:label:", v4, v5, v6, 0, v7, v8, 0);

  return v9;
}

- (id)reconcileInboxMessagesWithWindow:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  MFReconciliationSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  v24 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  MFReconciliationLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "Starting inbox reconciliation", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithType:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v12, v10, v14, 256, 0);

  MFReconciliationSignpostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFLibraryMessageContextBasedReconciliation", "Starting inbox reconciliation enableTelemetry=YES ", buf, 2u);
  }

  -[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:]((uint64_t)self, v15, v4, &v24, v8);
  MFReconciliationSignpostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 134349056;
    v26 = v24;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v19, OS_SIGNPOST_INTERVAL_END, v7, "MFLibraryMessageContextBasedReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(v5, "timeIntervalSinceNow");
  v21 = v20;
  MFReconciliationLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v24;
    _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_INFO, "Finished inbox reconciliation. Reconciled %lu messages", buf, 0xCu);
  }

  if (v21 < -10.0)
    EFSaveTailspin();

  return v8;
}

BOOL __120__MFLibraryMessageReconciler__performReconciliationBatchForQuery_window_reconciledMessageCount_reconciledConversations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "ef_map:", &__block_literal_global_23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E4F69CA0, CFSTR("journaled"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "in:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWhereClause:", v7);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "executeUpdateStatement:error:", v5, 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      MFReconciliationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(*(id *)(a1 + 40), "count");
        *(_DWORD *)buf = 134217984;
        v24 = v9;
        _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "reconciled %llu messages", buf, 0xCu);
      }

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *(id *)(a1 + 40);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setIsJournaled:", 0, (_QWORD)v18);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

      v14 = *(_QWORD *)(a1 + 48);
      if (v14)
        v15 = *(void **)(v14 + 8);
      else
        v15 = 0;
      objc_msgSend(v15, "persistenceDidReconcileJournaledMessages:generationWindow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), (_QWORD)v18);
    }
    v16 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v16 = 1;
  }

  return v16;
}

id __120__MFLibraryMessageReconciler__performReconciliationBatchForQuery_window_reconciledMessageCount_reconciledConversations___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "libraryID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_destroyWeak((id *)&self->_messagePersistence);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
}

@end
