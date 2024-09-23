@implementation MapsSuggestionsBaseImprover

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)improveEntry:(id)a3
{
  id v5;
  BOOL result;

  v5 = a3;
  result = -[MapsSuggestionsBaseImprover doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

+ (BOOL)isEnabled
{
  BOOL result;

  result = objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (uint64_t)improveMyUndecoratedTitle:(void *)a3 forEntry:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      a1 = objc_msgSend(v6, "updateUndecoratedTitle:", v5);
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseImprover.m";
        v12 = 1024;
        v13 = 30;
        v14 = 2082;
        v15 = "-[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]";
        v16 = 2082;
        v17 = "nil == (entry)";
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v10, 0x26u);
      }

      a1 = 0;
    }
  }

  return a1;
}

- (uint64_t)improveMyUndecoratedSubtitle:(void *)a3 forEntry:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      a1 = objc_msgSend(v6, "updateUndecoratedSubtitle:", v5);
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseImprover.m";
        v12 = 1024;
        v13 = 37;
        v14 = 2082;
        v15 = "-[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]";
        v16 = 2082;
        v17 = "nil == (entry)";
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v10, 0x26u);
      }

      a1 = 0;
    }
  }

  return a1;
}

@end
