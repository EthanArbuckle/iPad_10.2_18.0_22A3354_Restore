@implementation ATXDigestOnboardingSuggestionLoggingEvent

- (ATXDigestOnboardingSuggestionLoggingEvent)initWithSessionUUID:(id)a3 outcome:(int)a4 timeToResolution:(double)a5
{
  id v9;
  ATXDigestOnboardingSuggestionLoggingEvent *v10;
  ATXDigestOnboardingSuggestionLoggingEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXDigestOnboardingSuggestionLoggingEvent;
  v10 = -[ATXDigestOnboardingSuggestionLoggingEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sessionUUID, a3);
    v11->_outcome = a4;
    v11->_timeToResolution = a5;
  }

  return v11;
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

- (ATXDigestOnboardingSuggestionLoggingEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBDigestOnboardingSuggestionLoggingEvent *v5;
  ATXDigestOnboardingSuggestionLoggingEvent *v6;

  v4 = a3;
  v5 = -[ATXPBDigestOnboardingSuggestionLoggingEvent initWithData:]([ATXPBDigestOnboardingSuggestionLoggingEvent alloc], "initWithData:", v4);

  v6 = -[ATXDigestOnboardingSuggestionLoggingEvent initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXDigestOnboardingSuggestionLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXDigestOnboardingSuggestionLoggingEvent)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  ATXDigestOnboardingSuggestionLoggingEvent *v13;
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
  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = v4;
  v7 = [v5 alloc];
  objc_msgSend(v6, "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  v10 = objc_msgSend(v6, "digestOnboardingSuggestionOutcome");
  objc_msgSend(v6, "timeToResolution");
  v12 = v11;

  self = -[ATXDigestOnboardingSuggestionLoggingEvent initWithSessionUUID:outcome:timeToResolution:](self, "initWithSessionUUID:outcome:timeToResolution:", v9, v10, v12);
  v13 = self;
LABEL_8:

  return v13;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_sessionUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionUUID:", v4);

  objc_msgSend(v3, "setDigestOnboardingSuggestionOutcome:", self->_outcome);
  objc_msgSend(v3, "setTimeToResolution:", self->_timeToResolution);
  return v3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (int)outcome
{
  return self->_outcome;
}

- (double)timeToResolution
{
  return self->_timeToResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
