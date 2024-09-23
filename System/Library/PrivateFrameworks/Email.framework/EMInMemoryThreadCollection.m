@implementation EMInMemoryThreadCollection

- (EMInMemoryThreadCollection)initWithQuery:(id)a3 mailboxTypeResolver:(id)a4 dataSource:(id)a5 delgate:(id)a6 scheduler:(id)a7 logClient:(id)a8 limitedCache:(BOOL)a9
{
  id v15;
  id v16;
  EMInMemoryThreadCollection *v17;
  EMInMemoryThreadCollection *v18;
  uint64_t v19;
  EMQuery *query;
  void *v21;
  uint64_t v22;
  EMThreadScope *threadScope;
  NSMutableOrderedSet *v24;
  NSMutableOrderedSet *conversationIDs;
  NSMutableDictionary *v26;
  NSMutableDictionary *threadsByConversationID;
  void *v28;
  id v29;
  _EMInMemoryThreadCollectionOldestThreadsState *v30;
  uint64_t v31;
  EFLocked *oldestThreadsByMailboxObjectIDs;
  id v33;
  uint64_t v34;
  uint64_t v35;
  EFLazyCache *inMemoryThreadCache;
  void *v37;
  char v38;
  uint64_t v39;
  NSMutableDictionary *inMemoryThreadsByConversationID;
  void *v41;
  char v42;
  uint64_t v43;
  NSMutableDictionary *mailboxesByConversationID;
  void *v45;
  void *v46;
  uint64_t v47;
  id comparator;
  id v50;
  id v51;
  id obj;
  id v53;
  objc_super v54;

  v15 = a3;
  v53 = a4;
  obj = a5;
  v16 = a6;
  v51 = a7;
  v50 = a8;
  v54.receiver = self;
  v54.super_class = (Class)EMInMemoryThreadCollection;
  v17 = -[EMInMemoryThreadCollection init](&v54, sel_init);
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v15, "copy");
    query = v17->_query;
    v17->_query = (EMQuery *)v19;

    objc_msgSend(v15, "predicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMessageListItemPredicates threadScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "threadScopeForPredicate:withMailboxTypeResolver:", v21, v53);
    v22 = objc_claimAutoreleasedReturnValue();
    threadScope = v17->_threadScope;
    v17->_threadScope = (EMThreadScope *)v22;

    objc_storeStrong((id *)&v17->_mailboxTypeResolver, a4);
    objc_storeWeak((id *)&v17->_dataSource, obj);
    objc_storeWeak((id *)&v17->_delegate, v16);
    objc_storeStrong((id *)&v17->_scheduler, a7);
    objc_storeStrong((id *)&v17->_logClient, a8);
    v17->_threadsLock._os_unfair_lock_opaque = 0;
    v24 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    conversationIDs = v17->_conversationIDs;
    v17->_conversationIDs = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    threadsByConversationID = v17->_threadsByConversationID;
    v17->_threadsByConversationID = v26;

    -[EMQuery sortDescriptors](v17->_query, "sortDescriptors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_dateSortOrder = +[EMMessageListItemPredicates dateSortOrderFromSortDescriptors:](EMMessageListItemPredicates, "dateSortOrderFromSortDescriptors:", v28);

    v18->_limitedCache = a9;
    v29 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v30 = objc_alloc_init(_EMInMemoryThreadCollectionOldestThreadsState);
    v31 = objc_msgSend(v29, "initWithObject:", v30);
    oldestThreadsByMailboxObjectIDs = v18->_oldestThreadsByMailboxObjectIDs;
    v18->_oldestThreadsByMailboxObjectIDs = (EFLocked *)v31;

    v33 = objc_alloc(MEMORY[0x1E0D1EED8]);
    if (v18->_limitedCache)
      v34 = 500;
    else
      v34 = 0;
    v35 = objc_msgSend(v33, "initWithCountLimit:", v34);
    inMemoryThreadCache = v18->_inMemoryThreadCache;
    v18->_inMemoryThreadCache = (EFLazyCache *)v35;

    if (!v18->_limitedCache
      || (-[EMInMemoryThreadCollection query](v18, "query"),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v38 = objc_msgSend(v37, "queryOptions"),
          v37,
          (v38 & 0x20) != 0))
    {
      v39 = objc_opt_new();
      inMemoryThreadsByConversationID = v18->_inMemoryThreadsByConversationID;
      v18->_inMemoryThreadsByConversationID = (NSMutableDictionary *)v39;

    }
    -[EMInMemoryThreadCollection query](v18, "query");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "queryOptions");

    if ((v42 & 1) != 0)
    {
      v43 = objc_opt_new();
      mailboxesByConversationID = v18->_mailboxesByConversationID;
      v18->_mailboxesByConversationID = (NSMutableDictionary *)v43;

    }
    v45 = (void *)objc_opt_class();
    objc_msgSend(v15, "sortDescriptors");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_comparatorForInThreadProxiesWithSortDescriptors:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    comparator = v18->_comparator;
    v18->_comparator = (id)v47;

  }
  return v18;
}

+ (id)_comparatorForInThreadProxiesWithSortDescriptors:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  SEL v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__EMInMemoryThreadCollection__comparatorForInThreadProxiesWithSortDescriptors___block_invoke;
  v9[3] = &unk_1E70F3178;
  v10 = v5;
  v11 = a1;
  v12 = a2;
  v6 = v5;
  v7 = (void *)MEMORY[0x1BCCC8C10](v9);

  return v7;
}

uint64_t __79__EMInMemoryThreadCollection__comparatorForInThreadProxiesWithSortDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    goto LABEL_3;
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primarySortValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primarySortValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[EMInMemoryThreadCollection _comparisonForSortDescriptor:value1:value2:](v7, v8, v9, v10);

  if (!v11)
  {
LABEL_3:
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("EMInMemoryThreadCollection.m"), 108, CFSTR("Multiple sort descriptors is unexpected"));

    }
    objc_msgSend(v5, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "conversationID");
    objc_msgSend(v6, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 < objc_msgSend(v15, "conversationID"))
      v11 = 1;
    else
      v11 = -1;

  }
  return v11;
}

+ (uint64_t)_comparisonForSortDescriptor:(void *)a3 value1:(void *)a4 value2:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, unint64_t, _BYTE *);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("subject")))
  {
    v10 = objc_msgSend(v7, "compare:options:", v8, 65);
LABEL_5:
    v25[3] = v10;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v8);
    goto LABEL_5;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("toList")) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", CFSTR("senderList.emailAddressValue.displayName")))
  {
    v10 = objc_msgSend(v7, "compare:", v8);
    goto LABEL_5;
  }
  v14 = v7;
  v15 = v8;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __73__EMInMemoryThreadCollection__comparisonForSortDescriptor_value1_value2___block_invoke;
  v21 = &unk_1E70F31A0;
  v16 = v15;
  v22 = v16;
  v23 = &v24;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v18);
  if (!v25[3])
  {
    v17 = objc_msgSend(v16, "count", v18, v19, v20, v21);
    if (v17 > objc_msgSend(v14, "count"))
      v25[3] = 1;
  }

