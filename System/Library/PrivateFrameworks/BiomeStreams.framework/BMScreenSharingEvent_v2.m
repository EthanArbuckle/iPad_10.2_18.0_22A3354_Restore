@implementation BMScreenSharingEvent_v2

- (BMScreenSharingEvent_v2)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMScreenSharingEvent_v2 *v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMIntentEvent_v12 initWithProto:].cold.2();
      v10 = 0;
      goto LABEL_15;
    }
    v5 = v4;
    v6 = -[NSObject isStart](v5, "isStart");
    v7 = -[NSObject type](v5, "type");
    if ((_DWORD)v7 != 1)
    {
      v8 = v7;
      if ((_DWORD)v7 == 2)
      {
        v9 = 1;
LABEL_14:
        v13.receiver = self;
        v13.super_class = (Class)BMScreenSharingEvent_v2;
        self = -[BMScreenSharingEvent initWithIsStart:type:](&v13, sel_initWithIsStart_type_, v6, v9);
        v10 = self;
LABEL_15:

        goto LABEL_16;
      }
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[BMScreenSharingEvent_v2 initWithProto:].cold.1(v8);

    }
    v9 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_16:

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMScreenSharingEvent: unable to convert BMPBScreenSharingEventType v2 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
