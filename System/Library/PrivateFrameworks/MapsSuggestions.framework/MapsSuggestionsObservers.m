@implementation MapsSuggestionsObservers

- (MapsSuggestionsObservers)initWithCallbackQueue:(id)a3 name:(id)a4 strong:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  MapsSuggestionsObservers *v11;
  uint64_t v12;
  NSString *name;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *innerQueue;
  NSString *v16;
  NSString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSHashTable *innerObservers;
  MapsSuggestionsObservers *v22;
  NSObject *v23;
  objc_super v25;
  _BYTE buf[18];
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 30;
      v27 = 2082;
      v28 = "-[MapsSuggestionsObservers initWithCallbackQueue:name:strong:]";
      v29 = 2082;
      v30 = "nil == (callbackQueue)";
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a queue!", buf, 0x26u);
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 31;
      v27 = 2082;
      v28 = "-[MapsSuggestionsObservers initWithCallbackQueue:name:strong:]";
      v29 = 2082;
      v30 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name!", buf, 0x26u);
    }
LABEL_14:

    v22 = 0;
    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsObservers;
  v11 = -[MapsSuggestionsObservers init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    MSg::Queue::Queue((NSObject **)buf, v8);
    v14 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v11->_callbackQueue._innerQueue;
    v11->_callbackQueue._innerQueue = v14;

    v16 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    v17 = v11->_callbackQueue._name;
    v11->_callbackQueue._name = v16;

    v18 = objc_alloc(MEMORY[0x1E0CB3690]);
    if (v5)
      v19 = 512;
    else
      v19 = 517;
    v20 = objc_msgSend(v18, "initWithOptions:capacity:", v19, 1);
    innerObservers = v11->_innerObservers;
    v11->_innerObservers = (NSHashTable *)v20;

  }
  self = v11;
  v22 = self;
LABEL_15:

  return v22;
}

- (MapsSuggestionsObservers)initWithCallbackQueue:(id)a3 name:(id)a4
{
  return -[MapsSuggestionsObservers initWithCallbackQueue:name:strong:](self, "initWithCallbackQueue:name:strong:", a3, a4, 0);
}

- (MapsSuggestionsObservers)initWithName:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  MapsSuggestionsObservers *v9;

  v4 = a3;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("Queue"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create(v6, v7);

  v9 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](self, "initWithCallbackQueue:name:", v8, v4);
  return v9;
}

- (MapsSuggestionsObservers)init
{
  void *v3;
  MapsSuggestionsObservers *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MapsSuggestionsObservers initWithName:](self, "initWithName:", v3);

  return v4;
}

- (id)_synchronizedSnapshot
{
  id *v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1A859CDD8]();
    v3 = v1[4];
    objc_sync_enter(v3);
    objc_msgSend(v1[4], "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id *)objc_msgSend(v4, "copy");

    objc_sync_exit(v3);
    objc_autoreleasePoolPop(v2);
  }
  return v1;
}

- (void)registerObserver:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSString *name;
  NSHashTable *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSString *v17;
  int v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  char v22;
  id location;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, a3);
  v6 = a4;
  v7 = (void *)MEMORY[0x1A859CDD8]();
  v8 = objc_loadWeakRetained(&location);
  if (v8)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412546;
      v25 = (char *)name;
      v26 = 2112;
      *(_QWORD *)v27 = v8;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{%@}registerObserver:%@", buf, 0x16u);
    }

    v11 = self->_innerObservers;
    objc_sync_enter(v11);
    v12 = -[MapsSuggestionsObservers count](self, "count");
    -[NSHashTable addObject:](self->_innerObservers, "addObject:", v8);
    v13 = -[MapsSuggestionsObservers count](self, "count");
    if (v12)
      v14 = 1;
    else
      v14 = v13 == 0;
    v15 = !v14;
    objc_sync_exit(v11);

    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_name;
      if (v15)
        v18 = 89;
      else
        v18 = 78;
      *(_DWORD *)buf = 138412546;
      v25 = (char *)v17;
      v26 = 1024;
      *(_DWORD *)v27 = v18;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "{%@}isFirstObserver=%c", buf, 0x12u);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__MapsSuggestionsObservers_registerObserver_handler___block_invoke;
    v20[3] = &unk_1E4BCE7D0;
    v21 = v6;
    v22 = v15;
    MSg::Queue::syncIfDifferent((NSObject **)&self->_callbackQueue, v20);
    v19 = v21;
  }
  else
  {
    GEOFindOrCreateLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "MapsSuggestionsObservers.mm";
      v26 = 1026;
      *(_DWORD *)v27 = 80;
      v27[2] = 2082;
      *(_QWORD *)&v27[3] = "-[MapsSuggestionsObservers registerObserver:handler:]";
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongObserver went away in %{public}s", buf, 0x1Cu);
    }

  }
  objc_autoreleasePoolPop(v7);

  objc_destroyWeak(&location);
}