LABEL_6:
  v11 = objc_msgSend(v6, "ascending", v18, v19, v20, v21);
  v12 = v25[3];
  if ((v11 & 1) == 0 && v12)
  {
    if (v12 == -1)
      v12 = 1;
    else
      v12 = -1;
    v25[3] = v12;
  }

  _Block_object_dispose(&v24, 8);
  return v12;
}

void __73__EMInMemoryThreadCollection__comparisonForSortDescriptor_value1_value2___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    *a4 = 1;
  }
  else
  {
    v7 = v19;
    objc_msgSend(v7, "emailAddressValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "stringValue");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emailAddressValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v13, "stringValue");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v12, "localizedCaseInsensitiveCompare:", v18);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a4 = 1;

  }
}

- (void)enumerateObjectIDsInBatchesOfSize:(unint64_t)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  -[EMInMemoryThreadCollection scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertIsExecuting:", 1);

  -[NSMutableOrderedSet array](self->_conversationIDs, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke;
  v10[3] = &unk_1E70F31F0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "ef_enumerateObjectsInBatchesOfSize:block:", a3, v10);

}

void __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = a2;
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
  os_unfair_lock_lock(v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke_2;
  v6[3] = &unk_1E70F31C8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "ef_compactMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messagesByConversationIDForMessages:(void *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "ef_groupBy:", &__block_literal_global_18);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

id __67__EMInMemoryThreadCollection__messagesByConversationIDForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_inMemoryThreadsForObjectIDs:(char)a3 cacheResults:
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  if (a1)
  {
    v5 = (void *)objc_opt_new();
    v21 = a3;
    v23 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v22;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "conversationID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "inMemoryThreadCache");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cachedObjectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v5, "addObject:", v12);
          else
            objc_msgSend(v23, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(a1, "logClient");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v33 = a1;
        v34 = 2114;
        v35 = (uint64_t)v23;
        _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "%p: Fetching messages for %{public}@", buf, 0x16u);
      }

      objc_msgSend(a1, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collection:messagesInConversationIDs:limit:", a1, v23, 0x7FFFFFFFFFFFFFFFLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[EMInMemoryThreadCollection _messagesByConversationIDForMessages:](a1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __72__EMInMemoryThreadCollection__inMemoryThreadsForObjectIDs_cacheResults___block_invoke;
      v24[3] = &unk_1E70F3238;
      v25 = v5;
      v26 = a1;
      v27 = v21;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v24);
      objc_msgSend(a1, "logClient");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v15, "count");
        v19 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 134218496;
        v33 = a1;
        v34 = 2048;
        v35 = v18;
        v36 = 2048;
        v37 = v19;
        _os_log_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEFAULT, "%p: Fetched %lu messages for %lu threads", buf, 0x20u);
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __72__EMInMemoryThreadCollection__inMemoryThreadsForObjectIDs_cacheResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  -[EMInMemoryThreadCollection _createInMemoryThreadForConversationID:messages:cacheResults:](*(void **)(a1 + 40), objc_msgSend(v8, "longLongValue"), v5, *(unsigned __int8 *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_addOptionalObject:", v7);

}

- (EMInMemoryThread)_createInMemoryThreadForConversationID:(void *)a3 messages:(int)a4 cacheResults:
{
  id v7;
  EMInMemoryThread *v8;
  void *v9;
  void *v10;
  EMInMemoryThread *v11;
  void *v12;
  void *v13;
  EMInMemoryThread *v14;
  id v15;
  _QWORD v17[5];
  EMInMemoryThread *v18;
  uint64_t v19;

  v7 = a3;
  if (a1)
  {
    v8 = [EMInMemoryThread alloc];
    objc_msgSend(a1, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "threadScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:](v8, "initWithMessages:originatingQuery:threadScope:", v7, v9, v10);

    if (v11 && a4)
    {
      objc_msgSend(a1, "inMemoryThreadCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __91__EMInMemoryThreadCollection__createInMemoryThreadForConversationID_messages_cacheResults___block_invoke;
      v17[3] = &unk_1E70F32D0;
      v17[4] = a1;
      v19 = a2;
      v14 = v11;
      v18 = v14;
      v15 = (id)objc_msgSend(v12, "objectForKey:generator:", v13, v17);

      v11 = v14;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)messageListItemForObjectID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *inMemoryThreadsByConversationID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  NSMutableOrderedSet *conversationIDs;
  id v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  os_unfair_lock_s *p_threadsLock;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  EMInMemoryThreadCollection *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "conversationID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_inMemoryThreadsByConversationID)
    {
      os_unfair_lock_lock(&self->_threadsLock);
      inMemoryThreadsByConversationID = self->_inMemoryThreadsByConversationID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](inMemoryThreadsByConversationID, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(&self->_threadsLock);
    }
    else
    {
      -[EMInMemoryThreadCollection inMemoryThreadCache](self, "inMemoryThreadCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cachedObjectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[EMInMemoryThreadCollection logClient](self, "logClient");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v37 = self;
          v38 = 2114;
          v39 = v8;
          _os_log_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEFAULT, "%p: Fetched messageListItem for %{public}@ from cache", buf, 0x16u);
        }

      }
      else
      {
        os_unfair_lock_lock(&self->_threadsLock);
        v15 = -[NSMutableOrderedSet indexOfObject:](self->_conversationIDs, "indexOfObject:", v8);
        v16 = MEMORY[0x1E0C809B0];
        v17 = (_QWORD *)&unk_1B9A95000;
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = 0;
        }
        else
        {
          v19 = -[NSMutableOrderedSet count](self->_conversationIDs, "count");
          conversationIDs = self->_conversationIDs;
          v21 = objc_alloc(MEMORY[0x1E0CB36B8]);
          if (v15 >= 0xE)
            v22 = v15 - 14;
          else
            v22 = 0;
          v23 = 14;
          if (v15 < 0xE)
            v23 = v15;
          v24 = v19 - v15;
          if (v19 - v15 >= 0xF)
            v24 = 15;
          v25 = (void *)objc_msgSend(v21, "initWithIndexesInRange:", v22, v24 + v23);
          -[NSMutableOrderedSet objectsAtIndexes:](conversationIDs, "objectsAtIndexes:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v35[0] = v16;
          v17 = &unk_1B9A95000;
          v35[1] = 3221225472;
          v35[2] = __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke;
          v35[3] = &unk_1E70F3260;
          v35[4] = self;
          objc_msgSend(v26, "ef_compactMap:", v35);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        os_unfair_lock_unlock(&self->_threadsLock);
        if (objc_msgSend(v18, "count"))
        {
          -[EMInMemoryThreadCollection _inMemoryThreadsForObjectIDs:cacheResults:](self, v18, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = v16;
          v34[1] = v17[160];
          v34[2] = __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke_2;
          v34[3] = &__block_descriptor_40_e26_B16__0__EMInMemoryThread_8l;
          v34[4] = v7;
          objc_msgSend(v27, "ef_firstObjectPassingTest:", v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }

      }
    }
    objc_msgSend(v11, "messageListItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_threadsLock = &self->_threadsLock;
    os_unfair_lock_lock(&self->_threadsLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_threadsByConversationID, "objectForKeyedSubscript:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thread");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThreadCollection query](self, "query");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "updateFromThread:addingAdditionalInformation:query:", v30, 1, v31);

    os_unfair_lock_unlock(p_threadsLock);
    if (a4)
    {
      if (v12)
      {
        v32 = 0;
LABEL_28:
        *a4 = v32;
        goto LABEL_29;
      }
LABEL_27:
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v6);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    if (a4)
      goto LABEL_27;
    v12 = 0;
  }
LABEL_29:

  return v12;
}

id __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "integerValue"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "thread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationID") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (id)threadsAndMessagesForObjectIDs:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EMInMemoryThreadCollection _inMemoryThreadsForObjectIDs:cacheResults:](self, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "messages", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "thread");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)messagesForThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMInMemoryThreadCollection _inMemoryThreadForConversationID:]((uint64_t)self, objc_msgSend(v4, "conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_inMemoryThreadForConversationID:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__inMemoryThreadForConversationID_, a1, CFSTR("EMInMemoryThreadCollection.m"), 296, CFSTR("Got a conversationID of 0"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    if (!v6)
    {
      objc_msgSend((id)a1, "logClient");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v14 = a1;
        v15 = 2050;
        v16 = a2;
        _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Thread with conversation ID: %{public}lld is not present in _inMemoryThreadsByConversationID.", buf, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend((id)a1, "inMemoryThreadCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__EMInMemoryThreadCollection__inMemoryThreadForConversationID___block_invoke;
    v12[3] = &unk_1E70F32A8;
    v12[4] = a1;
    v12[5] = a2;
    objc_msgSend(v8, "objectForKey:generator:", v9, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __63__EMInMemoryThreadCollection__inMemoryThreadForConversationID___block_invoke(uint64_t a1)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[EMInMemoryThreadCollection _createInMemoryThreadForConversationID:](*(EMInMemoryThread **)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "thread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134349314;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Didn't find conversationID in Cache: %{public}lld, displayDate = %@", (uint8_t *)&v9, 0x16u);

  }
  return v3;
}

- (EMInMemoryThread)_createInMemoryThreadForConversationID:(EMInMemoryThread *)a1
{
  EMInMemoryThread *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  EMInMemoryThread *v9;
  void *v10;
  void *v11;
  int v13;
  EMInMemoryThread *v14;
  __int16 v15;
  uint64_t v16;
  _QWORD v17[2];

  v2 = a1;
  v17[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[EMInMemoryThread dataSource](a1, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collection:messagesInConversationIDs:limit:", v2, v6, 0x7FFFFFFFFFFFFFFFLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count"))
    {
      -[EMInMemoryThread logClient](v2, "logClient");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134218240;
        v14 = v2;
        v15 = 2050;
        v16 = a2;
        _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Could not find any messages for conversation ID: %{public}lld", (uint8_t *)&v13, 0x16u);
      }

    }
    if (objc_msgSend(v7, "count"))
    {
      v9 = [EMInMemoryThread alloc];
      -[EMInMemoryThread query](v2, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMInMemoryThread threadScope](v2, "threadScope");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:](v9, "initWithMessages:originatingQuery:threadScope:", v7, v10, v11);

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

id __91__EMInMemoryThreadCollection__createInMemoryThreadForConversationID_messages_cacheResults___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logClient");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "thread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134349314;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_INFO, "Caching thread for conversationID: %{public}lld displayDate = %@", (uint8_t *)&v7, 0x16u);

  }
  return *(id *)(a1 + 40);
}

