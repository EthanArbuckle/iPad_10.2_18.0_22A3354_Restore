@implementation MapsSuggestionsFlightDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned int v57;
  void *v58;
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v61 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightDeduper.m";
      v62 = 1024;
      v63 = 78;
      v64 = 2082;
      v65 = "-[MapsSuggestionsFlightDeduper dedupeByEnrichingEntry:withEntry:]";
      v66 = 2082;
      v67 = "nil == (originalEntry)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v23, buf, 0x26u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v61 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightDeduper.m";
      v62 = 1024;
      v63 = 79;
      v64 = 2082;
      v65 = "-[MapsSuggestionsFlightDeduper dedupeByEnrichingEntry:withEntry:]";
      v66 = 2082;
      v67 = "nil == (entry)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(15, v5, v6))
    goto LABEL_18;
  v8 = v5;
  v9 = v7;
  -[NSObject uniqueIdentifier](v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {

LABEL_6:
    v13 = v8;
    v14 = v9;
    if (objc_msgSend(v14, "containsKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"))
      && (-[NSObject containsKey:](v13, "containsKey:", CFSTR("MapsSuggestionsFullFlightNumberKey")) & 1) != 0)
    {
      objc_msgSend(v14, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringForKey:](v13, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v17 & 1) != 0)
      {
        v18 = v13;
        v19 = v14;
        objc_msgSend(v19, "originatingSourceName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqualToString:", CFSTR("MapsSuggestionsWalletSource")) & 1) != 0)
        {
          -[NSObject originatingSourceName](v18, "originatingSourceName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("MapsSuggestionsWalletSource"));

          if (!v22)
            goto LABEL_32;
        }
        else
        {

        }
        if ((objc_msgSend(v19, "containsKey:", CFSTR("MapsSuggestionsFlightStatusKey")) & 1) == 0
          && (objc_msgSend(v19, "containsKey:", CFSTR("MapsSuggestionsFlightStatusKey")) & 1) == 0
          && -[NSObject containsKey:](v18, "containsKey:", CFSTR("MapsSuggestionsFlightStatusKey")))
        {
          -[NSObject setNumber:forKey:](v18, "setNumber:forKey:", 0, CFSTR("MapsSuggestionsAlreadyThereKey"));
          v59 = 0;
LABEL_33:

          v46 = -[NSObject hasFullFlightInfoAndGate](v18, "hasFullFlightInfoAndGate");
          -[NSObject dateForKey:](v18, "dateForKey:", CFSTR("MapsSuggestionsFlightDepartureTimeKey"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringForKey:](v18, "stringForKey:", CFSTR("MapsSuggestionsFlightDepartureGateKey"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringForKey:](v18, "stringForKey:", CFSTR("MapsSuggestionsFlightDepartureTerminalKey"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringForKey:](v18, "stringForKey:", CFSTR("MapsSuggestionsFlightStatusKey"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringForKey:](v18, "stringForKey:", CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = -[NSObject BOOLeanForKey:](v18, "BOOLeanForKey:", CFSTR("MapsSuggestionsFlightMapItemIsTerminalKey"));
          v55 = -[NSObject BOOLeanForKey:](v18, "BOOLeanForKey:", CFSTR("MapsSuggestionsFlightMapItemIsGateKey"));
          LOWORD(v52) = 256;
          -[NSObject mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:](v18, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v19, v59, 0, 1, 0, 0, v52);
          if (v46)
          {
            -[NSObject setDate:forKey:](v18, "setDate:forKey:", v47, CFSTR("MapsSuggestionsFlightDepartureTimeKey"));
            -[NSObject setString:forKey:](v18, "setString:forKey:", v48, CFSTR("MapsSuggestionsFlightDepartureGateKey"));
            -[NSObject setString:forKey:](v18, "setString:forKey:", v49, CFSTR("MapsSuggestionsFlightDepartureTerminalKey"));
            -[NSObject setString:forKey:](v18, "setString:forKey:", v50, CFSTR("MapsSuggestionsFlightStatusKey"));
            -[NSObject setString:forKey:](v18, "setString:forKey:", v51, CFSTR("MapsSuggestionsFlightFullTargetAirportKey"));
            -[NSObject setBoolean:forKey:](v18, "setBoolean:forKey:", v57, CFSTR("MapsSuggestionsFlightMapItemIsTerminalKey"));
            -[NSObject setBoolean:forKey:](v18, "setBoolean:forKey:", v55, CFSTR("MapsSuggestionsFlightMapItemIsGateKey"));
          }

          goto LABEL_25;
        }
LABEL_32:
        v59 = 1;
        goto LABEL_33;
      }
    }
    else
    {

    }
    -[NSObject replaceByEntry:](v13, "replaceByEntry:", v14);
LABEL_25:
    v24 = 1;
    goto LABEL_19;
  }
  -[NSObject stringForKey:](v8, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "invertedSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v26;
  objc_msgSend(v26, "componentsSeparatedByCharactersInSet:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", &stru_1E4BDFC28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "invertedSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v31;
  objc_msgSend(v31, "componentsSeparatedByCharactersInSet:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "componentsJoinedByString:", &stru_1E4BDFC28);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v30, "isEqualToString:", v36))
  {

    goto LABEL_17;
  }
  -[NSObject stringForKey:](v8, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "invertedSet");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "componentsSeparatedByCharactersInSet:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "componentsJoinedByString:", &stru_1E4BDFC28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "invertedSet");
  v54 = v30;
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "componentsSeparatedByCharactersInSet:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "componentsJoinedByString:", &stru_1E4BDFC28);
  v53 = v34;
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v43) = objc_msgSend(v40, "isEqualToString:", v45);
  if ((_DWORD)v43)
    goto LABEL_6;
LABEL_18:
  v24 = 0;
LABEL_19:

  return v24;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
