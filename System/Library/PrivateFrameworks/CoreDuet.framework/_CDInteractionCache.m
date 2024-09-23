@implementation _CDInteractionCache

- (_CDInteractionCache)initWithInteractionStore:(id)a3 size:(unint64_t)a4 queryPredicate:(id)a5 filterBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id *v14;
  id *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  dispatch_queue_t v19;
  id v20;
  dispatch_source_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = -[_CDInteractionCache _init](self, "_init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a3);
    v15[9] = (id)a4;
    v15[4] = (id)vcvtas_u32_f32((float)a4 * 0.65);
    objc_storeStrong(v15 + 10, a5);
    v16 = MEMORY[0x193FEEAF4](v13);
    v17 = v15[11];
    v15[11] = (id)v16;

    *((_BYTE *)v15 + 56) = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.coreduetd.cdinteractioncache.queue", v18);
    v20 = v15[1];
    v15[1] = v19;

    v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, (dispatch_queue_t)v15[1]);
    v22 = v15[2];
    v15[2] = v21;

    objc_initWeak(&location, v15);
    dispatch_source_set_timer((dispatch_source_t)v15[2], 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    v23 = v15[2];
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __80___CDInteractionCache_initWithInteractionStore_size_queryPredicate_filterBlock___block_invoke;
    v30 = &unk_1E26E2C60;
    objc_copyWeak(&v31, &location);
    dispatch_source_set_event_handler(v23, &v27);
    dispatch_activate((dispatch_object_t)v15[2]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v27, v28, v29, v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v15, sel_interactionsRecorded_, CFSTR("_CDInteractionStoreRecordedInteractionsNotification"), 0);
    objc_msgSend(v24, "addObserver:selector:name:object:", v15, sel_interactionsDeleted_, CFSTR("_CDInteractionStoreDeletedInteractionsNotification"), 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v15, sel_debounceRefetch, CFSTR("_CDInteractionStoreDeleteAllInteractionsNotification"), 0);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return (_CDInteractionCache *)v15;
}

- (id)initForTesting
{
  return -[_CDInteractionCache initForTestingWithSize:](self, "initForTestingWithSize:", 500);
}

- (id)initForTestingWithSize:(unint64_t)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = -[_CDInteractionCache _init](self, "_init");
  v5 = v4;
  if (v4)
  {
    v4[9] = a3;
    v4[4] = 0;
    v6 = objc_opt_new();
    v7 = (void *)v5[3];
    v5[3] = v6;

    *((_BYTE *)v5 + 56) = 0;
  }
  return v5;
}

