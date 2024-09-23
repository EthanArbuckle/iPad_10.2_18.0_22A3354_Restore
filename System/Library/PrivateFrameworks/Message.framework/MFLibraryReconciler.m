@implementation MFLibraryReconciler

- (MFLibraryReconciler)initWithLibrary:(id)a3 queryProvider:(id)a4 accountsProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  MFLibraryReconciler *v11;
  void *v12;
  uint64_t v13;
  EDPersistenceHookRegistry *hookRegistry;
  MFLibraryMessageReconciler *v15;
  MFLibraryMessageReconciler *messageReconciler;
  MFLibraryThreadReconciler *v17;
  MFLibraryThreadReconciler *threadReconciler;
  uint64_t v19;
  EFScheduler *reconciliationCleanupScheduler;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFLibraryReconciler;
  v11 = -[MFLibraryReconciler init](&v22, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "persistence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_queryProvider, v9);
    objc_msgSend(v12, "hookRegistry");
    v13 = objc_claimAutoreleasedReturnValue();
    hookRegistry = v11->_hookRegistry;
    v11->_hookRegistry = (EDPersistenceHookRegistry *)v13;

    objc_storeStrong((id *)&v11->_accountsProvider, a5);
    v15 = -[MFLibraryMessageReconciler initWithLibrary:accountsProvider:]([MFLibraryMessageReconciler alloc], "initWithLibrary:accountsProvider:", v8, v10);
    messageReconciler = v11->_messageReconciler;
    v11->_messageReconciler = v15;

    v17 = -[MFLibraryThreadReconciler initWithHookRegistry:persistence:]([MFLibraryThreadReconciler alloc], "initWithHookRegistry:persistence:", v11->_hookRegistry, v12);
    threadReconciler = v11->_threadReconciler;
    v11->_threadReconciler = v17;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.message.library.reconciliationcleanup"), 25);
    v19 = objc_claimAutoreleasedReturnValue();
    reconciliationCleanupScheduler = v11->_reconciliationCleanupScheduler;
    v11->_reconciliationCleanupScheduler = (EFScheduler *)v19;

    -[EDPersistenceHookRegistry registerProtectedDataReconciliationHookResponder:](v11->_hookRegistry, "registerProtectedDataReconciliationHookResponder:", v11);
    -[EDPersistenceHookRegistry registerDatabaseChangeHookResponder:](v11->_hookRegistry, "registerDatabaseChangeHookResponder:", v11);

  }
  return v11;
}

void __59__MFLibraryReconciler_persistenceDidReconcileProtectedData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "messageReconciliationQueries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = objc_loadWeakRetained((id *)(v5 + 24));
  else
    v6 = 0;
  objc_msgSend(v6, "threadReconciliationQueries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 40);
  else
    v9 = 0;
  v10 = objc_msgSend(v9, "numberOfUnreconciledMessages");
  if (-[MFLibraryReconciler _shouldUseContextBasedReconciliationWithMessageReconciliationQueries:unreconciledMessages:](*(_QWORD *)(a1 + 32), v4, v10))
  {
    -[MFLibraryReconciler _reconcileUsingMessageReconciliationQueries:](*(_QWORD *)(a1 + 32), v4);
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(void **)(v11 + 40);
    else
      v12 = 0;
    v10 = objc_msgSend(v12, "numberOfUnreconciledMessages");
  }
  if (-[MFLibraryReconciler _shouldUseContextBasedReconciliationWithThreadReconciliationQueries:unreconciledMessages:](*(_QWORD *)(a1 + 32), v7, v10))
  {
    -[MFLibraryReconciler _reconcileUsingThreadReconciliationQueries:](*(_QWORD *)(a1 + 32), v7);
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      v14 = *(void **)(v13 + 40);
    else
      v14 = 0;
    v10 = objc_msgSend(v14, "numberOfUnreconciledMessages");
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (v15 && v10 >= 0xA)
  {
    -[MFLibraryReconciler _reconcileInboxThreadsAndMessages](v15);
    v15 = *(_QWORD *)(a1 + 32);
  }
  -[MFLibraryReconciler _reconcileRemainingEntries](v15);
  MFReconciliationLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "Library reconciliation finished", buf, 2u);
  }

  MFReconciliationSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 48);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v18, OS_SIGNPOST_INTERVAL_END, v19, "MFLibraryReconciliation", ", v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)persistenceDidReconcileProtectedData
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  EFScheduler *reconciliationCleanupScheduler;
  EFScheduler *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  os_signpost_id_t v14;
  uint8_t buf[16];

  MFReconciliationSignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  MFReconciliationLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Starting library reconciliation", buf, 2u);
  }

  MFReconciliationSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MFLibraryReconciliation", "Starting library reconciliation", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("Reconciling threads"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    reconciliationCleanupScheduler = self->_reconciliationCleanupScheduler;
  else
    reconciliationCleanupScheduler = 0;
  v10 = reconciliationCleanupScheduler;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MFLibraryReconciler_persistenceDidReconcileProtectedData__block_invoke;
  v12[3] = &unk_1E4E8AD18;
  v13 = v8;
  v14 = v4;
  v12[4] = self;
  v11 = v8;
  -[EFScheduler performBlock:](v10, "performBlock:", v12);

}

