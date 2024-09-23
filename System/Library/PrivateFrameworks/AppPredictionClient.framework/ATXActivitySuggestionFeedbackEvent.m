@implementation ATXActivitySuggestionFeedbackEvent

- (ATXActivitySuggestionFeedbackEvent)initWithEventDate:(id)a3 activity:(id)a4 acceptedTriggers:(id)a5 eventType:(unint64_t)a6 suggestionType:(unint64_t)a7 location:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  ATXActivitySuggestionFeedbackEvent *v18;
  ATXActivitySuggestionFeedbackEvent *v19;
  uint64_t v20;
  NSArray *acceptedTriggers;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ATXActivitySuggestionFeedbackEvent;
  v18 = -[ATXActivitySuggestionFeedbackEvent init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventDate, a3);
    v19->_eventType = a6;
    v19->_suggestionType = a7;
    objc_storeStrong((id *)&v19->_activity, a4);
    v20 = objc_msgSend(v17, "copy");
    acceptedTriggers = v19->_acceptedTriggers;
    v19->_acceptedTriggers = (NSArray *)v20;

    v19->_location = a8;
  }

  return v19;
}

- (ATXActivitySuggestionFeedbackEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBActivitySuggestionFeedbackEvent *v5;
  ATXActivitySuggestionFeedbackEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBActivitySuggestionFeedbackEvent initWithData:]([ATXPBActivitySuggestionFeedbackEvent alloc], "initWithData:", v4);

    self = -[ATXActivitySuggestionFeedbackEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXActivitySuggestionFeedbackEvent)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  ATXActivitySuggestionFeedbackEvent *v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  ATXActivity *v26;
  ATXActivity *v27;
  void *v28;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[ATXActivitySuggestionFeedbackEvent initWithProto:].cold.1((uint64_t)self, v19);

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E0C99D68];
  v6 = v4;
  v28 = (void *)objc_msgSend([v5 alloc], "initWithTimeIntervalSinceReferenceDate:", -[ATXPBActivitySuggestionFeedbackEvent date]((uint64_t)v6));
  -[ATXPBActivitySuggestionFeedbackEvent activity]((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [ATXActivity alloc];
  -[ATXPBActivity modeUUID]((uint64_t)v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (int)-[ATXPBActivity type]((uint64_t)v7);
  v23 = -[ATXPBActivity origin]((uint64_t)v7);
  -[ATXPBActivity originBundleId]((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity originAnchorType]((uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity suggestionUUID]((uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity serializedTriggers]((uint64_t)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ATXDeserializeTriggers();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXPBActivity uiLocation]((uint64_t)v7);
  LOBYTE(v22) = -[ATXPBActivity shouldSuggestTriggers]((_BOOL8)v7);
  LOBYTE(v21) = 0;
  v27 = -[ATXActivity initWithModeUUID:userModeName:activityType:origin:originBundleId:originAnchorType:allowsSmartEntry:suggestionUUID:triggers:location:shouldSuggestTriggers:](v26, "initWithModeUUID:userModeName:activityType:origin:originBundleId:originAnchorType:allowsSmartEntry:suggestionUUID:triggers:location:shouldSuggestTriggers:", v25, 0, v24, v23, v8, v9, v21, v10, v12, v13, v22);

  -[ATXPBActivitySuggestionFeedbackEvent serializedAcceptedTriggers]((uint64_t)v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ATXDeserializeTriggers();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (int)-[ATXPBActivitySuggestionFeedbackEvent eventType]((uint64_t)v6);
  v17 = (int)-[ATXPBActivitySuggestionFeedbackEvent suggestionType]((uint64_t)v6);
  LODWORD(v10) = -[ATXPBActivitySuggestionFeedbackEvent location]((uint64_t)v6);

  self = -[ATXActivitySuggestionFeedbackEvent initWithEventDate:activity:acceptedTriggers:eventType:suggestionType:location:](self, "initWithEventDate:activity:acceptedTriggers:eventType:suggestionType:location:", v28, v27, v15, v16, v17, (int)v10);
  v18 = self;
LABEL_8:

  return v18;
}

- (id)proto
{
  void *v3;
  double v4;
  ATXActivity *v5;
  ATXPBActivity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[ATXPBActivitySuggestionFeedbackEvent setEventType:]((uint64_t)v3, self->_eventType);
  -[NSDate timeIntervalSinceReferenceDate](self->_eventDate, "timeIntervalSinceReferenceDate");
  -[ATXPBActivitySuggestionFeedbackEvent setDate:]((uint64_t)v3, v4);
  -[ATXPBActivitySuggestionFeedbackEvent setSuggestionType:]((uint64_t)v3, self->_suggestionType);
  -[ATXPBActivitySuggestionFeedbackEvent setLocation:]((uint64_t)v3, self->_location);
  v5 = self->_activity;
  v6 = objc_alloc_init(ATXPBActivity);
  -[ATXPBActivity setUiLocation:]((uint64_t)v6, -[ATXActivity location](v5, "location"));
  -[ATXPBActivity setType:]((uint64_t)v6, -[ATXActivity activityType](v5, "activityType"));
  -[ATXActivity modeUUID](v5, "modeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity setModeUUID:]((uint64_t)v6, v7);

  -[ATXActivity suggestionUUID](v5, "suggestionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity setSuggestionUUID:]((uint64_t)v6, v8);

  -[ATXPBActivity setOrigin:]((uint64_t)v6, -[ATXActivity origin](v5, "origin"));
  -[ATXActivity originBundleId](v5, "originBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity setOriginBundleId:]((uint64_t)v6, v9);

  -[ATXActivity originAnchorType](v5, "originAnchorType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity setOriginAnchorType:]((uint64_t)v6, v10);

  -[ATXActivity triggers](v5, "triggers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ATXSerializeTriggers();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity setSerializedTriggers:]((uint64_t)v6, v12);

  LOBYTE(v11) = -[ATXActivity shouldSuggestTriggers](v5, "shouldSuggestTriggers");
  -[ATXPBActivity setShouldSuggestTriggers:]((uint64_t)v6, (char)v11);
  -[ATXPBActivitySuggestionFeedbackEvent setActivity:]((uint64_t)v3, v6);

  ATXSerializeTriggers();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivitySuggestionFeedbackEvent setSerializedAcceptedTriggers:]((uint64_t)v3, v13);

  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXActivitySuggestionFeedbackEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[NSDate description](self->_eventDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("eventDate"));

  -[ATXActivitySuggestionFeedbackEvent activityDescription](self, "activityDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_suggestionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("suggestionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("location"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_acceptedTriggers, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("acceptedTriggersCount"));

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXActivitySuggestionFeedbackEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ATXActivitySuggestionFeedbackEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXActivitySuggestionFeedbackEvent *v4;
  ATXActivitySuggestionFeedbackEvent *v5;
  BOOL v6;

  v4 = (ATXActivitySuggestionFeedbackEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActivitySuggestionFeedbackEvent isEqualToATXActivitySuggestionFeedbackEvent:](self, "isEqualToATXActivitySuggestionFeedbackEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXActivitySuggestionFeedbackEvent:(id)a3
{
  id v4;
  unint64_t eventType;
  unint64_t suggestionType;
  NSDate *eventDate;
  void *v8;
  ATXActivity *activity;
  void *v10;
  unint64_t location;
  BOOL v12;

  v4 = a3;
  eventType = self->_eventType;
  if (eventType == objc_msgSend(v4, "eventType")
    && (suggestionType = self->_suggestionType, suggestionType == objc_msgSend(v4, "suggestionType")))
  {
    eventDate = self->_eventDate;
    objc_msgSend(v4, "eventDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate isEqualToDate:](eventDate, "isEqualToDate:", v8))
    {
      activity = self->_activity;
      objc_msgSend(v4, "activity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ATXActivity isEqual:](activity, "isEqual:", v10))
      {
        location = self->_location;
        v12 = location == objc_msgSend(v4, "location");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)activityDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXActivity modeUUID](self->_activity, "modeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXActivity activityType](self->_activity, "activityType");
  v6 = -[ATXActivity location](self->_activity, "location");
  v7 = -[ATXActivity shouldSuggestTriggers](self->_activity, "shouldSuggestTriggers");
  -[ATXActivity triggers](self->_activity, "triggers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivity suggestionUUID](self->_activity, "suggestionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActivity localizedSuggestionReason](self->_activity, "localizedSuggestionReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<modeUUID = %@, activityType = %lu, location = %lu, shouldSuggestTriggers = %d, triggers = %@, suggestionUUID = %@, localizedSuggestionReason = %@>"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (ATXActivity)activity
{
  return self->_activity;
}

- (NSArray)acceptedTriggers
{
  return self->_acceptedTriggers;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (unint64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedTriggers, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBActivitySuggestionFeedbackEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
