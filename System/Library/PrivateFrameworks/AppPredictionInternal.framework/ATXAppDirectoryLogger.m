@implementation ATXAppDirectoryLogger

- (id)_retrieveLastLogProcessedDate
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "objectForKey:", CFSTR("AppDirectoryLastLogProcessedDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryLogger _retrieveLastLogProcessedDate].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_storeLastLogProcessedDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (id)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("AppDirectoryLastLogProcessedDate"));

}

- (id)_retrieveAllUnprocessedEvents
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppDirectoryLogger _retrieveLastLogProcessedDate](self, "_retrieveLastLogProcessedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: Processing events since %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D15AF8], "appDirectoryInteractionStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:", v6, v4, v3, 1, 0, -1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_166);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __54__ATXAppDirectoryLogger__retrieveAllUnprocessedEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CF92D0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF92D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

- (id)_retrieveSessionsFromUnprocessedEvents:(id)a3 lastSessionEndDate:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[3];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__76;
  v24 = __Block_byref_object_dispose__76;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke;
  v12[3] = &unk_1E82E6E70;
  v15 = v18;
  v16 = v26;
  v7 = v6;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  v17 = &v20;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v9 = v14;
  v10 = v7;

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  return v10;
}

void __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;

  v5 = a2;
  objc_msgSend(v5, "integerValue");
  if (ATXIsSessionStartedByEvent())
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      __atxlog_handle_app_library();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_1(v5, v6);

      goto LABEL_13;
    }
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_13;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    __atxlog_handle_app_library();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_2(v5, v13);

    goto LABEL_12;
  }
  objc_msgSend(v5, "integerValue");
  if (ATXIsSessionEndedByEvent())
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(v5, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CF92D0]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
LABEL_13:

}

- (id)_summarizeSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *MEMORY[0x1E0CF92D0];
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v8 = v6;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v3;
  v46 = v8;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v60)
  {
    v61 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v73;
    v63 = (void *)*MEMORY[0x1E0CF92C8];
    v64 = (void *)*MEMORY[0x1E0CF92C0];
    v11 = *MEMORY[0x1E0CF92B0];
    v67 = *MEMORY[0x1E0CF92B8];
    v65 = *MEMORY[0x1E0CF92E0];
    v66 = *MEMORY[0x1E0CF92D8];
    v51 = *MEMORY[0x1E0CF9290];
    v52 = *MEMORY[0x1E0CF9268];
    v12 = 0.0;
    v49 = *MEMORY[0x1E0CF9288];
    v50 = *MEMORY[0x1E0CF9280];
    v48 = *MEMORY[0x1E0CF9298];
    v13 = 0.0;
    v14 = 0.0;
    v47 = *MEMORY[0x1E0CF9278];
    v59 = *(_QWORD *)v73;
    do
    {
      v15 = 0;
      v16 = v8;
      do
      {
        if (*(_QWORD *)v73 != v10)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v15);
        objc_msgSend(v17, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v62);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", v16);
        v21 = v20;

        switch(v9)
        {
          case 0:
          case 2:
          case 9:
            v14 = v14 + v21;
            break;
          case 1:
            v13 = v13 + v21;
            break;
          case 7:
            v12 = v12 + v21;
            break;
          default:
            break;
        }
        if (objc_msgSend(v17, "integerValue") == 1)
        {
          objc_msgSend(v17, "metadata");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v64);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v61);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "stringByAppendingString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, v23);

          objc_msgSend(v17, "metadata");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v63);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v61);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringByAppendingString:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v26);

          v10 = v59;
          ++v61;
        }
        objc_msgSend(v17, "integerValue");
        if (ATXIsSessionEndedByEvent())
        {
          v55 = v16;
          v58 = v15;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v17, "metadata");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "allKeys");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          if (!v29)
            goto LABEL_30;
          v30 = v29;
          v31 = *(_QWORD *)v69;
          while (1)
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v69 != v31)
                objc_enumerationMutation(v28);
              v33 = *(id *)(*((_QWORD *)&v68 + 1) + 8 * v32);
              if ((objc_msgSend(v33, "isEqualToString:", v11) & 1) != 0
                || (objc_msgSend(v33, "isEqualToString:", v67) & 1) != 0
                || (objc_msgSend(v33, "isEqualToString:", v66) & 1) != 0
                || (objc_msgSend(v33, "isEqualToString:", v65) & 1) != 0
                || objc_msgSend(v33, "isEqualToString:", v64))
              {

LABEL_24:
                objc_msgSend(v17, "metadata");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKeyedSubscript:", v33);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, v33);

                goto LABEL_25;
              }
              v36 = objc_msgSend(v33, "isEqualToString:", v63);

              if (v36)
                goto LABEL_24;
