@implementation ATXHeuristicEventUtilities

+ (BOOL)allowSuggestionsForEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("title.hash: %lu, start: %@, end: %@, id: %@"), v6, v7, v8, v9);

  objc_msgSend(v3, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isSubscribed"))
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: from a calendar subscription [%@]";
LABEL_22:
      _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (objc_msgSend(v3, "status") == 3)
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: is cancelled [%@]";
      goto LABEL_22;
    }
LABEL_23:
    v20 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v3, "participationStatus") != 2 && objc_msgSend(v3, "participationStatus") != 4)
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: is not accepted [%@]";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  objc_msgSend(v3, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  v17 = v16;

  if (v17 > 54000.0)
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: is more than 15 hour long [%@]";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  objc_msgSend(v3, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = 1;
  if (v12
    && v18
    && ((objc_msgSend(v18, "isEqualToString:", CFSTR("Lodging")) & 1) != 0
     || objc_msgSend(v19, "isEqualToString:", CFSTR("Flight"))))
  {
    __atxlog_handle_context_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "Skipping Event: is hotel or flight [%@]", buf, 0xCu);
    }

    v20 = 0;
  }

LABEL_24:
  return v20;
}

+ (BOOL)isEventAtOneWithTimestamp:(id)a3
{
  void *v4;
  void *v5;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isEventAtOneWithDate:", v5);

  return (char)a1;
}

+ (BOOL)isEventAtOneWithDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  BOOL v10;
  BOOL v11;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  v8 = objc_msgSend(MEMORY[0x1E0C99DC8], "atx_usesTwelveHourClock");
  v10 = v7 == 13 || v7 == 1;
  if (v8)
    v11 = v10;
  else
    v11 = v7 == 1;

  return v11;
}

@end
