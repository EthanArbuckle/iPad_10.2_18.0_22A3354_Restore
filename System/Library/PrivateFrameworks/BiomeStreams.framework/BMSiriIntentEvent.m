@implementation BMSiriIntentEvent

- (BMSiriIntentEvent)initWithIntentId:(id)a3 eventType:(id)a4 eventData:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSiriIntentEvent *v12;
  BMSiriIntentEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMSiriIntentEvent;
  v12 = -[BMEventBase init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intentId, a3);
    objc_storeStrong((id *)&v13->_eventType, a4);
    objc_storeStrong((id *)&v13->_eventData, a5);
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SiriIntentEvent event with type: %@ and id: %@"), self->_eventType, self->_intentId);
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

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSiriIntentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriIntentEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BMSiriIntentEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BMSiriIntentEvent initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "intentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMSiriIntentEvent initWithIntentId:eventType:eventData:](self, "initWithIntentId:eventType:eventData:", v6, v7, v8);
  v9 = self;
LABEL_8:

  return v9;
}

- (BMSiriIntentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriIntentEvent *v5;
  BMSiriIntentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriIntentEvent initWithData:]([BMPBSiriIntentEvent alloc], "initWithData:", v4);

    self = -[BMSiriIntentEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v6;

  v3 = (void *)objc_opt_new();
  -[BMSiriIntentEvent intentId](self, "intentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIntentId:", v4);

  -[BMSiriIntentEvent eventType](self, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventType:", v5);

  -[BMSiriIntentEvent eventData](self, "eventData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventData:", v6);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_eventType, "hash");
  v4 = -[NSData hash](self->_eventData, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_intentId, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *eventType;
  void *v7;
  NSString *intentId;
  void *v9;
  NSData *eventData;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    eventType = self->_eventType;
    objc_msgSend(v5, "eventType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](eventType, "isEqualToString:", v7))
    {
      intentId = self->_intentId;
      objc_msgSend(v5, "intentId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](intentId, "isEqualToString:", v9))
      {
        eventData = self->_eventData;
        objc_msgSend(v5, "eventData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSData isEqualToData:](eventData, "isEqualToData:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)intentId
{
  return self->_intentId;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSchoolTimeDataVersion proto", (uint8_t *)&v5, 0xCu);

}

@end
