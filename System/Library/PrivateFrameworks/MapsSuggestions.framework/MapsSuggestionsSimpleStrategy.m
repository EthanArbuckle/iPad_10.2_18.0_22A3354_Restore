@implementation MapsSuggestionsSimpleStrategy

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsSimpleStrategy)init
{
  MapsSuggestionsSimpleStrategy *v2;
  uint64_t v3;
  NSMutableSet *preFilters;
  uint64_t v5;
  NSMutableSet *postFilters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsSimpleStrategy;
  v2 = -[MapsSuggestionsSimpleStrategy init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    preFilters = v2->_preFilters;
    v2->_preFilters = (NSMutableSet *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    postFilters = v2->_postFilters;
    v2->_postFilters = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)clearData
{
  NSObject *v3;
  NSMutableArray *previousResults;
  uint8_t v5[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "CLEAR data", v5, 2u);
  }

  previousResults = self->_previousResults;
  self->_previousResults = 0;

}

- (BOOL)preFiltersKept:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  int v19;
  __CFString *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2080;
    v32 = "pre-filtering";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "pre-filtering", ", buf, 2u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_preFilters;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v13, "shouldKeepEntry:", v4, (_QWORD)v25) & 1) == 0)
        {
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "uniqueName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            v19 = s_verbose;
            if (s_verbose)
            {
              objc_msgSend(v4, "serializedBase64String");
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v20 = &stru_1E4BDFC28;
            }
            *(_DWORD *)buf = 138413058;
            v30 = v18;
            v31 = 2048;
            v32 = (const char *)v4;
            v33 = 2112;
            v34 = v20;
            v35 = 2112;
            v36 = v4;
            _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} FILTERED by FILTER{%@} {%p:%@}:\n%@", buf, 0x2Au);
            if (v19)

          }
          GEOFindOrCreateLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v30 = v22;
            v31 = 2080;
            v32 = "pre-filtering";
            _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "pre-filtering", ", buf, 2u);
          }

          v16 = 0;
          goto LABEL_32;
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v10)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2080;
    v32 = "pre-filtering";
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(&v8->super.super))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, &v8->super.super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "pre-filtering", ", buf, 2u);
  }
  v16 = 1;
LABEL_32:

  return v16;
}

- (BOOL)postFiltersKept:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  int v19;
  __CFString *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2080;
    v32 = "post-filtering";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "post-filtering", ", buf, 2u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_postFilters;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v13, "shouldKeepEntry:", v4, (_QWORD)v25) & 1) == 0)
        {
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "uniqueName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            v19 = s_verbose;
            if (s_verbose)
            {
              objc_msgSend(v4, "serializedBase64String");
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v20 = &stru_1E4BDFC28;
            }
            *(_DWORD *)buf = 138413058;
            v30 = v18;
            v31 = 2048;
            v32 = (const char *)v4;
            v33 = 2112;
            v34 = v20;
            v35 = 2112;
            v36 = v4;
            _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} FILTERED by FILTER{%@} {%p:%@}:\n%@", buf, 0x2Au);
            if (v19)

          }
          GEOFindOrCreateLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v30 = v22;
            v31 = 2080;
            v32 = "post-filtering";
            _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

          }
          GEOFindOrCreateLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v23))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A427D000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "post-filtering", ", buf, 2u);
          }

          v16 = 0;
          goto LABEL_32;
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v10)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2080;
    v32 = "post-filtering";
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(&v8->super.super))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, &v8->super.super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "post-filtering", ", buf, 2u);
  }
  v16 = 1;
LABEL_32:

  return v16;
}

