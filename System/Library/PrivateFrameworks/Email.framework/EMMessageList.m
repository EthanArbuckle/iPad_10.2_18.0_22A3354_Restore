@implementation EMMessageList

id __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __56__EMMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)messageListItemsForItemIDs:(id)a3 ifAvailable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  EMMessageList *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[EMMessageList log](EMMessageList, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = &stru_1E70F6E90;
    *(_DWORD *)buf = 138543874;
    if (v4)
      v8 = CFSTR(" available");
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "Getting%{public}@ message list items: %@\n%@", buf, 0x20u);
  }

  if (v4)
  {
    -[EMMessageList _availableMessageListItemsForItemIDs:](self, "_availableMessageListItemsForItemIDs:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__EMMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke;
    v13[3] = &unk_1E70F4080;
    v11 = v10;
    v14 = v11;
    objc_msgSend(v6, "ef_map:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageList _attemptToFinishRetryingPromisesByItemID:](self, "_attemptToFinishRetryingPromisesByItemID:", v11);

  }
  return v9;
}

NSObject *__54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id *v9;
  id *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(a1[4], "containsItemID:includeRecovery:", v3, 0))
  {
    objc_msgSend(a1[5], "cachedObjectForKey:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_3;
      v25[3] = &unk_1E70F40A8;
      v26 = a1[5];
      v5 = v3;
      v6 = a1[4];
      v27[0] = v5;
      v27[1] = v6;
      -[NSObject addSuccessBlock:](v4, "addSuccessBlock:", v25);
      +[EMMessageList log](EMMessageList, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = a1[4];
        *(_DWORD *)buf = 138543874;
        v29 = v5;
        v30 = 2114;
        v31 = v4;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "Cache hit for %{public}@ returning %{public}@\n%@", buf, 0x20u);
      }

      v9 = &v26;
      v10 = (id *)v27;
      v11 = v4;
    }
    else
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_107;
      v21 = &unk_1E70F40F8;
      v13 = a1[5];
      v24 = a1[6];
      v14 = v3;
      v22 = v14;
      v23 = a1[5];
      objc_msgSend(v13, "objectForKey:generator:", v14, &v18);
      v11 = objc_claimAutoreleasedReturnValue();
      +[EMMessageList log](EMMessageList, "log", v18, v19, v20, v21, v22);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = a1[4];
        *(_DWORD *)buf = 138543874;
        v29 = v14;
        v30 = 2114;
        v31 = v11;
        v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "Cache miss for %{public}@ returning %{public}@\n%@", buf, 0x20u);
      }

      v9 = &v24;
      v10 = &v22;
    }

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
    v11 = objc_claimAutoreleasedReturnValue();
    +[EMMessageList log](EMMessageList, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 138543874;
      v29 = v3;
      v30 = 2114;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Unknown item request for %{public}@ returning %{public}@\n%@", buf, 0x20u);
    }
  }

  return v11;
}

void __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v9);

  +[EMMessageList log](EMMessageList, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v22 = v6;
    v23 = 2114;
    v24 = v8;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "itemFuture %{public}@ -> retryingFuture: %{public}@\n%@", buf, 0x20u);
  }

  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_113;
  v19[3] = &unk_1E70F4008;
  v13 = v7;
  v20 = v13;
  objc_msgSend(v6, "addSuccessBlock:", v19);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_2;
  v16[3] = &unk_1E70F4198;
  v16[4] = *(_QWORD *)(a1 + 48);
  v14 = v5;
  v17 = v14;
  v15 = v13;
  v18 = v15;
  objc_msgSend(v6, "addFailureBlock:", v16);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__EMMessageList_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_24 != -1)
    dispatch_once(&log_onceToken_24, block);
  return (OS_os_log *)(id)log_log_24;
}

- (void)_attemptToFinishRetryingPromisesByItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  EMMessageList *v12;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageList _availableMessageListItemsForItemIDs:](self, "_availableMessageListItemsForItemIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke;
  v9[3] = &unk_1E70F41C0;
  v10 = v6;
  v8 = v4;
  v11 = v8;
  v12 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

}

- (id)_availableMessageListItemsForItemIDs:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  EMMessageList *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v19 = a3;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EMMessageList cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke;
  v29[3] = &unk_1E70F4080;
  v6 = v17;
  v30 = v6;
  v7 = (void *)MEMORY[0x1BCCC8C10](v29);
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2;
  v26[3] = &unk_1E70F4120;
  v26[4] = self;
  v8 = v4;
  v27 = v8;
  v9 = v7;
  v28 = v9;
  objc_msgSend(v19, "ef_map:", v26);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_109;
  v24[3] = &unk_1E70F4148;
  v24[4] = self;
  v11 = v6;
  v25 = v11;
  objc_msgSend(v10, "ef_compactMap:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[EMMessageList repository](self, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMObject objectID](self, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageListItemsForObjectIDs:observationIdentifier:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_111;
    v20[3] = &unk_1E70F4170;
    v21 = v12;
    v22 = self;
    v23 = v11;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);

  }
  return v18;
}

- (NSSet)expandedThreadItemIDs
{
  os_unfair_lock_s *p_expandedThreadsLock;
  id v4;
  void *v5;
  void *v6;

  if (-[EMMessageList isThreaded](self, "isThreaded"))
  {
    p_expandedThreadsLock = &self->_expandedThreadsLock;
    os_unfair_lock_lock(&self->_expandedThreadsLock);
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NSMutableDictionary allKeys](self->_expandedThreads, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

    os_unfair_lock_unlock(p_expandedThreadsLock);
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
}

- (EFLazyCache)cache
{
  return self->_cache;
}

- (EMMessageRepository)repository
{
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMMessageList;
  -[EMRepositoryObject repository](&v7, sel_repository);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 57, CFSTR("Wrong repository type"));

    }
  }
  return (EMMessageRepository *)v4;
}

