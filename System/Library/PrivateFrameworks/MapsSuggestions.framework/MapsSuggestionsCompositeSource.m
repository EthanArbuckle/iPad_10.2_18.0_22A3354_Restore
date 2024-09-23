@implementation MapsSuggestionsCompositeSource

- (void)_initUpdateTimerIfNecessary
{
  NSObject *v2;
  NSObject *v3;
  dispatch_source_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id buf[2];

  dispatch_assert_queue_V2(a1[5]);
  if (!a1[7])
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Re-initializing the _updateTimer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, a1);
    v3 = a1[5];
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
    v5 = a1[7];
    a1[7] = v4;

    dispatch_source_set_timer(a1[7], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v6 = a1[7];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__MapsSuggestionsCompositeSource__initUpdateTimerIfNecessary__block_invoke;
    handler[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v8, buf);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(a1[7]);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __61__MapsSuggestionsCompositeSource__initUpdateTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsCompositeSource _updateChildSourcesForceAll:handler:]((uint64_t)WeakRetained, 0, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsCompositeSource.mm";
      v6 = 1026;
      v7 = 81;
      v8 = 2082;
      v9 = "-[MapsSuggestionsCompositeSource _initUpdateTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)_updateChildSourcesForceAll:(void *)a3 handler:
{
  NSObject *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  char *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  char *v30;
  NSObject *v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  char *v36;
  char *v37;
  dispatch_time_t v38;
  NSObject *v39;
  char *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  char *v45;
  NSObject *v46;
  NSObject *v47;
  char *v48;
  NSObject *v49;
  NSObject *v50;
  char *v51;
  void (**v52)(void);
  const char *v53;
  NSObject *v54;
  NSObject *group;
  id obj;
  id v57;
  _QWORD v58[5];
  NSObject *v59;
  id v60;
  NSObject *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  _BYTE v70[14];
  __int16 v71;
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v68 = v6;
    v69 = 2080;
    *(_QWORD *)v70 = "_updateChildSourcesForceAll";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", ", buf, 2u);
  }

  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "NO";
    if (a2)
      v9 = "YES";
    *(_DWORD *)buf = 136315138;
    v68 = v9;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Forcing all? %s", buf, 0xCu);
  }

  if (*(_BYTE *)(a1 + 80))
  {
    GEOConfigGetDouble();
    v11 = v10;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    group = dispatch_group_create();
    v54 = v12;
    v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = *(id *)(a1 + 24);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (!v13)
      goto LABEL_44;
    v14 = "with";
    v15 = *(_QWORD *)v63;
    if (!v52)
      v14 = "without";
    v53 = v14;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        if ((a2 & 1) == 0)
        {
          v24 = v17;
          if (!v24)
          {
            GEOFindOrCreateLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v68 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
              v69 = 1024;
              *(_DWORD *)v70 = 43;
              *(_WORD *)&v70[4] = 2082;
              *(_QWORD *)&v70[6] = "-[MapsSuggestionsCompositeSource _shouldUpdateSource:]";
              v71 = 2082;
              v72 = "nil == (source)";
              _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a child Source", buf, 0x26u);
            }
            goto LABEL_41;
          }
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
          v25 = *(void **)(a1 + 32);
          objc_msgSend(v24, "uniqueName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v26);
          v27 = objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
            GEOFindOrCreateLog();
            v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v24, "uniqueName");
              v36 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v68 = v36;
              _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_DEBUG, "SOURCE{%@} skip: lacking nextUpdateTime", buf, 0xCu);

            }
LABEL_40:

