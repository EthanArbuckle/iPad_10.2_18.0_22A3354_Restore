@implementation MapsSuggestionsUserDeletedSuggestionTrigger

- (MapsSuggestionsUserDeletedSuggestionTrigger)initWithNotificationName:(const char *)a3 triggerName:(id)a4
{
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 136446978;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUserDeletedSuggestionTrigger.m";
    v9 = 1024;
    v10 = 20;
    v11 = 2082;
    v12 = "-[MapsSuggestionsUserDeletedSuggestionTrigger initWithNotificationName:triggerName:]";
    v13 = 2082;
    v14 = "YES";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You should call -init", (uint8_t *)&v7, 0x26u);
  }

  return -[MapsSuggestionsUserDeletedSuggestionTrigger init](self, "init");
}

- (MapsSuggestionsUserDeletedSuggestionTrigger)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsUserDeletedSuggestionTrigger;
  return -[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:triggerName:](&v4, sel_initWithNotificationName_triggerName_, "com.apple.maps.userdeleted", a3);
}

@end
