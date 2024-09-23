@implementation ATXContextFlightEventSuggestionProducer

- (ATXContextFlightEventSuggestionProducer)initWithTitle:(id)a3 flightInformationSchema:(id)a4 urlString:(id)a5 teamIdentifier:(id)a6 validFromStartDate:(id)a7 validToEndDate:(id)a8 alternateDestinationTitle:(id)a9 dateInterval:(id)a10
{
  id v17;
  ATXContextFlightEventSuggestionProducer *v18;
  ATXContextFlightEventSuggestionProducer *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ATXContextFlightEventSuggestionProducer;
  v18 = -[ATXContextFlightEventSuggestionProducer init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_flightInformationSchema, a4);
    objc_storeStrong((id *)&v19->_urlString, a5);
    objc_storeStrong((id *)&v19->_teamIdentifier, a6);
    objc_storeStrong((id *)&v19->_validFromStartDate, a7);
    objc_storeStrong((id *)&v19->_validToEndDate, a8);
    objc_storeStrong((id *)&v19->_alternateDestinationTitle, a9);
    objc_storeStrong((id *)&v19->_dateInterval, a10);
  }

  return v19;
}

- (id)_contextTitleWithReasons:(unint64_t)a3
{
  NSObject *v5;
  NSString *title;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  NSString *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    title = self->_title;
    *(_DWORD *)buf = 136446466;
    v24 = "-[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:]";
    v25 = 2112;
    v26 = title;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s _eventTitle:%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_flightInformationSchema, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("address"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("addressLocality"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((a3 & 0x80000000) == 0)
      goto LABEL_5;
LABEL_11:
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("CONTEXT_UPCOMING_FLIGHT_NO_ARRIVAL_CITY_TITLE");
      goto LABEL_21;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = CFSTR("CONTEXT_UPCOMING_FLIGHT_TITLE");
LABEL_18:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v15, &stru_1E82C5A18, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v17, v11);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v13 = (NSString *)v19;

    goto LABEL_23;
  }
  v11 = self->_alternateDestinationTitle;
  if ((a3 & 0x80000000) != 0)
    goto LABEL_11;
LABEL_5:
  if ((a3 & 0x100000000) != 0)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("CONTEXT_ONGOING_FLIGHT_NO_ARRIVAL_CITY_TITLE");
      goto LABEL_21;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = CFSTR("CONTEXT_ONGOING_FLIGHT_TITLE");
    goto LABEL_18;
  }
  if ((a3 & 0x200000000) != 0)
  {
    if (v11)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("CONTEXT_CONCLUDED_FLIGHT_TITLE");
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("CONTEXT_CONCLUDED_FLIGHT_NO_ARRIVAL_CITY_TITLE");
LABEL_21:
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E82C5A18, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  __atxlog_handle_context_heuristic();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v21 = self->_title;
    -[ATXContextFlightEventSuggestionProducer _stringsWithPredictionReasons:](self, "_stringsWithPredictionReasons:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v24 = "-[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:]";
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v11;
    _os_log_fault_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_FAULT, "%{public}s The predictionReasons for the suggestion for event%@ :%@ was not one of UpcomingFlight, OngoingFlight, ConcludedFlight. Arrival city: %@. Falling back on the title", buf, 0x2Au);

  }
  v13 = self->_title;
LABEL_23:

  return v13;
}

- (id)_stringsWithPredictionReasons:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __73__ATXContextFlightEventSuggestionProducer__stringsWithPredictionReasons___block_invoke(uint64_t a1)
{
  id v2;

  stringForATXSuggestionPredictionReasonCode();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);

}

