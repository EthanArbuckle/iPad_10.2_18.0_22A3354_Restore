@implementation BMSleepModeEvent_v3

- (BMSleepModeEvent_v3)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BMSleepModeEvent_v3 *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  BMSleepModeEvent_v3 *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject sleepModeState](v5, "sleepModeState");
      v7 = v6;
      if (v6 >= 4)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMSleepModeEvent_v3 initWithProto:].cold.1(v7);

        v8 = 3;
      }
      else
      {
        v8 = qword_18DC0BAD0[(int)v6];
      }
      v11 = BMSleepModeChangeReasonFromReason(-[NSObject sleepModeChangeReason](v5, "sleepModeChangeReason"));
      v12 = -[NSObject hasExpectedEndDate](v5, "hasExpectedEndDate");
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0C99D68];
        -[NSObject expectedEndDate](v5, "expectedEndDate");
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      v17.receiver = self;
      v17.super_class = (Class)BMSleepModeEvent_v3;
      v15 = -[BMSleepModeEvent initWithSleepModeState:sleepModeChangeReason:expectedEndDate:](&v17, sel_initWithSleepModeState_sleepModeChangeReason_expectedEndDate_, v8, v11, v14);
      if (v12)

      self = v15;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSleepModeEvent: unable to convert BMPBSleepModeState v3 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
