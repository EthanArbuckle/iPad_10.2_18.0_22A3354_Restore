@implementation MapsSuggestionsParkedCarImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  int v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "type") == 7)
    {
      MapsSuggestionsLocalizedParkedCarString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v6, v5);

      -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, &stru_1E4BDFC28, v5);
      objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineLabel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "geoMapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ParkedCarLocationNameForMapItem(v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        MapsSuggestionsLocalizedParkedCarNearString(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v10, v5);

        MapsSuggestionsLocalizedParkedCarLowerCaseNearString(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setString:forKey:", v11, CFSTR("MapsSuggestionsParkedCarNearLocationStringKey"));

      }
      objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsNeedsDistanceTrackingKey"));
      MapsSuggestionsLocalizedParkedCarRemoveString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setString:forKey:", v12, CFSTR("MapsSuggestionsRemovalBehaviorStringForForget"));

      MapsSuggestionsLocalizedStopShowingParkedCarString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setString:forKey:", v13, CFSTR("MapsSuggestionsRemovalBehaviorStringForDelete"));

      v14 = objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
      if (v14)
      {
        objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", &stru_1E4BDFC28))
        {
LABEL_19:

          goto LABEL_20;
        }
        if ((objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsDestinationAddressKey")) & 1) == 0)
        {

LABEL_18:
          MapsSuggestionsLocalizedParkedCarString();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setString:forKey:", v13, CFSTR("MapsSuggestionsEntryTitleNameKey"));
          goto LABEL_19;
        }
      }
      else if ((objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsDestinationAddressKey")) & 1) == 0)
      {
        goto LABEL_18;
      }
      objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsDestinationAddressKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", &stru_1E4BDFC28);

      if (v14)
      {

        if ((v18 & 1) == 0)
          goto LABEL_20;
      }
      else if (!v18)
      {
LABEL_20:

        v16 = 1;
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarImprover.m";
      v22 = 1024;
      v23 = 24;
      v24 = 2082;
      v25 = "-[MapsSuggestionsParkedCarImprover improveEntry:]";
      v26 = 2082;
      v27 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", (uint8_t *)&v20, 0x26u);
    }

  }
  v16 = 0;
LABEL_21:

  return v16;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
