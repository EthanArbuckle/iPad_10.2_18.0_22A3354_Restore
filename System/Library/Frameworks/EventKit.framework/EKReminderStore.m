@implementation EKReminderStore

- (EKReminderStore)initWithEventStore:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  EKReminderStore *v8;
  objc_class *REMStoreClass;
  REMStore *v10;
  REMStore *remStore;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSMutableSet *v15;
  NSMutableSet *newObjectsIDs;
  NSMutableDictionary *v17;
  NSMutableDictionary *updatedObjects;
  NSMutableSet *v19;
  NSMutableSet *objectIDsToCommit;
  NSMutableDictionary *v21;
  NSMutableDictionary *deletedObjects;
  NSMutableArray *v23;
  NSMutableArray *objectsToReset;
  NSMutableDictionary *v25;
  NSMutableDictionary *cachedConstraints;
  void *v27;
  void *v28;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)EKReminderStore;
  v8 = -[EKReminderStore init](&v30, sel_init);
  if (v8)
  {
    REMStoreClass = (objc_class *)getREMStoreClass();
    if (v7)
      v10 = (REMStore *)objc_msgSend([REMStoreClass alloc], "initWithStoreContainerToken:", v7);
    else
      v10 = (REMStore *)objc_alloc_init(REMStoreClass);
    remStore = v8->_remStore;
    v8->_remStore = v10;

    if (!v8->_remStore)
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[EKReminderStore initWithEventStore:token:].cold.1(v12);

    }
    v13 = dispatch_queue_create("com.apple.eventkit.EKReminderStore.queue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    newObjectsIDs = v8->_newObjectsIDs;
    v8->_newObjectsIDs = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updatedObjects = v8->_updatedObjects;
    v8->_updatedObjects = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    objectIDsToCommit = v8->_objectIDsToCommit;
    v8->_objectIDsToCommit = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedObjects = v8->_deletedObjects;
    v8->_deletedObjects = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objectsToReset = v8->_objectsToReset;
    v8->_objectsToReset = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedConstraints = v8->_cachedConstraints;
    v8->_cachedConstraints = v25;

    objc_storeWeak((id *)&v8->_eventStore, v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getREMStoreClass(), "storeDidChangeNotificationName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v8, sel_remindersChanged, v28, 0);

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_remStore, 0);
  objc_storeStrong((id *)&self->queryCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_movedRemindersIDMap, 0);
  objc_storeStrong((id *)&self->_remindersNeedingMove, 0);
  objc_storeStrong((id *)&self->_objectsToReset, 0);
  objc_storeStrong((id *)&self->_deletedObjects, 0);
  objc_storeStrong((id *)&self->_objectIDsToCommit, 0);
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_newObjectsIDs, 0);
  objc_storeStrong((id *)&self->_lists, 0);
  objc_storeStrong((id *)&self->_cachedConstraints, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_11);
  return (OS_os_log *)(id)log_log;
}

void __22__EKReminderStore_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(ekSubSystem, "Reminders");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

