@implementation MapsSuggestionsRoutineShortcutSuggestor

- (MapsSuggestionsRoutineShortcutSuggestor)initWithRoutine:(id)a3
{
  id v5;
  MapsSuggestionsRoutineShortcutSuggestor *v6;
  MapsSuggestionsRoutineShortcutSuggestor *v7;
  MapsSuggestionsRoutineShortcutSuggestor *v8;
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
    v11.super_class = (Class)MapsSuggestionsRoutineShortcutSuggestor;
    v6 = -[MapsSuggestionsRoutineShortcutSuggestor init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_routine, a3);
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
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      v14 = 1024;
      v15 = 31;
      v16 = 2082;
      v17 = "-[MapsSuggestionsRoutineShortcutSuggestor initWithRoutine:]";
      v18 = 2082;
      v19 = "nil == (routine)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an instance of MapsSuggestionsRoutine.", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MapsSuggestionsRoutineShortcutSuggestor *v8;
  NSObject *v9;
  int v11;
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
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      v13 = 1024;
      v14 = 42;
      v15 = 2082;
      v16 = "-[MapsSuggestionsRoutineShortcutSuggestor initFromResourceDepot:]";
      v17 = 2082;
      v18 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v11, 0x26u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "oneRoutine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      v13 = 1024;
      v14 = 43;
      v15 = 2082;
      v16 = "-[MapsSuggestionsRoutineShortcutSuggestor initFromResourceDepot:]";
      v17 = 2082;
      v18 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Routine!", (uint8_t *)&v11, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "oneRoutine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsRoutineShortcutSuggestor initWithRoutine:](self, "initWithRoutine:", v7);

  v8 = self;
LABEL_10:

  return v8;
}

- (char)suggestShortcutsOfType:(int64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  MapsSuggestionsRoutine *routine;
  uint64_t v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsShortcutType(a3);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "suggestShortcutsOfType:%@", (uint8_t *)&v15, 0xCu);

    }
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      routine = self->_routine;
      if (qword_1ED22F128 != -1)
        dispatch_once(&qword_1ED22F128, &__block_literal_global_34);
      v10 = _MergedGlobals_47;
      if (qword_1ED22F138 != -1)
        dispatch_once(&qword_1ED22F138, &__block_literal_global_171_0);
      v11 = -[MapsSuggestionsRoutine fetchSuggestedShortcutsForType:minVisits:maxAge:handler:](routine, "fetchSuggestedShortcutsForType:minVisits:maxAge:handler:", a3, v10, v6, *(double *)&qword_1ED22F130);
    }
    else
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "Siri Suggestions for Maps disabled", (uint8_t *)&v15, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
      v11 = 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      v17 = 1024;
      v18 = 71;
      v19 = 2082;
      v20 = "-[MapsSuggestionsRoutineShortcutSuggestor suggestShortcutsOfType:handler:]";
      v21 = 2082;
      v22 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", (uint8_t *)&v15, 0x26u);
    }

    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routine, 0);
}

@end