LABEL_41:
            continue;
          }
          if (!MapsSuggestionsIsInThePast(v27))
          {
            GEOFindOrCreateLog();
            v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v24, "uniqueName");
              v37 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v68 = v37;
              _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_DEBUG, "SOURCE{%@} skip: too early", buf, 0xCu);

            }
            goto LABEL_40;
          }

        }
        v18 = v57;
        objc_sync_enter(v18);
        objc_msgSend(v17, "uniqueName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (v21)
        {
          objc_msgSend(v17, "uniqueName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setValue:forKey:", &unk_1E4C09860, v28);

          objc_sync_exit(v18);
          dispatch_group_enter(group);
          GEOFindOrCreateLog();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v17, "uniqueName");
            v30 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v68 = v30;
            v69 = 2080;
            *(_QWORD *)v70 = v53;
            _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "_updateChildSourcesForceAll: SOURCE{%@} %s handler", buf, 0x16u);

          }
          v31 = v54;
          objc_sync_enter(v31);
          objc_msgSend(v17, "uniqueName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v31, "addObject:", v32);

          objc_sync_exit(v31);
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __70__MapsSuggestionsCompositeSource__updateChildSourcesForceAll_handler___block_invoke;
          v58[3] = &unk_1E4BCFF90;
          v58[4] = v17;
          v59 = v31;
          v60 = v18;
          v61 = group;
          v33 = -[MapsSuggestionsCompositeSource _updateChildSource:handler:](a1, v17, v58);
          if (v33 >= v11)
            v34 = v11;
          else
            v34 = v33;
          if (v33 != 0.0)
            v11 = v34;

        }
        else
        {
          GEOFindOrCreateLog();
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "uniqueName");
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v68 = v23;
            _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "_updateChildSourcesForceAll: SOURCE{%@} has already been added", buf, 0xCu);

          }
          objc_sync_exit(v18);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (!v13)
      {
LABEL_44:

        -[MapsSuggestionsCompositeSource _scheduleNextUpdateChildSourcesWithin:](a1, v11);
        if (_MergedGlobals_1 != -1)
          dispatch_once(&_MergedGlobals_1, &__block_literal_global_268);
        v38 = dispatch_time(0, qword_1ED22EE50);
        if (dispatch_group_wait(group, v38))
        {
          if (v52)
            v52[2]();
          GEOFindOrCreateLog();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)a1, "uniqueName");
            v40 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v68 = v40;
            v69 = 2080;
            *(_QWORD *)v70 = "_updateChildSourcesForceAll";
            _os_log_impl(&dword_1A427D000, v39, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v41))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", ", buf, 2u);
          }

          v42 = v54;
          objc_sync_enter(v42);
          GEOFindOrCreateLog();
          v43 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            -[NSObject allObjects](v42, "allObjects");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "componentsJoinedByString:", CFSTR(", "));
            v45 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v68 = v45;
            _os_log_impl(&dword_1A427D000, v43, OS_LOG_TYPE_ERROR, "Not all Sources called back in time: {%{public}@}", buf, 0xCu);

          }
          objc_sync_exit(v42);
        }
        else
        {
          if (v52)
            v52[2]();
          GEOFindOrCreateLog();
          v50 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)a1, "uniqueName");
            v51 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v68 = v51;
            v69 = 2080;
            *(_QWORD *)v70 = "_updateChildSourcesForceAll";
            _os_log_impl(&dword_1A427D000, v50, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v42))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", ", buf, 2u);
          }
        }

        v49 = v54;
        goto LABEL_71;
      }
    }
  }
  GEOFindOrCreateLog();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_DEBUG, "Shortcutting. We should not be updating when stopped.", buf, 2u);
  }

  if (v52)
    v52[2]();
  GEOFindOrCreateLog();
  v47 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v48 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v68 = v48;
    v69 = 2080;
    *(_QWORD *)v70 = "_updateChildSourcesForceAll";
    _os_log_impl(&dword_1A427D000, v47, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v49, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForceAll", ", buf, 2u);
  }
LABEL_71:

}

- (double)_updateChildSource:(void *)a3 handler:
{
  id v5;
  id v6;
  NSObject *v7;
  char *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v17 = 1024;
      v18 = 176;
      v19 = 2082;
      v20 = "-[MapsSuggestionsCompositeSource _updateChildSource:handler:]";
      v21 = 2082;
      v22 = "nil == (source)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_8;
  }
  GEOFindOrCreateLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "uniqueName");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "SOURCE{%@} update", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v5, "updateSuggestionEntriesWithHandler:", v6);
  v10 = v9;
  if (v9 != 0.0)
  {
    MapsSuggestionsNowWithOffset(v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uniqueName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

LABEL_8:
  }

  return v10;
}