- (BOOL)removeThreadProxies:(id)a3 forMove:(BOOL)a4
{
  return -[EMInMemoryThreadCollection _removeThreadProxies:forMove:]((uint64_t)self, a3, a4);
}

- (uint64_t)_removeThreadProxies:(char)a3 forMove:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_map:", &__block_literal_global_41);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 8), "removeObjectsInArray:", v8);
    if ((a3 & 1) != 0)
    {
      a1 = 0;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 16), "removeObjectsForKeys:", v8);
      objc_msgSend(*(id *)(a1 + 32), "removeObjectsForKeys:", v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
      a1 = -[EMInMemoryThreadCollection _threadsWereDeleted](a1);
    }

  }
  return a1;
}

id __59__EMInMemoryThreadCollection__removeThreadProxies_forMove___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_threadsWereDeleted
{
  uint64_t v1;
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    if (-[EMInMemoryThreadCollection _hasLoaded](a1))
    {
      v5 = 0;
      v6 = &v5;
      v7 = 0x3032000000;
      v8 = __Block_byref_object_copy__4;
      v9 = __Block_byref_object_dispose__4;
      v10 = (id)0xAAAAAAAAAAAAAAAALL;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v2 = *(void **)(v1 + 40);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke;
      v4[3] = &unk_1E70F3340;
      v4[4] = v1;
      v4[5] = &v5;
      objc_msgSend(v2, "performWhileLocked:", v4);
      if (objc_msgSend((id)v6[5], "count"))
        v1 = -[EMInMemoryThreadCollection _updateOldestThreadsForMailboxes:]((_QWORD *)v1, (void *)v6[5]);
      else
        v1 = 0;
      _Block_object_dispose(&v5, 8);

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)_hasLoaded
{
  void *v1;
  _BOOL8 v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__EMInMemoryThreadCollection__hasLoaded__block_invoke;
  v4[3] = &unk_1E70F33D0;
  v4[4] = &v5;
  objc_msgSend(v1, "performWhileLocked:", v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  __int128 v8;

  v6 = a2;
  objc_msgSend(v6, "oldestThreadsByMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke_2;
  v7[3] = &unk_1E70F3318;
  v8 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    objc_msgSend(v6, "oldestThreadsByMailboxObjectIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsForKeys:", v5);

  }
}

void __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
  os_unfair_lock_lock(v6);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "conversationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
  os_unfair_lock_unlock(v6);

}

- (BOOL)_updateOldestThreadsForMailboxes:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = 2 * (objc_msgSend(a1, "dateSortOrder") == 1);
    v7 = objc_msgSend(a1, "dateSortOrder") != 0;
    v8 = (void *)a1[1];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__EMInMemoryThreadCollection__updateOldestThreadsForMailboxes___block_invoke;
    v12[3] = &unk_1E70F3368;
    v12[4] = a1;
    v9 = v5;
    v13 = v9;
    v14 = &v16;
    v15 = v7;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", v6, v12);
    if (*((_BYTE *)v17 + 24))
    {
      -[EMInMemoryThreadCollection _notifyObserverOfOldestThreadsByMailboxObjectIDs](a1);
      v10 = *((_BYTE *)v17 + 24) != 0;
    }
    else
    {
      v10 = 0;
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __63__EMInMemoryThreadCollection__updateOldestThreadsForMailboxes___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
  os_unfair_lock_lock(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14, (_QWORD)v15))
        {
          if (-[EMInMemoryThreadCollection _updateCurrentOldestThreadWithThreadIfApplicable:forMailbox:](*(_QWORD *)(a1 + 32), v9, v14))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          if (*(_BYTE *)(a1 + 56))
            objc_msgSend(*(id *)(a1 + 40), "removeObject:", v14);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  if (*(_BYTE *)(a1 + 56) && !objc_msgSend(*(id *)(a1 + 40), "count"))
    *a4 = 1;

}

- (uint64_t)_updateCurrentOldestThreadWithThreadIfApplicable:(void *)a3 forMailbox:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    v28 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v9 = *(void **)(a1 + 40);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke;
    v20[3] = &unk_1E70F3448;
    v22 = &v23;
    v10 = v6;
    v21 = v10;
    objc_msgSend(v9, "performWhileLocked:", v20);
    if ((objc_msgSend(v5, "isEqual:", v24[5]) & 1) != 0
      || v24[5]
      && (objc_msgSend(v5, "date"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v24[5], "date"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "compare:", v12),
          v12,
          v11,
          v13 != -1))
    {
      v14 = 0;
    }
    else
    {
      v15 = *(void **)(a1 + 40);
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke_2;
      v17[3] = &unk_1E70F3470;
      v18 = v10;
      v19 = v5;
      objc_msgSend(v15, "performWhileLocked:", v17);

      v14 = 1;
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_notifyObserverOfOldestThreadsByMailboxObjectIDs
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__4;
    v9 = __Block_byref_object_dispose__4;
    v10 = 0;
    v2 = (void *)a1[5];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __78__EMInMemoryThreadCollection__notifyObserverOfOldestThreadsByMailboxObjectIDs__block_invoke;
    v4[3] = &unk_1E70F33D0;
    v4[4] = &v5;
    objc_msgSend(v2, "performWhileLocked:", v4);
    objc_msgSend(a1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collection:notifyOfOldestThreadsByMailboxObjectIDs:", a1, v6[5]);

    _Block_object_dispose(&v5, 8);
  }
}

- (void)notifyObserverOfOldestThreadsByMailboxObjectIDs
{
  void *v3;

  -[EMInMemoryThreadCollection scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertIsExecuting:", 1);

  -[EMInMemoryThreadCollection _notifyObserverOfOldestThreadsByMailboxObjectIDs](self);
}

void __78__EMInMemoryThreadCollection__notifyObserverOfOldestThreadsByMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "oldestThreadsByMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_47);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __78__EMInMemoryThreadCollection__notifyObserverOfOldestThreadsByMailboxObjectIDs__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performBlockOnSchedulerIfNecessary:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  if (_os_feature_enabled_impl())
  {
    -[EMInMemoryThreadCollection scheduler](self, "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performBlock:", v5);

  }
  else
  {
    v5[2]();
  }

}

- (void)initializeOldestThreadsByMailbox
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__EMInMemoryThreadCollection_initializeOldestThreadsByMailbox__block_invoke;
  v2[3] = &unk_1E70F1FA0;
  v2[4] = self;
  -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v2);
}

