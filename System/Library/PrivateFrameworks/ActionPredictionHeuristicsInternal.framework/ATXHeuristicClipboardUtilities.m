@implementation ATXHeuristicClipboardUtilities

- (ATXHeuristicClipboardUtilities)initWithDevice:(id)a3
{
  id v5;
  ATXHeuristicClipboardUtilities *v6;
  ATXHeuristicClipboardUtilities *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicClipboardUtilities;
  v6 = -[ATXHeuristicClipboardUtilities init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heuristicDevice, a3);

  return v7;
}

- (void)fetchContents
{
  ATXClipboardContents *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = -[ATXClipboardContents initWithDevice:]([ATXClipboardContents alloc], "initWithDevice:", self->_heuristicDevice);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1;
  v43 = __Block_byref_object_dispose__1;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke;
  v26[3] = &unk_1E82C4708;
  v26[4] = &v39;
  v26[5] = &v27;
  v26[6] = &v33;
  -[ATXClipboardContents contentsWithCallback:](v3, "contentsWithCallback:", v26);
  __atxlog_handle_context_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v28[5];
    v6 = v34[5];
    *(_DWORD *)buf = 138478083;
    v46 = v5;
    v47 = 2113;
    v48 = v6;
    _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "ATXHeuristicClipboardUtilities: Clipboard provided creationDate : %{private}@ originatorBundleID; %{private}@",
      buf,
      0x16u);
  }

  __atxlog_handle_context_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v40[5];
    *(_DWORD *)buf = 138739971;
    v46 = v8;
    _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "ATXHeuristicClipboardUtilities content: %{sensitive}@", buf, 0xCu);
  }

  v9 = -[ATXHeuristicClipboardUtilities _resetContents](self, "_resetContents");
  if (v40[5] && v28[5] && v34[5])
  {
    v10 = (void *)MEMORY[0x1CAA46CBC](v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.Spotlight"), CFSTR("com.apple.SafariViewService"), CFSTR("com.apple.mobilesms.compose"), CFSTR("com.apple.InCallService"), 0);
    objc_autoreleasePoolPop(v10);
    LODWORD(v10) = objc_msgSend(v11, "containsObject:", v34[5]);

    if ((_DWORD)v10)
    {
      __atxlog_handle_context_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v34[5];
        *(_DWORD *)buf = 138477827;
        v46 = v13;
        v14 = "ATXHeuristicClipboardUtilities: Bundle ID blacklisted %{private}@";
        v15 = v12;
        v16 = 12;
LABEL_13:
        _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if ((unint64_t)objc_msgSend((id)v40[5], "length") >= 0x201)
      {
        __atxlog_handle_context_heuristic();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v17 = objc_msgSend((id)v40[5], "length");
        *(_DWORD *)buf = 134218240;
        v46 = v17;
        v47 = 2048;
        v48 = 512;
        v14 = "Clipboard too long, length = %lu exceeds max of %lu";
        v15 = v12;
        v16 = 22;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v28[5], 600.0);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "compare:", v12) == 1;

      if (v19)
      {
        __atxlog_handle_context_heuristic();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = (uint64_t)v12;
          _os_log_impl(&dword_1C99DF000, v20, OS_LOG_TYPE_DEFAULT, "Clipboard content expired at %@", buf, 0xCu);
        }
      }
      else
      {
        -[ATXHeuristicClipboardUtilities setContent:](self, "setContent:", v40[5]);
        -[ATXHeuristicClipboardUtilities _appNameFromBundleID:](self, "_appNameFromBundleID:", v34[5]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeuristicClipboardUtilities setAppName:](self, "setAppName:", v21);

        -[ATXHeuristicClipboardUtilities _dataDetectorsWithContent:](self, "_dataDetectorsWithContent:", v40[5]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeuristicClipboardUtilities setDataDetectors:](self, "setDataDetectors:", v22);

        __atxlog_handle_context_heuristic();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[ATXHeuristicClipboardUtilities content](self, "content");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXHeuristicClipboardUtilities dataDetectors](self, "dataDetectors");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXHeuristicClipboardUtilities appName](self, "appName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138740483;
          v46 = (uint64_t)v23;
          v47 = 2112;
          v48 = (uint64_t)v24;
          v49 = 2112;
          v50 = v25;
          _os_log_impl(&dword_1C99DF000, v20, OS_LOG_TYPE_DEFAULT, "ATXHeuristicClipboardUtilities: content %{sensitive}@ dataDetectors:%@ appName:%@", buf, 0x20u);

        }
      }

    }
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "ATXHeuristicClipboardUtilities: no clipboard data";
      v15 = v12;
      v16 = 2;
      goto LABEL_13;
    }
  }