- (BOOL)_shouldUseContextBasedReconciliationWithThreadReconciliationQueries:(unint64_t)a3 unreconciledMessages:
{
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v9;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    v9 = a3 > 9 && v7 != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldUseContextBasedReconciliationWithMessageReconciliationQueries:(unint64_t)a3 unreconciledMessages:
{
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v9;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    v9 = a3 > 9 && v7 != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_reconcileRemainingEntries
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if (a1)
  {
    MFReconciliationSignpostLog();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_generate(v2);

    MFReconciliationLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "Starting library reconciliation for remaining entries", buf, 2u);
    }

    MFReconciliationSignpostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MFLibraryAllRemainingReconciliation", "Starting library all remaining entries reconciliation enableTelemetry=YES ", v13, 2u);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    objc_msgSend(*(id *)(a1 + 48), "reconcileAllObjectsWithWindow:", v7);
    objc_msgSend(*(id *)(a1 + 40), "reconcileAllObjectsWithWindow:", v7);
    MFReconciliationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Finished library reconciliation for remaining entries", v12, 2u);
    }

    MFReconciliationSignpostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v10, OS_SIGNPOST_INTERVAL_END, v3, "MFLibraryAllRemainingReconciliation", ", v11, 2u);
    }

  }
}

- (void)_reconcileUsingMessageReconciliationQueries:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t spid;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    MFReconciliationSignpostLog();
    v4 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v4);

    MFReconciliationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Starting context based library message reconciliation", buf, 2u);
    }

    MFReconciliationSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MFLibraryContextBasedReconciliation", "Starting context based library message reconciliation enableTelemetry=YES ", buf, 2u);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    v9 = 0;
    do
    {
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v10, "reconcileWithMessageReconciliationQueries:window:", v3, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        v12 = *(id *)(a1 + 48);
        objc_msgSend(v12, "reconcileWithThreadsWithConversationIDs:window:", v11, v8);

      }
      v13 = objc_msgSend(v11, "count");
      MFReconciliationLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v13;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Context based library message reconciliation finished batch. Reconciled %lu conversations", buf, 0xCu);
      }

      v9 += v13;
    }
    while (v13);
    MFReconciliationLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v9;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Context based library message reconciliation finished. Reconciled %lu conversations", buf, 0xCu);
    }

    MFReconciliationSignpostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 134349312;
      v20 = 0;
      v21 = 2050;
      v22 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v17, OS_SIGNPOST_INTERVAL_END, spid, "MFLibraryContextBasedReconciliation", "ContextType=%{public,signpost.telemetry:number1}ld Conversations=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
    }

  }
}

- (void)_reconcileUsingThreadReconciliationQueries:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t spid;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    MFReconciliationSignpostLog();
    v4 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v4);

    MFReconciliationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Starting context based library thread reconciliation", buf, 2u);
    }

    MFReconciliationSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MFLibraryContextBasedReconciliation", "Starting context based library thread reconciliation", buf, 2u);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    v9 = 0;
    do
    {
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v10, "reconcileWithThreadReconciliationQueries:window:", v3, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        v12 = *(id *)(a1 + 48);
        objc_msgSend(v12, "reconcileWithThreadsWithConversationIDs:window:", v11, v8);

      }
      v13 = objc_msgSend(v11, "count");
      MFReconciliationLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v13;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Context based library thread reconciliation finished batch. Reconciled %lu conversations", buf, 0xCu);
      }

      v9 += v13;
    }
    while (v13);
    MFReconciliationLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v9;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Context based library thread reconciliation finished. Reconciled %lu conversations", buf, 0xCu);
    }

    MFReconciliationSignpostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 134349312;
      v20 = 1;
      v21 = 2050;
      v22 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v17, OS_SIGNPOST_INTERVAL_END, spid, "MFLibraryContextBasedReconciliation", "ContextType=%{public,signpost.telemetry:number1}ld Conversations=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
    }

  }
}

- (void)_reconcileInboxThreadsAndMessages
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t spid;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    MFReconciliationSignpostLog();
    v2 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v2);

    MFReconciliationSignpostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MFLibraryContextBasedReconciliation", "Starting context based library inbox reconciliation", buf, 2u);
    }

    MFReconciliationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Starting inbox library reconciliation", buf, 2u);
    }

    v6 = 0;
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
      v8 = *(id *)(a1 + 40);
      objc_msgSend(v8, "reconcileInboxMessagesWithWindow:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "count"))
      {
        v10 = *(id *)(a1 + 48);
        objc_msgSend(v10, "reconcileWithThreadsWithConversationIDs:window:", v9, v7);

      }
      v11 = objc_msgSend(v9, "count");
      MFReconciliationLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = v11;
        _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "Inbox library reconciliation finished batch. Reconciled %lu conversations", buf, 0xCu);
      }

      v6 += v11;
    }
    while (v11);
    MFReconciliationLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v6;
      _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Inbox library reconciliation finished. Reconciled %lu conversations", buf, 0xCu);
    }

    MFReconciliationSignpostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 134349312;
      v18 = 2;
      v19 = 2050;
      v20 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A4F90000, v15, OS_SIGNPOST_INTERVAL_END, spid, "MFLibraryContextBasedReconciliation", "ContextType=%{public,signpost.telemetry:number1}ld Conversations=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadReconciler, 0);
  objc_storeStrong((id *)&self->_messageReconciler, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_destroyWeak((id *)&self->_queryProvider);
  objc_storeStrong((id *)&self->_reconciliationCleanupScheduler, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
}

@end
