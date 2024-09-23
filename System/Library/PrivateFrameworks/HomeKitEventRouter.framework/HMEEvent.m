@implementation HMEEvent

- (HMEEvent)initWithSubclassedEventMetadata:(id)a3
{
  id v4;
  HMEEvent *v5;
  id v7;

  v4 = a3;
  if (-[HMEEvent isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only be called by subclass"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v5 = -[HMEEvent _initWithEventData:metadata:](self, "_initWithEventData:metadata:", 0, v4);

  return v5;
}

- (HMEEvent)initWithEventData:(id)a3
{
  id v4;
  id v5;
  HMEEvent *v6;

  v4 = a3;
  v5 = -[HMEEventMetadata initDefaultMetadata]([HMEEventMetadata alloc], "initDefaultMetadata");
  v6 = -[HMEEvent _initWithEventData:metadata:](self, "_initWithEventData:metadata:", v4, v5);

  return v6;
}

- (id)_initWithEventData:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  HMEEvent *v8;
  HMEEvent *v9;
  uint64_t v10;
  NSData *eventData;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMEEvent;
  v8 = -[HMEEvent init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventMetadata, a4);
    v10 = objc_msgSend(v6, "copy");
    eventData = v9->_eventData;
    v9->_eventData = (NSData *)v10;

  }
  return v9;
}

- (NSData)encodedData
{
  void *v2;
  void *v3;

  -[HMEEvent eventData](self, "eventData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSData *)v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HMEEvent eventData](self, "eventData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMEEvent size = %@>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pbEvent
{
  HMEProtoEvent *v3;
  void *v4;
  HMEProtoEventMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = objc_alloc_init(HMEProtoEvent);
  -[HMEEvent encodedData](self, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEvent setEventData:](v3, "setEventData:", v4);

  v5 = objc_alloc_init(HMEProtoEventMetadata);
  -[HMEProtoEvent setEventMetadata:](v3, "setEventMetadata:", v5);

  -[HMEEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEvent eventMetadata](v3, "eventMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSource:", v7);

  -[HMEEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intervalSinceReferenceDate");
  v11 = v10;
  -[HMEProtoEvent eventMetadata](v3, "eventMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimestamp:", v11);

  -[HMEEvent eventMetadata](self, "eventMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rawCachePolicy");
  -[HMEProtoEvent eventMetadata](v3, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCachePolicy:", v14);

  -[HMEEvent eventMetadata](self, "eventMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "rawCombineType");
  -[HMEProtoEvent eventMetadata](v3, "eventMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCombinePolicy:", v17);

  -[HMEEvent eventMetadata](self, "eventMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "rawQOS");
  -[HMEProtoEvent eventMetadata](v3, "eventMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setQos:", v20);

  return v3;
}

- (HMEEventMetadata)eventMetadata
{
  return (HMEEventMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

+ (id)eventFromProtobuff:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  HMEEvent *v11;
  unsigned int v12;
  uint64_t v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  unsigned int v28;
  id v29;
  HMEEvent *v30;
  void *v31;

  v3 = a3;
  if (objc_msgSend(v3, "hasEventData"))
  {
    if (!objc_msgSend(v3, "hasEventMetadata"))
    {
      v12 = 0;
      v13 = 0;
      v14 = 0.0;
      v10 = CFSTR("Unknown");
LABEL_21:
      v29 = -[HMEEventMetadata _initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:]([HMEEventMetadata alloc], "_initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:", v10, v12, 2, v13, v14);
      v30 = [HMEEvent alloc];
      objc_msgSend(v3, "eventData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMEEvent initWithEventData:metadata:](v30, "initWithEventData:metadata:", v31, v29);

      goto LABEL_22;
    }
    objc_msgSend(v3, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "eventMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
      {
        v10 = CFSTR("Unknown");
        goto LABEL_11;
      }
      objc_msgSend(v3, "eventMetadata");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "source");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("Unknown");
    }

LABEL_11:
    objc_msgSend(v3, "eventMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasTimestamp");

    v14 = 0.0;
    if (v16)
    {
      objc_msgSend(v3, "eventMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timestamp");
      v14 = v18;

    }
    objc_msgSend(v3, "eventMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasCachePolicy");

    if (v20)
    {
      objc_msgSend(v3, "eventMetadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "cachePolicy");

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v3, "eventMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hasCombinePolicy");

    if (v23)
    {
      objc_msgSend(v3, "eventMetadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "combinePolicy");

    }
    objc_msgSend(v3, "eventMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hasQos");

    if (v26)
    {
      objc_msgSend(v3, "eventMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "qos");

      v13 = v28;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_21;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

@end
