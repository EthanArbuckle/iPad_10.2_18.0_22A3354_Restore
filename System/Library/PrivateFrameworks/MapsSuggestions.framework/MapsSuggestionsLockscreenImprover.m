@implementation MapsSuggestionsLockscreenImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _BYTE v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    *(_QWORD *)v17 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v17[8] = 3221225472;
    *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
    *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
    *(_QWORD *)&v17[32] = "LockscreenImprover";
    if (qword_1ED22EF10 != -1)
      dispatch_once(&qword_1ED22EF10, v17);
    objc_msgSend((id)_MergedGlobals_31, "localizedStringForKey:value:table:", CFSTR("MAPS_SUGG_SUBTITLE_UNLOCK"), CFSTR("Unlock device to show details<unlocalized>"), 0, *(_QWORD *)v17, *(_QWORD *)&v17[8], *(_QWORD *)&v17[16], *(_QWORD *)&v17[24], *(_QWORD *)&v17[32], v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsNonNilString(v5, &stru_1E4BDFC28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUndecoratedSubtitleWhenLocked:", v6);

    v7 = 0;
    switch(objc_msgSend(v3, "type"))
    {
      case 0:
        goto LABEL_52;
      case 1:
      case 2:
      case 9:
      case 18:
      case 19:
      case 20:
      case 22:
      case 23:
      case 24:
        objc_msgSend(v3, "undecoratedTitle");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 3:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_CAL");
        v13 = CFSTR("Upcoming event<unlocalized>");
        goto LABEL_49;
      case 4:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_LOI");
        v13 = CFSTR("Significant location<unlocalized>");
        goto LABEL_49;
      case 5:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_RECENT");
        v13 = CFSTR("Recent place<unlocalized>");
        goto LABEL_49;
      case 6:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_FAV");
        v13 = CFSTR("Favorite place<unlocalized>");
        goto LABEL_49;
      case 7:
        MapsSuggestionsLocalizedParkedCarString();
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 8:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_RESTAURANT_RESERVATION");
        v13 = CFSTR("Restaurant reservation<unlocalized>");
        goto LABEL_49;
      case 10:
        objc_msgSend(v3, "undecoratedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setUndecoratedTitleWhenLocked:", v14);

        objc_msgSend(v3, "undecoratedSubtitle");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setUndecoratedSubtitleWhenLocked:", v10);
        goto LABEL_9;
      case 11:
        MapsSuggestionsLocalizedResumeRouteString();
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v9 = (void *)v8;
        objc_msgSend(v3, "setUndecoratedTitleWhenLocked:", v8);
        goto LABEL_50;
      case 12:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_DEC");
        v13 = CFSTR("Recently viewed location<unlocalized>");
        goto LABEL_49;
      case 13:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_HOTEL");
        v13 = CFSTR("Hotel reservation<unlocalized>");
        goto LABEL_49;
      case 14:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_CAR_RENTAL");
        v13 = CFSTR("Car rental<unlocalized>");
        goto LABEL_49;
      case 15:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_FLIGHT");
        v13 = CFSTR("Flight reservation<unlocalized>");
        goto LABEL_49;
      case 16:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_TICKET");
        v13 = CFSTR("Ticketed event<unlocalized>");
        goto LABEL_49;
      case 17:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_PORTRAIT");
        v13 = CFSTR("Siri suggestion<unlocalized>");
        goto LABEL_49;
      case 21:
        *(_QWORD *)v17 = v4;
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(_QWORD *)&v17[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v17[32] = "LockscreenImprover";
        if (qword_1ED22EF10 != -1)
          dispatch_once(&qword_1ED22EF10, v17);
        v11 = (void *)_MergedGlobals_31;
        v12 = CFSTR("MAPS_SUGG_TITLE_RATING");
        v13 = CFSTR("Rate<unlocalized>");
LABEL_49:
        objc_msgSend(v11, "localizedStringForKey:value:table:", v12, v13, 0, *(_QWORD *)v17, *(_QWORD *)&v17[8], *(_QWORD *)&v17[16], *(_QWORD *)&v17[24], *(_QWORD *)&v17[32]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsNonNilString(v9, &stru_1E4BDFC28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setUndecoratedTitleWhenLocked:", v15);

LABEL_50:
        break;
      default:
        break;
    }
    v7 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v17 = 136446978;
      *(_QWORD *)&v17[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLockscreenImprover.m";
      *(_WORD *)&v17[12] = 1024;
      *(_DWORD *)&v17[14] = 21;
      *(_WORD *)&v17[18] = 2082;
      *(_QWORD *)&v17[20] = "-[MapsSuggestionsLockscreenImprover improveEntry:]";
      *(_WORD *)&v17[28] = 2082;
      *(_QWORD *)&v17[30] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", v17, 0x26u);
    }
LABEL_9:

    v7 = 0;
  }
LABEL_52:

  return v7;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
