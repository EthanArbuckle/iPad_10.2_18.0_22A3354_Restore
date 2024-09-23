@implementation MapsSuggestionsReInjectSource

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MapsSuggestionsReInjectSource *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *path;
  NSObject *v15;
  NSString *v16;
  MapsSuggestionsReInjectSource *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
      v24 = 1024;
      v25 = 84;
      v26 = 2082;
      v27 = "-[MapsSuggestionsReInjectSource initFromResourceDepot:name:]";
      v28 = 2082;
      v29 = "nil == (resourceDepot)";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_12:
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x26u);
    }
LABEL_13:

    v17 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
      v24 = 1024;
      v25 = 85;
      v26 = 2082;
      v27 = "-[MapsSuggestionsReInjectSource initFromResourceDepot:name:]";
      v28 = 2082;
      v29 = "nil == (resourceDepot.oneSourceDelegate)";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)MapsSuggestionsReInjectSource;
  v10 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v21, sel_initWithDelegate_name_, v9, v7);

  if (v10)
  {
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("MapsSuggestionsInjections.txt"));
    v13 = objc_claimAutoreleasedReturnValue();
    path = v10->_path;
    v10->_path = (NSString *)v13;

    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = v10->_path;
      *(_DWORD *)buf = 138412290;
      v23 = (const char *)v16;
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Using path: %@", buf, 0xCu);
    }

  }
  self = v10;
  v17 = self;
LABEL_14:

  return v17;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void *v34;
  NSObject *v35;
  id v36;
  char *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  uint32_t v44;
  id v45;
  char *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  char *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  double v61;
  NSObject *v62;
  void *v63;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void (**v69)(_QWORD);
  NSString *v70;
  MapsSuggestionsReInjectSource *v71;
  void (**v72)(_QWORD);
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t v92[128];
  uint8_t buf[4];
  NSString *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  void *v98;
  uint8_t v99[4];
  const char *v100;
  __int16 v101;
  _BYTE v102[14];
  __int16 v103;
  const char *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsCurrentBestLocation();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v94 = v7;
    v95 = 2112;
    v96 = CFSTR("ALL");
    v97 = 2112;
    v98 = v8;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

  }
  if ((objc_msgSend(v5, "fileExistsAtPath:", self->_path) & 1) != 0)
  {
    v9 = self->_path;
    v69 = v4;
    v10 = v9;
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v10;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Reading from: %@", buf, 0xCu);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfFile:encoding:error:", v10, 4, 0);
    v68 = v12;
    if (objc_msgSend(v12, "length"))
    {
      v66 = v5;
      v67 = v12;
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "_entriesFromMultilineString", buf, 2u);
      }

      v14 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v65 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "componentsSeparatedByCharactersInSet:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v17 = v15;
      v79 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
      if (v79)
      {
        v78 = *(_QWORD *)v89;
        v71 = self;
        v72 = v4;
        v70 = v10;
        v73 = v16;
        v76 = v17;
LABEL_11:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v89 != v78)
            objc_enumerationMutation(v17);
          v80 = v18;
          v19 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v18);
          objc_msgSend(*(id *)(v14 + 1280), "whitespaceCharacterSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v21, "length"))
          {
            if (objc_msgSend(v21, "characterAtIndex:", 0) != 35)
              break;
          }
LABEL_85:

          v18 = v80 + 1;
          if (v80 + 1 == v79)
          {
            v79 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
            if (!v79)
              goto LABEL_87;
            goto LABEL_11;
          }
        }
        v77 = v21;
        if (!objc_msgSend(v21, "hasPrefix:", CFSTR("APPLY ")))
        {
          +[MapsSuggestionsEntry entryFromSerializedString:](MapsSuggestionsEntry, "entryFromSerializedString:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v22 = v28;
            objc_msgSend(v28, "setExpires:", 0);
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            GEOFindOrCreateLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v99 = 138412290;
              v100 = (const char *)v19;
              _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "Cannot deserialize '%@'", v99, 0xCu);
            }

            v22 = 0;
          }
          goto LABEL_84;
        }
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v16, "lastObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "substringFromIndex:", objc_msgSend(CFSTR("APPLY "), "length"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "dataUsingEncoding:", 4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v87 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v24, 0, &v87);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (char *)v87;
          if (v26)
          {
            GEOFindOrCreateLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v99 = 138412546;
              v100 = v26;
              v101 = 2112;
              *(_QWORD *)v102 = v77;
              _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "Could not decode JSON: %@, for line: %@", v99, 0x16u);
            }
            goto LABEL_83;
          }
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v27 = v25;
          v30 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
          if (!v30)
          {
            v16 = v73;
LABEL_83:

            v17 = v76;
LABEL_84:

            v14 = 0x1E0CB3000;
            v21 = v77;
            goto LABEL_85;
          }
          v31 = v30;
          v74 = v25;
          v75 = v24;
          v82 = *(_QWORD *)v84;
