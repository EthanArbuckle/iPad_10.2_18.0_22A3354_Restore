@implementation EDMailboxProvider

_BYTE *__41__EDMailboxProvider__mailboxInvalidated___block_invoke(uint64_t a1)
{
  int v2;
  _BYTE *result;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isDeferringInvalidation");
  result = *(_BYTE **)(a1 + 32);
  if (!v2)
    return (_BYTE *)objc_msgSend(result, "_invalidateCache");
  if (!result[12])
  {
    _ef_log_EDMailboxProvider();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "_needsToInvalidate = YES", v5, 2u);
    }

    result = *(_BYTE **)(a1 + 32);
  }
  result[12] = 1;
  return result;
}

- (BOOL)_isDeferringInvalidation
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_deferringInvalidationCount);
  return v2 > 0;
}

- (void)_mailboxInvalidated:(id)a3
{
  NSObject *mailboxCacheQueue;
  _QWORD block[5];

  mailboxCacheQueue = self->_mailboxCacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EDMailboxProvider__mailboxInvalidated___block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_async(mailboxCacheQueue, block);
}

void __33__EDMailboxProvider_allMailboxes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "allMailboxCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_populateCache");
    objc_msgSend(*(id *)(a1 + 32), "allMailboxCache");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "objectIDToLegacyMailboxMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_populateCache");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke_2;
  v7[3] = &unk_1E949CC60;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "ef_compactMap:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectIDToLegacyMailboxMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "legacyMailboxToMailboxMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "legacyMailboxToMailboxMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_populateCache");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke_2;
  v7[3] = &unk_1E949CC10;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "ef_compactMap:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_invalidateCache
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_mailboxCacheQueue);
  -[EDMailboxProvider legacyMailboxToMailboxMap](self, "legacyMailboxToMailboxMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[EDMailboxProvider objectIDToLegacyMailboxMap](self, "objectIDToLegacyMailboxMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[EDMailboxProvider allMailboxCache](self, "allMailboxCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  -[EDMailboxProvider setLegacyMailboxToMailboxMap:](self, "setLegacyMailboxToMailboxMap:", 0);
  -[EDMailboxProvider setObjectIDToLegacyMailboxMap:](self, "setObjectIDToLegacyMailboxMap:", 0);
  -[EDMailboxProvider setAllMailboxCache:](self, "setAllMailboxCache:", 0);
  self->_needsToInvalidate = 0;
  if (v4)
  {
    _ef_log_EDMailboxProvider();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "_invalidateCache invalidated", buf, 2u);
    }

  }
  -[EDMailboxProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v4;
  else
    v9 = 0;
  if (v9)
  {
    -[EDMailboxProvider observerScheduler](self, "observerScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__EDMailboxProvider__invalidateCache__block_invoke;
    v11[3] = &unk_1E949AEB8;
    v12 = v8;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

- (NSMapTable)legacyMailboxToMailboxMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (NSMapTable)objectIDToLegacyMailboxMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)allMailboxCache
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setObjectIDToLegacyMailboxMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setLegacyMailboxToMailboxMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setAllMailboxCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (EDMailboxProviderDelegate)delegate
{
  return (EDMailboxProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)fetchMailboxes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__EDMailboxProvider_fetchMailboxes__block_invoke;
  v2[3] = &unk_1E949CBE8;
  v2[4] = self;
  -[EDMailboxProvider enumerateAccountsWithBlock:](self, "enumerateAccountsWithBlock:", v2);
}

- (void)_populateCache
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  EDMailboxProvider *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[EDMailboxProvider beginDeferringInvalidation](self, "beginDeferringInvalidation");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __35__EDMailboxProvider__populateCache__block_invoke;
  v15 = &unk_1E949CBC0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  v7 = v5;
  v18 = v7;
  v8 = v3;
  v19 = v8;
  -[EDMailboxProvider enumerateAccountsWithBlock:](self, "enumerateAccountsWithBlock:", &v12);
  -[EDMailboxProvider setLegacyMailboxToMailboxMap:](self, "setLegacyMailboxToMailboxMap:", v6, v12, v13, v14, v15, v16);
  -[EDMailboxProvider setObjectIDToLegacyMailboxMap:](self, "setObjectIDToLegacyMailboxMap:", v7);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[EDMailboxProvider setAllMailboxCache:](self, "setAllMailboxCache:", v9);

  -[EDMailboxProvider endDeferringInvalidation](self, "endDeferringInvalidation");
  _ef_log_EDMailboxProvider();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134217984;
    v21 = v11;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "populated cache: %lu", buf, 0xCu);
  }

}

- (void)endDeferringInvalidation
{
  int *p_deferringInvalidationCount;
  unsigned int v3;
  unsigned int v4;
  NSObject *mailboxCacheQueue;
  _QWORD block[5];

  p_deferringInvalidationCount = &self->_deferringInvalidationCount;
  do
  {
    v3 = __ldaxr((unsigned int *)p_deferringInvalidationCount);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, (unsigned int *)p_deferringInvalidationCount));
  if (!v4)
  {
    mailboxCacheQueue = self->_mailboxCacheQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__EDMailboxProvider_endDeferringInvalidation__block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_async(mailboxCacheQueue, block);
  }
}

- (void)beginDeferringInvalidation
{
  int *p_deferringInvalidationCount;
  unsigned int v3;

  p_deferringInvalidationCount = &self->_deferringInvalidationCount;
  do
    v3 = __ldaxr((unsigned int *)p_deferringInvalidationCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_deferringInvalidationCount));
}

