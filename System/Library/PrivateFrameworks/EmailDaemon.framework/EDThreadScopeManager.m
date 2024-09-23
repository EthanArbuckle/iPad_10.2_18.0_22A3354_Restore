@implementation EDThreadScopeManager

- (int64_t)databaseIDForThreadScope:(id)a3
{
  id v4;
  os_unfair_lock_s *p_threadScopesLock;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[EDThreadScopeManager _initializeThreadScopesIfNeeded](self, "_initializeThreadScopesIfNeeded");
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_threadScopes, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "databaseID");
  else
    v8 = *MEMORY[0x1E0D1DC08];

  os_unfair_lock_unlock(p_threadScopesLock);
  return v8;
}

- (void)_initializeThreadScopesIfNeeded
{
  os_unfair_lock_s *p_threadScopesLock;
  NSMutableDictionary *threadScopes;
  id *p_threadScopes;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  p_threadScopes = (id *)&self->_threadScopes;
  threadScopes = self->_threadScopes;
  os_unfair_lock_unlock(p_threadScopesLock);
  if (!threadScopes)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[EDThreadScopeManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__EDThreadScopeManager__initializeThreadScopesIfNeeded__block_invoke;
    v16[3] = &unk_1E94A3280;
    v8 = v6;
    v17 = v8;
    objc_msgSend(v7, "threadScopeManager:populateThreadScopesWithBlock:", self, v16);

    v15 = 0;
    os_unfair_lock_lock(p_threadScopesLock);
    if (*p_threadScopes)
      goto LABEL_9;
    objc_storeStrong((id *)&self->_threadScopes, v6);
    +[EDThreadScopeManager log](EDThreadScopeManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *p_threadScopes;
      *(_DWORD *)buf = 138543362;
      v19 = (unint64_t)v10;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Loaded pre-computed thread scopes: %{public}@", buf, 0xCu);
    }

    v11 = objc_msgSend(*p_threadScopes, "count");
    if (v11 < 6)
    {
LABEL_9:
      v12 = 0;
      v13 = 0;
    }
    else
    {
      -[EDThreadScopeManager _threadScopesWithLastViewedOlderThanLimit](self, "_threadScopesWithLastViewedOlderThanLimit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[EDThreadScopeManager _numberOfThreadScopesToEvictFrom:upTo:](self, "_numberOfThreadScopesToEvictFrom:upTo:", v12, &v15);
      +[EDThreadScopeManager log](EDThreadScopeManager, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v19 = v13;
        v20 = 2048;
        v21 = v15;
        v22 = 2048;
        v23 = v11;
        v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Evicting %lu-%lu thread scopes (after initializing %lu thread scopes) from: %{public}@", buf, 0x2Au);
      }

    }
    os_unfair_lock_unlock(p_threadScopesLock);
    if (objc_msgSend(v12, "count"))
    {
      if (v15)
        -[EDThreadScopeManager _evictAtLeast:upTo:fromThreadScopesWithDatabaseIDs:](self, "_evictAtLeast:upTo:fromThreadScopesWithDatabaseIDs:", v13, v15, v12);
    }

  }
}

- (EDThreadScopeManagerDataSource)dataSource
{
  return (EDThreadScopeManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setLastViewedDate:(id)a3 forThreadScope:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_unfair_lock_s *p_threadScopesLock;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Setting lastViewedDate=%{public}@ for thread scope: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_threadScopes, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastViewedDate:", v6);

  os_unfair_lock_unlock(p_threadScopesLock);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDThreadScopeManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_92 != -1)
    dispatch_once(&log_onceToken_92, block);
  return (OS_os_log *)(id)log_log_92;
}

- (BOOL)isThreadScopePrecomputed:(id)a3 mailboxProvider:(id)a4 shouldMigrate:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[EDThreadScopeManager _initializeThreadScopesIfNeeded](self, "_initializeThreadScopesIfNeeded");
  -[EDThreadScopeManager _threadScopeInfoForThreadScope:](self, "_threadScopeInfoForThreadScope:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    -[EDThreadScopeManager precomputedMailboxScopeForThreadScope:mailboxTypeResolver:foundPredicates:](self, "precomputedMailboxScopeForThreadScope:mailboxTypeResolver:foundPredicates:", v8, v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v12 = v15 != 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = objc_msgSend(v10, "needsUpdate");
  v13 = v12 ^ 1;
  if (a5)
LABEL_3:
    *a5 = v12;
LABEL_4:

  return v13;
}

- (id)_threadScopeInfoForThreadScope:(id)a3
{
  id v4;
  os_unfair_lock_s *p_threadScopesLock;
  void *v6;

  v4 = a3;
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_threadScopes, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_threadScopesLock);

  return v6;
}

