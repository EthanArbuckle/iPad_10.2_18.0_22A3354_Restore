@implementation ATXHeuristicUpcomingEvent

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v4;
  void *v5;
  void *v6;

  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v2, "initWithNotification:type:", *MEMORY[0x1E0CA9F88], 0);
  v4 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXTravelTimeUpdated"), 0);
  v5 = (void *)MEMORY[0x1CAA46CBC]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v3, v4, 0);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  ATXCalendarEventsDataSource *v6;
  void *v7;
  ATXCalendarEventsDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ATXContextEventSuggestionProducer *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  void *v43;
  ATXInformationHeuristicRefreshLocationTrigger *v44;
  ATXInformationHeuristicRefreshLocationTrigger *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  ATXContextHeuristicResult *v59;
  void *v61;
  id v62;
  void *v63;
  ATXCalendarEventsDataSource *v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  ATXInformationHeuristicRefreshTimeTrigger *v71;
  uint64_t v72;
  id obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  id v84;
  uint8_t v85[128];
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  _BOOL4 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  __atxlog_handle_context_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "+[ATXHeuristicUpcomingEvent produceSuggestions]", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 7200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [ATXCalendarEventsDataSource alloc];
  objc_msgSend(v68, "heuristicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXCalendarEventsDataSource initWithDevice:](v6, "initWithDevice:", v7);

  v64 = v8;
  -[ATXCalendarEventsDataSource eventsFromStartDate:endDate:reason:](v8, "eventsFromStartDate:endDate:reason:", v4, v5, CFSTR("upcoming event heuristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3880];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __60__ATXHeuristicUpcomingEvent_heuristicResultWithEnvironment___block_invoke;
  v82[3] = &unk_1E82C4E70;
  v62 = v4;
  v83 = v62;
  v65 = v5;
  v84 = v65;
  objc_msgSend(v10, "predicateWithBlock:", v82);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v12;
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0x1E82C3000uLL;
    v18 = *(_QWORD *)v79;
    v72 = *(_QWORD *)v79;
    do
    {
      v19 = 0;
      v67 = v16;
      do
      {
        if (*(_QWORD *)v79 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v19);
        v21 = objc_msgSend(*(id *)(v17 + 2640), "allowSuggestionsForEvent:", v20);
        __atxlog_handle_context_heuristic();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if ((v21 & 1) != 0)
        {
          if (v23)
          {
            objc_msgSend(v20, "eventIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "title");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "hash");
            objc_msgSend(v20, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "organizer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v87 = (uint64_t)v24;
            v88 = 2048;
            v89 = v26;
            v17 = 0x1E82C3000;
            v90 = 2112;
            v91 = v27;
            v92 = 1024;
            v93 = v28 != 0;
            _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has organizer:%{BOOL}i", buf, 0x26u);

            v18 = v72;
          }

          objc_msgSend(v20, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "dateByAddingTimeInterval:", -1800.0);
          v22 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "startDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSObject compare:](v22, "compare:", v30) == 1)
          {
            __atxlog_handle_context_heuristic();
            v31 = (ATXContextEventSuggestionProducer *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v87 = (uint64_t)v22;
              v88 = 2112;
              v89 = (uint64_t)v30;
              _os_log_fault_impl(&dword_1C99DF000, &v31->super, OS_LOG_TYPE_FAULT, "ATXHeuristicUpcomingEvent: validStartDate %@ is after validEndDate %@. Skipping event", buf, 0x16u);
            }
          }
          else
          {
            v31 = -[ATXContextEventSuggestionProducer initWithEvent:validFromStartDate:validToEndDate:environment:]([ATXContextEventSuggestionProducer alloc], "initWithEvent:validFromStartDate:validToEndDate:environment:", v20, v22, v30, v68);
            -[ATXContextEventSuggestionProducer suggestionForConferenceWithScore:predictionReasons:](v31, "suggestionForConferenceWithScore:predictionReasons:", 0x100000, 80.0);
            v32 = objc_claimAutoreleasedReturnValue();
            __atxlog_handle_context_heuristic();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v32;
              _os_log_impl(&dword_1C99DF000, v33, OS_LOG_TYPE_DEFAULT, "conferenceSuggestion: %@", buf, 0xCu);
            }

            if (v32)
              objc_msgSend(v14, "addObject:", v32);
            -[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:](v31, "suggestionForEventOrganizerWithScore:predictionReasons:", 0x100000, 50.0);
            v34 = objc_claimAutoreleasedReturnValue();
            __atxlog_handle_context_heuristic();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v34;
              _os_log_impl(&dword_1C99DF000, v35, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }

            if (v34)
              objc_msgSend(v14, "addObject:", v34);
            v69 = (void *)v34;
            -[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:](v31, "suggestionForEventParticipantWithScore:predictionReasons:", 0x100000, 50.0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            __atxlog_handle_context_heuristic();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v87 = (uint64_t)v36;
              _os_log_impl(&dword_1C99DF000, v37, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }
            v70 = (void *)v32;

            if (v36)
              objc_msgSend(v14, "addObject:", v36);
            v38 = v14;
            +[ATXHeuristicNavigationUtilities locationFromEvent:schemaType:](ATXHeuristicNavigationUtilities, "locationFromEvent:schemaType:", v20, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:", v39, 250000);
            __atxlog_handle_context_heuristic();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v87) = v40;
              _os_log_impl(&dword_1C99DF000, v41, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingEvent: For upcoming event, can we navigate to event: (%{BOOL}d)", buf, 8u);
            }

            if (v40)
            {
              objc_msgSend(v68, "heuristicDevice");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:", v20, 0, CFSTR("AUTOMOBILE"), 0x100000, v42, v22, 80.0, v30);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (v43)
              {
                objc_msgSend(v38, "addObject:", v43);
                v44 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                objc_msgSend(v39, "coordinate");
                v45 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v44, "initWithEnteringLocation:radiusInMeters:");
                objc_msgSend(v66, "addObject:", v45);

              }
            }
            v14 = v38;
            if (objc_msgSend(v38, "count"))
            {
              -[ATXContextEventSuggestionProducer suggestionForDNDWithScore:predictionReasons:](v31, "suggestionForDNDWithScore:predictionReasons:", 0x100000, 30.0);
              v46 = objc_claimAutoreleasedReturnValue();
              __atxlog_handle_context_heuristic();
              v47 = objc_claimAutoreleasedReturnValue();
              v17 = 0x1E82C3000;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v87 = (uint64_t)v46;
                _os_log_impl(&dword_1C99DF000, v47, OS_LOG_TYPE_DEFAULT, "DND Suggestion: %@", buf, 0xCu);
              }

              objc_msgSend(v14, "addObject:", v46);
            }
            else
            {
              __atxlog_handle_context_heuristic();
              v46 = objc_claimAutoreleasedReturnValue();
              v17 = 0x1E82C3000;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C99DF000, v46, OS_LOG_TYPE_DEFAULT, "Skipping DND Suggestion: No other event suggestions", buf, 2u);
              }
            }
            v16 = v67;

            v18 = v72;
          }

        }
        else if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Upcoming Event: Skipping event suggestions, event is unsupported", buf, 2u);
        }

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    }
    while (v16);
  }

  v71 = -[ATXInformationHeuristicRefreshTimeTrigger initWithFireDate:]([ATXInformationHeuristicRefreshTimeTrigger alloc], "initWithFireDate:", v65);
  objc_msgSend(v66, "addObject:");
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v48 = v14;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v75 != v51)
          objc_enumerationMutation(v48);
        v53 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        __atxlog_handle_context_heuristic();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v53, "uiSpecification");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "contextStartDate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "uiSpecification");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "contextEndDate");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v87 = (uint64_t)v56;
          v88 = 2112;
          v89 = (uint64_t)v58;
          _os_log_impl(&dword_1C99DF000, v54, OS_LOG_TYPE_DEFAULT, "Suggestion: context from %@ to %@", buf, 0x16u);

        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v50);
  }

  v59 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v48, v66);
  return v59;
}

BOOL __60__ATXHeuristicUpcomingEvent_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isAllDay") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "compare:", v6) == -1)
    {
      objc_msgSend(v3, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 40)) == -1;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

uint64_t __60__ATXHeuristicUpcomingEvent_heuristicResultWithEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(v4, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

LABEL_9:
  return v12;
}

@end
