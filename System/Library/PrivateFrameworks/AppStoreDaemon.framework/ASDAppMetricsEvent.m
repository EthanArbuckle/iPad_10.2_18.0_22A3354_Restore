@implementation ASDAppMetricsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAppMetricsEvent)initWithCoder:(id)a3
{
  id v4;
  ASDAppMetricsEvent *v5;
  uint64_t v6;
  NSNumber *eventTime;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *payload;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDAppMetricsEvent;
  v5 = -[ASDAppMetricsEvent init](&v17, sel_init);
  if (v5)
  {
    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eventType"));
    v5->_eventSubtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eventSubtype"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventTime = v5->_eventTime;
    v5->_eventTime = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_payload"));
    v14 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v14;

    v5->_posted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_posted"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType;
  id v5;

  eventType = self->_eventType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", eventType, CFSTR("_eventType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventSubtype, CFSTR("_eventSubtype"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventTime, CFSTR("_eventTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("_payload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_posted, CFSTR("_posted"));

}

- (int64_t)eventSubtype
{
  return self->_eventSubtype;
}

- (void)setEventSubtype:(int64_t)a3
{
  self->_eventSubtype = a3;
}

- (NSNumber)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)isPosted
{
  return self->_posted;
}

- (void)setPosted:(BOOL)a3
{
  self->_posted = a3;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
}

@end
