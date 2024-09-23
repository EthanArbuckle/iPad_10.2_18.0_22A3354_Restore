@implementation MapsSuggestionsCache

+ (BOOL)loadFromFilePath:(id)a3 storage:(id *)a4 ETAValidUntilDate:(id *)a5
{
  char *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  BOOL v23;
  const char *v24;
  NSObject *v25;
  char *v26;
  NSObject *v27;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCache.m";
    v33 = 1024;
    *(_DWORD *)v34 = 155;
    *(_WORD *)&v34[4] = 2082;
    *(_QWORD *)&v34[6] = "+[MapsSuggestionsCache loadFromFilePath:storage:ETAValidUntilDate:]";
    v35 = 2082;
    v36 = "nil == (path)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires path";
LABEL_16:
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v24, buf, 0x26u);
    goto LABEL_17;
  }
  if (!a4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCache.m";
    v33 = 1024;
    *(_DWORD *)v34 = 156;
    *(_WORD *)&v34[4] = 2082;
    *(_QWORD *)&v34[6] = "+[MapsSuggestionsCache loadFromFilePath:storage:ETAValidUntilDate:]";
    v35 = 2082;
    v36 = "NULL == storage";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires out parameter for storage";
    goto LABEL_16;
  }
  if (a5)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 0, &v30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v30;
    if (!v8)
    {
      GEOFindOrCreateLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject localizedDescription](v9, "localizedDescription");
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v26;
        _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "Error parsing file. %@", buf, 0xCu);

      }
      -[NSObject localizedDescription](v9, "localizedDescription");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("Error parsing file. %s", (const char *)objc_msgSend(v14, "UTF8String"));
      v23 = 0;
      goto LABEL_28;
    }
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (id)objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
    v16 = objc_msgSend(v15, "decodeIntegerForKey:", CFSTR("MapsSuggestionsCacheVersionKey"));
    objc_msgSend(v15, "decodeObjectOfClasses:forKey:", v14, CFSTR("MapsSuggestionsCacheStorageKey"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsCacheETAValidUntilKey"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishDecoding");
    objc_msgSend(v15, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v15, "error");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v7;
        v33 = 2112;
        *(_QWORD *)v34 = v19;
        _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, "%@ failed with error: %@", buf, 0x16u);

      }
      v20 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      objc_msgSend(v15, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "description");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("%s failed with exception: %s", v20, (const char *)objc_msgSend(v22, "UTF8String"));

    }
    else
    {
      if (v16 != 19)
      {
        GEOFindOrCreateLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v7;
          v33 = 1024;
          *(_DWORD *)v34 = v16;
          *(_WORD *)&v34[4] = 1024;
          *(_DWORD *)&v34[6] = 19;
          _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "%@ was of version %u instead of %u.", buf, 0x18u);
        }

        v23 = 0;
        *a4 = 0;
        *a5 = 0;
        goto LABEL_27;
      }
      if (*a4)
      {
        v23 = 1;
        goto LABEL_27;
      }
      GEOFindOrCreateLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "%@ returned nil storage.", buf, 0xCu);
      }

      printf("%s returned nil storage.", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    }
    v23 = 0;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCache.m";
    v33 = 1024;
    *(_DWORD *)v34 = 157;
    *(_WORD *)&v34[4] = 2082;
    *(_QWORD *)&v34[6] = "+[MapsSuggestionsCache loadFromFilePath:storage:ETAValidUntilDate:]";
    v35 = 2082;
    v36 = "NULL == date";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires out parameter for date";
    goto LABEL_16;
  }
LABEL_17:
  v23 = 0;
LABEL_29:

  return v23;
}

+ (BOOL)saveToFilePath:(id)a3 storage:(id)a4 ETAValidUntilDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v10, "encodeInteger:forKey:", 19, CFSTR("MapsSuggestionsCacheVersionKey"));
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("MapsSuggestionsCacheStorageKey"));
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("MapsSuggestionsCacheETAValidUntilKey"));
  objc_msgSend(v10, "encodedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "writeToFile:atomically:", v7, 0);

  return v12;
}

@end
