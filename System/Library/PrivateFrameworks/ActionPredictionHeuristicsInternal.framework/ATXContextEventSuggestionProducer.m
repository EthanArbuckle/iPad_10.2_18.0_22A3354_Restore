@implementation ATXContextEventSuggestionProducer

- (ATXContextEventSuggestionProducer)initWithEvent:(id)a3 validFromStartDate:(id)a4 validToEndDate:(id)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXContextEventSuggestionProducer *v15;
  ATXContextEventSuggestionProducer *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *eventTitle;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ATXContextEventSuggestionProducer;
  v15 = -[ATXContextEventSuggestionProducer init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_event, a3);
    objc_msgSend(v11, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    eventTitle = v16->_eventTitle;
    v16->_eventTitle = (NSString *)v19;

    objc_storeStrong((id *)&v16->_validFromStartDate, a4);
    objc_storeStrong((id *)&v16->_validToEndDate, a5);
    objc_storeStrong((id *)&v16->_environment, a6);
  }

  return v16;
}

- (id)suggestionForEventOrganizerWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[EKEvent organizer](self->_event, "organizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136446210;
      v28 = "-[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:]";
      v11 = "%{public}s null _event.organizer: No suggestion";
      goto LABEL_7;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  -[EKEvent organizer](self->_event, "organizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentUser");

  if (v9)
  {
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136446210;
      v28 = "-[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:]";
      v11 = "%{public}s event organizer is current user: No suggestion";
LABEL_7:
      _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[EKEvent organizer](self->_event, "organizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXContextEventSuggestionProducer _isStringValidEmail:](self, "_isStringValidEmail:", v15);

  if (v16)
  {
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[EKEvent organizer](self->_event, "organizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 136446466;
      v28 = "-[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:]";
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s event organizer name (%@) is an email address: No suggestion", (uint8_t *)&v27, 0x16u);

    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_EVENT_ORGANIZER_SUBTITLE"), &stru_1E82C5A18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent organizer](self->_event, "organizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextEventSuggestionProducer _spotlightActionWithParticipant:subtitle:](self, "_spotlightActionWithParticipant:subtitle:", v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = self->_eventTitle;
    -[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:](self, "scoreWithEventParticipantStatusPenalty:", a3);
    v24 = v23;
    -[ATXContextEventSuggestionProducer _dateInterval](self, "_dateInterval");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", v21, a4, v22, v25, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1C99DF000, v26, OS_LOG_TYPE_DEFAULT, "_actionWithParticipant returned nil", (uint8_t *)&v27, 2u);
    }

    v12 = 0;
  }

LABEL_9:
  return v12;
}

- (BOOL)_isStringValidEmail:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  BOOL v14;
  _OWORD v16[4];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3560];
  v4 = a3;
  objc_msgSend(v3, "dataDetectorWithTypes:error:", 32, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v16, 0, sizeof(v16));
  if (!objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v16, v17, 16))
    goto LABEL_5;
  v7 = (void *)**((_QWORD **)&v16[0] + 1);
  objc_msgSend(**((id **)&v16[0] + 1), "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("mailto"));

  if (v11)
  {
    objc_msgSend(v7, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length") != 0;

  }
  else
  {
LABEL_5:
    v14 = 0;
  }

  return v14;
}

- (id)suggestionForEventParticipantWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  -[EKEvent organizer](self->_event, "organizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentUser");

  if ((v9 & 1) == 0)
  {
    __atxlog_handle_context_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:]";
      v25 = "%{public}s You are not the organizer: No suggestion";
      v26 = v16;
      v27 = 12;
LABEL_19:
      _os_log_impl(&dword_1C99DF000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }
LABEL_20:
    v24 = 0;
    goto LABEL_25;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[EKEvent attendees](self->_event, "attendees", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isCurrentUser") & 1) == 0 && objc_msgSend(v15, "participantType") != 2)
          objc_msgSend(v7, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v7, "count") != 1)
  {
    __atxlog_handle_context_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 136446466;
      v35 = "-[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:]";
      v36 = 2048;
      v37 = v28;
      v25 = "%{public}s %lu other participants: No suggestion";
      v26 = v16;
      v27 = 22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  objc_msgSend(v7, "firstObject");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_EVENT_PARTICIPANT_SUBTITLE"), &stru_1E82C5A18, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextEventSuggestionProducer _spotlightActionWithParticipant:subtitle:](self, "_spotlightActionWithParticipant:subtitle:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = self->_eventTitle;
    -[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:](self, "scoreWithEventParticipantStatusPenalty:", a3);
    v22 = v21;
    -[ATXContextEventSuggestionProducer _dateInterval](self, "_dateInterval");
    v23 = objc_claimAutoreleasedReturnValue();
    +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", v19, a4, v20, v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "_actionWithParticipant returned nil", buf, 2u);
    }
    v24 = 0;
  }

LABEL_25:
  return v24;
}

