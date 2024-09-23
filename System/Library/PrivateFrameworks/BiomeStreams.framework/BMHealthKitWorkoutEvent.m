@implementation BMHealthKitWorkoutEvent

- (BMHealthKitWorkoutEvent)initWithIsFirstPartyDonation:(BOOL)a3 isIndoor:(BOOL)a4 activityType:(id)a5 activityUUID:(id)a6 eventType:(unint64_t)a7
{
  return -[BMHealthKitWorkoutEvent initWithIsFirstPartyDonation:isIndoor:activityType:activityUUID:eventType:isUpdate:](self, "initWithIsFirstPartyDonation:isIndoor:activityType:activityUUID:eventType:isUpdate:", a3, a4, a5, a6, a7, 0);
}

- (BMHealthKitWorkoutEvent)initWithIsFirstPartyDonation:(BOOL)a3 isIndoor:(BOOL)a4 activityType:(id)a5 activityUUID:(id)a6 eventType:(unint64_t)a7 isUpdate:(BOOL)a8
{
  id v15;
  id v16;
  BMHealthKitWorkoutEvent *v17;
  BMHealthKitWorkoutEvent *v18;
  objc_super v20;

  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMHealthKitWorkoutEvent;
  v17 = -[BMEventBase init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_isFirstPartyDonation = a3;
    v17->_isIndoor = a4;
    objc_storeStrong((id *)&v17->_activityType, a5);
    objc_storeStrong((id *)&v18->_activityUUID, a6);
    v18->_eventType = a7;
    v18->_isUpdate = a8;
  }

  return v18;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  NSString *activityType;
  NSString *activityUUID;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFirstPartyDonation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIndoor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  activityType = self->_activityType;
  activityUUID = self->_activityUUID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUpdate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Workout event with isFirstPartyDonation: %@, isIndoor: %@, activityType: %@, activityUUID: %@, eventType: %@, isUpdate: %@"), v4, v5, activityType, activityUUID, v8, v9);

  return (NSString *)v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 1)
    v4 = (objc_class *)BMHealthKitWorkoutEvent_v1;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMHealthKitWorkoutEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMHealthKitWorkoutEvent)initWithProto:(id)a3
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
  BMHealthKitWorkoutEvent *v13;
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
      if (v10 >= 4)
      {
        __biome_log_for_category();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[BMHealthKitWorkoutEvent initWithProto:].cold.1(v11);

        v12 = 4;
      }
      else
      {
        v12 = v10;
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

- (BMHealthKitWorkoutEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBHealthKitWorkoutEvent *v5;
  BMHealthKitWorkoutEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBHealthKitWorkoutEvent initWithData:]([BMPBHealthKitWorkoutEvent alloc], "initWithData:", v4);

    self = -[BMHealthKitWorkoutEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  NSObject *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsFirstPartyDonation:", -[BMHealthKitWorkoutEvent isFirstPartyDonation](self, "isFirstPartyDonation"));
  objc_msgSend(v3, "setIsIndoor:", -[BMHealthKitWorkoutEvent isIndoor](self, "isIndoor"));
  -[BMHealthKitWorkoutEvent activityType](self, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivityType:", v4);

  -[BMHealthKitWorkoutEvent activityUUID](self, "activityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivityUUID:", v5);

  v6 = -[BMHealthKitWorkoutEvent eventType](self, "eventType");
  if (v6 >= 4)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMHealthKitWorkoutEvent proto].cold.1(v6);

    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "setEventType:", v6);
    objc_msgSend(v3, "setIsUpdate:", -[BMHealthKitWorkoutEvent isUpdate](self, "isUpdate"));
    v7 = v3;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int isFirstPartyDonation;
  int isIndoor;
  NSString *activityType;
  void *v9;
  NSString *activityUUID;
  void *v11;
  unint64_t eventType;
  int isUpdate;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    isFirstPartyDonation = self->_isFirstPartyDonation;
    if (isFirstPartyDonation == objc_msgSend(v5, "isFirstPartyDonation")
      && (isIndoor = self->_isIndoor, isIndoor == objc_msgSend(v5, "isIndoor")))
    {
      activityType = self->_activityType;
      objc_msgSend(v5, "activityType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](activityType, "isEqualToString:", v9))
      {
        activityUUID = self->_activityUUID;
        objc_msgSend(v5, "activityUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](activityUUID, "isEqualToString:", v11)
          && (eventType = self->_eventType, eventType == objc_msgSend(v5, "eventType")))
        {
          isUpdate = self->_isUpdate;
          v14 = isUpdate == objc_msgSend(v5, "isUpdate");
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isFirstPartyDonation
{
  return self->_isFirstPartyDonation;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMHealthKitWorkoutEvent: unable to convert BMPBHealthKitWorkoutEventType enum value: %@", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBWorkoutEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMHealthKitWorkoutEvent: unable to convert BMHealthKitWorkoutEventType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
