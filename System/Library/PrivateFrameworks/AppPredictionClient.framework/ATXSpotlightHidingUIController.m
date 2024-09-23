@implementation ATXSpotlightHidingUIController

- (BOOL)shouldHideSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v19;
  __CFString *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  __CFString *v31;
  void *v32;
  int v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  __atxlog_handle_zkw_hide();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sectionBundleIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "shouldHideSearchResult searchResult.sectionBundleIdentifier:%@", buf, 0xCu);

  }
  objc_msgSend(v4, "sectionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.recents"));

  if (v10)
  {
    __atxlog_handle_zkw_hide();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = CFSTR("com.apple.spotlight.dec.zkw.recents");
      v12 = "shouldHideSearchResult NO in %@";
      v13 = v11;
      v14 = 12;
LABEL_9:
      _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "sectionBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

  if (v16)
  {
    __atxlog_handle_zkw_hide();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "shouldHideSearchResult NO in com.apple.searchd.suggestions";
      v13 = v11;
      v14 = 2;
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(v17) = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "proactiveSuggestion"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v19;
    -[ATXSpotlightHidingUIController _identifierWithSuggestion:](self, "_identifierWithSuggestion:", v19);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "hasBeenHiddenEntityWithIdentifier:", v20);
    __atxlog_handle_zkw_hide();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject uiSpecification](v11, "uiSpecification");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v20;
      v51 = 2112;
      v52 = v24;
      v53 = 1024;
      v54 = v21;
      _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "hasBeenHiddenEntityWithIdentifier:%@ for suggestion:%@ hidden=%{BOOL}d", buf, 0x1Cu);

    }
    if ((v21 & 1) != 0)
    {
      LOBYTE(v17) = 1;
    }
    else
    {
      v17 = objc_msgSend(v5, "contextHasBeenHiddenForSuggestion:", v11);
      __atxlog_handle_zkw_hide();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject uiSpecification](v11, "uiSpecification");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "title");
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v39;
        v51 = 1024;
        LODWORD(v52) = v17;
        _os_log_impl(&dword_1A49EF000, v37, OS_LOG_TYPE_DEFAULT, "contextHasBeenHiddenForSuggestion :%@ hidden=%{BOOL}d", buf, 0x12u);

      }
    }

  }
  else
  {
    getSPSearchSuggestionResultClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v6;
      v43 = v4;
      v41 = v4;
      -[NSObject searchEntities](v41, "searchEntities");
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            -[ATXSpotlightHidingUIController _identifierWithEntity:](self, "_identifierWithEntity:", v30);
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v32 = v5;
            v33 = objc_msgSend(v5, "hasBeenHiddenEntityWithIdentifier:", v31);
            __atxlog_handle_zkw_hide();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v50 = v31;
              v51 = 2112;
              v52 = v30;
              v53 = 1024;
              v54 = v33;
              _os_log_impl(&dword_1A49EF000, v34, OS_LOG_TYPE_DEFAULT, "hasBeenHiddenEntityWithIdentifier:%@ for entity:%@ hidden=%{BOOL}d", buf, 0x1Cu);
            }

            if ((v33 & 1) != 0)
            {

              LOBYTE(v17) = 1;
              v5 = v32;
              v11 = v41;
              v6 = v42;
              goto LABEL_37;
            }
            v5 = v32;
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v27)
            continue;
          break;
        }
      }

      v11 = v41;
      v6 = v42;
      LOBYTE(v17) = -[ATXSpotlightHidingUIController _contextHasBeenHiddenForSearchResult:adapter:feedbackManager:](self, "_contextHasBeenHiddenForSearchResult:adapter:feedbackManager:", v41, v42, v5);
LABEL_37:

      v4 = v43;
    }
    else
    {
      -[ATXSpotlightHidingUIController _identifierWithSearchResult:](self, "_identifierWithSearchResult:", v4);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject length](v11, "length"))
      {
        __atxlog_handle_zkw_hide();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          -[ATXSpotlightHidingUIController shouldHideSearchResult:].cold.1();

        goto LABEL_10;
      }
      v35 = objc_msgSend(v5, "hasBeenHiddenEntityWithIdentifier:", v11);
      __atxlog_handle_zkw_hide();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v50 = (const __CFString *)v11;
        v51 = 1024;
        LODWORD(v52) = v35;
        _os_log_impl(&dword_1A49EF000, v36, OS_LOG_TYPE_DEFAULT, "hasBeenHiddenEntityWithIdentifier resultIdentifier:%@ hidden=%{BOOL}d", buf, 0x12u);
      }

      LOBYTE(v17) = (v35 & 1) != 0
                 || -[ATXSpotlightHidingUIController _contextHasBeenHiddenForSearchResult:adapter:feedbackManager:](self, "_contextHasBeenHiddenForSearchResult:adapter:feedbackManager:", v4, v6, v5)|| -[ATXSpotlightHidingUIController _autoShortcutHasBeenHiddenForSearchResult:withFeedbackManager:](self, "_autoShortcutHasBeenHiddenForSearchResult:withFeedbackManager:", v4, v5);
    }
  }
