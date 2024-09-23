@implementation ATXHeuristicEarlyEventAlarm

- (id)permanentRefreshTriggers
{
  void *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v4;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v5;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v6;
  void *v7;
  void *v8;

  +[ATXHeuristicDevice sharedAlarmManager](ATXHeuristicDevice, "sharedAlarmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkIn");

  v3 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v4 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v3, "initWithNotification:type:", *MEMORY[0x1E0CA9F88], 0);
  v5 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v6 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v5, "initWithNotification:type:", *MEMORY[0x1E0D4F950], 0);
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, v6, 0);
  objc_autoreleasePoolPop(v7);

  return v8;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4;
  ATXExtraordinaryEventsDataSource *v5;
  void *v6;
  ATXExtraordinaryEventsDataSource *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  double v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  NSObject *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  ATXContextHeuristicResult *v66;
  NSObject *v68;
  NSObject *v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  NSObject *v76;
  void *v77;
  BOOL v78;
  void *v79;
  double v80;
  double v81;
  NSObject *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  ATXContextHeuristicResult *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id obj;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[6];
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  void *v130;
  uint8_t buf[4];
  uint64_t v132;
  __int16 v133;
  unint64_t v134;
  __int16 v135;
  id v136;
  __int16 v137;
  id v138;
  __int16 v139;
  void *v140;
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [ATXExtraordinaryEventsDataSource alloc];
  objc_msgSend(v4, "heuristicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXExtraordinaryEventsDataSource initWithDevice:](v5, "initWithDevice:", v6);

  v124 = 0;
  v125 = &v124;
  v126 = 0x3032000000;
  v127 = __Block_byref_object_copy__4;
  v128 = __Block_byref_object_dispose__4;
  v129 = 0;
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__4;
  v122 = __Block_byref_object_dispose__4;
  v123 = 0;
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __62__ATXHeuristicEarlyEventAlarm_heuristicResultWithEnvironment___block_invoke;
  v117[3] = &unk_1E82C47B8;
  v117[4] = &v124;
  v117[5] = &v118;
  -[ATXExtraordinaryEventsDataSource getEventsWithProminentFeature:callback:](v7, "getEventsWithProminentFeature:callback:", &unk_1E82D5638, v117);
  if (v119[5])
  {
    __atxlog_handle_context_heuristic();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicEarlyEventAlarm heuristicResultWithEnvironment:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = objc_opt_new();
LABEL_40:
    v66 = (ATXContextHeuristicResult *)v16;
    goto LABEL_41;
  }
  __atxlog_handle_context_heuristic();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend((id)v125[5], "count");
    *(_DWORD *)buf = 134217984;
    v132 = v18;
    _os_log_impl(&dword_1C99DF000, v17, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment %lu events", buf, 0xCu);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v19 = (id)v125[5];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v113, v142, 16);
  if (!v20)
  {
LABEL_15:

LABEL_37:
    __atxlog_handle_context_heuristic();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v65, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: No unusually early event found to set alarm", buf, 2u);
    }

    v16 = objc_opt_new();
    goto LABEL_40;
  }
  v21 = *(_QWORD *)v114;
LABEL_9:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v114 != v21)
      objc_enumerationMutation(v19);
    v23 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v22);
    if (-[ATXHeuristicEarlyEventAlarm isEventInterestingForSettingAlarm:](self, "isEventInterestingForSettingAlarm:", v23))
    {
      break;
    }
    if (v20 == ++v22)
    {
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v113, v142, 16);
      if (v20)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  v108 = v23;

  if (!v108)
    goto LABEL_37;
  v105 = (void *)objc_opt_new();
  if (-[ATXHeuristicEarlyEventAlarm shouldShowSuggestionForEarlyEvent:alarms:environment:](self, "shouldShowSuggestionForEarlyEvent:alarms:environment:", v108))
  {
    objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("startDateTimestamp"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("creationDateTimestamp"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "doubleValue");
    -[ATXHeuristicEarlyEventAlarm _timestampByOffsettingDays:dayOffset:](self, "_timestampByOffsettingDays:dayOffset:", -1);
    -[ATXHeuristicEarlyEventAlarm _timestampAtDayOfTimestamp:hour:minute:](self, "_timestampAtDayOfTimestamp:hour:minute:", 0, 0);
    v25 = v24;
    -[ATXHeuristicEarlyEventAlarm _usualAlarmTimeOfDayDataSourceWithEnvironment:](self, "_usualAlarmTimeOfDayDataSourceWithEnvironment:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v26;
    if (v26 && objc_msgSend(v26, "integerValue"))
    {
      v27 = objc_msgSend(v104, "integerValue");
      v28 = objc_msgSend(v104, "integerValue");
      __atxlog_handle_context_heuristic();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v27 / 3600;
      v31 = (unint64_t)((double)(unint64_t)(v28 - 3600 * v30) / 60.0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v132 = v30;
        v133 = 2048;
        v134 = v31;
        _os_log_impl(&dword_1C99DF000, v29, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment medianSetAlarmTime: %lu:%lu)", buf, 0x16u);
      }

      -[ATXHeuristicEarlyEventAlarm _timestampWithHour:minute:atDayOfTimestamp:](self, "_timestampWithHour:minute:atDayOfTimestamp:", v30, v31, v25);
      v33 = v32;
      __atxlog_handle_context_heuristic();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        locDate(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v132 = (uint64_t)v36;
        _os_log_impl(&dword_1C99DF000, v34, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment timestampOfSuggestedSetTime: %@)", buf, 0xCu);

      }
      objc_msgSend(v106, "doubleValue");
      if (v37 - v33 >= 86400.0)
      {
        __atxlog_handle_context_heuristic();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          locDate(v106);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          locDate(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v132 = (uint64_t)v39;
          v133 = 2112;
          v134 = (unint64_t)v41;
          _os_log_impl(&dword_1C99DF000, v38, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment Night owl case detected. Event start time: %@; O"
            "riginal suggested timestamp to show prediction: %@",
            buf,
            0x16u);

        }
        -[ATXHeuristicEarlyEventAlarm _timestampByOffsettingDays:dayOffset:](self, "_timestampByOffsettingDays:dayOffset:", 1, v33);
        v33 = v42;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceReferenceDate");
      v45 = v44;

      v46 = v33 + -3600.0;
      if (v33 + -3600.0 < v45)
      {
        objc_msgSend(v103, "doubleValue", v46);
        v48 = v47;
        __atxlog_handle_context_heuristic();
        v49 = objc_claimAutoreleasedReturnValue();
        v33 = v48 + 3600.0;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          locDate(v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v132 = (uint64_t)v51;
          _os_log_impl(&dword_1C99DF000, v49, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment Suggested timestamp to show prediction detected as being in the past. Updating suggested timestamp to show the prediction to 1 hour + eventCreationTime = %@", buf, 0xCu);

        }
      }
      objc_msgSend(v106, "doubleValue", v46);
      v53 = v52 + -28800.0;
      if (v33 >= v53)
        v33 = v53;
      __atxlog_handle_context_heuristic();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        locDate(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v132 = (uint64_t)v56;
        _os_log_impl(&dword_1C99DF000, v54, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment Final suggested timestamp to show the prediction: %@)", buf, 0xCu);

      }
      objc_msgSend(v106, "doubleValue");
      v58 = v57;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("ALARM_TITLE"), &stru_1E82C5A18, 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v106, "doubleValue");
      objc_msgSend(v60, "dateWithTimeIntervalSinceReferenceDate:");
      v61 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v61, 0, 1);
      v62 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("eventTitle"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHeuristicEventUtilities isEventAtOneWithTimestamp:](ATXHeuristicEventUtilities, "isEventAtOneWithTimestamp:", v106);
      v63 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("ALARM_SUBTITLE_(hour is 1)"), &stru_1E82C5A18, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "localizedStringWithFormat:", v64, v102, v62, v59, v61, v62);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = v33 + -14400.0;
      v71 = v33 + 14400.0;
      if (v105)
      {
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        obj = v105;
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v141, 16);
        if (v72)
        {
          v73 = *(_QWORD *)v110;
          while (2)
          {
            for (i = 0; i != v72; ++i)
            {
              if (*(_QWORD *)v110 != v73)
                objc_enumerationMutation(obj);
              v75 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
              __atxlog_handle_context_heuristic();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C99DF000, v76, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Bailing because an alarm was already modified during the suggestion time span", buf, 2u);
              }

              objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("lastModifiedTS"));
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = v77 == 0;

              if (!v78)
              {
                objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("lastModifiedTS"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "doubleValue");
                if (v80 >= v70)
                {
                  objc_msgSend(v79, "doubleValue");
                  if (v81 <= v71)
                  {
                    __atxlog_handle_context_heuristic();
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1C99DF000, v96, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Bailing because an alarm was already modified during the suggestion time span", buf, 2u);
                    }

                    v66 = (ATXContextHeuristicResult *)objc_opt_new();
                    goto LABEL_69;
                  }
                }

              }
            }
            v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v141, 16);
            if (v72)
              continue;
            break;
          }
        }

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v58 + -3600.0);
      obj = (id)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_context_heuristic();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v70);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        locDate(v83);
        v84 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        locDate(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138740995;
        v132 = (uint64_t)v101;
        v133 = 2117;
        v134 = (unint64_t)v100;
        v135 = 2112;
        v136 = obj;
        v137 = 2112;
        v138 = v84;
        v139 = 2112;
        v140 = v86;
        _os_log_impl(&dword_1C99DF000, v82, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: action title: %{sensitive}@, subtitle: %{sensitive}@ alarmDate:%@, valid between %@ and %@", buf, 0x34u);

      }
      v87 = (void *)MEMORY[0x1E0CF8C20];
      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "atx_setAlarmActionWithTitle:subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:", v101, v100, v88, v102, obj, CFSTR("setAlarmForUnusualEarlyEvents"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v70);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v71);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v89, v90, 0, 0);
      objc_msgSend(v79, "setCriteria:", v91);
      +[ATXContextHeuristicSuggestionProducer suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:", v79, 0x4000000000, 0, 0, 40.0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)objc_opt_new();
      v94 = [ATXContextHeuristicResult alloc];
      v130 = v92;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](v94, "initWithSuggestions:additionalRefreshTriggers:", v95, v93);

