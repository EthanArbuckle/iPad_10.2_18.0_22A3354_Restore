@implementation BMDoNotDisturbWhileDrivingEvent

- (BMDoNotDisturbWhileDrivingEvent)initWithReason:(unint64_t)a3 isStart:(BOOL)a4
{
  BMDoNotDisturbWhileDrivingEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMDoNotDisturbWhileDrivingEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_reason = a3;
    result->_isStart = a4;
  }
  return result;
}

- (NSString)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_isStart)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("DNDwD event with reason: %ld is start: %@"), self->_reason, v4);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_reason);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("isStart");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMDoNotDisturbWhileDrivingEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDeviceMetadataEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMDoNotDisturbWhileDrivingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMDoNotDisturbWhileDrivingEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BMDoNotDisturbWhileDrivingEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject reason](v5, "reason");
      v7 = v6;
      if (v6 >= 7)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMDoNotDisturbWhileDrivingEvent initWithProto:].cold.1(v7);

        v8 = 0;
      }
      else
      {
        v8 = v6;
      }
      self = -[BMDoNotDisturbWhileDrivingEvent initWithReason:isStart:](self, "initWithReason:isStart:", v8, -[NSObject isStart](v5, "isStart"));
      v9 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMDoNotDisturbWhileDrivingEvent initWithProto:].cold.2((uint64_t)self, v5);
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMDoNotDisturbWhileDrivingEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBDoNotDisturbWhileDrivingEvent *v5;
  BMDoNotDisturbWhileDrivingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBDoNotDisturbWhileDrivingEvent initWithData:]([BMPBDoNotDisturbWhileDrivingEvent alloc], "initWithData:", v4);

    self = -[BMDoNotDisturbWhileDrivingEvent initWithProto:](self, "initWithProto:", v5);
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
  unint64_t reason;
  id v5;
  NSObject *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsStart:", self->_isStart);
  reason = self->_reason;
  if (reason >= 7)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDoNotDisturbWhileDrivingEvent proto].cold.1(reason);

    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "setReason:", reason);
    v5 = v3;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t reason;
  int isStart;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    reason = self->_reason;
    if (reason == objc_msgSend(v5, "reason"))
    {
      isStart = self->_isStart;
      v8 = isStart == objc_msgSend(v5, "isStart");
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

- (unint64_t)reason
{
  return self->_reason;
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMDoNotDisturbWhileDrivingEvent: unable to convert BMPBDoNotDisturbWhileDrivingReason enum value: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBDoNotDisturbWhileDrivingEvent proto", (uint8_t *)&v5, 0xCu);

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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMDoNotDisturbWhileDrivingEvent: unable to convert BMDoNotDisturbWhileDrivingReason enum value: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_0();
}

@end
