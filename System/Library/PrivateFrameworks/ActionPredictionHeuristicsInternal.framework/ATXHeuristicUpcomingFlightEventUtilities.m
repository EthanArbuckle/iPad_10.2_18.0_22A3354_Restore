@implementation ATXHeuristicUpcomingFlightEventUtilities

+ (id)flightCheckInActionSuggestionForEvent:(id)a3 flightSchema:(id)a4 validStartDate:(id)a5 validEndDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  ATXContextFlightEventSuggestionProducer *v38;
  void *v39;
  NSObject *v40;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  os_log_t log;
  void *v49;
  void *v50;
  uint8_t buf[4];
  NSObject *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    objc_msgSend(v9, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("SGEventMetadataEventActivitiesKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SGEventActivityTypeKey"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SGEventActivityTypeKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("CheckIn"));

        if (v20)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SGEventActivityUserActivityStringKey"));
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SGEventActivityStartDateKey"));
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = (void *)v23;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SGEventActivityEndDateKey"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                __atxlog_handle_context_heuristic();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v9, "title");
                  v27 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "startDate");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v52 = v27;
                  v53 = 2112;
                  v54 = v28;
                  _os_log_impl(&dword_1C99DF000, v26, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Event: %@ at start:%@", buf, 0x16u);

                }
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reservationFor"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("iataCode"));
                v31 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reservationFor"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("departureAirport"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("iataCode"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reservationFor"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("flightNumber"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (-[NSObject length](v31, "length") && objc_msgSend(v49, "length") && objc_msgSend(v35, "length"))
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SGEventActivityTeamIdentifierKey"));
                  log = (os_log_t)objc_claimAutoreleasedReturnValue();
                  v47 = v35;
                  if (-[NSObject length](log, "length"))
                  {
                    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SGEventActivityUserActivityStringKey"));
                    v36 = objc_claimAutoreleasedReturnValue();
                    v44 = (void *)MEMORY[0x1E0CB3940];
                    v46 = v36;
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("FLIGHT_INFO_TITLE"), &stru_1E82C5A18, 0);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "localizedStringWithFormat:", v37, v35, v49, v31);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();

                    +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:](ATXHeuristicFlightEventUtilities, "_dateIntervalWithEvent:", v9);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:]([ATXContextFlightEventSuggestionProducer alloc], "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v50, v10, v46, log, v11, v12, 0, v45);
                    -[ATXContextFlightEventSuggestionProducer suggestionForFlightCheckInWithReason:score:](v38, "suggestionForFlightCheckInWithReason:score:", 0x80000000, 30.0);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v39, CFSTR("ATXHeuristicUpcomingFlightEventUtilities: Flight checkin suggestion"));

                    v40 = v46;
                  }
                  else
                  {
                    __atxlog_handle_context_heuristic();
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1C99DF000, v42, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Missing TeamId. Unable to create suggestion for Flight Checkin", buf, 2u);
                    }
                    v40 = v42;
                    v39 = 0;
                  }

                  v35 = v47;
                }
                else
                {
                  __atxlog_handle_context_heuristic();
                  log = (os_log_t)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412803;
                    v52 = v31;
                    v53 = 2112;
                    v54 = v49;
                    v55 = 2113;
                    v56 = v35;
                    _os_log_impl(&dword_1C99DF000, log, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Missing information: Arrival IATA code: %@, Departure IATA code: %@ Flight Number: %{private}@", buf, 0x20u);
                  }
                  v39 = 0;
                }

LABEL_22:
                goto LABEL_23;
              }
            }
            else
            {

            }
          }
        }
      }
    }
    __atxlog_handle_context_heuristic();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v31, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Check-in information is unavailable", buf, 2u);
    }
    v39 = 0;
    goto LABEL_22;
  }
  __atxlog_handle_context_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Missing Schema", buf, 2u);
  }
  v39 = 0;
LABEL_23:

  return v39;
}