- (uint64_t)_dedupeByEnrichingEntries:(void *)a3 withEntry:
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  int v26;
  __CFString *v27;
  id WeakRetained;
  NSObject *v29;
  NSObject *v30;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = (id)objc_msgSend(v5, "copy");
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      v32 = v5;
      v33 = a1;
      v34 = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (v12 != v6)
          {
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v13 = *(id *)(a1 + 24);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v36;
              while (2)
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v36 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                  if (objc_msgSend(v18, "dedupeByEnrichingEntry:withEntry:", v12, v6))
                  {
                    GEOFindOrCreateLog();
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v18, "uniqueName");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                      v22 = s_verbose;
                      if (s_verbose)
                      {
                        objc_msgSend(v6, "serializedBase64String");
                        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v23 = &stru_1E4BDFC28;
                      }
                      *(_DWORD *)buf = 138413058;
                      v44 = v21;
                      v45 = 2048;
                      v46 = v6;
                      v47 = 2112;
                      v48 = v23;
                      v49 = 2112;
                      v50 = v6;
                      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} DUPED by DEDUPER{%@} {%p:%@}:\n%@", buf, 0x2Au);
                      if (v22)

                    }
                    GEOFindOrCreateLog();
                    v24 = objc_claimAutoreleasedReturnValue();
                    v5 = v32;
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v18, "uniqueName");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                      v26 = s_verbose;
                      if (s_verbose)
                      {
                        objc_msgSend(v12, "serializedBase64String");
                        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v27 = &stru_1E4BDFC28;
                      }
                      *(_DWORD *)buf = 138413058;
                      v44 = v25;
                      v45 = 2048;
                      v46 = v12;
                      v47 = 2112;
                      v48 = v27;
                      v49 = 2112;
                      v50 = v12;
                      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} ENRICHED by DEDUPER{%@} {%p:%@}:\n%@", buf, 0x2Au);
                      if (v26)

                    }
                    WeakRetained = objc_loadWeakRetained((id *)(v33 + 48));
                    objc_msgSend(WeakRetained, "removeEntry:", v6);

                    objc_msgSend(v32, "removeObjectIdenticalTo:", v6);
                    if ((unint64_t)objc_msgSend(v32, "count") >= 2)
                    {
                      GEOFindOrCreateLog();
                      v29 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "Calling recursive _dedupeByEnrichingEntries", buf, 2u);
                      }

                      -[MapsSuggestionsSimpleStrategy _dedupeByEnrichingEntries:withEntry:](v33, v32, v12);
                    }
                    GEOFindOrCreateLog();
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_DEBUG, "Returning YES from Deduping", buf, 2u);
                    }

                    a1 = 1;
                    v7 = v34;
                    v19 = v34;
                    goto LABEL_47;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
                if (v15)
                  continue;
                break;
              }
            }

            a1 = v33;
            v7 = v34;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
        v5 = v32;
      }
      while (v9);
    }

    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "Returning NO from Deduping", buf, 2u);
    }
    a1 = 0;
LABEL_47:

  }
  return a1;
}

