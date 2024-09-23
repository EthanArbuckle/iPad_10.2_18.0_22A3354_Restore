@implementation MapsSuggestionsTicketedEventImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
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
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTicketedEventImprover.m";
      v22 = 1024;
      v23 = 23;
      v24 = 2082;
      v25 = "-[MapsSuggestionsTicketedEventImprover improveEntry:]";
      v26 = 2082;
      v27 = "entry == nil";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v20, 0x26u);
    }

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "type") != 16)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_39;
  }
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")))
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v6, v5);

  }
  else
  {
    v7 = 0;
  }
  v9 = v5;
  objc_msgSend(v9, "dateForKey:", CFSTR("MapsSuggestionsCalendarTicketedEventShowTimeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMapsSuggestionsEventTime(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringForKey:", CFSTR("MapsSuggestionsCalendarTicketedEventNameKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    MapsSuggestionsLocalizedTicketedEventWithTimeAndNameFormatString(v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "length") && !objc_msgSend(v12, "length"))
  {
    v13 = v11;
  }
  else
  {
    if (!objc_msgSend(v12, "length") || objc_msgSend(v11, "length"))
    {
      v14 = 0;
      goto LABEL_21;
    }
    v13 = v12;
  }
  v14 = v13;
LABEL_21:

  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v9, "undecoratedSubtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v14);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(v9, "setUndecoratedSubtitle:", v14);
      v7 = 1;
    }
  }
  if ((objc_msgSend(v9, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyLocalizedKey")) & 1) == 0)
  {
    v7 = 1;
    objc_msgSend(v9, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyLocalizedKey"));
  }
  if (objc_msgSend(v9, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey")))
    v17 = objc_msgSend(v9, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) ^ 1;
  else
    v17 = 1;
  objc_msgSend(v9, "stringForKey:", CFSTR("MapsSuggestionsCalendarTicketedEventSeatDetailsKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey"))
    && objc_msgSend(v9, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey"))
    && objc_msgSend(v18, "length"))
  {
    objc_msgSend(v9, "setUndecoratedSubtitle:", v18);
  }
  if ((_DWORD)v17 != objc_msgSend(v9, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")))
  {
    objc_msgSend(v9, "setBoolean:forKey:", v17, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
    v7 = 1;
  }
  if (objc_msgSend(v9, "containsKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"))
    && objc_msgSend(v9, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey")))
  {
    GEOConfigGetDouble();
    objc_msgSend(v9, "setWeight:");
    v7 = 1;
  }

LABEL_39:
  return v7;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
