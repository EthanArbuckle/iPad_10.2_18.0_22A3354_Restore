@implementation BMAlarmEvent

- (BMAlarmEvent)initWithEventType:(unint64_t)a3 alarmID:(id)a4 isSleepAlarm:(BOOL)a5
{
  return -[BMAlarmEvent initWithEventType:lastEventType:alarmID:isSleepAlarm:](self, "initWithEventType:lastEventType:alarmID:isSleepAlarm:", a3, 0, a4, a5);
}

- (BMAlarmEvent)initWithEventType:(unint64_t)a3 lastEventType:(unint64_t)a4 alarmID:(id)a5 isSleepAlarm:(BOOL)a6
{
  id v11;
  BMAlarmEvent *v12;
  BMAlarmEvent *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMAlarmEvent;
  v12 = -[BMEventBase init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_eventType = a3;
    v12->_lastEventType = a4;
    objc_storeStrong((id *)&v12->_alarmID, a5);
    v13->_isSleepAlarm = a6;
  }

  return v13;
}

- (NSString)description
{
  id v3;
  unint64_t eventType;
  _BOOL8 isSleepAlarm;
  NSUUID *alarmID;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  eventType = self->_eventType;
  isSleepAlarm = self->_isSleepAlarm;
  alarmID = self->_alarmID;
  v7 = BMPBLastAlarmEventTypeFromType(self->_lastEventType, 0);
  if (v7 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E2649750[(int)v7];
  }
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Alarm event with type: %ld is sleep alarm: %d alarm ID: %@ last event: %@"), eventType, isSleepAlarm, alarmID, v8);

  return (NSString *)v9;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 2)
    v4 = (objc_class *)BMAlarmEvent_v2;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("alarmID");
  -[NSUUID UUIDString](self->_alarmID, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("isSleepAlarm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSleepAlarm);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("lastEventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastEventType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMAlarmEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDeviceMetadataEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMAlarmEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMAlarmEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  BMAlarmEvent *v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSObject eventType](v5, "eventType");
      if (v6 >= 6)
      {
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BMAlarmEvent initWithProto:].cold.2();

        v7 = 1;
      }
      else
      {
        v7 = v6;
      }
      v10 = -[NSObject lastEventType](v5, "lastEventType");
      if (v10 >= 0xB)
      {
        __biome_log_for_category();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[BMAlarmEvent initWithProto:].cold.1();

        v11 = 0;
      }
      else
      {
        v11 = v10;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NSObject alarmID](v5, "alarmID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
      self = -[BMAlarmEvent initWithEventType:lastEventType:alarmID:isSleepAlarm:](self, "initWithEventType:lastEventType:alarmID:isSleepAlarm:", v7, v11, v15, -[NSObject isSleepAlarm](v5, "isSleepAlarm"));

      v8 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMAlarmEvent initWithProto:].cold.3();
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMAlarmEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBAlarmEvent *v5;
  BMAlarmEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBAlarmEvent initWithData:]([BMPBAlarmEvent alloc], "initWithData:", v4);

    self = -[BMAlarmEvent initWithProto:](self, "initWithProto:", v5);
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
  unint64_t eventType;
  NSObject *v5;
  id v6;
  void *v7;
  char v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsSleepAlarm:", self->_isSleepAlarm);
  v9 = 0;
  eventType = self->_eventType;
  if (eventType >= 6)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMAlarmEvent proto].cold.1(eventType);

    v9 = 1;
    eventType = 0xFFFFFFFFLL;
  }
  objc_msgSend(v3, "setEventType:", eventType);
  objc_msgSend(v3, "setLastEventType:", BMPBLastAlarmEventTypeFromType(self->_lastEventType, &v9));
  if (v9)
  {
    v6 = 0;
  }
  else
  {
    -[NSUUID UUIDString](self->_alarmID, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlarmID:", v7);

    v6 = v3;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  NSUUID *alarmID;
  NSUUID *v9;
  void *v10;
  char v11;
  BOOL v12;
  unint64_t eventType;
  unint64_t lastEventType;
  int isSleepAlarm;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_17;
  }
  v6 = v5;
  v7 = v6;
  alarmID = self->_alarmID;
  v9 = alarmID;
  if (alarmID)
  {
LABEL_5:
    objc_msgSend(v7, "alarmID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSUUID isEqual:](v9, "isEqual:", v10);

    if (alarmID)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v6, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = self->_alarmID;
    goto LABEL_5;
  }
  v11 = 1;
LABEL_9:

LABEL_10:
  eventType = self->_eventType;
  if (eventType == objc_msgSend(v7, "eventType")
    && (lastEventType = self->_lastEventType, lastEventType == objc_msgSend(v7, "lastEventType")))
  {
    isSleepAlarm = self->_isSleepAlarm;
    if (isSleepAlarm == objc_msgSend(v7, "isSleepAlarm"))
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }

LABEL_17:
  return v12;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)lastEventType
{
  return self->_lastEventType;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmID, 0);
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMAlarmEvent: unable to convert BMLastAlarmEventType enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMAlarmEvent: unable to convert BMPBAlarmEventType enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.3()
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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBAlarmEvent proto", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMAlarmEvent: unable to convert BMAlarmEventType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