- (void)_scheduleNextUpdateChildSourcesWithin:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134217984;
    v9 = *(const char **)&a2;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "_scheduleNextUpdateChildSourcesWithin:%0.3f", (uint8_t *)&v8, 0xCu);
  }

  if (*(_BYTE *)(a1 + 80))
  {
    -[MapsSuggestionsCompositeSource _initUpdateTimerIfNecessary](a1);
    v5 = *(NSObject **)(a1 + 56);
    v6 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v10 = 1024;
      v11 = 133;
      v12 = 2082;
      v13 = "-[MapsSuggestionsCompositeSource _scheduleNextUpdateChildSourcesWithin:]";
      v14 = 2082;
      v15 = "NO == _running";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This should not be called unless we're running", (uint8_t *)&v8, 0x26u);
    }

  }
}

- (void)_stopUpdateChildSources
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_BYTE *)(a1 + 80) = 0;
    v2 = *(NSObject **)(a1 + 56);
    if (v2)
    {
      dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
      v3 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      obj = *(id *)(a1 + 24);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v18 != v5)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            GEOFindOrCreateLog();
            v8 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v7, "uniqueName");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v22 = v9;
              _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "SOURCE{%@} stop", buf, 0xCu);

            }
            v10 = *(void **)(a1 + 72);
            objc_msgSend(v7, "uniqueName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "BOOLValue");

            if (v13)
            {
              objc_msgSend(v7, "stop");
              v14 = *(void **)(a1 + 72);
              objc_msgSend(v7, "uniqueName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v15);

            }
          }
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v4);
      }

    }
  }
}

void __70__MapsSuggestionsCompositeSource__updateChildSourcesForceAll_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v3;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_updateChildSourcesForceAll: SOURCE{%@} responded", (uint8_t *)&v19, 0xCu);

  }
  v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "❌ Missing Source: %@", (uint8_t *)&v19, 0xCu);

    }
  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v10);

  objc_sync_exit(v4);
  v11 = *(id *)(a1 + 48);
  objc_sync_enter(v11);
  v12 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "uniqueName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v14 == 0;

  if ((_DWORD)v12)
  {
    GEOFindOrCreateLog();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v18;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_FAULT, "❌ SOURCE{%@} has already called back", (uint8_t *)&v19, 0xCu);

    }
    objc_sync_exit(v11);

  }
  else
  {
    v15 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", 0, v16);

    objc_sync_exit(v11);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2080;
    v9 = "_updateChildSourcesForType";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForType", ", (uint8_t *)&v6, 2u);
  }

}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MapsSuggestionsCompositeSource *v10;
  MapsSuggestionsCompositeSource *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v16 = 1024;
      v17 = 324;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCompositeSource initFromResourceDepot:name:]";
      v20 = 2082;
      v21 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v16 = 1024;
      v17 = 325;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCompositeSource initFromResourceDepot:name:]";
      v20 = 2082;
      v21 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v14, 0x26u);
    }
LABEL_11:

    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MapsSuggestionsCompositeSource initWithDelegate:name:](self, "initWithDelegate:name:", v9, v7);

  if (v10)
    objc_msgSend(v6, "setOneSourceDelegate:", v10);
  self = v10;
  v11 = self;
LABEL_12:

  return v11;
}

- (MapsSuggestionsCompositeSource)initWithDelegate:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsCompositeSource *v8;
  NSMutableSet *v9;
  NSMutableSet *sources;
  NSMutableDictionary *v11;
  NSMutableDictionary *nextUpdateTimes;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *innerQueue;
  NSString *v16;
  NSString *name;
  MapsSuggestionsSuppressor *v18;
  MapsSuggestionsSuppressor *suppressor;
  NSMutableDictionary *v20;
  NSMutableDictionary *hasStarted;
  dispatch_queue_t v23;
  NSString *v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsCompositeSource;
  v8 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v25, sel_initWithDelegate_name_, v6, v7);
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sources = v8->_sources;
    v8->_sources = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nextUpdateTimes = v8->_nextUpdateTimes;
    v8->_nextUpdateTimes = v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v23, CFSTR("MapsSuggestionsCompositeSourceQueue"), v13);
    v14 = v23;
    v23 = 0;
    innerQueue = v8->_queue._innerQueue;
    v8->_queue._innerQueue = (OS_dispatch_queue *)v14;

    v16 = v24;
    v24 = 0;
    name = v8->_queue._name;
    v8->_queue._name = v16;

    v18 = objc_alloc_init(MapsSuggestionsSuppressor);
    suppressor = v8->_suppressor;
    v8->_suppressor = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hasStarted = v8->_hasStarted;
    v8->_hasStarted = v20;

  }
  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 2;
}

