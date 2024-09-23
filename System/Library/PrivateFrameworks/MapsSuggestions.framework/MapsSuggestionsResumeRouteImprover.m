@implementation MapsSuggestionsResumeRouteImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  float v50;
  char v51;
  char v52;
  float v54;
  void *v55;
  void *v56;
  NSObject *v57;
  char v58;
  char v59;
  void *v60;
  _QWORD v61[5];
  _BYTE buf[40];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteImprover.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 44;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsResumeRouteImprover improveEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (entry)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      v15 = v6;
      v16 = 38;
LABEL_16:
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    }
LABEL_17:
    v17 = 0;
LABEL_62:

    goto LABEL_63;
  }
  if (objc_msgSend(v4, "type") == 11)
  {
    if ((objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsWhenItHappenedKey")) & 1) != 0)
    {
      objc_msgSend(v5, "geoMapItem");
      v6 = objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_38:
        objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "length"))
        {
          objc_msgSend(v5, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage"));
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsResumeRouteWaypointIndex")))
            {
              v31 = objc_msgSend(v5, "uint64ForKey:", CFSTR("MapsSuggestionsResumeRouteWaypointIndex")) + 1;
              if (v31 < -[NSObject waypointsCount](v30, "waypointsCount"))
              {
                MapsSuggestionsLocalizedMultipointRouteStopsString(-[NSObject waypointsCount](v30, "waypointsCount") - v31);
                v32 = objc_claimAutoreleasedReturnValue();

                v6 = v32;
              }
            }
          }
          v33 = v5;
          if (self)
          {
            GEOConfigGetDouble();
            v35 = v34;
            objc_msgSend(v33, "dateForKey:", CFSTR("MapsSuggestionsWhenItHappenedKey"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            MapsSuggestionsNow();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "timeIntervalSinceDate:", v37);
            v39 = -v38;

            GEOConfigGetDouble();
            v41 = v40;
            if (v35 <= v39)
            {
              GEOConfigGetDouble();
              v43 = v42;
              GEOConfigGetDouble();
              v41 = v41 + -(v41 - v43) / (v44 - v35) * (v39 - v35);
            }
            objc_msgSend(v33, "setWeight:", v41);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", GEOConfigGetInteger());
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setNumber:forKey:", v45, CFSTR("MapsSuggestionsSinkRankKey"));

          }
          objc_msgSend(v33, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
          MapsSuggestionsLocalizedTitleFormatForStandardResumeRouteEntry(v29);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setString:forKey:", v46, CFSTR("MapsSuggestionsResumeRouteDefaultTitle"));
          if (!-[NSObject length](v6, "length"))
          {
            v47 = v29;

            MapsSuggestionsLocalizedResumeRouteString();
            v48 = objc_claimAutoreleasedReturnValue();

            v46 = v47;
            v6 = v48;
          }
          objc_msgSend(v33, "numberForKey:", CFSTR("MapsSuggestionsRequiredChargeForEVKey"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v33, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsResumingAnEVRoute"), 0) & 1) != 0
            || !v49
            || (objc_msgSend(v49, "floatValue"), v50 == 0.0))
          {
            v51 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v46, v33);
            if (v6)
              v52 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v6, v33);
            else
              v52 = 0;
            v17 = v51 | v52;
          }
          else
          {
            objc_msgSend(v49, "floatValue");
            MapsSuggestionsLocalizedTitleFormatForEVResumeRouteEntryWithChargePercentage(v54);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            MapsSuggestionsLocalizedSubtitleFormatForEVResumeRouteEntry(v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            GEOFindOrCreateLog();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v60;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v56;
              _os_log_impl(&dword_1A427D000, v57, OS_LOG_TYPE_INFO, "Setting title and subtitle when charging: %@, %@", buf, 0x16u);
            }

            objc_msgSend(v33, "setString:forKey:", v60, CFSTR("MapsSuggestionsResumeRouteTitleWhenCharging"));
            objc_msgSend(v33, "setString:forKey:", v56, CFSTR("MapsSuggestionsResumeRouteSubtitleWhenCharging"));
            v58 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v60, v33);
            v59 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v56, v33);

            v17 = v58 | v59;
          }

        }
        else
        {
          GEOFindOrCreateLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v5;
            _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_ERROR, "Entry missing a MapsSuggestionsEntryTitleNameKey: %@", buf, 0xCu);
          }
          v17 = 0;
        }

        goto LABEL_62;
      }
      objc_msgSend(v5, "geoMapItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
      if (!self || !v7)
      {
LABEL_32:

        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setString:forKey:", v28, CFSTR("MapsSuggestionsEntryTitleNameKey"));

        }
        if ((unint64_t)objc_msgSend(v9, "count") < 2)
        {
          v6 = 0;
        }
        else
        {
          objc_msgSend(v9, "lastObject");
          v6 = objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_38;
      }
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        objc_msgSend(v8, "name");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__16;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose__16;
        v63 = 0;
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = ___firstLineOfString_block_invoke_1;
        v61[3] = &unk_1E4BCECA0;
        v61[4] = buf;
        objc_msgSend(v12, "enumerateLinesUsingBlock:", v61);
        v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        if (v13 && objc_msgSend(v13, "length"))
        {
LABEL_20:
          objc_msgSend(v8, "contactName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length") == 0;

          if (v20)
          {
            v21 = v13;
            v13 = 0;
          }
          else
          {
            objc_msgSend(v8, "contactName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          MapsSuggestionsMapItemHomeWorkSchoolName(v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            v24 = v22;

            v21 = v24;
          }
          objc_msgSend(v8, "eventName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length") == 0;

          if (v26)
          {
            v27 = v21;
            v21 = v13;
          }
          else
          {

            objc_msgSend(v8, "eventName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v27, "length"))
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v27, v21, 0);
          else
            v9 = 0;

          goto LABEL_32;
        }
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v8, "shortAddress");
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v18;
      goto LABEL_20;
    }
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      v14 = "Entry missing a MapsSuggestionsWhenItHappenedKey: %@";
      v15 = v6;
      v16 = 12;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v17 = 0;
LABEL_63:

  return v17;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