- (id)topSuggestionsWithSourceEntries:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __CFString *v20;
  __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  char *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  NSObject *v55;
  char *v56;
  NSObject *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  int v66;
  const __CFString *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  char *v72;
  NSObject *v73;
  int v74;
  NSObject *v75;
  _BOOL4 v76;
  char *v77;
  NSObject *v78;
  char *v79;
  NSObject *v80;
  NSObject *v81;
  char *v82;
  int v83;
  const __CFString *v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  NSObject *v93;
  char *v94;
  NSObject *v95;
  NSObject *v96;
  char *v97;
  NSObject *v98;
  NSObject *v99;
  char *v100;
  NSObject *v101;
  id v103;
  uint64_t v104;
  uint64_t v105;
  id obj;
  uint64_t v107;
  __CFString *v108;
  void *v109;
  void *v110;
  MapsSuggestionsSimpleStrategy *v111;
  uint64_t v112;
  _QWORD *WeakRetained;
  NSMutableArray *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  uint8_t v151[128];
  uint8_t v152[4];
  void *v153;
  __int16 v154;
  const char *v155;
  __int16 v156;
  const __CFString *v157;
  __int16 v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint8_t v164[4];
  const char *v165;
  __int16 v166;
  int v167;
  __int16 v168;
  const char *v169;
  __int16 v170;
  const char *v171;
  uint8_t buf[4];
  const char *v173;
  __int16 v174;
  const char *v175;
  __int16 v176;
  id v177;
  __int16 v178;
  const __CFString *v179;
  __int16 v180;
  id v181;
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("Requires sourceEntries."));
      v86 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v86 = 0;
    }
    goto LABEL_153;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v173 = v8;
    v174 = 2080;
    v175 = "topSuggestionsWithSourceEntries";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsWithSourceEntries", ", buf, 2u);
  }

  v123 = v6;
  v111 = self;
  v103 = v6;
  if (self)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v173 = v11;
      v174 = 2080;
      v175 = "_filteredPreviousResults";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_filteredPreviousResults", ", buf, 2u);
    }

    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_previousResults, "count"));
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v13 = self->_previousResults;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v138;
      v112 = *(_QWORD *)v138;
      v114 = v13;
      do
      {
        v17 = 0;
        v118 = v15;
        do
        {
          if (*(_QWORD *)v138 != v16)
            objc_enumerationMutation(v13);
          v18 = *(char **)(*((_QWORD *)&v137 + 1) + 8 * v17);
          if (!-[MapsSuggestionsSimpleStrategy preFiltersKept:](self, "preFiltersKept:", v18))
          {
            GEOFindOrCreateLog();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v173 = v18;
              v38 = v37;
              v39 = "DROPPED pre-filtered previous result: %@";
              goto LABEL_39;
            }
LABEL_40:

            goto LABEL_41;
          }
          if (!-[MapsSuggestionsSimpleStrategy postFiltersKept:](self, "postFiltersKept:", v18))
          {
            GEOFindOrCreateLog();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v173 = v18;
              v38 = v37;
              v39 = "DROPPED post-filtered previous result: %@";
LABEL_39:
              _os_log_impl(&dword_1A427D000, v38, OS_LOG_TYPE_DEBUG, v39, buf, 0xCu);
            }
            goto LABEL_40;
          }
          v19 = v18;
          v20 = (__CFString *)v123;
          v21 = v20;
          if (v19)
          {
            v147 = 0u;
            v148 = 0u;
            v145 = 0u;
            v146 = 0u;
            v22 = v20;
            v120 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
            if (v120)
            {
              v23 = *(_QWORD *)v146;
              v108 = v21;
              v116 = *(_QWORD *)v146;
              do
              {
                v24 = 0;
                do
                {
                  if (*(_QWORD *)v146 != v23)
                  {
                    v25 = v24;
                    objc_enumerationMutation(v22);
                    v24 = v25;
                  }
                  v122 = v24;
                  -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * v24));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v141 = 0u;
                  v142 = 0u;
                  v143 = 0u;
                  v144 = 0u;
                  v27 = v26;
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v141, &v160, 16);
                  if (v28)
                  {
                    v29 = v28;
                    v30 = *(_QWORD *)v142;
                    while (2)
                    {
                      for (i = 0; i != v29; ++i)
                      {
                        if (*(_QWORD *)v142 != v30)
                          objc_enumerationMutation(v27);
                        v32 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
                        objc_msgSend(v19, "uniqueIdentifier");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "uniqueIdentifier");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v35 = objc_msgSend(v33, "isEqualToString:", v34);

                        if ((v35 & 1) != 0)
                        {

                          objc_msgSend(v109, "addObject:", v19);
                          self = v111;
                          v16 = v112;
                          v13 = v114;
                          v15 = v118;
                          goto LABEL_41;
                        }
                      }
                      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v141, &v160, 16);
                      if (v29)
                        continue;
                      break;
                    }
                  }

                  v24 = v122 + 1;
                  self = v111;
                  v16 = v112;
                  v13 = v114;
                  v23 = v116;
                  v15 = v118;
                  v21 = v108;
                }
                while (v122 + 1 != v120);
                v36 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                v23 = v116;
                v120 = v36;
              }
              while (v36);
            }
          }
          else
          {
            GEOFindOrCreateLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v164 = 136446978;
              v165 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
              v166 = 1024;
              v167 = 170;
              v168 = 2082;
              v169 = "-[MapsSuggestionsSimpleStrategy _entry:existsInStorage:]";
              v170 = 2082;
              v171 = "nil == (entry)";
              _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", v164, 0x26u);
            }
          }

          GEOFindOrCreateLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v173 = v19;
            _os_log_impl(&dword_1A427D000, v40, OS_LOG_TYPE_DEBUG, "DROPPED unaccounted previous result: %@", buf, 0xCu);
          }

