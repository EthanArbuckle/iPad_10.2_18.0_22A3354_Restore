@implementation BMSleepModeEvent

- (BMSleepModeEvent)initWithSleepModeState:(unint64_t)a3
{
  return -[BMSleepModeEvent initWithSleepModeState:sleepModeChangeReason:expectedEndDate:](self, "initWithSleepModeState:sleepModeChangeReason:expectedEndDate:", a3, 0, 0);
}

- (BMSleepModeEvent)initWithSleepModeState:(unint64_t)a3 sleepModeChangeReason:(unint64_t)a4 expectedEndDate:(id)a5
{
  id v9;
  BMSleepModeEvent *v10;
  BMSleepModeEvent *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMSleepModeEvent;
  v10 = -[BMEventBase init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_sleepModeState = a3;
    v10->_sleepModeChangeReason = a4;
    objc_storeStrong((id *)&v10->_expectedEndDate, a5);
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sleepModeState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sleepModeChangeReason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Sleep event with state: %@ stateChangeReason: %@ expectedEndDate: %@"), v4, v5, self->_expectedEndDate);

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 3)
    v4 = (objc_class *)BMSleepModeEvent_v3;
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

  -[BMSleepModeEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSleepModeEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BMSleepModeEvent *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject sleepModeState](v5, "sleepModeState");
      v7 = v6;
      if (v6 >= 3)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMSleepModeEvent initWithProto:].cold.1(v7);

        v8 = 3;
      }
      else
      {
        v8 = v6;
      }
      v11 = BMSleepModeChangeReasonFromReason(-[NSObject sleepModeChangeReason](v5, "sleepModeChangeReason"));
      if ((-[NSObject hasExpectedEndDate](v5, "hasExpectedEndDate") & 1) != 0)
      {
        v12 = (void *)MEMORY[0x1E0C99D68];
        -[NSObject expectedEndDate](v5, "expectedEndDate");
        objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMSleepModeEvent initWithSleepModeState:sleepModeChangeReason:expectedEndDate:](self, "initWithSleepModeState:sleepModeChangeReason:expectedEndDate:", v8, v11, v13);

      }
      else
      {
        self = -[BMSleepModeEvent initWithSleepModeState:sleepModeChangeReason:expectedEndDate:](self, "initWithSleepModeState:sleepModeChangeReason:expectedEndDate:", v8, v11, 0);
      }
      v9 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSleepModeEvent initWithProto:].cold.2();
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMSleepModeEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSleepModeEvent *v5;
  BMSleepModeEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSleepModeEvent initWithData:]([BMPBSleepModeEvent alloc], "initWithData:", v4);

    self = -[BMSleepModeEvent initWithProto:](self, "initWithProto:", v5);
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
  unint64_t sleepModeState;
  int v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t sleepModeChangeReason;
  uint64_t v9;
  NSDate *expectedEndDate;
  id v11;
  NSObject *v12;

  v3 = (void *)objc_opt_new();
  sleepModeState = self->_sleepModeState;
  switch(sleepModeState)
  {
    case 0uLL:
      v6 = 0;
LABEL_7:
      v5 = 1;
      break;
    case 2uLL:
      v6 = 2;
      goto LABEL_7;
    case 1uLL:
      v5 = 1;
      v6 = 1;
      break;
    default:
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BMSleepModeEvent proto].cold.2(sleepModeState);

      v5 = 0;
      v6 = 0xFFFFFFFFLL;
      break;
  }
  sleepModeChangeReason = self->_sleepModeChangeReason;
  if (sleepModeChangeReason >= 0xA)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMSleepModeEvent proto].cold.1(sleepModeChangeReason);

    goto LABEL_19;
  }
  if (!v5)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  v9 = dword_18DC0BAA8[sleepModeChangeReason];
  objc_msgSend(v3, "setSleepModeState:", v6);
  objc_msgSend(v3, "setSleepModeChangeReason:", v9);
  expectedEndDate = self->_expectedEndDate;
  if (expectedEndDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](expectedEndDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "setExpectedEndDate:");
  }
  v11 = v3;
LABEL_20:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t sleepModeState;
  void *sleepModeChangeReason;
  NSDate *expectedEndDate;
  NSDate *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    sleepModeState = self->_sleepModeState;
    if (sleepModeState == objc_msgSend(v5, "sleepModeState")
      && (sleepModeChangeReason = (void *)self->_sleepModeChangeReason,
          sleepModeChangeReason == (void *)objc_msgSend(v5, "sleepModeChangeReason")))
    {
      expectedEndDate = self->_expectedEndDate;
      v9 = expectedEndDate;
      if (!expectedEndDate)
      {
        objc_msgSend(v5, "expectedEndDate");
        sleepModeChangeReason = (void *)objc_claimAutoreleasedReturnValue();
        if (!sleepModeChangeReason)
        {
          v11 = 1;
LABEL_14:

          goto LABEL_11;
        }
        v9 = self->_expectedEndDate;
      }
      objc_msgSend(v5, "expectedEndDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSDate isEqualToDate:](v9, "isEqualToDate:", v10);

      if (!expectedEndDate)
        goto LABEL_14;
    }
    else
    {
      v11 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)sleepModeState
{
  return self->_sleepModeState;
}

- (unint64_t)sleepModeChangeReason
{
  return self->_sleepModeChangeReason;
}

- (NSDate)expectedEndDate
{
  return self->_expectedEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedEndDate, 0);
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSleepModeEvent: unable to convert BMPBSleepModeState enum value: %@", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBSleepModeEvent proto", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSleepModeEvent: unable to convert BMSleepModeState enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