- (void)remindersChanged
{
  NSObject *queue;
  id WeakRetained;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EKReminderStore_remindersChanged__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(queue, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(WeakRetained, "reminderStoreChanged");

}

uint64_t __35__EKReminderStore_remindersChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (void)_loadAccountsIfNeeded
{
  if (!self->_sources)
    -[EKReminderStore _loadAccounts](self, "_loadAccounts");
}

- (void)_loadAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching reminder accounts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (NSArray)sources
{
  NSObject *queue;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  EKSource *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EKReminderStore_sources__block_invoke;
  block[3] = &unk_1E47850A0;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(queue, block);
  v4 = (void *)v19[5];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (id)v19[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[EKObject initWithPersistentObject:]([EKSource alloc], "initWithPersistentObject:", v10);
          objc_msgSend(v5, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return (NSArray *)v5;
}

void __26__EKReminderStore_sources__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadAccountsIfNeeded");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)sourceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
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
  -[EKReminderStore sources](self, "sources");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sourceIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)cachedConstraintsForSource:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *queue;
  id v11;
  NSObject *v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  objc_msgSend(v4, "backingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    objc_msgSend(WeakRetained, "reminderSourceForEventSource:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "backingObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v5;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__EKReminderStore_cachedConstraintsForSource___block_invoke;
    block[3] = &unk_1E4785298;
    v15 = v9;
    v16 = &v17;
    block[4] = self;
    dispatch_sync(queue, block);
    v11 = (id)v18[5];

  }
  else
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EKReminderStore cachedConstraintsForSource:].cold.1();

    v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __46__EKReminderStore_cachedConstraintsForSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchAndCacheConstraintsForFrozenSource:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)_fetchAndCacheConstraintsForFrozenSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *cachedConstraints;
  void *v14;
  id v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "remAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EKReminderStore _fetchAndCacheConstraintsForFrozenSource:].cold.1();
    goto LABEL_15;
  }
  objc_msgSend(v4, "remAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[EKReminderStore _fetchAndCacheConstraintsForFrozenSource:].cold.2(v4, v16);

LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  v9 = -[NSObject supportsLocation](v8, "supportsLocation");
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "remAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v4;
    v20 = 2112;
    v21 = v11;
    v22 = 1024;
    v23 = objc_msgSend(v12, "type");
    v24 = 1024;
    v25 = v9;
    _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "Fetching capabilities for source (%@), remAccount (%@), type (%d), supportsLocation (%d)", (uint8_t *)&v18, 0x22u);

  }
  objc_msgSend(v5, "setSupportsReminderLocations:", v9);
  objc_msgSend(v5, "setSupportsAlarmProximity:", v9);
  objc_msgSend(v5, "setSupportsStructuredLocations:", v9);
  objc_msgSend(v5, "setSupportsAttachments:", -[NSObject supportsAttachments](v8, "supportsAttachments"));
  objc_msgSend(v5, "setAllowsEvents:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAllowsCalendarAddDeleteModify:", objc_msgSend(v6, "daAllowsCalendarAddDeleteModify"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSupportsReminderActions:", -[NSObject supportsReminderActions](v8, "supportsReminderActions"));
  cachedConstraints = self->_cachedConstraints;
  objc_msgSend(v4, "sourceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](cachedConstraints, "setObject:forKeyedSubscript:", v5, v14);

  v15 = v5;
LABEL_16:

  return v15;
}

- (BOOL)isSourceManaged:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  id v14;
  char v15;

  v3 = a3;
  objc_msgSend(v3, "backingObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "backingObject");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject remAccount](v6, "remAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v15 = 0;
      v14 = 0;
      v9 = objc_msgSend(v7, "MCIsManagedWithResultPtr:error:", &v15, &v14);
      v10 = v14;
      if ((v9 & 1) != 0)
      {
        v11 = v15 != 0;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[EKReminderStore isSourceManaged:].cold.1();

        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EKReminderStore isSourceManaged:].cold.2();
    v11 = 0;
  }

  return v11;
}

- (void)_loadListsIfNeeded
{
  if (!self->_lists)
    -[EKReminderStore _loadLists](self, "_loadLists");
}

- (void)_loadLists
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching reminder lists: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)_allLists
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__EKReminderStore__allLists__block_invoke;
  v5[3] = &unk_1E47850A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__EKReminderStore__allLists__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadListsIfNeeded");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)calendars
{
  NSObject *queue;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  EKFrozenReminderCalendar *v16;
  id v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  v42 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EKReminderStore_calendars__block_invoke;
  block[3] = &unk_1E47850A0;
  block[4] = self;
  block[5] = &v37;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v38[5], "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = (id)v38[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v5);
        -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
        objc_msgSend(v9, "meltedObjectInStore:", WeakRetained);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v6);
  }

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v12 = self->_queue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __28__EKReminderStore_calendars__block_invoke_3;
  v25[3] = &unk_1E47850A0;
  v25[4] = self;
  v25[5] = &v26;
  dispatch_sync(v12, v25);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)v27[5];
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v43, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(obj);
        v16 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:]([EKFrozenReminderCalendar alloc], "initWithREMObject:inStore:withChanges:", 0, self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15));
        v17 = objc_loadWeakRetained((id *)&self->_eventStore);
        -[EKPersistentObject meltedObjectInStore:](v16, "meltedObjectInStore:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v18);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v43, 16);
    }
    while (v13);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v37, 8);

  return (NSArray *)v4;
}

void __28__EKReminderStore_calendars__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_loadListsIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__EKReminderStore_calendars__block_invoke_2;
  v8[3] = &unk_1E47852C0;
  v8[4] = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

BOOL __28__EKReminderStore_calendars__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

