@implementation ATXHeuristicOngoingEvent

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
  uint64_t v5;
  ATXCalendarEventsDataSource *v6;
  void *v7;
  ATXCalendarEventsDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  ATXContextEventSuggestionProducer *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  ATXInformationHeuristicRefreshLocationTrigger *v38;
  ATXInformationHeuristicRefreshLocationTrigger *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  ATXInformationHeuristicRefreshTimeTrigger *v46;
  ATXContextHeuristicResult *v47;
  void *v49;
  void *v50;
  ATXCalendarEventsDataSource *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  NSObject *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  _BOOL4 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  __atxlog_handle_context_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "+[ATXHeuristicOngoingEvent produceSuggestions]", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 7200.0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = [ATXCalendarEventsDataSource alloc];
  objc_msgSend(v57, "heuristicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXCalendarEventsDataSource initWithDevice:](v6, "initWithDevice:", v7);

  v51 = v8;
  v52 = (void *)v5;
  v53 = v4;
  -[ATXCalendarEventsDataSource eventsFromStartDate:endDate:reason:](v8, "eventsFromStartDate:endDate:reason:", v4, v5, CFSTR("ongoing event heuristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v9;
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v11;
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0x1E82C3000uLL;
    v18 = *(_QWORD *)v61;
    v55 = v14;
    v56 = v13;
    v58 = *(_QWORD *)v61;
    do
    {
      v19 = 0;
      v59 = v16;
      do
      {
        if (*(_QWORD *)v61 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v19);
        v21 = objc_msgSend(*(id *)(v17 + 2640), "allowSuggestionsForEvent:", v20);
        __atxlog_handle_context_heuristic();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if ((v21 & 1) != 0)
        {
          if (v23)
          {
            objc_msgSend(v20, "eventIdentifier");
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "title");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "hash");
            objc_msgSend(v20, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "organizer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v65 = v24;
            v66 = 2048;
            v67 = v26;
            v17 = 0x1E82C3000;
            v68 = 2112;
            v69 = v27;
            v70 = 1024;
            v71 = v28 != 0;
            _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has organizer:%{BOOL}i", buf, 0x26u);

            v18 = v58;
            v16 = v59;

          }
          objc_msgSend(v20, "startDate");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "endDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSObject compare:](v22, "compare:", v29) == 1)
          {
            __atxlog_handle_context_heuristic();
            v30 = (ATXContextEventSuggestionProducer *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v30->super, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v65 = v22;
              v66 = 2112;
              v67 = (uint64_t)v29;
              _os_log_fault_impl(&dword_1C99DF000, &v30->super, OS_LOG_TYPE_FAULT, "ATXHeuristicOngoingEvent: validStartDate %@ is after validEndDate %@. Skipping event", buf, 0x16u);
            }
          }
          else
          {
            v30 = -[ATXContextEventSuggestionProducer initWithEvent:validFromStartDate:validToEndDate:environment:]([ATXContextEventSuggestionProducer alloc], "initWithEvent:validFromStartDate:validToEndDate:environment:", v20, v22, v29, v57);
            -[ATXContextEventSuggestionProducer suggestionForConferenceWithScore:predictionReasons:](v30, "suggestionForConferenceWithScore:predictionReasons:", 0x200000, 80.0);
            v31 = objc_claimAutoreleasedReturnValue();
            __atxlog_handle_context_heuristic();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v31;
              _os_log_impl(&dword_1C99DF000, v32, OS_LOG_TYPE_DEFAULT, "conferenceSuggestion: %@", buf, 0xCu);
            }

            if (v31)
              objc_msgSend(v13, "addObject:", v31);
            +[ATXHeuristicNavigationUtilities locationFromEvent:schemaType:](ATXHeuristicNavigationUtilities, "locationFromEvent:schemaType:", v20, 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:", v33, 250000);
            __atxlog_handle_context_heuristic();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v34;
              _os_log_impl(&dword_1C99DF000, v35, OS_LOG_TYPE_DEFAULT, "ATXHeuristicOngoingEvent: can we navigate to event: (%{BOOL}d)", buf, 8u);
            }

            if (v34)
            {
              objc_msgSend(v57, "heuristicDevice");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:", v20, 0, CFSTR("AUTOMOBILE"), 0x200000, v36, v22, 80.0, v29);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v13 = v56;
              if (v37)
              {
                objc_msgSend(v56, "addObject:", v37);
                v38 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                objc_msgSend(v33, "coordinate");
                v39 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v38, "initWithEnteringLocation:radiusInMeters:");
                objc_msgSend(v54, "addObject:", v39);

              }
            }
            -[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:](v30, "suggestionForEventOrganizerWithScore:predictionReasons:", 0x200000, 50.0);
            v40 = objc_claimAutoreleasedReturnValue();
            __atxlog_handle_context_heuristic();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v40;
              _os_log_impl(&dword_1C99DF000, v41, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }

            if (v40)
              objc_msgSend(v13, "addObject:", v40);
            -[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:](v30, "suggestionForEventParticipantWithScore:predictionReasons:", 0x200000, 50.0);
            v42 = objc_claimAutoreleasedReturnValue();
            __atxlog_handle_context_heuristic();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v42;
              _os_log_impl(&dword_1C99DF000, v43, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }

            if (v42)
              objc_msgSend(v13, "addObject:", v42);
            if (objc_msgSend(v13, "count"))
            {
              -[ATXContextEventSuggestionProducer suggestionForDNDWithScore:predictionReasons:](v30, "suggestionForDNDWithScore:predictionReasons:", 0x200000, 30.0);
              v44 = objc_claimAutoreleasedReturnValue();
              __atxlog_handle_context_heuristic();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v65 = v44;
                _os_log_impl(&dword_1C99DF000, v45, OS_LOG_TYPE_DEFAULT, "DND Suggestion: %@", buf, 0xCu);
              }

              v13 = v56;
              objc_msgSend(v56, "addObject:", v44);
            }
            else
            {
              __atxlog_handle_context_heuristic();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C99DF000, v44, OS_LOG_TYPE_DEFAULT, "Skipping DND Suggestion: No other event suggestions", buf, 2u);
              }
            }

            v14 = v55;
            v18 = v58;
            v16 = v59;
            v17 = 0x1E82C3000;
          }

        }
        else if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Ongoing Event: Skipping event suggestions, event is a Unsupported", buf, 2u);
        }

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v16);
  }

  v46 = -[ATXInformationHeuristicRefreshTimeTrigger initWithFireDate:]([ATXInformationHeuristicRefreshTimeTrigger alloc], "initWithFireDate:", v52);
  objc_msgSend(v54, "addObject:", v46);
  v47 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v13, v54);

  return v47;
}

uint64_t __59__ATXHeuristicOngoingEvent_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAllDay") ^ 1;
}

uint64_t __59__ATXHeuristicOngoingEvent_heuristicResultWithEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
