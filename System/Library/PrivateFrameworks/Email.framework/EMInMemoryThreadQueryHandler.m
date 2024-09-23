@implementation EMInMemoryThreadQueryHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EMInMemoryThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_18 != -1)
    dispatch_once(&log_onceToken_18, block);
  return (OS_os_log *)(id)log_log_18;
}

void __35__EMInMemoryThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_18;
  log_log_18 = (uint64_t)v1;

}

- (EMInMemoryThreadQueryHandler)initWithQuery:(id)a3 repository:(id)a4 mailboxTypeResolver:(id)a5 resultsObserver:(id)a6 observationIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EMInMemoryThreadQueryHandler *v16;
  EMInMemoryThreadQueryHandler *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  EFAssertableScheduler *threadCollectionScheduler;
  EMInMemoryThreadCollection *v22;
  EFAssertableScheduler *v23;
  void *v24;
  uint64_t v25;
  EMInMemoryThreadCollection *threadCollection;
  EMThreadReloadSummaryHelper *v27;
  EMThreadReloadSummaryHelper *reloadSummaryHelper;
  uint64_t v30;
  id v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v31 = a7;
  v32.receiver = self;
  v32.super_class = (Class)EMInMemoryThreadQueryHandler;
  v16 = -[EMInMemoryThreadQueryHandler init](&v32, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_repository, v13);
    v18 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.%p"), objc_opt_class(), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serialDispatchQueueSchedulerWithName:qualityOfService:", v19, 25);
    v20 = objc_claimAutoreleasedReturnValue();
    threadCollectionScheduler = v17->_threadCollectionScheduler;
    v17->_threadCollectionScheduler = (EFAssertableScheduler *)v20;

    v22 = [EMInMemoryThreadCollection alloc];
    v23 = v17->_threadCollectionScheduler;
    +[EMInMemoryThreadQueryHandler log](EMInMemoryThreadQueryHandler, "log");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = 0;
    v25 = -[EMInMemoryThreadCollection initWithQuery:mailboxTypeResolver:dataSource:delgate:scheduler:logClient:limitedCache:](v22, "initWithQuery:mailboxTypeResolver:dataSource:delgate:scheduler:logClient:limitedCache:", v12, v14, v17, v17, v23, v24, v30);
    threadCollection = v17->_threadCollection;
    v17->_threadCollection = (EMInMemoryThreadCollection *)v25;

    objc_storeWeak((id *)&v17->_resultsObserver, v15);
    objc_storeStrong((id *)&v17->_observationIdentifier, a7);
    v27 = objc_alloc_init(EMThreadReloadSummaryHelper);
    reloadSummaryHelper = v17->_reloadSummaryHelper;
    v17->_reloadSummaryHelper = v27;

  }
  return v17;
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
  NSSet *v10;
  NSSet *v11;
  char v13;

  mailboxes = self->_mailboxes;
  if (!mailboxes)
  {
    -[EMInMemoryThreadQueryHandler threadCollection](self, "threadCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailboxTypeResolver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    objc_msgSend(v4, "mailboxTypeResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v9, &v13);
    v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v11 = self->_mailboxes;
    self->_mailboxes = v10;

    mailboxes = self->_mailboxes;
  }
  return mailboxes;
}

- (id)mailboxesInCollection:(id)a3
{
  -[EMInMemoryThreadQueryHandler mailboxes](self, "mailboxes", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)collection:(id)a3 messagesInConversationIDs:(id)a4 limit:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  -[EMInMemoryThreadQueryHandler repository](self, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesInConversationIDs:limit:observationIdentifier:", v7, a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)collection:(id)a3 didMergeInThreadsForMove:(BOOL)a4 newObjectIDs:(id)a5 existingObjectID:(id)a6 hasChanges:(BOOL *)a7
{
  _BOOL4 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a4;
  v17 = a5;
  v11 = a6;
  -[EMInMemoryThreadQueryHandler resultsObserver](self, "resultsObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v11)
      -[EMInMemoryThreadQueryHandler logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:](self, "logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:", CFSTR("Moving objectIDs"), v17, v11);
    else
      -[EMInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Moving objectIDs to end of list:"), v17);
    -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "observer:matchedMovedObjectIDs:before:extraInfo:", v13, v17, v11, 0);

    *a7 = 1;
  }
  else
  {
    if (v11)
      -[EMInMemoryThreadQueryHandler logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:](self, "logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:", CFSTR("Adding objectIDs"), v17, v11);
    else
      -[EMInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Adding objectIDs to end of list"), v17);
    +[EMInMemoryThreadQueryHandler log](EMInMemoryThreadQueryHandler, "log");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThreadQueryHandler _distinctObjectIDs:queryHandlerLog:](self, "_distinctObjectIDs:queryHandlerLog:", v17, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "observer:matchedAddedObjectIDs:before:extraInfo:", v16, v15, v11, 0);

    *a7 = 1;
  }

}

- (void)collection:(id)a3 notifyOfOldestThreadsByMailboxObjectIDs:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[EMInMemoryThreadQueryHandler resultsObserver](self, "resultsObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observer:matchedOldestItemsUpdatedForMailboxes:", v6, v7);

}

- (void)collection:(id)a3 notifyReplacedExistingObjectID:(id)a4 newObjectID:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[EMInMemoryThreadQueryHandler resultsObserver](self, "resultsObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observer:replacedExistingObjectID:withNewObjectID:", v9, v10, v7);

}