- (void)dealloc
{
  NSMutableSet *sources;
  NSMutableDictionary *nextUpdateTimes;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MapsSuggestionsCompositeSource _stopUpdateChildSources]((uint64_t)self);
  -[NSMutableSet removeAllObjects](self->_sources, "removeAllObjects");
  sources = self->_sources;
  self->_sources = 0;

  nextUpdateTimes = self->_nextUpdateTimes;
  self->_nextUpdateTimes = 0;

  if (self->_updateTimer)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v9 = 1024;
      v10 = 369;
      v11 = 2082;
      v12 = "-[MapsSuggestionsCompositeSource dealloc]";
      v13 = 2082;
      v14 = "_updateTimer != nil";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. The timer is still there. Are you sure -stop was called before?", buf, 0x26u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsCompositeSource;
  -[MapsSuggestionsCompositeSource dealloc](&v6, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id buf[2];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "start", (uint8_t *)buf, 2u);
  }

  -[MapsSuggestionsSuppressor purge](self->_suppressor, "purge");
  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MapsSuggestionsCompositeSource_start__block_invoke;
  block[3] = &unk_1E4BCDDF8;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __39__MapsSuggestionsCompositeSource_start__block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  uint64_t v2;
  NSObject *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  double v18;
  NSObject *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[4];
  void *v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[5]);
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "_startUpdateChildSources", buf, 2u);
    }

    *(_BYTE *)(v2 + 80) = 1;
    -[MapsSuggestionsCompositeSource _initUpdateTimerIfNecessary]((dispatch_queue_t *)v2);
    objc_msgSend(*(id *)(v2 + 32), "removeAllObjects");
    GEOConfigGetDouble();
    v5 = v4;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = *(id *)(v2 + 24);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          GEOFindOrCreateLog();
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v9, "uniqueName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v25 = 138412290;
            v26 = v11;
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "SOURCE{%@} start", v25, 0xCu);

          }
          v12 = *(void **)(v2 + 72);
          objc_msgSend(v9, "uniqueName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "BOOLValue");

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v9, "start");
            v16 = *(void **)(v2 + 72);
            objc_msgSend(v9, "uniqueName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v17);

          }
          if (objc_msgSend((id)objc_opt_class(), "disposition") == 1)
          {
            v18 = -[MapsSuggestionsCompositeSource _updateChildSource:handler:](v2, v9, 0);
            if (v18 != 0.0 && v18 < v5)
              v5 = v18;
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
      }
      while (v6);
    }

    -[MapsSuggestionsCompositeSource _scheduleNextUpdateChildSourcesWithin:](v2, v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v28 = "MapsSuggestionsCompositeSource.mm";
      v29 = 1026;
      v30 = 382;
      v31 = 2082;
      v32 = "-[MapsSuggestionsCompositeSource start]_block_invoke";
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id buf[2];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "stop", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MapsSuggestionsCompositeSource_stop__block_invoke;
  block[3] = &unk_1E4BCDDF8;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __38__MapsSuggestionsCompositeSource_stop__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsCompositeSource _stopUpdateChildSources]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsCompositeSource.mm";
      v6 = 1026;
      v7 = 393;
      v8 = 2082;
      v9 = "-[MapsSuggestionsCompositeSource stop]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *innerQueue;
  id v6;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MapsSuggestionsCompositeSource_updateSuggestionEntriesWithHandler___block_invoke;
  block[3] = &unk_1E4BCE550;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  innerQueue = self->_queue._innerQueue;
  v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return 0.0;
}

void __69__MapsSuggestionsCompositeSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  char *v4;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  _BYTE v10[18];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromMapsSuggestionsCurrentBestLocation();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      *(_QWORD *)v10 = CFSTR("ALL");
      *(_WORD *)&v10[8] = 2112;
      *(_QWORD *)&v10[10] = v5;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", (uint8_t *)&v7, 0x20u);

    }
    -[MapsSuggestionsCompositeSource _updateChildSourcesForceAll:handler:]((uint64_t)WeakRetained, 1, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsCompositeSource.mm";
      v9 = 1026;
      *(_DWORD *)v10 = 402;
      *(_WORD *)&v10[4] = 2082;
      *(_QWORD *)&v10[6] = "-[MapsSuggestionsCompositeSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4
{
  void (**v6)(_QWORD);
  double v7;
  double v8;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  id v12[2];
  id location;

  v6 = (void (**)(_QWORD))a4;
  if (a3)
  {
    if (-[MapsSuggestionsCompositeSource canProduceEntriesOfType:](self, "canProduceEntriesOfType:", a3))
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __72__MapsSuggestionsCompositeSource_updateSuggestionEntriesOfType_handler___block_invoke;
      v10[3] = &unk_1E4BCFFB8;
      objc_copyWeak(v12, &location);
      v12[1] = (id)a3;
      v11 = v6;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v10);

      objc_destroyWeak(v12);
      objc_destroyWeak(&location);
      v7 = 0.0;
    }
    else
    {
      v7 = 0.0;
      if (v6)
        v6[2](v6);
    }
  }
  else
  {
    -[MapsSuggestionsCompositeSource updateSuggestionEntriesWithHandler:](self, "updateSuggestionEntriesWithHandler:", v6);
    v7 = v8;
  }

  return v7;
}

void __72__MapsSuggestionsCompositeSource_updateSuggestionEntriesOfType_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  void (**v19)(void);
  id WeakRetained;
  _QWORD block[5];
  void (**v22)(void);
  _QWORD v23[4];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  _BYTE v32[18];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v3 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromMapsSuggestionsEntryType(*(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromMapsSuggestionsCurrentBestLocation();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v3;
      v31 = 2112;
      *(_QWORD *)v32 = v4;
      *(_WORD *)&v32[8] = 2112;
      *(_QWORD *)&v32[10] = v5;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    v19 = (void (**)(void))*(id *)(a1 + 32);
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 5));
    if (*((_BYTE *)WeakRetained + 80))
    {
      v7 = dispatch_group_create();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v8 = *((id *)WeakRetained + 3);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, buf, 16);
      v10 = MEMORY[0x1E0C809B0];
      if (v9)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v13, "canProduceEntriesOfType:", v6))
            {
              dispatch_group_enter(v7);
              v23[0] = v10;
              v23[1] = 3221225472;
              v23[2] = __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke;
              v23[3] = &unk_1E4BCE640;
              v24 = v7;
              -[MapsSuggestionsCompositeSource _updateChildSource:handler:]((uint64_t)WeakRetained, v13, v23);

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, buf, 16);
        }
        while (v9);
      }

      v14 = *((_QWORD *)WeakRetained + 5);
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __69__MapsSuggestionsCompositeSource__updateChildSourcesForType_handler___block_invoke_2;
      block[3] = &unk_1E4BCF070;
      block[4] = WeakRetained;
      v22 = v19;
      dispatch_group_notify(v7, v14, block);

    }
    else
    {
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Shortcutting. We should not be updating when stopped.", buf, 2u);
      }

      if (v19)
        v19[2]();
      GEOFindOrCreateLog();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v18;
        v31 = 2080;
        *(_QWORD *)v32 = "_updateChildSourcesForType";
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateChildSourcesForType", ", buf, 2u);
      }
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v30 = "MapsSuggestionsCompositeSource.mm";
      v31 = 1026;
      *(_DWORD *)v32 = 425;
      *(_WORD *)&v32[4] = 2082;
      *(_QWORD *)&v32[6] = "-[MapsSuggestionsCompositeSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MapsSuggestionsCompositeSource_canProduceEntriesOfType___block_invoke;
  v4[3] = &unk_1E4BCFFE0;
  v4[4] = self;
  v4[5] = a3;
  return MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v4);
}

