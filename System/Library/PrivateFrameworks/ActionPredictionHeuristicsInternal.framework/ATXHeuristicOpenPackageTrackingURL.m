@implementation ATXHeuristicOpenPackageTrackingURL

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
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
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
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [ATXHeuristicClipboardUtilities alloc];
  objc_msgSend(v4, "heuristicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXHeuristicClipboardUtilities initWithDevice:](v5, "initWithDevice:", v6);
  -[ATXHeuristicClipboardUtilities fetchContents](v7, "fetchContents");
  -[ATXHeuristicClipboardUtilities dataDetectors](v7, "dataDetectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicClipboardUtilities appName](v7, "appName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Safari"));

  if (v10)
  {
    __atxlog_handle_context_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing action for package tracking number copied from Safari.", buf, 2u);
    }

    v12 = (void *)objc_opt_new();
  }
  else
  {
    -[ATXHeuristicOpenPackageTrackingURL packageTrackingNumbersFromDataDetectorResults:](self, "packageTrackingNumbersFromDataDetectorResults:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_context_heuristic();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v13;
      _os_log_impl(&dword_1C99DF000, v14, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: results:%@", buf, 0xCu);
    }

    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("trackingNumber"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("urlEncodedTrackingNumber"));
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("companyName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://trackingshipment.apple.com/?Company=%@&TrackingNumber=%@"), v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      v32 = v20;
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OPEN_PACKAGE_TRACKING_LINK_TITLE"), &stru_1E82C5A18, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringWithFormat:", v22, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CF8C20];
      v25 = *MEMORY[0x1E0CB3418];
      v26 = (void *)objc_opt_new();
      objc_msgSend(v24, "atx_userActivityActionWithTitle:subtitle:bundleID:activityType:urlString:userInfo:heuristicName:", v23, v16, CFSTR("com.apple.mobilesafari"), v25, v19, v26, CFSTR("openPackageTrackingUrl"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v34 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeuristicClipboardUtilities resultWithActions:predictionReasons:](v7, "resultWithActions:predictionReasons:", v28, 0x4000000);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        __atxlog_handle_context_heuristic();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[ATXHeuristicOpenPackageTrackingURL heuristicResultWithEnvironment:].cold.1((uint64_t)v19, v30);

        v12 = (void *)objc_opt_new();
      }

    }
    else
    {
      __atxlog_handle_context_heuristic();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C99DF000, v29, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing action prediction for package tracking number because did not detect exactly 1 URL.", buf, 2u);
      }

      v12 = (void *)objc_opt_new();
    }
    v8 = v13;
  }

  return v12;
}

- (id)packageTrackingNumbersFromDataDetectorResults:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_6);
}

uint64_t __84__ATXHeuristicOpenPackageTrackingURL_packageTrackingNumbersFromDataDetectorResults___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("TrackingNumber"));

  return v3;
}

- (void)heuristicResultWithEnvironment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "ATXHeuristicOpenPackageTrackingURL heuristicResultWithEnvironment: Action created from URL %@ is nil. No results returned", (uint8_t *)&v2, 0xCu);
}

@end