void __55__EDThreadScopeManager__initializeThreadScopesIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  _EDThreadScopeInfo *v10;
  id v11;

  v11 = a3;
  v9 = a5;
  v10 = -[_EDThreadScopeInfo initWithDatabaseID:needsUpdate:lastViewedDate:]([_EDThreadScopeInfo alloc], "initWithDatabaseID:needsUpdate:lastViewedDate:", a2, a4, v9);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

}

- (id)threadScopeFromPrecomputedMailboxScope:(id)a3 predicates:(unint64_t)a4 mailboxProvider:(id)a5
{
  char v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  _QWORD v25[2];

  v6 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v6 & 3) == 0)
  {
    if ((v6 & 1) == 0)
    {
      if ((v6 & 2) == 0)
      {
        v11 = 0;
        goto LABEL_18;
      }
      v13 = (uint64_t)v8;
      goto LABEL_15;
    }
    v13 = (uint64_t)v8;
LABEL_9:
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithActiveFollowUpInSent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v23 = 0;
  -[EDThreadScopeManager _mailboxFromPrecomputedMailboxScope:mailboxProvider:mailboxPredicate:](self, "_mailboxFromPrecomputedMailboxScope:mailboxProvider:mailboxPredicate:", v8, v9, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  objc_msgSend(v10, "ef_addOptionalObject:", v12);
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v13 = objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0)
    goto LABEL_11;
  if (!v11)
    goto LABEL_9;
  v14 = (void *)MEMORY[0x1E0D1E248];
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:mailboxTypeResolver:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(v10, "ef_addOptionalObject:", v16);

LABEL_11:
  if ((v6 & 2) != 0)
  {
    if (v11)
    {
      v17 = (void *)MEMORY[0x1E0D1E248];
      v24 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      objc_msgSend(v10, "ef_addOptionalObject:", v19);

      goto LABEL_17;
    }
LABEL_15:
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForFiredReadLaterMessages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_17:
  v8 = (id)v13;
LABEL_18:
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "ef_orCompoundPredicateWithSubpredicates:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E390]), "initWithMailboxScope:filterPredicate:", v8, v20);

  return v21;
}

- (id)_mailboxFromPrecomputedMailboxScope:(id)a3 mailboxProvider:(id)a4 mailboxPredicate:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mailboxObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D1E248];
  if (!v10)
  {
    objc_msgSend(v7, "mailboxTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForMessagesInMailboxWithType:", objc_msgSend(v16, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithObjectID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxForObjectID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v12);
LABEL_4:

  return v13;
}

- (EDThreadScopeManager)initWithDataSource:(id)a3
{
  id v4;
  EDThreadScopeManager *v5;
  EDThreadScopeManager *v6;
  uint64_t v7;
  EFScheduler *evictionScheduler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDThreadScopeManager;
  v5 = -[EDThreadScopeManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_threadScopesLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.EmailDaemon.EDThreadScopeManager.evictionScheduler"));
    v7 = objc_claimAutoreleasedReturnValue();
    evictionScheduler = v6->_evictionScheduler;
    v6->_evictionScheduler = (EFScheduler *)v7;

  }
  return v6;
}

void __27__EDThreadScopeManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_92;
  log_log_92 = (uint64_t)v1;

}

void __48__EDThreadScopeManager_threadScopesByDatabaseID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "databaseID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)threadScopesByDatabaseID
{
  os_unfair_lock_s *p_threadScopesLock;
  void *v4;
  NSMutableDictionary *threadScopes;
  id v6;
  _QWORD v8[4];
  id v9;

  -[EDThreadScopeManager _initializeThreadScopesIfNeeded](self, "_initializeThreadScopesIfNeeded");
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_threadScopes, "count"));
  threadScopes = self->_threadScopes;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EDThreadScopeManager_threadScopesByDatabaseID__block_invoke;
  v8[3] = &unk_1E94A3230;
  v6 = v4;
  v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threadScopes, "enumerateKeysAndObjectsUsingBlock:", v8);

  os_unfair_lock_unlock(p_threadScopesLock);
  return v6;
}