- (id)objectIDForItemID:(id)a3
{
  id v4;
  EMMessageObjectID *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EMThreadObjectID *v9;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[EMMessageList isThreaded](self, "isThreaded"))
    {
      v9 = [EMThreadObjectID alloc];
      -[EMMessageList threadScope](self, "threadScope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[EMThreadObjectID initWithCollectionItemID:threadScope:](v9, "initWithCollectionItemID:threadScope:", v4, v6);
      goto LABEL_4;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v5 = [EMMessageObjectID alloc];
  -[EMMessageList mailboxScope](self, "mailboxScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMMessageObjectID initWithCollectionItemID:mailboxScope:](v5, "initWithCollectionItemID:mailboxScope:", v4, v6);
LABEL_4:
  v8 = (void *)v7;

LABEL_9:
  return v8;
}

- (id)itemIDForObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (!v5)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !-[EMMessageList isThreaded](self, "isThreaded"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 393, CFSTR("Object ID of unrecognized type"));

LABEL_7:
      v6 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v5, "collectionItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v6;
}

- (BOOL)isThreaded
{
  void *v2;
  char v3;

  -[EMQueryingCollection query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_msgSend(v2, "targetClass"), "isEqual:", objc_opt_class());

  return v3;
}

- (BOOL)objectIDBelongsToCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[EMMessageList mailboxScope](self, "mailboxScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !-[EMMessageList isThreaded](self, "isThreaded"))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v10 = v4;
    -[EMMessageList threadScope](self, "threadScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "threadScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  v9 = v8;

LABEL_8:
  return v9;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (id)messageListItemForItemID:(id)a3
{
  -[EMMessageList messageListItemForItemID:ifAvailable:](self, "messageListItemForItemID:ifAvailable:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messageListItemForItemID:(id)a3 ifAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[24];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageList messageListItemsForItemIDs:ifAvailable:](self, "messageListItemsForItemIDs:ifAvailable:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EMMessageList log](EMMessageList, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[EMMessageList ef_publicDescription](self, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageList messageListItemForItemID:ifAvailable:].cold.1(v12, buf, v11);
    }

    v13 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    +[EMMessageList log](EMMessageList, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Missing summary for itemID, refetching: %{public}@\n%@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (BOOL)anyExpandedThreadContainsItemID:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[EMMessageList isThreaded](self, "isThreaded")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[EMQueryingCollection containsItemID:includeRecovery:](self, "containsItemID:includeRecovery:", v4, 1);

  return v5;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EMMessageList _addPrecachedItemsFromExtraInfo:](self, "_addPrecachedItemsFromExtraInfo:", v10);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  v17[4] = __Block_byref_object_dispose__7;
  v18 = (id)0xAAAAAAAAAAAAAAAALL;
  -[EMQueryingCollection firstExistingItemIDAfterItemID:](self, "firstExistingItemIDAfterItemID:", v9);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__EMMessageList_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke;
  v13[3] = &unk_1E70F3F90;
  v13[4] = self;
  v11 = v10;
  v14 = v11;
  v16 = v17;
  v12 = v8;
  v15 = v12;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v13);

  _Block_object_dispose(v17, 8);
}

void __73__EMMessageList_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id obj;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (_os_feature_enabled_impl() && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "_hintsByObjectIDFromExtraInfo:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "collection:shouldHighlightSnippetHints:", v4, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "_unreadItemIDsFromExtraInfo:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "_sectionItemIDsForChangeObserver:extraInfo:outUndeletedItemID:isAfter:", v3, v8, &obj, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    v11 = v10;
    if (!v10)
      v11 = *(void **)(a1 + 48);
    v12 = v11;

    if ((objc_msgSend(*(id *)(a1 + 48), "ef_isEmpty") & 1) != 0 || (objc_msgSend(v12, "ef_isEmpty") & 1) == 0)
      objc_msgSend(v3, "collection:addedItemIDs:toThreadWithItemID:before:unreadItemIDs:", *(_QWORD *)(a1 + 32), v12, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);

  }
  else
  {
    objc_msgSend(v3, "collection:addedItemIDs:before:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }

}

- (id)_unreadItemIDsFromExtraInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unreadMessageIDs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__EMMessageList__unreadItemIDsFromExtraInfo___block_invoke;
    v8[3] = &unk_1E70F3F18;
    v8[4] = self;
    objc_msgSend(v5, "ef_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_hintsByObjectIDFromExtraInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("snippetHintsByObjectID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__EMMessageList__hintsByObjectIDFromExtraInfo___block_invoke;
    v8[3] = &unk_1E70F3F40;
    v6 = v5;
    v9 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    -[EMMessageList debugDescription](self, "debugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[EMMessageList isThreaded](self, "isThreaded"))
    {
      os_unfair_lock_lock(&self->_expandedThreadsLock);
      v6 = (void *)-[NSMutableDictionary copy](self->_expandedThreads, "copy");
      os_unfair_lock_unlock(&self->_expandedThreadsLock);
      v7 = (void *)MEMORY[0x1E0CB3940];
      v12.receiver = self;
      v12.super_class = (Class)EMMessageList;
      -[EMObject ef_publicDescription](&v12, sel_ef_publicDescription);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@\n\tExpandedThreads:%@"), v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v9;
    }
    v11.receiver = self;
    v11.super_class = (Class)EMMessageList;
    -[EMObject ef_publicDescription](&v11, sel_ef_publicDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

id __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectIDForItemID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);

    +[EMMessageList log](EMMessageList, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_109_cold_1((uint64_t)v3, v4, v8);

  }
  return v5;
}

- (EMMessageList)initWithQuery:(id)a3 repository:(id)a4
{
  id v7;
  id v8;
  EMMessageList *v9;
  EMMessageList *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[repository isKindOfClass:[EMMessageRepository class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)EMMessageList;
  v9 = -[EMQueryingCollection initWithObjectID:query:](&v13, sel_initWithObjectID_query_, 0, v7);
  v10 = v9;
  if (v9)
    -[EMMessageList _commonInitWithRepository:](v9, "_commonInitWithRepository:", v8);

  return v10;
}

- (void)_commonInitWithRepository:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *expandedThreads;
  void *v6;
  void *v7;
  void *v8;
  EMThreadScope *v9;
  EMThreadScope *threadScope;
  NSMapTable *v11;
  NSMapTable *messageListItemsForRetry;
  EFLazyCache *v13;
  EFLazyCache *cache;
  void *v15;
  void *v16;
  void *v17;
  EMMailboxScope *v18;
  EMMailboxScope *mailboxScope;
  void *v20;
  void *v21;
  EFScheduler *v22;
  EFScheduler *observerScheduler;
  NSObject *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *contentProtectionQueue;
  EMCollectionItemIDStateCapturer *v27;
  objc_class *v28;
  void *v29;
  EMCollectionItemIDStateCapturer *v30;
  EMCollectionItemIDStateCapturer *stateCapturer;
  id v32;

  v32 = a3;
  if (-[EMMessageList isThreaded](self, "isThreaded"))
  {
    self->_expandedThreadsLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    expandedThreads = self->_expandedThreads;
    self->_expandedThreads = v4;

    -[EMQueryingCollection query](self, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mailboxRepository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMessageListItemPredicates threadScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "threadScopeForPredicate:withMailboxTypeResolver:", v7, v8);
    v9 = (EMThreadScope *)objc_claimAutoreleasedReturnValue();
    threadScope = self->_threadScope;
    self->_threadScope = v9;

  }
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  messageListItemsForRetry = self->_messageListItemsForRetry;
  self->_messageListItemsForRetry = v11;

  v13 = (EFLazyCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 200);
  cache = self->_cache;
  self->_cache = v13;

  -[EMMessageList setRepository:](self, "setRepository:", v32);
  -[EMQueryingCollection query](self, "query");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "mailboxRepository");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", v16, v17);
  v18 = (EMMailboxScope *)objc_claimAutoreleasedReturnValue();
  mailboxScope = self->_mailboxScope;
  self->_mailboxScope = v18;

  v20 = (void *)MEMORY[0x1E0D1F070];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.observerScheduler"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "serialDispatchQueueSchedulerWithName:", v21);
  v22 = (EFScheduler *)objc_claimAutoreleasedReturnValue();
  observerScheduler = self->_observerScheduler;
  self->_observerScheduler = v22;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.email.EMMessageList.contentProtectionQueue", v24);
  contentProtectionQueue = self->_contentProtectionQueue;
  self->_contentProtectionQueue = v25;

  EFRegisterContentProtectionObserver();
  v27 = [EMCollectionItemIDStateCapturer alloc];
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[EMCollectionItemIDStateCapturer initWithTitle:delegate:](v27, "initWithTitle:delegate:", v29, self);
  stateCapturer = self->_stateCapturer;
  self->_stateCapturer = v30;

}

- (void)setRepository:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 57, CFSTR("Wrong repository type"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMMessageList;
  -[EMRepositoryObject setRepository:](&v7, sel_setRepository_, v5);

}

void __20__EMMessageList_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_24;
  log_log_24 = (uint64_t)v1;

}

+ (id)threadedMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 shouldUpdateDisplayDate:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v6 = a6;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[EMMessageListItemPredicates sortDescriptorForDateAscending:](EMMessageListItemPredicates, "sortDescriptorForDateAscending:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadedMessageListForMailboxes:withRepository:additionalQueryOptions:countOfItemsToPrecache:shouldUpdateDisplayDate:sortDescriptors:transformPredicate:ignoreMessageAdditionsPredicate:", v10, v11, a5, 0, v6, v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)threadedMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 countOfItemsToPrecache:(unint64_t)a6 shouldUpdateDisplayDate:(BOOL)a7 sortDescriptors:(id)a8 transformPredicate:(id)a9 ignoreMessageAdditionsPredicate:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  LOBYTE(v23) = a7;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMailboxes:repository:sortDescriptors:transformPredicate:ignoreMessageAdditionsPredicate:targetClass:additionalQueryOptions:countOfItemsToPrecache:shouldUpdateDisplayDate:labelPrefix:", v16, v17, v18, v19, v20, objc_opt_class(), a5, a6, v23, CFSTR("EMMessageList-threaded"));

  return v21;
}

+ (id)simpleMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 shouldUpdateDisplayDate:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v6 = a6;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[EMMessageListItemPredicates sortDescriptorForDateAscending:](EMMessageListItemPredicates, "sortDescriptorForDateAscending:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "simpleMessageListForMailboxes:withRepository:additionalQueryOptions:countOfItemsToPrecache:shouldUpdateDisplayDate:sortDescriptors:transformPredicate:ignoreMessageAdditionsPredicate:", v10, v11, a5, 0, v6, v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)simpleMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 countOfItemsToPrecache:(unint64_t)a6 shouldUpdateDisplayDate:(BOOL)a7 sortDescriptors:(id)a8 transformPredicate:(id)a9 ignoreMessageAdditionsPredicate:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  LOBYTE(v23) = a7;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMailboxes:repository:sortDescriptors:transformPredicate:ignoreMessageAdditionsPredicate:targetClass:additionalQueryOptions:countOfItemsToPrecache:shouldUpdateDisplayDate:labelPrefix:", v16, v17, v18, v19, v20, objc_opt_class(), a5, a6, v23, CFSTR("EMMessageList-simple"));

  return v21;
}