LABEL_11:

  return v17;
}

- (BOOL)_contextHasBeenHiddenForSearchResult:(id)a3 adapter:(id)a4 feedbackManager:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  int v15;
  NSObject *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  -[NSObject sectionBundleIdentifier](v7, "sectionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "contextCodeIdentifierWithSectionBundleIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "contextHasBeenHiddenForContextIdentifier:", v11);
    __atxlog_handle_zkw_hide();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v11;
      v17 = 1024;
      v18 = v12;
      _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "contextHasBeenHiddenForContextIdentifier :%@ hidden=%{BOOL}d", (uint8_t *)&v15, 0x12u);
    }

  }
  else
  {
    __atxlog_handle_zkw_hide();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightHidingUIController contextHasBeenHiddenForSearchResult:%@ sectionBundleIdentifier is NIL hidden=NO", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)_autoShortcutHasBeenHiddenForSearchResult:(id)a3 withFeedbackManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getSPSearchSuggestionResultClass();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_msgSend(v5, "sectionBundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut")),
        v7,
        v8))
  {
    objc_msgSend(v5, "relatedAppIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "applicationBundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "autoShortcutHasBeenHiddenForIdentifier:", v12);

  __atxlog_handle_zkw_hide();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v16;
    v20 = 1024;
    v21 = v13;
    _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "autoShortcutHasBeenHiddenForSearchResult :%@ hidden=%{BOOL}d", (uint8_t *)&v18, 0x12u);

  }
  return v13;
}

- (id)_identifierWithSearchResult:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  int v8;
  NSObject *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  int v28;
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "normalizedTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "normalizedTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "queryType");
    switch(v8)
    {
      case 3:
        __atxlog_handle_zkw_hide();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "query");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412290;
          *(_QWORD *)v29 = v17;
          _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult kSFQueryTopicTypeSports identifier queryTopic.query=%@", (uint8_t *)&v28, 0xCu);

        }
        objc_msgSend(v7, "query");
        v18 = objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        objc_msgSend(v7, "query");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXSpotlightHidingUIController _nearbySuggestionIdentifierWithName:](self, "_nearbySuggestionIdentifierWithName:", v19);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_zkw_hide();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412290;
          *(_QWORD *)v29 = v10;
          _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult kSFQueryTopicTypeRelatePOI identifier =%@", (uint8_t *)&v28, 0xCu);
        }

        goto LABEL_29;
      case 4:
        __atxlog_handle_zkw_hide();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412290;
          *(_QWORD *)v29 = CFSTR("zkw.hiding.topic.weather");
          _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult kSFQueryTopicTypeWeather queryTopic weather identifier %@", (uint8_t *)&v28, 0xCu);
        }

        v10 = CFSTR("zkw.hiding.topic.weather");
        goto LABEL_29;
      default:
        __atxlog_handle_zkw_hide();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v7, "queryType");
          objc_msgSend(v4, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 67109378;
          v29[0] = v22;
          LOWORD(v29[1]) = 2112;
          *(_QWORD *)((char *)&v29[1] + 2) = v23;
          _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult queryTopic.queryType=%d default identifier %@", (uint8_t *)&v28, 0x12u);

        }
        objc_msgSend(v4, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");

        if (!v25)
        {
          __atxlog_handle_zkw_hide();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[ATXSpotlightHidingUIController _identifierWithSearchResult:].cold.1();

        }
        objc_msgSend(v4, "identifier");
        v18 = objc_claimAutoreleasedReturnValue();
        break;
    }
    v10 = (__CFString *)v18;
LABEL_29:

    goto LABEL_30;
  }
  __atxlog_handle_zkw_hide();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    *(_QWORD *)v29 = v12;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult default identifier %@", (uint8_t *)&v28, 0xCu);

  }
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
    __atxlog_handle_zkw_hide();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _identifierWithSearchResult:].cold.1();

  }
  objc_msgSend(v4, "identifier");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v10;
}