- (id)_init
{
  _CDInteractionCache *v2;
  uint64_t v3;
  NSMutableDictionary *mostRecentInteractionsByTaxonomyAndIdentifier;
  uint64_t v5;
  NSCountedSet *conversationCandidates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CDInteractionCache;
  v2 = -[_CDInteractionCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mostRecentInteractionsByTaxonomyAndIdentifier = v2->_mostRecentInteractionsByTaxonomyAndIdentifier;
    v2->_mostRecentInteractionsByTaxonomyAndIdentifier = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    conversationCandidates = v2->_conversationCandidates;
    v2->_conversationCandidates = (NSCountedSet *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)uniqueConversationCandidates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_CDInteractionCache _refetch](self, "_refetch");
  v4 = (void *)-[NSCountedSet copy](self->_conversationCandidates, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)containsUniqueCacheCandidate:(id)a3
{
  _CDInteractionCache *v3;
  os_unfair_lock_s *p_lock;
  id v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[_CDInteractionCache _refetch](v3, "_refetch");
  LOBYTE(v3) = -[NSCountedSet containsObject:](v3->_conversationCandidates, "containsObject:", v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (void)debounceRefetch
{
  os_unfair_lock_s *p_lock;
  dispatch_time_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_CDInteractionCache _invalidate](self, "_invalidate");
  dispatch_suspend((dispatch_object_t)self->_timer);
  v4 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_timer);
  os_unfair_lock_unlock(p_lock);
}

- (void)_invalidate
{
  NSMutableArray *mutableInteractions;

  self->_needsRefetch = 1;
  mutableInteractions = self->_mutableInteractions;
  self->_mutableInteractions = 0;

  -[NSMutableDictionary removeAllObjects](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "removeAllObjects");
  -[NSCountedSet removeAllObjects](self->_conversationCandidates, "removeAllObjects");
}

- (void)_refetch
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *mutableInteractions;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  os_activity_scope_state_s *p_state;
  os_activity_scope_state_s state;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_needsRefetch)
  {
    self->_needsRefetch = 0;
    v3 = _os_activity_create(&dword_18DDBE000, "Duet: CDInteractionCache refetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    os_activity_scope_leave(&state);

    -[NSCountedSet removeAllObjects](self->_conversationCandidates, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "removeAllObjects");
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_DEFAULT, "CDInteractionCache: Refetching interactions", (uint8_t *)&state, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_refetch__pasOnceToken6 != -1)
      dispatch_once(&_refetch__pasOnceToken6, &__block_literal_global_152);
    v6 = (id)_refetch__pasExprOnceResult;
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31___CDInteractionCache__refetch__block_invoke_154;
    block[3] = &unk_1E26E2CA8;
    p_state = &state;
    block[4] = self;
    v7 = v5;
    v22 = v7;
    dispatch_sync(v6, block);
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(state.opaque[1] + 40), "count");
      *(_DWORD *)buf = 134217984;
      v31 = v9;
      _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "Re-fetched interaction cache with %tu interactions", buf, 0xCu);
    }

    v10 = (NSMutableArray *)objc_msgSend(*(id *)(state.opaque[1] + 40), "mutableCopy");
    mutableInteractions = self->_mutableInteractions;
    self->_mutableInteractions = v10;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = *(id *)(state.opaque[1] + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[_CDInteractionCache _countConversationIDsForInteraction:deleted:](self, "_countConversationIDsForInteraction:deleted:", v16, 0, (_QWORD)v17);
          -[_CDInteractionCache _updateMostRecentInteractionsWithInteraction:deleted:](self, "_updateMostRecentInteractionsWithInteraction:deleted:", v16, 0);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      }
      while (v13);
    }

    _Block_object_dispose(&state, 8);
  }
}

- (void)_forceRefetch
{
  -[_CDInteractionCache _invalidate](self, "_invalidate");
  -[_CDInteractionCache _refetch](self, "_refetch");
}

- (void)_countConversationIDsForInteraction:(id)a3 deleted:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _CDCacheCandidate *v15;
  NSCountedSet *conversationCandidates;
  NSObject *v17;

  v6 = a3;
  objc_msgSend(v6, "domainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "derivedIntentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "bundleId");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v6, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteraction generateConversationIdFromInteractionRecipients:](_CDInteraction, "generateConversationIdFromInteractionRecipients:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15 = -[_CDCacheCandidate initWithDomainId:derivedIntentId:bundleId:recipientsId:]([_CDCacheCandidate alloc], "initWithDomainId:derivedIntentId:bundleId:recipientsId:", v7, v8, v12, v14);
    conversationCandidates = self->_conversationCandidates;
    if (a4)
      -[NSCountedSet removeObject:](conversationCandidates, "removeObject:", v15);
    else
      -[NSCountedSet addObject:](conversationCandidates, "addObject:", v15);

  }
  else
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[_CDInteractionCache _countConversationIDsForInteraction:deleted:].cold.1(v17);

  }
}

- (void)_updateMostRecentInteractionsWithInteraction:(id)a3 deleted:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v6 = a3;
  +[_CDCandidateInteractionTaxonomy taxonomyOfInteraction:]((uint64_t)_CDCandidateInteractionTaxonomy, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_4;
  if (!a4)
  {
    v8 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "setObject:forKeyedSubscript:", v8, v7);
LABEL_4:
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76___CDInteractionCache__updateMostRecentInteractionsWithInteraction_deleted___block_invoke;
    v14[3] = &unk_1E26E2CD0;
    v15 = v8;
    v17 = a4;
    v9 = v6;
    v16 = v9;
    v10 = v8;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x193FEEAF4](v14);
    objc_msgSend(v9, "domainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v12);

    objc_msgSend(v9, "derivedIntentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v13);

  }
}

