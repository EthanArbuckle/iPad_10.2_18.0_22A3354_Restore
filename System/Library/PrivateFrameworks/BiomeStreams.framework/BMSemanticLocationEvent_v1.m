@implementation BMSemanticLocationEvent_v1

- (BMSemanticLocationEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMSemanticLocationEvent_v1 *v10;
  NSObject *v11;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = typeFromBMPBSemanticLocationUserSpecificPlaceType(-[NSObject userSpecificPlaceType](v5, "userSpecificPlaceType"));
      v7 = -[NSObject placeType](v5, "placeType");
      v8 = v7;
      if (v7 >= 4)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMSemanticLocationEvent_v1 initWithProto:].cold.1(v8);

        v9 = 0;
      }
      else
      {
        v9 = v7;
      }
      self = -[BMSemanticLocationEvent initWithUserSpecificPlaceType:placeType:starting:](self, "initWithUserSpecificPlaceType:placeType:starting:", v6, v9, -[NSObject starting](v5, "starting"));
      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSemanticLocationEvent initWithProto:].cold.2();
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSemanticLocationEvent: unable to convert BMPBSemanticLocationPlaceType v1 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
