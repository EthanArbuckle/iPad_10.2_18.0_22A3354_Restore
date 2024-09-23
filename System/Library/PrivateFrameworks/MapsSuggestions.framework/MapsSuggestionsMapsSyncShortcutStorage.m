@implementation MapsSuggestionsMapsSyncShortcutStorage

- (MapsSuggestionsMapsSyncShortcutStorage)init
{
  MapsSuggestionsMapsSyncShortcutStorage *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *callbackQueue;
  uint64_t v6;
  NSArray *storeSubscriptionTypes;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsMapsSyncShortcutStorage;
  v2 = -[MapsSuggestionsMapsSyncShortcutStorage init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MapsSuggestionsMapsSyncShortcutStorage.callbacks", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v6;

    objc_msgSend(MEMORY[0x1E0D473D8], "sharedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subscribe:", v2);

  }
  return v2;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)setChangeHandler:(id)a3
{
  void *v4;
  id changeHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  changeHandler = self->_changeHandler;
  self->_changeHandler = v4;

}

- (BOOL)loadAllShortcutsWithHandler:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BYTE v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a3;
    if (self)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473D0]), "initWithOffset:limit:", 0, 100);
      objc_msgSend(MEMORY[0x1E0D473F0], "queryPredicateWithFormat:argumentArray:", CFSTR("version < 2"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473E8]), "initWithPredicate:sortDescriptors:range:", v7, 0, v6);
      v9 = objc_alloc_init(MEMORY[0x1E0D47370]);
      *(_QWORD *)v11 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v11[8] = 3221225472;
      *(_QWORD *)&v11[16] = __71__MapsSuggestionsMapsSyncShortcutStorage__loadAllShortcutsWithHandler___block_invoke;
      *(_QWORD *)&v11[24] = &unk_1E4BCDE70;
      *(_QWORD *)&v11[32] = v5;
      objc_msgSend(v9, "fetchWithOptions:completionHandler:", v8, v11);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136446978;
      *(_QWORD *)&v11[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 84;
      *(_WORD *)&v11[18] = 2082;
      *(_QWORD *)&v11[20] = "-[MapsSuggestionsMapsSyncShortcutStorage loadAllShortcutsWithHandler:]";
      *(_WORD *)&v11[28] = 2082;
      *(_QWORD *)&v11[30] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", v11, 0x26u);
    }
  }

  return a3 != 0;
}

void __71__MapsSuggestionsMapsSyncShortcutStorage__loadAllShortcutsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MapsSuggestionsShortcut *v14;
  MapsSuggestionsShortcut *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v14 = [MapsSuggestionsShortcut alloc];
        v15 = -[MapsSuggestionsShortcut initWithFavoriteItem:](v14, "initWithFavoriteItem:", v13, (_QWORD)v16);
        if (MapsSuggestionsMapsSyncStorageShouldServeShortcut(v15))
          objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)addOrUpdateShortcuts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *callbackQueue;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  _QWORD block[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 111;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage addOrUpdateShortcuts:handler:]";
      v22 = 2082;
      v23 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 112;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage addOrUpdateShortcuts:handler:]";
      v22 = 2082;
      v23 = "nil == (shortcuts)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MapsSuggestionsMapsSyncShortcutStorage_addOrUpdateShortcuts_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  v10 = 1;
  v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __71__MapsSuggestionsMapsSyncShortcutStorage_addOrUpdateShortcuts_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)removeShortcuts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *callbackQueue;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  _QWORD block[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 124;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage removeShortcuts:handler:]";
      v22 = 2082;
      v23 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 125;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage removeShortcuts:handler:]";
      v22 = 2082;
      v23 = "nil == (shortcuts)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MapsSuggestionsMapsSyncShortcutStorage_removeShortcuts_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  v10 = 1;
  v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __66__MapsSuggestionsMapsSyncShortcutStorage_removeShortcuts_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcut:(id)a3 toIndex:(int64_t)a4 handler:(id)a5
{
  id v6;
  NSObject *callbackQueue;
  id v8;
  _QWORD block[4];
  id v11;

  v6 = a5;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_toIndex_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v11 = v6;
  v8 = v6;
  dispatch_async(callbackQueue, block);

  return 1;
}

uint64_t __71__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_toIndex_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcut:(id)a3 afterShortcut:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *callbackQueue;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  _QWORD block[4];
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    v21 = 1024;
    v22 = 146;
    v23 = 2082;
    v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:afterShortcut:handler:]";
    v25 = 2082;
    v26 = "nil == (handler)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    v21 = 1024;
    v22 = 147;
    v23 = 2082;
    v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:afterShortcut:handler:]";
    v25 = 2082;
    v26 = "nil == (shortcut)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
    goto LABEL_11;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v21 = 1024;
      v22 = 148;
      v23 = 2082;
      v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:afterShortcut:handler:]";
      v25 = 2082;
      v26 = "nil == (other)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_11;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_afterShortcut_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v18 = v10;
  dispatch_async(callbackQueue, block);
  v13 = 1;
  v14 = v18;
LABEL_13:

  return v13;
}

uint64_t __77__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_afterShortcut_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcut:(id)a3 beforeShortcut:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *callbackQueue;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  _QWORD block[4];
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    v21 = 1024;
    v22 = 160;
    v23 = 2082;
    v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:beforeShortcut:handler:]";
    v25 = 2082;
    v26 = "nil == (handler)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
    v21 = 1024;
    v22 = 161;
    v23 = 2082;
    v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:beforeShortcut:handler:]";
    v25 = 2082;
    v26 = "nil == (shortcut)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
    goto LABEL_11;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v21 = 1024;
      v22 = 162;
      v23 = 2082;
      v24 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcut:beforeShortcut:handler:]";
      v25 = 2082;
      v26 = "nil == (other)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_11;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_beforeShortcut_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v18 = v10;
  dispatch_async(callbackQueue, block);
  v13 = 1;
  v14 = v18;
LABEL_13:

  return v13;
}

uint64_t __78__MapsSuggestionsMapsSyncShortcutStorage_moveShortcut_beforeShortcut_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcutToBack:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *callbackQueue;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  _QWORD block[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 174;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToBack:handler:]";
      v22 = 2082;
      v23 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 175;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToBack:handler:]";
      v22 = 2082;
      v23 = "nil == (shortcut)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToBack_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  v10 = 1;
  v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __69__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToBack_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)moveShortcutToFront:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *callbackQueue;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  _QWORD block[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 187;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToFront:handler:]";
      v22 = 2082;
      v23 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncShortcutStorage.m";
      v18 = 1024;
      v19 = 188;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncShortcutStorage moveShortcutToFront:handler:]";
      v22 = 2082;
      v23 = "nil == (shortcut)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToFront_handler___block_invoke;
  block[3] = &unk_1E4BCED88;
  v15 = v7;
  dispatch_async(callbackQueue, block);
  v10 = 1;
  v11 = v15;
LABEL_10:

  return v10;
}

uint64_t __70__MapsSuggestionsMapsSyncShortcutStorage_moveShortcutToFront_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  NSObject *callbackQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  callbackQueue = self->_callbackQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__MapsSuggestionsMapsSyncShortcutStorage_storeDidChangeWithTypes___block_invoke;
  v5[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v6, &location);
  dispatch_async(callbackQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__MapsSuggestionsMapsSyncShortcutStorage_storeDidChangeWithTypes___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 1);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsMapsSyncShortcutStorage.m";
      v7 = 1026;
      v8 = 202;
      v9 = 2082;
      v10 = "-[MapsSuggestionsMapsSyncShortcutStorage storeDidChangeWithTypes:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
