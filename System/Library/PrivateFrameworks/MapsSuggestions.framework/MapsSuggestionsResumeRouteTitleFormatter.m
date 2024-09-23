@implementation MapsSuggestionsResumeRouteTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4 requiredChargeLevel:(id)a5 currentChargeLevel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  void *v23;
  unint64_t v24;
  char v25;
  const char *v26;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    v35 = 1024;
    v36 = 24;
    v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    v39 = 2082;
    v40 = "nil == (entry)";
    v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_19:
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v33, 0x26u);
    goto LABEL_20;
  }
  if (!v11)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    v35 = 1024;
    v36 = 25;
    v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    v39 = 2082;
    v40 = "nil == (eta)";
    v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_19;
  }
  if (objc_msgSend(v10, "type") != 11)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    v35 = 1024;
    v36 = 26;
    v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    v39 = 2082;
    v40 = "MapsSuggestionsEntryTypeResumeRoute != entry.type";
    v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be a Resume Route";
    goto LABEL_19;
  }
  objc_msgSend(v10, "stringForKey:", CFSTR("MapsSuggestionsResumeRouteDefaultTitle"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v12, "doubleValue");
    v17 = v16;
    objc_msgSend(v13, "doubleValue");
    v19 = v18;
    v20 = objc_msgSend(v10, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsResumingAnEVRoute"), 0);
    if (v13
      && v12
      && (v20 & 1) == 0
      && (!objc_msgSend(v10, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsResumingAnEVRoute"), 1)
       || (v22 = v19 * 100.0, v21 = v17 * 100.0, v19 * 100.0 < v17 * 100.0)))
    {
      objc_msgSend(v10, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsHasEnoughChargeKey"), v21, v22);
      objc_msgSend(v10, "stringForKey:", CFSTR("MapsSuggestionsResumeRouteTitleWhenCharging"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringForKey:", CFSTR("MapsSuggestionsResumeRouteSubtitleWhenCharging"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        GEOFindOrCreateLog();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v33 = 138412290;
            v34 = (const char *)v13;
            _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_INFO, "Setting titles for EV ResumeRoute entry because the vehicle is still charging at %@", (uint8_t *)&v33, 0xCu);
          }

          v25 = 1;
          if ((-[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v23, v29, 1) & 1) != 0)goto LABEL_39;
          objc_msgSend(v10, "setTitle:", v23);
        }
        else
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v33 = 136446978;
            v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
            v35 = 1024;
            v36 = 69;
            v37 = 2082;
            v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
            v39 = 2082;
            v40 = "nil == (chargingSubtitle)";
            _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EV Resume Route requires a subtitle when charging", (uint8_t *)&v33, 0x26u);
          }

        }
      }
      else
      {
        GEOFindOrCreateLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = 136446978;
          v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
          v35 = 1024;
          v36 = 68;
          v37 = 2082;
          v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
          v39 = 2082;
          v40 = "nil == (chargingTitle)";
          _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EV Resume Route requires a title when charging", (uint8_t *)&v33, 0x26u);
        }

      }
      v25 = 0;
    }
    else
    {
      objc_msgSend(v10, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsHasEnoughChargeKey"));
      objc_msgSend(v10, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = objc_msgSend(v10, "uint64ForKey:", CFSTR("MapsSuggestionsResumeRouteWaypointIndex")) + 1;
        if (v24 < objc_msgSend(v23, "waypointsCount"))
        {
          v25 = 0;
LABEL_40:

          goto LABEL_21;
        }
      }
      objc_msgSend(v11, "trafficString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v15, v29, 1);
    }
LABEL_39:

    goto LABEL_40;
  }
  GEOFindOrCreateLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    v35 = 1024;
    v36 = 29;
    v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    v39 = 2082;
    v40 = "nil == (defaultTitle)";
    _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Resume Route requires a default title", (uint8_t *)&v33, 0x26u);
  }

  v15 = 0;
LABEL_20:
  v25 = 0;
LABEL_21:

  return v25;
}

@end