LABEL_41:
          ++v17;
        }
        while (v17 != v15);
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
        v15 = v41;
      }
      while (v41);
    }

    GEOFindOrCreateLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v173 = v43;
      v174 = 2080;
      v175 = "_filteredPreviousResults";
      _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_filteredPreviousResults", ", buf, 2u);
    }

    v45 = v109;
  }
  else
  {
    v45 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = v123;
  v110 = v45;
  v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v151, 16);
  if (!v105)
    goto LABEL_126;
  v104 = *(_QWORD *)v134;
  do
  {
    v46 = 0;
    do
    {
      if (*(_QWORD *)v134 != v104)
      {
        v47 = v46;
        objc_enumerationMutation(obj);
        v46 = v47;
      }
      v107 = v46;
      v119 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v46);
      objc_msgSend(obj, "objectForKeyedSubscript:");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v129, v150, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v130;
        v115 = v48;
        v117 = *(_QWORD *)v130;
        do
        {
          v52 = 0;
          v121 = v50;
          do
          {
            if (*(_QWORD *)v130 != v51)
              objc_enumerationMutation(v48);
            v53 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v52);
            if ((objc_msgSend(v45, "containsObject:", v53) & 1) == 0)
            {
              if (!-[MapsSuggestionsSimpleStrategy preFiltersKept:](self, "preFiltersKept:", v53))
              {
                -[MapsSuggestionsManager removeEntry:sourceName:](WeakRetained, v53, v119);
                goto LABEL_122;
              }
              v124 = v52;
              v54 = v53;
              if (self)
              {
                GEOFindOrCreateLog();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
                  v56 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v173 = v56;
                  v174 = 2080;
                  v175 = "improving";
                  _os_log_impl(&dword_1A427D000, v55, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

                }
                GEOFindOrCreateLog();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_signpost_enabled(v57))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A427D000, v57, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "improving", ", buf, 2u);
                }

                v163 = 0u;
                v162 = 0u;
                v161 = 0u;
                v160 = 0u;
                v58 = self->_improvers;
                v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
                if (v59)
                {
                  v60 = v59;
                  v61 = *(_QWORD *)v161;
                  do
                  {
                    v62 = 0;
                    do
                    {
                      if (*(_QWORD *)v161 != v61)
                        objc_enumerationMutation(v58);
                      v63 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v62);
                      if (objc_msgSend(v63, "improveEntry:", v54))
                      {
                        GEOFindOrCreateLog();
                        v64 = (id)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v63, "uniqueName");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                          v66 = s_verbose;
                          if (s_verbose)
                          {
                            objc_msgSend(v54, "serializedBase64String");
                            v57 = objc_claimAutoreleasedReturnValue();
                            v67 = (const __CFString *)v57;
                          }
                          else
                          {
                            v67 = &stru_1E4BDFC28;
                          }
                          *(_DWORD *)v152 = 138413058;
                          v153 = v65;
                          v154 = 2048;
                          v155 = (const char *)v54;
                          v156 = 2112;
                          v157 = v67;
                          v158 = 2112;
                          v159 = v54;
                          _os_log_impl(&dword_1A427D000, v64, OS_LOG_TYPE_DEBUG, "{MSgDebug} IMPROVED by IMPROVER{%@} {%p:%@}:\n%@", v152, 0x2Au);
                          if (v66)

                        }
                      }
                      ++v62;
                    }
                    while (v60 != v62);
                    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
                  }
                  while (v60);
                }

                GEOFindOrCreateLog();
                v68 = objc_claimAutoreleasedReturnValue();
                v45 = v110;
                self = v111;
                v48 = v115;
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  -[MapsSuggestionsSimpleStrategy uniqueName](v111, "uniqueName");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v152 = 138412546;
                  v153 = v69;
                  v154 = 2080;
                  v155 = "improving";
                  _os_log_impl(&dword_1A427D000, v68, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v152, 0x16u);

                }
                GEOFindOrCreateLog();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_signpost_enabled(v70))
                {
                  *(_WORD *)v152 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A427D000, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "improving", ", v152, 2u);
                }

              }
              if ((objc_msgSend(v45, "containsObject:", v54) & 1) != 0)
                goto LABEL_121;
              GEOFindOrCreateLog();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
                v72 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v173 = v72;
                v174 = 2080;
                v175 = "deduping";
                _os_log_impl(&dword_1A427D000, v71, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

              }
              GEOFindOrCreateLog();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v73))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1A427D000, v73, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "deduping", ", buf, 2u);
              }

              v74 = -[MapsSuggestionsSimpleStrategy _dedupeByEnrichingEntries:withEntry:]((uint64_t)self, v45, v54);
              GEOFindOrCreateLog();
              v75 = objc_claimAutoreleasedReturnValue();
              v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG);
              if (!v74)
              {
                if (v76)
                {
                  -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
                  v79 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v173 = v79;
                  v174 = 2080;
                  v175 = "deduping";
                  _os_log_impl(&dword_1A427D000, v75, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

                }
                GEOFindOrCreateLog();
                v80 = objc_claimAutoreleasedReturnValue();
                if (os_signpost_enabled(v80))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A427D000, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deduping", ", buf, 2u);
                }

                GEOFindOrCreateLog();
                v81 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                {
                  -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
                  v82 = (char *)objc_claimAutoreleasedReturnValue();
                  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                  v83 = s_verbose;
                  if (s_verbose)
                  {
                    objc_msgSend(v54, "serializedBase64String");
                    v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v84 = v108;
                  }
                  else
                  {
                    v84 = &stru_1E4BDFC28;
                  }
                  *(_DWORD *)buf = 136316162;
                  v173 = "KEPT";
                  v174 = 2112;
                  v175 = v82;
                  v176 = 2048;
                  v177 = v54;
                  v178 = 2112;
                  v179 = v84;
                  v180 = 2112;
                  v181 = v54;
                  _os_log_impl(&dword_1A427D000, v81, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
                  if (v83)

                }
                objc_msgSend(v45, "addObject:", v54);
LABEL_121:
                v51 = v117;
                v50 = v121;
                v52 = v124;
                goto LABEL_122;
              }
              if (v76)
              {
                -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
                v77 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v173 = v77;
                v174 = 2080;
                v175 = "deduping";
                _os_log_impl(&dword_1A427D000, v75, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

              }
              GEOFindOrCreateLog();
              v78 = objc_claimAutoreleasedReturnValue();
              v51 = v117;
              v50 = v121;
              v52 = v124;
              if (os_signpost_enabled(v78))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1A427D000, v78, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deduping", ", buf, 2u);
              }

            }