LABEL_28:
          v32 = 0;
          while (1)
          {
            if (*(_QWORD *)v84 != v82)
              objc_enumerationMutation(v27);
            v33 = *(char **)(*((_QWORD *)&v83 + 1) + 8 * v32);
            -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            GEOFindOrCreateLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v99 = 138412546;
              v100 = v33;
              v101 = 2112;
              *(_QWORD *)v102 = v34;
              _os_log_impl(&dword_1A427D000, v35, OS_LOG_TYPE_DEBUG, "Applying %@ => %@", v99, 0x16u);
            }

            v36 = v22;
            v37 = v33;
            v38 = v34;
            v39 = v38;
            if (!v22)
              break;
            if (!v37)
            {
              GEOFindOrCreateLog();
              v41 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                goto LABEL_46;
              *(_DWORD *)v99 = 136446978;
              v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
              v101 = 1024;
              *(_DWORD *)v102 = 159;
              *(_WORD *)&v102[4] = 2082;
              *(_QWORD *)&v102[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
              v103 = 2082;
              v104 = "nil == (key)";
              v42 = v41;
              v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key";
              goto LABEL_44;
            }
            if (!v38)
            {
              GEOFindOrCreateLog();
              v41 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                goto LABEL_46;
              *(_DWORD *)v99 = 136446978;
              v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
              v101 = 1024;
              *(_DWORD *)v102 = 160;
              *(_WORD *)&v102[4] = 2082;
              *(_QWORD *)&v102[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
              v103 = 2082;
              v104 = "nil == (value)";
              v42 = v41;
              v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a value";
              goto LABEL_44;
            }
            v40 = v38;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              objc_msgSend(v36, "setString:forKey:", 0, v37);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v48 = qword_1ED22F638;
                  v49 = v40;
                  if (v48 != -1)
                    dispatch_once(&qword_1ED22F638, &__block_literal_global_39);
                  objc_msgSend((id)_MergedGlobals_51, "dateFromString:", v49);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                  v81 = v36;
                  v51 = v37;
                  v52 = v49;
                  if (v50)
                  {
                    if (objc_msgSend(v51, "isEqualToString:", CFSTR(".expires")))
                    {
                      v53 = (void *)objc_msgSend(v52, "copy");
                      objc_msgSend(v81, "setExpires:", v53);

                    }
                    else
                    {

                      v55 = qword_1ED22F638;
                      v56 = v52;
                      if (v55 != -1)
                        dispatch_once(&qword_1ED22F638, &__block_literal_global_39);
                      objc_msgSend((id)_MergedGlobals_51, "dateFromString:", v56);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v81, "setDate:forKey:", v57, v51);
                    }
                    goto LABEL_67;
                  }
                  if (objc_msgSend(v51, "isEqualToString:", CFSTR(".title")))
                  {
                    v54 = (void *)objc_msgSend(v52, "copy");
                    objc_msgSend(v81, "setTitle:", v54);
                    goto LABEL_75;
                  }
                  if (objc_msgSend(v51, "isEqualToString:", CFSTR(".subtitle")))
                  {
                    v54 = (void *)objc_msgSend(v52, "copy");
                    objc_msgSend(v81, "setSubtitle:", v54);
                    goto LABEL_75;
                  }
                  if (objc_msgSend(v51, "isEqualToString:", CFSTR(".undecoratedTitle")))
                  {
                    v54 = (void *)objc_msgSend(v52, "copy");
                    objc_msgSend(v81, "setUndecoratedTitle:", v54);
                    goto LABEL_75;
                  }
                  if (objc_msgSend(v51, "isEqualToString:", CFSTR(".undecoratedSubtitle")))
                  {
                    v54 = (void *)objc_msgSend(v52, "copy");
                    objc_msgSend(v81, "setUndecoratedSubtitle:", v54);
LABEL_75:

                  }
                  else
                  {
                    if (!objc_msgSend(v51, "isEqualToString:", CFSTR(".type")))
                    {

                      objc_msgSend(v81, "setString:forKey:", v52, v51);
                      goto LABEL_67;
                    }
                    objc_msgSend(v81, "_overrideType:", MapsSuggestionsEntryTypeFromString(v52));
                  }

                  goto LABEL_67;
                }

                GEOFindOrCreateLog();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v99 = 138412290;
                  v100 = v37;
                  v42 = v41;
                  v43 = "Cannot apply unknown type for key %@";
                  v44 = 12;
