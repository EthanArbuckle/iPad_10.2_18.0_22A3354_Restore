@implementation MapsSuggestionsFrequentLocationImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BYTE v20[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 136446978;
      *(_QWORD *)&v20[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFrequentLocationImprover.m";
      *(_WORD *)&v20[12] = 1024;
      *(_DWORD *)&v20[14] = 27;
      *(_WORD *)&v20[18] = 2082;
      *(_QWORD *)&v20[20] = "-[MapsSuggestionsFrequentLocationImprover improveEntry:]";
      *(_WORD *)&v20[28] = 2082;
      *(_QWORD *)&v20[30] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", v20, 0x26u);
    }
    LOBYTE(v13) = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "type") == 4)
  {
    objc_msgSend(v5, "geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "geoMapItem");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineLabel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsMapItemCityName(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "length")
        && -[NSObject _hasMUID](v7, "_hasMUID")
        && -[NSObject _muid](v7, "_muid"))
      {
        -[NSObject name](v7, "name");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
      MapsSuggestionsMapItemStreetName(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length") || !objc_msgSend(v11, "length"))
      {
        v12 = 0;
      }
      else
      {
        v14 = v11;

        MapsSuggestionsLocalizedFrequentLocationNearStreetTitleString(v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v20 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v20[8] = 3221225472;
        *(_QWORD *)&v20[16] = ___MapsSuggestionsBundle_block_invoke_1;
        *(_QWORD *)&v20[24] = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v20[32] = "FrequentLocationImprover";
        if (qword_1ED22EEE0 != -1)
          dispatch_once(&qword_1ED22EEE0, v20);
        objc_msgSend((id)_MergedGlobals_29, "localizedStringForKey:value:table:", CFSTR("MAPS_SUGG_FREQ_LOC_SUBTITLE"), CFSTR("Significant Location<unlocalized>"), 0, *(_QWORD *)v20, *(_OWORD *)&v20[8], *(_OWORD *)&v20[24], v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsNonNilString(v15, &stru_1E4BDFC28);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = v14;
        v9 = (void *)v16;
      }
      objc_msgSend(v5, "setString:forKey:", v8, CFSTR("MapsSuggestionsFrequentLocationTitleWithoutNearKey"));
      if (objc_msgSend(v9, "length"))
        v13 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v9, v5);
      else
        v13 = 0;
      if (objc_msgSend(v12, "length"))
        v13 |= -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v12, v5);
      if (!objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey"))
        || (objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey")) & 1) == 0)
      {
        LOBYTE(v13) = 1;
        objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
      }
      MapsSuggestionsLocalizedHideInMapsString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setString:forKey:", v17, CFSTR("MapsSuggestionsRemovalBehaviorStringForHide"));

      MapsSuggestionsLocalizedForgetMyVisitsString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setString:forKey:", v18, CFSTR("MapsSuggestionsRemovalBehaviorStringForForget"));

LABEL_27:
      goto LABEL_28;
    }
  }
  LOBYTE(v13) = 0;
LABEL_28:

  return v13;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