LABEL_14:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

void __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (a5)
  {
    __atxlog_handle_context_heuristic();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }

}

- (void)_resetContents
{
  -[ATXHeuristicClipboardUtilities setContent:](self, "setContent:", 0);
  -[ATXHeuristicClipboardUtilities setDataDetectors:](self, "setDataDetectors:", 0);
  -[ATXHeuristicClipboardUtilities setAppName:](self, "setAppName:", 0);
}

- (id)_appNameFromBundleID:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Pasteboard.pbutil")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applicationIsInstalled:", v3);

    if ((v6 & 1) == 0)
    {
      __atxlog_handle_context_heuristic();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v3;
        _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_INFO, "bundleID has no installed application: %@", buf, 0xCu);
      }
      v4 = 0;
      goto LABEL_18;
    }
    v20 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v20);
    v8 = v20;
    if (v8)
    {
      __atxlog_handle_context_heuristic();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicClipboardUtilities _appNameFromBundleID:].cold.2((uint64_t)v3, (uint64_t)v8, v9);
    }
    else
    {
      if (v7)
        goto LABEL_12;
      __atxlog_handle_context_heuristic();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicClipboardUtilities _appNameFromBundleID:].cold.1((uint64_t)v3, v9, v14, v15, v16, v17, v18, v19);
    }

LABEL_12:
    objc_msgSend(v7, "localizedName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v3;
        _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_INFO, "LSApplicationRecord cannot find localizedName for bundleID even though it is installed: %@", buf, 0xCu);
      }

    }
LABEL_18:

    goto LABEL_19;
  }
  v4 = CFSTR("pbutil");
LABEL_19:

  return v4;
}

- (id)_dataDetectorsWithContent:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  const void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint8_t v20[16];
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    __atxlog_handle_context_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "Running data detectors on: %{sensitive}@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    v5 = DDScannerCreate();
    if (v5)
    {
      v6 = (const void *)v5;
      if (DDScannerScanString())
      {
        v7 = (const __CFArray *)DDScannerCopyResultsWithOptions();
        if (v7)
        {
          v8 = v7;
          dataDetectorResultsToPlist(v7, v3, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v8);
LABEL_18:
          CFRelease(v6);
          goto LABEL_19;
        }
        __atxlog_handle_context_heuristic();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          v18 = "No detector results to copy";
          goto LABEL_16;
        }
      }
      else
      {
        __atxlog_handle_context_heuristic();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          v18 = "ScanString returned no results";
LABEL_16:
          _os_log_impl(&dword_1C99DF000, v17, OS_LOG_TYPE_DEFAULT, v18, v20, 2u);
        }
      }

      v9 = 0;
      goto LABEL_18;
    }
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicClipboardUtilities _dataDetectorsWithContent:].cold.1((uint64_t)buf, v10, v11, v12, v13, v14, v15, v16);

  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_19:

  return v9;
}

- (id)resultWithActions:(id)a3 predictionReasons:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  ATXContextHeuristicResult *v9;
  _QWORD v11[5];
  uint8_t buf[16];

  v5 = a3;
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Generating NSUA for URL from clipboard", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__ATXHeuristicClipboardUtilities_resultWithActions_predictionReasons___block_invoke;
  v11[3] = &__block_descriptor_40_e43___ATXProactiveSuggestion_16__0__ATXAction_8l;
  v11[4] = a4;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v9 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v7, v8);

  return v9;
}

id __70__ATXHeuristicClipboardUtilities_resultWithActions_predictionReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 1800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v5, v6, 0, 0);
  objc_msgSend(v4, "setCriteria:", v7);
  +[ATXContextHeuristicSuggestionProducer suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:", v4, *(_QWORD *)(a1 + 32), 0, 0, 70.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (NSArray)dataDetectors
{
  return self->_dataDetectors;
}

- (void)setDataDetectors:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectors, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_dataDetectors, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_heuristicDevice, 0);
}

void __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a1, a3, "Error querying data source %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_appNameFromBundleID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a2, a3, "Fetched nil record for bundle %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_appNameFromBundleID:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "Couldn't fetch record for bundle %@, error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_dataDetectorsWithContent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a2, a3, "Error making scanner: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
