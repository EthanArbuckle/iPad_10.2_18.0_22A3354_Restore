@implementation ATXContextAlarmSuggestionProducer

- (ATXContextAlarmSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5
{
  id v9;
  ATXContextAlarmSuggestionProducer *v10;
  ATXContextAlarmSuggestionProducer *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXContextAlarmSuggestionProducer;
  v10 = -[ATXContextAlarmSuggestionProducer init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_validDateInterval, a3);
    v11->_reasonCode = a4;
    v11->_score = a5;
  }

  return v11;
}

- (id)morningAlarmToggleSuggestionsWithEnvironment:(id)a3
{
  void *v4;
  int64_t reasonCode;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id obj;
  ATXContextAlarmSuggestionProducer *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint8_t v42;
  _BYTE v43[15];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  -[ATXContextAlarmSuggestionProducer _morningAlarmsWithEnvironment:](self, "_morningAlarmsWithEnvironment:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  reasonCode = self->_reasonCode;
  v35 = (id)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v4;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  v6 = 0;
  if (v41)
  {
    v34 = 1 << reasonCode;
    v7 = *(_QWORD *)v45;
    v8 = 0x1E82C3000uLL;
    v36 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(*(id *)(v8 + 2528), "localizedTimeWithAlarmDict:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_context_heuristic();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayTitle"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412547;
          v49 = v11;
          v50 = 2117;
          v51 = v13;
          _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment found one morning alarm that fires at %@, %{sensitive}@", buf, 0x16u);

        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isSleepAlarm"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "BOOLValue"))
        {
          __atxlog_handle_context_heuristic();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isSleepAlarm"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = v11;
            v50 = 2112;
            v51 = v16;
            _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: %@ morningAlarm[isSleepAlarm]=%@, skipping", buf, 0x16u);

          }
        }
        else
        {
          if (v11)
          {
            v17 = v11;
          }
          else
          {
            objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("TOGGLE_ALARM_TITLE"), &stru_1E82C5A18, 0);
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v39 = v17;

          __atxlog_handle_context_heuristic();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment Creating update alarm action for one alarm", buf, 2u);
          }
          v40 = v11;

          objc_msgSend(*(id *)(v8 + 2528), "alarmDataWithAlarmDict:", v10);
          v15 = objc_claimAutoreleasedReturnValue();
          v19 = objc_alloc(MEMORY[0x1E0DC7DD0]);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("alarmID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayTitle"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v19, "initWithAlarmIdentifier:alarmName:alarmData:operation:", v20, v21, v15, 2);

          __atxlog_handle_context_heuristic();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment Creating WFToggleAlarmContextualAction for one alarm", buf, 2u);
          }

          -[ATXContextAlarmSuggestionProducer _criteriaWithAlarm:](v38, "_criteriaWithAlarm:", v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v22, v24);
            +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:](ATXHeuristicAlarmUtilities, "fireDateWithAlarmDict:", v10);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v26, "timeIntervalSinceReferenceDate");
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%f"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v39;
            +[ATXContextHeuristicSuggestionProducer suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:", v25, v34, 0, v39, v29, 0, v38->_score);
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v35, "addObject:", v30);
            v7 = v36;
            v11 = v40;
          }
          else
          {
            __atxlog_handle_context_heuristic();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              -[ATXContextAlarmSuggestionProducer morningAlarmToggleSuggestionsWithEnvironment:].cold.1(&v42, v43, v30);
            v7 = v36;
            v6 = v39;
          }

          v8 = 0x1E82C3000;
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v41);
  }

  return v35;
}

- (id)_criteriaWithAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    __atxlog_handle_context_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXContextAlarmSuggestionProducer _criteriaWithAlarm:].cold.1(v7, v15, v16);
    goto LABEL_9;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minute"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    __atxlog_handle_context_heuristic();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXContextAlarmSuggestionProducer _criteriaWithAlarm:].cold.2(v17, v18, v19);

LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "integerValue");
  v9 = -[NSObject integerValue](v7, "integerValue");
  -[NSDateInterval startDate](self->_validDateInterval, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", v8, v9, 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CF8C28]);
  -[NSDateInterval startDate](self->_validDateInterval, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:lockScreenEligible:predicate:", v13, v11, 0, 0);

LABEL_10:
  return v14;
}

- (id)editNextAlarmSuggestionsWithEnvironment:(id)a3
{
  NSDateInterval *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = self->_validDateInterval;
  -[ATXContextAlarmSuggestionProducer _nextMorningAlarmsWithEnvironment:](self, "_nextMorningAlarmsWithEnvironment:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: editNextAlarmSuggestionsWithEnvironment morningAlarms=%@", buf, 0xCu);
  }

  v8 = objc_alloc(MEMORY[0x1E0CF8C28]);
  -[NSDateInterval startDate](v5, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:lockScreenEligible:predicate:", v9, v10, 0, 0);

  if (v11)
  {
    if (objc_msgSend(v6, "count"))
    {
      +[ATXHeuristicAlarmUtilities firstFiringAmongAlarms:](ATXHeuristicAlarmUtilities, "firstFiringAmongAlarms:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[ATXHeuristicAlarmUtilities localizedTimeWithAlarmDict:](ATXHeuristicAlarmUtilities, "localizedTimeWithAlarmDict:", v12);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_context_heuristic();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("displayTitle"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412547;
          v35 = v32;
          v36 = 2117;
          v37 = v14;
          _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: editNextAlarmSuggestionsWithEnvironment found one morning alarm that fires at %@, %{sensitive}@", buf, 0x16u);

        }
        __atxlog_handle_context_heuristic();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: editNextAlarmSuggestionsWithEnvironment Creating update alarm action for one alarm", buf, 2u);
        }

        v30 = 1 << self->_reasonCode;
        +[ATXHeuristicAlarmUtilities alarmDataWithAlarmDict:](ATXHeuristicAlarmUtilities, "alarmDataWithAlarmDict:", v12);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc(MEMORY[0x1E0DC7DD0]);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("alarmID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("displayTitle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)v16;
        v20 = (void *)objc_msgSend(v17, "initWithAlarmIdentifier:alarmName:alarmData:operation:", v18, v19, v16, 2);

        __atxlog_handle_context_heuristic();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment Creating WFToggleAlarmContextualAction for one alarm", buf, 2u);
        }

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v20, v11);
        +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:](ATXHeuristicAlarmUtilities, "fireDateWithAlarmDict:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%f"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXContextHeuristicSuggestionProducer suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:", v22, v30, 0, v32, v26, 0, self->_score);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v33 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = (void *)MEMORY[0x1E0C9AA60];
        }

      }
      else
      {
        v28 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v28 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v28 = (void *)objc_opt_new();
  }

  return v28;
}

