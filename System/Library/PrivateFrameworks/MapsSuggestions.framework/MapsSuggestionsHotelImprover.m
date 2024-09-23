@implementation MapsSuggestionsHotelImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  const char *v18;
  char v19;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v31 = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelImprover.m";
    v33 = 1024;
    v34 = 21;
    v35 = 2082;
    v36 = "-[MapsSuggestionsHotelImprover improveEntry:]";
    v37 = 2082;
    v38 = "entry == nil";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry";
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "type") == 13)
  {
    v5 = objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v6 = objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey"));
    if ((v5 & 1) != 0)
    {
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v4, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateForKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc(MEMORY[0x1E0C99E80]);
        objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsEventTimeZoneKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithName:", v10);

        if (!v11)
        {
          GEOFindOrCreateLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "title");
            v13 = (char *)objc_claimAutoreleasedReturnValue();
            v31 = 138412290;
            v32 = v13;
            _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Timezone information is missing for entry %@", (uint8_t *)&v31, 0xCu);

          }
        }
        v14 = v7;
        v15 = v8;
        v16 = v11;
        if (v14 && MapsSuggestionsIsToday(v14))
        {
          MapsSuggestionsLocalizedHotelCheckInString(v14, v16);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v15 || !MapsSuggestionsIsToday(v15))
          {
            MapsSuggestionsShortDateFromDateAndTimeZone(v15, v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            MapsSuggestionsLocalizedHotelUntilCheckoutDateString(v22);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
            objc_msgSend(v4, "undecoratedSubtitle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v21);

            if ((v24 & 1) == 0)
              objc_msgSend(v4, "setUndecoratedSubtitle:", v21);
            if ((objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyLocalizedKey")) & 1) != 0)
            {
              v19 = v24 ^ 1;
            }
            else
            {
              v19 = 1;
              objc_msgSend(v4, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyLocalizedKey"));
            }
            if ((objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) & 1) != 0)
            {
              v25 = objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) ^ 1;
              if (objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) == (_DWORD)v25)
              {
LABEL_39:
                if (objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"))
                  && objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey")))
                {
                  GEOConfigGetDouble();
                  objc_msgSend(v4, "setWeight:");
                  v19 = 1;
                }
                v26 = objc_alloc(MEMORY[0x1E0C99E80]);
                objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsEventTimeZoneKey"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v26, "initWithName:", v27);
                MapsSuggestionsDateRangeStringForDates(v14, v15, (void *)v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v28) = objc_msgSend(v29, "isEqualToString:", v30);

                if ((v28 & 1) == 0)
                {
                  objc_msgSend(v4, "setString:forKey:", v29, CFSTR("MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"));
                  v19 = 1;
                }

                goto LABEL_21;
              }
            }
            else
            {
              if ((objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) & 1) != 0)
                goto LABEL_39;
              v25 = 1;
            }
            objc_msgSend(v4, "setBoolean:forKey:", v25, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
            v19 = 1;
            goto LABEL_39;
          }
          MapsSuggestionsLocalizedHotelCheckOutString(v15, v16);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v21 = (void *)v17;
        goto LABEL_28;
      }
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v31 = 136446978;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelImprover.m";
        v33 = 1024;
        v34 = 31;
        v35 = 2082;
        v36 = "-[MapsSuggestionsHotelImprover improveEntry:]";
        v37 = 2082;
        v38 = "scheduledEndTimeExists == NO";
        v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Scheduled End time can't be nil";
        goto LABEL_19;
      }
LABEL_20:
      v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v31 = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelImprover.m";
    v33 = 1024;
    v34 = 30;
    v35 = 2082;
    v36 = "-[MapsSuggestionsHotelImprover improveEntry:]";
    v37 = 2082;
    v38 = "scheduledTimeExists == NO";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Scheduled time can't be nil";
LABEL_19:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v31, 0x26u);
    goto LABEL_20;
  }
  v19 = 0;
LABEL_22:

  return v19;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