void __28__EKReminderStore_calendars__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v10, "uncommittedChanges");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)calendarWithIdentifier:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[EKReminderStore backingCalendarWithIdentifier:](self, "backingCalendarWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(v4, "meltedObjectInStore:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)backingCalendarWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  EKFrozenReminderCalendar *v8;
  void *v9;
  void *v10;
  REMStore *remStore;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  EKFrozenReminderCalendar *v17;
  _QWORD v19[5];
  id v20;
  __int128 *p_buf;
  id v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v5 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke;
  block[3] = &unk_1E47850C8;
  block[4] = self;
  v7 = v4;
  v24 = v7;
  v25 = &v26;
  dispatch_sync(queue, block);
  v8 = 0;
  if (!*((_BYTE *)v27 + 24))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    if (v9)
    {
      objc_msgSend(getREMListClass_0(), "objectIDWithUUID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      remStore = self->_remStore;
      v22 = 0;
      -[REMStore fetchListWithObjectID:error:](remStore, "fetchListWithObjectID:error:", v10, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v22;
      v14 = v13;
      if (v12)
      {
        -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", v12);
        v8 = (EKFrozenReminderCalendar *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13)
        {
          if (+[EKReminderStore isNotFoundError:](EKReminderStore, "isNotFoundError:", v13))
          {
            +[EKReminderStore log](EKReminderStore, "log");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v7;
              _os_log_impl(&dword_1A2318000, v15, OS_LOG_TYPE_INFO, "No existing reminder list with identifier %@", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            +[EKReminderStore log](EKReminderStore, "log");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[EKReminderStore backingCalendarWithIdentifier:].cold.1();
          }

        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v31 = 0x3032000000;
        v32 = __Block_byref_object_copy__1;
        v33 = __Block_byref_object_dispose__1;
        v34 = 0;
        v16 = self->_queue;
        v19[0] = v5;
        v19[1] = 3221225472;
        v19[2] = __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke_38;
        v19[3] = &unk_1E47850C8;
        v19[4] = self;
        v20 = v7;
        p_buf = &buf;
        dispatch_sync(v16, v19);
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          v17 = [EKFrozenReminderCalendar alloc];
          v8 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](v17, "initWithREMObject:inStore:withChanges:", 0, self, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
        }
        else
        {
          v8 = 0;
        }

        _Block_object_dispose(&buf, 8);
      }

    }
    else
    {
      v8 = 0;
    }

  }
  _Block_object_dispose(&v26, 8);

  return v8;
}

void __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

void __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke_38(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1[4] + 40), "containsObject:", a1[5]))
  {
    objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uncommittedChanges");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)createNewReminderCalendar
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = -[EKFrozenReminderCalendar initNewListInStore:]([EKFrozenReminderCalendar alloc], "initNewListInStore:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(v3, "meltedObjectInStore:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)frozenCalendarFromCalendar:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  NSObject *v7;

  objc_msgSend(a3, "backingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[EKReminderStore frozenCalendarFromCalendar:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
      v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (objc_msgSend(v6, "validate:", a4))
  {
    -[EKReminderStore frozenCalendarFromCalendar:error:](self, "frozenCalendarFromCalendar:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = -[EKReminderStore saveObject:withFrozenObject:error:](self, "saveObject:withFrozenObject:error:", v6, v7, a4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeCalendar:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  char v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  char v19;

  v6 = a3;
  if (objc_msgSend(v6, "_validateDeletable:", a4))
  {
    -[EKReminderStore frozenCalendarFromCalendar:error:](self, "frozenCalendarFromCalendar:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v7 != 0;
    if (v7)
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isNew");
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__EKReminderStore_removeCalendar_error___block_invoke;
      block[3] = &unk_1E47852E8;
      v19 = v11;
      block[4] = self;
      v16 = v10;
      v17 = v8;
      v18 = v6;
      v13 = v10;
      dispatch_sync(queue, block);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __40__EKReminderStore_removeCalendar_error___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "REMObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 56));
}

- (id)defaultCalendarForNewReminders
{
  REMStore *remStore;
  void *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  id v10;

  remStore = self->_remStore;
  v10 = 0;
  -[REMStore fetchDefaultListWithError:](remStore, "fetchDefaultListWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    -[NSObject meltedObjectInStore:](v6, "meltedObjectInStore:", WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EKReminderStore defaultCalendarForNewReminders].cold.1();
    v8 = 0;
  }

  return v8;
}

- (id)reminderWithUniqueId:(id)a3
{
  id v4;
  REMStore *remStore;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  remStore = self->_remStore;
  v14 = 0;
  -[REMStore fetchReminderWithDACalendarItemUniqueIdentifier:inList:error:](remStore, "fetchReminderWithDACalendarItemUniqueIdentifier:inList:error:", v4, 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = v7;
  if (!v6)
  {
    if (v7 && +[EKReminderStore isNotFoundError:](EKReminderStore, "isNotFoundError:", v7))
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1A2318000, v12, OS_LOG_TYPE_INFO, "No reminder found with unique identifier %@", buf, 0xCu);
      }
    }
    else
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[EKReminderStore reminderWithUniqueId:].cold.1();
    }
    v11 = 0;
    goto LABEL_12;
  }
  -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(v9, "meltedObjectInStore:", WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EKReminderStore reminderWithUniqueId:].cold.2();
LABEL_12:

  }
  return v11;
}

- (id)reminderWithIdentifier:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[EKReminderStore backingReminderWithIdentifier:](self, "backingReminderWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(v4, "meltedObjectInStore:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remindersWithExternalIdentifier:(id)a3
{
  id v4;
  REMStore *remStore;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id WeakRetained;
  void *v17;
  NSObject *v18;
  id v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  _QWORD v31[4];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  remStore = self->_remStore;
  v22 = v4;
  v31[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  -[REMStore fetchRemindersWithDACalendarItemUniqueIdentifiers:inList:error:](remStore, "fetchRemindersWithDACalendarItemUniqueIdentifiers:inList:error:", v6, 0, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (v7)
  {
    v9 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "allValues");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v20 = v8;
      v21 = v7;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v20, v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          objc_msgSend(v15, "meltedObjectInStore:", WeakRetained);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v9, "addObject:", v17);
          }
          else
          {
            +[EKReminderStore log](EKReminderStore, "log");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v22;
              _os_log_error_impl(&dword_1A2318000, v18, OS_LOG_TYPE_ERROR, "Unable to create EKReminder from REMReminder for external identifier %@", buf, 0xCu);
            }

          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
      v8 = v20;
      v7 = v21;
    }
  }
  else
  {
    if (v8 && +[EKReminderStore isNotFoundError:](EKReminderStore, "isNotFoundError:", v8))
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v22;
        _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_INFO, "No reminders found with external identifier %@", buf, 0xCu);
      }
    }
    else
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[EKReminderStore remindersWithExternalIdentifier:].cold.1();
    }
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)backingReminderWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  id v7;
  EKFrozenReminderReminder *v8;
  id v9;
  void *v10;
  void *v11;
  REMStore *remStore;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  EKFrozenReminderReminder *v19;
  _QWORD v21[7];
  id v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EKReminderStore_backingReminderWithIdentifier___block_invoke;
  block[3] = &unk_1E4785310;
  v25 = &v27;
  block[4] = self;
  v7 = v4;
  v24 = v7;
  v26 = &v33;
  dispatch_sync(queue, block);
  v8 = 0;
  if (!*((_BYTE *)v34 + 24))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", v28[5]);
    if (v10)
    {
      objc_msgSend(getREMReminderClass_0(), "objectIDWithUUID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      remStore = self->_remStore;
      v22 = 0;
      -[REMStore fetchReminderWithObjectID:error:](remStore, "fetchReminderWithObjectID:error:", v11, &v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;
      v15 = v14;
      if (v13)
      {
        -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", v13);
        v8 = (EKFrozenReminderReminder *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14)
        {
          if (+[EKReminderStore isNotFoundError:](EKReminderStore, "isNotFoundError:", v14))
          {
            +[EKReminderStore log](EKReminderStore, "log");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = v28[5];
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v7;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v17;
              _os_log_impl(&dword_1A2318000, v16, OS_LOG_TYPE_INFO, "No reminder found with identifier %@ (%@)", buf, 0x16u);
            }
          }
          else
          {
            +[EKReminderStore log](EKReminderStore, "log");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[EKReminderStore backingReminderWithIdentifier:].cold.1();
          }

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v38 = __Block_byref_object_copy__1;
        v39 = __Block_byref_object_dispose__1;
        v40 = 0;
        v18 = self->_queue;
        v21[0] = v6;
        v21[1] = 3221225472;
        v21[2] = __49__EKReminderStore_backingReminderWithIdentifier___block_invoke_41;
        v21[3] = &unk_1E4785338;
        v21[4] = self;
        v21[5] = &v27;
        v21[6] = buf;
        dispatch_sync(v18, v21);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          v19 = [EKFrozenReminderReminder alloc];
          v8 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](v19, "initWithREMObject:inStore:withChanges:", 0, self, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        }
        else
        {
          v8 = 0;
        }
        _Block_object_dispose(buf, 8);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v8;
}

void __49__EKReminderStore_backingReminderWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
    objc_storeStrong(v6, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

void __49__EKReminderStore_backingReminderWithIdentifier___block_invoke_41(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1[4] + 40), "containsObject:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)))
  {
    objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uncommittedChanges");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)createNewReminder
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = -[EKFrozenReminderReminder initNewReminderInStore:]([EKFrozenReminderReminder alloc], "initNewReminderInStore:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(v3, "meltedObjectInStore:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)saveReminder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  if (objc_msgSend(v6, "validate:", a4))
  {
    objc_msgSend(v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EKReminderStore saveCalendar:error:](self, "saveCalendar:error:", v7, a4))
    {
      objc_msgSend(v6, "backingObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderStore frozenCalendarFromCalendar:error:](self, "frozenCalendarFromCalendar:error:", v7, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9
         && (objc_msgSend(v6, "forceUpdateFrozenCalendar:", v9), objc_msgSend(v6, "save:", a4))
         && -[EKReminderStore saveObject:withFrozenObject:error:](self, "saveObject:withFrozenObject:error:", v6, v8, a4);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)removeReminder:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  char v19;

  v6 = a3;
  v7 = objc_msgSend(v6, "_validateDeletable:", a4);
  if (v7)
  {
    objc_msgSend(v6, "backingObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isNew");
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__EKReminderStore_removeReminder_error___block_invoke;
    block[3] = &unk_1E47852E8;
    v19 = v10;
    block[4] = self;
    v16 = v9;
    v17 = v8;
    v18 = v6;
    v12 = v8;
    v13 = v9;
    dispatch_sync(queue, block);

  }
  return v7;
}

uint64_t __40__EKReminderStore_removeReminder_error___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "REMObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 56));
}

- (id)resetBackingAlarmWithBackingAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderStore backingReminderWithIdentifier:](self, "backingReminderWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "alarms");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v19 = v6;
      v20 = v5;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uniqueIdentifier", v19, v20, (_QWORD)v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v17 & 1) != 0)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
LABEL_12:
      v6 = v19;
      v5 = v20;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)resetBackingLocationWithBackingLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderStore backingReminderWithIdentifier:](self, "backingReminderWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alarms");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v20 = v6;
      v21 = v5;
      v14 = *(_QWORD *)v23;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "structuredLocation", v20, v21, (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v10);

        if ((v18 & 1) != 0)
          break;

        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v13)
            goto LABEL_4;
          v16 = 0;
          break;
        }
      }
      v6 = v20;
      v5 = v21;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)saveObject:(id)a3 withFrozenObject:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  EKReminderStore *v17;
  id v18;
  char v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isNew");

  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__EKReminderStore_saveObject_withFrozenObject_error___block_invoke;
  v15[3] = &unk_1E4785360;
  v16 = v7;
  v17 = self;
  v19 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v7;
  dispatch_sync(queue, v15);

  return 1;
}

