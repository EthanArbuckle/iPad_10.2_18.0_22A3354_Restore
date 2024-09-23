@implementation MapsSuggestionsCarRentalImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  char v21;
  int v22;
  _BYTE buf[40];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalImprover.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 21;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsCarRentalImprover improveEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "entry == nil";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
    v11 = 0;
    goto LABEL_40;
  }
  if (objc_msgSend(v4, "type") == 14)
  {
    v6 = objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarCarRentalIsPickupDayKey"));
    objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsEventTime(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")))
      {
        objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v9, v5);

      }
      else
      {
        v10 = 0;
      }
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = CFSTR("isDropoffDay = YES");
        if (v6)
          v14 = CFSTR("isPickupDay = YES");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "%@. Time = %@.", buf, 0x16u);
      }

      if (v6)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___MapsSuggestionsBundle_block_invoke;
        *(_QWORD *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&buf[32] = "CarRentalImprover";
        if (qword_1ED22EE80 != -1)
          dispatch_once(&qword_1ED22EE80, buf);
        v15 = (void *)_MergedGlobals_25;
        v16 = CFSTR("MAPS_SUGGESTIONS_CAR_RENTAL_PICKUP_STRING");
        v17 = CFSTR("Pick up from %@<unlocalized>");
      }
      else
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___MapsSuggestionsBundle_block_invoke;
        *(_QWORD *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&buf[32] = "CarRentalImprover";
        if (qword_1ED22EE80 != -1)
          dispatch_once(&qword_1ED22EE80, buf);
        v15 = (void *)_MergedGlobals_25;
        v16 = CFSTR("MAPS_SUGGESTIONS_CAR_RENTAL_DROPOFF_STRING");
        v17 = CFSTR("Drop off by %@<unlocalized>");
      }
      objc_msgSend(v15, "localizedStringForKey:value:table:", v16, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsNonNilString(v18, &stru_1E4BDFC28);
      v12 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v12, v8);
      GEOFindOrCreateLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Subtitle from the Car Rental Improver = %@", buf, 0xCu);
      }

      v21 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v19, v5);
      if ((objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyLocalizedKey")) & 1) != 0)
      {
        v11 = v10 | v21;
      }
      else
      {
        v11 = 1;
        objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyLocalizedKey"));
      }
      if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsAlreadyThereKey")))
        v22 = objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey")) ^ 1;
      else
        v22 = 1;
      if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey"))
        && objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarIsSharedToMeKey")))
      {
        GEOConfigGetDouble();
        objc_msgSend(v5, "setWeight:");
        v11 = 1;
      }
      if (v22 != objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")))
      {
        v11 = 1;
        objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
      }

    }
    else
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "timeOfAction is zero. MapsSuggestionsScheduledTimeKey on the entry should have had a value", buf, 2u);
      }
      v11 = 0;
    }

LABEL_40:
    goto LABEL_41;
  }
  v11 = 0;
LABEL_41:

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
