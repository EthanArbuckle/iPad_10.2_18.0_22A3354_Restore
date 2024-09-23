@implementation ATXNotificationAdjacentSuggestionMetricsLogger

- (ATXNotificationAdjacentSuggestionMetricsLogger)init
{
  void *v3;
  ATXNotificationAdjacentSuggestionMetricsLogger *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXNotificationAdjacentSuggestionMetricsLogger initWithDatastore:](self, "initWithDatastore:", v3);

  return v4;
}

- (ATXNotificationAdjacentSuggestionMetricsLogger)initWithDatastore:(id)a3
{
  id v5;
  ATXNotificationAdjacentSuggestionMetricsLogger *v6;
  ATXNotificationAdjacentSuggestionMetricsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationAdjacentSuggestionMetricsLogger;
  v6 = -[ATXNotificationAdjacentSuggestionMetricsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_datastore, a3);

  return v7;
}

- (void)logNotificationAdjacentSuggestionMetricsWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  double v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  double v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "%@ - Updating the database", buf, 0xCu);

  }
  -[ATXNotificationAndSuggestionDatastore updateDatabase](self->_datastore, "updateDatabase");
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_metrics();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v10;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "%@ - XPC deferred, terminating.", buf, 0xCu);

    }
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v8 = objc_msgSend(v11, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    -[NSObject doubleForKey:](v8, "doubleForKey:", CFSTR("suggestionsMetricsTimestamp"));
    v13 = v12;
    __atxlog_handle_metrics();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = v16;
      v51 = 2048;
      v52 = v13;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "%@ - Fetching metrics objects with previous timestamp %f", buf, 0x16u);

    }
    -[ATXNotificationAndSuggestionDatastore metricsForSuggestionsSinceCompletionTimestamp:](self->_datastore, "metricsForSuggestionsSinceCompletionTimestamp:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "didDefer");
    __atxlog_handle_metrics();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v20)
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v22;
        _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "%@ - XPC deferred, terminating.", buf, 0xCu);

      }
    }
    else
    {
      if (v20)
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v24;
        _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "%@ - logging fetched metrics", buf, 0xCu);

      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v44 = v17;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = *(_QWORD *)v46;
        while (2)
        {
          v30 = 0;
          v43 = v28 + v27;
          do
          {
            if (*(_QWORD *)v46 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v30);
            v32 = (void *)MEMORY[0x1CAA48B6C]();
            objc_msgSend(v31, "suggestionCompletionTimestamp");
            if (v33 > v13)
            {
              objc_msgSend(v31, "suggestionCompletionTimestamp");
              v13 = v34;
            }
            objc_msgSend(v31, "logToCoreAnalytics", v43);
            if (objc_msgSend(v4, "didDefer"))
            {
              __atxlog_handle_metrics();
              v36 = objc_claimAutoreleasedReturnValue();
              v35 = v28 + v30 + 1;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                v37 = (objc_class *)objc_opt_class();
                NSStringFromClass(v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v50 = v38;
                _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_INFO, "%@ - XPC deferred, terminating.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v32);
              goto LABEL_29;
            }
            objc_autoreleasePoolPop(v32);
            ++v30;
          }
          while (v27 != v30);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          v35 = v43;
          v28 = v43;
          if (v27)
            continue;
          break;
        }
      }
      else
      {
        v35 = 0;
      }
LABEL_29:

      __atxlog_handle_metrics();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 138413058;
        v50 = v41;
        v51 = 2048;
        v52 = *(double *)&v35;
        v53 = 2048;
        v54 = v42;
        v55 = 2048;
        v56 = v13;
        _os_log_impl(&dword_1C9A3B000, v39, OS_LOG_TYPE_INFO, "%@ - Logged %ld out of %ld metrics.  New metric timestamp is %f.", buf, 0x2Au);

      }
      -[NSObject setDouble:forKey:](v8, "setDouble:forKey:", CFSTR("suggestionsMetricsTimestamp"), v13);
      v17 = v44;
    }

  }
}

- (void)logNotificationAdjacentSuggestionMetrics
{
  -[ATXNotificationAdjacentSuggestionMetricsLogger logNotificationAdjacentSuggestionMetricsWithXPCActivity:](self, "logNotificationAdjacentSuggestionMetricsWithXPCActivity:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastore, 0);
}

@end
