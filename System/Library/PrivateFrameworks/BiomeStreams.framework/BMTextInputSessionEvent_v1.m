@implementation BMTextInputSessionEvent_v1

- (BMTextInputSessionEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BMTextInputSessionEvent_v1 *v14;
  NSObject *v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x1E0CB3588]);
      v7 = (void *)MEMORY[0x1E0C99D68];
      -[NSObject timestamp](v5, "timestamp");
      objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject duration](v5, "duration");
      v9 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v8);
      -[NSObject bundleID](v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject sessionType](v5, "sessionType");
      v12 = v11;
      if (v11 >= 5)
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[BMTextInputSessionEvent_v1 initWithProto:].cold.1(v12);

        v13 = 4;
      }
      else
      {
        v13 = qword_18DC0B2E8[(int)v11];
      }
      self = -[BMTextInputSessionEvent initWithDateInterval:bundleID:sessionType:](self, "initWithDateInterval:bundleID:sessionType:", v9, v10, v13);

      v14 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMTextInputSessionEvent initWithProto:].cold.2();
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMTextInputSessionEvent: unable to convert BMPBTextInputSessionType v1 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