LABEL_45:
                  _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_ERROR, v43, v99, v44);
                }
LABEL_46:

                goto LABEL_67;
              }

              v45 = v36;
              v46 = v37;
              v47 = v40;
              if (objc_msgSend(v46, "isEqualToString:", CFSTR(".type")))
              {
                objc_msgSend(v45, "_overrideType:", objc_msgSend(v47, "unsignedIntegerValue"));
              }
              else
              {
                if (!objc_msgSend(v46, "isEqualToString:", CFSTR(".weight")))
                {

                  objc_msgSend(v45, "setNumber:forKey:", v47, v46);
                  goto LABEL_67;
                }
                objc_msgSend(v47, "doubleValue");
                objc_msgSend(v45, "setWeight:");
              }

            }
LABEL_67:

            if (v31 == ++v32)
            {
              v58 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
              v31 = v58;
              if (!v58)
              {
                self = v71;
                v4 = v72;
                v10 = v70;
                v16 = v73;
                v26 = 0;
                v25 = v74;
                v24 = v75;
                goto LABEL_83;
              }
              goto LABEL_28;
            }
          }
          GEOFindOrCreateLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)v99 = 136446978;
          v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          v101 = 1024;
          *(_DWORD *)v102 = 158;
          *(_WORD *)&v102[4] = 2082;
          *(_QWORD *)&v102[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          v103 = 2082;
          v104 = "nil == (entry)";
          v42 = v41;
          v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_44:
          v44 = 38;
          goto LABEL_45;
        }
        GEOFindOrCreateLog();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v99 = 136446978;
          v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          v101 = 1024;
          *(_DWORD *)v102 = 222;
          *(_WORD *)&v102[4] = 2082;
          *(_QWORD *)&v102[6] = "MapsSuggestionsEntries *_entriesFromMultilineString(NSString *__strong)";
          v103 = 2082;
          v104 = "0u == entries.count";
          _os_log_impl(&dword_1A427D000, v62, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Cannot modify a non-existing entry", v99, 0x26u);
        }

        v60 = 0;
        v59 = (void *)v65;
        v5 = v66;
      }
      else
      {
LABEL_87:

        if (!objc_msgSend(v16, "count"))
        {

          v16 = 0;
        }
        v59 = (void *)v65;
        v5 = v66;
        v60 = (void *)objc_msgSend(v16, "copy");
      }

    }
    else
    {
      v60 = 0;
    }

    if (v60)
      v63 = v60;
    else
      v63 = (void *)MEMORY[0x1E0C9AA60];
    -[MapsSuggestionsBaseSource addOrUpdateMySuggestionEntries:](self, "addOrUpdateMySuggestionEntries:", v63);
    if (v69)
      v69[2](v69);

    v61 = 300.0;
  }
  else
  {
    v61 = 0.0;
    if (v4)
      v4[2](v4);
  }

  return v61;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return 1;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

+ (id)_entriesFromMultilineString:(id)a3
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  NSObject *v28;
  id v29;
  char *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  char *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  id v41;
  char *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  char *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[128];
  uint8_t v81[4];
  const char *v82;
  __int16 v83;
  _BYTE v84[14];
  __int16 v85;
  const char *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "_entriesFromMultilineString", buf, 2u);
  }

  v4 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "componentsSeparatedByCharactersInSet:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v76;
    v65 = *(_QWORD *)v76;
    v59 = v7;
    v60 = v6;