- (EMMessageList)initWithMailboxes:(id)a3 repository:(id)a4 sortDescriptors:(id)a5 transformPredicate:(id)a6 ignoreMessageAdditionsPredicate:(id)a7 targetClass:(Class)a8 additionalQueryOptions:(unint64_t)a9 countOfItemsToPrecache:(unint64_t)a10 shouldUpdateDisplayDate:(BOOL)a11 labelPrefix:(id)a12
{
  id v18;
  id v19;
  void (**v20)(id, id);
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  EMQuery *v29;
  void *v30;
  EMQuery *v31;
  EMMessageList *v32;
  void *v34;
  void *v35;
  id v36;
  id v38;

  v18 = a3;
  v19 = a4;
  v36 = a5;
  v20 = (void (**)(id, id))a6;
  v38 = a7;
  v21 = a12;
  v35 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[repository isKindOfClass:[EMMessageRepository class]]"));

  }
  +[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", v18);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v20)
  {
    v20[2](v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!a11)
  {
    if (!v38)
    {
      if (!a10)
      {
        v26 = 0;
        goto LABEL_17;
      }
      goto LABEL_15;
    }
LABEL_10:
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    goto LABEL_11;
  }
  v24 = objc_alloc(MEMORY[0x1E0C99E08]);
  v25 = (id)objc_msgSend(v24, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("UpdateDisplayDate"), 0, v18);
  if (!v38)
  {
    v26 = v25;
    if (!a10)
      goto LABEL_17;
LABEL_12:
    if (v26)
    {
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("precacheItemsWithCount"));

      goto LABEL_17;
    }
LABEL_15:
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    goto LABEL_16;
  }
  if (!v25)
    goto LABEL_10;
LABEL_11:
  v26 = v25;
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v38, CFSTR("EMMessageListIgnoreMessageAdditionsPredicate"));
  if (a10)
    goto LABEL_12;