+ (id)mailboxTypesToPrecompute
{
  if (mailboxTypesToPrecompute_onceToken != -1)
    dispatch_once(&mailboxTypesToPrecompute_onceToken, &__block_literal_global_81);
  return (id)mailboxTypesToPrecompute_mailboxTypes;
}

void __48__EDThreadScopeManager_mailboxTypesToPrecompute__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E94E4DD8, &unk_1E94E4DF0, &unk_1E94E4E08, &unk_1E94E4E20, &unk_1E94E4E38, &unk_1E94E4E50, 0);
  v1 = (void *)mailboxTypesToPrecompute_mailboxTypes;
  mailboxTypesToPrecompute_mailboxTypes = v0;

}

- (id)precomputedMailboxScopeForThreadScope:(id)a3 mailboxTypeResolver:(id)a4 foundPredicates:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  id v23;
  int v24;
  void *v25;
  id v26;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "mailboxScope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if ((objc_msgSend(v10, "excludeTypes") & 1) == 0 && !objc_msgSend(v10, "excludeMailboxes"))
    {
      objc_msgSend(v10, "mailboxTypes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailboxScope");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mailboxObjectIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v17, "count");
      if ((unint64_t)(objc_msgSend(v19, "count") + v20) >= 2)
      {
        if (a5)
          *a5 = 0;

        goto LABEL_17;
      }
      objc_msgSend(v17, "anyObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 && -[EDThreadScopeManager _shouldPrecomputeMailboxType:](self, "_shouldPrecomputeMailboxType:", v22))
      {
        if (a5)
          *a5 = 0;
        v23 = v10;
        v24 = 1;
      }
      else
      {
        objc_msgSend(v19, "anyObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25
          && -[EDThreadScopeManager _shouldPrecomputeMailboxWithObjectID:](self, "_shouldPrecomputeMailboxWithObjectID:", v25))
        {
          if (a5)
            *a5 = 0;
          v26 = v10;
          v24 = 1;
        }
        else
        {
          v24 = 0;
        }

      }
      if (v24)
      {
        v15 = v10;
        goto LABEL_18;
      }
    }
LABEL_8:
    if (a5)
    {
      v15 = 0;
      *a5 = 0;
      goto LABEL_18;
    }
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v12)
  {
    +[EDThreadScopeManager log](EDThreadScopeManager, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ef_publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543362;
      *(_QWORD *)&v27[4] = v14;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Thread scope has unsupported filter predicate: %{public}@", v27, 0xCu);

    }
    goto LABEL_8;
  }
  *(_QWORD *)v27 = 0;
  -[EDThreadScopeManager _precomputedMailboxScopeForFilterPredicate:mailboxTypeResolver:foundPredicates:](self, "_precomputedMailboxScopeForFilterPredicate:mailboxTypeResolver:foundPredicates:", v11, v9, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = *(_QWORD *)v27;
  v15 = v16;
  v10 = v15;
LABEL_18:

  return v15;
}

- (id)_precomputedMailboxScopeForFilterPredicate:(id)a3 mailboxTypeResolver:(id)a4 foundPredicates:(unint64_t *)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  id v15;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      v13 = 0;
      v12 = 0;
LABEL_10:
      *a5 = 0;
      goto LABEL_15;
    }
LABEL_14:
    v13 = 0;
    v12 = 0;
    goto LABEL_15;
  }
  v10 = v8;
  if (objc_msgSend(v10, "compoundPredicateType") != 2)
  {
    if (a5)
      *a5 = 0;

    goto LABEL_14;
  }
  v15 = 0;
  v11 = -[EDThreadScopeManager _findPredicateTypeWithCompoundPredicate:mailboxTypeResolver:outMailboxScope:](self, "_findPredicateTypeWithCompoundPredicate:mailboxTypeResolver:outMailboxScope:", v10, v9, &v15);
  v12 = v15;

  if (!v12 || !v11)
  {
    v13 = 0;
    if (!a5)
      goto LABEL_15;
    goto LABEL_10;
  }
  if (a5)
    *a5 = v11;
  v13 = v12;
  v12 = v13;