LABEL_25:
              ++v32;
            }
            while (v30 != v32);
            v37 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
            v30 = v37;
            if (!v37)
            {
LABEL_30:

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "integerValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, v52);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, v51);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, v50);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, v49);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v61);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, v48);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v43, v47);

              v15 = v58;
              v10 = v59;
              v16 = v55;
              break;
            }
          }
        }
        objc_msgSend(v17, "metadata");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v62);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v17, "integerValue");
        ++v15;
        v16 = v8;
      }
      while (v15 != v60);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v60);
  }

  return v7;
}

- (void)_uploadToCoreAnalytics:(id)a3
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AnalyticsSendEventLazy();
  __atxlog_handle_app_library();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: Attached log successfully uploaded to CoreAnalytics - %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[ATXAppDirectoryLogger _uploadToCoreAnalytics:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

id __48__ATXAppDirectoryLogger__uploadToCoreAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)uploadSummariesToCoreAnalyticsWithActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXAppDirectoryLogger _retrieveAllUnprocessedEvents](self, "_retrieveAllUnprocessedEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_app_library();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: deferring uploading of logs to Core Analytics after merely fetching unprocessed events", buf, 2u);
    }
  }
  else
  {
    v26 = 0;
    -[ATXAppDirectoryLogger _retrieveSessionsFromUnprocessedEvents:lastSessionEndDate:](self, "_retrieveSessionsFromUnprocessedEvents:lastSessionEndDate:", v5, &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v26;
    if (objc_msgSend(v4, "didDefer"))
    {
      __atxlog_handle_app_library();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryLogger: deferring uploading of logs to Core Analytics after merely fetching sessions", buf, 2u);
      }
    }
    else
    {
      if (objc_msgSend(v5, "count") && v6)
        -[ATXAppDirectoryLogger _storeLastLogProcessedDate:](self, "_storeLastLogProcessedDate:", v6);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = v7;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      if (v9)
      {
        v10 = v9;
        v18 = v7;
        v19 = v6;
        v20 = v5;
        v21 = v4;
        v11 = *(_QWORD *)v23;
        v12 = *MEMORY[0x1E0CF9270];
        v13 = 1;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            -[ATXAppDirectoryLogger _summarizeSession:](self, "_summarizeSession:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v18, v19, v20, v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 & 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v12);

            __atxlog_handle_app_library();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v15;
              _os_log_debug_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryLogger: Uploading session %@", buf, 0xCu);
            }

            -[ATXAppDirectoryLogger _uploadToCoreAnalytics:](self, "_uploadToCoreAnalytics:", v15);
            v13 = 0;
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
          v13 = 0;
        }
        while (v10);
        v5 = v20;
        v4 = v21;
        v7 = v18;
        v6 = v19;
      }
    }

  }
}

- (void)_retrieveLastLogProcessedDate
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXAppDirectoryLogger: Failed to retrieve date of last log processed.", a5, a6, a7, a8, 0);
}

void __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF92D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXAppDirectoryLogger: Malformed event sequence - session start seen at %@ seen before previous session ended", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

void __83__ATXAppDirectoryLogger__retrieveSessionsFromUnprocessedEvents_lastSessionEndDate___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF92D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryLogger: Event sequence - event at %@ seen before session start. Expected due to current SB behavior - will result in some inaccuracy in time data.", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

- (void)_uploadToCoreAnalytics:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXAppDirectoryLogger: Logging failure - event not enabled", a5, a6, a7, a8, 0);
}

@end
