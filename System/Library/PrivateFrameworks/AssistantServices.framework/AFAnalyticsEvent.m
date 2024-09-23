@implementation AFAnalyticsEvent

- (AFAnalyticsEvent)init
{

  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contextDataType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSData hash](self->_contextData, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_deliveryStream);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v11 ^ -[NSString hash](self->_assistantId, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_speechId, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t type;
  unint64_t timestamp;
  int64_t contextDataType;
  NSData *contextData;
  void *v10;
  unint64_t deliveryStream;
  NSString *assistantId;
  void *v13;
  NSString *speechId;
  void *v15;
  BOOL v16;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    type = self->_type;
    if (type == objc_msgSend(v5, "type")
      && (timestamp = self->_timestamp, timestamp == objc_msgSend(v5, "timestamp"))
      && (contextDataType = self->_contextDataType, contextDataType == objc_msgSend(v5, "contextDataType")))
    {
      contextData = self->_contextData;
      objc_msgSend(v5, "contextData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSData isEqualToData:](contextData, "isEqualToData:", v10)
        && (deliveryStream = self->_deliveryStream, deliveryStream == objc_msgSend(v5, "deliveryStream")))
      {
        assistantId = self->_assistantId;
        objc_msgSend(v5, "assistantId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](assistantId, "isEqualToString:", v13))
        {
          speechId = self->_speechId;
          objc_msgSend(v5, "speechId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[NSString isEqualToString:](speechId, "isEqualToString:", v15);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (AFAnalyticsEvent)initWithDeliveryStream:(unint64_t)a3 type:(int64_t)a4 timestamp:(unint64_t)a5 contextDataType:(int64_t)a6 contextData:(id)a7
{
  id v12;
  AFAnalyticsEvent *v13;
  AFAnalyticsEvent *v14;
  uint64_t v15;
  NSData *contextData;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)AFAnalyticsEvent;
  v13 = -[AFAnalyticsEvent init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_deliveryStream = a3;
    v13->_type = a4;
    v13->_timestamp = a5;
    v13->_contextDataType = a6;
    v15 = objc_msgSend(v12, "copy");
    contextData = v14->_contextData;
    v14->_contextData = (NSData *)v15;

  }
  return v14;
}

- (id)typeName
{
  void *v2;
  unint64_t deliveryStream;
  __CFString *v5;
  unsigned int v6;
  const __CFString *v7;
  objc_class *v8;

  deliveryStream = self->_deliveryStream;
  switch(deliveryStream)
  {
    case 2uLL:
      -[AFAnalyticsEvent contextDataAsProtobuf](self, "contextDataAsProtobuf");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = -[__CFString anyEventType](v5, "anyEventType") - 1;
      if (v6 > 0x64)
        v7 = CFSTR("UNKNOWN_EVENT");
      else
        v7 = off_1E3A35B28[v6];
LABEL_12:
      objc_msgSend(CFSTR("instrumentation."), "stringByAppendingString:", v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return v2;
    case 1uLL:
      v8 = (objc_class *)SIReflectionInferClassFromEventType();
      if (v8)
        NSStringFromClass(v8);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown.%ld"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      goto LABEL_12;
    case 0uLL:
      AFAnalyticsEventTypeGetName(self->_type);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

- (id)legacyTypeName
{
  unint64_t deliveryStream;
  const char *v3;

  deliveryStream = self->_deliveryStream;
  if (deliveryStream - 1 < 2)
  {
    -[AFAnalyticsEvent typeName](self, "typeName");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
    return (id)(id)a2;
  }
  if (!deliveryStream)
  {
    AFAnalyticsEventTypeGetLegacyName(self->_type);
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return (id)(id)a2;
}

- (id)contextDataAsDictionary
{
  int64_t contextDataType;
  NSData *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSData *contextData;
  void *v11;
  void *v12;

  contextDataType = self->_contextDataType;
  if (contextDataType == 4)
  {
    -[AFAnalyticsEvent contextDataAsProtobuf](self, "contextDataAsProtobuf");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "si_dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsSafeContextForJson(v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
  else
  {
    if (contextDataType == 2)
    {
      contextData = self->_contextData;
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", contextData, 0, &v11);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v11;
    }
    else
    {
      if (contextDataType != 1)
      {
        v8 = 0;
        goto LABEL_10;
      }
      v3 = self->_contextData;
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v12;
    }
    v8 = v5;
    if (v8)
    {

LABEL_10:
      v4 = 0;
    }
  }

  return v4;
}

- (id)contextDataAsProtobuf
{
  unint64_t deliveryStream;
  NSData **p_contextData;
  Class *v4;
  void *v5;

  if (self->_contextDataType != 4)
    goto LABEL_9;
  deliveryStream = self->_deliveryStream;
  if (deliveryStream == 2)
  {
    p_contextData = &self->_contextData;
    if (self->_contextData)
    {
      v4 = (Class *)0x1E0D9A3C8;
      goto LABEL_8;
    }
LABEL_9:
    v5 = 0;
    return v5;
  }
  if (deliveryStream != 1)
    goto LABEL_9;
  p_contextData = &self->_contextData;
  if (!self->_contextData)
    goto LABEL_9;
  v4 = (Class *)off_1E3A2A750;
LABEL_8:
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithData:", *p_contextData);
  return v5;
}

- (id)dateStamp
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = (double)self->_timestamp / 1000000000.0;
  +[AFAnalyticsEvent eventsReferenceTime](AFAnalyticsEvent, "eventsReferenceTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithTimeInterval:sinceDate:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  void *v5;
  id v6;

  type = self->_type;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", type, CFSTR("_type"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_deliveryStream, CFSTR("_deliveryStream"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_timestamp"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_contextDataType, CFSTR("_contextDataType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contextData, CFSTR("_contextData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_assistantId, CFSTR("_assistantId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_speechId, CFSTR("_speechId"));

}

- (AFAnalyticsEvent)initWithCoder:(id)a3
{
  id v4;
  AFAnalyticsEvent *v5;
  void *v6;
  uint64_t v7;
  NSData *contextData;
  uint64_t v9;
  NSString *assistantId;
  uint64_t v11;
  NSString *speechId;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFAnalyticsEvent;
  v5 = -[AFAnalyticsEvent init](&v14, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_deliveryStream = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_deliveryStream"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timestamp = objc_msgSend(v6, "unsignedLongLongValue");

    v5->_contextDataType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_contextDataType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contextData"));
    v7 = objc_claimAutoreleasedReturnValue();
    contextData = v5->_contextData;
    v5->_contextData = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_assistantId"));
    v9 = objc_claimAutoreleasedReturnValue();
    assistantId = v5->_assistantId;
    v5->_assistantId = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechId"));
    v11 = objc_claimAutoreleasedReturnValue();
    speechId = v5->_speechId;
    v5->_speechId = (NSString *)v11;

  }
  return v5;
}

- (unint64_t)deliveryStream
{
  return self->_deliveryStream;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)contextDataType
{
  return self->_contextDataType;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setAssistantId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
}

+ (id)eventsReferenceTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)_eventsReferenceTime;
  if (!_eventsReferenceTime)
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    if (AFSystemGetBootTimeInMicroseconds_onceToken != -1)
      dispatch_once(&AFSystemGetBootTimeInMicroseconds_onceToken, &__block_literal_global_332);
    objc_msgSend(v3, "dateWithTimeIntervalSince1970:", (double)(unint64_t)AFSystemGetBootTimeInMicroseconds_bootTime / 1000000.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_eventsReferenceTime;
    _eventsReferenceTime = v4;

    v2 = (void *)_eventsReferenceTime;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