- (id)_spotlightActionWithParticipant:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ATXContextHeuristicsEnvironment heuristicDevice](self->_environment, "heuristicDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactForParticipant:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446978;
    v19 = "-[ATXContextEventSuggestionProducer _spotlightActionWithParticipant:subtitle:]";
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s participantID:%@ participantName:%@, participantEmail:%@", (uint8_t *)&v18, 0x2Au);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", self->_validFromStartDate, self->_validToEndDate, 0, 0);
  if (!v11 || !v8)
  {
    if (v11 && v12)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithContactName:contactEmail:subtitle:criteria:", v11, v12, v7, v14);
      if (v15)
        goto LABEL_16;
      __atxlog_handle_context_heuristic();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "Updated api to create participant using email not available", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicBirthdayContact _spotlightActionWithName:email:identifier:startDate:endDate:subtitle:].cold.1(v16);
    }

    v15 = 0;
    goto LABEL_16;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithContactName:contactIdentifier:subtitle:criteria:", v11, v8, v7, v14);
LABEL_16:

  return v15;
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __67__ATXContextEventSuggestionProducer__stringsWithPredictionReasons___block_invoke(uint64_t a1)
{
  id v2;

  stringForATXSuggestionPredictionReasonCode();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);

}

- (id)suggestionForDNDWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSString *eventTitle;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSString *v14;
  void *v15;
  NSDate *validToEndDate;
  void *v17;
  void *v18;

  -[EKEvent endDate](self->_event, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent startDate](self->_event, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -900.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  eventTitle = self->_eventTitle;
  -[EKEvent UUID](self->_event, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent calendarItemIdentifier](self->_event, "calendarItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:](self, "scoreWithEventParticipantStatusPenalty:", a3);
  v13 = v12;
  v14 = self->_eventTitle;
  -[NSDate laterDate:](self->_validFromStartDate, "laterDate:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  validToEndDate = self->_validToEndDate;
  -[ATXContextEventSuggestionProducer _dateInterval](self, "_dateInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer suggestionForDNDWithTitle:eventUniqueID:identifier:until:score:predictionReasons:localizedReason:validFromStartDate:validToEndDate:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionForDNDWithTitle:eventUniqueID:identifier:until:score:predictionReasons:localizedReason:validFromStartDate:validToEndDate:dateInterval:", eventTitle, v10, v11, v6, a4, v14, v13, v15, validToEndDate, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)suggestionForConferenceWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSString *eventTitle;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1CAA46CBC](self, a2);
  -[EKEvent virtualConference](self->_event, "virtualConference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "joinMethods");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[EKEvent conferenceURLForDisplay](self->_event, "conferenceURLForDisplay");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_autoreleasePoolPop(v7);
  __atxlog_handle_context_heuristic();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[EKEvent eventIdentifier](self->_event, "eventIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent title](self->_event, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hash");
    -[EKEvent startDate](self->_event, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413058;
    v28 = v16;
    v29 = 2048;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    v33 = 1024;
    v34 = v14 != 0;
    _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has conferenceURL:%{BOOL}i", (uint8_t *)&v27, 0x26u);

  }
  if (v14)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", self->_validFromStartDate, self->_validToEndDate, 0, 0);
    -[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:](self, "scoreWithEventParticipantStatusPenalty:", a3);
    v22 = v21;
    eventTitle = self->_eventTitle;
    -[ATXContextEventSuggestionProducer _dateInterval](self, "_dateInterval");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXContextHeuristicSuggestionProducer suggestionForConferenceWithURL:score:predictionReasons:localizedReason:criteria:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionForConferenceWithURL:score:predictionReasons:localizedReason:criteria:dateInterval:", v14, a4, eventTitle, v20, v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (double)scoreWithEventParticipantStatusPenalty:(double)a3
{
  EKEvent **p_event;
  uint64_t v6;
  NSObject *v7;

  p_event = &self->_event;
  v6 = -[EKEvent participationStatus](self->_event, "participationStatus");
  if (v6 != 2)
  {
    if (v6 == 4)
    {
      return a3 * 0.5;
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:].cold.1((uint64_t)self, (id *)p_event, v7);

    }
  }
  return a3;
}

- (id)_dateInterval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[EKEvent startDate](self->_event, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent endDate](self->_event, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_validToEndDate, 0);
  objc_storeStrong((id *)&self->_validFromStartDate, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)scoreWithEventParticipantStatusPenalty:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 16);
  v5 = objc_msgSend(*a2, "participationStatus");
  v6 = 136447234;
  v7 = "-[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:]";
  v8 = 2112;
  v9 = v4;
  v10 = 2048;
  v11 = v5;
  v12 = 2048;
  v13 = 2;
  v14 = 2048;
  v15 = 4;
  _os_log_fault_impl(&dword_1C99DF000, a3, OS_LOG_TYPE_FAULT, "%{public}s _event.participationStatus for %@ is %ld not one of {%ld, %ld}. No penalty aplied", (uint8_t *)&v6, 0x34u);
}

@end