uint64_t __58__MapsSuggestionsCompositeSource_canProduceEntriesOfType___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "canProduceEntriesOfType:", *(_QWORD *)(a1 + 40), (_QWORD)v8) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *innerQueue;
  _QWORD *v14;
  char v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE buf[40];
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 578;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsCompositeSource removeEntry:behavior:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 579;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsCompositeSource removeEntry:behavior:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. handle cannot be nil", buf, 0x26u);
    }
LABEL_11:

    v15 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[MapsSuggestionsCompositeSource removeEntry:behavior:handler:]";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__MapsSuggestionsCompositeSource_removeEntry_behavior_handler___block_invoke;
  v18[3] = &unk_1E4BD0008;
  v21 = a4;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v12 = v18;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  innerQueue = self->_queue._innerQueue;
  *(_QWORD *)buf = v11;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZNK3MSg5Queue4syncI18MSgCallbackPromiseEET_U13block_pointerFS3_vE_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E4BCDE48;
  *(_QWORD *)&buf[32] = v12;
  v27 = &v22;
  v14 = v12;
  dispatch_sync(innerQueue, buf);
  v15 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
LABEL_12:

  return v15;
}

uint64_t __63__MapsSuggestionsCompositeSource_removeEntry_behavior_handler___block_invoke(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  NSObject *v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
  {
    v2 = (*(_QWORD *)(a1 + 56) & 3) == 0;
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "About to suppress entry with Delete/Forget in all sources", buf, 2u);
      }

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "removeEntry:behavior:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), (_QWORD)v20);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

      return 1;
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "About to suppress entry with Hide/Snooze", buf, 2u);
      }

      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      v7 = *(id *)(a1 + 40);
      v8 = v7;
      if ((v5 & 1) == 0)
      {
        v9 = 0.0;
        switch(objc_msgSend(v7, "type"))
        {
          case 0:
            goto LABEL_28;
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
            goto LABEL_27;
          default:
            GEOFindOrCreateLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              goto LABEL_26;
            *(_DWORD *)buf = 136446978;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
            v27 = 1024;
            v28 = 563;
            v29 = 2082;
            v30 = "NSTimeInterval _hideTimeForEntryType(MapsSuggestionsEntryType)";
            v31 = 2082;
            v32 = "YES";
            goto LABEL_25;
        }
      }
      v9 = 0.0;
      switch(objc_msgSend(v7, "type"))
      {
        case 0:
          break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
LABEL_27:
          GEOConfigGetDouble();
          v9 = v18;
          break;
        default:
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
            v27 = 1024;
            v28 = 504;
            v29 = 2082;
            v30 = "NSTimeInterval _snoozeTimeForEntryType(MapsSuggestionsEntryType)";
            v31 = 2082;
            v32 = "YES";
LABEL_25:
            _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", buf, 0x26u);
          }
LABEL_26:

          v9 = 0.0;
          break;
      }
LABEL_28:

      v12 = objc_msgSend(v6, "suppressEntry:forTime:", v8, v9);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromMapsSuggestionsRemovalBehavior(*(_QWORD *)(a1 + 56));
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_INFO, "Cannot suppress entry because removal behavior is %@", buf, 0xCu);

    }
    return 0;
  }
  return v12;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[MapsSuggestionsCompositeSource feedbackForEntry:action:]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    if (a4)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "About to send feedback to all sources", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__MapsSuggestionsCompositeSource_feedbackForEntry_action___block_invoke;
      block[3] = &unk_1E4BCDDD0;
      objc_copyWeak(v14, (id *)buf);
      v13 = v6;
      v14[1] = (id)a4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

      objc_destroyWeak(v14);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromMapsSuggestionsEntryEngagement(0);
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_INFO, "Cannot process feedback for entry because action is %@", buf, 0xCu);

      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v17 = 1024;
      v18 = 618;
      v19 = 2082;
      v20 = "-[MapsSuggestionsCompositeSource feedbackForEntry:action:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }

  }
}

