@implementation ATXNotificationGroupEvent

- (ATXNotificationGroupEvent)initWithEventType:(int64_t)a3 uuid:(id)a4 eventDate:(id)a5
{
  id v10;
  id v11;
  void *v12;
  ATXNotificationGroupEvent *v13;
  ATXNotificationGroupEvent *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a3)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNotificationGroupEvent.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventType"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNotificationGroupEvent.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventDate"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ATXNotificationGroupEvent;
  v13 = -[ATXNotificationGroupEvent init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_eventType = a3;
    objc_storeStrong((id *)&v13->_uuid, a4);
    objc_storeStrong((id *)&v14->_eventDate, a5);
  }

  return v14;
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
  int64_t eventType;
  __CFString *v4;
  void *v5;
  NSDate *eventDate;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("eventType");
  eventType = self->_eventType;
  if (eventType >= 0x16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), eventType, v9[0]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D58420[(int)eventType];
  }
  v10[0] = v4;
  v9[1] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("eventDate");
  eventDate = self->_eventDate;
  v10[1] = v5;
  v10[2] = eventDate;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXNotificationGroupEvent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXNotificationGroupEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBNotificationGroupEvent *v5;
  ATXNotificationGroupEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBNotificationGroupEvent initWithData:]([ATXPBNotificationGroupEvent alloc], "initWithData:", v4);

    self = -[ATXNotificationGroupEvent initWithProto:](self, "initWithProto:", v5);
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

  -[ATXNotificationGroupEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXNotificationGroupEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  ATXNotificationGroupEvent *v13;
  NSObject *v14;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v14);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = -[ATXPBNotificationGroupEvent eventType]((uint64_t)v5);
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[ATXPBNotificationGroupEvent uuid]((uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  v10 = objc_alloc(MEMORY[0x1E0C99D68]);
  v11 = -[ATXPBNotificationGroupEvent secondsSinceReferenceDate]((uint64_t)v5);

  v12 = (void *)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v11);
  self = -[ATXNotificationGroupEvent initWithEventType:uuid:eventDate:](self, "initWithEventType:uuid:eventDate:", v6, v9, v12);

  v13 = self;
LABEL_8:

  return v13;
}

- (id)proto
{
  void *v3;
  void *v4;
  double v5;

  v3 = (void *)objc_opt_new();
  -[ATXPBNotificationGroupEvent setEventType:]((uint64_t)v3, self->_eventType);
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationGroupEvent setUuid:]((uint64_t)v3, v4);

  -[NSDate timeIntervalSinceReferenceDate](self->_eventDate, "timeIntervalSinceReferenceDate");
  -[ATXPBNotificationGroupEvent setSecondsSinceReferenceDate:]((uint64_t)v3, v5);
  return v3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