- (void)enumerateAccountsWithBlock:(id)a3
{
  void (**v4)(id, void *);
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountsProvider);
  objc_msgSend(WeakRetained, "mailAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActive", (_QWORD)v12))
          v4[2](v4, v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __35__EDMailboxProvider__populateCache__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1D824B334]();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "rootMailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transformMailbox:legacyMailboxToMailboxMap:objectIDToLegacyMailboxMap:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v7);
  objc_autoreleasePoolPop(v4);
}

uint64_t __35__EDMailboxProvider_fetchMailboxes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMailboxesForAccount:", a2);
}

- (id)allMailboxes
{
  NSObject *mailboxCacheQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  mailboxCacheQueue = self->_mailboxCacheQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__EDMailboxProvider_allMailboxes__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mailboxCacheQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

_BYTE *__45__EDMailboxProvider_endDeferringInvalidation__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[12])
    return (_BYTE *)objc_msgSend(result, "_invalidateCache");
  return result;
}

- (void)_didChangeMailboxList:(id)a3
{
  -[EDMailboxProvider _mailboxInvalidated:](self, "_mailboxInvalidated:", 0);
}

- (void)invalidateMailboxes
{
  -[EDMailboxProvider _mailboxInvalidated:](self, "_mailboxInvalidated:", 0);
}

- (id)mailboxObjectIDsForMailboxType:(int64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EDMailboxProvider allMailboxes](self, "allMailboxes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == a3)
        {
          objc_msgSend(v10, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)mailboxForObjectID:(id)a3
{
  void *v4;
  void *v5;

  -[EDMailboxProvider legacyMailboxForObjectID:](self, "legacyMailboxForObjectID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[EDMailboxProvider mailboxFromLegacyMailbox:](self, "mailboxFromLegacyMailbox:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)legacyMailboxForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMailboxProvider legacyMailboxesForObjectIDs:](self, "legacyMailboxesForObjectIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)legacyMailboxesForObjectIDs:(id)a3
{
  id v4;
  NSObject *mailboxCacheQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  mailboxCacheQueue = self->_mailboxCacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke;
  block[3] = &unk_1E949CC38;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mailboxCacheQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)mailboxFromLegacyMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMailboxProvider mailboxesFromLegacyMailboxes:](self, "mailboxesFromLegacyMailboxes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)mailboxesFromLegacyMailboxes:(id)a3
{
  id v4;
  NSObject *mailboxCacheQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  mailboxCacheQueue = self->_mailboxCacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke;
  block[3] = &unk_1E949CC38;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mailboxCacheQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (EDMailboxProvider)initWithAccountsProvider:(id)a3
{
  id v4;
  EDMailboxProvider *v5;
  EDMailboxProvider *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *mailboxCacheQueue;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  EFScheduler *observerScheduler;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EDMailboxProvider;
  v5 = -[EDMailboxProvider init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accountsProvider, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.mail.EDMailboxProviderQueue", v7);
    mailboxCacheQueue = v6->_mailboxCacheQueue;
    v6->_mailboxCacheQueue = (OS_dispatch_queue *)v8;

    v10 = (void *)MEMORY[0x1E0D1F070];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialDispatchQueueSchedulerWithName:qualityOfService:", v12, 17);
    v13 = objc_claimAutoreleasedReturnValue();
    observerScheduler = v6->_observerScheduler;
    v6->_observerScheduler = (EFScheduler *)v13;

  }
  return v6;
}

void ___ef_log_EDMailboxProvider_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDMailboxProvider");
  v1 = (void *)_ef_log_EDMailboxProvider_log;
  _ef_log_EDMailboxProvider_log = (uint64_t)v0;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMailboxProvider.m"), 43, CFSTR("%s can only be called from unit tests"), "-[EDMailboxProvider test_tearDown]");

  }
  dispatch_sync((dispatch_queue_t)self->_mailboxCacheQueue, &__block_literal_global_8);
  -[EDMailboxProvider observerScheduler](self, "observerScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_9);

}

- (id)_transformMailbox:(id)a3 legacyMailboxToMailboxMap:(id)a4 objectIDToLegacyMailboxMap:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EDMailboxProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxProvider _transformMailbox:legacyMailboxToMailboxMap:objectIDToLegacyMailboxMap:]", "EDMailboxProvider.m", 104, "0");
}

- (void)_fetchMailboxesForAccount:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMailboxProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMailboxProvider _fetchMailboxesForAccount:]", "EDMailboxProvider.m", 114, "0");
}

uint64_t __37__EDMailboxProvider__invalidateCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mailboxListInvalidated");
}

- (NSSet)allMailboxObjectIDs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[EDMailboxProvider allMailboxes](self, "allMailboxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return (NSSet *)v6;
}

- (int64_t)mailboxTypeForMailboxObjectID:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[EDMailboxProvider mailboxForObjectID:](self, "mailboxForObjectID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "type");
  else
    v5 = -500;

  return v5;
}

- (EDAccountsProvider)accountsProvider
{
  return (EDAccountsProvider *)objc_loadWeakRetained((id *)&self->_accountsProvider);
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_accountsProvider, a3);
}

- (OS_dispatch_queue)mailboxCacheQueue
{
  return self->_mailboxCacheQueue;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (void)setObserverScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_observerScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_mailboxCacheQueue, 0);
  objc_storeStrong((id *)&self->_allMailboxCache, 0);
  objc_storeStrong((id *)&self->_objectIDToLegacyMailboxMap, 0);
  objc_storeStrong((id *)&self->_legacyMailboxToMailboxMap, 0);
  objc_destroyWeak((id *)&self->_accountsProvider);
  objc_destroyWeak((id *)&self->delegate);
}

@end
