@implementation ATXHeuristicAlarmUtilities

+ (id)alarmTrigger
{
  void *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;

  +[ATXHeuristicDevice sharedAlarmManager](ATXHeuristicDevice, "sharedAlarmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkIn");

  v3 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  return -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v3, "initWithNotification:type:", *MEMORY[0x1E0D4F950], 0);
}

+ (id)localizedTimeWithAlarmDict:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "fireDateWithAlarmDict:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setTimeStyle:", 1);
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isValidNonRecentlyModifiedAlarm:(id)a3 duringInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playsOnThisDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastModifiedTS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(v6, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  objc_msgSend(v8, "doubleValue");
  if (v15 >= v11)
  {
    objc_msgSend(v8, "doubleValue");
    v16 = v17 <= v14;
  }
  else
  {
    v16 = 0;
  }
  __atxlog_handle_context_heuristic();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    +[ATXHeuristicAlarmUtilities localizedTimeWithAlarmDict:](ATXHeuristicAlarmUtilities, "localizedTimeWithAlarmDict:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v21, 1, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

    v25 = 138412802;
    v26 = v19;
    v27 = 2112;
    v28 = v22;
    v29 = 1024;
    v30 = v16;
    _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "ATXHeuristicAlarmUtilities: alarm at %@ was modified at %@ recently? %{BOOL}d", (uint8_t *)&v25, 0x1Cu);

  }
  v23 = objc_msgSend(v7, "BOOLValue");

  return v23 & !v16;
}

+ (id)firstFiringAmongAlarms:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v7)
        {
          +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:](ATXHeuristicAlarmUtilities, "fireDateWithAlarmDict:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "compare:", v6) == -1)
          {
            v11 = v11;

            v12 = v10;
            v6 = v11;
            v7 = v12;
          }
        }
        else
        {
          v7 = v10;
          +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:](ATXHeuristicAlarmUtilities, "fireDateWithAlarmDict:", v7);
          v11 = v6;
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v7;
}

+ (id)fireDateWithAlarmDict:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MTAlarm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextFireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)alarmDataWithAlarmDict:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MTAlarm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CBD9C0]);
  objc_msgSend(v5, "encodeObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
