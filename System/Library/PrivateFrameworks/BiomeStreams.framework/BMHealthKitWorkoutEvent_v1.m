@implementation BMHealthKitWorkoutEvent_v1

- (BMHealthKitWorkoutEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BMHealthKitWorkoutEvent_v1 *v13;
  NSObject *v14;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject isFirstPartyDonation](v5, "isFirstPartyDonation");
      v7 = -[NSObject isIndoor](v5, "isIndoor");
      -[NSObject activityType](v5, "activityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject activityUUID](v5, "activityUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject eventType](v5, "eventType");
      v11 = v10;
      if (v10 >= 5)
      {
        __biome_log_for_category();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[BMHealthKitWorkoutEvent_v1 initWithProto:].cold.1(v11);

        v12 = 4;
      }
      else
      {
        v12 = qword_18DC0B8B8[(int)v10];
      }
      self = -[BMHealthKitWorkoutEvent initWithIsFirstPartyDonation:isIndoor:activityType:activityUUID:eventType:isUpdate:](self, "initWithIsFirstPartyDonation:isIndoor:activityType:activityUUID:eventType:isUpdate:", v6, v7, v8, v9, v12, -[NSObject isUpdate](v5, "isUpdate"));

      v13 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMHealthKitWorkoutEvent initWithProto:].cold.2();
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMHealthKitWorkoutEvent: unable to convert BMPBHealthKitWorkoutEventType v1 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