LABEL_122:
            ++v52;
          }
          while (v52 != v50);
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v129, v150, 16);
        }
        while (v50);
      }

      v46 = v107 + 1;
    }
    while (v107 + 1 != v105);
    v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v151, 16);
  }
  while (v105);
LABEL_126:

  v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v86 = v45;
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v149, 16);
  if (!v87)
    goto LABEL_137;
  v88 = v87;
  v89 = *(_QWORD *)v126;
  while (2)
  {
    v90 = 0;
    while (2)
    {
      if (*(_QWORD *)v126 != v89)
        objc_enumerationMutation(v86);
      v91 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v90);
      if ((objc_msgSend(v91, "deleted") & 1) != 0)
      {
LABEL_134:
        objc_msgSend(v85, "addObject:", v91);
      }
      else if (!-[MapsSuggestionsSimpleStrategy postFiltersKept:](self, "postFiltersKept:", v91))
      {
        objc_msgSend(v91, "originatingSourceName");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsManager removeEntry:sourceName:](WeakRetained, v91, v92);

        goto LABEL_134;
      }
      if (v88 != ++v90)
        continue;
      break;
    }
    v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v149, 16);
    if (v88)
      continue;
    break;
  }
LABEL_137:

  objc_msgSend(v86, "removeObjectsInArray:", v85);
  GEOFindOrCreateLog();
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v94 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v173 = v94;
    v174 = 2080;
    v175 = "sorting";
    _os_log_impl(&dword_1A427D000, v93, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v95 = objc_claimAutoreleasedReturnValue();
  v6 = v103;
  if (os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v95, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "sorting", ", buf, 2u);
  }

  objc_msgSend(v86, "sortUsingComparator:", &__block_literal_global_28);
  GEOFindOrCreateLog();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v97 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v173 = v97;
    v174 = 2080;
    v175 = "sorting";
    _os_log_impl(&dword_1A427D000, v96, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v98 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v98))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v98, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "sorting", ", buf, 2u);
  }

  objc_storeStrong((id *)&self->_previousResults, v110);
  GEOFindOrCreateLog();
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsSimpleStrategy uniqueName](self, "uniqueName");
    v100 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v173 = v100;
    v174 = 2080;
    v175 = "topSuggestionsWithSourceEntries";
    _os_log_impl(&dword_1A427D000, v99, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v101 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v101, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsWithSourceEntries", ", buf, 2u);
  }

