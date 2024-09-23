@implementation MapsSuggestionsFlightTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  MapsSuggestionsFlightTitleFormatter *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  MapsSuggestionsFlightTitleFormatter *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  BOOL v39;
  char v40;
  id v41;
  char v42;
  char v44;
  uint64_t v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 15)
  {
    if (qword_1ED22EE90 == -1)
    {
      if (v7)
        goto LABEL_10;
    }
    else
    {
      dispatch_once(&qword_1ED22EE90, &__block_literal_global_0);
      if (v7)
        goto LABEL_10;
    }
    if (objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsETAKey")))
    {
      objc_msgSend(v6, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
LABEL_10:
    if (objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsFlightStatusKey")))
    {
      objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsFlightStatusKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
        v11 = v10;
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }
    v12 = v6;
    if (objc_msgSend(v12, "containsKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey"))
      && (objc_msgSend(v12, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsFlightMapItemIsTerminalKey"), 1) & 1) != 0)
    {
      v13 = CFSTR("MapsSuggestionsFlightFullTargetAirportKey");
    }
    else
    {
      v13 = CFSTR("MapsSuggestionsEntryTitleNameKey");
    }
    objc_msgSend(v12, "stringForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14;
    LODWORD(v16) = MapsSuggestionsFlightUpdateAlreadyThere(v12);
    if ((_DWORD)v16)
    {
      if (objc_msgSend(v12, "hasFullFlightInfoAndGate"))
      {
        objc_msgSend(v12, "stringForKey:", CFSTR("MapsSuggestionsFlightDepartureGateKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsLocalizedFlightGate(v17);
        v45 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "dateForKey:", CFSTR("MapsSuggestionsFlightDepartureTimeKey"));
        v19 = (char)v16;
        v16 = v15;
        v20 = self;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsLocalizedFlightDepatureTime(v18, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v11;
        v11 = (id)v22;

        self = v20;
        v15 = v16;
        LOBYTE(v16) = v19;
        v24 = (void *)v45;

        v25 = 0;
LABEL_28:

        goto LABEL_30;
      }
    }
    else if (v7)
    {
      objc_msgSend(v7, "seconds");
      NSStringFromMapsSuggestionsShortETA(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v27;
      v24 = v15;
      if (v27)
      {
        v24 = v15;
        if (_MergedGlobals_26)
        {
          MapsSuggestionsLocalizedFlightETAString(v27, v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(v7, "trafficString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v25 = 0;
    v24 = v15;
LABEL_30:
    v28 = (unint64_t)v11;
    objc_msgSend(v12, "subtitle");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      objc_msgSend(v12, "subtitle");
      v44 = (char)v16;
      v31 = self;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v12;
      v33 = v25;
      v34 = v6;
      v35 = v24;
      v36 = v15;
      v37 = v7;
      v38 = objc_msgSend(v32, "length") | v28;

      self = v31;
      v39 = v38 == 0;
      v7 = v37;
      v15 = v36;
      v24 = v35;
      v6 = v34;
      v25 = v33;
      v12 = v46;
      v40 = v44;
      if (v39)
        v28 = 0;
      else
        v40 = 1;
      if ((v40 & 1) != 0)
      {
        v41 = (id)v28;
LABEL_41:
        v9 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v12, v24, v41, 1);

        goto LABEL_42;
      }
    }
    else
    {
      if (v28)
        v42 = 1;
      else
        v42 = (char)v16;
      v41 = (id)v28;
      if ((v42 & 1) != 0)
        goto LABEL_41;
    }
    v41 = v25;
    v28 = 0;
    goto LABEL_41;
  }
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightTitleFormatter.m";
    v49 = 1024;
    v50 = 37;
    v51 = 2082;
    v52 = "-[MapsSuggestionsFlightTitleFormatter formatTitlesForEntry:eta:]";
    v53 = 2082;
    v54 = "MapsSuggestionsEntryTypeTravelFlight != entry.type";
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a TravelFlight entry", buf, 0x26u);
  }

  v9 = 0;
LABEL_42:

  return v9;
}

void __64__MapsSuggestionsFlightTitleFormatter_formatTitlesForEntry_eta___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_0;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "FlightTitleFormatter";
  if (qword_1ED22EEA0 != -1)
    dispatch_once(&qword_1ED22EEA0, block);
  v0 = (id)qword_1ED22EE98;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("MAPS_ETA_TO"), CFSTR("%@ to %@<unlocalized>"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v3, &stru_1E4BDFC28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_26;
  _MergedGlobals_26 = v1;

}

@end
