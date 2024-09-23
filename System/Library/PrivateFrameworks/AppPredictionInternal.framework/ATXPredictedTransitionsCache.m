@implementation ATXPredictedTransitionsCache

- (ATXPredictedTransitionsCache)initWithLocationManager:(id)a3
{
  id v5;
  ATXPredictedTransitionsCache *v6;
  ATXPredictedTransitionsCache *v7;
  uint64_t v8;
  NSMutableDictionary *homeToWork;
  uint64_t v10;
  NSMutableDictionary *workToHome;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXPredictedTransitionsCache;
  v6 = -[ATXPredictedTransitionsCache init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    v8 = objc_opt_new();
    homeToWork = v7->_homeToWork;
    v7->_homeToWork = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    workToHome = v7->_workToHome;
    v7->_workToHome = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (id)getNextHomeToWorkTransitionsOnActivity:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableDictionary *homeToWork;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = objc_claimAutoreleasedReturnValue();
  -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:](self, "fetchEntriesStartingDate:onActivity:", v6, v5);

  LOBYTE(v6) = objc_msgSend(v5, "shouldDefer");
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_class();
    homeToWork = self->_homeToWork;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getNextTransitionInCache:fromDate:", homeToWork, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)getNextWorkToHomeTransitionsOnActivity:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableDictionary *workToHome;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = objc_claimAutoreleasedReturnValue();
  -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:](self, "fetchEntriesStartingDate:onActivity:", v6, v5);

  LOBYTE(v6) = objc_msgSend(v5, "shouldDefer");
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_class();
    workToHome = self->_workToHome;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getNextTransitionInCache:fromDate:", workToHome, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)ceilingDateToNextHour:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 60, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", 3600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getNextTransitionInCache:(id)a3 fromDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "ceilingDateToNextHour:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)prewarmOnActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXPredictedTransitionsCache dump](self, "dump");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:](self, "fetchEntriesStartingDate:onActivity:", v5, v4);

}

- (void)fetchEntriesStartingDate:(id)a3 onActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v27[16];

  v6 = a3;
  v7 = a4;
  -[ATXPredictedTransitionsCache pruneStaleEntries](self, "pruneStaleEntries");
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double)(unint64_t)objc_msgSend(v8, "transitionLookaheadMinSeconds");

  objc_msgSend(v6, "dateByAddingTimeInterval:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ceilingDateToNextHour:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)(unint64_t)objc_msgSend(v12, "transitionLookaheadMaxSeconds");

  objc_msgSend(v6, "dateByAddingTimeInterval:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_dailyroutines();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:].cold.3();

  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v17 = v16;
  v18 = objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  if (v17 >= v19)
  {
LABEL_17:
    v21 = v11;
LABEL_18:
    -[ATXPredictedTransitionsCache dump](self, "dump");
    v11 = v21;
  }
  else
  {
    while (1)
    {
      v20 = (void *)MEMORY[0x1CAA48B6C](v18);
      if (objc_msgSend(v7, "shouldDefer"))
        break;
      if (!-[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:](self, "cacheHeadingFromLoiType:toLoiType:forDate:", 1, 0, v11))
      {
        __atxlog_handle_dailyroutines();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
LABEL_15:
          -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:].cold.1();
LABEL_16:

        objc_autoreleasePoolPop(v20);
        goto LABEL_17;
      }
      if (!-[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:](self, "cacheHeadingFromLoiType:toLoiType:forDate:", 0, 1, v11))
      {
        __atxlog_handle_dailyroutines();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          goto LABEL_15;
        goto LABEL_16;
      }
      objc_msgSend(v11, "dateByAddingTimeInterval:", 3600.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v20);
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      v23 = v22;
      v18 = objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v11 = v21;
      if (v23 >= v24)
        goto LABEL_18;
    }
    __atxlog_handle_dailyroutines();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "Abandoning cache update early since we were asked to defer", v27, 2u);
    }

    objc_autoreleasePoolPop(v20);
  }

}