void __58__MapsSuggestionsCompositeSource_feedbackForEntry_action___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = WeakRetained[3];
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "feedbackForEntry:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsCompositeSource.mm";
      v15 = 1026;
      v16 = 629;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCompositeSource feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[MapsSuggestionsCompositeSource feedbackForMapItem:action:]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    if (a4)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__MapsSuggestionsCompositeSource_feedbackForMapItem_action___block_invoke;
      block[3] = &unk_1E4BCDDD0;
      objc_copyWeak(v13, (id *)buf);
      v12 = v6;
      v13[1] = (id)a4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromMapsSuggestionsEntryEngagement(0);
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_INFO, "Cannot process feedback for entry because action is %@", buf, 0xCu);

      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v16 = 1024;
      v17 = 640;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCompositeSource feedbackForMapItem:action:]";
      v20 = 2082;
      v21 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem", buf, 0x26u);
    }

  }
}

void __60__MapsSuggestionsCompositeSource_feedbackForMapItem_action___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = WeakRetained[3];
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "feedbackForMapItem:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsCompositeSource.mm";
      v15 = 1026;
      v16 = 649;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCompositeSource feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[MapsSuggestionsCompositeSource feedbackForContact:action:]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    if (a4)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__MapsSuggestionsCompositeSource_feedbackForContact_action___block_invoke;
      block[3] = &unk_1E4BCDDD0;
      objc_copyWeak(v13, (id *)buf);
      v12 = v6;
      v13[1] = (id)a4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromMapsSuggestionsEntryEngagement(0);
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_INFO, "Cannot process feedback for entry because action is %@", buf, 0xCu);

      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v16 = 1024;
      v17 = 660;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCompositeSource feedbackForContact:action:]";
      v20 = 2082;
      v21 = "nil == (contact)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires contact", buf, 0x26u);
    }

  }
}

void __60__MapsSuggestionsCompositeSource_feedbackForContact_action___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = WeakRetained[3];
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "feedbackForContact:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsCompositeSource.mm";
      v15 = 1026;
      v16 = 669;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCompositeSource feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  unint64_t v15;
  id v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (char *)a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "passing on addOrUpdateSuggestionEntries for SOURCE{%@}", buf, 0xCu);
  }

  if (v17)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v17;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (-[MapsSuggestionsSuppressor isSuppressedEntry:](self->_suppressor, "isSuppressedEntry:", v11, v17))
          {
            objc_msgSend(v11, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsIsSuppressedKey"));
            GEOFindOrCreateLog();
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "uniqueIdentifier");
              v13 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "isSuppressedEntry returned YES for %@", buf, 0xCu);

            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    -[MapsSuggestionsBaseSource delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject addOrUpdateSuggestionEntries:source:](v14, "addOrUpdateSuggestionEntries:source:", v7, v18);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v26 = 1024;
      v27 = 684;
      v28 = 2082;
      v29 = "-[MapsSuggestionsCompositeSource addOrUpdateSuggestionEntries:source:]";
      v30 = 2082;
      v31 = "nil == (entries)";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more entries", buf, 0x26u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)addChildSource:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "addChildSource:SOURCE{%@}", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__MapsSuggestionsCompositeSource_addChildSource___block_invoke;
    v9[3] = &unk_1E4BCE618;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v14 = 1024;
      v15 = 711;
      v16 = 2082;
      v17 = "-[MapsSuggestionsCompositeSource addChildSource:]";
      v18 = 2082;
      v19 = "nil == (source)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a child Source", buf, 0x26u);
    }

  }
  return v4 != 0;
}

void __49__MapsSuggestionsCompositeSource_addChildSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setDelegate:", v3);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsCompositeSource.mm";
      v7 = 1026;
      v8 = 716;
      v9 = 2082;
      v10 = "-[MapsSuggestionsCompositeSource addChildSource:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (BOOL)removeChildSource:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "removeChildSource:SOURCE{%@}", buf, 0xCu);

    }
    objc_msgSend(v4, "stop");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__MapsSuggestionsCompositeSource_removeChildSource___block_invoke;
    v9[3] = &unk_1E4BCF9B8;
    v9[4] = self;
    v10 = v4;
    dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, v9);

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      v13 = 1024;
      v14 = 725;
      v15 = 2082;
      v16 = "-[MapsSuggestionsCompositeSource removeChildSource:]";
      v17 = 2082;
      v18 = "nil == (source)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a child Source", buf, 0x26u);
    }

  }
  return v4 != 0;
}

