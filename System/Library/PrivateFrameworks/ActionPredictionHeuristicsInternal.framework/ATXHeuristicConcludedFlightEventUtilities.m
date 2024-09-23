@implementation ATXHeuristicConcludedFlightEventUtilities

+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  ATXCalendarEventsDataSource *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  ATXInformationHeuristicRefreshLocationTrigger *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  ATXContextFlightEventSuggestionProducer *v28;
  void *v29;
  ATXContextFlightEventSuggestionProducer *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  ATXInformationHeuristicRefreshLocationTrigger *v51;
  ATXInformationHeuristicRefreshLocationTrigger *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  ATXInformationHeuristicRefreshLocationTrigger *v57;
  ATXInformationHeuristicRefreshLocationTrigger *v58;
  ATXContextFlightEventSuggestionProducer *v59;
  ATXContextHeuristicResult *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  ATXCalendarEventsDataSource *v72;
  id obj;
  void *v74;
  void *v75;
  ATXContextFlightEventSuggestionProducer *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -64800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "Concluded flights event search", buf, 2u);
  }

  v6 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", v67);
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v6, "flightEventsFromStartDate:endDate:reason:", v4, v3, CFSTR("concluded flights heuristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCalendarEventsDataSource sortEkEvents:](v6, "sortEkEvents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    v60 = (ATXContextHeuristicResult *)objc_opt_new();
    goto LABEL_47;
  }
  v63 = v7;
  v64 = v4;
  v72 = v6;
  v68 = (void *)objc_opt_new();
  v79 = (void *)objc_opt_new();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v62 = v8;
  obj = v8;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (!v81)
    goto LABEL_45;
  v9 = 0x1E82C3000uLL;
  v80 = *(_QWORD *)v83;
  v71 = v3;
  do
  {
    for (i = 0; i != v81; ++i)
    {
      if (*(_QWORD *)v83 != v80)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      objc_msgSend(v11, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", 14400.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v9 + 2648), "flightInformationSchemaForEvent:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "geoLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = objc_msgSend(*(id *)(v9 + 2648), "currentLocationIsWithinAirportForEvent:", v11);
        v18 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
        objc_msgSend(v16, "coordinate");
        if ((v17 & 1) == 0)
        {
          v43 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v18, "initWithEnteringLocation:radiusInMeters:");
          objc_msgSend(v79, "addObject:", v43);
          goto LABEL_43;
        }
        v77 = -[ATXInformationHeuristicRefreshLocationTrigger initWithExitingLocation:radiusInMeters:](v18, "initWithExitingLocation:radiusInMeters:");
        objc_msgSend(v79, "addObject:");
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("address"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("addressLocality"));
        v22 = v3;
        v23 = objc_claimAutoreleasedReturnValue();

        v78 = (void *)v23;
        v24 = (void *)v23;
        v25 = v22;
        if (!objc_msgSend(v24, "length"))
        {
          __atxlog_handle_context_heuristic();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v87 = v78;
            _os_log_impl(&dword_1C99DF000, v26, OS_LOG_TYPE_DEFAULT, "ATXHeuristicConcludedFlightEventUtilities: Airplane mode: Missing information: Arrival City %@.", buf, 0xCu);
          }

        }
        +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:](ATXHeuristicFlightEventUtilities, "_dateIntervalWithEvent:", v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = [ATXContextFlightEventSuggestionProducer alloc];
        objc_msgSend(v11, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:](v28, "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v29, v14, 0, 0, 0, v13, 0, v27);

        v76 = v30;
        -[ATXContextFlightEventSuggestionProducer suggestionForAirplaneModeWithPredictionReasons:score:](v30, "suggestionForAirplaneModeWithPredictionReasons:score:", 0x200000000, 80.0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v31, CFSTR("ATXHeuristicConcludedFlightEventUtilities: Airplane Modesuggestion"));
          objc_msgSend(v68, "addObject:", v31);
        }
        v75 = (void *)v31;
        objc_msgSend(v25, "dateByAddingTimeInterval:", -43200.0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCalendarEventsDataSource hotelEventsFromStartDate:endDate:reason:](v72, "hotelEventsFromStartDate:endDate:reason:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v32, "count"))
        {
          objc_msgSend(v25, "dateByAddingTimeInterval:", 43200.0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCalendarEventsDataSource hotelEventsFromStartDate:endDate:reason:](v72, "hotelEventsFromStartDate:endDate:reason:", v25, v33, CFSTR("lodging for concluded flights"));
          v34 = objc_claimAutoreleasedReturnValue();

          v32 = (void *)v34;
        }
        if (objc_msgSend(v32, "count"))
        {
          -[ATXCalendarEventsDataSource sortEkEvents:](v72, "sortEkEvents:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "count"))
          {
            v70 = v27;
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "endDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "dateByAddingTimeInterval:", 14400.0);
            v38 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "endDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "timeIntervalSinceDate:", v71);
            v41 = v40;

            v69 = (void *)v38;
            if (v41 > 14400.0)
            {
              v42 = v36;
              goto LABEL_31;
            }
            v9 = 0x1E82C3000uLL;
            +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightInformationSchemaForEvent:", v36);
            v66 = objc_claimAutoreleasedReturnValue();
            +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:", v36, 65.0, v38);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
            {
              v65 = v36;
              +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v53, CFSTR("ATXHeuristicConcludedFlightEventUtilities: Navigation Suggestion"));
              objc_msgSend(v68, "addObject:", v53);
              objc_msgSend(v53, "atxShortcutsActionExecutableObject");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "contextualActionGetDirections");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "destination");
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (v56)
              {
                v57 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                objc_msgSend(v56, "coordinate");
                v58 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v57, "initWithEnteringLocation:radiusInMeters:");
                objc_msgSend(v79, "addObject:", v58);

              }
              v9 = 0x1E82C3000;
              v36 = v65;
            }
            v42 = v36;

            v52 = (ATXInformationHeuristicRefreshLocationTrigger *)v66;
LABEL_38:

            goto LABEL_39;
          }
          v9 = 0x1E82C3000;
