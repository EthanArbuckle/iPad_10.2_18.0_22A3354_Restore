@implementation ATXUserNotificationDigestLoggingEvent

- (ATXUserNotificationDigestLoggingEvent)initWithNotificationDigest:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5
{
  id v9;
  ATXUserNotificationDigestLoggingEvent *v10;
  ATXUserNotificationDigestLoggingEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUserNotificationDigestLoggingEvent;
  v10 = -[ATXUserNotificationDigestLoggingEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_notificationDigest, a3);
    v11->_eventType = a4;
    v11->_timestamp = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXUserNotificationDigestLoggingEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotificationDigestLoggingEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotificationDigestLoggingEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotificationDigestLoggingEvent initWithProtoData:](self, "initWithProtoData:", v5);
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

  -[ATXUserNotificationDigestLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationDigestLoggingEvent)initWithProto:(id)a3
{
  id v4;
  ATXUserNotificationDigestLoggingEvent *v5;
  id v6;
  ATXUserNotificationDigest *v7;
  void *v8;
  uint64_t v9;
  ATXUserNotificationDigest *notificationDigest;
  double v11;
  ATXUserNotificationDigestLoggingEvent *v12;
  NSObject *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXUserNotificationDigestLoggingEvent;
  v5 = -[ATXUserNotificationDigestLoggingEvent init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  if (!v4)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)v5, v13);

    goto LABEL_9;
  }
  v6 = v4;
  v7 = [ATXUserNotificationDigest alloc];
  objc_msgSend(v6, "digest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXUserNotificationDigest initWithProto:](v7, "initWithProto:", v8);
  notificationDigest = v5->_notificationDigest;
  v5->_notificationDigest = (ATXUserNotificationDigest *)v9;

  objc_msgSend(v6, "timestamp");
  v5->_timestamp = v11;
  LODWORD(v7) = objc_msgSend(v6, "eventType");

  v5->_eventType = (int)v7;
LABEL_5:
  v12 = v5;
LABEL_10:

  return v12;
}

- (ATXUserNotificationDigestLoggingEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationDigestLoggingEvent *v5;
  ATXUserNotificationDigestLoggingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationDigestLoggingEvent initWithData:]([ATXPBUserNotificationDigestLoggingEvent alloc], "initWithData:", v4);

    self = -[ATXUserNotificationDigestLoggingEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setEventType:", -[ATXUserNotificationDigestLoggingEvent eventType](self, "eventType"));
  -[ATXUserNotificationDigestLoggingEvent timestamp](self, "timestamp");
  objc_msgSend(v3, "setTimestamp:");
  -[ATXUserNotificationDigestLoggingEvent notificationDigest](self, "notificationDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDigest:", v5);

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationDigestLoggingEvent *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationDigestLoggingEvent initFromJSON:]([ATXPBUserNotificationDigestLoggingEvent alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationDigestLoggingEvent initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationDigestLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXUserNotificationDigestLoggingEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (ATXUserNotificationDigest)notificationDigest
{
  return self->_notificationDigest;
}

- (void)setNotificationDigest:(id)a3
{
  objc_storeStrong((id *)&self->_notificationDigest, a3);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDigest, 0);
}

@end
