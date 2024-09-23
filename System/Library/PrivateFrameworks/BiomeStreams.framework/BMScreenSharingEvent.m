@implementation BMScreenSharingEvent

- (BMScreenSharingEvent)initWithIsStart:(BOOL)a3
{
  return -[BMScreenSharingEvent initWithIsStart:type:](self, "initWithIsStart:type:", a3, 0);
}

- (BMScreenSharingEvent)initWithIsStart:(BOOL)a3 type:(unint64_t)a4
{
  BMScreenSharingEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMScreenSharingEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_isStart = a3;
    result->_type = a4;
  }
  return result;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Screen Sharing event isStart: %@ type: %@"), v4, v5);

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 2)
    v4 = (objc_class *)BMScreenSharingEvent_v2;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMScreenSharingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMScreenSharingEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  BMScreenSharingEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject isStart](v5, "isStart");
      v7 = -[NSObject type](v5, "type");
      v8 = v7;
      if (v7)
      {
        if (v7 == 1)
        {
          v8 = 1;
        }
        else
        {
          __biome_log_for_category();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[BMScreenSharingEvent initWithProto:].cold.1(v8);

          v8 = 0;
        }
      }
      self = -[BMScreenSharingEvent initWithIsStart:type:](self, "initWithIsStart:type:", v6, v8);
      v9 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMIntentEvent_v12 initWithProto:].cold.2();
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMScreenSharingEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBScreenSharingEvent *v5;
  BMScreenSharingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBScreenSharingEvent initWithData:]([BMPBScreenSharingEvent alloc], "initWithData:", v4);

    self = -[BMScreenSharingEvent initWithProto:](self, "initWithProto:", v5);
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
  unint64_t type;
  uint64_t v5;
  id v6;
  NSObject *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsStart:", self->_isStart);
  type = self->_type;
  if (!type)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (type == 1)
  {
    v5 = 1;
LABEL_5:
    objc_msgSend(v3, "setType:", v5);
    v6 = v3;
    goto LABEL_9;
  }
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[BMScreenSharingEvent proto].cold.1(type);

  v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int isStart;
  unint64_t type;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    isStart = self->_isStart;
    if (isStart == objc_msgSend(v5, "isStart"))
    {
      type = self->_type;
      v8 = type == objc_msgSend(v5, "type");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMScreenSharingEvent: unable to convert BMPBScreenSharingEventType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMScreenSharingEvent: unable to convert BMScreenSharingEventType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