LABEL_17:
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%p"), v21, self);
  v29 = [EMQuery alloc];
  objc_msgSend(v23, "ef_simplifiedPredicate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:queryOptions:targetClassOptions:label:](v29, "initWithTargetClass:predicate:sortDescriptors:queryOptions:targetClassOptions:label:", a8, v30, v36, a9 | 8, v26, v28);

  v32 = -[EMMessageList initWithQuery:repository:](self, "initWithQuery:repository:", v31, v19);
  return v32;
}

- (EMMessageList)initWithObjectID:(id)a3 query:(id)a4 repository:(id)a5
{
  id v9;
  id v10;
  id v11;
  EMMessageList *v12;
  EMMessageList *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[repository isKindOfClass:[EMMessageRepository class]]"));

  }
  v16.receiver = self;
  v16.super_class = (Class)EMMessageList;
  v12 = -[EMQueryingCollection initWithObjectID:query:](&v16, sel_initWithObjectID_query_, v9, v10);
  v13 = v12;
  if (v12)
    -[EMMessageList _commonInitWithRepository:](v12, "_commonInitWithRepository:", v11);

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EMMessageList;
  -[EMQueryingCollection dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  if (-[EMMessageList isThreaded](self, "isThreaded"))
  {
    os_unfair_lock_lock(&self->_expandedThreadsLock);
    v3 = (void *)-[NSMutableDictionary copy](self->_expandedThreads, "copy");
    os_unfair_lock_unlock(&self->_expandedThreadsLock);
    v4 = (void *)MEMORY[0x1E0CB3940];
    v9.receiver = self;
    v9.super_class = (Class)EMMessageList;
    -[EMObject debugDescription](&v9, sel_debugDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n\tExpandedThreads:%@"), v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EMMessageList;
    -[EMObject debugDescription](&v8, sel_debugDescription);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)stopObserving:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMMessageList;
  -[EMQueryingCollection stopObserving:](&v7, sel_stopObserving_, v4);
  -[EMMessageList cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  os_unfair_lock_lock(&self->_expandedThreadsLock);
  -[NSMutableDictionary allValues](self->_expandedThreads, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_expandedThreads, "removeAllObjects");
  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  objc_msgSend(v6, "makeObjectsPerformSelector:withObject:", sel_stopObserving_, self);

}

- (id)removeItemIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[EMMessageList cache](self, "cache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)EMMessageList;
  -[EMQueryingCollection removeItemIDs:](&v12, sel_removeItemIDs_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __45__EMMessageList__unreadItemIDsFromExtraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "itemIDForObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_sectionFromExtraInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objectIDBySections"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __47__EMMessageList__hintsByObjectIDFromExtraInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "globalMessageID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)_sectionItemIDsForChangeObserver:(id)a3 extraInfo:(id)a4 outUndeletedItemID:(id *)a5 isAfter:(BOOL)a6
{
  _BOOL4 v6;
  void *v8;
  id v9;
  void *v10;
  id v12;
  uint64_t v13;

  v6 = a6;
  v12 = 0;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  -[EMMessageList _itemIDsForChangeObserver:extraInfo:outObserverSection:outObjectIDsBySection:](self, "_itemIDsForChangeObserver:extraInfo:outObserverSection:outObjectIDsBySection:", a3, a4, &v13, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (v6 && v13 == 1 && (objc_msgSend(v9, "ef_isEmpty") & 1) == 0 && (objc_msgSend(v8, "ef_isEmpty") & 1) == 0
    || !v6 && !v13 && (objc_msgSend(v10, "ef_isEmpty") & 1) == 0 && (objc_msgSend(v8, "ef_isEmpty") & 1) == 0)
  {
    *a5 = 0;
  }

  return v8;
}

- (void)_addPrecachedItemsFromExtraInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id obj;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("precachedItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageList cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v12;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessageList itemIDForObjectID:](self, "itemIDForObjectID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __49__EMMessageList__addPrecachedItemsFromExtraInfo___block_invoke;
        v14[3] = &unk_1E70F3F68;
        v14[4] = v8;
        v11 = (id)objc_msgSend(v4, "objectForKey:generator:", v10, v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

uint64_t __49__EMMessageList__addPrecachedItemsFromExtraInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  v17[4] = __Block_byref_object_dispose__7;
  v18 = (id)0xAAAAAAAAAAAAAAAALL;
  -[EMQueryingCollection firstExistingItemIDBeforeItemID:](self, "firstExistingItemIDBeforeItemID:", v9);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__EMMessageList_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke;
  v13[3] = &unk_1E70F3F90;
  v13[4] = self;
  v11 = v10;
  v14 = v11;
  v16 = v17;
  v12 = v8;
  v15 = v12;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v13);

  _Block_object_dispose(v17, 8);
}

void __72__EMMessageList_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id obj;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (_os_feature_enabled_impl() && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "_hintsByObjectIDFromExtraInfo:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "collection:shouldHighlightSnippetHints:", v4, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "_unreadItemIDsFromExtraInfo:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "_sectionItemIDsForChangeObserver:extraInfo:outUndeletedItemID:isAfter:", v3, v8, &obj, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    v11 = v10;
    if (!v10)
      v11 = *(void **)(a1 + 48);
    v12 = v11;

    if ((objc_msgSend(*(id *)(a1 + 48), "ef_isEmpty") & 1) != 0 || (objc_msgSend(v12, "ef_isEmpty") & 1) == 0)
      objc_msgSend(v3, "collection:addedItemIDs:toThreadWithItemID:after:unreadItemIDs:", *(_QWORD *)(a1 + 32), v12, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);

  }
  else
  {
    objc_msgSend(v3, "collection:addedItemIDs:after:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }

}

- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4
{
  +[EMMessageListChangeObserverHelper collection:notifyChangeObserversAboutChangedItemIDs:extraInfo:](EMMessageListChangeObserverHelper, "collection:notifyChangeObserversAboutChangedItemIDs:extraInfo:", self, a3, a4);
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EMQueryingCollection firstExistingItemIDAfterItemID:](self, "firstExistingItemIDAfterItemID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__EMMessageList_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke;
  v15[3] = &unk_1E70F3FB8;
  v15[4] = self;
  v12 = v10;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v18 = v11;
  v14 = v11;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v15);

}

void __73__EMMessageList_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemIDsForChangeObserver:extraInfo:outObserverSection:outObjectIDsBySection:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ef_isEmpty");

  if ((v4 & 1) == 0)
    objc_msgSend(v5, "collection:movedItemIDs:before:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EMQueryingCollection firstExistingItemIDBeforeItemID:](self, "firstExistingItemIDBeforeItemID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__EMMessageList_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke;
  v15[3] = &unk_1E70F3FB8;
  v15[4] = self;
  v12 = v10;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v18 = v11;
  v14 = v11;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v15);

}

void __72__EMMessageList_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemIDsForChangeObserver:extraInfo:outObserverSection:outObjectIDsBySection:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ef_isEmpty");

  if ((v4 & 1) == 0)
    objc_msgSend(v5, "collection:movedItemIDs:after:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)_itemIDsForChangeObserver:(id)a3 extraInfo:(id)a4 outObserverSection:(int64_t *)a5 outObjectIDsBySection:(id *)a6
{
  id v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "sectionForCollection:", self);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
      if (!a5)
        goto LABEL_10;
      goto LABEL_9;
    }
    -[EMMessageList _sectionFromExtraInfo:](self, "_sectionFromExtraInfo:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 == 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a5)
LABEL_9:
      *a5 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_10:

  return v13;
}

- (void)notifyChangeObserver:(id)a3 stockedItemIDs:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "collection:addedItemIDs:toThreadWithItemID:before:unreadItemIDs:", self, v6, 0, 0, 0);
  else
    objc_msgSend(v7, "collection:addedItemIDs:before:", self, v6, 0);

}

- (id)filteredMessageListWithPredicate:(id)a3 ignoredMessagesPredicate:(id)a4 userFiltered:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  EMQuery *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  EMQuery *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  unint64_t v33;
  _QWORD v34[3];

  v5 = a5;
  v34[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a4;
  if (self->_unfilteredMessageList)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 602, CFSTR("filters can't stack"));

  }
  -[EMQueryingCollection query](self, "query", v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v10, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  v34[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "targetClassOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v30)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("EMMessageListIgnoreMessageAdditionsPredicate"));
  }
  if (v5)
    v17 = objc_msgSend(v10, "queryOptions") & 0xFFFFFFFFFFFFEFFFLL;
  else
    v17 = objc_msgSend(v10, "queryOptions");
  v18 = [EMQuery alloc];
  v19 = objc_msgSend(v10, "targetClass");
  objc_msgSend(v14, "ef_simplifiedPredicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __88__EMMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke;
  v31[3] = &unk_1E70F3FE0;
  v33 = v17;
  v22 = v16;
  v32 = v22;
  v23 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:builder:](v18, "initWithTargetClass:predicate:sortDescriptors:builder:", v19, v20, v21, v31);

  v24 = objc_alloc((Class)objc_opt_class());
  -[EMMessageList repository](self, "repository");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithQuery:repository:", v23, v25);

  objc_msgSend(v26, "setFilterPredicate:", v9);
  objc_msgSend(v26, "setUnfilteredMessageList:", self);

  return v26;
}

void __88__EMMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setQueryOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTargetClassOptions:", *(_QWORD *)(a1 + 32));

}

