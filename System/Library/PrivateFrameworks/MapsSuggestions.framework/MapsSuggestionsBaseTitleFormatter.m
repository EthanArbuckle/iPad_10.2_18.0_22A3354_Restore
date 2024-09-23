@implementation MapsSuggestionsBaseTitleFormatter

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)resetTitlesForEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  uint8_t v10[16];

  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "resetTitlesForEntry", v10, 2u);
  }

  objc_msgSend(v4, "undecoratedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undecoratedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v4, v6, v7, 1);

  return v8;
}

- (uint64_t)updateMyChangedTitlesForEntry:(void *)a3 title:(void *)a4 subtitle:(int)a5 includeLockedVersions:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
    goto LABEL_20;
  if (v9)
  {
    if (v10
      && (objc_msgSend(v9, "title"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v10, "isEqualToString:", v12),
          v12,
          (v13 & 1) == 0))
    {
      objc_msgSend(v9, "setTitle:", v10);
      a1 = 1;
      if (!v11)
        goto LABEL_13;
    }
    else
    {
      a1 = 0;
      if (!v11)
      {
LABEL_13:
        if (a5)
        {
          if (v10)
          {
            objc_msgSend(v9, "titleWhenLocked");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v10, "isEqualToString:", v17);

            if ((v18 & 1) == 0)
            {
              objc_msgSend(v9, "setTitleWhenLocked:", v10);
              a1 = 1;
            }
          }
          if (v11)
          {
            objc_msgSend(v9, "subtitleWhenLocked");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v11, "isEqualToString:", v19);

            if ((v20 & 1) == 0)
            {
              objc_msgSend(v9, "setSubtitleWhenLocked:", v11);
              a1 = 1;
            }
          }
        }
        goto LABEL_20;
      }
    }
    objc_msgSend(v9, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(v9, "setSubtitle:", v11);
      a1 = 1;
    }
    goto LABEL_13;
  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v22 = 136446978;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseTitleFormatter.m";
    v24 = 1024;
    v25 = 51;
    v26 = 2082;
    v27 = "-[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]";
    v28 = 2082;
    v29 = "nil == (entry)";
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v22, 0x26u);
  }

  a1 = 0;
LABEL_20:

  return a1;
}

@end