+ (id)weatherAtTravelDestinationSpotlightEntry:(id)a3 schemaForFlight:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validStartDate:(id)a7 validEndDate:(id)a8 heuristicDevice:(id)a9
{
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  NSObject *v41;
  ATXContextFlightEventSuggestionProducer *v42;
  void *v43;
  ATXContextFlightEventSuggestionProducer *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  NSObject *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;
  CLLocationCoordinate2D v59;

  v58 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v14 = a4;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("iataCode"));
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("address"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("addressLocality"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("address"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("addressCountry"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSObject length](v17, "length") && objc_msgSend(v21, "length") && objc_msgSend(v23, "length"))
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FLIGHT_TRAVEL_INFO_TITLE"), &stru_1E82C5A18, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v30, v23, v21);
    v31 = objc_claimAutoreleasedReturnValue();

    +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:](ATXHeuristicFlightEventUtilities, "_dateIntervalWithEvent:", v51);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:]([ATXContextFlightEventSuggestionProducer alloc], "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v31, v14, 0, 0, v50, v49, 0, v46);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v48;
    +[ATXHeuristicFlightEventUtilities locationAtArrivalAirport:event:heuristicDevice:](ATXHeuristicFlightEventUtilities, "locationAtArrivalAirport:event:heuristicDevice:", v33, v51, v48);
    v36 = v35;
    v38 = v37;

    v59.latitude = v36;
    v59.longitude = v38;
    if (CLLocationCoordinate2DIsValid(v59))
    {
      if (v27)
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), v21, v27);
      else
        v39 = v21;
      v43 = v39;
      v42 = v45;
      -[ATXContextFlightEventSuggestionProducer suggestionForWeatherAtFlightDestinationLocation:destination:predictionReasons:score:](v45, "suggestionForWeatherAtFlightDestinationLocation:destination:predictionReasons:score:", v39, a5, v36, v38, a6);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v40, CFSTR("ATXHeuristicUpcomingFlightEventUtilities: Weather at travel destination suggestion"));

    }
    else
    {
      __atxlog_handle_context_heuristic();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v31;
        _os_log_impl(&dword_1C99DF000, v41, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: no location for flight destination: %@", buf, 0xCu);
      }

      v40 = 0;
      v42 = v45;
    }

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v53 = v17;
      v54 = 2112;
      v55 = v21;
      v56 = 2112;
      v57 = v23;
      _os_log_impl(&dword_1C99DF000, v31, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: Weather for flight: Missing information: Arrival IATA code: %@, arrival city: %@ flight number: %@", buf, 0x20u);
    }
    v40 = 0;
    v34 = v48;
  }

  return v40;
}