- (EMMessageList)unfilteredMessageList
{
  if (self->_unfilteredMessageList)
    self = self->_unfilteredMessageList;
  return self;
}

- (void)expandThreadsFromThreadItemIDs:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[EMMessageList isThreaded](self, "isThreaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 658, CFSTR("Message list does not support threading"));

  }
  -[EMMessageList messageListItemsForItemIDs:](self, "messageListItemsForItemIDs:", v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __48__EMMessageList_expandThreadsFromThreadItemIDs___block_invoke;
        v13[3] = &unk_1E70F4008;
        v13[4] = self;
        objc_msgSend(v11, "addSuccessBlock:", v13);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __48__EMMessageList_expandThreadsFromThreadItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "expandThread:", v3);

}

- (void)expandThread:(id)a3
{
  NSMutableDictionary *expandedThreads;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[EMMessageList isThreaded](self, "isThreaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 671, CFSTR("Message list does not support threading"));

  }
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  expandedThreads = self->_expandedThreads;
  objc_msgSend(v8, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](expandedThreads, "setObject:forKeyedSubscript:", v8, v6);

  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  objc_msgSend(v8, "beginObserving:", self);

}

- (void)collapseThread:(id)a3
{
  id v5;
  NSMutableDictionary *expandedThreads;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v5 = a3;
  if (!-[EMMessageList isThreaded](self, "isThreaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 681, CFSTR("Message list does not support threading"));

  }
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  expandedThreads = self->_expandedThreads;
  objc_msgSend(v5, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](expandedThreads, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  objc_msgSend(v5, "allItemIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __32__EMMessageList_collapseThread___block_invoke;
  v13[3] = &unk_1E70F4058;
  v13[4] = self;
  v10 = v5;
  v14 = v10;
  objc_msgSend(v8, "addSuccessBlock:", v13);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __32__EMMessageList_collapseThread___block_invoke_4;
  v12[3] = &unk_1E70F3AD0;
  v12[4] = self;
  objc_msgSend(v8, "addFailureBlock:", v12);

}

void __32__EMMessageList_collapseThread___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "removeItemIDs:", v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecentlyCollapsedItemIDs:", v5);

  objc_msgSend(*(id *)(a1 + 40), "stopObserving:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__EMMessageList_collapseThread___block_invoke_2;
  v8[3] = &unk_1E70F2070;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v9 = v7;
  objc_msgSend(v6, "performBlock:", v8);

}

void __32__EMMessageList_collapseThread___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__EMMessageList_collapseThread___block_invoke_3;
  v2[3] = &unk_1E70F4030;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v2);

}

uint64_t __32__EMMessageList_collapseThread___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:deletedItemIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __32__EMMessageList_collapseThread___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EMMessageList log](EMMessageList, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __32__EMMessageList_collapseThread___block_invoke_4_cold_1(v5, v6, (uint64_t)v7, v4);
  }

}

