@implementation ATXHeuristicOpenURL

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  void *v3;
  void *v4;

  v2 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXLocalPasteboardDidChangeNotification"), 0);
  v3 = (void *)MEMORY[0x1CAA46CBC]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v2, 0);
  objc_autoreleasePoolPop(v3);

  return v4;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4;
  ATXHeuristicClipboardUtilities *v5;
  void *v6;
  ATXHeuristicClipboardUtilities *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [ATXHeuristicClipboardUtilities alloc];
  objc_msgSend(v4, "heuristicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXHeuristicClipboardUtilities initWithDevice:](v5, "initWithDevice:", v6);
  -[ATXHeuristicClipboardUtilities fetchContents](v7, "fetchContents");
  -[ATXHeuristicClipboardUtilities dataDetectors](v7, "dataDetectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicOpenURL urlsFromDataDetectorResults:](self, "urlsFromDataDetectorResults:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    v34 = v9;
    _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: urls:%{sensitive}@", buf, 0xCu);
  }

  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v11);
    objc_msgSend(v12, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E82D5410);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 && objc_msgSend(v14, "containsObject:", v13))
    {
      __atxlog_handle_context_heuristic();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v11;
        _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing action prediction for URL that will not actually open in Safari but punch out to an app immediately: %@", buf, 0xCu);
      }

      v17 = (void *)objc_opt_new();
    }
    else
    {
      v31 = v15;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OPEN_CLIPBOARD_LINK_TITLE"), &stru_1E82C5A18, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHeuristicClipboardUtilities appName](v7, "appName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CF8C20];
      v25 = *MEMORY[0x1E0CB3418];
      v26 = (void *)objc_opt_new();
      objc_msgSend(v24, "atx_userActivityActionWithTitle:subtitle:bundleID:activityType:urlString:userInfo:heuristicName:", v23, 0, CFSTR("com.apple.mobilesafari"), v25, v11, v26, CFSTR("openUrl"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v32 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeuristicClipboardUtilities resultWithActions:predictionReasons:](v7, "resultWithActions:predictionReasons:", v28, 0x8000000);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        __atxlog_handle_context_heuristic();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[ATXHeuristicOpenURL heuristicResultWithEnvironment:].cold.1((uint64_t)v11, v29);

        v17 = (void *)objc_opt_new();
      }
      v15 = v31;

    }
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: action prediction for URL because did not detect exactly 1 URL.", buf, 2u);
    }

    v17 = (void *)objc_opt_new();
  }

  return v17;
}

- (id)urlsFromDataDetectorResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint8_t buf;
  _BYTE v21[15];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HttpURL"));

          if (v13)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);
          }
          else
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("WebURL"));

            if (!v16)
              continue;
            v17 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR("http://%@"), v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v18);

          }
        }
        else
        {
          __atxlog_handle_context_heuristic();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            -[ATXHeuristicOpenURL urlsFromDataDetectorResults:].cold.1(&buf, v21, v14);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)heuristicResultWithEnvironment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "ATXHeuristicOpenURL heuristicResultWithEnvironment: Action created from URL %@ is nil. No results returned", (uint8_t *)&v2, 0xCu);
}

- (void)urlsFromDataDetectorResults:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1C99DF000, log, OS_LOG_TYPE_FAULT, "ATXHeuristicOpenURL urlsFromDataDetectorResults: nil value in result", buf, 2u);
}

@end