void __53__EKReminderStore_saveObject_withFrozenObject_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "prepareReminderKitObjectForSaveWithUpdatedBackingObjectProvider:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_2;
  if (!objc_msgSend(v2, "count"))
    goto LABEL_29;
  if (*(_BYTE *)(a1 + 56))
LABEL_2:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "cachedMeltedChildIdentifierToParentMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = v3;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v7);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v16, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v18
          || (objc_msgSend(v18, "persistentObject"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_msgSend(v20, "isNew"),
              v20,
              (v21 & 1) == 0))
        {
          if (objc_msgSend((id)objc_opt_class(), "canCommitSelf"))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObject:", v17);
          }
          else
          {
            if (v19)
            {
              objc_msgSend(v19, "uniqueIdentifier");
              v22 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v23)
              {
                objc_msgSend(v19, "backingObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v16, "updateParentToCommitSelf:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "fillInPath:usingParents:", v24, v4);
              objc_msgSend(v19, "setBackingObject:", v24);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObject:", v22);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", v24, v22);

            }
            else
            {
              +[EKReminderStore log](EKReminderStore, "log");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v16;
                _os_log_error_impl(&dword_1A2318000, v22, OS_LOG_TYPE_ERROR, "Object requiring parent to commit has no parent: %@", buf, 0xCu);
              }
            }

          }
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addObject:", *(_QWORD *)(a1 + 32));
  v3 = v25;
