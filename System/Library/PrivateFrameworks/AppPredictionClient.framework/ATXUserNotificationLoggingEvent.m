@implementation ATXUserNotificationLoggingEvent

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5
{
  return -[ATXUserNotificationLoggingEvent initFromUserNotification:eventType:timestamp:deliveryReason:](self, "initFromUserNotification:eventType:timestamp:deliveryReason:", a3, a4, 0, a5);
}

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6
{
  return -[ATXUserNotificationLoggingEvent initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:](self, "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:", a3, a4, a6, 5, a5);
}

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6 deliveryUI:(unint64_t)a7
{
  void *v12;
  id v13;
  void *v14;
  id v15;

  v12 = (void *)MEMORY[0x1E0D80E48];
  v13 = a3;
  objc_msgSend(v12, "currentModeUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXUserNotificationLoggingEvent initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:](self, "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:", v13, a4, a6, a7, v14, a5);

  return v15;
}

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6 deliveryUI:(unint64_t)a7 modeUUID:(id)a8
{
  id v14;
  id v15;
  ATXUserNotificationLoggingEvent *v16;
  uint64_t v17;
  ATXUserNotification *notification;
  objc_super v20;

  v14 = a3;
  v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)ATXUserNotificationLoggingEvent;
  v16 = -[ATXUserNotificationLoggingEvent init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    notification = v16->_notification;
    v16->_notification = (ATXUserNotification *)v17;

    v16->_eventType = a4;
    v16->_timestamp = a5;
    v16->_deliveryReason = a6;
    v16->_deliveryUI = a7;
    objc_storeStrong((id *)&v16->_modeUUID, a8);
  }

  return v16;
}

- (BOOL)isReceiveEvent
{
  return (self->_eventType < 0x12uLL) & (0x30001u >> self->_eventType);
}

- (BOOL)eventCausesNotificationNonprominence
{
  unint64_t eventType;
  BOOL v3;
  uint64_t v4;

  eventType = self->_eventType;
  v3 = eventType > 0x11;
  v4 = (1 << eventType) & 0x20440;
  return !v3 && v4 != 0
      || -[ATXUserNotificationLoggingEvent eventCausesNotificationInactivity](self, "eventCausesNotificationInactivity");
}

- (BOOL)eventCausesNotificationInactivity
{
  return (self->_eventType < 0x13uLL) & (0x4077Eu >> self->_eventType);
}

- (BOOL)isDeliveredInPrioritySection
{
  return self->_deliveryUI == 6 && self->_eventType == 16;
}

