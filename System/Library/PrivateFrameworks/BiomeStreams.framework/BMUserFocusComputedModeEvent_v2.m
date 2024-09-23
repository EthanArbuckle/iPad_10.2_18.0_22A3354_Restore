@implementation BMUserFocusComputedModeEvent_v2

- (BMUserFocusComputedModeEvent_v2)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t updated;
  uint64_t v10;
  uint64_t v11;
  BMUserFocusComputedModeEvent_v2 *v12;
  NSObject *v13;
  uint64_t v14;
  BMUserFocusComputedModeEvent_v2 *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject mode](v5, "mode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject semanticModeIdentifier](v5, "semanticModeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject starting](v5, "starting");
      updated = BMUserFocusComputedModeUpdateReasonFromReason(-[NSObject modeUpdateReason](v5, "modeUpdateReason"));
      v10 = -[NSObject modeSemanticType](v5, "modeSemanticType") - 1;
      if (v10 >= 0xA)
      {
        __biome_log_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[BMUserFocusComputedModeEvent_v2 initWithProto:].cold.1();

        v11 = 0;
      }
      else
      {
        v11 = v10 - 1;
      }
      v14 = BMUserFocusComputedModeUpdateSourceFromSource(-[NSObject modeUpdateSource](v5, "modeUpdateSource"));
      v17.receiver = self;
      v17.super_class = (Class)BMUserFocusComputedModeEvent_v2;
      v15 = -[BMUserFocusComputedModeEvent initWithMode:semanticModeIdentifier:starting:modeUpdateReason:modeSemanticType:modeUpdateSource:](&v17, sel_initWithMode_semanticModeIdentifier_starting_modeUpdateReason_modeSemanticType_modeUpdateSource_, v6, v7, v8, updated, v11, v14);

      self = v15;
      v12 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMUserFocusComputedModeEvent initWithProto:].cold.2();
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMUserFocusComputedModeEvent: unable to convert BMPBModeSemanticType v2 enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

@end