- (BOOL)recentlyCollapsedThreadContainsItemID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EMMessageList recentlyCollapsedItemIDs](self, "recentlyCollapsedItemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)clearRecentlyCollapsedThread
{
  -[EMMessageList setRecentlyCollapsedItemIDs:](self, "setRecentlyCollapsedItemIDs:", 0);
}

- (id)messageListItemsForItemIDs:(id)a3
{
  -[EMMessageList messageListItemsForItemIDs:ifAvailable:](self, "messageListItemsForItemIDs:ifAvailable:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_107(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2_108;
  v4[3] = &unk_1E70F40D0;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "addFailureBlock:", v4);

  return v2;
}

uint64_t __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2_108(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_111(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "itemIDForObjectID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithFuture:", v5);
  +[EMMessageList log](EMMessageList, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[5];
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v5;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "Future for item: %{public}@ -> %{public}@\n%@", (uint8_t *)&v13, 0x20u);
  }

  objc_msgSend(v5, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v11);

}

uint64_t __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_113(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("EMErrorDomain")))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 1025)
  {
LABEL_5:
    objc_msgSend(a1[6], "finishWithError:", v3);
    goto LABEL_6;
  }
  objc_msgSend(a1[4], "contentProtectionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_3;
  block[3] = &unk_1E70F2158;
  v7 = a1[5];
  v8 = a1[4];
  v10 = v7;
  v11 = v8;
  v12 = a1[6];
  dispatch_async(v6, block);

LABEL_6:
}

void __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_3(_QWORD *a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = EFProtectedDataAvailable();
  +[EMMessageList log](EMMessageList, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = a1[4];
      v6 = a1[5];
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Retrying for item: %{public}@\n%@", buf, 0x16u);
    }

    v7 = (void *)a1[5];
    v8 = a1[6];
    v12 = a1[4];
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_attemptToFinishRetryingPromisesByItemID:", v9);

  }
  else
  {
    if (v4)
    {
      v10 = a1[4];
      v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Adding item for retry when unlocked: %{public}@\n%@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1[5] + 112), "setObject:forKey:", a1[6], a1[4]);
  }
}

- (void)invalidateCacheForItemIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMMessageList cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)itemIDOfMessageListItemWithDisplayMessage:(id)a3
{
  id v4;
  EMThreadCollectionItemID *v5;
  EMThreadCollectionItemID *v6;
  EMThreadCollectionItemID *v7;

  v4 = a3;
  if (-[EMMessageList isThreaded](self, "isThreaded"))
  {
    v5 = -[EMThreadCollectionItemID initWithConversationID:]([EMThreadCollectionItemID alloc], "initWithConversationID:", objc_msgSend(v4, "conversationID"));
  }
  else
  {
    objc_msgSend(v4, "itemID");
    v5 = (EMThreadCollectionItemID *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (-[EMQueryingCollection containsItemID:includeRecovery:](self, "containsItemID:includeRecovery:", v5, 0))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)finishRecovery
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)EMMessageList;
  -[EMQueryingCollection finishRecovery](&v17, sel_finishRecovery);
  -[EMMessageList cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  if (-[EMMessageList isThreaded](self, "isThreaded"))
  {
    os_unfair_lock_lock(&self->_expandedThreadsLock);
    -[NSMutableDictionary allValues](self->_expandedThreads, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_expandedThreadsLock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
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
          objc_msgSend(v9, "allItemIDs", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "resultIfAvailable");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "count"))
          {
            objc_msgSend(v9, "itemID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[EMQueryingCollection insertItemIDs:after:](self, "insertItemIDs:after:", v11, v12);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }

  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  EMMessageList *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[EMMessageList contentProtectionQueue](self, "contentProtectionQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (EFProtectedDataAvailable())
  {
    -[NSMapTable dictionaryRepresentation](self->_messageListItemsForRetry, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      +[EMMessageList log](EMMessageList, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v8;
        v11 = 2114;
        v12 = self;
        _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "Retrying for items: %{public}@\n%{public}@", (uint8_t *)&v9, 0x16u);

      }
      -[EMMessageList _attemptToFinishRetryingPromisesByItemID:](self, "_attemptToFinishRetryingPromisesByItemID:", v6);
      -[NSMapTable removeAllObjects](self->_messageListItemsForRetry, "removeAllObjects");
    }

  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 934, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    v12 = v9;
    if (-[EMMessageList _threadIsExpanded:](self, "_threadIsExpanded:", v12))
    {
      if (!v11)
      {
        objc_msgSend(v12, "itemID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessageList _nextThreadItemIDAfterThreadItemID:](self, "_nextThreadItemIDAfterThreadItemID:", v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[EMQueryingCollection insertItemIDs:before:](self, "insertItemIDs:before:", v10, v11);
      -[EMMessageList observerScheduler](self, "observerScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __48__EMMessageList_collection_addedItemIDs_before___block_invoke;
      v16[3] = &unk_1E70F3768;
      v16[4] = self;
      v11 = v11;
      v17 = v11;
      v18 = v10;
      v19 = v12;
      objc_msgSend(v14, "performSyncBlock:", v16);

    }
  }

}

void __48__EMMessageList_collection_addedItemIDs_before___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "firstExistingItemIDAfterItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__EMMessageList_collection_addedItemIDs_before___block_invoke_2;
  v5[3] = &unk_1E70F3FB8;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v5);

}

void __48__EMMessageList_collection_addedItemIDs_before___block_invoke_2(uint64_t a1, void *a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collection:addedItemIDs:toThreadWithItemID:before:unreadItemIDs:", v4, v5, v6, *(_QWORD *)(a1 + 56), MEMORY[0x1E0C9AA60]);

  }
  else
  {
    objc_msgSend(v7, "collection:addedItemIDs:before:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    v12 = v9;
    if (-[EMMessageList _threadIsExpanded:](self, "_threadIsExpanded:", v12))
    {
      if (!v11)
      {
        objc_msgSend(v12, "itemID");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[EMQueryingCollection insertItemIDs:after:](self, "insertItemIDs:after:", v10, v11);
      -[EMMessageList observerScheduler](self, "observerScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__EMMessageList_collection_addedItemIDs_after___block_invoke;
      v15[3] = &unk_1E70F3768;
      v15[4] = self;
      v11 = v11;
      v16 = v11;
      v17 = v10;
      v18 = v12;
      objc_msgSend(v13, "performSyncBlock:", v15);

    }
  }

}

void __47__EMMessageList_collection_addedItemIDs_after___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "firstExistingItemIDBeforeItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__EMMessageList_collection_addedItemIDs_after___block_invoke_2;
  v5[3] = &unk_1E70F3FB8;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v5);

}

void __47__EMMessageList_collection_addedItemIDs_after___block_invoke_2(uint64_t a1, void *a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collection:addedItemIDs:toThreadWithItemID:after:unreadItemIDs:", v4, v5, v6, *(_QWORD *)(a1 + 56), MEMORY[0x1E0C9AA60]);

  }
  else
  {
    objc_msgSend(v7, "collection:addedItemIDs:after:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 999, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    v12 = v9;
    if (-[EMMessageList _threadIsExpanded:](self, "_threadIsExpanded:", v12))
    {
      if (!v11)
      {
        objc_msgSend(v12, "itemID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessageList _nextThreadItemIDAfterThreadItemID:](self, "_nextThreadItemIDAfterThreadItemID:", v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[EMQueryingCollection insertItemIDs:before:](self, "insertItemIDs:before:", v10, v11);
      -[EMMessageList observerScheduler](self, "observerScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __48__EMMessageList_collection_movedItemIDs_before___block_invoke;
      v16[3] = &unk_1E70F2158;
      v16[4] = self;
      v11 = v11;
      v17 = v11;
      v18 = v10;
      objc_msgSend(v14, "performSyncBlock:", v16);

    }
  }

}

void __48__EMMessageList_collection_movedItemIDs_before___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "firstExistingItemIDAfterItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__EMMessageList_collection_movedItemIDs_before___block_invoke_2;
  v5[3] = &unk_1E70F41E8;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v5);

}

uint64_t __48__EMMessageList_collection_movedItemIDs_before___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:movedItemIDs:before:", a1[4], a1[5], a1[6]);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 1027, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    v12 = v9;
    if (-[EMMessageList _threadIsExpanded:](self, "_threadIsExpanded:", v12))
    {
      if (!v11)
      {
        objc_msgSend(v12, "itemID");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[EMQueryingCollection insertItemIDs:after:](self, "insertItemIDs:after:", v10, v11);
      -[EMMessageList observerScheduler](self, "observerScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__EMMessageList_collection_movedItemIDs_after___block_invoke;
      v15[3] = &unk_1E70F2158;
      v15[4] = self;
      v11 = v11;
      v16 = v11;
      v17 = v10;
      objc_msgSend(v13, "performSyncBlock:", v15);

    }
  }

}

void __47__EMMessageList_collection_movedItemIDs_after___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "firstExistingItemIDBeforeItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__EMMessageList_collection_movedItemIDs_after___block_invoke_2;
  v5[3] = &unk_1E70F41E8;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v5);

}

uint64_t __47__EMMessageList_collection_movedItemIDs_after___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:movedItemIDs:after:", a1[4], a1[5], a1[6]);
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EMMessageList doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMessageList collection:changedItemIDs:]", "EMMessageList.m", 1056, "0");
}

- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 1060, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering")
    && -[EMMessageList _threadIsExpanded:](self, "_threadIsExpanded:", v9))
  {
    -[EMMessageList observerScheduler](self, "observerScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__EMMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke;
    v14[3] = &unk_1E70F2158;
    v14[4] = self;
    v15 = v10;
    v16 = v11;
    objc_msgSend(v12, "performSyncBlock:", v14);

  }
}