void __62__EMInMemoryThreadCollection_initializeOldestThreadsByMailbox__block_invoke(uint64_t a1)
{
  -[EMInMemoryThreadCollection _nts_initializeOldestThreadsByMailbox](*(_QWORD **)(a1 + 32));
}

- (void)_nts_initializeOldestThreadsByMailbox
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[6];

  if (a1)
  {
    objc_msgSend(a1, "query");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "queryOptions");

    if ((v3 & 1) != 0)
    {
      v4 = (void *)a1[5];
      v5 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke;
      v10[3] = &unk_1E70F33F8;
      v10[4] = a1;
      v10[5] = sel__nts_initializeOldestThreadsByMailbox;
      objc_msgSend(v4, "performWhileLocked:", v10);
      objc_msgSend(a1, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mailboxesInCollection:", a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMInMemoryThreadCollection _updateOldestThreadsForMailboxes:](a1, v7);

      v8 = (void *)a1[5];
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke_2;
      v9[3] = &unk_1E70F3420;
      v9[4] = a1;
      objc_msgSend(v8, "performWhileLocked:", v9);
    }
  }
}

void __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "oldestThreadsByMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("EMInMemoryThreadCollection.m"), 465, CFSTR("oldestThreadsByMailboxObjectIDs should be only initialized once"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOldestThreadsByMailboxObjectIDs:", v4);

}

void __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "oldestThreadsByMailboxObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218240;
    v8 = v5;
    v9 = 1024;
    v10 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Oldest threads initialized for %u mailboxes", (uint8_t *)&v7, 0x12u);

  }
}

void __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "oldestThreadsByMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "oldestThreadsByMailboxObjectIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));

}

- (void)clearOldestThreadsByMailboxObjectIDs
{
  -[EFLocked performWhileLocked:](self->_oldestThreadsByMailboxObjectIDs, "performWhileLocked:", &__block_literal_global_55);
}

uint64_t __66__EMInMemoryThreadCollection_clearOldestThreadsByMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOldestThreadsByMailboxObjectIDs:", 0);
}

- (void)clearInMemoryThreadCache
{
  id v2;

  -[EMInMemoryThreadCollection inMemoryThreadCache](self, "inMemoryThreadCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)clearForRecovery
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (_os_feature_enabled_impl())
  {
    v3 = MEMORY[0x1E0C809B0];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke;
    v5[3] = &unk_1E70F1FA0;
    v5[4] = self;
    -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v5);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke_2;
    v4[3] = &unk_1E70F1FA0;
    v4[4] = self;
    -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v4);
    -[EMInMemoryThreadCollection clearInMemoryThreadCache](self, "clearInMemoryThreadCache");
    os_unfair_lock_lock(&self->_threadsLock);
    -[NSMutableDictionary removeAllObjects](self->_threadsByConversationID, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_mailboxesByConversationID, "removeAllObjects");
    os_unfair_lock_unlock(&self->_threadsLock);
  }
}

uint64_t __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

uint64_t __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "performWhileLocked:", &__block_literal_global_56);
}

uint64_t __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOldestThreadsByMailboxObjectIDs:", 0);
}

- (void)messagesWereAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__EMInMemoryThreadCollection_messagesWereAdded___block_invoke;
  v6[3] = &unk_1E70F2070;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v6);

}

