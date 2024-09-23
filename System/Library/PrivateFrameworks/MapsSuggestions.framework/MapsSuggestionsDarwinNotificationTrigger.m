@implementation MapsSuggestionsDarwinNotificationTrigger

- (MapsSuggestionsDarwinNotificationTrigger)initWithNotificationName:(const char *)a3 triggerName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  MapsSuggestionsDarwinNotificationTrigger *v9;
  uint64_t v10;
  NSString *notificationName;
  MapsSuggestionsDarwinNotificationTrigger *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!a3)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDarwinNotificationTrigger.m";
      v19 = 1024;
      v20 = 31;
      v21 = 2082;
      v22 = "-[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:triggerName:]";
      v23 = 2082;
      v24 = "nil == (notificationName)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a notification name";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDarwinNotificationTrigger.m";
      v19 = 1024;
      v20 = 32;
      v21 = 2082;
      v22 = "-[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:triggerName:]";
      v23 = 2082;
      v24 = "nil == (triggerName)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger name";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MapsSuggestionsDarwinNotificationTrigger{%s}"), a3);
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsDarwinNotificationTrigger;
  v9 = -[MapsSuggestionsBaseTrigger initWithName:](&v16, sel_initWithName_, v8);

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
    notificationName = v9->_notificationName;
    v9->_notificationName = (NSString *)v10;

    v9->_notificationToken = 0;
  }
  self = v9;
  v12 = self;
LABEL_12:

  return v12;
}

- (MapsSuggestionsDarwinNotificationTrigger)initWithNotificationName:(const char *)a3
{
  void *v5;
  MapsSuggestionsDarwinNotificationTrigger *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MapsSuggestionsDarwinNotificationTrigger{%s}"), a3);
  v6 = -[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:triggerName:](self, "initWithNotificationName:triggerName:", a3, v5);

  return v6;
}

- (void)dealloc
{
  int notificationToken;
  objc_super v4;

  notificationToken = self->_notificationToken;
  if (notificationToken)
  {
    notify_cancel(notificationToken);
    self->_notificationToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsDarwinNotificationTrigger;
  -[MapsSuggestionsDarwinNotificationTrigger dealloc](&v4, sel_dealloc);
}

- (MapsSuggestionsDarwinNotificationTrigger)initWithName:(id)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136446978;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDarwinNotificationTrigger.m";
    v8 = 1024;
    v9 = 60;
    v10 = 2082;
    v11 = "-[MapsSuggestionsDarwinNotificationTrigger initWithName:]";
    v12 = 2082;
    v13 = "YES";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You should use -initWithNotificationName: instead.", (uint8_t *)&v6, 0x26u);
  }

  return 0;
}

- (id)notificationName
{
  return self->_notificationName;
}

- (void)didAddFirstObserver
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = -[NSString UTF8String](self->_notificationName, "UTF8String");
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MapsSuggestionsDarwinNotificationTrigger_didAddFirstObserver__block_invoke;
  v6[3] = &unk_1E4BD0270;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v4, &self->_notificationToken, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__MapsSuggestionsDarwinNotificationTrigger_didAddFirstObserver__block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  _BYTE v11[10];
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = WeakRetained[4];
      v10 = 138412546;
      *(_QWORD *)v11 = v6;
      *(_WORD *)&v11[8] = 1024;
      v12 = a2;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Received Darwin notification '%@' (%d)", (uint8_t *)&v10, 0x12u);
    }

    if (*((_DWORD *)WeakRetained + 10) != a2)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *((_DWORD *)WeakRetained + 10);
        v10 = 67109376;
        *(_DWORD *)v11 = v8;
        *(_WORD *)&v11[4] = 1024;
        *(_DWORD *)&v11[6] = a2;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "It may not have been for us: %d != %d, continuing", (uint8_t *)&v10, 0xEu);
      }

    }
    objc_msgSend(WeakRetained, "triggerMyObservers");
  }
  else
  {
    v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      *(_QWORD *)v11 = "MapsSuggestionsDarwinNotificationTrigger.m";
      *(_WORD *)&v11[8] = 1026;
      v12 = 74;
      v13 = 2082;
      v14 = "-[MapsSuggestionsDarwinNotificationTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)didRemoveLastObserver
{
  NSObject *v3;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  notify_cancel(self->_notificationToken);
  self->_notificationToken = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