- (id)mostRecentInteractionForCandidateIdentifier:(id)a3 direction:(int64_t)a4 mechanism:(int64_t)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_CDInteractionCache _refetch](self, "_refetch");
  +[_CDCandidateInteractionTaxonomy taxonomyWithDirection:mechanism:]((uint64_t)_CDCandidateInteractionTaxonomy, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isUncachedSentinel");

  if (v13)
    -[_CDInteractionCache _rebuildMostRecentInteractions](self, "_rebuildMostRecentInteractions");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interactionIfCached");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (id)mostRecentInteractionForCandidateIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = 0;
  for (i = 0; i != 4; ++i)
  {
    v7 = (void *)MEMORY[0x193FEE914]();
    -[_CDInteractionCache mostRecentInteractionForCandidateIdentifier:direction:](self, "mostRecentInteractionForCandidateIdentifier:direction:", v4, i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (_CDStartDateCompare(v5, v8) == -1)
      {
        v10 = v9;

        v5 = v10;
      }
    }
    else
    {
      v5 = v8;
    }

    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

- (id)mostRecentInteractionForCandidateIdentifier:(id)a3 direction:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = 0;
  for (i = 0; i != 21; ++i)
  {
    v9 = (void *)MEMORY[0x193FEE914]();
    -[_CDInteractionCache mostRecentInteractionForCandidateIdentifier:direction:mechanism:](self, "mostRecentInteractionForCandidateIdentifier:direction:mechanism:", v6, a4, i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (_CDStartDateCompare(v7, v10) == -1)
      {
        v12 = v11;

        v7 = v12;
      }
    }
    else
    {
      v7 = v10;
    }

    objc_autoreleasePoolPop(v9);
  }

  return v7;
}

- (void)_rebuildMostRecentInteractions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_mostRecentInteractionsByTaxonomyAndIdentifier, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_mutableInteractions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x193FEE914](v4);
        -[_CDInteractionCache _updateMostRecentInteractionsWithInteraction:deleted:](self, "_updateMostRecentInteractionsWithInteraction:deleted:", v8, 0, (_QWORD)v10);
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
    }
    while (v4);
  }

}

- (void)interactionsRecorded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "CDInteractionCache: New recorded interactions", v8, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_needsRefetch)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_CDInteractionsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      -[_CDInteractionCache _cacheInteractions:](self, "_cacheInteractions:", v7);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)interactionsDeleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "CDInteractionCache: New deleted interactions", v8, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_needsRefetch)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_CDInteractionsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      -[_CDInteractionCache _deleteInteractions:](self, "_deleteInteractions:", v7);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_cacheInteractions:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD);
  int v15;
  uint64_t v16;
  void *v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  unint64_t v24;
  void *v25;
  __int128 v26;
  id obj;
  NSObject *oslog;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  oslog = objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138740227;
    v26 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x193FEE914]();
        -[_CDInteractionCache filterBlock](self, "filterBlock");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12
          || (v13 = (void *)v12,
              -[_CDInteractionCache filterBlock](self, "filterBlock"),
              v14 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
              v15 = ((uint64_t (**)(_QWORD, void *))v14)[2](v14, v10),
              v14,
              v13,
              v15))
        {
          v16 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_mutableInteractions, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, -[NSMutableArray count](self->_mutableInteractions, "count", v26), 1024, &__block_literal_global);
          if (v16 == -[NSMutableArray count](self->_mutableInteractions, "count")
            || (-[NSMutableArray objectAtIndexedSubscript:](self->_mutableInteractions, "objectAtIndexedSubscript:", v16), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v17, "isEqual:", v10), v17, (v18 & 1) == 0))
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v34 = v10;
              v35 = 2048;
              v36 = v16;
              _os_log_debug_impl(&dword_18DDBE000, oslog, OS_LOG_TYPE_DEBUG, "Caching interaction %{sensitive}@ to index %tu", buf, 0x16u);
            }
            -[NSMutableArray insertObject:atIndex:](self->_mutableInteractions, "insertObject:atIndex:", v10, v16);
            -[_CDInteractionCache _countConversationIDsForInteraction:deleted:](self, "_countConversationIDsForInteraction:deleted:", v10, 0);
            -[_CDInteractionCache _updateMostRecentInteractionsWithInteraction:deleted:](self, "_updateMostRecentInteractionsWithInteraction:deleted:", v10, 0);
          }
        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v7);
  }

  v19 = -[NSMutableArray count](self->_mutableInteractions, "count");
  if (v19 > -[_CDInteractionCache size](self, "size"))
  {
    v20 = -[_CDInteractionCache size](self, "size");
    v21 = -[NSMutableArray count](self->_mutableInteractions, "count");
    v22 = v21 - -[_CDInteractionCache size](self, "size");
    if (v22)
    {
      v24 = 0;
      *(_QWORD *)&v23 = 138740227;
      v26 = v23;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_mutableInteractions, "objectAtIndexedSubscript:", v20 + v24, v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          v34 = v25;
          v35 = 2048;
          v36 = v20 + v24;
          _os_log_debug_impl(&dword_18DDBE000, oslog, OS_LOG_TYPE_DEBUG, "Will truncate interaction %{sensitive}@ at index %tu", buf, 0x16u);
        }
        -[_CDInteractionCache _handleInteractionRemoval:](self, "_handleInteractionRemoval:", v25);

        ++v24;
      }
      while (v20 <= v24 + v20 && v24 < v22);
    }
    -[NSMutableArray removeObjectsInRange:](self->_mutableInteractions, "removeObjectsInRange:", v20, v22, v26);
  }

}