- (id)suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:](self, "_contextTitleWithReasons:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", v8, a4, v9, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)suggestionForFlightInformationWithReason:(unint64_t)a3 score:(double)a4 date:(id)a5
{
  NSDictionary *flightInformationSchema;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  flightInformationSchema = self->_flightInformationSchema;
  v10 = a5;
  -[NSDictionary objectForKeyedSubscript:](flightInformationSchema, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXContextFlightEventSuggestionProducer.m"), 117, CFSTR("Missing Flight Number for retrieving flight information"));

  }
  __atxlog_handle_context_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136446466;
    v20 = "-[ATXContextFlightEventSuggestionProducer suggestionForFlightInformationWithReason:score:date:]";
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "Flight Info: %{public}s flightNumber:%@", (uint8_t *)&v19, 0x16u);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", self->_validFromStartDate, self->_validToEndDate, 0, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithFlightCode:date:criteria:", v12, v10, v14);

  -[ATXContextFlightEventSuggestionProducer suggestionWithAction:predictionReasons:score:](self, "suggestionWithAction:predictionReasons:score:", v15, a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)suggestionForWeatherAtFlightDestinationLocation:(CLLocationCoordinate2D)a3 destination:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6
{
  double longitude;
  double latitude;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v11 = (objc_class *)MEMORY[0x1E0CF8C28];
  v12 = a4;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithStartDate:endDate:lockScreenEligible:predicate:", self->_validFromStartDate, self->_validToEndDate, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithWeatherLocation:latitude:longitude:criteria:", v12, v13, latitude, longitude);

  -[ATXContextFlightEventSuggestionProducer suggestionWithAction:predictionReasons:score:](self, "suggestionWithAction:predictionReasons:score:", v14, a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)suggestionForRideShareAppForDestination:(id)a3 source:(id)a4 rideOptionName:(id)a5 preferredBundleId:(id)a6 predictionReasons:(unint64_t)a7 score:(double)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a6;
  v13 = a3;
  -[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:](self, "_contextTitleWithReasons:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer rideshareAppActionForDestination:preferredBundleId:predictionReasons:title:localizedReason:score:validFromStartDate:validToEndDate:dateInterval:](ATXContextHeuristicSuggestionProducer, "rideshareAppActionForDestination:preferredBundleId:predictionReasons:title:localizedReason:score:validFromStartDate:validToEndDate:dateInterval:", v13, v12, a7, self->_title, v14, self->_validFromStartDate, a8, self->_validToEndDate, self->_dateInterval);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)suggestionForFlightCheckInWithReason:(unint64_t)a3 score:(double)a4
{
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  if (!self->_title)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXContextFlightEventSuggestionProducer.m"), 166, CFSTR("Missing flight checkIn title "));

  }
  if (!self->_teamIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXContextFlightEventSuggestionProducer.m"), 167, CFSTR("Missing flight checkIn teamIdentifier"));

  }
  -[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:](self, "_contextTitleWithReasons:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer flightCheckInActivityWithSubtitle:url:teamIdentifier:predictionReasons:localizedReason:score:validStartDate:validEndDate:](ATXContextHeuristicSuggestionProducer, "flightCheckInActivityWithSubtitle:url:teamIdentifier:predictionReasons:localizedReason:score:validStartDate:validEndDate:", self->_title, self->_urlString, self->_teamIdentifier, a3, v8, self->_validFromStartDate, a4, self->_validToEndDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)suggestionForAirplaneModeWithPredictionReasons:(unint64_t)a3 score:(double)a4
{
  void *v7;
  void *v8;

  -[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:](self, "_contextTitleWithReasons:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer toggleAirplaneModeWithPredictionReasons:localizedReason:score:validFromStartDate:validToEndDate:dateInterval:](ATXContextHeuristicSuggestionProducer, "toggleAirplaneModeWithPredictionReasons:localizedReason:score:validFromStartDate:validToEndDate:dateInterval:", a3, v7, self->_validFromStartDate, self->_validToEndDate, self->_dateInterval, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sfSearchResult:(id)a3 title:(id)a4 subtitle:(id)a5 type:(int)a6 sectionHeader:(id)a7 score:(double)a8
{
  uint64_t v9;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v9 = *(_QWORD *)&a6;
  v13 = (objc_class *)MEMORY[0x1E0D8C6A8];
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v13);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setText:", v16);
  objc_msgSend(v18, "setTitle:", v19);
  objc_msgSend(v18, "setSecondaryTitle:", v15);

  objc_msgSend(v18, "setCompletion:", v16);
  objc_msgSend(v18, "setResultBundleId:", CFSTR("com.apple.searchd.suggestion"));
  objc_msgSend(v18, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.suggestions"));
  objc_msgSend(v18, "setRankingScore:", a8);
  objc_msgSend(v18, "setType:", v9);
  objc_msgSend(v18, "setIdentifier:", v17);

  objc_msgSend(v18, "setSectionHeader:", v14);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_alternateDestinationTitle, 0);
  objc_storeStrong((id *)&self->_validToEndDate, 0);
  objc_storeStrong((id *)&self->_validFromStartDate, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_flightInformationSchema, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