- (void)didSendUpdatesInCollection:(id)a3
{
  void *v4;
  id v5;

  -[EMInMemoryThreadQueryHandler resultsObserver](self, "resultsObserver", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observer:wasUpdated:", v4, 0);

}

- (BOOL)collection:(id)a3 reportChanges:(id)a4
{
  return -[EMInMemoryThreadQueryHandler collection:reportChanges:reloadSummaries:](self, "collection:reportChanges:reloadSummaries:", a3, a4, 1);
}

- (BOOL)collection:(id)a3 reportChanges:(id)a4 reloadSummaries:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a5;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (v5)
    {
      -[EMInMemoryThreadQueryHandler threadCollection](self, "threadCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxTypeResolver");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[EMInMemoryThreadQueryHandler reloadSummaryHelper](self, "reloadSummaryHelper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "summariesToReloadForChanges:mailboxScope:", v7, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[EMInMemoryThreadQueryHandler requestSummaryForMessageObjectIDs:](self, "requestSummaryForMessageObjectIDs:", v15);
    }
    objc_msgSend(v7, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Changing objectIDs"), v16);

    -[EMInMemoryThreadQueryHandler resultsObserver](self, "resultsObserver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "observer:matchedChangesForObjectIDs:", v18, v7);

    }
  }

  return v8 != 0;
}

- (BOOL)collection:(id)a3 reportDeletes:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_map:", &__block_literal_global_19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Deleting objectIDs"), v8);
    -[EMInMemoryThreadQueryHandler resultsObserver](self, "resultsObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "observer:matchedDeletedObjectIDs:", v10, v8);

    -[EMInMemoryThreadCollection removeThreadProxies:forMove:](self->_threadCollection, "removeThreadProxies:forMove:", v5, 0);
  }

  return v6 != 0;
}

id __57__EMInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
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
        _os_log_fault_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_FAULT, "Adding objectIDs but duplicate found %@", (uint8_t *)__b, 0xCu);

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

- (void)logThreadObjectIDsWithMessage:(id)a3 objectIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  EMInMemoryThreadQueryHandler *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") < 0xB)
  {
    +[EMInMemoryThreadQueryHandler log](EMInMemoryThreadQueryHandler, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218498;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = (uint64_t)v7;
      _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, 10);
    v8 = objc_claimAutoreleasedReturnValue();
    +[EMInMemoryThreadQueryHandler log](EMInMemoryThreadQueryHandler, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218754;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      v14 = 2048;
      v15 = objc_msgSend(v7, "count");
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu : %{public}@ ", (uint8_t *)&v10, 0x2Au);
    }

  }
}

- (void)logThreadObjectIDsChangesWithMessage:(id)a3 newObjectIDs:(id)a4 beforeExistingObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  EMInMemoryThreadQueryHandler *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") < 0xB)
  {
    +[EMInMemoryThreadQueryHandler log](EMInMemoryThreadQueryHandler, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218754;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = (uint64_t)v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %{public}@ before existing: %{public}@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, 10);
    v11 = objc_claimAutoreleasedReturnValue();
    +[EMInMemoryThreadQueryHandler log](EMInMemoryThreadQueryHandler, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134219010;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      v17 = 2048;
      v18 = objc_msgSend(v9, "count");
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu before existing: %{public}@ : %{public}@", (uint8_t *)&v13, 0x34u);
    }

  }
}

- (void)requestSummaryForMessageObjectIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMInMemoryThreadQueryHandler repository](self, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestSummaryForObjectIDs:", v5);

}

- (EMInMemoryThreadCollection)threadCollection
{
  return self->_threadCollection;
}

- (EMMessageRepository)repository
{
  return (EMMessageRepository *)objc_loadWeakRetained((id *)&self->_repository);
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  return (EMMessageListItemQueryResultsObserver *)objc_loadWeakRetained((id *)&self->_resultsObserver);
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (EMThreadReloadSummaryHelper)reloadSummaryHelper
{
  return self->_reloadSummaryHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadSummaryHelper, 0);
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_destroyWeak((id *)&self->_resultsObserver);
  objc_destroyWeak((id *)&self->_repository);
  objc_storeStrong((id *)&self->_threadCollection, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_threadCollectionScheduler, 0);
}

@end
