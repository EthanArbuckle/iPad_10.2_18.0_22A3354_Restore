@implementation MapsSuggestionsCalendarEventImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v32 = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarEventImprover.m";
      v34 = 1024;
      v35 = 27;
      v36 = 2082;
      v37 = "-[MapsSuggestionsCalendarEventImprover improveEntry:]";
      v38 = 2082;
      v39 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v32, 0x26u);
    }

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "type") != 3)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_42;
  }
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsCalendarAllDayEventKey")))
    v6 = objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarAllDayEventKey"));
  else
    v6 = 0;
  objc_msgSend(v5, "undecoratedSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v8 = v10 == 0;

  if (!v10)
  {
    objc_msgSend(v5, "geoMapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v12, v5);

    objc_msgSend(v5, "undecoratedSubtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:forKey:", v13, CFSTR("MapsSuggestionsEntryTitleNameKey"));

  }
  objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")))
  {
    objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsEventTime(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      MapsSuggestionsLocalizedCalendarEventAllDayString();
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    MapsSuggestionsLocalizedCalendarEventTimeAndLocationString(v16, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v18, v5);
    if (v10)
      v8 = v19;
    else
      v8 = 1;

  }
  objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyLocalizedKey"));
  if ((objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) & 1) != 0)
      goto LABEL_26;
    v20 = 1;
    goto LABEL_25;
  }
  v20 = objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) ^ 1;
  if (objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) != (_DWORD)v20)
  {
LABEL_25:
    objc_msgSend(v5, "setBoolean:forKey:", v20, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    v8 = 1;
  }
LABEL_26:
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"))
    && objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey")))
  {
    GEOConfigGetDouble();
    objc_msgSend(v5, "setWeight:");
    v8 = 1;
  }
  objc_msgSend(v5, "undecoratedTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((v6 & 1) != 0)
  {
    MapsSuggestionsLocalizedCalendarEventPOIAdornmentAllDayString(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsLocalizedCalendarEventPOIAdornmentString(v22, v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", v23) & 1) == 0)
  {
    objc_msgSend(v5, "setString:forKey:", v23, CFSTR("MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"));
    v8 = 1;
  }
  v26 = objc_msgSend(v5, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsCalendarIsInvitationKey"), 1);
  if (objc_msgSend(v5, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsCalendarEventIsRecurringKey"), 1))
  {
    MapsSuggestionsLocalizedSnoozeInMapsString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:forKey:", v27, CFSTR("MapsSuggestionsRemovalBehaviorStringForSnooze"));

  }
  MapsSuggestionsLocalizedHideInMapsString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:forKey:", v28, CFSTR("MapsSuggestionsRemovalBehaviorStringForHide"));

  if ((v26 & 1) != 0)
    MapsSuggestionsLocalizedDeclineCalendarEventString();
  else
    MapsSuggestionsLocalizedDeleteFromCalendarString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:forKey:", v29, CFSTR("MapsSuggestionsRemovalBehaviorStringForDelete"));

  if (GEOConfigGetBOOL())
  {
    MapsSuggestionsLocalizedSiriFoundInCalendarString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:forKey:", v30, CFSTR("MapsSuggestionsSiriFoundLineKey"));

  }
LABEL_42:

  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