LABEL_29:

}

- (void)fillInPath:(id)a3 usingParents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    do
    {
      objc_msgSend(v8, "backingObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remObjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertObject:atIndex:", v10, 0);
      objc_msgSend(v8, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    while (v12);
  }
  objc_msgSend(v13, "setPath:", v6);

}

- (BOOL)commit:(id *)a3
{
  NSObject *queue;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[9];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EKReminderStore_commit___block_invoke;
  block[3] = &unk_1E4785388;
  block[4] = self;
  block[5] = &v36;
  block[6] = &v24;
  block[7] = &v40;
  block[8] = &v30;
  dispatch_sync(queue, block);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)v31[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v46, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "reset");
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v46, 16);
    }
    while (v8);
  }

  if (*((_BYTE *)v37 + 24))
  {
    v11 = (void *)v25[5];
    if (v11)
    {
      objc_msgSend(v11, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_queue;
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __26__EKReminderStore_commit___block_invoke_2;
      v17[3] = &unk_1E47853B0;
      v17[4] = self;
      v18 = v12;
      v14 = v12;
      dispatch_sync(v13, v17);

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v41[5]);
  v15 = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v15;
}

void __26__EKReminderStore_commit___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;

  v2 = a1[7];
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(v2 + 8);
  v16 = *(id *)(v6 + 40);
  obj = v4;
  v7 = objc_msgSend(v5, "_commit:error:", &obj, &v16);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v16);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
  v8 = objc_msgSend(*(id *)(a1[4] + 72), "copy");
  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1[4] + 72), "removeAllObjects");
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v11)
    {
      v12 = *(void **)(a1[4] + 88);
      if (v12)
      {
        objc_msgSend(v12, "addEntriesFromDictionary:");
      }
      else
      {
        v13 = objc_msgSend(v11, "mutableCopy");
        v14 = a1[4];
        v15 = *(void **)(v14 + 88);
        *(_QWORD *)(v14 + 88) = v13;

      }
    }
  }
}

void __26__EKReminderStore_commit___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 88);
    *(_QWORD *)(v2 + 88) = 0;

  }
}

- (BOOL)_commit:(id *)a3 error:(id *)a4
{
  void *v7;
  objc_class *v8;
  void *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSArray *lists;
  void *v23;
  BOOL v24;
  id v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableSet count](self->_objectIDsToCommit, "count")
    && !-[NSMutableDictionary count](self->_deletedObjects, "count"))
  {
    v26 = 1;
    goto LABEL_32;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v7 = (void *)getREMSaveRequestClass_softClass;
  v40 = getREMSaveRequestClass_softClass;
  if (!getREMSaveRequestClass_softClass)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __getREMSaveRequestClass_block_invoke;
    v36[3] = &unk_1E4784C68;
    v36[4] = &v37;
    __getREMSaveRequestClass_block_invoke((uint64_t)v36);
    v7 = (void *)v38[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v37, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithStore:", self->_remStore);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = self->_objectIDsToCommit;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (!v11)
  {
LABEL_13:

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = self->_deletedObjects;
    v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v16);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_deletedObjects, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          getREMListClass_0();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "updateList:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeFromParent");
          }
          else
          {
            getREMReminderClass_0();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_23;
            objc_msgSend(v9, "updateReminder:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeFromList");
          }

LABEL_23:
        }
        v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v17);
    }

    -[NSMutableSet removeAllObjects](self->_objectIDsToCommit, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_deletedObjects, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_newObjectsIDs, "removeAllObjects");
    lists = self->_lists;
    self->_lists = 0;

    if (-[NSMutableArray count](self->_remindersNeedingMove, "count")
      && (-[EKReminderStore _moveRemindersToNewLists:error:](self, "_moveRemindersToNewLists:error:", v9, a4),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = v23 == 0,
          v25 = objc_retainAutorelease(v23),
          *a3 = v25,
          v25,
          v24))
    {
      v26 = 0;
    }
    else
    {
      v26 = objc_msgSend(v9, "saveSynchronouslyWithError:", a4, (_QWORD)v28);
    }

LABEL_32:
    -[NSMutableDictionary removeAllObjects](self->_updatedObjects, "removeAllObjects", (_QWORD)v28);
    return v26;
  }
  v12 = *(_QWORD *)v33;
LABEL_7:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v12)
      objc_enumerationMutation(v10);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_updatedObjects, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_applyChangesToSaveRequest:error:", v9, a4);

    if (!v15)
      break;
    if (v11 == ++v13)
    {
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (!v11)
        goto LABEL_13;
      goto LABEL_7;
    }
  }

  return 0;
}