- (void)_deleteInteractions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t (**v15)(_QWORD, _QWORD);
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  NSObject *oslog;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  oslog = objc_claimAutoreleasedReturnValue();
  v20 = -[NSMutableArray count](self->_mutableInteractions, "count");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138740227;
    v19 = v7;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x193FEE914]();
        -[_CDInteractionCache filterBlock](self, "filterBlock");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13
          || (v14 = (void *)v13,
              -[_CDInteractionCache filterBlock](self, "filterBlock"),
              v15 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
              v16 = v15[2](v15, v11),
              v15,
              v14,
              v16))
        {
          v17 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_mutableInteractions, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, -[NSMutableArray count](self->_mutableInteractions, "count", v19), 256, &__block_literal_global);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v18 = v17;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              v27 = v11;
              v28 = 2048;
              v29 = v18;
              _os_log_debug_impl(&dword_18DDBE000, oslog, OS_LOG_TYPE_DEBUG, "Deleting interaction %{sensitive}@ at index %tu", buf, 0x16u);
            }
            -[NSMutableArray removeObjectAtIndex:](self->_mutableInteractions, "removeObjectAtIndex:", v18);
            -[_CDInteractionCache _handleInteractionRemoval:](self, "_handleInteractionRemoval:", v11);
            if (v20 >= self->_minCacheSize
              && -[NSMutableArray count](self->_mutableInteractions, "count") < self->_minCacheSize)
            {
              -[_CDInteractionCache _forceRefetch](self, "_forceRefetch");
              objc_autoreleasePoolPop(v12);
              goto LABEL_17;
            }
          }
        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_17:

}

- (void)_handleInteractionRemoval:(id)a3
{
  id v4;

  v4 = a3;
  -[_CDInteractionCache _countConversationIDsForInteraction:deleted:](self, "_countConversationIDsForInteraction:deleted:", v4, 1);
  -[_CDInteractionCache _updateMostRecentInteractionsWithInteraction:deleted:](self, "_updateMostRecentInteractionsWithInteraction:deleted:", v4, 1);

}

- (NSArray)interactions
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  NSArray *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_CDInteractionCache _refetch](self, "_refetch");
  v4 = (void *)-[NSMutableArray copy](self->_mutableInteractions, "copy");
  os_unfair_lock_unlock(p_lock);
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_mostRecentInteractionsByTaxonomyAndIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationCandidates, 0);
  objc_storeStrong((id *)&self->_mutableInteractions, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_countConversationIDsForInteraction:(os_log_t)log deleted:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18DDBE000, log, OS_LOG_TYPE_FAULT, "Tried to add interaction without domainIdentifier, derivedIntentIdentifier, or bundle id", v1, 2u);
}

@end
