@implementation MapsSuggestionsPinnedPlaceImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  NSObject *v10;
  char v11;
  int IsNearbyTransit;
  void *v14;
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
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPinnedPlaceImprover.m";
      v17 = 1024;
      v18 = 22;
      v19 = 2082;
      v20 = "-[MapsSuggestionsPinnedPlaceImprover improveEntry:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v15, 0x26u);
    }

    goto LABEL_10;
  }
  if (!objc_msgSend(v3, "isPureShortcut"))
  {
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "isShortcutForSetup"))
  {
    if (MapsSuggestionsEntryIsNearbyTransit(v4))
    {
LABEL_17:
      MapsSuggestionsLocalizedNearbyTransitShortSubtitleString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "updateUndecoratedSubtitle:", v14);

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v5 = MapsSuggestionsShortcutTypeFromEntryType(objc_msgSend(v4, "type"));
  MapsSuggestionsShortcutSetupStringForType(v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(v4, "undecoratedSubtitle"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqualToString:", v7),
        v7,
        (v8 & 1) == 0))
  {
    objc_msgSend(v4, "setUndecoratedSubtitle:", v6);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  IsNearbyTransit = MapsSuggestionsEntryIsNearbyTransit(v4);
  v11 = v9 | IsNearbyTransit;
  if ((v9 & 1) == 0 && IsNearbyTransit)
    goto LABEL_17;
LABEL_11:

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
