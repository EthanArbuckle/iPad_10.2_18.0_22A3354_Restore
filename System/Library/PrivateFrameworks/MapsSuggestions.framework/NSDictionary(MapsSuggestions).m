@implementation NSDictionary(MapsSuggestions)

- (id)MSg_copyIf:()MapsSuggestions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "MSg_mutableCopyIf:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)MSg_mutableCopyIf:()MapsSuggestions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__NSDictionary_MapsSuggestions__MSg_mutableCopyIf___block_invoke;
    v11[3] = &unk_1E4BD10C0;
    v13 = v4;
    v6 = v5;
    v12 = v6;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
    v7 = v12;
    v8 = v6;

  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCopyIf.m";
      v16 = 1024;
      v17 = 48;
      v18 = 2082;
      v19 = "-[NSDictionary(MapsSuggestions) MSg_mutableCopyIf:]";
      v20 = 2082;
      v21 = "nil == (condition)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition block", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

@end
