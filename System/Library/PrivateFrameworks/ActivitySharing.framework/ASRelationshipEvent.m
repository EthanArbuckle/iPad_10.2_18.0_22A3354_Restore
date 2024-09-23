@implementation ASRelationshipEvent

- (id)_codableRelationshipEvent
{
  ASCodableCloudKitRelationshipEvent *v3;
  void *v4;

  v3 = objc_alloc_init(ASCodableCloudKitRelationshipEvent);
  -[ASCodableCloudKitRelationshipEvent setAnchor:](v3, "setAnchor:", -[ASRelationshipEvent anchor](self, "anchor"));
  -[ASCodableCloudKitRelationshipEvent setType:](v3, "setType:", -[ASRelationshipEvent type](self, "type"));
  -[ASRelationshipEvent timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[ASCodableCloudKitRelationshipEvent setDate:](v3, "setDate:");

  return v3;
}

+ (id)_relationshipEventWithCodable:(id)a3
{
  id v3;
  unsigned __int16 v4;
  unsigned __int16 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  ASRelationshipEvent *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "anchor");
  v5 = objc_msgSend(v3, "type");
  v6 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v3, "date");
  v8 = v7;

  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASRelationshipEvent initWithType:anchor:timestamp:]([ASRelationshipEvent alloc], "initWithType:anchor:timestamp:", v5, v4, v9);

  return v10;
}

+ (id)relationshipEventWithRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  ASRelationshipEvent *v7;
  ASCodableCloudKitRelationshipEvent *v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  void *v11;

  v3 = a3;
  if (_ASCloudKitSchemaVersionForRecord(v3) == 2)
  {
    objc_msgSend(v3, "encryptedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      v8 = -[ASCodableCloudKitRelationshipEvent initWithData:]([ASCodableCloudKitRelationshipEvent alloc], "initWithData:", v6);
      v9 = -[ASCodableCloudKitRelationshipEvent anchor](v8, "anchor");
      v10 = -[ASCodableCloudKitRelationshipEvent type](v8, "type");
      objc_msgSend(v3, "creationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[ASRelationshipEvent initWithType:anchor:timestamp:]([ASRelationshipEvent alloc], "initWithType:anchor:timestamp:", v10, v9, v11);

    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASRelationshipEvent(CloudKitCoding) relationshipEventWithRecord:].cold.1();
      v7 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[ASRelationshipEvent(CloudKitCoding) relationshipEventWithRecord:].cold.2();
    v7 = 0;
  }

  return v7;
}

- (ASRelationshipEvent)initWithType:(unsigned __int16)a3 anchor:(unsigned __int16)a4 timestamp:(id)a5
{
  id v9;
  ASRelationshipEvent *v10;
  ASRelationshipEvent *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ASRelationshipEvent;
  v10 = -[ASRelationshipEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_anchor = a4;
    objc_storeStrong((id *)&v10->_timestamp, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ASRelationshipEvent *v4;
  BOOL v5;

  v4 = (ASRelationshipEvent *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ASRelationshipEvent isEqualToRelationshipEvent:](self, "isEqualToRelationshipEvent:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRelationshipEvent:(id)a3
{
  id v4;
  int anchor;
  int type;
  NSDate *timestamp;
  void *v8;
  BOOL v9;

  v4 = a3;
  anchor = self->_anchor;
  if (anchor == objc_msgSend(v4, "anchor")
    && (type = self->_type, type == objc_msgSend(v4, "type")))
  {
    timestamp = self->_timestamp;
    objc_msgSend(v4, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSDate isEqualToDate:](timestamp, "isEqualToDate:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t anchor;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  anchor = self->_anchor;
  NSStringFromASRelationshipEventType(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%d: %@ at %@]"), anchor, v5, self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)anchor
{
  return self->_anchor;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
