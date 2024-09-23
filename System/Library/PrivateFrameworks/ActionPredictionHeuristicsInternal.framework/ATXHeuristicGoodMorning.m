@implementation ATXHeuristicGoodMorning

- (id)permanentRefreshTriggers
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v7;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "contextDateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning permanentRefreshTriggers, context valid from %@ to %@", buf, 0x16u);

  }
  +[ATXHeuristicAlarmUtilities alarmTrigger](ATXHeuristicAlarmUtilities, "alarmTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v8 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v7, "initWithNotification:type:", *MEMORY[0x1E0C998A0], 0);
  v9 = (void *)MEMORY[0x1CAA46CBC]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v8, 0);
  objc_autoreleasePoolPop(v9);

  return v10;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  ATXContextWeatherSuggestionProducer *v11;
  void *v12;
  void *v13;
  ATXContextWebsiteSuggestionProducer *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  ATXContextHeuristicResult *v20;
  NSObject *v21;
  ATXContextAlarmSuggestionProducer *v23;
  ATXContextWeatherSuggestionProducer *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning heuristicResultWithEnvironment", buf, 2u);
  }

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    -[ATXHeuristicGoodMorning _addRefreshTimeTriggerWithHour:refreshTriggers:](self, "_addRefreshTimeTriggerWithHour:refreshTriggers:", 6, v6);
    -[ATXHeuristicGoodMorning _addRefreshTimeTriggerWithHour:refreshTriggers:](self, "_addRefreshTimeTriggerWithHour:refreshTriggers:", 10, v6);
    v7 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "contextDateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsDate:", v9);

    if (v10)
    {
      v11 = -[ATXContextWeatherSuggestionProducer initWithValidDateInterval:reasonCode:score:]([ATXContextWeatherSuggestionProducer alloc], "initWithValidDateInterval:reasonCode:score:", v8, 40, 50.0);
      -[ATXContextWeatherSuggestionProducer weatherSuggestionWithRefreshTriggers:](v11, "weatherSuggestionWithRefreshTriggers:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[ATXContextWeatherSuggestionProducer dummySuggestion](v11, "dummySuggestion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = v11;
      objc_msgSend(v7, "addObject:", v12);
      v23 = -[ATXContextAlarmSuggestionProducer initWithValidDateInterval:reasonCode:score:]([ATXContextAlarmSuggestionProducer alloc], "initWithValidDateInterval:reasonCode:score:", v8, 40, 45.0);
      -[ATXContextAlarmSuggestionProducer morningAlarmToggleSuggestionsWithEnvironment:](v23, "morningAlarmToggleSuggestionsWithEnvironment:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v13);

      v14 = -[ATXContextWebsiteSuggestionProducer initWithValidDateInterval:reasonCode:score:]([ATXContextWebsiteSuggestionProducer alloc], "initWithValidDateInterval:reasonCode:score:", v8, 40, 40.0);
      -[ATXContextWebsiteSuggestionProducer websiteSuggestions](v14, "websiteSuggestions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19++));
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v17);
      }

    }
    v20 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v7, v6);

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning heuristicResultWithEnvironment feature: zkw_routines is off. Dropping", buf, 2u);
    }

    v20 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v20;
}

- (void)_addRefreshTimeTriggerWithHour:(unint64_t)a3 refreshTriggers:(id)a4
{
  id v5;
  void *v6;
  ATXInformationHeuristicRefreshTimeTrigger *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "nextDateWithHour:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXInformationHeuristicRefreshTimeTrigger initWithFireDate:]([ATXInformationHeuristicRefreshTimeTrigger alloc], "initWithFireDate:", v6);
  __atxlog_handle_context_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning _addRefreshTimeTriggerWithHour adding a trigger at %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "addObject:", v7);
}

+ (id)contextDateInterval
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", 6, 0, 0, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", 10, 0, 0, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v5);

  return v6;
}

+ (id)nextDateWithHour:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", a3, 0, 0, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "compare:", v4) == -1)
  {
    do
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v8, "setDay:", 1);
      objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v8, v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v7;
    }
    while (objc_msgSend(v7, "compare:", v4) == -1);
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

@end