LABEL_153:
  return v86;
}

uint64_t __71__MapsSuggestionsSimpleStrategy_topSuggestionsWithSourceEntries_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "weight");
  v7 = v6;
  objc_msgSend(v5, "weight");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "weight");
    v11 = v10;
    objc_msgSend(v5, "weight");
    if (v11 <= v12)
    {
      objc_msgSend(v4, "numberForKey:", CFSTR("MapsSuggestionsOriginalPositionKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberForKey:", CFSTR("MapsSuggestionsOriginalPositionKey"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13 && v14)
      {
        v9 = objc_msgSend(v13, "compare:", v14);
      }
      else
      {
        objc_msgSend(v4, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        v9 = 0;
        if (v16 && v17)
          v9 = objc_msgSend(v16, "compare:", v17);

      }
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_addFilter:(uint64_t)a3 processingType:
{
  char *v5;
  char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v13;
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
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5)
    {
      if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE71C080) & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) != 0)
          {
            if (a3 == 2)
            {
              v7 = *(void **)(a1 + 32);
            }
            else
            {
              if (a3 != 1)
              {
                GEOFindOrCreateLog();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  v14 = 136446978;
                  v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
                  v16 = 1024;
                  v17 = 73;
                  v18 = 2082;
                  v19 = "-[MapsSuggestionsSimpleStrategy _filtersForprocessingType:]";
                  v20 = 2082;
                  v21 = "YES";
                  _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported _ProcessingType!", (uint8_t *)&v14, 0x26u);
                }

                v8 = 0;
                goto LABEL_27;
              }
              v7 = *(void **)(a1 + 8);
            }
            v8 = v7;
LABEL_27:
            -[NSObject addObject:](v8, "addObject:", v6);
            goto LABEL_20;
          }
          GEOFindOrCreateLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v14 = 138412290;
            v15 = v6;
            v9 = "Filter:%@ is not enabled. Returning.";
            goto LABEL_18;
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v14 = 138412290;
            v15 = v6;
            v9 = "Filter:%@ does not respond to isEnabled. This SHOULD NOT happen. Please file a radar.";
LABEL_18:
            v10 = v8;
            v11 = OS_LOG_TYPE_DEBUG;
            v12 = 12;
            goto LABEL_19;
          }
        }
LABEL_20:

        goto LABEL_21;
      }
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
      v16 = 1024;
      v17 = 329;
      v18 = 2082;
      v19 = "-[MapsSuggestionsSimpleStrategy _addFilter:processingType:]";
      v20 = 2082;
      v21 = "![filter conformsToProtocol:@protocol(MapsSuggestionsFilter)]";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Filter should conform to MapsSuggestionsFilter protocol";
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
      v16 = 1024;
      v17 = 328;
      v18 = 2082;
      v19 = "-[MapsSuggestionsSimpleStrategy _addFilter:processingType:]";
      v20 = 2082;
      v21 = "nil == (filter)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a filter";
    }
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 38;
LABEL_19:
    _os_log_impl(&dword_1A427D000, v10, v11, v9, (uint8_t *)&v14, v12);
    goto LABEL_20;
  }
LABEL_21:

}

- (void)addPreFilter:(id)a3
{
  -[MapsSuggestionsSimpleStrategy _addFilter:processingType:]((uint64_t)self, a3, 1);
}

- (void)addPostFilter:(id)a3
{
  -[MapsSuggestionsSimpleStrategy _addFilter:processingType:]((uint64_t)self, a3, 2);
}

