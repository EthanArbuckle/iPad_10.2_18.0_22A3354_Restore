@implementation BMSiriExecutionEvent_v3

- (BMSiriExecutionEvent_v3)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMSiriExecutionEvent_v3 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject taskId](v5, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSObject taskStep](v5, "taskStep");
      v8 = v7;
      if (v7 >= 0x5F)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMSiriExecutionEvent_v3 initWithProto:].cold.1(v8);

        v9 = 94;
      }
      else
      {
        v9 = qword_18DC0B358[(int)v7];
      }
      -[NSObject statusReason](v5, "statusReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject slotValue](v5, "slotValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intentName](v5, "intentName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject appBundleId](v5, "appBundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject interactionId](v5, "interactionId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      self = -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", v6, v9, v12, v13, v14, v15, v16);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSiriExecutionEvent initWithProto:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSiriExecutionEvent: unable to convert BMPBTaskStepType v3 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
