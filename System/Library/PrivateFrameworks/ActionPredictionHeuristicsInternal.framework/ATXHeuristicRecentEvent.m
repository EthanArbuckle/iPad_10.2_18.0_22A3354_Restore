@implementation ATXHeuristicRecentEvent

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;
  void *v4;
  void *v5;

  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v2, "initWithNotification:type:", *MEMORY[0x1E0CA9F88], 0);
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v3, 0);
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ATXCalendarEventsDataSource *v8;
  void *v9;
  ATXCalendarEventsDataSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  ATXContextEventSuggestionProducer *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  ATXInformationHeuristicRefreshTimeTrigger *v41;
  ATXContextHeuristicResult *v42;
  void *v43;
  void *v44;
  ATXContextHeuristicResult *v45;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  ATXCalendarEventsDataSource *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  _BOOL4 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_context_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "+[ATXHeuristicRecentEvent produceSuggestions]", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -600.0);
  v6 = objc_claimAutoreleasedReturnValue();
  v53 = v5;
  objc_msgSend(v5, "dateByAddingTimeInterval:", 7200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [ATXCalendarEventsDataSource alloc];
  objc_msgSend(v3, "heuristicDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXCalendarEventsDataSource initWithDevice:](v8, "initWithDevice:", v9);

  v51 = v10;
  v52 = (void *)v6;
  -[ATXCalendarEventsDataSource eventsFromStartDate:endDate:reason:](v10, "eventsFromStartDate:endDate:reason:", v6, v7, CFSTR("recent event heuristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3880];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __58__ATXHeuristicRecentEvent_heuristicResultWithEnvironment___block_invoke;
  v61[3] = &unk_1E82C4870;
  v49 = v7;
  v62 = v49;
  objc_msgSend(v12, "predicateWithBlock:", v61);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v11;
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v14;
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v47 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v58;
    v21 = 0x1E82C3000uLL;
    v55 = *(_QWORD *)v58;
    v54 = v17;
    do
    {
      v22 = 0;
      v56 = v19;
      do
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v22);
        v24 = objc_msgSend(*(id *)(v21 + 2640), "allowSuggestionsForEvent:", v23, v47);
        __atxlog_handle_context_heuristic();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if ((v24 & 1) != 0)
        {
          if (v26)
          {
            objc_msgSend(v23, "eventIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "title");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "hash");
            objc_msgSend(v23, "startDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "organizer");
            v31 = v16;
            v32 = v3;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v64 = v27;
            v65 = 2048;
            v66 = v29;
            v67 = 2112;
            v68 = v30;
            v69 = 1024;
            v70 = v33 != 0;
            _os_log_impl(&dword_1C99DF000, v25, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has organizer:%{BOOL}i", buf, 0x26u);

            v3 = v32;
            v16 = v31;
            v17 = v54;

          }
          objc_msgSend(v23, "endDate");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "endDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "dateByAddingTimeInterval:", 600.0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = -[ATXContextEventSuggestionProducer initWithEvent:validFromStartDate:validToEndDate:environment:]([ATXContextEventSuggestionProducer alloc], "initWithEvent:validFromStartDate:validToEndDate:environment:", v23, v25, v35, v3);
          -[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:](v36, "suggestionForEventOrganizerWithScore:predictionReasons:", 0x400000, 50.0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          __atxlog_handle_context_heuristic();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v37;
            _os_log_impl(&dword_1C99DF000, v38, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
          }

          if (v37)
            objc_msgSend(v16, "addObject:", v37);
          -[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:](v36, "suggestionForEventParticipantWithScore:predictionReasons:", 0x400000, 50.0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          __atxlog_handle_context_heuristic();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v39;
            _os_log_impl(&dword_1C99DF000, v40, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
          }

          if (v39)
            objc_msgSend(v16, "addObject:", v39);

          v20 = v55;
          v19 = v56;
          v21 = 0x1E82C3000;
        }
        else if (v26)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v25, OS_LOG_TYPE_DEFAULT, "Recent Event: Skipping event suggestions, event is unsupported", buf, 2u);
        }

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v19);
  }

  v41 = -[ATXInformationHeuristicRefreshTimeTrigger initWithFireDate:]([ATXInformationHeuristicRefreshTimeTrigger alloc], "initWithFireDate:", v49);
  objc_msgSend(v47, "addObject:", v41);
  v42 = [ATXContextHeuristicResult alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v43 = v17;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](v42, "initWithSuggestions:additionalRefreshTriggers:", v16, v44);

  return v45;
}

BOOL __58__ATXHeuristicRecentEvent_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isAllDay") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32)) == -1;

  }
  return v4;
}

uint64_t __58__ATXHeuristicRecentEvent_heuristicResultWithEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "organizer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "organizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v12 = -1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v4, "organizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    objc_msgSend(v5, "organizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v12 = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

LABEL_9:
  return v12;
}

@end