- (BOOL)cacheHeadingFromLoiType:(int64_t)a3 toLoiType:(int64_t)a4 forDate:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  __atxlog_handle_dailyroutines();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.7();

  objc_msgSend(MEMORY[0x1E0D80DC8], "stringForLOIType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80DC8], "stringForLOIType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictedTransitionsCache cacheForDestinationLoiType:](self, "cacheForDestinationLoiType:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      __atxlog_handle_dailyroutines();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.6();
      v16 = 1;
      goto LABEL_38;
    }
    -[ATXPredictedLocationsManagerProtocol getPredictedLocationsOfInterestFromLOIName:startDate:](self->_manager, "getPredictedLocationsOfInterestFromLOIName:startDate:", v10, v8);
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v17)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v17;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v19)
      {
        v20 = v19;
        v31 = v11;
        v21 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "type") == a4)
            {
              __atxlog_handle_dailyroutines();
              v24 = objc_claimAutoreleasedReturnValue();
              v11 = v31;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.5();

              v23 = 1;
              goto LABEL_25;
            }
          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v20)
            continue;
          break;
        }
        v23 = 0;
        v11 = v31;
      }
      else
      {
        v23 = 0;
      }
LABEL_25:

      v25 = objc_opt_new();
      if (!v23)
      {
        __atxlog_handle_dailyroutines();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.4();
        v27 = v25;
        goto LABEL_32;
      }
      -[ATXPredictedLocationsManagerProtocol getPredictedExitTimesFromLOIName:startDate:](self->_manager, "getPredictedExitTimesFromLOIName:startDate:", v10, v8);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = v26;

        __atxlog_handle_dailyroutines();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.3();
LABEL_32:

        objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, v8);
        v16 = 1;
        v25 = v27;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      __atxlog_handle_dailyroutines();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.2();

    }
    else
    {
      __atxlog_handle_dailyroutines();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.1();
    }
    v16 = 0;
    goto LABEL_37;
  }
  v16 = 0;
LABEL_39:

  return v16;
}

- (id)cacheForDestinationLoiType:(int64_t)a3
{
  NSMutableDictionary *homeToWork;
  NSMutableDictionary *v4;
  NSObject *v5;

  if (a3 == 1)
  {
    homeToWork = self->_homeToWork;
    goto LABEL_5;
  }
  if (!a3)
  {
    homeToWork = self->_workToHome;
LABEL_5:
    v4 = homeToWork;
    return v4;
  }
  __atxlog_handle_dailyroutines();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[ATXPredictedTransitionsCache cacheForDestinationLoiType:].cold.1();

  v4 = 0;
  return v4;
}

- (void)dump
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "homeToWork transitions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)pruneStaleEntries
{
  void *v3;
  NSMutableDictionary *homeToWork;
  void *v5;
  void *v6;
  NSMutableDictionary *workToHome;
  id v8;

  v3 = (void *)objc_opt_class();
  homeToWork = self->_homeToWork;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEntriesFromCache:beforeDate:", homeToWork, v5);

  v6 = (void *)objc_opt_class();
  workToHome = self->_workToHome;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeEntriesFromCache:beforeDate:", workToHome, v8);

}

+ (void)removeEntriesFromCache:(id)a3 beforeDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__ATXPredictedTransitionsCache_removeEntriesFromCache_beforeDate___block_invoke;
  v11[3] = &unk_1E82DC3C8;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "_pas_filteredArrayWithTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_dailyroutines();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[ATXPredictedTransitionsCache removeEntriesFromCache:beforeDate:].cold.1();

  objc_msgSend(v6, "removeObjectsForKeys:", v9);
}

BOOL __66__ATXPredictedTransitionsCache_removeEntriesFromCache_beforeDate___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return v4 < v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workToHome, 0);
  objc_storeStrong((id *)&self->_homeToWork, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)fetchEntriesStartingDate:onActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Abandoning cache update early because an error was detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)fetchEntriesStartingDate:onActivity:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_2(&dword_1C9A3B000, v0, v1, "Fetching entries from %@ to %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Error while attempting to fetch predicted LOI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Error while attempting to fetch predicted exit times", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_2(&dword_1C9A3B000, v0, v1, "Caching transition to %@ for time: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Caching no transition for time: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Found ->%@ transition", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Skipping time %@, already cached", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Attempting to update for time: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheForDestinationLoiType:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "Asked to cache for unsupported loi type %ld", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

+ (void)removeEntriesFromCache:beforeDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Pruning dates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
