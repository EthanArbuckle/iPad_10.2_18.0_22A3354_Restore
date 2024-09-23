@implementation BMMindfulnessSessionEvent_v1

- (BMMindfulnessSessionEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BMMindfulnessSessionEvent_v1 *v9;
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
      if (v6 >= 4)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMMindfulnessSessionEvent_v1 initWithProto:].cold.1(v7);

        v8 = 3;
      }
      else
      {
        v8 = qword_18DC0B890[(int)v6];
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMMindfulnessSessionEvent: unable to convert BMPBMindfulnessSessionType v1 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
