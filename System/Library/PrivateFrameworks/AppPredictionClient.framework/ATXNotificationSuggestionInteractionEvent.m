@implementation ATXNotificationSuggestionInteractionEvent

- (ATXNotificationSuggestionInteractionEvent)initWithSuggestionType:(int64_t)a3 eventType:(int64_t)a4 suggestionUUID:(id)a5 eventDate:(id)a6
{
  id v12;
  id v13;
  ATXNotificationSuggestionInteractionEvent *v14;
  ATXNotificationSuggestionInteractionEvent *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a5;
  v13 = a6;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNotificationSuggestionInteractionEvent.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionType"));

    if (a4)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNotificationSuggestionInteractionEvent.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionUUID"));

      if (v13)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNotificationSuggestionInteractionEvent.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventType"));

  if (!v12)
    goto LABEL_10;
LABEL_4:
  if (v13)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNotificationSuggestionInteractionEvent.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventDate"));

LABEL_5:
  v21.receiver = self;
  v21.super_class = (Class)ATXNotificationSuggestionInteractionEvent;
  v14 = -[ATXNotificationSuggestionInteractionEvent init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_suggestionType = a3;
    v14->_eventType = a4;
    objc_storeStrong((id *)&v14->_suggestionUUID, a5);
    objc_storeStrong((id *)&v15->_eventDate, a6);
  }

  return v15;
}

- (BOOL)eventCausesSuggestionInactivity
{
  return (self->_eventType < 9uLL) & (0x176u >> self->_eventType);
}

- (BOOL)isEqual:(id)a3
{
  ATXNotificationSuggestionInteractionEvent *v4;
  ATXNotificationSuggestionInteractionEvent *v5;
  BOOL v6;

  v4 = (ATXNotificationSuggestionInteractionEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXNotificationSuggestionInteractionEvent isEqualToATXNotificationSuggestionInteractionEvent:](self, "isEqualToATXNotificationSuggestionInteractionEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXNotificationSuggestionInteractionEvent:(id)a3
{
  id *v4;
  NSUUID *suggestionUUID;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  BOOL v10;
  double v12;
  double v13;
  void *v14;
  double v15;

  v4 = (id *)a3;
  if (__PAIR128__(objc_msgSend(v4, "eventType"), objc_msgSend(v4, "suggestionType")) != *(_OWORD *)&self->_suggestionType)
    goto LABEL_4;
  suggestionUUID = self->_suggestionUUID;
  v6 = (NSUUID *)v4[3];
  if (suggestionUUID == v6)
  {

    goto LABEL_7;
  }
  v7 = v6;
  v8 = suggestionUUID;
  v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

  if ((v9 & 1) != 0)
  {
LABEL_7:
    -[NSDate timeIntervalSinceReferenceDate](self->_eventDate, "timeIntervalSinceReferenceDate");
    v13 = v12;
    objc_msgSend(v4, "eventDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v10 = vabdd_f64(v13, v15) <= 2.22044605e-16;

    goto LABEL_5;
  }
LABEL_4:
  v10 = 0;
LABEL_5:

  return v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonRawData
{
  int64_t suggestionType;
  __CFString *v4;
  int64_t eventType;
  __CFString *v6;
  void *v7;
  NSDate *eventDate;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("suggestionType");
  suggestionType = self->_suggestionType;
  if (suggestionType >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), suggestionType, v11[0]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D58C50[(int)suggestionType];
  }
  v12[0] = v4;
  v11[1] = CFSTR("eventType");
  eventType = self->_eventType;
  if (eventType >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E4D58CA8[(int)eventType];
  }
  v12[1] = v6;
  v11[2] = CFSTR("suggestionUUID");
  -[NSUUID UUIDString](self->_suggestionUUID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = CFSTR("eventDate");
  eventDate = self->_eventDate;
  v12[2] = v7;
  v12[3] = eventDate;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXNotificationSuggestionInteractionEvent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXNotificationSuggestionInteractionEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBNotificationSuggestionInteractionEvent *v5;
  ATXNotificationSuggestionInteractionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBNotificationSuggestionInteractionEvent initWithData:]([ATXPBNotificationSuggestionInteractionEvent alloc], "initWithData:", v4);

    self = -[ATXNotificationSuggestionInteractionEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXNotificationSuggestionInteractionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXNotificationSuggestionInteractionEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  ATXNotificationSuggestionInteractionEvent *v14;
  NSObject *v15;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v15);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = -[ATXPBNotificationSuggestionInteractionEvent suggestionType]((uint64_t)v5);
  v7 = -[ATXPBNotificationSuggestionInteractionEvent eventType]((uint64_t)v5);
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[ATXPBNotificationSuggestionInteractionEvent suggestionUUID]((uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  v11 = objc_alloc(MEMORY[0x1E0C99D68]);
  v12 = -[ATXPBNotificationSuggestionInteractionEvent secondsSinceReferenceDate]((uint64_t)v5);

  v13 = (void *)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:", v12);
  self = -[ATXNotificationSuggestionInteractionEvent initWithSuggestionType:eventType:suggestionUUID:eventDate:](self, "initWithSuggestionType:eventType:suggestionUUID:eventDate:", v6, v7, v10, v13);

  v14 = self;
LABEL_8:

  return v14;
}

- (id)proto
{
  void *v3;
  void *v4;
  double v5;

  v3 = (void *)objc_opt_new();
  -[ATXPBNotificationSuggestionInteractionEvent setSuggestionType:]((uint64_t)v3, self->_suggestionType);
  -[ATXPBNotificationSuggestionInteractionEvent setEventType:]((uint64_t)v3, self->_eventType);
  -[NSUUID UUIDString](self->_suggestionUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationSuggestionInteractionEvent setSuggestionUUID:]((uint64_t)v3, v4);

  -[NSDate timeIntervalSinceReferenceDate](self->_eventDate, "timeIntervalSinceReferenceDate");
  -[ATXPBNotificationSuggestionInteractionEvent setSecondsSinceReferenceDate:]((uint64_t)v3, v5);
  return v3;
}

- (int64_t)suggestionType
{
  return self->_suggestionType;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSUUID)suggestionUUID
{
  return self->_suggestionUUID;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

@end
