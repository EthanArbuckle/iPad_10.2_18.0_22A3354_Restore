@implementation BMDeviceMetadataEvent_v1

- (BMDeviceMetadataEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BMDeviceMetadataEvent_v1 *v12;
  NSObject *v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject name](v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject build](v5, "build");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject supplementalBuild](v5, "supplementalBuild");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject platform](v5, "platform");
      v10 = v9;
      if (v9 >= 9)
      {
        __biome_log_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[BMDeviceMetadataEvent_v1 initWithProto:].cold.1(v10, v13);

        v11 = 0;
      }
      else
      {
        v11 = v9;
      }
      self = -[BMDeviceMetadataEvent initWithName:build:supplementalBuild:platform:rapidSecurityResponsePreReboot:](self, "initWithName:build:supplementalBuild:platform:rapidSecurityResponsePreReboot:", v6, v7, v8, v11, -[NSObject rapidSecurityResponsePreReboot](v5, "rapidSecurityResponsePreReboot"));

      v12 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMDeviceMetadataEvent initWithProto:].cold.1();
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMDeviceMetadataEvent: unable to convert BMDevicePlatform v1 enum value: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

@end
