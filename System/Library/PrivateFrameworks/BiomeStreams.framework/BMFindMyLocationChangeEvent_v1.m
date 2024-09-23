@implementation BMFindMyLocationChangeEvent_v1

- (BMFindMyLocationChangeEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMFindMyLocationChangeEvent_v1 *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject idsHandle](v5, "idsHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSObject locationChangeType](v5, "locationChangeType");
      v8 = v7;
      if (v7 >= 4)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMFindMyLocationChangeEvent_v1 initWithProto:].cold.1(v8);

        v9 = 3;
      }
      else
      {
        v9 = qword_18DC0B268[(int)v7];
      }
      v12 = activityTypeWithState(-[NSObject activityState](v5, "activityState"));
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject latitude](v5, "latitude");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject longitude](v5, "longitude");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject name](v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[BMFindMyLocationChangeEvent initWithIDSHandle:locationChangeType:motionActivityState:latitude:longitude:name:](self, "initWithIDSHandle:locationChangeType:motionActivityState:latitude:longitude:name:", v6, v9, v12, v14, v16, v17);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMFindMyLocationChangeEvent initWithProto:].cold.2();
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMFindMyLocationChangeEvent: unable to convert BMPBFindMyLocationChangeType v1 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
