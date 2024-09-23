@implementation MapsSuggestionsAppConnectionImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "type") == 12)
    {
      v6 = v5;
      if (objc_msgSend(v6, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsAppConnectionIsCoordinateOnlyURL"), 1))
      {
        if (!objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsAppConnectionMessageSenderContactName")))
        {
          MapsSuggestionsLocalizedSharedLocationString();
          v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

          if (!v8)
          {
            v12 = 0;
LABEL_27:
            v20 = v6;
            objc_msgSend(v20, "stringForKey:", CFSTR("MapsSuggestionsAppConnectionOriginatingWebsiteName"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "length"))
            {
              MapsSuggestionsLocalizedSiriFoundOnString(v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

              v10 = (v12 | -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v22, v20)) != 0;
              goto LABEL_40;
            }
            objc_msgSend(v20, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.siri")))
            {
              MapsSuggestionsLocalizedSubtitleFormatForPortraitSiriSuggestionEntry();
              v24 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (!objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.siri.homepod")))
                goto LABEL_34;
              MapsSuggestionsLocalizedSubtitleFormatForPortraitHomePodEntry();
              v24 = objc_claimAutoreleasedReturnValue();
            }
            v22 = (void *)v24;
            if (v24)
            {
LABEL_38:

              goto LABEL_39;
            }
LABEL_34:
            objc_msgSend(v20, "stringForKey:", CFSTR("MapsSuggestionsOriginatingAppName"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "length"))
              MapsSuggestionsLocalizedSiriFoundInString(v25);
            else
              MapsSuggestionsLocalizedSiriSuggestionsString();
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_38;
          }
          v12 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v6);
LABEL_25:

          goto LABEL_27;
        }
        objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsAppConnectionMessageSenderContactName"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsLocalizedSharedByString(v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v6, "undecoratedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {

      }
      else
      {
        objc_msgSend(v6, "geoMapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v6, "geoMapItem");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v8 = v14;
          }
          else
          {
            objc_msgSend(v6, "geoMapItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "shortAddress");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              v19 = v17;
            }
            else
            {
              MapsSuggestionsLocalizedFoundInAppString();
              v19 = (id)objc_claimAutoreleasedReturnValue();
            }
            v8 = v19;

          }
          goto LABEL_22;
        }
      }
      v12 = 0;
      v8 = v6;
      goto LABEL_25;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v27 = 136446978;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionImprover.m";
      v29 = 1024;
      v30 = 24;
      v31 = 2082;
      v32 = "-[MapsSuggestionsAppConnectionImprover improveEntry:]";
      v33 = 2082;
      v34 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v27, 0x26u);
    }

  }
  v10 = 0;
LABEL_40:

  return v10;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
