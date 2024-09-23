@implementation MapsSuggestionsHomeWorkImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v35 = 136446978;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkImprover.m";
      v37 = 1024;
      v38 = 30;
      v39 = 2082;
      v40 = "-[MapsSuggestionsHomeWorkImprover improveEntry:]";
      v41 = 2082;
      v42 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a entry", (uint8_t *)&v35, 0x26u);
    }
    goto LABEL_32;
  }
  v6 = objc_msgSend(v4, "type");
  switch(v6)
  {
    case 19:
      MapsSuggestionsLocalizedSchoolString();
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      MapsSuggestionsLocalizedWorkString();
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      MapsSuggestionsLocalizedHomeString();
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
LABEL_32:
      v24 = 0;
      goto LABEL_44;
  }
  v8 = v7;
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsTransportTypeKey")))
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "Removing existing value for MapsSuggestionsTransportTypeKey", (uint8_t *)&v35, 2u);
    }

    objc_msgSend(v5, "setNumber:forKey:", 0, CFSTR("MapsSuggestionsTransportTypeKey"));
  }
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel")))
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = v12;
    }
  }
  if (-[NSObject length](v8, "length"))
    -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v5);
  objc_msgSend(v5, "geoMapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v5, "geoMapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsMapItemCityName(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v5, "undecoratedSubtitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v17 & 1) == 0)
      {
        v18 = v5;
        objc_msgSend(v18, "subtitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "subtitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "undecoratedSubtitle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqualToString:", v21);

          if (!v22)
          {
            objc_msgSend(v18, "subtitle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v15, v18);
            if (v23)
            {
              objc_msgSend(v18, "setSubtitle:", v23);

            }
            goto LABEL_29;
          }
        }
        else
        {

        }
        -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v15, v18);
      }
    }
LABEL_29:

  }
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsAlreadyLocalizedKey"))
    && (objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyLocalizedKey")) & 1) != 0)
  {
    goto LABEL_32;
  }
  objc_msgSend(v5, "subtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (!v26)
    -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, &stru_1E4BDFC28, v5);
  objc_msgSend(v5, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyLocalizedKey"));
  objc_msgSend(v5, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel")))
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length"))
      -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v27, v5);

  }
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")))
  {
    objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsNow();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v29);
    v31 = v30;
    GEOConfigGetDouble();
    v33 = v32;

    if (v31 > v33)
      objc_msgSend(v5, "setWeight:", 0.0);

  }
  v24 = 1;
LABEL_44:

  return v24;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
