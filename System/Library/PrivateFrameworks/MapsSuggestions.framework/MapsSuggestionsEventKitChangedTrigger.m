@implementation MapsSuggestionsEventKitChangedTrigger

- (MapsSuggestionsEventKitChangedTrigger)initWithEventKit:(id)a3
{
  id v5;
  MapsSuggestionsEventKitChangedTrigger *v6;
  MapsSuggestionsEventKitChangedTrigger *v7;
  MapsSuggestionsEventKitChangedTrigger *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsEventKitChangedTrigger;
    v6 = -[MapsSuggestionsBaseTrigger initWithName:](&v11, sel_initWithName_, CFSTR("MapsSuggestionsEventKitChangedTrigger"));
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_eventKit, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/Resources/MapsSuggestionsEventKitChangedTrigger.m";
      v14 = 1024;
      v15 = 26;
      v16 = 2082;
      v17 = "-[MapsSuggestionsEventKitChangedTrigger initWithEventKit:]";
      v18 = 2082;
      v19 = "nil == (eventKit)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one EventKit", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)didAddFirstObserver
{
  -[MapsSuggestionsEventKit registerObserver:](self->_eventKit, "registerObserver:", self);
}

- (void)didRemoveLastObserver
{
  -[MapsSuggestionsEventKit unregisterObserver:](self->_eventKit, "unregisterObserver:", self);
}

- (void)eventKitDidChange:(id)a3
{
  MapsSuggestionsEventKit *eventKit;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  eventKit = self->_eventKit;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (eventKit == a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Detected change in EventKit", (uint8_t *)&v8, 2u);
    }

    -[MapsSuggestionsBaseTrigger triggerMyObservers](self, "triggerMyObservers");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/Resources/MapsSuggestionsEventKitChangedTrigger.m";
      v10 = 1024;
      v11 = 53;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEventKitChangedTrigger eventKitDidChange:]";
      v14 = 2082;
      v15 = "eventKit != _eventKit";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Received change for the wrong EventKit?!", (uint8_t *)&v8, 0x26u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventKit, 0);
}

@end
