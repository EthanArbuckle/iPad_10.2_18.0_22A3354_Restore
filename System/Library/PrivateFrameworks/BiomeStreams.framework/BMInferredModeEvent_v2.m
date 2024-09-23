@implementation BMInferredModeEvent_v2

- (BMInferredModeEvent_v2)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  BMInferredModeEvent_v2 *v10;
  NSObject *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      v7 = v6;
      -[NSObject modeIdentifier](v5, "modeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject origin](v5, "origin") + 1;
      if (v8 >= 0x13)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMInferredModeEvent_v2 initWithProto:].cold.2();

        v9 = -1;
      }
      else
      {
        v9 = qword_18DC0B920[v8];
      }
      v28 = v9;
      -[NSObject originBundleId](v5, "originBundleId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject originAnchorType](v5, "originAnchorType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NSObject isAutomationEnabled](v5, "isAutomationEnabled");
      v26 = -[NSObject uiLocation](v5, "uiLocation");
      v13 = -[NSObject isStart](v5, "isStart");
      -[NSObject confidenceScore](v5, "confidenceScore");
      v15 = v14;
      -[NSObject uuid](v5, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject serializedTriggers](v5, "serializedTriggers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSObject shouldSuggestTriggers](v5, "shouldSuggestTriggers");
      v19 = -[NSObject modeType](v5, "modeType");
      if (v19 >= 0x12)
      {
        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[BMInferredModeEvent_v2 initWithProto:].cold.1();

        v20 = 1;
      }
      else
      {
        v20 = qword_18DC0B9B8[v19];
      }
      -[NSObject userModeName](v5, "userModeName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = v18;
      LOBYTE(v24) = v13;
      self = -[BMInferredModeEvent initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:](self, "initWithAbsoluteTimestamp:modeUUID:origin:originBundleId:originAnchorType:isAutomationEnabled:uiLocation:isStart:confidenceScore:suggestionUUID:serializedTriggers:shouldSuggestTriggers:modeType:userModeName:", v30, v28, v29, v12, v27, v26, v7, v15, v24, v16, v17, v25, v20, v22);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMInferredModeEvent initWithProto:].cold.3();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeType v2 enum value: %@", v3, v4, v5, v6, v7);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeOrigin v2 enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

@end