- (id)_identifierWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "normalizedIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_zkw_hide();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v8;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableSpecification = %@", (uint8_t *)&v27, 0xCu);
  }

  objc_msgSend(v8, "executableObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_zkw_hide();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v10;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableObject=%@", (uint8_t *)&v27, 0xCu);
  }

  if (objc_msgSend(v7, "hasPrefix:", CFSTR("is.workflow.actions.openurl")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
      objc_msgSend(v12, "contextualAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "associatedAppBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_zkw_hide();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412290;
        v28 = v14;
        _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: bundleIdentifier = %@", (uint8_t *)&v27, 0xCu);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
      {
        objc_msgSend(v13, "url");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_lp_simplifiedDisplayString");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_zkw_hide();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138412546;
          v28 = v16;
          v29 = 2112;
          v30 = v17;
          _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: url = %@ urlIdentifier=%@", (uint8_t *)&v27, 0x16u);
        }

        if (!objc_msgSend(v17, "length"))
        {
          __atxlog_handle_zkw_hide();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[ATXSpotlightHidingUIController _identifierWithSuggestion:].cold.1();

        }
      }
      else
      {
        v17 = v14;
      }

LABEL_29:
      goto LABEL_30;
    }
  }
  if (-[ATXSpotlightHidingUIController _isExecutableIdentifierRecognized:](self, "_isExecutableIdentifierRecognized:", v7))
  {
    __atxlog_handle_zkw_hide();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableIdentifier %@ is recognized. Using it", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v10;
    __atxlog_handle_zkw_hide();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "bundleId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v22;
      _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: default ATXAction identifier=bundleId=%@", (uint8_t *)&v27, 0xCu);

    }
    objc_msgSend(v12, "bundleId");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v7, "length"))
      goto LABEL_22;
    __atxlog_handle_zkw_hide();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _identifierWithSuggestion:].cold.2();
LABEL_21:

LABEL_22:
    v17 = v7;
    goto LABEL_30;
  }
  objc_msgSend(v10, "clipMetadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clipName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXSpotlightHidingUIController _nearbySuggestionIdentifierWithName:](self, "_nearbySuggestionIdentifierWithName:", v25);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_zkw_hide();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v17;
    _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: ATXHeroData identifier with heroData.clipMetadata.clipName=%@", (uint8_t *)&v27, 0xCu);
  }

LABEL_30:
  return v17;
}

- (id)_identifierWithEntity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  getSPSearchContactEntityClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_11;
  }
  v4 = v3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v6;
    goto LABEL_10;
  }
  objc_msgSend(v4, "personIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "personIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "personQueryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "personQueryIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

LABEL_11:
  if (!objc_msgSend(v7, "length"))
  {
    __atxlog_handle_zkw_hide();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _identifierWithEntity:].cold.1();

  }
  return v7;
}

- (void)addHidingPreviewButtonItemsToServerResultSections:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  int v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v42 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "addHidingPreviewButtonItemsToServerResultSections %lu sections", buf, 0xCu);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.recents")) & 1) == 0)
        {
          objc_msgSend(v7, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"));

          if ((v10 & 1) != 0)
            goto LABEL_18;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v7, "results");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v31 != v13)
                  objc_enumerationMutation(v8);
                -[ATXSpotlightHidingUIController _addHidingPreviewButtonItemsToSearchResult:](self, "_addHidingPreviewButtonItemsToSearchResult:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
              }
              v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            }
            while (v12);
          }
        }

LABEL_18:
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "results");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
              objc_msgSend(v20, "sectionBundleIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"));

              if (v22)
                -[ATXSpotlightHidingUIController _addHidingButtonToAutoShortcut:](self, "_addHidingButtonToAutoShortcut:", v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v17);
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v25);
  }

}

- (void)_addHidingButtonToAutoShortcut:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "shouldUseCompactDisplay")
    && (objc_msgSend(v4, "compactCard"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "compactCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "inlineCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "cardSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXSpotlightHidingUIController _makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:ForResult:](self, "_makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:ForResult:", 1, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightHidingUIController _makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:ForResult:](self, "_makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:ForResult:", 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewButtonItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "previewButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreviewButtonItems:", v14);

  }
  else
  {
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreviewButtonItems:", v13);
  }

  objc_msgSend(v9, "trailingSwipeButtonItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v9, "trailingSwipeButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObject:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTrailingSwipeButtonItems:", v17);

  }
  else
  {
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTrailingSwipeButtonItems:", v16);
  }

}

