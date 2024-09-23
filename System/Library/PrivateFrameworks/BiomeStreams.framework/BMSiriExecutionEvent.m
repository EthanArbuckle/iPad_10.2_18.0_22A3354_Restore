@implementation BMSiriExecutionEvent

- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7
{
  return -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", a3, a4, a5, a6, a7, 0.0, &stru_1E2672FA8);
}

- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleId:(id)a8 interactionId:(id)a9
{
  return -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", a3, a4, a5, a6, a7, a8, 0.0);
}

- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleId:(id)a8 interactionId:(id)a9 absoluteTimestamp:(double)a10
{
  id v18;
  id v19;
  BMSiriExecutionEvent *v20;
  BMSiriExecutionEvent *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v18 = a8;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMSiriExecutionEvent;
  v20 = -[BMEventBase init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_taskId, a3);
    v21->_taskStep = a4;
    objc_storeStrong((id *)&v21->_statusReason, a5);
    objc_storeStrong((id *)&v21->_slotValue, a6);
    objc_storeStrong((id *)&v21->_intentName, a7);
    objc_storeStrong((id *)&v21->_appBundleId, a8);
    objc_storeStrong((id *)&v21->_interactionId, a9);
    v21->_absoluteTimestamp = a10;
  }

  return v21;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 3)
    v4 = (objc_class *)BMSiriExecutionEvent_v3;
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

  -[BMSiriExecutionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriExecutionEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMSiriExecutionEvent *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject taskId](v5, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSObject taskStep](v5, "taskStep");
      v8 = v7;
      if (v7 >= 0x5E)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMSiriExecutionEvent initWithProto:].cold.1(v8);

        v9 = 94;
      }
      else
      {
        v9 = v7;
      }
      -[NSObject statusReason](v5, "statusReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject slotValue](v5, "slotValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject intentName](v5, "intentName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject appBundleId](v5, "appBundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject interactionId](v5, "interactionId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      self = -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", v6, v9, v12, v13, v14, v15, v16);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMSiriExecutionEvent initWithProto:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMSiriExecutionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriExecutionEvent *v5;
  BMSiriExecutionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriExecutionEvent initWithData:]([BMPBSiriExecutionEvent alloc], "initWithData:", v4);

    self = -[BMSiriExecutionEvent initWithProto:](self, "initWithProto:", v5);
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
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;

  v3 = (void *)objc_opt_new();
  -[BMSiriExecutionEvent taskId](self, "taskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskId:", v4);

  v5 = -[BMSiriExecutionEvent taskStep](self, "taskStep");
  if (v5 >= 0x5E)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMSiriExecutionEvent proto].cold.1(v5);

    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "setTaskStep:", v5);
    -[BMSiriExecutionEvent statusReason](self, "statusReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStatusReason:", v6);

    -[BMSiriExecutionEvent slotValue](self, "slotValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSlotValue:", v7);

    -[BMSiriExecutionEvent intentName](self, "intentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIntentName:", v8);

    -[BMSiriExecutionEvent appBundleId](self, "appBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppBundleId:", v9);

    -[BMSiriExecutionEvent interactionId](self, "interactionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionId:", v10);

    -[BMSiriExecutionEvent absoluteTimestamp](self, "absoluteTimestamp");
    objc_msgSend(v3, "setAbsoluteTimestamp:");
    v11 = v3;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;

  -[BMSiriExecutionEvent taskId](self, "taskId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMSiriExecutionEvent taskStep](self, "taskStep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[BMSiriExecutionEvent statusReason](self, "statusReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ objc_msgSend(v7, "hash");
  -[BMSiriExecutionEvent slotValue](self, "slotValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[BMSiriExecutionEvent intentName](self, "intentName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[BMSiriExecutionEvent appBundleId](self, "appBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[BMSiriExecutionEvent interactionId](self, "interactionId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriExecutionEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *taskId;
  void *v7;
  unint64_t taskStep;
  NSString *statusReason;
  void *v10;
  NSString *slotValue;
  void *v12;
  NSString *intentName;
  void *v14;
  NSString *appBundleId;
  void *v16;
  NSString *interactionId;
  void *v18;
  double absoluteTimestamp;
  double v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    taskId = self->_taskId;
    objc_msgSend(v5, "taskId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](taskId, "isEqual:", v7)
      && (taskStep = self->_taskStep, taskStep == objc_msgSend(v5, "taskStep")))
    {
      statusReason = self->_statusReason;
      objc_msgSend(v5, "statusReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](statusReason, "isEqual:", v10))
      {
        slotValue = self->_slotValue;
        objc_msgSend(v5, "slotValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqual:](slotValue, "isEqual:", v12))
        {
          intentName = self->_intentName;
          objc_msgSend(v5, "intentName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqual:](intentName, "isEqual:", v14))
          {
            appBundleId = self->_appBundleId;
            objc_msgSend(v5, "appBundleId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqual:](appBundleId, "isEqual:", v16))
            {
              interactionId = self->_interactionId;
              objc_msgSend(v5, "interactionId");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSString isEqual:](interactionId, "isEqual:", v18))
              {
                absoluteTimestamp = self->_absoluteTimestamp;
                objc_msgSend(v5, "absoluteTimestamp");
                v21 = absoluteTimestamp == v20;
              }
              else
              {
                v21 = 0;
              }

            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)taskId
{
  return self->_taskId;
}

- (unint64_t)taskStep
{
  return self->_taskStep;
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (NSString)slotValue
{
  return self->_slotValue;
}

- (NSString)intentName
{
  return self->_intentName;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_slotValue, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSiriExecutionEvent: unable to convert BMPBTaskStepType enum value: %@", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBSiriExecutionEvent proto", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSiriExecutionEvent: unable to convert BMSiriExecutionTaskStepType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