void __48__EMInMemoryThreadCollection_messagesWereAdded___block_invoke(uint64_t a1)
{
  -[EMInMemoryThreadCollection _nts_messagesWereAdded:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_nts_messagesWereAdded:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  if (a1)
  {
    v14 = v3;
    -[EMInMemoryThreadCollection _messagesByConversationIDForMessages:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__EMInMemoryThreadCollection__nts_messagesWereAdded___block_invoke;
    v15[3] = &unk_1E70F34B8;
    v15[4] = a1;
    v8 = v6;
    v16 = v8;
    v9 = v7;
    v17 = v9;
    v10 = v5;
    v18 = v10;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v15);
    objc_msgSend(a1, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareToSendUpdatesInCollection:", a1);

    objc_msgSend(a1, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v12, "collection:reportChanges:", a1, v9);

    LODWORD(v12) = -[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v8, 1u);
    if ((-[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v10, 0) | v12 | v11) == 1)
    {
      objc_msgSend(a1, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didSendUpdatesInCollection:", a1);

    }
    v3 = v14;
  }

}

void __53__EMInMemoryThreadCollection__nts_messagesWereAdded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  os_unfair_lock_s *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_unfair_lock_s *v22;
  EMSortableThreadProxy *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  EMSortableThreadProxy *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  os_unfair_lock_s *v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1BCCC8A30]();
  v8 = *(_QWORD **)(a1 + 32);
  if (v8[4])
  {
    v9 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "mailboxObjectIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v11);
    }

    v15 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
    os_unfair_lock_lock(v15);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "ef_arrayByAddingAbsentObjectsFromArray:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v19, v5);

      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v9, v5);
      }

    }
    os_unfair_lock_unlock(v15);

    v8 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v8, "inMemoryThreadCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cachedObjectForKey:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
  os_unfair_lock_lock(v22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v23 = (EMSortableThreadProxy *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v22);
  if (v21)
  {
    objc_msgSend(v21, "addMessages:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "thread");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "query");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy updateFromThread:addingAdditionalInformation:query:](v23, "updateFromThread:addingAdditionalInformation:query:", v25, 0, v26);

    if (v24)
    {
      if (-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v24))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);
      v27 = *(void **)(a1 + 48);
      objc_msgSend(v21, "thread");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v29);

    }
  }
  else if (v23)
  {
    v38 = 0;
    -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:](*(void **)(a1 + 32), v23, &v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      if (-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v30))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);
      v31 = *(void **)(a1 + 48);
      -[EMSortableThreadProxy objectID](v23, "objectID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

    }
    v21 = 0;
  }
  else
  {
    -[EMInMemoryThreadCollection _createInMemoryThreadForConversationID:messages:cacheResults:](*(void **)(a1 + 32), objc_msgSend(v5, "longLongValue"), v6, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [EMSortableThreadProxy alloc];
    objc_msgSend(v21, "thread");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "query");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[EMSortableThreadProxy initWithThread:originatingQuery:](v33, "initWithThread:originatingQuery:", v34, v35);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);
    v36 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v36 + 24))
    {
      v37 = (os_unfair_lock_s *)(v36 + 48);
      os_unfair_lock_lock((os_unfair_lock_t)(v36 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v21, v5);
      os_unfair_lock_unlock(v37);
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (uint64_t)_messageListItemChangeAffectsSorting:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a1, "query", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "key");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "valueForKeyPath:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v6 = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_updateThreadProxy:(_BYTE *)a3 threadIsEmpty:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    -[EMInMemoryThreadCollection _inMemoryThreadForConversationID:]((uint64_t)a1, objc_msgSend(v5, "conversationID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "thread");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calculateChangeFromThread:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "thread");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "query");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateFromThread:addingAdditionalInformation:query:", v11, 0, v12);

    }
    else
    {
      *a3 = 1;
      objc_msgSend(a1, "logClient");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134218240;
        v16 = a1;
        v17 = 2050;
        v18 = objc_msgSend(v6, "conversationID");
        _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "%p: Thread %{public}lld no longer exists.", (uint8_t *)&v15, 0x16u);
      }

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_mergeInThreads:(unsigned int)a3 forMove:
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  char v40;
  __int128 v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  uint64_t (**v48)(_QWORD, _QWORD, _QWORD);
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v49 = v4;
  if (a1 && objc_msgSend(v4, "count"))
  {
    v54 = 0;
    if (a3)
      v54 = -[EMInMemoryThreadCollection _removeThreadProxies:forMove:](a1, v49, 1);
    if (objc_msgSend(v49, "count"))
    {
      objc_msgSend((id)a1, "comparator");
      v48 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "sortUsingComparator:");
      objc_msgSend(v49, "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v49, "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = 0;
        v47 = 0;
        *(_QWORD *)&v7 = 134219266;
        v42 = v7;
        while (1)
        {
          if (v8 >= objc_msgSend(*(id *)(a1 + 8), "count", v42))
            goto LABEL_35;
          objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
          v46 = (void *)v9;
          objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
          if (((uint64_t (**)(_QWORD, void *, id))v48)[2](v48, v10, v6) == 1)
            break;
LABEL_31:

          ++v8;
          v47 = v10;
          if (!v6)
          {
            v47 = v10;
            goto LABEL_35;
          }
        }
        v6 = v6;
        v45 = v6;
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v12 = v6;
        while (1)
        {
          v13 = v8;
          v14 = v12;
          v12 = v6;

          objc_msgSend(v12, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v15);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "conversationID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
          objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v12, v16);
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
          objc_msgSend(*(id *)(a1 + 8), "insertObject:atIndex:", v16, v13);
          objc_msgSend(v49, "removeObjectAtIndex:", 0);
          objc_msgSend(v49, "firstObject");
          v6 = (id)objc_claimAutoreleasedReturnValue();

          if (!v6)
            break;
          v17 = ((uint64_t (**)(_QWORD, void *, id))v48)[2](v48, v10, v6);

          v8 = v13 + 1;
          if (v17 != 1)
            goto LABEL_15;
        }

LABEL_15:
        objc_msgSend(v10, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((!v47 || ((uint64_t (**)(_QWORD, void *, void *))v48)[2](v48, v45, v47) == 1)
          && ((uint64_t (**)(_QWORD, id, void *))v48)[2](v48, v12, v10) == -1)
        {
          if (objc_msgSend(v11, "count") == 1)
          {
            objc_msgSend((id)a1, "logClient");
            v19 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              goto LABEL_30;
            *(_DWORD *)buf = 134218754;
            v57 = a1;
            v58 = 2114;
            v59 = (uint64_t)v45;
            v60 = 2114;
            v61 = v47;
            v62 = 2114;
            v63 = v10;
            v24 = v19;
            v25 = "%p: Merged in 1 new thread %{public}@ between existing threads %{public}@ and %{public}@";
            v26 = 42;
          }
          else
          {
            objc_msgSend((id)a1, "logClient");
            v19 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              goto LABEL_30;
            v27 = objc_msgSend(v11, "count");
            *(_DWORD *)buf = v42;
            v57 = a1;
            v58 = 2048;
            v59 = v27;
            v60 = 2114;
            v61 = v45;
            v62 = 2114;
            v63 = v12;
            v64 = 2114;
            v65 = v47;
            v66 = 2114;
            v67 = v10;
            v24 = v19;
            v25 = "%p: Merged in %lu new threads %{public}@ to %{public}@ between existing threads %{public}@ and %{public}@";
            v26 = 62;
          }
          _os_log_impl(&dword_1B99BB000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
          goto LABEL_30;
        }
        if (objc_msgSend(v11, "count") == 1)
        {
          objc_msgSend((id)a1, "logClient");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218754;
            v57 = a1;
            v58 = 2114;
            v59 = (uint64_t)v45;
            v60 = 2114;
            v61 = v47;
            v62 = 2114;
            v63 = v10;
            v20 = v19;
            v21 = "%p: Merged in 1 new thread out of order! %{public}@ between existing threads %{public}@ and %{public}@";
            v22 = 42;
LABEL_23:
            _os_log_fault_impl(&dword_1B99BB000, v20, OS_LOG_TYPE_FAULT, v21, buf, v22);
          }
        }
        else
        {
          objc_msgSend((id)a1, "logClient");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            v23 = objc_msgSend(v11, "count");
            *(_DWORD *)buf = v42;
            v57 = a1;
            v58 = 2048;
            v59 = v23;
            v60 = 2114;
            v61 = v45;
            v62 = 2114;
            v63 = v12;
            v64 = 2114;
            v65 = v47;
            v66 = 2114;
            v67 = v10;
            v20 = v19;
            v21 = "%p: Merged in %lu new threads out of order! %{public}@ to %{public}@ between existing threads %{public"
                  "}@ and %{public}@";
            v22 = 62;
            goto LABEL_23;
          }
        }
LABEL_30:

        objc_msgSend((id)a1, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "collection:didMergeInThreadsForMove:newObjectIDs:existingObjectID:hasChanges:", a1, a3, v11, v18, &v54);

        v8 = v13 + 1;
        goto LABEL_31;
      }
      v47 = 0;
