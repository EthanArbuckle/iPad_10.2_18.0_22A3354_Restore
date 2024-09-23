@implementation ATXHeuristicOngoingFlightEventUtilities

+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  ATXCalendarEventsDataSource *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  ATXContextFlightEventSuggestionProducer *v25;
  void *v26;
  ATXContextFlightEventSuggestionProducer *v27;
  void *v28;
  ATXContextHeuristicResult *v29;
  void *v30;
  ATXContextHeuristicResult *v31;
  void *v33;
  void *v34;
  ATXCalendarEventsDataSource *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 64800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "Ongoing flight event search", buf, 2u);
  }

  v7 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", v3);
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v7, "flightEventsFromStartDate:endDate:reason:", v4, v5, CFSTR("ongoing flight heuristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCalendarEventsDataSource sortEkEvents:](v7, "sortEkEvents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v34 = v8;
    v35 = v7;
    v36 = v5;
    v37 = v4;
    v38 = v3;
    v40 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v33 = v9;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      v13 = 0x1E82C3000uLL;
      v39 = *(_QWORD *)v44;
      do
      {
        v14 = 0;
        v41 = v11;
        do
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
          objc_msgSend(v15, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "compare:", v17) == 1)
          {
            __atxlog_handle_context_heuristic();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v48 = v16;
              v49 = 2112;
              v50 = v17;
              _os_log_fault_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_FAULT, "ATXHeuristicOngoingFlightEventUtilities: start %@ is after end %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(*(id *)(v13 + 2648), "flightInformationSchemaForEvent:", v15);
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v13 + 2648), "flightInformationSpotlightSuggestionForEvent:schemaForFlight:predictionReasons:score:validStartDate:validEndDate:", v15, v18, 0x100000000, v16, v17, 70.0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(*(id *)(v13 + 2648), "logSuggestion:description:", v19, CFSTR("ATXHeuristicOngoingFlightEventUtilities: FlightInfo suggestion"));
              objc_msgSend(v40, "addObject:", v19);
            }
            -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("reservationFor"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("address"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("addressLocality"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v23, "length"))
            {
              +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:](ATXHeuristicFlightEventUtilities, "_dateIntervalWithEvent:", v15);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = [ATXContextFlightEventSuggestionProducer alloc];
              objc_msgSend(v15, "title");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:](v25, "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v26, v18, 0, 0, v16, v17, 0, v24);

              -[ATXContextFlightEventSuggestionProducer suggestionForAirplaneModeWithPredictionReasons:score:](v27, "suggestionForAirplaneModeWithPredictionReasons:score:", 0x100000000, 80.0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v28, CFSTR("ATXHeuristicOngoingFlightEventUtilities: Airplane Mode suggestion"));
                objc_msgSend(v40, "addObject:", v28);
              }

              v11 = v41;
              v12 = v39;
            }
            else
            {
              __atxlog_handle_context_heuristic();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v23;
                _os_log_impl(&dword_1C99DF000, v24, OS_LOG_TYPE_DEFAULT, "ATXHeuristicOngoingFlightEventUtilities: Airplane mode: Missing information: Arrival City %@. Skipping airplane mode suggestion", buf, 0xCu);
              }
              v11 = v41;
              v12 = v39;
            }

            v13 = 0x1E82C3000;
          }

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v11);
    }

    v29 = [ATXContextHeuristicResult alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](v29, "initWithSuggestions:additionalRefreshTriggers:", v40, v30);

    v4 = v37;
    v3 = v38;
    v7 = v35;
    v5 = v36;
    v9 = v33;
    v8 = v34;
  }
  else
  {
    v31 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v31;
}

@end
