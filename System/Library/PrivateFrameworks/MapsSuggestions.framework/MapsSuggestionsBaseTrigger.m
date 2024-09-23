@implementation MapsSuggestionsBaseTrigger

- (MapsSuggestionsBaseTrigger)initWithName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  MapsSuggestionsBaseTrigger *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = objc_retainAutorelease((id)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("%@Queue"), v5));
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create(v7, v8);
  v10 = -[MapsSuggestionsBaseTrigger initWithName:queue:](self, "initWithName:queue:", v5, v9);

  return v10;
}

- (MapsSuggestionsBaseTrigger)initWithName:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsBaseTrigger *v8;
  uint64_t v9;
  NSString *name;
  MapsSuggestionsObservers *v11;
  OS_dispatch_queue *queue;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MapsSuggestionsObservers *observers;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MapsSuggestionsBaseTrigger;
  v8 = -[MapsSuggestionsBaseTrigger init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = [MapsSuggestionsObservers alloc];
    queue = v8->_queue;
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MapsSuggestionsBaseTrigger uniqueName](v8, "uniqueName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@Observers"), v14);
    v16 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v11, "initWithCallbackQueue:name:", queue, v15);
    observers = v8->_observers;
    v8->_observers = (MapsSuggestionsObservers *)v16;

  }
  return v8;
}

- (NSString)description
{
  return (NSString *)NSStringFromMapsSuggestionsJSON(self, 0);
}

- (id)dispatchQueue
{
  return self->_queue;
}

- (BOOL)hasObservers
{
  return -[MapsSuggestionsObservers count](self->_observers, "count") != 0;
}

- (void)triggerMyObservers
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsObservers *observers;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseTrigger uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "FIRING %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__MapsSuggestionsBaseTrigger_triggerMyObservers__block_invoke;
  v6[3] = &unk_1E4BD1180;
  objc_copyWeak(&v7, (id *)buf);
  -[MapsSuggestionsObservers callBlock:](observers, "callBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __48__MapsSuggestionsBaseTrigger_triggerMyObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "triggerFired:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsTrigger.m";
      v8 = 1026;
      v9 = 66;
      v10 = 2082;
      v11 = "-[MapsSuggestionsBaseTrigger triggerMyObservers]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)didAddFirstObserver
{
  -[MapsSuggestionsBaseTrigger doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (void)didRemoveLastObserver
{
  -[MapsSuggestionsBaseTrigger doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (void)registerObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *observers;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MapsSuggestionsBaseTrigger_registerObserver___block_invoke;
  v6[3] = &unk_1E4BCEB28;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers registerObserver:handler:](observers, "registerObserver:handler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __47__MapsSuggestionsBaseTrigger_registerObserver___block_invoke(uint64_t a1, int a2)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
        v5 = (char *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "First observer added for %@", (uint8_t *)&v7, 0xCu);

      }
      dispatch_assert_queue_V2(WeakRetained[1]);
      -[dispatch_queue_t didAddFirstObserver](WeakRetained, "didAddFirstObserver");
    }
    else
    {
      v6 = v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "MapsSuggestionsTrigger.m";
        v9 = 1026;
        v10 = 83;
        v11 = 2082;
        v12 = "-[MapsSuggestionsBaseTrigger registerObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
      }

    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  MapsSuggestionsObservers *observers;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MapsSuggestionsBaseTrigger_unregisterObserver___block_invoke;
  v6[3] = &unk_1E4BCEB28;
  objc_copyWeak(&v7, &location);
  -[MapsSuggestionsObservers unregisterObserver:handler:](observers, "unregisterObserver:handler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__MapsSuggestionsBaseTrigger_unregisterObserver___block_invoke(uint64_t a1, int a2)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
        v5 = (char *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Last observer removed for %@", (uint8_t *)&v7, 0xCu);

      }
      dispatch_assert_queue_V2(WeakRetained[1]);
      -[dispatch_queue_t didRemoveLastObserver](WeakRetained, "didRemoveLastObserver");
    }
    else
    {
      v6 = v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "MapsSuggestionsTrigger.m";
        v9 = 1026;
        v10 = 96;
        v11 = 2082;
        v12 = "-[MapsSuggestionsBaseTrigger unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
      }

    }
  }
}

- (NSString)uniqueName
{
  return self->_name;
}

- (id)objectForJSON
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