- (id)_makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:(BOOL)a3 ForResult:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("HIDE"), &stru_1E4D5DB30, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(CFSTR("_relatedAppIdentifier"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "valueForKey:", CFSTR("_relatedAppIdentifier"));
  else
    objc_msgSend(v6, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("HIDE_ALL_APP_SHORTCUT_SUGGESTIONS"), &stru_1E4D5DB30, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (v4)
    v15 = v14;
  else
    v15 = v8;
  v16 = v15;
  if (v4)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setSymbolName:", CFSTR("hand.thumbsdown"));
    objc_msgSend(v17, "setIsTemplate:", 1);
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setCategory:", 2);
  objc_msgSend(v18, "setShouldClearWholeSection:", v4);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setTitle:", v16);
  objc_msgSend(v19, "setImage:", v17);
  objc_msgSend(v19, "setCommand:", v18);
  objc_msgSend(v19, "setIsDestructive:", 1);

  return v19;
}

- (void)_addHidingPreviewButtonItemsToSearchResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = (uint64_t)v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "inlineCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "proactiveSuggestion"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    -[NSObject uiSpecification](v9, "uiSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "predictionReasons");

    if (v12)
    {
      -[NSObject executableSpecification](v10, "executableSpecification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_zkw_hide();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v13;
        _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: executableSpecification = %@", buf, 0xCu);
      }

      objc_msgSend(v13, "executableObject");
      v15 = objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightHidingUIController _identifierWithSuggestion:](self, "_identifierWithSuggestion:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v13;
      objc_msgSend(v13, "executableIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "hasPrefix:", CFSTR("is.workflow.actions.openurl")))
      {
        objc_opt_class();
        v18 = (void *)v15;
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v20 = v18;
          v49 = v18;
          objc_msgSend(v49, "contextualAction");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "associatedAppBundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v47 = v22;
          v48 = v21;
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
          {
            objc_msgSend(v21, "url");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            __atxlog_handle_zkw_hide();
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v50;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = (uint64_t)v46;
              _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: url = %@", buf, 0xCu);
            }

            -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithURL:identifier:context:](self, "_hidingPreviewButtonItemsWithURL:identifier:context:", v46, v16, v12);
            v25 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            __atxlog_handle_zkw_hide();
            v35 = objc_claimAutoreleasedReturnValue();
            v24 = v50;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = (uint64_t)v16;
              _os_log_impl(&dword_1A49EF000, v35, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: bundleIdentifier = %@", buf, 0xCu);
            }

            -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithBundleIdentifier:context:](self, "_hidingPreviewButtonItemsWithBundleIdentifier:context:", v16, v12);
            v25 = objc_claimAutoreleasedReturnValue();
          }

LABEL_44:
          goto LABEL_45;
        }
      }
      else
      {
        v18 = (void *)v15;

      }
      if (-[ATXSpotlightHidingUIController _isExecutableIdentifierRecognized:](self, "_isExecutableIdentifierRecognized:", v16))
      {
        __atxlog_handle_zkw_hide();
        v33 = objc_claimAutoreleasedReturnValue();
        v20 = v18;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = (uint64_t)v16;
          _os_log_impl(&dword_1A49EF000, v33, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableIdentifier %@ is recognized. Using it", buf, 0xCu);
        }

      }
      else
      {
        objc_opt_class();
        v20 = v18;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v49 = v18;
          __atxlog_handle_zkw_hide();
          v34 = objc_claimAutoreleasedReturnValue();
          v24 = v50;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = (uint64_t)v49;
            _os_log_impl(&dword_1A49EF000, v34, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: default action=%@", buf, 0xCu);
          }

          -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithBundleIdentifier:context:](self, "_hidingPreviewButtonItemsWithBundleIdentifier:context:", v16, v12);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
      }
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:](self, "_hidingPreviewButtonItemsWithExecutableIdentifier:context:", v16, v12);
      v25 = objc_claimAutoreleasedReturnValue();
      v24 = v50;
LABEL_45:

      goto LABEL_46;
    }
    __atxlog_handle_zkw_hide();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject uiSpecification](v10, "uiSpecification");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "title");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = (uint64_t)v32;
      _os_log_impl(&dword_1A49EF000, v30, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: suggestion %@ has context ATXSuggestionPredictionReasonUnknown. Skipping", buf, 0xCu);

    }
  }
  else
  {
    getSPSearchSuggestionResultClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
      -[NSObject searchEntities](v10, "searchEntities");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count") != 1)
      {
        __atxlog_handle_zkw_hide();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[ATXSpotlightHidingUIController _addHidingPreviewButtonItemsToSearchResult:].cold.1(v24, v29);

        -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:](self, "_hidingPreviewButtonItemsWithExecutableIdentifier:context:", CFSTR("result class not handled"), 0);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      objc_msgSend(v24, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_zkw_hide();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v20;
        _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: SPSearchSuggestionResult entity=%@", buf, 0xCu);
      }

      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithSearchResult:entity:](self, "_hidingPreviewButtonItemsWithSearchResult:entity:", v10, v20);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_46:

LABEL_47:
      goto LABEL_48;
    }
    objc_msgSend(v4, "normalizedTopic");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) != 0)
    {
      objc_msgSend(v4, "normalizedTopic");
      v10 = objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithSearchResult:queryTopic:](self, "_hidingPreviewButtonItemsWithSearchResult:queryTopic:", v4, v10);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_48:

      __atxlog_handle_zkw_hide();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v25;
        _os_log_impl(&dword_1A49EF000, v36, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: SPSearchSuggestionResult previewButtonItems=%@", buf, 0xCu);
      }

      -[ATXSpotlightHidingUIController _addSwipeButtonItemToCardSection:previewButtonItems:](self, "_addSwipeButtonItemToCardSection:previewButtonItems:", v8, v25);
      -[ATXSpotlightHidingUIController _subMenuButtonItemWithItems:](self, "_subMenuButtonItemWithItems:", v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "previewButtonItems");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      __atxlog_handle_zkw_hide();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v41)
        {
          objc_msgSend(v8, "previewButtonItems");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "count");
          *(_DWORD *)buf = 134217984;
          v53 = v43;
          _os_log_impl(&dword_1A49EF000, v40, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: %lu previous buttons", buf, 0xCu);

        }
        objc_msgSend(v8, "previewButtonItems");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "arrayByAddingObject:", v37);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPreviewButtonItems:", v45);

      }
      else
      {
        if (v41)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A49EF000, v40, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: no previous button", buf, 2u);
        }

        v51 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPreviewButtonItems:", v44);
      }

      v10 = v25;
      goto LABEL_58;
    }
    __atxlog_handle_zkw_hide();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _addHidingPreviewButtonItemsToSearchResult:].cold.2(v4, v10);
  }
LABEL_58:

}

- (void)_addSwipeButtonItemToCardSection:(id)a3 previewButtonItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DONT_SUGGEST_"), &stru_1E4D5DB30, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);
  objc_msgSend(v7, "setIsDestructive:", 1);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCommand:", v10);

  objc_msgSend(v7, "setPreviewButtonItems:", v6);
  objc_msgSend(v5, "previewButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v5, "previewButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrailingSwipeButtonItems:", v14);

  }
  else
  {
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrailingSwipeButtonItems:", v13);
  }

}

- (id)_subMenuButtonItemWithItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DONT_SUGGEST_"), &stru_1E4D5DB30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSymbolName:", CFSTR("hand.thumbsdown"));
  objc_msgSend(v4, "setImage:", v7);
  objc_msgSend(v4, "setPreviewButtonItems:", v3);

  return v4;
}

- (id)_hidingPreviewButtonItemsWithBundleIdentifier:(id)a3 context:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_zkw_hide();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithBundleIdentifier:%@", (uint8_t *)&v14, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  -[ATXSpotlightHidingUIController _actionTypeButtonItemWithBundleIdentifier:](self, "_actionTypeButtonItemWithBundleIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "addObject:", v9);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithBundleIdentifier:context:].cold.1();

  }
  -[ATXSpotlightHidingUIController _hideContextButtonItemWithReasons:](self, "_hideContextButtonItemWithReasons:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "addObject:", v11);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithBundleIdentifier:%@ dontSuggestContextButtonItem is nil", (uint8_t *)&v14, 0xCu);
    }

  }
  return v8;
}

- (id)_hidingPreviewButtonItemsWithExecutableIdentifier:(id)a3 context:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_zkw_hide();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithExecutableIdentifier:%@", (uint8_t *)&v15, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "normalizedIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ATXSpotlightHidingUIController _shouldAddHidingButtonItemForExecutableIdentifier:](self, "_shouldAddHidingButtonItemForExecutableIdentifier:", v9))
  {
    -[ATXSpotlightHidingUIController _actionTypeButtonItemWithExecutableIdentifier:](self, "_actionTypeButtonItemWithExecutableIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "addObject:", v10);
    }
    else
    {
      __atxlog_handle_zkw_hide();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:].cold.2();

    }
  }
  -[ATXSpotlightHidingUIController _hideContextButtonItemWithReasons:](self, "_hideContextButtonItemWithReasons:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "addObject:", v12);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:].cold.1();

  }
  return v8;
}

- (id)_hidingPreviewButtonItemsWithURL:(id)a3 identifier:(id)a4 context:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  __atxlog_handle_zkw_hide();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithURL:%@", (uint8_t *)&v17, 0xCu);
  }

  v11 = (void *)objc_opt_new();
  -[ATXSpotlightHidingUIController _hideWebsiteButtonItemWithIdentifier:](self, "_hideWebsiteButtonItemWithIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "addObject:", v12);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithURL:identifier:context:].cold.2();

  }
  -[ATXSpotlightHidingUIController _hideContextButtonItemWithReasons:](self, "_hideContextButtonItemWithReasons:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "addObject:", v14);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithURL:identifier:context:].cold.1();

  }
  return v11;
}