LABEL_41:
          v59 = v76;
          v43 = v77;
        }
        else
        {
          +[ATXHeuristicNavigationUtilities fetchLocationForLOI:](ATXHeuristicNavigationUtilities, "fetchLocationForLOI:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:", v35, 250000);
          __atxlog_handle_context_heuristic();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v87) = v44;
            _os_log_impl(&dword_1C99DF000, v45, OS_LOG_TYPE_DEFAULT, "ATXHeursiticFlightEventUtilities: Can we navigate to home (%{BOOL}d)", buf, 8u);
          }

          if (!v44)
          {
            v9 = 0x1E82C3000;
            goto LABEL_41;
          }
          v70 = v27;
          v46 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("HOME_NAVIGATION_TITLE"), &stru_1E82C5A18, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedStringWithFormat:", v48);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          +[ATXHeuristicNavigationUtilities navigationSuggestionActionForLOI:destinationName:schemaForEvent:withScore:transportType:predictionReason:validStartDate:validEndDate:heuristicDevice:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForLOI:destinationName:schemaForEvent:withScore:transportType:predictionReason:validStartDate:validEndDate:heuristicDevice:", 0, v42, v14, CFSTR("AUTOMOBILE"), 0x200000000, 0, 65.0, v13, v67);
          v49 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v49;
          if (v49)
          {
            v50 = v49;
            v9 = 0x1E82C3000uLL;
            +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v49, CFSTR("ATXHeuristicConcludedFlightEventUtilities: Navigation Suggestion"));
            objc_msgSend(v68, "addObject:", v50);
            v51 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
            objc_msgSend(v35, "coordinate");
            v52 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v51, "initWithEnteringLocation:radiusInMeters:");
            objc_msgSend(v79, "addObject:", v52);
            goto LABEL_38;
          }
LABEL_31:
          v9 = 0x1E82C3000;
LABEL_39:
          v59 = v76;
          v43 = v77;

          v27 = v70;
        }

        v3 = v71;
        goto LABEL_43;
      }
      __atxlog_handle_context_heuristic();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C99DF000, v43, OS_LOG_TYPE_DEFAULT, "ATXHeuristicConcludedFlightEventUtilities: No destination location, skipping Flight landed suggestions", buf, 2u);
      }
LABEL_43:

    }
    v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  }
  while (v81);
LABEL_45:

  v60 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v68, v79);
  v7 = v63;
  v4 = v64;
  v6 = v72;
  v8 = v62;
LABEL_47:

  return v60;
}

@end
