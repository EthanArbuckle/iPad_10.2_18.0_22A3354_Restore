@implementation CARConnectionEvent

- (CARConnectionEvent)initWithEventName:(id)a3 type:(int64_t)a4 date:(id)a5 payload:(id)a6
{
  id v11;
  id v12;
  id v13;
  CARConnectionEvent *v14;
  CARConnectionEvent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionEvent;
  v14 = -[CARConnectionEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventName, a3);
    objc_storeStrong((id *)&v15->_eventDate, a5);
    objc_storeStrong((id *)&v15->_payload, a6);
    v15->_eventType = a4;
  }

  return v15;
}

+ (id)eventWithName:(id)a3 type:(int64_t)a4 date:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventName:type:date:payload:", v12, a4, v11, v10);

  return v13;
}

- (CARConnectionEvent)initWithDictionary:(id)a3
{
  id v4;
  CARConnectionEvent *v5;
  uint64_t v6;
  NSString *eventName;
  uint64_t v8;
  NSDate *eventDate;
  uint64_t v10;
  NSDictionary *payload;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUUID *identifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionEvent;
  v5 = -[CARConnectionEvent init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("event"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("payload"));
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v10;

    objc_msgSend(v4, "valueForKey:", CFSTR("eventType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventType = (int)objc_msgSend(v12, "intValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v14;

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARConnectionEvent eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("event"));

  -[CARConnectionEvent eventDate](self, "eventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("timestamp"));

  -[CARConnectionEvent identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));

  -[CARConnectionEvent payload](self, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("payload"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CARConnectionEvent eventType](self, "eventType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventType"));

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CARConnectionEvent eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("kCPEventNameKey"));

  -[CARConnectionEvent eventDate](self, "eventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kCPEventDateKey"));

  -[CARConnectionEvent payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("kCPEventDictionaryKey"));

  -[CARConnectionEvent identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kCPEventIdentifierKey"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[CARConnectionEvent eventType](self, "eventType"), CFSTR("kCPEventTypeKey"));
}

- (CARConnectionEvent)initWithCoder:(id)a3
{
  id v4;
  CARConnectionEvent *v5;
  uint64_t v6;
  NSString *eventName;
  uint64_t v8;
  NSDate *eventDate;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *payload;
  uint64_t v17;
  NSUUID *identifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARConnectionEvent;
  v5 = -[CARConnectionEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPEventNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPEventDateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kCPEventDictionaryKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v15;

    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPEventTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPEventIdentifierKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v17;

  }
  return v5;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
