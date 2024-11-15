@implementation MapsSuggestionsReservationImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  NSObject *v33;
  const char *v34;
  id v35;
  NSObject *v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  int v41;
  int v42;
  void *v44;
  void *v45;
  char v46;
  int v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v47 = 136446978;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationImprover.m";
      v49 = 1024;
      v50 = 22;
      v51 = 2082;
      v52 = "-[MapsSuggestionsReservationImprover improveEntry:]";
      v53 = 2082;
      v54 = "nil == (entry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry";
      v13 = v5;
      v14 = 38;
LABEL_12:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v47, v14);
    }
LABEL_13:
    v15 = 0;
LABEL_48:

    goto LABEL_49;
  }
  if (objc_msgSend(v3, "type") == 8)
  {
    if ((objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")) & 1) != 0)
    {
      v5 = objc_msgSend(v4, "copy");
      objc_msgSend(v4, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsReservationsStatusKey")))
      {
        v7 = objc_msgSend(v4, "integerForKey:", CFSTR("MapsSuggestionsReservationsStatusKey"));
        v8 = v6;
        v9 = v8;
        v10 = 0;
        switch(v7)
        {
          case 0:
            break;
          case 1:
            NSStringFromMapsSuggestionsEventTime(v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            MapsSuggestionsLocalizedRestaurantReservationStringConfirmed(v11);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

            break;
          case 2:
            MapsSuggestionsLocalizedRestaurantReservationStringCancelled();
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          case 3:
            MapsSuggestionsLocalizedRestaurantReservationStringPending();
            v16 = objc_claimAutoreleasedReturnValue();
LABEL_16:
            v10 = (__CFString *)v16;
            break;
          default:
            GEOFindOrCreateLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v47 = 136446978;
              v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationImprover.m";
              v49 = 1024;
              v50 = 95;
              v51 = 2082;
              v52 = "NSString *_subtitleForReservation(MapsSuggestionsRestaurantReservationStatus, NSDate *__strong)";
              v53 = 2082;
              v54 = "YES";
              _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsRestaurantReservationStatus!", (uint8_t *)&v47, 0x26u);
            }

            v10 = CFSTR("UnsupportedType");
            break;
        }

        objc_msgSend(v4, "undecoratedSubtitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqualToString:", v10) & 1) != 0)
        {

        }
        else
        {
          v19 = -[__CFString length](v10, "length");

          if (v19)
            objc_msgSend(v4, "setUndecoratedSubtitle:", v10);
        }

      }
      MapsSuggestionsNow();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v20);
      v22 = v21;

      if (objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey")))
        v23 = objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"));
      else
        v23 = 0;
      GEOConfigGetDouble();
      v25 = v24;
      if (v23)
        objc_msgSend(v4, "setWeight:", v24);
      GEOConfigGetDouble();
      if (v22 <= v26)
      {
        if (objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey")))
          v30 = objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) ^ 1;
        else
          v30 = 1;
        GEOConfigGetDouble();
        v32 = fmin(v25, v31);
        if (v23)
          v31 = v32;
        objc_msgSend(v4, "setWeight:", v31);
        objc_msgSend(v4, "setBoolean:forKey:", v30, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
        GEOFindOrCreateLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "weight");
          v47 = 134217984;
          v48 = v34;
          _os_log_impl(&dword_1A427D000, v33, OS_LOG_TYPE_DEBUG, "Resetting the entry's weight to %g", (uint8_t *)&v47, 0xCu);
        }

      }
      else
      {
        GEOConfigGetDouble();
        v28 = fmin(v25, v27);
        if (v23)
          v27 = v28;
        objc_msgSend(v4, "setWeight:", v27);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", GEOConfigGetInteger());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setNumber:forKey:", v29, CFSTR("MapsSuggestionsSinkRankKey"));

        objc_msgSend(v4, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
      }
      v35 = v4;
      v36 = v5;
      objc_msgSend(v35, "weight");
      v38 = v37;
      -[NSObject weight](v36, "weight");
      if (vabdd_f64(v38, v39) < 2.22044605e-16
        && (v40 = objc_msgSend(v35, "integerForKey:", CFSTR("MapsSuggestionsSinkRankKey")),
            v40 == -[NSObject integerForKey:](v36, "integerForKey:", CFSTR("MapsSuggestionsSinkRankKey")))
        && (v41 = objc_msgSend(v35, "containsKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")),
            v41 == -[NSObject containsKey:](v36, "containsKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")))&& (v42 = objc_msgSend(v35, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")), v42 == -[NSObject BOOLeanForKey:](v36, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey"))))
      {
        objc_msgSend(v35, "undecoratedSubtitle");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject undecoratedSubtitle](v36, "undecoratedSubtitle");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v44, "isEqualToString:", v45);

        v15 = v46 ^ 1;
      }
      else
      {
        v15 = 1;
      }

      goto LABEL_48;
    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v47 = 138412290;
      v48 = (const char *)v4;
      v12 = "Entry didn't have a MapsSuggestionsScheduledTimeKey: %@";
      v13 = v5;
      v14 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v15 = 0;
LABEL_49:

  return v15;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