- (id)_localizedTitleWithQueryTopic:(id)a3
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "queryType");
  if (v5 == 3)
  {
    v6 = CFSTR("DONT_SUGGEST_GAME");
  }
  else
  {
    if (v5 != 4)
    {
      objc_msgSend(v3, "query");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = CFSTR("DONT_SUGGEST_WEATHER");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E4D5DB30, 0);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (id)_symbolNameWithQueryTopic:(id)a3
{
  int v3;
  const __CFString *v4;

  v3 = objc_msgSend(a3, "queryType");
  v4 = CFSTR("sportscourt");
  if (v3 != 3)
    v4 = 0;
  if (v3 == 4)
    return CFSTR("sun.max");
  else
    return (id)v4;
}

- (id)_hidingPreviewButtonItemsWithSearchResult:(id)a3 queryTopic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[ATXSpotlightHidingUIController _identifierWithSearchResult:](self, "_identifierWithSearchResult:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  __atxlog_handle_zkw_hide();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithSearchResult(queryTopic):%@ queryTopic:%@", (uint8_t *)&v17, 0x16u);
    }

    -[ATXSpotlightHidingUIController _localizedTitleWithQueryTopic:](self, "_localizedTitleWithQueryTopic:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    -[ATXSpotlightHidingUIController _symbolNameWithQueryTopic:](self, "_symbolNameWithQueryTopic:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSpotlightHidingUIController _hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:](self, "_hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:", v9, v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "addObject:", v14);
    }
    else
    {
      __atxlog_handle_zkw_hide();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:].cold.2();

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithSearchResult:queryTopic:].cold.1();
  }

  -[ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:toButtonItems:](self, "_addHideContextButtonItemForSearchResult:toButtonItems:", v6, v8);
  return v8;
}

- (id)_hidingPreviewButtonItemsWithSearchResult:(id)a3 entity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_zkw_hide();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithSearchResult entity:%@", (uint8_t *)&v13, 0xCu);
  }

  v9 = (void *)objc_opt_new();
  -[ATXSpotlightHidingUIController _entityButtonItemWithWithSearchEntity:](self, "_entityButtonItemWithWithSearchEntity:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "addObject:", v10);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithSearchResult:entity:].cold.1();

  }
  -[ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:toButtonItems:](self, "_addHideContextButtonItemForSearchResult:toButtonItems:", v7, v9);

  return v9;
}

- (void)_addHideContextButtonItemForSearchResult:(id)a3 toButtonItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_opt_new();
    -[NSObject contextCodeIdentifierWithSectionBundleIdentifier:](v9, "contextCodeIdentifierWithSectionBundleIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_zkw_hide();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithSearchResult sectionBundleIdentifier=%@ contextCode=%@", (uint8_t *)&v14, 0x16u);
    }

    -[ATXSpotlightHidingUIController _hideContextButtonItemWithContextIdentifier:](self, "_hideContextButtonItemWithContextIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v7, "addObject:", v12);
    }
    else
    {
      __atxlog_handle_zkw_hide();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:toButtonItems:].cold.2();

    }
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:toButtonItems:].cold.1();
  }

}

- (id)_entityButtonItemWithWithSearchEntity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getSPSearchContactEntityClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NSObject name](v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[ATXSpotlightHidingUIController _identifierWithEntity:](self, "_identifierWithEntity:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v7, "length"))
      {
        -[ATXSpotlightHidingUIController _hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:](self, "_hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:", v7, v6, CFSTR("person"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      __atxlog_handle_zkw_hide();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXSpotlightHidingUIController _entityButtonItemWithWithSearchEntity:].cold.2();

    }
    else
    {
      __atxlog_handle_zkw_hide();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[ATXSpotlightHidingUIController _entityButtonItemWithWithSearchEntity:].cold.1();
    }
    v8 = 0;
    goto LABEL_14;
  }
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "_entityButtonItemWithWithSearchEntity:%@ not a SPSearchContactEntity", (uint8_t *)&v11, 0xCu);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)_actionTypeButtonItemWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXSpotlightHidingUIController _hideActionTitleWithBundleIdentifier:](self, "_hideActionTitleWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightHidingUIController _hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:](self, "_hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:", v4, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_actionTypeButtonItemWithExecutableIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(&unk_1E4DC2EB8, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightHidingUIController _hideActionTitleWithExecutableIdentifier:](self, "_hideActionTitleWithExecutableIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[ATXSpotlightHidingUIController _hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:](self, "_hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:", v4, v6, v5, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _actionTypeButtonItemWithExecutableIdentifier:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)_hideWebsiteButtonItemWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONT_SUGGEST_URL"), &stru_1E4D5DB30, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightHidingUIController _hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:](self, "_hidingCommandButtonItemWithIdentifier:title:symbolName:isAction:", v5, v7, CFSTR("globe"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_hidingCommandButtonItemWithIdentifier:(id)a3 title:(id)a4 symbolName:(id)a5 isAction:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTitle:", v10);

  if (objc_msgSend(v9, "length"))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setSymbolName:", v9);
    objc_msgSend(v13, "setIsTemplate:", 1);
    objc_msgSend(v12, "setImage:", v13);

  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setProactiveIdentifier:", v11);

  if (v6)
    v15 = 4;
  else
    v15 = 5;
  objc_msgSend(v14, "setCategory:", v15);
  objc_msgSend(v14, "setShouldClearWholeSection:", 0);
  objc_msgSend(v12, "setCommand:", v14);

  return v12;
}

