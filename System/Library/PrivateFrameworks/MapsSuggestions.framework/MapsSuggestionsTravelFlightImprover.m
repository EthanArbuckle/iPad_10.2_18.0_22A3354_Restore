@implementation MapsSuggestionsTravelFlightImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
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
  if (!v4)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTravelFlightImprover.m";
      v22 = 1024;
      v23 = 23;
      v24 = 2082;
      v25 = "-[MapsSuggestionsTravelFlightImprover improveEntry:]";
      v26 = 2082;
      v27 = "entry == nil";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v20, 0x26u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") != 15)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsFlightDepartureAirportCodeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v8 && v9)
  {
    MapsSuggestionsLocalizedWalletFlightAndAirportNumberString(v9, v8);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v14 = (void *)v11;
    goto LABEL_15;
  }
  if (v9)
  {
    MapsSuggestionsLocalizedWalletFlightAirportString(v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v8)
  {
    MapsSuggestionsLocalizedWalletFlightNumberString(v8);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  v15 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v14, v5);
  MapsSuggestionsFlightStatusStringForEntry(v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v16, v5);
  if ((objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyLocalizedKey")) & 1) != 0)
  {
    v13 = v15 | v17;
  }
  else
  {
    v13 = 1;
    objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyLocalizedKey"));
  }
  if ((objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) & 1) != 0)
      goto LABEL_24;
    v18 = 1;
    goto LABEL_23;
  }
  v18 = objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) ^ 1;
  if (objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) != (_DWORD)v18)
  {
LABEL_23:
    objc_msgSend(v5, "setBoolean:forKey:", v18, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    v13 = 1;
  }
LABEL_24:
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"))
    && objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey")))
  {
    GEOConfigGetDouble();
    objc_msgSend(v5, "setWeight:");
    v13 = 1;
  }

LABEL_28:
  return v13;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