uint64_t __53__MapsSuggestionsObservers_registerObserver_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)unregisterObserver:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSString *name;
  NSHashTable *v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  NSString *v18;
  int v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  char v23;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A859CDD8]();
  v9 = v6;
  if (v9)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412546;
      v25 = (char *)name;
      v26 = 2112;
      *(_QWORD *)v27 = v9;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{%@}unregisterObserver:%@", buf, 0x16u);
    }

    v12 = self->_innerObservers;
    objc_sync_enter(v12);
    v13 = -[MapsSuggestionsObservers count](self, "count");
    -[NSHashTable removeObject:](self->_innerObservers, "removeObject:", v9);
    v14 = -[MapsSuggestionsObservers count](self, "count");
    if (v13)
      v15 = v14 == 0;
    else
      v15 = 0;
    v16 = v15;
    objc_sync_exit(v12);

    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = self->_name;
      if (v16)
        v19 = 89;
      else
        v19 = 78;
      *(_DWORD *)buf = 138412546;
      v25 = (char *)v18;
      v26 = 1024;
      *(_DWORD *)v27 = v19;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{%@}wasLastObserver=%c", buf, 0x12u);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __55__MapsSuggestionsObservers_unregisterObserver_handler___block_invoke;
    v21[3] = &unk_1E4BCE7D0;
    v22 = v7;
    v23 = v16;
    MSg::Queue::syncIfDifferent((NSObject **)&self->_callbackQueue, v21);
    v20 = v22;
  }
  else
  {
    GEOFindOrCreateLog();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "MapsSuggestionsObservers.mm";
      v26 = 1026;
      *(_DWORD *)v27 = 102;
      v27[2] = 2082;
      *(_QWORD *)&v27[3] = "-[MapsSuggestionsObservers unregisterObserver:handler:]";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongObserver went away in %{public}s", buf, 0x1Cu);
    }

  }
  objc_autoreleasePoolPop(v8);

}

uint64_t __55__MapsSuggestionsObservers_unregisterObserver_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (unint64_t)count
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x1A859CDD8](self, a2);
  -[MapsSuggestionsObservers _synchronizedSnapshot]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)callBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *name;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  MapsSuggestionsObservers *v11;
  _QWORD *v12;
  MapsSuggestionsObservers *v13;
  NSObject *innerQueue;
  NSObject *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE buf[40];
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = name;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@}enumerateWithBlock", buf, 0xCu);
      }

    }
    v7 = (void *)MEMORY[0x1A859CDD8]();
    -[MapsSuggestionsObservers _synchronizedSnapshot]((id *)&self->super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__MapsSuggestionsObservers_callBlock___block_invoke;
    v18[3] = &unk_1E4BD0610;
    v19 = v8;
    v20 = v4;
    v10 = v8;
    v11 = self;
    v12 = v18;
    if (v11)
    {
      v13 = v11;
      innerQueue = v11->_callbackQueue._innerQueue;
      *(_QWORD *)buf = v9;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZNK3MSg5Queue5asyncI24MapsSuggestionsObserversEEvPT_U13block_pointerFvS4_E_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E4BCE138;
      *(_QWORD *)&buf[32] = v13;
      v22 = v12;
      dispatch_async(innerQueue, buf);

      v15 = *(NSObject **)&buf[32];
    }
    else
    {
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 208;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsObservers]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (callerSelf)";
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
      }
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 132;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsObservers callBlock:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (block)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block", buf, 0x26u);
    }

  }
  return v4 != 0;
}

void __38__MapsSuggestionsObservers_callBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v9 = v10[1];
            *(_DWORD *)buf = 138412546;
            v16 = v9;
            v17 = 2112;
            v18 = v7;
            _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{%@}enumerateWithBlock[%@]", buf, 0x16u);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v4);
  }

}

- (BOOL)synchronouslyCallBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *name;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412290;
        v12 = (const char *)name;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@}synchronouslyEnumerateWithBlock", buf, 0xCu);
      }

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MapsSuggestionsObservers_synchronouslyCallBlock___block_invoke;
    v9[3] = &unk_1E4BCE138;
    v9[4] = self;
    v10 = v4;
    dispatch_sync((dispatch_queue_t)self->_callbackQueue._innerQueue, v9);

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsObservers.mm";
      v13 = 1024;
      v14 = 150;
      v15 = 2082;
      v16 = "-[MapsSuggestionsObservers synchronouslyCallBlock:]";
      v17 = 2082;
      v18 = "nil == (block)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block", buf, 0x26u);
    }

  }
  return v4 != 0;
}

void __51__MapsSuggestionsObservers_synchronouslyCallBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *context;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A859CDD8]();
  -[MapsSuggestionsObservers _synchronizedSnapshot](*(id **)(a1 + 32));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v5);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            v16 = 2112;
            v17 = v6;
            _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{%@}synchronouslyEnumerateWithBlock[%@]", buf, 0x16u);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    }
    while (v3);
  }

  objc_autoreleasePoolPop(context);
}

- (NSString)uniqueName
{
  return self->_name;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1A859CDD8](self, a2);
  -[MapsSuggestionsObservers _synchronizedSnapshot]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsObservers;
  -[MapsSuggestionsObservers description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ %u observers"), v6, objc_msgSend(v4, "count"));

  objc_autoreleasePoolPop(v3);
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerObservers, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