LABEL_69:
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C99DF000, v69, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Suppressing action because user has never set alarm before", buf, 2u);
      }

      v66 = (ATXContextHeuristicResult *)objc_opt_new();
    }

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v68, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Earliest event is already covered by user alarm. Skipping", buf, 2u);
    }

    v66 = (ATXContextHeuristicResult *)objc_opt_new();
  }

LABEL_41:
  _Block_object_dispose(&v118, 8);

  _Block_object_dispose(&v124, 8);
  return v66;
}

void __62__ATXHeuristicEarlyEventAlarm_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)isEventInterestingForSettingAlarm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isAllDay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isAllDay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) != 0)
      goto LABEL_7;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nlEventCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nlEventCalendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
      goto LABEL_7;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventTitle")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("[Placeholder Item]")),
        v11,
        (v12 & 1) != 0))
  {
LABEL_7:
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)shouldShowSuggestionForEarlyEvent:(id)a3 alarms:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  BOOL v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("startDateTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  -[ATXHeuristicEarlyEventAlarm _timestampByOffsettingStartOfTodayByNumberOfDays:](self, "_timestampByOffsettingStartOfTodayByNumberOfDays:", 1);
  v14 = v13;
  v15 = v12 + -3540.0;
  -[ATXHeuristicEarlyEventAlarm _enabledAlarmsFromTS:toTS:environment:](self, "_enabledAlarmsFromTS:toTS:environment:", v9, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v31 = v10;
    v32 = v9;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = v16;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isEnabled"), v31, v32);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "BOOLValue")
            && -[ATXHeuristicEarlyEventAlarm _willAlarm:fireFrom:to:](self, "_willAlarm:fireFrom:to:", v22, v14, v15))
          {

            v29 = 0;
            goto LABEL_23;
          }

        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v19)
          continue;
        break;
      }
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v17;
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v17);
          v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copy", v31, v32, (_QWORD)v33);
          objc_msgSend(v8, "addObject:", v28);

        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v25);
    }
    v29 = 1;