+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  ATXCalendarEventsDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  ATXInformationHeuristicRefreshLocationTrigger *v36;
  ATXInformationHeuristicRefreshLocationTrigger *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  ATXContextFlightEventSuggestionProducer *v42;
  void *v43;
  ATXContextFlightEventSuggestionProducer *v44;
  void *v45;
  ATXContextHeuristicResult *v46;
  void *v48;
  void *v49;
  ATXCalendarEventsDataSource *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id obj;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  NSObject *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "Upcoming flight Event search", buf, 2u);
  }

  v7 = v3;
  v8 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", v3);
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v8, "flightEventsFromStartDate:endDate:reason:", v4, v5, CFSTR("upcoming flights heuristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCalendarEventsDataSource sortEkEvents:](v8, "sortEkEvents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "count"))
  {
    v52 = v4;
    v53 = v12;
    v49 = v9;
    v50 = v8;
    v51 = v5;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v48 = v10;
    obj = v10;
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v63)
    {
      v13 = *(_QWORD *)v69;
      v14 = 0x1E82C3000uLL;
      v54 = *(_QWORD *)v69;
      v55 = v7;
      v58 = v11;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v69 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(*(id *)(v14 + 2648), "flightInformationSchemaForEvent:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(v14 + 2648);
          v65 = (void *)v17;
          v19 = v7;
          objc_msgSend(v18, "updatedFlightInformationSchemaForEvent:schemaForFlight:heuristicDevice:", v16);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "dateByAddingTimeInterval:", -86400.0);
          v22 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v22;
          v67 = (void *)v20;
          if (-[NSObject compare:](v22, "compare:", v23) == 1)
          {
            __atxlog_handle_context_heuristic();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v73 = v66;
              v74 = 2112;
              v75 = v23;
              _os_log_impl(&dword_1C99DF000, v24, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: flightInfoWindowStartTime %@ is after flightInfoWindowEndTime %@. Skipping event", buf, 0x16u);
            }
            v14 = 0x1E82C3000;
          }
          else
          {
            v25 = v11;
            v24 = v22;
            objc_msgSend(v16, "startDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "dateByAddingTimeInterval:", -2400.0);
            v27 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "flightCheckInActionSuggestionForEvent:flightSchema:validStartDate:validEndDate:", v16, v20, v24, v27);
            v28 = objc_claimAutoreleasedReturnValue();
            if (v28)
              objc_msgSend(v25, "addObject:", v28);
            v61 = (void *)v28;
            +[ATXHeuristicFlightEventUtilities flightInformationSpotlightSuggestionForEvent:schemaForFlight:predictionReasons:score:validStartDate:validEndDate:](ATXHeuristicFlightEventUtilities, "flightInformationSpotlightSuggestionForEvent:schemaForFlight:predictionReasons:score:validStartDate:validEndDate:", v16, v20, 0x80000000, v24, v23, 70.0);
            v29 = objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v25, "addObject:", v29);
            objc_msgSend(a1, "weatherAtTravelDestinationSpotlightEntry:schemaForFlight:predictionReasons:score:validStartDate:validEndDate:heuristicDevice:", v16, v20, 0x80000000, v24, v23, v19, 40.0);
            v30 = objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v25, "addObject:", v30);
            v59 = (void *)v30;
            +[ATXHeuristicNavigationUtilities locationFromEvent:schemaType:](ATXHeuristicNavigationUtilities, "locationFromEvent:schemaType:", v16, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (void *)v27;
            v60 = (void *)v29;
            if (+[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:"))
            {
              objc_msgSend(v16, "startDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "dateByAddingTimeInterval:", -14400.0);
              v32 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "startDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "dateByAddingTimeInterval:", -2400.0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (-[NSObject compare:](v32, "compare:", v34) == 1)
              {
                __atxlog_handle_context_heuristic();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v73 = v32;
                  v74 = 2112;
                  v75 = v34;
                  _os_log_fault_impl(&dword_1C99DF000, v35, OS_LOG_TYPE_FAULT, "ATXHeuristicUpcomingFlightEventUtilities: start %@ is after end %@", buf, 0x16u);
                }
              }
              else
              {
                +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:", v16, v67, CFSTR("AUTOMOBILE"), 0x80000000, v19, v32, 65.0, v34);
                v35 = objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  objc_msgSend(v58, "addObject:", v35);
                  v36 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                  objc_msgSend(v64, "coordinate");
                  v37 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v36, "initWithEnteringLocation:radiusInMeters:");
                  objc_msgSend(v53, "addObject:", v37);

                }
              }

            }
            else
            {
              __atxlog_handle_context_heuristic();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C99DF000, v32, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: Skipped Navigation suggestions", buf, 2u);
              }
            }

            objc_msgSend(v16, "startDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "dateByAddingTimeInterval:", -1200.0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "startDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 0x1E82C3000uLL;
            +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:](ATXHeuristicFlightEventUtilities, "_dateIntervalWithEvent:", v16);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = [ATXContextFlightEventSuggestionProducer alloc];
            objc_msgSend(v16, "title");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:](v42, "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v43, v67, 0, 0, v39, v40, 0, v41);

            -[ATXContextFlightEventSuggestionProducer suggestionForAirplaneModeWithPredictionReasons:score:](v44, "suggestionForAirplaneModeWithPredictionReasons:score:", 0x80000000, 80.0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v45, CFSTR("ATXHeuristicUpcomingFlightEventUtilities: Airplane Mode suggestion"));
              objc_msgSend(v58, "addObject:", v45);
            }

            v13 = v54;
            v7 = v55;
            v11 = v58;
          }

        }
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v63);
    }

    v12 = v53;
    v46 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v11, v53);
    v5 = v51;
    v4 = v52;
    v9 = v49;
    v8 = v50;
    v10 = v48;
  }
  else
  {
    v46 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v46;
}

@end
