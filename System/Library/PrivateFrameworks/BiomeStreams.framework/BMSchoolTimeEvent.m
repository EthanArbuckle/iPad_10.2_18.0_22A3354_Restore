@implementation BMSchoolTimeEvent

- (BMSchoolTimeEvent)initWithStarting:(BOOL)a3
{
  return -[BMSchoolTimeEvent initWithStarting:reason:](self, "initWithStarting:reason:", a3, 0);
}

- (BMSchoolTimeEvent)initWithStarting:(BOOL)a3 reason:(unint64_t)a4
{
  BMSchoolTimeEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMSchoolTimeEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_starting = a3;
    result->_reason = a4;
  }
  return result;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SchoolTimeEvent event with starting: %@"), v4);

  return (NSString *)v5;
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

  -[BMSchoolTimeEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSchoolTimeEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMSchoolTimeEvent *v10;
  NSObject *v11;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject starting](v5, "starting");
      v7 = -[NSObject reason](v5, "reason");
      v8 = v7;
      if (v7 >= 3)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMSchoolTimeEvent initWithProto:].cold.1(v8);

        v9 = 0;
      }
      else
      {
        v9 = v7;
      }
      self = -[BMSchoolTimeEvent initWithStarting:reason:](self, "initWithStarting:reason:", v6, v9);
      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSchoolTimeEvent initWithProto:].cold.2((uint64_t)self, v5);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMSchoolTimeEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSchoolTimeEvent *v5;
  BMSchoolTimeEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSchoolTimeEvent initWithData:]([BMPBSchoolTimeEvent alloc], "initWithData:", v4);

    self = -[BMSchoolTimeEvent initWithProto:](self, "initWithProto:", v5);
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
  id v5;
  NSObject *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setStarting:", -[BMSchoolTimeEvent isStarting](self, "isStarting"));
  v4 = -[BMSchoolTimeEvent reason](self, "reason");
  if (v4 >= 3)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMSchoolTimeEvent proto].cold.1(v4);

    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "setReason:", v4);
    v5 = v3;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_reason);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int starting;
  unint64_t reason;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    starting = self->_starting;
    if (starting == objc_msgSend(v5, "isStarting"))
    {
      reason = self->_reason;
      v8 = reason == objc_msgSend(v5, "reason");
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

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSchoolTimeEvent: unable to convert BMPBSchoolTimeReason enum value: %@", v4, v5, v6, v7, 2u);

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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSchoolTimeDataVersion proto", (uint8_t *)&v5, 0xCu);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSchoolTimeEvent: unable to convert BMSchoolTimeReason enum value: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_0();
}

@end
