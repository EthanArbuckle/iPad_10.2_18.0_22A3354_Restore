@implementation BMSiriPrivateLearningSELFEvent

- (BMSiriPrivateLearningSELFEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 eventData:(id)a5
{
  id v10;
  id v11;
  void *v12;
  BMSiriPrivateLearningSELFEvent *v13;
  BMSiriPrivateLearningSELFEvent *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSiriPrivateLearningSELFEvent.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSiriPrivateLearningSELFEvent.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventData"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BMSiriPrivateLearningSELFEvent;
  v13 = -[BMSiriPrivateLearningSELFEvent init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uniqueId, a3);
    v14->_absoluteTimestamp = a4;
    objc_storeStrong((id *)&v14->_eventData, a5);
  }

  return v14;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMSiriPrivateLearningSELFEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = self->_uniqueId;
  v7[0] = CFSTR("uniqueId");
  v7[1] = CFSTR("absoluteTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("eventData");
  -[NSData base64EncodedStringWithOptions:](self->_eventData, "base64EncodedStringWithOptions:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMSiriPrivateLearningSELFEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMSiriPrivateLearningSELFEvent json].cold.1((uint64_t)v5, v6);

  }
  return v4;
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
  -[BMSiriPrivateLearningSELFEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMSiriPrivateLearningSELFEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMSiriPrivateLearningSELFEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMSiriPrivateLearningSELFEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSiriPrivateLearningSELFEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriPrivateLearningSELFEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  BMSiriPrivateLearningSELFEvent *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && (-[NSObject hasEventData](v5, "hasEventData") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v8 = v7;
        -[NSObject eventData](v5, "eventData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMSiriPrivateLearningSELFEvent initWithUniqueId:absoluteTimestamp:eventData:](self, "initWithUniqueId:absoluteTimestamp:eventData:", v6, v9, v8);

        v10 = self;
LABEL_14:

        goto LABEL_15;
      }
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BMSiriPrivateLearningSELFEvent initWithProto:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSiriPrivateLearningSELFEvent initWithProto:].cold.2(v5, v11, v12, v13, v14, v15, v16, v17);
    }
    v10 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (BMSiriPrivateLearningSELFEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriPrivateLearningSELFEvent *v5;
  BMSiriPrivateLearningSELFEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriPrivateLearningSELFEvent initWithData:]([BMPBSiriPrivateLearningSELFEvent alloc], "initWithData:", v4);

    self = -[BMSiriPrivateLearningSELFEvent initWithProto:](self, "initWithProto:", v5);
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
  -[BMSiriPrivateLearningSELFEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMSiriPrivateLearningSELFEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMSiriPrivateLearningSELFEvent eventData](self, "eventData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventData:", v5);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_uniqueId, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  double absoluteTimestamp;
  double v8;
  NSString *uniqueId;
  void *v10;
  uint64_t v11;
  int v12;
  char v13;
  NSData *eventData;
  NSData *v15;
  void *v16;
  void *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v6, "absoluteTimestamp");
    if (absoluteTimestamp != v8)
    {
      v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
    uniqueId = self->_uniqueId;
    v10 = uniqueId;
    if (!uniqueId)
    {
      objc_msgSend(v6, "uniqueId");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v18 = 0;
        v12 = 0;
        goto LABEL_12;
      }
      v18 = (void *)v11;
      v10 = self->_uniqueId;
    }
    objc_msgSend(v6, "uniqueId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v3) & 1) == 0)
    {

      v13 = 0;
      goto LABEL_18;
    }
    v12 = 1;
LABEL_12:
    eventData = self->_eventData;
    v15 = eventData;
    if (!eventData)
    {
      objc_msgSend(v6, "eventData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v13 = 1;
        goto LABEL_23;
      }
      v15 = self->_eventData;
    }
    objc_msgSend(v6, "eventData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSData isEqualToData:](v15, "isEqualToData:", v16);

    if (eventData)
    {
      if (!v12)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_23:

    if ((v12 & 1) == 0)
    {
LABEL_18:
      if (!uniqueId)

      goto LABEL_20;
    }
LABEL_17:

    goto LABEL_18;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_uniqueId && self->_eventData)
  {
    v7 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSiriPrivateLearningSELFEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSiriPrivateLearningSELFEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMPSiriPrivateLearningSELFEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMSiriPrivateLearningSELFEvent: tried to initialize with a non-BMPSiriPrivateLearningSELFEvent proto", a5, a6, a7, a8, 0);
}

@end
