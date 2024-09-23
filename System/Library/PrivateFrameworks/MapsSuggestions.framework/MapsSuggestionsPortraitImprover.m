@implementation MapsSuggestionsPortraitImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "type") == 17)
    {
      objc_msgSend(v5, "geoMapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v7, v5);

      v8 = v5;
      if (objc_msgSend(v8, "containsKey:", CFSTR("MapsSuggestionsOriginBundleIDKey")))
      {
        objc_msgSend(v8, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siri")))
        {
          MapsSuggestionsLocalizedSubtitleFormatForPortraitSiriSuggestionEntry();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siri.homepod")) & 1) == 0)
          {

            goto LABEL_15;
          }
          MapsSuggestionsLocalizedSubtitleFormatForPortraitHomePodEntry();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v10;

        if (v13)
        {
LABEL_19:

          -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v13, v8);
          objc_msgSend(v8, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
          v12 = 1;
          goto LABEL_20;
        }
      }
LABEL_15:
      objc_msgSend(v8, "stringForKey:", CFSTR("MapsSuggestionsOriginatingAppName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
        MapsSuggestionsLocalizedSiriFoundInString(v14);
      else
        MapsSuggestionsLocalizedSiriSuggestionsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitImprover.m";
      v18 = 1024;
      v19 = 23;
      v20 = 2082;
      v21 = "-[MapsSuggestionsPortraitImprover improveEntry:]";
      v22 = 2082;
      v23 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v16, 0x26u);
    }

  }
  v12 = 0;
LABEL_20:

  return v12;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
