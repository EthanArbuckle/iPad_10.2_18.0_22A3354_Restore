@implementation HAENotificationEvent

- (HAENotificationEvent)initWithEventType:(unsigned int)a3 exposureLevel:(double)a4 dateInterval:(id)a5 metadata:(id)a6
{
  id v11;
  id v12;
  HAENotificationEvent *v13;
  HAENotificationEvent *v14;
  uint64_t v15;
  NSDictionary *metadata;
  uint64_t v17;
  NSUUID *uuid;
  objc_super v20;

  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HAENotificationEvent;
  v13 = -[HAENotificationEvent init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->level = a4;
    objc_storeStrong((id *)&v13->dateInterval, a5);
    v14->eventType = a3;
    v15 = objc_msgSend(v12, "copy");
    metadata = v14->metadata;
    v14->metadata = (NSDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    uuid = v14->uuid;
    v14->uuid = (NSUUID *)v17;

  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HAENotificationEvent level](self, "level");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("AudioExposureLevel"));
  -[HAENotificationEvent dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("DateInterval"));

  objc_msgSend(v6, "encodeInt32:forKey:", -[HAENotificationEvent eventType](self, "eventType"), CFSTR("EventType"));
  -[HAENotificationEvent metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("Metadata"));

  objc_msgSend(v6, "encodeObject:forKey:", self->uuid, CFSTR("UUID"));
}

- (HAENotificationEvent)initWithCoder:(id)a3
{
  id v4;
  HAENotificationEvent *v5;
  double v6;
  uint64_t v7;
  NSDateInterval *dateInterval;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *metadata;
  uint64_t v16;
  NSUUID *uuid;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAENotificationEvent;
  v5 = -[HAENotificationEvent init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("AudioExposureLevel"));
    v5->level = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateInterval"));
    v7 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->dateInterval;
    v5->dateInterval = (NSDateInterval *)v7;

    v5->eventType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("EventType"));
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Metadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    metadata = v5->metadata;
    v5->metadata = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v5->uuid;
    v5->uuid = (NSUUID *)v16;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[HAENotificationEvent eventType](self, "eventType");
  -[HAENotificationEvent level](self, "level");
  v8 = v7;
  -[HAENotificationEvent dateInterval](self, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[HAENotificationEvent metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  v13 = (void *)objc_msgSend(v5, "initWithEventType:exposureLevel:dateInterval:metadata:", v6, v10, v12, v8);

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HAENotificationEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAENotificationEvent getEventTypeString](self, "getEventTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAENotificationEvent level](self, "level");
  v7 = v6;
  -[HAENotificationEvent dateInterval](self, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAENotificationEvent metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HAENotificationEvent: uuid= %@, type= %@, exposure level= %.2f, date= %@, metadata= %@"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getEventTypeString
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[HAENotificationEvent eventType](self, "eventType");
  v3 = CFSTR("UnknownType");
  if (v2 == 2003133803)
    v3 = CFSTR("HAENotificationEventTypeWeeklyLimit");
  if (v2 == 1818850917)
    return CFSTR("HAENotificationEventTypeLoudLimt");
  else
    return (id)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)level
{
  return self->level;
}

- (NSDateInterval)dateInterval
{
  return self->dateInterval;
}

- (unsigned)eventType
{
  return self->eventType;
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->dateInterval, 0);
}

@end
