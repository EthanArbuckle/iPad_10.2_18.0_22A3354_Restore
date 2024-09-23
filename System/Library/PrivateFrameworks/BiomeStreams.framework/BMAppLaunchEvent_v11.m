@implementation BMAppLaunchEvent_v11

- (BMAppLaunchEvent_v11)initWithProto:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BMAppLaunchEvent_v11 *v20;
  unsigned int v22;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend(v5, "launchType");
      v7 = (v6 - 1);
      if (v7 >= 4)
      {
        v8 = v6;
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BMAppLaunchEvent_v11 initWithProto:].cold.1(v8);

        v7 = 0;
      }
      v22 = objc_msgSend(v5, "starting");
      objc_msgSend(v5, "bundleID");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v12 = v11;
      objc_msgSend(v5, "duration");
      v14 = v13;
      objc_msgSend(v5, "launchReason");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extensionHostID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortVersionString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exactVersionString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      self = -[BMAppLaunchEvent initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:](self, "initWithStarting:bundleID:absoluteTimeStamp:duration:launchReason:launchType:parentBundleID:extensionHostID:shortVersionString:exactBundleVersion:", v22, v10, v15, v7, v16, v17, v12, v14, v18, v19);
      v20 = self;
    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMAppLaunchEvent initWithProto:].cold.2();
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMAppLaunchEvent: unable to convert BMAppLaunchType v11 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
