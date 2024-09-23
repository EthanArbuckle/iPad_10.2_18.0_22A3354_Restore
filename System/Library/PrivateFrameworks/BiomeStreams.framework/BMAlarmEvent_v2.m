@implementation BMAlarmEvent_v2

- (BMAlarmEvent_v2)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  BMAlarmEvent_v2 *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject eventType](v5, "eventType") - 1;
      if (v6 >= 6)
      {
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BMAlarmEvent_v2 initWithProto:].cold.2();

        v7 = 1;
      }
      else
      {
        v7 = qword_18DC0BC20[v6];
      }
      v10 = -[NSObject lastEventType](v5, "lastEventType") - 1;
      if (v10 >= 0xB)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMAlarmEvent_v2 initWithProto:].cold.1();

        v10 = 0;
      }
      v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NSObject alarmID](v5, "alarmID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);
      self = -[BMAlarmEvent initWithEventType:lastEventType:alarmID:isSleepAlarm:](self, "initWithEventType:lastEventType:alarmID:isSleepAlarm:", v7, v10, v14, -[NSObject isSleepAlarm](v5, "isSleepAlarm"));

      v8 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMAlarmEvent initWithProto:].cold.3();
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)initWithProto:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMAlarmEvent: unable to convert BMLastAlarmEventType v2 enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMAlarmEvent: unable to convert BMPBAlarmEventType v2 enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

@end