LABEL_5:
    v11 = 0;
    v63 = v9;
    while (1)
    {
      if (*(_QWORD *)v76 != v10)
        objc_enumerationMutation(v7);
      v67 = v11;
      v12 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v11);
      objc_msgSend(*(id *)(v4 + 1280), "whitespaceCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length"))
      {
        if (objc_msgSend(v14, "characterAtIndex:", 0) != 35)
          break;
      }
LABEL_81:

      v11 = v67 + 1;
      if (v67 + 1 == v9)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
        if (!v9)
          goto LABEL_83;
        goto LABEL_5;
      }
    }
    if (!objc_msgSend(v14, "hasPrefix:", CFSTR("APPLY ")))
    {
      +[MapsSuggestionsEntry entryFromSerializedString:](MapsSuggestionsEntry, "entryFromSerializedString:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v15 = v21;
        objc_msgSend(v21, "setExpires:", 0);
        objc_msgSend(v6, "addObject:", v15);
      }
      else
      {
        GEOFindOrCreateLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v81 = 138412290;
          v82 = (const char *)v12;
          _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "Cannot deserialize '%@'", v81, 0xCu);
        }

        v15 = 0;
      }
      goto LABEL_80;
    }
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("APPLY "), "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataUsingEncoding:", 4);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v17;
      v74 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 0, &v74);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (char *)v74;
      v64 = v19;
      if (v66)
      {
        GEOFindOrCreateLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v81 = 138412546;
          v82 = v66;
          v83 = 2112;
          *(_QWORD *)v84 = v14;
          _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "Could not decode JSON: %@, for line: %@", v81, 0x16u);
        }
        goto LABEL_79;
      }
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v20 = v19;
      v23 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (!v23)
      {
        v4 = 0x1E0CB3000;
LABEL_79:

        v9 = v63;
LABEL_80:

        v10 = v65;
        goto LABEL_81;
      }
      v24 = v23;
      v61 = v18;
      v62 = v14;
      v69 = *(_QWORD *)v71;