LABEL_15:

  return v13;
}

- (unint64_t)_findPredicateTypeWithCompoundPredicate:(id)a3 mailboxTypeResolver:(id)a4 outMailboxScope:(id *)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  id *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  objc_msgSend(v18, "subpredicates");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    v17 = a5;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v11
          || (-[EDThreadScopeManager _mailboxScopeFromPredicate:](self, "_mailboxScopeFromPredicate:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          if ((v10 & 1) != 0
            || !objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesWithActiveFollowUp:mailboxTypeResolver:inSent:sentMailboxObjectIDs:", v14, v19, 0, 0))
          {
            if ((v10 & 2) != 0
              || !objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesWithFiredReadLaterDate:accountObjectIDs:", v14, 0))
            {

              a5 = v17;
              goto LABEL_19;
            }
            v10 |= 2uLL;
          }
          else
          {
            v10 |= 1uLL;
          }
        }
        else
        {
          v11 = (void *)v15;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      a5 = v17;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
LABEL_19:
    v10 = 0;
    v11 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v11);

  return v10;
}

- (id)_mailboxScopeFromPredicate:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = -500;
  v5 = objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInMailboxObjectID:mailboxObjectID:", v4, &v13);
  v6 = v13;
  if ((v5 & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D1E248], "isPredicateForMessagesInMailboxWithType:mailboxType:", v4, &v14) & 1) == 0)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[EDThreadScopeManager _shouldPrecomputeMailboxType:](self, "_shouldPrecomputeMailboxType:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D1E1E0], "mailboxScopeForMailboxType:forExclusion:", v14, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (!-[EDThreadScopeManager _shouldPrecomputeMailboxWithObjectID:](self, "_shouldPrecomputeMailboxWithObjectID:", v6))
    goto LABEL_8;
  v7 = (void *)MEMORY[0x1E0D1E1E0];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxScopeForMailboxObjectIDs:forExclusion:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

- (BOOL)_shouldPrecomputeMailboxWithObjectID:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEphemeral") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[EDThreadScopeManager dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "threadScopeManager:isValidMailboxObjectID:", self, v4);

  }
  return v5;
}

- (BOOL)_shouldPrecomputeMailboxType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "mailboxTypesToPrecompute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (NSArray)threadScopes
{
  os_unfair_lock_s *p_threadScopesLock;
  void *v4;

  -[EDThreadScopeManager _initializeThreadScopesIfNeeded](self, "_initializeThreadScopesIfNeeded");
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary allKeys](self->_threadScopes, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_threadScopesLock);
  return (NSArray *)v4;
}

- (void)addThreadScope:(id)a3 withDatabaseID:(int64_t)a4 needsUpdate:(BOOL)a5 lastViewedDate:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _EDThreadScopeInfo *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  _EDThreadScopeInfo *v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  _EDThreadScopeInfo *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = -[_EDThreadScopeInfo initWithDatabaseID:needsUpdate:lastViewedDate:]([_EDThreadScopeInfo alloc], "initWithDatabaseID:needsUpdate:lastViewedDate:", a4, v7, v11);
  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = (unint64_t)v10;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Adding pre-computed thread scope: %{public}@ -> %{public}@", buf, 0x16u);
  }

  v18 = 0;
  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_threadScopes, "setObject:forKeyedSubscript:", v12, v10);
  v14 = -[NSMutableDictionary count](self->_threadScopes, "count");
  if (v14 < 0x10)
  {
    v15 = 0;
    v16 = 0;
  }
  else
  {
    -[EDThreadScopeManager _threadScopesWithLastViewedOlderThanLimit](self, "_threadScopesWithLastViewedOlderThanLimit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[EDThreadScopeManager _numberOfThreadScopesToEvictFrom:upTo:](self, "_numberOfThreadScopesToEvictFrom:upTo:", v15, &v18);
    +[EDThreadScopeManager log](EDThreadScopeManager, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v20 = v16;
      v21 = 2048;
      v22 = v18;
      v23 = 2048;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Evicting %lu-%lu thread scopes (after adding %luth thread scope) from: %{public}@", buf, 0x2Au);
    }

  }
  os_unfair_lock_unlock(&self->_threadScopesLock);
  if (objc_msgSend(v15, "count") && v18)
    -[EDThreadScopeManager _evictAtLeast:upTo:fromThreadScopesWithDatabaseIDs:](self, "_evictAtLeast:upTo:fromThreadScopesWithDatabaseIDs:", v16, v18, v15);

}

