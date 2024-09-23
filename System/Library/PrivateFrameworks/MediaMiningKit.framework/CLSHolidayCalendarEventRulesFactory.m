@implementation CLSHolidayCalendarEventRulesFactory

+ (id)eventRulesSourcesURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  if (a3)
  {
    objc_msgSend(a1, "eventRulesURLForSourceURL:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "_eventRulesDictionariesForURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_allEventRulesForEventRulesDictionaries:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

    return v6;
  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "Sources URL is nil. Returning no eventRules.", v10, 2u);
    }

    return MEMORY[0x1E0C9AA60];
  }
}

+ (id)eventRules
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventRulesSourcesURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)eventRulesURLForSourceURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("all_v2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allSupportedCountryCodes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "_baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventRulesURLForSourceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_eventRulesDictionariesForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allEventRulesForEventRulesDictionaries:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "explicitlySupportedCountryCodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v3;
}

+ (id)_allEventRulesForEventRulesDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CLSHolidayCalendarEventRule *v11;
  CLSHolidayCalendarEventRule *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [CLSHolidayCalendarEventRule alloc];
        v12 = -[CLSHolidayCalendarEventRule initWithEventDescription:](v11, "initWithEventDescription:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_eventRulesDictionariesForURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", a3, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("events"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_INFO, "Error reading the holiday rules file: \"%@\", buf, 0xCu);

    }
    v10 = 0;
  }

  return v10;
}

+ (id)_baseURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("CLSHolidayCalendarEventRules"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
