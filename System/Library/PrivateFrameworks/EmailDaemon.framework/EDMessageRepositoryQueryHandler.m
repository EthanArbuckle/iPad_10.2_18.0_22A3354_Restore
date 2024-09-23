@implementation EDMessageRepositoryQueryHandler

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMQuery)query
{
  return self->_query;
}

- (id)_distinctObjectIDs:(id)a3 queryHandlerLog:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  size_t v17;
  _DWORD __b[162];
  int v19[2];
  int v20;
  pid_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternal");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    if (v11 != objc_msgSend(v7, "count"))
    {
      v12 = v6;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v10, "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "differenceFromArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "debugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        __b[0] = 138412290;
        *(_QWORD *)&__b[1] = v16;
        _os_log_fault_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_FAULT, "Adding objectIDs but duplicate found %@", (uint8_t *)__b, 0xCu);

      }
      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(_QWORD *)v19 = 0xE00000001;
      v20 = 1;
      v21 = getpid();
      v17 = 648;
      if (!sysctl(v19, 4u, __b, &v17, 0, 0) && (__b[8] & 0x800) != 0)
        __debugbreak();
    }

  }
  return v7;
}

- (BOOL)start
{
  atomic_flag *p_didStart;
  unsigned __int8 v3;

  p_didStart = &self->_didStart;
  do
    v3 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  return (v3 & 1) == 0;
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  return self->_resultsObserver;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EDMessageRepositoryQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 observer:(id)a7 observationIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  EDMessageRepositoryQueryHandler *v17;
  uint64_t v18;
  EMQuery *query;
  id v20;
  void *v21;
  uint64_t v22;
  EFLocked *summaryLoadersMapTable;
  NSSet *mailboxes;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v14 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v15 = a7;
  v16 = a8;
  v31.receiver = self;
  v31.super_class = (Class)EDMessageRepositoryQueryHandler;
  v17 = -[EDMessageRepositoryQueryHandler init](&v31, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    query = v17->_query;
    v17->_query = (EMQuery *)v18;

    objc_storeStrong((id *)&v17->_messagePersistence, a4);
    objc_storeStrong((id *)&v17->_hookRegistry, a5);
    objc_storeStrong((id *)&v17->_remindMeNotificationController, a6);
    objc_storeStrong((id *)&v17->_resultsObserver, a7);
    objc_storeStrong((id *)&v17->_observationIdentifier, a8);
    v20 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithObject:", v21);
    summaryLoadersMapTable = v17->_summaryLoadersMapTable;
    v17->_summaryLoadersMapTable = (EFLocked *)v22;

    mailboxes = v17->_mailboxes;
    v17->_mailboxes = 0;

    v25 = (void *)MEMORY[0x1E0D1E248];
    -[EMQuery sortDescriptors](v17->_query, "sortDescriptors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_dateSortOrder = objc_msgSend(v25, "dateSortOrderFromSortDescriptors:", v26);

  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[EDMessageRepositoryQueryHandler cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EDMessageRepositoryQueryHandler;
  -[EDMessageRepositoryQueryHandler dealloc](&v3, sel_dealloc);
}

- (void)test_tearDown
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageRepositoryQueryHandler.m"), 48, CFSTR("%s can only be called from unit tests"), "-[EDMessageRepositoryQueryHandler test_tearDown]");

  }
  -[EDMessageRepositoryQueryHandler tearDown](self, "tearDown");
}

- (void)cancel
{
  EFLocked *summaryLoadersMapTable;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  summaryLoadersMapTable = self->_summaryLoadersMapTable;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__EDMessageRepositoryQueryHandler_cancel__block_invoke;
  v11[3] = &unk_1E949F078;
  v11[4] = &v12;
  -[EFLocked performWhileLocked:](summaryLoadersMapTable, "performWhileLocked:", v11);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (id)v13[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __41__EDMessageRepositoryQueryHandler_cancel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSSet)mailboxes
{
  NSSet *mailboxes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *v12;
  char v14;

  mailboxes = self->_mailboxes;
  if (!mailboxes)
  {
    v4 = (void *)MEMORY[0x1E0D1E248];
    -[EMQuery predicate](self->_query, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mailboxPersistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailboxScopeForPredicate:withMailboxTypeResolver:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxPersistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v10, &v14);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v12 = self->_mailboxes;
    self->_mailboxes = v11;

    mailboxes = self->_mailboxes;
  }
  return mailboxes;
}

- (BOOL)keyPathsAffectSorting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EDMessageRepositoryQueryHandler query](self, "query", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "containsObject:", v10);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)requestSummaryForMessageObjectID:(id)a3
{
  id v4;
  uint64_t v5;
  EFLocked *summaryLoadersMapTable;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  EFLocked *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__21;
  v24 = __Block_byref_object_dispose__21;
  v25 = 0;
  v5 = MEMORY[0x1E0C809B0];
  summaryLoadersMapTable = self->_summaryLoadersMapTable;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke;
  v17[3] = &unk_1E949F0A0;
  v19 = &v20;
  v7 = v4;
  v18 = v7;
  -[EFLocked performWhileLocked:](summaryLoadersMapTable, "performWhileLocked:", v17);
  v8 = (void *)v21[5];
  if (v8)
    objc_msgSend(v8, "cancel");
  -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSummaryForMessageObjectID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_summaryLoadersMapTable;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke_2;
  v14[3] = &unk_1E949F0C8;
  v15 = v10;
  v12 = v7;
  v16 = v12;
  v13 = v10;
  -[EFLocked performWhileLocked:](v11, "performWhileLocked:", v14);

  _Block_object_dispose(&v20, 8);
}

void __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke(uint64_t a1, void *a2)
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

uint64_t __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)messageReconciliationQueries
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryOptions");

  if ((v4 & 8) == 0)
    return 0;
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)threadReconciliationQueries
{
  return 0;
}

- (int64_t)dateSortOrder
{
  return self->_dateSortOrder;
}

- (EFLocked)summaryLoadersMapTable
{
  return self->_summaryLoadersMapTable;
}

- (void)setSummaryLoadersMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLoadersMapTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLoadersMapTable, 0);
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_storeStrong((id *)&self->_resultsObserver, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

@end