uint64_t __67__EMMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke(_QWORD *a1)
{
  return +[EMMessageListChangeObserverHelper collection:notifyChangeObserversAboutChangedItemIDs:itemIDsWithCountChanges:](EMMessageListChangeObserverHelper, "collection:notifyChangeObserversAboutChangedItemIDs:itemIDsWithCountChanges:", a1[4], a1[5], a1[6]);
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 1079, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    v9 = -[EMMessageList removeItemIDs:](self, "removeItemIDs:", v8);
    -[EMMessageList observerScheduler](self, "observerScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__EMMessageList_collection_deletedItemIDs___block_invoke;
    v12[3] = &unk_1E70F2070;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v10, "performSyncBlock:", v12);

  }
}

void __43__EMMessageList_collection_deletedItemIDs___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__EMMessageList_collection_deletedItemIDs___block_invoke_2;
  v2[3] = &unk_1E70F4030;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v2);

}

uint64_t __43__EMMessageList_collection_deletedItemIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:deletedItemIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 1098, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  v6 = v5;
  -[EMMessageList observerScheduler](self, "observerScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke;
  v10[3] = &unk_1E70F2070;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "performSyncBlock:", v10);

}

void __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke_2;
  v2[3] = &unk_1E70F4030;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v2);

}

void __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collection:didFinishInitialLoadForThreadWithItemID:", v3, v4);

  }
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageList.m"), 1111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[collection isKindOfClass:[EMThread class]]"));

  }
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    -[EMMessageList observerScheduler](self, "observerScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke;
    v14[3] = &unk_1E70F2158;
    v14[4] = self;
    v15 = v10;
    v16 = v11;
    objc_msgSend(v12, "performSyncBlock:", v14);

  }
}

void __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke_2;
  v3[3] = &unk_1E70F41E8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObserversWithBlock:", v3);

}

uint64_t __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:replacedExistingItemID:withNewItemID:", a1[4], a1[5], a1[6]);
}

- (void)queryMatchedMovedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a4;
  v9 = a5;
  -[EMMessageList _expandedObjectIDsForObjectIDs:](self, "_expandedObjectIDsForObjectIDs:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  -[EMQueryingCollection queryMatchedMovedObjectIDs:before:extraInfo:](&v11, sel_queryMatchedMovedObjectIDs_before_extraInfo_, v10, v8, v9);

}

- (void)queryMatchedMovedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a4;
  v9 = a5;
  -[EMMessageList _expandedObjectIDsForObjectIDs:](self, "_expandedObjectIDsForObjectIDs:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  -[EMQueryingCollection queryMatchedMovedObjectIDs:after:extraInfo:](&v11, sel_queryMatchedMovedObjectIDs_after_extraInfo_, v10, v8, v9);

}