- (id)_hideContextButtonItemWithReasons:(unint64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  -[ATXSpotlightHidingUIController _contextIdentifierWithPredictionReasons:](self, "_contextIdentifierWithPredictionReasons:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ATXSpotlightHidingUIController _hideContextButtonItemWithContextIdentifier:](self, "_hideContextButtonItemWithContextIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hideContextButtonItemWithReasons:].cold.1();

    v5 = 0;
  }

  return v5;
}

- (id)_hideContextButtonItemWithContextIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (!v4)
  {
    __atxlog_handle_zkw_hide();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hideContextButtonItemWithContextIdentifier:].cold.1();

    goto LABEL_7;
  }
  if (!-[ATXSpotlightHidingUIController _shouldAddHidingButtonItemForContextIdentifier:](self, "_shouldAddHidingButtonItemForContextIdentifier:", v4))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = (void *)objc_opt_new();
  -[ATXSpotlightHidingUIController _hideContextSymbolImageWithContextIdentifier:](self, "_hideContextSymbolImageWithContextIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightHidingUIController _hideContextActionTitleWithContextIdentifier:](self, "_hideContextActionTitleWithContextIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);
  objc_msgSend(v5, "setImage:", v6);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setCategory:", 3);
  objc_msgSend(v8, "setShouldClearWholeSection:", 1);
  objc_msgSend(v8, "setProactiveIdentifier:", v4);
  objc_msgSend(v5, "setCommand:", v8);
  objc_msgSend(v5, "setIsDestructive:", 0);

LABEL_8:
  return v5;
}

- (id)_contextIdentifierWithPredictionReasons:(unint64_t)a3
{
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  if (objc_msgSend((id)v6[5], "count") == 1)
  {
    objc_msgSend((id)v6[5], "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __74__ATXSpotlightHidingUIController__contextIdentifierWithPredictionReasons___block_invoke(uint64_t a1)
{
  id v2;

  stringForATXSuggestionPredictionReasonCode();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);

}

- (BOOL)_shouldAddHidingButtonItemForExecutableIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXSpotlightHidingUIController _excludedFronHindingExecutableidentifiers](self, "_excludedFronHindingExecutableidentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);
  if (v6)
  {
    __atxlog_handle_zkw_hide();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "_shouldAddHidingButtonItemForExecutableIdentifier: no hiding button item shown for executableIdentifier %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6 ^ 1;
}

- (id)_excludedFronHindingExecutableidentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("openPackageTrackingUrl"), CFSTR("contactPhoneNumber"), CFSTR("openUrl"), CFSTR("returnCall"), CFSTR("setAlarmForUnusualEarlyEvents"), 0);
}

- (BOOL)_shouldAddHidingButtonItemForContextIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("UpcomingMedia"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);
  if (v5)
  {
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "_shouldAddHidingButtonItemForExecutableIdentifier: no hiding button item shown for contextIdentifier %@", buf, 0xCu);
    }

  }
  return v5 ^ 1;
}

- (id)_hideActionTitleWithBundleIdentifier:(id)a3
{
  return +[ATXApplicationRecord localizedNameForBundle:](ATXApplicationRecord, "localizedNameForBundle:", a3);
}

- (id)_nearbySuggestionIdentifierWithName:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(CFSTR("zkw.hiding.nearby:"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _nearbySuggestionIdentifierWithName:].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)_nameWithNearbySuggestionIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("zkw.hiding.nearby:")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("zkw.hiding.nearby:"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = CFSTR("zkw.hiding.nearby:");
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "_nameWithNearbySuggestionIdentifier %@ is not prefixed by %@", (uint8_t *)&v7, 0x16u);
    }

    v4 = 0;
  }

  return v4;
}

- (id)_localizableKeyWithExecutableIdentifier:(id)a3
{
  return (id)objc_msgSend(&unk_1E4DC2EE0, "objectForKey:", a3);
}

- (BOOL)_isExecutableIdentifierRecognized:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXSpotlightHidingUIController _excludedFronHindingExecutableidentifiers](self, "_excludedFronHindingExecutableidentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[ATXSpotlightHidingUIController _localizableKeyWithExecutableIdentifier:](self, "_localizableKeyWithExecutableIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  __atxlog_handle_zkw_hide();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 1024;
    v14 = v7;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "isExecutableIdentifierRecognized: %@ = %{BOOL}i", (uint8_t *)&v11, 0x12u);
  }

  return v7;
}

- (id)_hideActionTitleWithExecutableIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightHidingUIController _nameWithNearbySuggestionIdentifier:](self, "_nameWithNearbySuggestionIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    -[ATXSpotlightHidingUIController _localizableKeyWithExecutableIdentifier:](self, "_localizableKeyWithExecutableIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_1E4D5DB30, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      __atxlog_handle_zkw_hide();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXSpotlightHidingUIController _hideActionTitleWithExecutableIdentifier:].cold.1();

    }
    v7 = v9;

  }
  return v7;
}

- (id)_hideContextActionTitleWithContextIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v3 = a3;
  objc_msgSend(&unk_1E4DC2F08, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E4D5DB30, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_zkw_hide();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hideContextActionTitleWithContextIdentifier:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No title for %@"), v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_hideContextSymbolImageWithContextIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(&unk_1E4DC2F30, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setSymbolName:", v4);
    objc_msgSend(v5, "setIsTemplate:", 1);
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightHidingUIController _hideContextSymbolImageWithContextIdentifier:].cold.1();

    v5 = 0;
  }

  return v5;
}

+ (id)normalizedIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(&unk_1E4DC2D38, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(&unk_1E4DC2D38);
      v5 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend(v3, "hasPrefix:", v5) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(&unk_1E4DC2D38, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        v5 = v3;
        break;
      }
    }
  }
  v9 = v5;

  return v9;
}

- (void)shouldHideSearchResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "hasBeenHiddenEntityWithIdentifier _identifierWithSearchResult returns empty result. hidden = NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_identifierWithSearchResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightHidingUIController_identifierWithSearchResult EMPTY for search result %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_identifierWithSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightHidingUIController _identifierWithSuggestion EMPTY for url %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_identifierWithSuggestion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightHidingUIController _identifierWithSuggestion EMPTY for suggestion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_identifierWithEntity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightHidingUIController _identifierWithEntity EMPTY for searchEntity %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addHidingPreviewButtonItemsToSearchResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "_addHidingPreviewButtonItemsToSearchResult: searchSuggestionResult has %lu searchEntities", v3, 0xCu);
}

- (void)_addHidingPreviewButtonItemsToSearchResult:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "normalizedTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "normalizedTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = objc_opt_class();
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "_addHidingPreviewButtonItemsToSearchResult not implemented for normalized topic %@ of class %@", (uint8_t *)&v6, 0x16u);

}

- (void)_hidingPreviewButtonItemsWithBundleIdentifier:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithBundleIdentifier:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hidingPreviewButtonItemsWithExecutableIdentifier:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithExecutableIdentifier:%@ dontSuggestContextButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hidingPreviewButtonItemsWithExecutableIdentifier:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithExecutableIdentifier:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hidingPreviewButtonItemsWithURL:identifier:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithURL:%@ dontSuggestContextButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hidingPreviewButtonItemsWithURL:identifier:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithURL:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hidingPreviewButtonItemsWithSearchResult:queryTopic:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithSearchResult _identifierWithSearchResult returns empty result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_hidingPreviewButtonItemsWithSearchResult:entity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithSearchResult entity:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addHideContextButtonItemForSearchResult:toButtonItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:%@ sectionBundleIdentifier is NIL. skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addHideContextButtonItemForSearchResult:toButtonItems:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hidingPreviewButtonItemsWithSearchResult contextIdentifier:%@ dontSuggestContextButtonItem is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_entityButtonItemWithWithSearchEntity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_entityButtonItemWithWithSearchEntity:%@ name is empty. Not creating button item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_entityButtonItemWithWithSearchEntity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_entityButtonItemWithWithSearchEntity: _identifierWithEntity %@ is empty. Not creating button item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_actionTypeButtonItemWithExecutableIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_actionTypeButtonItemWithExecutableIdentifier:%@ gets a null title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hideContextButtonItemWithReasons:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hideContextButtonItemWithReasons:%llu return null context identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hideContextButtonItemWithContextIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXSpotlightHidingUIController _hideContextButtonItemWithContextIdentifier: NIL. returns nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_nearbySuggestionIdentifierWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "_nearbySuggestionIdentifierWithName null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_hideActionTitleWithExecutableIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hideActionTitleWithExecutableIdentifier: no title mapped for executableIdentifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hideContextActionTitleWithContextIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hideContextActionTitleWithContextIdentifier: no title mapped for contextIdentifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_hideContextSymbolImageWithContextIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "_hideContextSymbolImageWithContextIdentifier: no symbolName mapped for contextIdentifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
