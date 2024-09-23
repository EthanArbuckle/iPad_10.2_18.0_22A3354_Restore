@implementation MapsSuggestionsRecentHistoryImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  char v20;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  _BYTE buf[40];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "type") == 5)
    {
      objc_msgSend(v5, "geoMapItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
      if (!self || !v6)
        goto LABEL_17;
      objc_msgSend(v6, "eventName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        objc_msgSend(v7, "eventName");
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

        v18 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v5);
        MapsSuggestionsLocalizedRecentlyViewedString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v19, v5);

        v12 = v18 | v20;
        goto LABEL_18;
      }
      MapsSuggestionsMapItemHomeWorkSchoolName(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v7, "contactName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v7, "contactName");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v7, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            objc_msgSend(v7, "name");
            v24 = (id)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy__12;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose__12;
            v27 = 0;
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = ___firstLineOfString_block_invoke_0;
            v25[3] = &unk_1E4BCECA0;
            v25[4] = buf;
            objc_msgSend(v24, "enumerateLinesUsingBlock:", v25);
            v8 = *(id *)(*(_QWORD *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            goto LABEL_16;
          }
          objc_msgSend(v7, "shortAddress");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v8 = v15;
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRecentHistoryImprover.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 23;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRecentHistoryImprover improveEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "entry == nil";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", buf, 0x26u);
    }

  }
  v12 = 0;
LABEL_18:

  return v12;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