LABEL_35:
      if (objc_msgSend(v49, "count"))
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v31 = v49;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v51;
          do
          {
            v34 = 0;
            v35 = v6;
            do
            {
              if (*(_QWORD *)v51 != v33)
                objc_enumerationMutation(v31);
              v6 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * v34);

              objc_msgSend(v6, "objectID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v36);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "conversationID"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
              objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v6, v37);
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
              objc_msgSend(*(id *)(a1 + 8), "addObject:", v37);

              ++v34;
              v35 = v6;
            }
            while (v32 != v34);
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          }
          while (v32);
        }

        objc_msgSend((id)a1, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "collection:didMergeInThreadsForMove:newObjectIDs:existingObjectID:hasChanges:", a1, a3, v30, 0, &v54);

        v6 = 0;
      }
      v39 = -[EMInMemoryThreadCollection _didMergeInThreads:](a1, v43);
      if (v54)
        v40 = 1;
      else
        v40 = v39;
      v54 = v40;

    }
    v29 = v54 != 0;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)messagesWereChanged:(id)a3 forKeyPaths:(id)a4 deleted:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__EMInMemoryThreadCollection_messagesWereChanged_forKeyPaths_deleted___block_invoke;
  v12[3] = &unk_1E70F34E0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v12);

}

void __70__EMInMemoryThreadCollection_messagesWereChanged_forKeyPaths_deleted___block_invoke(uint64_t a1)
{
  -[EMInMemoryThreadCollection _nts_messagesWereChanged:forKeyPaths:deleted:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_BYTE *)(a1 + 56));
}

- (void)_nts_messagesWereChanged:(void *)a3 forKeyPaths:(char)a4 deleted:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v25 = v8;
    -[EMInMemoryThreadCollection _messagesByConversationIDForMessages:](a1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v23 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v26 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __75__EMInMemoryThreadCollection__nts_messagesWereChanged_forKeyPaths_deleted___block_invoke;
    v27[3] = &unk_1E70F3508;
    v27[4] = a1;
    v33 = a4;
    v28 = v8;
    v11 = v24;
    v29 = v11;
    v12 = v23;
    v30 = v12;
    v13 = v10;
    v31 = v13;
    v14 = v26;
    v32 = v14;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
    objc_msgSend(a1, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareToSendUpdatesInCollection:", a1);

    if (objc_msgSend(v11, "count") && (a4 & 1) == 0)
    {
      objc_msgSend(a1, "logClient");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[EMInMemoryThreadCollection _nts_messagesWereChanged:forKeyPaths:deleted:].cold.1((uint64_t)a1, (uint64_t)v7, v16);

    }
    v17 = v7;
    objc_msgSend(a1, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "collection:reportDeletes:", a1, v11);

    objc_msgSend(a1, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "collection:reportChanges:", a1, v13);

    LODWORD(v20) = -[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v12, 1u);
    if ((-[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v14, 0) | v20 | v21 | v19) == 1)
    {
      objc_msgSend(a1, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didSendUpdatesInCollection:", a1);

    }
    v7 = v17;
    v8 = v25;
  }

}

void __75__EMInMemoryThreadCollection__nts_messagesWereChanged_forKeyPaths_deleted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *v9;
  EMSortableThreadProxy *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  EMInMemoryThread *v35;
  void *v36;
  void *v37;
  EMInMemoryThread *v38;
  EMSortableThreadProxy *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  char v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v57 = a3;
  v6 = (void *)MEMORY[0x1BCCC8A30]();
  objc_msgSend(*(id *)(a1 + 32), "inMemoryThreadCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedObjectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
  os_unfair_lock_lock(v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v10 = (EMSortableThreadProxy *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v9);
  if (v8)
  {
    v58 = 0;
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 32), "inMemoryThreadCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v5);

      objc_msgSend(v8, "removeMessages:threadIsEmpty:", v57, &v58);
    }
    else
    {
      objc_msgSend(v8, "changeMessages:forKeyPaths:threadIsEmpty:", v57, *(_QWORD *)(a1 + 40), &v58);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
      objc_msgSend(*(id *)(a1 + 32), "logClient");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v6;
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v8, "thread");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "itemID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v60 = v20;
        v61 = 2114;
        v62 = (uint64_t)v22;
        _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "%p: Marking thread %{public}@ as deleted", buf, 0x16u);

        v6 = v19;
      }
    }
    else
    {
      v23 = *(void **)(a1 + 32);
      if (v12)
      {
        objc_msgSend(v23, "logClient");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v56 = v6;
          v25 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v8, "thread");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "itemID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ef_publicDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v60 = v25;
          v61 = 2114;
          v62 = (uint64_t)v27;
          v63 = 2114;
          v64 = v28;
          _os_log_impl(&dword_1B99BB000, v24, OS_LOG_TYPE_DEFAULT, "%p: Updating thread (%{public}@) with change: %{public}@", buf, 0x20u);

          v6 = v56;
        }

        if (-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v12))
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
        objc_msgSend(v8, "thread");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "query");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMSortableThreadProxy updateFromThread:addingAdditionalInformation:query:](v10, "updateFromThread:addingAdditionalInformation:query:", v29, 0, v30);

        v31 = *(void **)(a1 + 64);
        objc_msgSend(v8, "thread");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectID](v13, "objectID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v12, v32);

      }
      else
      {
        objc_msgSend(v23, "logClient");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v49 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v8, "thread");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "itemID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          v60 = v49;
          v61 = 2114;
          v62 = (uint64_t)v51;
          v63 = 2114;
          v64 = v52;
          _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "%p: No change detected for thread with item ID: %{public}@, keyPaths: %{public}@", buf, 0x20u);

        }
      }
    }
    goto LABEL_34;
  }
  if (v10)
  {
    v58 = 0;
    -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:](*(void **)(a1 + 32), v10, &v58);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
      objc_msgSend(*(id *)(a1 + 32), "logClient");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = -[EMSortableThreadProxy conversationID](v10, "conversationID");
        *(_DWORD *)buf = 134218240;
        v60 = v14;
        v61 = 2050;
        v62 = v15;
        v16 = "%p: Marking thread proxy %{public}lld as deleted";
        v17 = v13;
        v18 = 22;
