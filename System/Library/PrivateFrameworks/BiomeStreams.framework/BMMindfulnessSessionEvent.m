@implementation BMMindfulnessSessionEvent

- (BMMindfulnessSessionEvent)initWithSessionType:(unint64_t)a3 stateType:(unint64_t)a4
{
  BMMindfulnessSessionEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMMindfulnessSessionEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_sessionType = a3;
    result->_stateType = a4;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sessionType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_stateType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("MindfulnessSessionEvent event with sessionType: %@, stateType: %@"), v4, v5);

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 1)
    v4 = (objc_class *)BMMindfulnessSessionEvent_v1;
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

  -[BMMindfulnessSessionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMMindfulnessSessionEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BMMindfulnessSessionEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject sessionType](v5, "sessionType");
      v7 = v6;
      if (v6 >= 3)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMMindfulnessSessionEvent initWithProto:].cold.1(v7);

        v8 = 3;
      }
      else
      {
        v8 = v6;
      }
      self = -[BMMindfulnessSessionEvent initWithSessionType:stateType:](self, "initWithSessionType:stateType:", v8, typeWithBMPBMindfulnessSessionStateType(-[NSObject stateType](v5, "stateType")));
      v9 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMMindfulnessSessionEvent initWithProto:].cold.2();
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMMindfulnessSessionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBMindfulnessSessionEvent *v5;
  BMMindfulnessSessionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBMindfulnessSessionEvent initWithData:]([BMPBMindfulnessSessionEvent alloc], "initWithData:", v4);

    self = -[BMMindfulnessSessionEvent initWithProto:](self, "initWithProto:", v5);
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
  unint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  unint64_t v8;
  id v9;
  NSObject *v10;

  v3 = (void *)objc_opt_new();
  v4 = -[BMMindfulnessSessionEvent sessionType](self, "sessionType");
  v5 = v4;
  if (!v4 || v4 == 2 || v4 == 1)
  {
    v6 = 1;
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMMindfulnessSessionEvent proto].cold.2(v5);

    v6 = 0;
    v5 = 0xFFFFFFFFLL;
  }
  v8 = -[BMMindfulnessSessionEvent stateType](self, "stateType");
  if (v8 >= 5)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BMMindfulnessSessionEvent proto].cold.1(v8);

    goto LABEL_14;
  }
  if (!v6)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "setSessionType:", v5);
  objc_msgSend(v3, "setStateType:", v8);
  v9 = v3;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sessionType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_stateType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t sessionType;
  unint64_t stateType;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    sessionType = self->_sessionType;
    if (sessionType == objc_msgSend(v5, "sessionType"))
    {
      stateType = self->_stateType;
      v8 = stateType == objc_msgSend(v5, "stateType");
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

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (unint64_t)stateType
{
  return self->_stateType;
}

- (void)setStateType:(unint64_t)a3
{
  self->_stateType = a3;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMMindfulnessSessionEvent: unable to convert BMPBMindfulnessSessionType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBMindfulnessSessionEventDataVersion proto", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMMindfulnessSessionEvent: unable to convert BMMindfulnessSessionType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
