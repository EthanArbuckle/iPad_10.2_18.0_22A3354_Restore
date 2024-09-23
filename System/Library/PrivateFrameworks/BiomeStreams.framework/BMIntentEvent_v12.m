@implementation BMIntentEvent_v12

- (BMIntentEvent_v12)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  BMIntentEvent_v12 *v15;
  BMIntentEvent_v12 *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      v7 = v6;
      -[NSObject bundleID](v5, "bundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sourceId](v5, "sourceId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intentClass](v5, "intentClass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intentVerb](v5, "intentVerb");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = typeWithBMPBIntentType(-[NSObject intentType](v5, "intentType"));
      v8 = -[NSObject intentHandlingStatus](v5, "intentHandlingStatus") - 1;
      if (v8 >= 7)
      {
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BMIntentEvent_v12 initWithProto:].cold.1();

        v8 = 0;
      }
      -[NSObject interaction](v5, "interaction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject itemID](v5, "itemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject donatedBySiri](v5, "donatedBySiri");
      v13 = interactionDirectionWithPB(-[NSObject interactionDirection](v5, "interactionDirection"));
      -[NSObject groupIdentifier](v5, "groupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23.receiver = self;
      v23.super_class = (Class)BMIntentEvent_v12;
      v15 = -[BMIntentEvent initWithAbsoluteTime:bundleId:sourceId:intentClass:intentVerb:intentType:intentHandlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](&v23, sel_initWithAbsoluteTime_bundleId_sourceId_intentClass_intentVerb_intentType_intentHandlingStatus_interaction_itemID_donatedBySiri_interactionDirection_groupIdentifier_, v22, v21, v20, v19, v18, v8, v7, v10, v11, v12, v13, v14);

      self = v15;
      v16 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMIntentEvent_v12 initWithProto:].cold.2();
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMIntentEvent: unable to convert migrated BMIntentHandlingStatus enum value: %@", v3, v4, v5, v6, v7);

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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBScreenSharingEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