LABEL_8:
        _os_log_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      v42 = *(void **)(a1 + 32);
      if (v12)
      {
        objc_msgSend(v42, "logClient");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v6;
          v45 = *(_QWORD *)(a1 + 32);
          v46 = -[EMSortableThreadProxy conversationID](v10, "conversationID");
          objc_msgSend(v12, "ef_publicDescription");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v60 = v45;
          v61 = 2048;
          v62 = v46;
          v63 = 2114;
          v64 = v47;
          _os_log_impl(&dword_1B99BB000, v43, OS_LOG_TYPE_DEFAULT, "%p: Updating thread proxy (%lld) with change: %{public}@", buf, 0x20u);

          v6 = v44;
        }

        if (-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v12))
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
        v48 = *(void **)(a1 + 64);
        -[EMSortableThreadProxy objectID](v10, "objectID");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v12, v13);
        goto LABEL_34;
      }
      objc_msgSend(v42, "logClient");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v53 = *(_QWORD *)(a1 + 32);
        v54 = -[EMSortableThreadProxy conversationID](v10, "conversationID");
        v55 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v60 = v53;
        v61 = 2048;
        v62 = v54;
        v63 = 2114;
        v64 = v55;
        v16 = "%p: No change detected for thread proxy with item ID: %lld, keyPaths: %{public}@";
        v17 = v13;
        v18 = 32;
        goto LABEL_8;
      }
    }
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  if (!*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "logClient");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      v60 = v34;
      v61 = 2048;
      v62 = objc_msgSend(v5, "longLongValue");
      _os_log_impl(&dword_1B99BB000, v33, OS_LOG_TYPE_DEFAULT, "%p: Unable to find thread for conversation ID: %lld", buf, 0x16u);
    }

    v35 = [EMInMemoryThread alloc];
    objc_msgSend(*(id *)(a1 + 32), "query");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "threadScope");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:](v35, "initWithMessages:originatingQuery:threadScope:", v57, v36, v37);

    v39 = [EMSortableThreadProxy alloc];
    -[EMInMemoryThread thread](v38, "thread");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "query");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EMSortableThreadProxy initWithThread:originatingQuery:](v39, "initWithThread:originatingQuery:", v40, v41);

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v10);
    goto LABEL_35;
  }
LABEL_36:

  objc_autoreleasePoolPop(v6);
}

- (void)objectIDDidChangeForMessage:(id)a3 oldObjectID:(id)a4 oldConversationID:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__EMInMemoryThreadCollection_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke;
  v12[3] = &unk_1E70F3530;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v12);

}

void __88__EMInMemoryThreadCollection_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke(uint64_t a1)
{
  -[EMInMemoryThreadCollection _nts_objectIDDidChangeForMessage:oldObjectID:oldConversationID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_nts_objectIDDidChangeForMessage:(void *)a3 oldObjectID:(uint64_t)a4 oldConversationID:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  char v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend((id)a1, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareToSendUpdatesInCollection:", a1);

    v10 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke;
    v46[3] = &unk_1E70F3558;
    v46[4] = a1;
    v11 = v8;
    v47 = v11;
    v42 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC8C10](v46);
    if (objc_msgSend(v7, "conversationID") == a4)
    {
      objc_msgSend((id)a1, "inMemoryThreadCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedObjectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
      v15 = *(void **)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
      if (v14)
      {
        objc_msgSend(v14, "updateMessage:fromOldObjectID:", v7, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "thread");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "query");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateFromThread:addingAdditionalInformation:query:", v19, 0, v20);

        objc_msgSend(v14, "thread");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v42)[2](v42, v18, v22);

      }
      else
      {
        v43 = 0;
        -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:]((void *)a1, v17, &v43);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v42)[2](v42, v18, v21);
      }

      objc_msgSend((id)a1, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "collection:notifyReplacedExistingObjectID:newObjectID:", a1, v11, v35);

    }
    else
    {
      objc_msgSend((id)a1, "inMemoryThreadCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cachedObjectForKey:", v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
      v25 = *(void **)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
      if (v14)
      {
        objc_msgSend(v14, "messages");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v10;
        v44[1] = 3221225472;
        v44[2] = __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke_60;
        v44[3] = &unk_1E70F3580;
        v45 = v11;
        objc_msgSend(v27, "ef_filter:", v44);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0;
        objc_msgSend(v14, "removeMessages:threadIsEmpty:", v28, &v43);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend((id)a1, "inMemoryThreadCache");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeObjectForKey:", v31);

          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:", v17, 0);
          objc_msgSend((id)a1, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "collection:reportDeletes:", a1, v32);
        }
        else
        {
          objc_msgSend(v14, "thread");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "query");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "updateFromThread:addingAdditionalInformation:query:", v39, 0, v40);

          objc_msgSend(v14, "thread");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v42)[2](v42, v29, v33);
        }

      }
      else if (v17)
      {
        v43 = 0;
        -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:]((void *)a1, v17, &v43);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:", v17, 0);
          objc_msgSend((id)a1, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "collection:reportDeletes:", a1, v37);

        }
        else
        {
          objc_msgSend(v17, "objectID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v42)[2](v42, v36, v37);
        }

      }
    }

    objc_msgSend((id)a1, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "didSendUpdatesInCollection:", a1);

  }
}

void __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "logClient");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Changed objectID from %{public}@ for message in thread: %{public}@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collection:reportChanges:", v11, v12);

  }
}

uint64_t __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke_60(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)conversationIDDidChangeForMessages:(id)a3 fromConversationID:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__EMInMemoryThreadCollection_conversationIDDidChangeForMessages_fromConversationID___block_invoke;
  v8[3] = &unk_1E70F2998;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v8);

}

void __84__EMInMemoryThreadCollection_conversationIDDidChangeForMessages_fromConversationID___block_invoke(uint64_t a1)
{
  -[EMInMemoryThreadCollection _nts_conversationIDDidChangeForMessages:fromConversationID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_nts_conversationIDDidChangeForMessages:(uint64_t)a3 fromConversationID:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  EMSortableThreadProxy *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  EMInMemoryThread *v37;
  void *v38;
  void *v39;
  EMInMemoryThread *v40;
  EMSortableThreadProxy *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  char v50;

  v46 = a2;
  if (!a1)
    goto LABEL_26;
  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)a1, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareToSendUpdatesInCollection:", a1);

  objc_msgSend(v46, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conversationID");

  objc_msgSend((id)a1, "inMemoryThreadCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedObjectForKey:", v9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  v10 = *(void **)(a1 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (EMSortableThreadProxy *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  if (v45)
  {
    objc_msgSend(v45, "addMessages:", v46);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "thread");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "query");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy updateFromThread:addingAdditionalInformation:query:](v12, "updateFromThread:addingAdditionalInformation:query:", v14, 0, v15);

    if (v13)
    {
      objc_msgSend(v45, "thread");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v13, v17);

    }
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  if (v12)
  {
    v50 = 0;
    -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:]((void *)a1, v12, &v50);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[EMSortableThreadProxy objectID](v12, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v18, v19);

    }
    goto LABEL_10;
  }
  v37 = [EMInMemoryThread alloc];
  objc_msgSend((id)a1, "query");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "threadScope");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:](v37, "initWithMessages:originatingQuery:threadScope:", v46, v38, v39);

  v41 = [EMSortableThreadProxy alloc];
  -[EMInMemoryThread thread](v40, "thread");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "query");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EMSortableThreadProxy initWithThread:originatingQuery:](v41, "initWithThread:originatingQuery:", v42, v43);

  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:", v12, 0);
  v20 = -[EMInMemoryThreadCollection _mergeInThreads:forMove:](a1, v44, 0);

