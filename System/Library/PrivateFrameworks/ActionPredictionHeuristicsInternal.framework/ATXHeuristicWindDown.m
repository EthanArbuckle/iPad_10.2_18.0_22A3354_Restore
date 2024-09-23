@implementation ATXHeuristicWindDown

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
  -[ATXHeuristicWindDown _contextDateInterval](self, "_contextDateInterval");
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
    _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown permanentRefreshTriggers, context valid from %@ to %@", buf, 0x16u);

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
  int v9;
  ATXContextAlarmSuggestionProducer *v10;
  void *v11;
  ATXContextWebsiteSuggestionProducer *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ATXContextWeatherSuggestionProducer *v18;
  void *v19;
  void *v20;
  ATXContextHeuristicResult *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown heuristicResultWithEnvironment", buf, 2u);
  }

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    -[ATXHeuristicWindDown _contextDateInterval](self, "_contextDateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsDate:", v8);

    if (v9)
    {
      v10 = -[ATXContextAlarmSuggestionProducer initWithValidDateInterval:reasonCode:score:]([ATXContextAlarmSuggestionProducer alloc], "initWithValidDateInterval:reasonCode:score:", v7, 41, 40.0);
      -[ATXContextAlarmSuggestionProducer editNextAlarmSuggestionsWithEnvironment:](v10, "editNextAlarmSuggestionsWithEnvironment:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v11);

      v12 = -[ATXContextWebsiteSuggestionProducer initWithValidDateInterval:reasonCode:score:]([ATXContextWebsiteSuggestionProducer alloc], "initWithValidDateInterval:reasonCode:score:", v7, 41, 40.0);
      -[ATXContextWebsiteSuggestionProducer websiteSuggestions](v12, "websiteSuggestions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17++));
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v15);
      }
      v18 = -[ATXContextWeatherSuggestionProducer initWithValidDateInterval:reasonCode:score:]([ATXContextWeatherSuggestionProducer alloc], "initWithValidDateInterval:reasonCode:score:", v7, 41, 40.0);
      -[ATXContextWeatherSuggestionProducer dummySuggestion](v18, "dummySuggestion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v6, "addObject:", v19);

    }
    v20 = (void *)objc_opt_new();
    -[ATXHeuristicWindDown _addRefreshTimeTriggerWithHour:refreshTriggers:](self, "_addRefreshTimeTriggerWithHour:refreshTriggers:", 21, v20);
    -[ATXHeuristicWindDown _addRefreshTimeTriggerWithHour:refreshTriggers:](self, "_addRefreshTimeTriggerWithHour:refreshTriggers:", 23, v20);
    v21 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v6, v20);

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown heuristicResultWithEnvironment feature: zkw_routines is off. Dropping", buf, 2u);
    }

    v21 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v21;
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
  +[ATXHeuristicGoodMorning nextDateWithHour:](ATXHeuristicGoodMorning, "nextDateWithHour:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXInformationHeuristicRefreshTimeTrigger initWithFireDate:]([ATXInformationHeuristicRefreshTimeTrigger alloc], "initWithFireDate:", v6);
  __atxlog_handle_context_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown _addRefreshTimeTriggerWithHour adding a trigger at %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "addObject:", v7);
}

- (id)_contextDateInterval
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
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", 21, 0, 0, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", 23, 0, 0, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v5);

  return v6;
}

@end