- (void)setNeedsUpdate:(BOOL)a3 forThreadScope:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_threadScopesLock;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Setting needsUpdate=%u for thread scope: %{public}@", (uint8_t *)v10, 0x12u);
  }

  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_threadScopes, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsUpdate:", v4);

  os_unfair_lock_unlock(p_threadScopesLock);
}

- (void)removeAllThreadScopes
{
  NSObject *v3;
  NSMutableDictionary *threadScopes;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  uint8_t v7[16];

  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Resetting all pre-computed thread scopes", v7, 2u);
  }

  os_unfair_lock_lock(&self->_threadScopesLock);
  threadScopes = self->_threadScopes;
  if (threadScopes)
  {
    -[NSMutableDictionary removeAllObjects](threadScopes, "removeAllObjects");
  }
  else
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = self->_threadScopes;
    self->_threadScopes = v5;

  }
  os_unfair_lock_unlock(&self->_threadScopesLock);
}

- (void)removeThreadScope:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Resetting pre-computed thread scope: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_lock(&self->_threadScopesLock);
  -[NSMutableDictionary removeObjectForKey:](self->_threadScopes, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_threadScopesLock);

}

- (void)removeThreadScopesForMailboxScope:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *threadScopes;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Resetting pre-computed thread scopes for mailbox scope: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_threadScopesLock);
  threadScopes = self->_threadScopes;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__EDThreadScopeManager_removeThreadScopesForMailboxScope___block_invoke;
  v10[3] = &unk_1E94A3258;
  v7 = v4;
  v11 = v7;
  -[NSMutableDictionary keysOfEntriesPassingTest:](threadScopes, "keysOfEntriesPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectsForKeys:](self->_threadScopes, "removeObjectsForKeys:", v9);
  os_unfair_lock_unlock(&self->_threadScopesLock);

}

uint64_t __58__EDThreadScopeManager_removeThreadScopesForMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "mailboxScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_evictAtLeast:(unint64_t)a3 upTo:(unint64_t)a4 fromThreadScopesWithDatabaseIDs:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a5;
  -[EDThreadScopeManager evictionScheduler](self, "evictionScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke;
  v11[3] = &unk_1E949C610;
  v11[4] = self;
  v10 = v8;
  v12 = v10;
  v13 = a3;
  v14 = a4;
  objc_msgSend(v9, "performBlock:", v11);

}

void __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2;
  v37[3] = &unk_1E94A32A8;
  v37[4] = v3;
  v5 = v26;
  v38 = v5;
  objc_msgSend(v2, "threadScopeManager:gatherStatisticsForThreadScopesWithDatabaseIDs:block:", v3, v4, v37);

  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_26;
  v35[3] = &unk_1E94A32D0;
  v7 = v5;
  v36 = v7;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v27;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
        if ((unint64_t)objc_msgSend(v8, "count") < *(_QWORD *)(a1 + 48))
        {
          objc_msgSend(v8, "addObject:", v13);
          +[EDThreadScopeManager log](EDThreadScopeManager, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            goto LABEL_11;
          *(_DWORD *)buf = 138412290;
          v40 = v13;
          v15 = v14;
          v16 = "Adding %@ for eviction: below min";
          goto LABEL_15;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        if (v19 <= 100.0)
          goto LABEL_17;
        objc_msgSend(v8, "addObject:", v13);
        +[EDThreadScopeManager log](EDThreadScopeManager, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v13;
          v15 = v14;
          v16 = "Adding %@ for eviction: score below threshold";
LABEL_15:
          _os_log_debug_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
        }
LABEL_11:

        if ((unint64_t)objc_msgSend(v8, "count") >= *(_QWORD *)(a1 + 56))
          goto LABEL_17;
        ++v12;
      }
      while (v10 != v12);
      v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      v10 = v20;
    }
    while (v20);
  }
