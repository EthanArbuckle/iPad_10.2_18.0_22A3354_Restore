@implementation ATXContextNavigationSuggestionProducer

- (id)_contextTitleWithReasons:(unint64_t)a3
{
  NSObject *v5;
  NSString *title;
  NSDictionary *schemaForEvent;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  EKEvent *event;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  NSString *alternateDestinationTitle;
  EKEvent *v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    title = self->_title;
    *(_DWORD *)buf = 136446466;
    v35 = "-[ATXContextNavigationSuggestionProducer _contextTitleWithReasons:]";
    v36 = 2112;
    v37 = title;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s _eventTitle:%@", buf, 0x16u);
  }

  schemaForEvent = self->_schemaForEvent;
  if (schemaForEvent)
  {
    -[NSDictionary objectForKeyedSubscript:](schemaForEvent, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("addressLocality"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    event = self->_event;
    if (!event)
      goto LABEL_12;
    -[EKEvent customObjectForKey:](event, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("address"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("addressLocality"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
  {
    if ((a3 & 0x80000000) == 0)
      goto LABEL_9;
LABEL_15:
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("CONTEXT_UPCOMING_FLIGHT_TITLE");
    goto LABEL_26;
  }
LABEL_12:
  if ((a3 & 0x380000000) != 0 || (alternateDestinationTitle = self->_alternateDestinationTitle) == 0)
  {
    if ((a3 & 0x80000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v25;
      v26 = CFSTR("CONTEXT_UPCOMING_FLIGHT_NO_ARRIVAL_CITY_TITLE");
    }
    else if ((a3 & 0x100000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v25;
      v26 = CFSTR("CONTEXT_ONGOING_FLIGHT_NO_ARRIVAL_CITY_TITLE");
    }
    else
    {
      if ((a3 & 0x200000000) == 0)
      {
        v11 = 0;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v25;
      v26 = CFSTR("CONTEXT_CONCLUDED_FLIGHT_NO_ARRIVAL_CITY_TITLE");
    }
    objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_1E82C5A18, 0);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_37;
  }
  v11 = alternateDestinationTitle;
  if ((a3 & 0x80000000) != 0)
    goto LABEL_15;
LABEL_9:
  if ((a3 & 0x100000000) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("CONTEXT_ONGOING_FLIGHT_TITLE");
    goto LABEL_26;
  }
  if ((a3 & 0x200000000) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("CONTEXT_CONCLUDED_FLIGHT_TITLE");
LABEL_26:
    objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E82C5A18, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v24, v11);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_37:
    goto LABEL_38;
  }
LABEL_20:
  if ((a3 & 0x300000) != 0)
  {
    v21 = self->_event;
    if (v21)
    {
      -[EKEvent title](v21, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (NSString *)v18;
      if (!v18)
        v22 = self->_title;
      v23 = v22;
      goto LABEL_37;
    }
  }
  if ((a3 & 0x1000000000) != 0)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = CFSTR("CONTEXT_TITLE_UPCOMING_TO_WORK_COMMUTE");
LABEL_40:
    objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_1E82C5A18, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v33);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  if ((a3 & 0x2000000000) != 0)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = CFSTR("CONTEXT_TITLE_UPCOMING_FROM_WORK_COMMUTE");
    goto LABEL_40;
  }
  __atxlog_handle_context_heuristic();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    -[ATXContextNavigationSuggestionProducer _contextTitleWithReasons:].cold.1(self, a3, v27);

  v23 = self->_title;
LABEL_38:

  return v23;
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
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __72__ATXContextNavigationSuggestionProducer__stringsWithPredictionReasons___block_invoke(uint64_t a1)
{
  id v2;

  stringForATXSuggestionPredictionReasonCode();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);

}

- (ATXContextNavigationSuggestionProducer)initWithTitle:(id)a3 event:(id)a4 schemaForEvent:(id)a5 alternateDestinationTitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXContextNavigationSuggestionProducer *v15;
  ATXContextNavigationSuggestionProducer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXContextNavigationSuggestionProducer;
  v15 = -[ATXContextNavigationSuggestionProducer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_event, a4);
    objc_storeStrong((id *)&v16->_schemaForEvent, a5);
    objc_storeStrong((id *)&v16->_alternateDestinationTitle, a6);
  }

  return v16;
}

- (id)suggestionForNavigationToDestination:(id)a3 transportType:(unint64_t)a4 destinationName:(id)a5 subtitle:(id)a6 predictionReasons:(unint64_t)a7 score:(double)a8 shouldClearOnEngagement:(BOOL)a9 validStartDate:(id)a10 validEndDate:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSString *title;
  void *v24;
  void *v25;
  uint64_t v27;

  v17 = a11;
  v18 = a10;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  -[ATXContextNavigationSuggestionProducer _contextTitleWithReasons:](self, "_contextTitleWithReasons:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  -[ATXContextNavigationSuggestionProducer _dateInterval](self, "_dateInterval");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a9;
  +[ATXContextHeuristicSuggestionProducer navigationToDestination:title:subtitle:transportType:destinationName:predictionReasons:localizedReason:score:shouldClearOnEngagement:validStartDate:validEndDate:dateInterval:](ATXContextHeuristicSuggestionProducer, "navigationToDestination:title:subtitle:transportType:destinationName:predictionReasons:localizedReason:score:shouldClearOnEngagement:validStartDate:validEndDate:dateInterval:", v21, title, v19, a4, v20, a7, a8, v22, v27, v18, v17, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_dateInterval
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKEvent startDate](self->_event, "startDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[EKEvent endDate](self->_event, "endDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[EKEvent startDate](self->_event, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent endDate](self->_event, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDestinationTitle, 0);
  objc_storeStrong((id *)&self->_schemaForEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_contextTitleWithReasons:(NSObject *)a3 .cold.1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a1[1];
  objc_msgSend(a1, "_stringsWithPredictionReasons:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136446722;
  v7 = "-[ATXContextNavigationSuggestionProducer _contextTitleWithReasons:]";
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_fault_impl(&dword_1C99DF000, a3, OS_LOG_TYPE_FAULT, "%{public}s The predictionReasons for the suggestion for event %@ :%@ was not one of UpcomingFlight, OngoingFlight, ConcludedFlight, CommuteToWork and CommuteFromWork. Falling back on the title", (uint8_t *)&v6, 0x20u);

}

@end