- (BOOL)isEqual:(id)a3
{
  ATXUserNotificationLoggingEvent *v4;
  ATXUserNotificationLoggingEvent *v5;
  BOOL v6;

  v4 = (ATXUserNotificationLoggingEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUserNotificationLoggingEvent isEqualToATXUserNotificationLoggingEvent:](self, "isEqualToATXUserNotificationLoggingEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXUserNotificationLoggingEvent:(id)a3
{
  id *v4;
  ATXUserNotification *notification;
  ATXUserNotification *v6;
  ATXUserNotification *v7;
  ATXUserNotification *v8;
  BOOL v9;
  double v10;
  BOOL v11;

  v4 = (id *)a3;
  notification = self->_notification;
  v6 = (ATXUserNotification *)v4[1];
  if (notification == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = notification;
    v9 = -[ATXUserNotification isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_9;
  }
  if ((id)self->_eventType != v4[2])
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = self->_timestamp - *((double *)v4 + 3);
  if (v10 < 0.0)
    v10 = -v10;
  v11 = v10 <= 0.1;
LABEL_10:

  return v11;
}

- (NSString)description
{
  id v3;
  int64_t eventType;
  ATXUserNotification *notification;
  __CFString *v6;
  double timestamp;
  unint64_t deliveryReason;
  __CFString *v9;
  unint64_t deliveryUI;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  notification = self->_notification;
  eventType = self->_eventType;
  if (eventType >= 0x16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E4D585E0[(int)eventType];
  }
  timestamp = self->_timestamp;
  deliveryReason = self->_deliveryReason;
  if (deliveryReason >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryReason);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E4D58690[(int)deliveryReason];
  }
  deliveryUI = self->_deliveryUI;
  if (deliveryUI >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryUI);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E4D586D0[(int)deliveryUI];
  }
  -[NSUUID UUIDString](self->_modeUUID, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Notification event: user notification: %@, event: %@, timestamp: %f, deliveryReason: %@, deliveryUI: %@, mode: %@"), notification, v6, *(_QWORD *)&timestamp, v9, v11, v12);

  return (NSString *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXUserNotificationLoggingEvent initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:](+[ATXUserNotificationLoggingEvent allocWithZone:](ATXUserNotificationLoggingEvent, "allocWithZone:", a3), "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:", self->_notification, self->_eventType, self->_deliveryReason, self->_deliveryUI, self->_modeUUID, self->_timestamp);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationLoggingEvent *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationLoggingEvent initFromJSON:]([ATXPBUserNotificationLoggingEvent alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationLoggingEvent initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  return +[ATXJSONHelper unwrapData:](ATXJSONHelper, "unwrapData:", self);
}

- (ATXUserNotificationLoggingEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationLoggingEvent *v5;
  ATXUserNotificationLoggingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationLoggingEvent initWithData:]([ATXPBUserNotificationLoggingEvent alloc], "initWithData:", v4);

    self = -[ATXUserNotificationLoggingEvent initWithProto:](self, "initWithProto:", v5);
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

  -[ATXUserNotificationLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationLoggingEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  ATXUserNotificationLoggingEvent *v6;
  void *v7;
  char isKindOfClass;
  ATXUserNotification *v9;
  void *v10;
  ATXUserNotification *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject notification](v5, "notification");
      v6 = (ATXUserNotificationLoggingEvent *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      -[NSObject notification](v5, "notification");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v9 = [ATXUserNotification alloc];
        -[NSObject notification](v5, "notification");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[ATXUserNotification initWithProto:](v9, "initWithProto:", v10);

        v12 = (int)-[NSObject eventType](v5, "eventType");
        -[NSObject timestamp](v5, "timestamp");
        v14 = v13;
        v15 = (int)-[NSObject deliveryReason](v5, "deliveryReason");
        v16 = (int)-[NSObject deliveryUI](v5, "deliveryUI");
        -[NSObject modeIdentifier](v5, "modeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
          -[NSObject modeIdentifier](v5, "modeIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);
          self = (ATXUserNotificationLoggingEvent *)-[ATXUserNotificationLoggingEvent initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:](self, "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:", v11, v12, v15, v16, v20, v14);

        }
        else
        {
          self = (ATXUserNotificationLoggingEvent *)-[ATXUserNotificationLoggingEvent initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:](self, "initFromUserNotification:eventType:timestamp:deliveryReason:deliveryUI:modeUUID:", v11, v12, v15, v16, 0, v14);
        }

        v6 = self;
        goto LABEL_14;
      }
      __atxlog_handle_notification_management();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[ATXUserNotificationLoggingEvent initWithProto:].cold.1();

    }
    else
    {
      __atxlog_handle_notification_management();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXUserNotificationLoggingEvent initWithProto:].cold.1();
    }
    v6 = 0;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_15:

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[ATXUserNotification proto](self->_notification, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNotification:", v4);

  objc_msgSend(v3, "setEventType:", LODWORD(self->_eventType));
  objc_msgSend(v3, "setTimestamp:", self->_timestamp);
  -[NSUUID UUIDString](self->_modeUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModeIdentifier:", v5);

  objc_msgSend(v3, "setDeliveryReason:", LODWORD(self->_deliveryReason));
  objc_msgSend(v3, "setDeliveryUI:", LODWORD(self->_deliveryUI));
  return v3;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
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
  -[ATXUserNotificationLoggingEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotificationLoggingEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotificationLoggingEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotificationLoggingEvent initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXUserNotification)notification
{
  return self->_notification;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSUUID)modeUUID
{
  return self->_modeUUID;
}

- (unint64_t)deliveryReason
{
  return self->_deliveryReason;
}

- (unint64_t)deliveryUI
{
  return self->_deliveryUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