- (id)_moveRemindersToNewLists:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *remindersNeedingMove;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableArray count](self->_remindersNeedingMove, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_remindersNeedingMove;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "uniqueIdentifier", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "_copyToNewList:error:", v6, a4);
        if (!v15)
        {

          v18 = 0;
          goto LABEL_11;
        }
        v16 = (void *)v15;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }

  remindersNeedingMove = self->_remindersNeedingMove;
  self->_remindersNeedingMove = 0;

  v18 = v7;
LABEL_11:

  return v18;
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__EKReminderStore_reset__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __24__EKReminderStore_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (id)predicateForRemindersInCalendars:(id)a3
{
  id v3;
  EKREMReminderPredicate *v4;

  v3 = a3;
  v4 = -[EKREMReminderPredicate initWithCalendars:]([EKREMReminderPredicate alloc], "initWithCalendars:", v3);

  return v4;
}

- (id)predicateForCalendarStoreForRemindersInCalendars:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[EKREMReminderPredicate initForCalendarStoreWithCalendars:]([EKREMReminderPredicate alloc], "initForCalendarStoreWithCalendars:", v3);

  return v4;
}

- (id)predicateForIncompleteRemindersWithDueDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[EKREMCompletionStateReminderPredicate initForIncompleteRemindersWithDueDateStarting:ending:calendars:]([EKREMCompletionStateReminderPredicate alloc], "initForIncompleteRemindersWithDueDateStarting:ending:calendars:", v9, v8, v7);

  return v10;
}

- (id)predicateForCompletedRemindersWithCompletionDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[EKREMCompletionStateReminderPredicate initForCompletedRemindersWithCompletionDateStarting:ending:calendars:]([EKREMCompletionStateReminderPredicate alloc], "initForCompletedRemindersWithCompletionDateStarting:ending:calendars:", v9, v8, v7);

  return v10;
}

- (void)_checkPredicate:(id)a3
{
  id v3;

  v3 = a3;
  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("predicate is nil"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("predicate is not a reminder predicate created through EKEventStore"));

}

- (id)fetchRemindersMatchingPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  EKReminderFetchRequestToken *v8;
  uint64_t v9;
  NSObject *queue;
  EKReminderFetchRequestToken *v11;
  id v12;
  NSObject *queryQueue;
  EKReminderFetchRequestToken *v14;
  id v15;
  void *v16;
  EKReminderFetchRequestToken *v17;
  _QWORD v19[5];
  EKReminderFetchRequestToken *v20;
  id v21;
  _QWORD block[5];
  EKReminderFetchRequestToken *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[EKReminderStore _checkPredicate:](self, "_checkPredicate:", v6);
  v8 = -[EKReminderFetchRequestToken initWithReminderStore:]([EKReminderFetchRequestToken alloc], "initWithReminderStore:", self);
  v9 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke;
  block[3] = &unk_1E47853D8;
  block[4] = self;
  v11 = v8;
  v23 = v11;
  v24 = v7;
  v12 = v7;
  dispatch_sync(queue, block);
  queryQueue = self->_queryQueue;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke_2;
  v19[3] = &unk_1E4785400;
  v19[4] = self;
  v14 = v11;
  v20 = v14;
  v21 = v6;
  v15 = v6;
  dispatch_async(queryQueue, v19);
  v16 = v21;
  v17 = v14;

  return v17;
}

void __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (!*(_QWORD *)(a1[4] + 104))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 104);
    *(_QWORD *)(v3 + 104) = v2;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.eventkit.reminders.search", v5);
    v7 = a1[4];
    v8 = *(void **)(v7 + 96);
    *(_QWORD *)(v7 + 96) = v6;

  }
  v9 = (id)MEMORY[0x1A85849D4](a1[6]);
  objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKeyedSubscript:", v9, a1[5]);

}

void __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "completionBlockForFetchRequestToken:remove:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "remindersMatchingPredicate:", *(_QWORD *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "completionBlockForFetchRequestToken:remove:", *(_QWORD *)(a1 + 40), 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

  }
}