LABEL_17:

  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v8;
    _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to evict thread scopes with database IDs: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(a1 + 32);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_28;
  v28[3] = &unk_1E94A3320;
  v28[4] = v23;
  v24 = v8;
  v29 = v24;
  v25 = v7;
  v30 = v25;
  objc_msgSend(v22, "threadScopeManager:evictThreadScopesWithDatabaseIDs:completionBlock:", v23, v24, v28);

}

void __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  double v8;
  double v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = v8;
  if (v8 <= 0.0)
  {
    v11 = -v8;
  }
  else
  {
    +[EDThreadScopeManager log](EDThreadScopeManager, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 134218498;
      v19 = v9;
      v20 = 2048;
      v21 = a2;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_ERROR, "Last viewed %f seconds in the future for thread scope %lld: %{public}@", (uint8_t *)&v18, 0x20u);
    }

    v11 = 0.0;
  }

  objc_msgSend(*(id *)(a1 + 32), "_evictionScoreForCount:timeInterval:", a4, v11);
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  +[EDThreadScopeManager log](EDThreadScopeManager, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134218752;
    v19 = *(double *)&a2;
    v20 = 2048;
    v21 = v13;
    v22 = 2048;
    v23 = a4;
    v24 = 2048;
    v25 = v11;
    _os_log_debug_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEBUG, "Eviction score for %llu: %f (%llu count, %f time)", (uint8_t *)&v18, 0x2Au);
  }

}

uint64_t __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);

  return v8;
}

void __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_28(uint64_t a1, int a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
    os_unfair_lock_lock(v3);
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2_29;
    v6[3] = &unk_1E94A32F8;
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "ef_removeObjectsPassingTest:", v6);

    os_unfair_lock_unlock(v3);
  }
}

uint64_t __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "databaseID");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((_DWORD)v10)
  {
    +[EDThreadScopeManager log](EDThreadScopeManager, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218498;
      v17 = v7;
      v18 = 2114;
      v19 = v5;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Evicting thread scope with database ID: %llu -> %{public}@ = %{public}@", (uint8_t *)&v16, 0x20u);

    }
  }

  return v10;
}

- (double)_evictionScoreForCount:(unint64_t)a3 timeInterval:(double)a4
{
  return (double)a3 / sqrt(a4 / 604800.0);
}

- (id)_threadScopesWithLastViewedOlderThanLimit
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_threadScopesLock);
  -[NSMutableDictionary ef_filter:](self->_threadScopes, "ef_filter:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __65__EDThreadScopeManager__threadScopesWithLastViewedOlderThanLimit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  _BOOL8 v10;
  int v12;
  double v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastViewedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "databaseID");
  v6 = v4;
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;
  if (v7 <= 0.0)
  {
    v10 = v7 < -604800.0;
  }
  else
  {
    +[EDThreadScopeManager log](EDThreadScopeManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218498;
      v13 = v8;
      v14 = 2048;
      v15 = v5;
      v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_ERROR, "Last viewed %f seconds in the future for thread scope %lld: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    v10 = 0;
  }

  return v10;
}

id __65__EDThreadScopeManager__threadScopesWithLastViewedOlderThanLimit__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "databaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_numberOfThreadScopesToEvictFrom:(id)a3 upTo:(unint64_t *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_threadScopesLock);
  v7 = -[NSMutableDictionary count](self->_threadScopes, "count");
  v8 = v7;
  if (v7 >= 5)
    v9 = v7 - 5;
  else
    v9 = 0;
  v10 = objc_msgSend(v6, "count");
  if (a4)
  {
    if (v10 >= v9)
      v11 = v9;
    else
      v11 = v10;
    *a4 = v11;
  }
  v12 = v8 - 10;
  if (v8 < 0xA)
    v12 = 0;
  if (v10 >= v12)
    v13 = v12;
  else
    v13 = v10;

  return v13;
}

- (EFScheduler)evictionScheduler
{
  return self->_evictionScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictionScheduler, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_threadScopes, 0);
}

@end