LABEL_22:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v71 != v69)
          objc_enumerationMutation(v20);
        v26 = *(char **)(*((_QWORD *)&v70 + 1) + 8 * v25);
        -[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v81 = 138412546;
          v82 = v26;
          v83 = 2112;
          *(_QWORD *)v84 = v27;
          _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "Applying %@ => %@", v81, 0x16u);
        }

        v29 = v15;
        v30 = v26;
        v31 = v27;
        v32 = v31;
        if (!v15)
        {
          GEOFindOrCreateLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            goto LABEL_41;
          *(_DWORD *)v81 = 136446978;
          v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          v83 = 1024;
          *(_DWORD *)v84 = 158;
          *(_WORD *)&v84[4] = 2082;
          *(_QWORD *)&v84[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          v85 = 2082;
          v86 = "nil == (entry)";
          v38 = v37;
          v39 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_39:
          v40 = 38;
          goto LABEL_40;
        }
        if (!v30)
        {
          GEOFindOrCreateLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            goto LABEL_41;
          *(_DWORD *)v81 = 136446978;
          v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          v83 = 1024;
          *(_DWORD *)v84 = 159;
          *(_WORD *)&v84[4] = 2082;
          *(_QWORD *)&v84[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          v85 = 2082;
          v86 = "nil == (key)";
          v38 = v37;
          v39 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key";
          goto LABEL_39;
        }
        if (!v31)
        {
          GEOFindOrCreateLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            goto LABEL_41;
          *(_DWORD *)v81 = 136446978;
          v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          v83 = 1024;
          *(_DWORD *)v84 = 160;
          *(_WORD *)&v84[4] = 2082;
          *(_QWORD *)&v84[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          v85 = 2082;
          v86 = "nil == (value)";
          v38 = v37;
          v39 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a value";
          goto LABEL_39;
        }
        v33 = v31;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v41 = v29;
          v42 = v30;
          v43 = v33;
          if (objc_msgSend(v42, "isEqualToString:", CFSTR(".type")))
          {
            objc_msgSend(v41, "_overrideType:", objc_msgSend(v43, "unsignedIntegerValue"));
          }
          else
          {
            if (!objc_msgSend(v42, "isEqualToString:", CFSTR(".weight")))
            {

              objc_msgSend(v41, "setNumber:forKey:", v43, v42);
              goto LABEL_58;
            }
            objc_msgSend(v43, "doubleValue");
            objc_msgSend(v41, "setWeight:");
          }

          goto LABEL_54;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          GEOFindOrCreateLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v81 = 138412290;
            v82 = v30;
            v38 = v37;
            v39 = "Cannot apply unknown type for key %@";
            v40 = 12;
LABEL_40:
            _os_log_impl(&dword_1A427D000, v38, OS_LOG_TYPE_ERROR, v39, v81, v40);
          }
LABEL_41:

          goto LABEL_58;
        }
        v44 = qword_1ED22F638;
        v45 = v33;
        if (v44 != -1)
          dispatch_once(&qword_1ED22F638, &__block_literal_global_39);
        objc_msgSend((id)_MergedGlobals_51, "dateFromString:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = v29;
        v47 = v30;
        v48 = v45;
        if (!v46)
        {
          if (objc_msgSend(v47, "isEqualToString:", CFSTR(".title")))
          {
            v50 = (void *)objc_msgSend(v48, "copy");
            objc_msgSend(v68, "setTitle:", v50);
LABEL_71:

LABEL_72:
            goto LABEL_58;
          }
          if (objc_msgSend(v47, "isEqualToString:", CFSTR(".subtitle")))
          {
            v50 = (void *)objc_msgSend(v48, "copy");
            objc_msgSend(v68, "setSubtitle:", v50);
            goto LABEL_71;
          }
          if (objc_msgSend(v47, "isEqualToString:", CFSTR(".undecoratedTitle")))
          {
            v50 = (void *)objc_msgSend(v48, "copy");
            objc_msgSend(v68, "setUndecoratedTitle:", v50);
            goto LABEL_71;
          }
          if (objc_msgSend(v47, "isEqualToString:", CFSTR(".undecoratedSubtitle")))
          {
            v50 = (void *)objc_msgSend(v48, "copy");
            objc_msgSend(v68, "setUndecoratedSubtitle:", v50);
            goto LABEL_71;
          }
          if (objc_msgSend(v47, "isEqualToString:", CFSTR(".type")))
          {
            objc_msgSend(v68, "_overrideType:", MapsSuggestionsEntryTypeFromString(v48));
            goto LABEL_72;
          }

          v34 = v68;
          v35 = v48;
          v36 = v47;
          goto LABEL_32;
        }
        if (!objc_msgSend(v47, "isEqualToString:", CFSTR(".expires")))
        {

          v51 = qword_1ED22F638;
          v52 = v48;
          if (v51 != -1)
            dispatch_once(&qword_1ED22F638, &__block_literal_global_39);
          objc_msgSend((id)_MergedGlobals_51, "dateFromString:", v52);
          v41 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, "setDate:forKey:", v41, v47);
LABEL_54:

          goto LABEL_58;
        }
        v49 = (void *)objc_msgSend(v48, "copy");
        objc_msgSend(v68, "setExpires:", v49);

LABEL_58:
        if (v24 == ++v25)
        {
          v53 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          v24 = v53;
          if (!v53)
          {
            v7 = v59;
            v6 = v60;
            v4 = 0x1E0CB3000;
            v18 = v61;
            v14 = v62;
            goto LABEL_79;
          }
          goto LABEL_22;
        }
      }

      v34 = v29;
      v35 = 0;
      v36 = v30;
LABEL_32:
      objc_msgSend(v34, "setString:forKey:", v35, v36);
      goto LABEL_58;
    }
    GEOFindOrCreateLog();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v81 = 136446978;
      v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
      v83 = 1024;
      *(_DWORD *)v84 = 222;
      *(_WORD *)&v84[4] = 2082;
      *(_QWORD *)&v84[6] = "MapsSuggestionsEntries *_entriesFromMultilineString(NSString *__strong)";
      v85 = 2082;
      v86 = "0u == entries.count";
      _os_log_impl(&dword_1A427D000, v55, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Cannot modify a non-existing entry", v81, 0x26u);
    }

    v54 = 0;
  }
  else
  {
LABEL_83:

    if (!objc_msgSend(v6, "count"))
    {

      v6 = 0;
    }
    v54 = (void *)objc_msgSend(v6, "copy");
  }

  return v54;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