- (void)queryMatchedChangedObjectIDs:(id)a3 extraInfo:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *expandedThreads;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD);
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)EMMessageList;
  -[EMQueryingCollection queryMatchedChangedObjectIDs:extraInfo:](&v38, sel_queryMatchedChangedObjectIDs_extraInfo_, a3, v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("changesByObjectID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__7;
  v36 = __Block_byref_object_dispose__7;
  v7 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke;
  v31[3] = &unk_1E70F4210;
  v31[4] = &v32;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC8C10](v31);
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  v9 = objc_msgSend(v20, "count");
  if (v9 >= -[NSMutableDictionary count](self->_expandedThreads, "count"))
  {
    expandedThreads = self->_expandedThreads;
    v29[0] = v7;
    v29[1] = 3221225472;
    v29[2] = __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke_2;
    v29[3] = &unk_1E70F4238;
    v30 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](expandedThreads, "enumerateKeysAndObjectsUsingBlock:", v29);
    v10 = v30;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v20, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_expandedThreads, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v8)[2](v8, v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
      }
      while (v11);
    }
  }

  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = (id)v33[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v16);
        -[EMMessageList collapseThread:](self, "collapseThread:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
    }
    while (v17);
  }

  _Block_object_dispose(&v32, 8);
}

void __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7 && (unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v3)
    {
      objc_msgSend(v3, "addObject:", v7);
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }

}

uint64_t __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_expandedObjectIDsForObjectIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (-[EMMessageList isThreaded](self, "isThreaded"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v15;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v19;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v4, "addObject:", v10);
          -[EMMessageList itemIDForObjectID:](self, "itemIDForObjectID:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[EMMessageList _threadIsExpandedForItemID:](self, "_threadIsExpandedForItemID:", v11))
          {
            v16[0] = v8;
            v16[1] = 3221225472;
            v16[2] = __48__EMMessageList__expandedObjectIDsForObjectIDs___block_invoke;
            v16[3] = &unk_1E70F4260;
            v16[4] = self;
            v17 = v4;
            v12 = -[EMQueryingCollection iterateItemIDsStartingAtItemID:inReverse:withBlock:](self, "iterateItemIDsStartingAtItemID:inReverse:withBlock:", v11, 0, v16);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    v13 = v15;
  }
  else
  {
    v13 = v15;
    v4 = v15;
  }

  return v4;
}

uint64_t __48__EMMessageList__expandedObjectIDsForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectIDForItemID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
  return isKindOfClass & 1;
}

- (void)queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  EMMessageList *v10;

  v4 = a3;
  +[EMMessageList log](EMMessageList, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EMMessageList queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:].cold.1((uint64_t)self, v5);

  -[EMMessageList observerScheduler](self, "observerScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke;
  v8[3] = &unk_1E70F2070;
  v7 = v4;
  v9 = v7;
  v10 = self;
  objc_msgSend(v6, "performSyncBlock:", v8);

}

void __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_2;
  v9[3] = &unk_1E70F4288;
  v3 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "ef_mapValues:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_3;
  v7[3] = &unk_1E70F4030;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObserversWithBlock:", v7);

}

id __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "itemIDForObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "collection:oldestItemsUpdatedForMailboxes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_threadIsExpanded:(id)a3
{
  void *v4;

  objc_msgSend(a3, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[EMMessageList _threadIsExpandedForItemID:](self, "_threadIsExpandedForItemID:", v4);

  return (char)self;
}

- (BOOL)_threadIsExpandedForItemID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_expandedThreadsLock;
  void *v6;

  v4 = a3;
  p_expandedThreadsLock = &self->_expandedThreadsLock;
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_expandedThreads, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v6 != 0;

  os_unfair_lock_unlock(p_expandedThreadsLock);
  return (char)self;
}

- (id)_nextThreadItemIDAfterThreadItemID:(id)a3
{
  -[EMQueryingCollection iterateItemIDsStartingAtItemID:inReverse:withBlock:](self, "iterateItemIDsStartingAtItemID:inReverse:withBlock:", a3, 0, &__block_literal_global_30);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __52__EMMessageList__nextThreadItemIDAfterThreadItemID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)itemIDOfFirstMessageListItemMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  EMQuery *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  EMQuery *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
  -[EMQueryingCollection query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3528]);
  v23[0] = v4;
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:subpredicates:", 1, v9);

  v11 = [EMQuery alloc];
  v12 = objc_opt_class();
  objc_msgSend(v10, "ef_simplifiedPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:queryOptions:label:](v11, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v12, v13, v14, objc_msgSend(v6, "queryOptions"), 0);

  -[EMMessageList repository](self, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionHandlerAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performQuery:limit:completionHandler:", v15, 1, v17);

  objc_msgSend(v5, "future");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "result");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[EMMessageList itemIDOfMessageListItemWithDisplayMessage:](self, "itemIDOfMessageListItemWithDisplayMessage:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)labelForStateCapture
{
  void *v2;
  void *v3;

  -[EMQueryingCollection query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  void *v3;
  void *v4;

  if (a3)
    *a3 = 0;
  -[EMQueryingCollection allItemIDs](self, "allItemIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultIfAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (void)setUnfilteredMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredMessageList, a3);
}

- (NSSet)recentlyCollapsedItemIDs
{
  return self->_recentlyCollapsedItemIDs;
}

- (void)setRecentlyCollapsedItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyCollapsedItemIDs, a3);
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_recentlyCollapsedItemIDs, 0);
  objc_storeStrong((id *)&self->_unfilteredMessageList, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_messageListItemsForRetry, 0);
  objc_storeStrong((id *)&self->_expandedThreads, 0);
}

void __32__EMMessageList_collapseThread___block_invoke_4_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, a4, a3, "Failed to collapse thread %{public}@: %{public}@", (uint8_t *)a3);

}

- (void)messageListItemForItemID:(os_log_t)log ifAvailable:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Attempting to retrieve a messageListItem for a nil itemID from messageList: %{public}@", buf, 0xCu);

}

void __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_109_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, a3, (uint64_t)a3, "Invalid item: %{public}@\n%@", (uint8_t *)&v4);
}

- (void)queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_DEBUG, "<%p> Oldest items updated for mailboxes", (uint8_t *)&v2, 0xCu);
}

@end