- (id)completionBlockForFetchRequestToken:(id)a3 remove:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__52;
  v19 = __Block_byref_object_dispose__53;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__EKReminderStore_completionBlockForFetchRequestToken_remove___block_invoke;
  v11[3] = &unk_1E4785428;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (void *)MEMORY[0x1A85849D4](v16[5]);

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __62__EKReminderStore_completionBlockForFetchRequestToken_remove___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)remindersMatchingPredicate:(id)a3
{
  id v4;
  REMStore *remStore;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id WeakRetained;
  void *v13;
  NSObject *queue;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  EKEventStore **p_eventStore;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  char v39;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t *v58;
  _QWORD block[7];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKReminderStore _checkPredicate:](self, "_checkPredicate:", v4);
  v46 = v4;
  -[EKReminderStore _allLists](self, "_allLists");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  remStore = self->_remStore;
  v76 = 0;
  objc_msgSend(v46, "fetchMatchingRemindersInStore:allLists:error:", remStore, v44, &v76);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v76;
  if (v45)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v45, "count"));
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v7 = v45;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v73 != v9)
            objc_enumerationMutation(v7);
          -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          objc_msgSend(v11, "meltedObjectInStore:", WeakRetained);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v8);
    }

    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__1;
    v70 = __Block_byref_object_dispose__1;
    v71 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__1;
    v64 = __Block_byref_object_dispose__1;
    v65 = 0;
    queue = self->_queue;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__EKReminderStore_remindersMatchingPredicate___block_invoke;
    block[3] = &unk_1E4785338;
    block[4] = self;
    block[5] = &v66;
    block[6] = &v60;
    dispatch_sync(queue, block);
    if (objc_msgSend((id)v67[5], "count") || objc_msgSend((id)v61[5], "count"))
    {
      if (v61[5])
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v18 = (void *)MEMORY[0x1E0CB3880];
      v55[0] = v15;
      v55[1] = 3221225472;
      v55[2] = __46__EKReminderStore_remindersMatchingPredicate___block_invoke_2;
      v55[3] = &unk_1E4785450;
      v42 = v16;
      v56 = v42;
      v58 = &v66;
      v41 = v46;
      v57 = v41;
      objc_msgSend(v18, "predicateWithBlock:", v55);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filterUsingPredicate:", v19);

      if (v67[5])
      {
        v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v21 = (void *)objc_msgSend(v20, "initWithCapacity:", objc_msgSend((id)v67[5], "count"));
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v22 = (id)v67[5];
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v52;
          p_eventStore = &self->_eventStore;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v52 != v24)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = objc_loadWeakRetained((id *)p_eventStore);
                objc_msgSend(v27, "meltedObjectInStore:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "addObject:", v29);

              }
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
          }
          while (v23);
        }

        objc_msgSend(v21, "filterUsingPredicate:", v41);
        v30 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v6, "valueForKey:", CFSTR("calendarItemIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setWithArray:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v33 = v21;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v77, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v48;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v48 != v35)
                objc_enumerationMutation(v33);
              v37 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
              objc_msgSend(v37, "calendarItemIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v32, "containsObject:", v38);

              if ((v39 & 1) == 0)
                objc_msgSend(v6, "addObject:", v37);
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v77, 16);
          }
          while (v34);
        }

      }
    }
    _Block_object_dispose(&v60, 8);

    _Block_object_dispose(&v66, 8);
  }
  else
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[EKReminderStore remindersMatchingPredicate:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __46__EKReminderStore_remindersMatchingPredicate___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (objc_msgSend(*(id *)(a1[4] + 48), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 48), "allValues");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[5] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  if (objc_msgSend(*(id *)(a1[4] + 64), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 64), "allKeys");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

uint64_t __46__EKReminderStore_remindersMatchingPredicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_10;
  objc_msgSend(v5, "backingObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

  if ((v8 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
LABEL_10:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      v10 = objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", v5);
    else
      v10 = 1;
  }

  return v10;
}

- (id)frozenObjectForReminderObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    +[EKReminderStore uniqueIdentifierForREMObject:](EKReminderStore, "uniqueIdentifierForREMObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__EKReminderStore_frozenObjectForReminderObject___block_invoke;
    block[3] = &unk_1E4785298;
    v12 = &v13;
    block[4] = self;
    v7 = v5;
    v11 = v7;
    dispatch_sync(queue, block);
    v8 = -[EKReminderStore newFrozenObjectForReminderObject:withChanges:](self, "newFrozenObjectForReminderObject:withChanges:", v4, v14[5]);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __49__EKReminderStore_frozenObjectForReminderObject___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uncommittedChanges");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)frozenAlarmForREMAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *queue;
  id v12;
  EKFrozenReminderAlarm *v13;
  EKFrozenReminderAlarm *v14;
  _QWORD block[4];
  id v17;
  EKReminderStore *v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        +[EKReminderStore uniqueIdentifierForREMObject:](EKReminderStore, "uniqueIdentifierForREMObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v7);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EKReminderStore_frozenAlarmForREMAlarms___block_invoke;
  block[3] = &unk_1E4785118;
  v12 = v5;
  v18 = self;
  v19 = &v24;
  v17 = v12;
  dispatch_sync(queue, block);
  v13 = [EKFrozenReminderAlarm alloc];
  v14 = -[EKFrozenReminderAlarm initWithAlarms:inStore:withChanges:](v13, "initWithAlarms:inStore:withChanges:", v6, self, v25[5]);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __43__EKReminderStore_frozenAlarmForREMAlarms___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6), (_QWORD)v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uncommittedChanges");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)newFrozenObjectForReminderObject:(id)a3 withChanges:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v8 = +[EKReminderStore frozenClassForReminderClass:](EKReminderStore, "frozenClassForReminderClass:", objc_opt_class())) != 0)
  {
    v9 = (void *)objc_msgSend([v8 alloc], "initWithREMObject:inStore:withChanges:", v6, self, v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (Class)frozenClassForReminderClass:(Class)a3
{
  void *v5;
  NSObject *v6;

  if (frozenClassForReminderClass__onceToken != -1)
    dispatch_once(&frozenClassForReminderClass__onceToken, &__block_literal_global_58);
  v5 = (void *)objc_msgSend((id)frozenClassForReminderClass__reminderClassToFrozenClassMap, "objectForKey:", a3);
  if (!v5)
  {
    objc_msgSend(a1, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[EKReminderStore frozenClassForReminderClass:].cold.1(a3);

  }
  return (Class)v5;
}

void __47__EKReminderStore_frozenClassForReminderClass___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 258);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v0, v0, 6);
  v2 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  frozenClassForReminderClass__reminderClassToFrozenClassMap = v1;

  v3 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  v4 = objc_opt_class();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v5 = (void *)getREMAccountClass_softClass;
  v31 = getREMAccountClass_softClass;
  if (!getREMAccountClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getREMAccountClass_block_invoke;
    v26 = &unk_1E4784C68;
    v27 = &v28;
    __getREMAccountClass_block_invoke((uint64_t)&v23);
    v5 = (void *)v29[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v3, "setObject:forKey:", v4, objc_opt_class());
  v7 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  v8 = objc_opt_class();
  getREMListClass_0();
  objc_msgSend(v7, "setObject:forKey:", v8, objc_opt_class());
  v9 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  v10 = objc_opt_class();
  getREMReminderClass_0();
  objc_msgSend(v9, "setObject:forKey:", v10, objc_opt_class());
  v11 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  v12 = objc_opt_class();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v13 = (void *)getREMAlarmClass_softClass;
  v31 = getREMAlarmClass_softClass;
  if (!getREMAlarmClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getREMAlarmClass_block_invoke;
    v26 = &unk_1E4784C68;
    v27 = &v28;
    __getREMAlarmClass_block_invoke((uint64_t)&v23);
    v13 = (void *)v29[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v11, "setObject:forKey:", v12, objc_opt_class());
  v15 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  v16 = objc_opt_class();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v17 = (void *)getREMRecurrenceRuleClass_softClass;
  v31 = getREMRecurrenceRuleClass_softClass;
  if (!getREMRecurrenceRuleClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getREMRecurrenceRuleClass_block_invoke;
    v26 = &unk_1E4784C68;
    v27 = &v28;
    __getREMRecurrenceRuleClass_block_invoke((uint64_t)&v23);
    v17 = (void *)v29[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v15, "setObject:forKey:", v16, objc_opt_class());
  v19 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  v20 = objc_opt_class();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v21 = (void *)getREMStructuredLocationClass_softClass;
  v31 = getREMStructuredLocationClass_softClass;
  if (!getREMStructuredLocationClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getREMStructuredLocationClass_block_invoke;
    v26 = &unk_1E4784C68;
    v27 = &v28;
    __getREMStructuredLocationClass_block_invoke((uint64_t)&v23);
    v21 = (void *)v29[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v19, "setObject:forKey:", v20, objc_opt_class());

}

- (void)_reminderCopiedToNewList:(id)a3
{
  NSMutableArray *remindersNeedingMove;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  remindersNeedingMove = self->_remindersNeedingMove;
  if (!remindersNeedingMove)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_remindersNeedingMove;
    self->_remindersNeedingMove = v5;

    remindersNeedingMove = self->_remindersNeedingMove;
  }
  -[NSMutableArray addObject:](remindersNeedingMove, "addObject:", v7);

}

- (id)existingUpdatedObject:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_updatedObjects, "objectForKeyedSubscript:", a3);
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "frozenClassForReminderClass:", objc_opt_class());
  if (v5)
  {
    objc_msgSend(v5, "uniqueIdentifierForREMObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isNotFoundError:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v5 = (_QWORD *)getREMErrorDomainSymbolLoc_ptr;
  v12 = getREMErrorDomainSymbolLoc_ptr;
  if (!getREMErrorDomainSymbolLoc_ptr)
  {
    v6 = (void *)ReminderKitLibrary_1();
    v5 = dlsym(v6, "REMErrorDomain");
    v10[3] = (uint64_t)v5;
    getREMErrorDomainSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v9, 8);
  if (!v5)
    +[EKReminderStore isNotFoundError:].cold.1();
  if (objc_msgSend(v4, "isEqualToString:", *v5, v9))
    v7 = objc_msgSend(v3, "code") == -3000;
  else
    v7 = 0;

  return v7;
}

- (REMStore)remStore
{
  return self->_remStore;
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (void)initWithEventStore:(os_log_t)log token:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Unable to create reminder store. Reminder data will be unavailable.", v1, 2u);
}

- (void)cachedConstraintsForSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Source (%@) is an event source without a reminder source; can't get reminder constraints for it.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_fetchAndCacheConstraintsForFrozenSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Got a nil remAccount when fetching constraints for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_fetchAndCacheConstraintsForFrozenSource:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "remAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "remAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 1024;
  v11 = objc_msgSend(v5, "type");
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Got a nil capabilities when fetching constraints for %@ (remAccount = %@, type = %d)", (uint8_t *)&v6, 0x1Cu);

}

- (void)isSourceManaged:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A2318000, v1, OS_LOG_TYPE_ERROR, "Failed to check whether REMAccount (%@) is managed: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)isSourceManaged:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Tried to call isSourceManaged: on the reminder store for a non-reminder source: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)backingCalendarWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching calendar by identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)frozenCalendarFromCalendar:error:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_2(&dword_1A2318000, v2, v3, "calendar being saved should have an EKFrozenReminderCalendar backing class, but instead has a backing object of type %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)defaultCalendarForNewReminders
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "defaultCalendarForNewReminders is nil: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)reminderWithUniqueId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching reminder by uniqueId identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)reminderWithUniqueId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Unable to create EKReminder from REMReminder for unique identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)remindersWithExternalIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching reminders by external identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)backingReminderWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching reminder by identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)remindersMatchingPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Error fetching reminders: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)frozenClassForReminderClass:(objc_class *)a1 .cold.1(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_2(&dword_1A2318000, v2, v3, "Class has no known frozen version: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)isNotFoundError:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSErrorDomain getREMErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 48, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