uint64_t __52__MapsSuggestionsCompositeSource_removeChildSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)children
{
  uint64_t v3;
  _QWORD *v4;
  NSObject *innerQueue;
  _QWORD *v6;
  id v7;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__MapsSuggestionsCompositeSource_children__block_invoke;
  v9[3] = &unk_1E4BD0030;
  v9[4] = self;
  v4 = v9;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  innerQueue = self->_queue._innerQueue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = ___ZNK3MSg5Queue4syncIU8__strongP11objc_objectEET_U13block_pointerFS5_vE_block_invoke;
  block[3] = &unk_1E4BCDE48;
  v11 = v4;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(innerQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

id __42__MapsSuggestionsCompositeSource_children__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
}

- (id)sources
{
  return self->_sources;
}

- (void)test_sync
{
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_19);
}

void __43__MapsSuggestionsCompositeSource_test_sync__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  GEOFindOrCreateLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A427D000, v0, OS_LOG_TYPE_DEBUG, "Test synced", v1, 2u);
  }

}

- (id)test_dateUntilSuppressedEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *innerQueue;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;
  _BYTE *v17;
  _BYTE buf[40];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__MapsSuggestionsCompositeSource_test_dateUntilSuppressedEntry___block_invoke;
    v13[3] = &unk_1E4BD0078;
    v13[4] = self;
    v14 = v4;
    v7 = v13;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__10;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__10;
    v19 = 0;
    innerQueue = self->_queue._innerQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = ___ZNK3MSg5Queue4syncIU8__strongP6NSDateEET_U13block_pointerFS5_vE_block_invoke;
    block[3] = &unk_1E4BCDE48;
    v16 = v7;
    v17 = buf;
    v9 = v7;
    dispatch_sync(innerQueue, block);
    v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 758;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsCompositeSource test_dateUntilSuppressedEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    v10 = 0;
  }

  return v10;
}

uint64_t __64__MapsSuggestionsCompositeSource_test_dateUntilSuppressedEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "test_dateUntilSuppressedEntry:", *(_QWORD *)(a1 + 40));
}

- (double)test_suppressionDurationForBehavior:(int64_t)a3 type:(int64_t)a4
{
  NSObject *v4;
  double result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    switch(a4)
    {
      case 0:
        return 0.0;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
LABEL_12:
        GEOConfigGetDouble();
        return result;
      default:
        GEOFindOrCreateLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        v6 = 136446978;
        v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
        v8 = 1024;
        v9 = 504;
        v10 = 2082;
        v11 = "NSTimeInterval _snoozeTimeForEntryType(MapsSuggestionsEntryType)";
        v12 = 2082;
        v13 = "YES";
        goto LABEL_9;
    }
  }
  if (a3 == 2)
  {
    switch(a4)
    {
      case 0:
        return 0.0;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        goto LABEL_12;
      default:
        GEOFindOrCreateLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        v6 = 136446978;
        v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSource.mm";
        v8 = 1024;
        v9 = 563;
        v10 = 2082;
        v11 = "NSTimeInterval _hideTimeForEntryType(MapsSuggestionsEntryType)";
        v12 = 2082;
        v13 = "YES";
        break;
    }
LABEL_9:
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
LABEL_10:

  }
  return 0.0;
}

- (void)test_resetSuppressions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MapsSuggestionsCompositeSource_test_resetSuppressions__block_invoke;
  block[3] = &unk_1E4BCE640;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
}

uint64_t __56__MapsSuggestionsCompositeSource_test_resetSuppressions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "test_deleteSuppressedEntriesFile");
}

- (void)test_awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_145);
}

void __49__MapsSuggestionsCompositeSource_test_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasStarted, 0);
  objc_storeStrong((id *)&self->_suppressor, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_nextUpdateTimes, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
