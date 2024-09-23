@implementation MapsSuggestionsRealFlightRequester

void __45__MapsSuggestionsRealFlightRequester_session__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v5, "length"))
  {

    v5 = CFSTR("1.0");
  }
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FlightUtilities/%@"), v5);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("com.apple.flightutilities"), v1);
  objc_msgSend(MEMORY[0x1E0D177D8], "sharedPARSessionWithConfiguration:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = v3;

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)requestFlightsWithFullFlightNumber:(id)a3 departureDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  id location;
  _BYTE buf[40];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealFlightRequester.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 52;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(v8, "length"))
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealFlightRequester.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 53;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "0u == fullFlightNumber.length";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a non-zero flight number", buf, 0x26u);
    }
LABEL_19:

LABEL_26:
    v23 = 0;
    goto LABEL_27;
  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealFlightRequester.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 54;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (departureDate)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a departure date", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "requestFlightsFor(%@ %@)", buf, 0x16u);
  }

  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsRealFlightRequester uniqueName](self, "uniqueName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "requestFlightsFor";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestFlightsFor", ", buf, 2u);
  }

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E0D177B0];
  v17 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___MapsSuggestionsBundle_block_invoke_4;
  *(_QWORD *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
  *(_QWORD *)&buf[32] = "RealFlightRequester";
  if (qword_1ED22EF50 != -1)
    dispatch_once(&qword_1ED22EF50, buf);
  v18 = (id)qword_1ED22EF48;
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "flightRequestForQuery:date:appBundleId:", v8, v9, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    *(_QWORD *)buf = v17;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __45__MapsSuggestionsRealFlightRequester_session__block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E4BCEE50;
    *(_QWORD *)&buf[32] = self;
    if (qword_1ED22EF40 != -1)
      dispatch_once(&qword_1ED22EF40, buf);
    v21 = (id)_MergedGlobals_34;
  }
  else
  {
    v21 = 0;
  }
  v26 = v17;
  v27 = 3221225472;
  v28 = __95__MapsSuggestionsRealFlightRequester_requestFlightsWithFullFlightNumber_departureDate_handler___block_invoke;
  v29 = &unk_1E4BCEE78;
  objc_copyWeak(&v32, &location);
  v31 = v10;
  v30 = v8;
  objc_msgSend(v21, "taskWithRequest:completion:", v20, &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "resume", v26, v27, v28, v29);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
  v23 = 1;
LABEL_27:

  return v23;
}

void __95__MapsSuggestionsRealFlightRequester_requestFlightsWithFullFlightNumber_departureDate_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  char *v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  NSObject *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  char *v23;
  int v24;
  char *v25;
  __int16 v26;
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9)
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v24 = 138412290;
        v25 = v9;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Error requesting flights: %@", (uint8_t *)&v24, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v13;
        v26 = 2080;
        *(_QWORD *)v27 = "requestFlightsFor";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v24, 0x16u);

      }
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        LOWORD(v24) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "requestFlightsFor", ", (uint8_t *)&v24, 2u);
      }
      goto LABEL_25;
    }
    objc_msgSend(v8, "flightResults");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v16;
        v26 = 2080;
        *(_QWORD *)v27 = "requestFlightsFor";
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v24, 0x16u);

      }
      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v17))
        goto LABEL_24;
      LOWORD(v24) = 0;
    }
    else
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(char **)(a1 + 32);
        v24 = 138412290;
        v25 = v19;
        _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "No results for Flight %@", (uint8_t *)&v24, 0xCu);
      }

      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("No flight results were found"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v23;
        v26 = 2080;
        *(_QWORD *)v27 = "requestFlightsFor";
        _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v24, 0x16u);

      }
      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v17))
        goto LABEL_24;
      LOWORD(v24) = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "requestFlightsFor", ", (uint8_t *)&v24, 2u);
LABEL_24:

    goto LABEL_25;
  }
  GEOFindOrCreateLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v24 = 136446722;
    v25 = "MapsSuggestionsRealFlightRequester.m";
    v26 = 1026;
    *(_DWORD *)v27 = 67;
    v27[2] = 2082;
    *(_QWORD *)&v27[3] = "-[MapsSuggestionsRealFlightRequester requestFlightsWithFullFlightNumber:departureDate:handler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v24, 0x1Cu);
  }

LABEL_25:
}

@end