LABEL_23:
    v10 = v31;
    v9 = v32;
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v17, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: shouldShowSuggestionForEarlyEvent: No existing alarms found", buf, 2u);
    }
    v29 = 1;
  }

  return v29;
}

- (BOOL)_willAlarm:(id)a3 fireFrom:(double)a4 to:(double)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  BOOL v14;

  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a3;
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MTAlarm"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "nextFireDateAfterDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v14 = v13 < a5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_enabledAlarmsFromTS:(double)a3 toTS:(double)a4 environment:(id)a5
{
  id v7;
  ATXAlarmsDataSource *v8;
  void *v9;
  ATXAlarmsDataSource *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a5;
  v8 = [ATXAlarmsDataSource alloc];
  objc_msgSend(v7, "heuristicDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXAlarmsDataSource initWithDevice:](v8, "initWithDevice:", v9);

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__ATXHeuristicEarlyEventAlarm__enabledAlarmsFromTS_toTS_environment___block_invoke;
  v23[3] = &unk_1E82C47B8;
  v23[4] = &v30;
  v23[5] = &v24;
  -[ATXAlarmsDataSource alarmsFromDate:toDate:completionHandler:](v10, "alarmsFromDate:toDate:completionHandler:", v11, v12, v23);
  if (v25[5])
  {
    __atxlog_handle_context_heuristic();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicEarlyEventAlarm _enabledAlarmsFromTS:toTS:environment:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v21 = 0;
  }
  else
  {
    v21 = (id)v31[5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __69__ATXHeuristicEarlyEventAlarm__enabledAlarmsFromTS_toTS_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_usualAlarmTimeOfDayDataSourceWithEnvironment:(id)a3
{
  id v3;
  ATXSetAlarmTimeOfDayDataSource *v4;
  void *v5;
  ATXSetAlarmTimeOfDayDataSource *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v4 = [ATXSetAlarmTimeOfDayDataSource alloc];
  objc_msgSend(v3, "heuristicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXSetAlarmTimeOfDayDataSource initWithDevice:](v4, "initWithDevice:", v5);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__ATXHeuristicEarlyEventAlarm__usualAlarmTimeOfDayDataSourceWithEnvironment___block_invoke;
  v17[3] = &unk_1E82C47E0;
  v17[4] = &v24;
  v17[5] = &v18;
  -[ATXSetAlarmTimeOfDayDataSource alarmTimeOfDay:](v6, "alarmTimeOfDay:", v17);
  if (v19[5])
  {
    __atxlog_handle_context_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicEarlyEventAlarm _usualAlarmTimeOfDayDataSourceWithEnvironment:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
  }
  else
  {
    v15 = (id)v25[5];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __77__ATXHeuristicEarlyEventAlarm__usualAlarmTimeOfDayDataSourceWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (double)_timestampByOffsettingStartOfTodayByNumberOfDays:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, a3, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;

  }
  else
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v9 = v10;
  }

  return v9;
}

- (double)_timestampWithHour:(unint64_t)a3 minute:(unint64_t)a4 atDayOfTimestamp:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a5);
  objc_msgSend(v8, "components:fromDate:", 28, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHour:", a3);
  objc_msgSend(v10, "setMinute:", a4);
  objc_msgSend(v8, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  return v13;
}

- (double)_timestampByOffsettingDays:(double)a3 dayOffset:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, a4, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  return v9;
}

- (void)heuristicResultWithEnvironment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a1, a3, "Error querying data source %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_enabledAlarmsFromTS:(uint64_t)a3 toTS:(uint64_t)a4 environment:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a1, a3, "Error querying data source %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_usualAlarmTimeOfDayDataSourceWithEnvironment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a1, a3, "Error querying data source %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