LABEL_11:
  objc_msgSend((id)a1, "inMemoryThreadCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cachedObjectForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  v24 = *(void **)(a1 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v50 = 0;
  if (v23)
  {
    objc_msgSend(v23, "removeMessages:threadIsEmpty:", v46, &v50);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend((id)a1, "inMemoryThreadCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeObjectForKey:", v29);
    }
    else
    {
      objc_msgSend(v23, "thread");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "query");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updateFromThread:addingAdditionalInformation:query:", v28, 0, v29);
    }

  }
  else
  {
    if (!v26)
    {
      v27 = 0;
      goto LABEL_23;
    }
    -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:]((void *)a1, v26, &v50);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v50)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:", v26, 0);
    objc_msgSend((id)a1, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v20 |= objc_msgSend(v31, "collection:reportDeletes:", a1, v30);

LABEL_22:
    goto LABEL_23;
  }
  if (v27)
  {
    objc_msgSend(v26, "objectID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v27, v30);
    goto LABEL_22;
  }
LABEL_23:
  v32 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __89__EMInMemoryThreadCollection__nts_conversationIDDidChangeForMessages_fromConversationID___block_invoke;
  v48[3] = &unk_1E70F35A8;
  v48[4] = a1;
  v33 = v32;
  v49 = v33;
  objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v48);
  objc_msgSend((id)a1, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "collection:reportChanges:", a1, v47);

  if ((-[EMInMemoryThreadCollection _mergeInThreads:forMove:](a1, v33, 1u) | v35 | v20) == 1)
  {
    objc_msgSend((id)a1, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "didSendUpdatesInCollection:", a1);

  }
LABEL_26:

}

void __89__EMInMemoryThreadCollection__nts_conversationIDDidChangeForMessages_fromConversationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), a3))
  {
    v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
    os_unfair_lock_lock(v5);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "conversationID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  }
}

- (void)conversationNotificationLevelDidChangeForConversation:(int64_t)a3 conversationID:(int64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__EMInMemoryThreadCollection_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke;
  v4[3] = &unk_1E70F35D0;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[EMInMemoryThreadCollection performBlockOnSchedulerIfNecessary:](self, "performBlockOnSchedulerIfNecessary:", v4);
}

void __99__EMInMemoryThreadCollection_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke(uint64_t *a1)
{
  -[EMInMemoryThreadCollection _nts_conversationNotificationLevelDidChangeForConversation:conversationID:](a1[4], a1[5], a1[6]);
}

- (void)_nts_conversationNotificationLevelDidChangeForConversation:(uint64_t)a3 conversationID:
{
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  void *v9;
  EMMessageListItemChange *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v7 = *(void **)(a1 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v6);
    if (v9)
    {
      v10 = objc_alloc_init(EMMessageListItemChange);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setConversationNotificationLevel:](v10, "setConversationNotificationLevel:", v11);

      objc_msgSend((id)a1, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "prepareToSendUpdatesInCollection:", a1);

      objc_msgSend((id)a1, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      v18[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collection:reportChanges:", a1, v15);

      objc_msgSend((id)a1, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "didSendUpdatesInCollection:", a1);

    }
  }
}

- (BOOL)_didMergeInThreads:(_BOOL8)a1
{
  id v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a2;
  if (a1)
  {
    if (-[EMInMemoryThreadCollection _hasLoaded](a1))
    {
      v4 = objc_msgSend((id)a1, "dateSortOrder") == 1;
      v5 = objc_msgSend((id)a1, "dateSortOrder") != 0;
      objc_msgSend((id)a1, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mailboxesInCollection:", a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49__EMInMemoryThreadCollection__didMergeInThreads___block_invoke;
      v11[3] = &unk_1E70F35F8;
      v11[4] = a1;
      v13 = &v15;
      v14 = v5;
      v9 = v8;
      v12 = v9;
      objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2 * v4, v11);
      if (*((_BYTE *)v16 + 24))
      {
        -[EMInMemoryThreadCollection _notifyObserverOfOldestThreadsByMailboxObjectIDs]((_QWORD *)a1);
        a1 = *((_BYTE *)v16 + 24) != 0;
      }
      else
      {
        a1 = 0;
      }

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __40__EMInMemoryThreadCollection__hasLoaded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;

  objc_msgSend(a2, "oldestThreadsByMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

void __49__EMInMemoryThreadCollection__didMergeInThreads___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  uint64_t v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 48);
  os_unfair_lock_lock(v7);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "conversationID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v16 = -[EMInMemoryThreadCollection _updateCurrentOldestThreadWithThreadIfApplicable:forMailbox:](*(_QWORD *)(a1 + 32), v6, v15);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = (v16 & 1) != 0 || *(_BYTE *)(v17 + 24) != 0;
        *(_BYTE *)(v17 + 24) = v18;
        if (*(_BYTE *)(a1 + 56))
          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v15, (_QWORD)v19);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  if (*(_BYTE *)(a1 + 56) && !objc_msgSend(*(id *)(a1 + 40), "count"))
    *a4 = 1;

}

- (id)itemIDs
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[EMInMemoryThreadCollection scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__EMInMemoryThreadCollection_itemIDs__block_invoke;
  v6[3] = &unk_1E70F3660;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performSyncBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__EMInMemoryThreadCollection_itemIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_67_0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

EMThreadCollectionItemID *__37__EMInMemoryThreadCollection_itemIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  EMThreadCollectionItemID *v3;

  v2 = a2;
  v3 = -[EMThreadCollectionItemID initWithConversationID:]([EMThreadCollectionItemID alloc], "initWithConversationID:", objc_msgSend(v2, "longLongValue"));

  return v3;
}

- (EMInMemoryThreadCollectionDataSource)dataSource
{
  return (EMInMemoryThreadCollectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (EMInMemoryThreadCollectionDelegate)delegate
{
  return (EMInMemoryThreadCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_os_log)logClient
{
  return self->_logClient;
}

- (void)setLogClient:(id)a3
{
  objc_storeStrong((id *)&self->_logClient, a3);
}

- (EMQuery)query
{
  return self->_query;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EMMailboxTypeResolver)mailboxTypeResolver
{
  return self->_mailboxTypeResolver;
}

- (EFLazyCache)inMemoryThreadCache
{
  return self->_inMemoryThreadCache;
}

- (int64_t)dateSortOrder
{
  return self->_dateSortOrder;
}

- (id)comparator
{
  return self->_comparator;
}

- (EFAssertableScheduler)scheduler
{
  return self->_scheduler;
}

- (BOOL)limitedCache
{
  return self->_limitedCache;
}

- (void)setLimitedCache:(BOOL)a3
{
  self->_limitedCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_inMemoryThreadCache, 0);
  objc_storeStrong((id *)&self->_mailboxTypeResolver, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_oldestThreadsByMailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxesByConversationID, 0);
  objc_storeStrong((id *)&self->_inMemoryThreadsByConversationID, 0);
  objc_storeStrong((id *)&self->_threadsByConversationID, 0);
  objc_storeStrong((id *)&self->_conversationIDs, 0);
}

- (void)_nts_messagesWereChanged:(uint64_t)a1 forKeyPaths:(uint64_t)a2 deleted:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "%p: Marking threads from messages %{public}@ as deleted even though no messages were deleted.", (uint8_t *)&v3, 0x16u);
}

@end