- (void)removeFilter:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableSet *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = self->_preFilters;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;

            v8 = v12;
          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);

      if (v8)
        -[NSMutableSet removeObject:](self->_preFilters, "removeObject:", v8);
    }
    else
    {

      v8 = 0;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = self->_postFilters;
    v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (!v14)
    {
      v16 = v13;
      goto LABEL_28;
    }
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v19;

          v16 = v20;
        }
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);

    if (v16)
    {
      -[NSMutableSet removeObject:](self->_postFilters, "removeObject:", v16, (_QWORD)v21);
LABEL_28:

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
      v33 = 1024;
      v34 = 358;
      v35 = 2082;
      v36 = "-[MapsSuggestionsSimpleStrategy removeFilter:]";
      v37 = 2082;
      v38 = "nil == (filter)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a filter", buf, 0x26u);
    }
  }

}

- (void)removeAllFilters
{
  -[NSMutableSet removeAllObjects](self->_preFilters, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_postFilters, "removeAllObjects");
}

- (void)addImprover:(id)a3
{
  char *v4;
  char *v5;
  NSMutableArray *improvers;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
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
  v4 = (char *)a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    v16 = 1024;
    v17 = 390;
    v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addImprover:]";
    v20 = 2082;
    v21 = "nil == (improver)";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an improver";
LABEL_12:
    v11 = v9;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 38;
LABEL_18:
    _os_log_impl(&dword_1A427D000, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_19;
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE71B2F8) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    v16 = 1024;
    v17 = 391;
    v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addImprover:]";
    v20 = 2082;
    v21 = "![improver conformsToProtocol:@protocol(MapsSuggestionsImprover)]";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Improver should conform to MapsSuggestionsImprover protocol";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      v10 = "Improver:%@ does not respond to isEnabled. This SHOULD NOT happen. Please file a radar.";
LABEL_17:
      v11 = v9;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 12;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      v10 = "Improver:%@ is not enabled. Returning.";
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  improvers = self->_improvers;
  if (!improvers)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_improvers;
    self->_improvers = v7;

    improvers = self->_improvers;
  }
  -[NSMutableArray addObject:](improvers, "addObject:", v5);
LABEL_20:

}

- (void)removeAllImprovers
{
  NSMutableArray *improvers;

  -[NSMutableArray removeAllObjects](self->_improvers, "removeAllObjects");
  improvers = self->_improvers;
  self->_improvers = 0;

}

- (void)addDeduper:(id)a3
{
  char *v4;
  char *v5;
  NSMutableArray *dedupers;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
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
  v4 = (char *)a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    v16 = 1024;
    v17 = 419;
    v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addDeduper:]";
    v20 = 2082;
    v21 = "nil == (deduper)";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an deduper";
LABEL_12:
    v11 = v9;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 38;
LABEL_18:
    _os_log_impl(&dword_1A427D000, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_19;
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE71B280) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSimpleStrategy.m";
    v16 = 1024;
    v17 = 420;
    v18 = 2082;
    v19 = "-[MapsSuggestionsSimpleStrategy addDeduper:]";
    v20 = 2082;
    v21 = "![deduper conformsToProtocol:@protocol(MapsSuggestionsDeduper)]";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Deduper should conform to MapsSuggestionsDeduper protocol";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      v10 = "Deduper:%@ does not respond to isEnabled. This SHOULD NOT happen. Please file a radar.";
LABEL_17:
      v11 = v9;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 12;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      v10 = "Deduper:%@ is not enabled. Returning.";
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  dedupers = self->_dedupers;
  if (!dedupers)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_dedupers;
    self->_dedupers = v7;

    dedupers = self->_dedupers;
  }
  -[NSMutableArray addObject:](dedupers, "addObject:", v5);
LABEL_20:

}

- (void)removeAllDedupers
{
  NSMutableArray *dedupers;

  -[NSMutableArray removeAllObjects](self->_dedupers, "removeAllObjects");
  dedupers = self->_dedupers;
  self->_dedupers = 0;

}

- (MapsSuggestionsManager)manager
{
  return (MapsSuggestionsManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_previousResults, 0);
  objc_storeStrong((id *)&self->_postFilters, 0);
  objc_storeStrong((id *)&self->_dedupers, 0);
  objc_storeStrong((id *)&self->_improvers, 0);
  objc_storeStrong((id *)&self->_preFilters, 0);
}

@end