- (BOOL)_isToggleContextualAction:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "settingBiomeStreamIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_nextMorningAlarmsWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  +[ATXHeuristicGoodMorning contextDateInterval](ATXHeuristicGoodMorning, "contextDateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_validDateInterval, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  objc_msgSend(v5, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  +[ATXHeuristicTimeUtilities timestampByOffsettingDays:dayOffset:](ATXHeuristicTimeUtilities, "timestampByOffsettingDays:dayOffset:", 1, v11);
  -[ATXContextAlarmSuggestionProducer _alarmsWithEnvironment:startTimestamp:endTimestamp:](self, "_alarmsWithEnvironment:startTimestamp:endTimestamp:", v4, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_morningAlarmsWithEnvironment:(id)a3
{
  NSDateInterval *validDateInterval;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  validDateInterval = self->_validDateInterval;
  v5 = a3;
  -[NSDateInterval startDate](validDateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  -[NSDateInterval endDate](self->_validDateInterval, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  -[ATXContextAlarmSuggestionProducer _alarmsWithEnvironment:startTimestamp:endTimestamp:](self, "_alarmsWithEnvironment:startTimestamp:endTimestamp:", v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_alarmsWithEnvironment:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  __atxlog_handle_context_heuristic();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    locDate(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    locDate(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412546;
    v29 = (uint64_t)v11;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment looking for alarms between %@ and %@", (uint8_t *)&v28, 0x16u);

  }
  +[ATXHeuristicTimeUtilities enabledAlarmsFromTS:toTS:environment:](ATXHeuristicTimeUtilities, "enabledAlarmsFromTS:toTS:environment:", v8, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  __atxlog_handle_context_heuristic();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      v18 = objc_msgSend(v14, "count");
      v28 = 134217984;
      v29 = v18;
      _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment Found a total of %lu alarm(s)", (uint8_t *)&v28, 0xCu);
    }

    -[ATXContextAlarmSuggestionProducer _filterAlarmsEligible:proposedInterval:](self, "_filterAlarmsEligible:proposedInterval:", v14, self->_validDateInterval);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    __atxlog_handle_context_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        v23 = objc_msgSend(v19, "count");
        -[NSDateInterval endDate](self->_validDateInterval, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 134218242;
        v29 = v23;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment Found %lu morning alarm(s) that will fire before %@", (uint8_t *)&v28, 0x16u);

      }
      v19 = v19;
      v25 = v19;
    }
    else
    {
      if (v22)
      {
        -[NSDateInterval endDate](self->_validDateInterval, "endDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = (uint64_t)v26;
        _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment Suppressing action because there are no enabled alarms before %@", (uint8_t *)&v28, 0xCu);

      }
      v25 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    if (v17)
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment No existing alarms found", (uint8_t *)&v28, 2u);
    }

    v19 = (id)MEMORY[0x1E0C9AA60];
    v25 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

- (id)_filterAlarmsEligible:(id)a3 proposedInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__ATXContextAlarmSuggestionProducer__filterAlarmsEligible_proposedInterval___block_invoke;
  v9[3] = &unk_1E82C5540;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __76__ATXContextAlarmSuggestionProducer__filterAlarmsEligible_proposedInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  uint8_t v7[15];
  Boolean keyExistsAndHasValidFormat;

  v3 = a2;
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwAllowModifedAlarms"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
  {
    __atxlog_handle_context_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _filterAlarmsEligible  internal setting zkwAllowModifedAlarms is on. Allowing even modified alarms", v7, 2u);
    }

    v5 = 1;
  }
  else
  {
    v5 = +[ATXHeuristicAlarmUtilities isValidNonRecentlyModifiedAlarm:duringInterval:](ATXHeuristicAlarmUtilities, "isValidNonRecentlyModifiedAlarm:duringInterval:", v3, *(_QWORD *)(a1 + 32));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDateInterval, 0);
}

- (void)morningAlarmToggleSuggestionsWithEnvironment:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_8(&dword_1C99DF000, a3, (uint64_t)a3, "ATXContextAlarmSuggestionProducer: _criteriaWithAlarm is nil, skipping", a1);
}

- (void)_criteriaWithAlarm:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_8(&dword_1C99DF000, a1, a3, "ATXContextAlarmSuggestionProducer: _criteriaWithAlarm alarmDict[hour] is nil", v3);
}

- (void)_criteriaWithAlarm:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_8(&dword_1C99DF000, a1, a3, "ATXContextAlarmSuggestionProducer: _criteriaWithAlarm alarmDict[minute] is nil", v3);
}

@end
