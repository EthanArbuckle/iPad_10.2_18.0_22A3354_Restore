@implementation INAddTasksIntentResponse

- (id)init
{
  return -[INAddTasksIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INAddTasksIntentResponse)initWithCode:(INAddTasksIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INAddTasksIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INAddTasksIntentResponseCode v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  NSUserActivity *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INAddTasksIntentResponseCodeFailureRequiringAppLaunch)
      v8 = 0;
    else
      v8 = off_1E228A078[code];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INAddTasksIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = code;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INAddTasksIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INAddTasksIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INAddTasksIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INAddTasksIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INAddTasksIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INAddTasksIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INAddTasksIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INAddTasksIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INAddTasksIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INAddTasksIntentResponseCode v2;

  v2 = -[INAddTasksIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_18C312B58[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INAddTasksIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INAddTasksIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAddTasksIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAddTasksIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAddTasksIntentResponseCodeFailure")))
    v5 = 4;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INAddTasksIntentResponseCodeFailureRequiringAppLaunch"));

  if (v6)
    return 5;
  else
    return v5;
}

- (INTaskList)modifiedTaskList
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifiedTaskList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTaskList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTaskList *)v4;
}

- (NSArray)addedTasks
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addedTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTasks(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (unint64_t)warnings
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "warningsCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v7, "warningsAtIndex:", i))
      {
        case 1u:
          v5 |= 1uLL;
          break;
        case 2u:
          v5 |= 2uLL;
          break;
        case 3u:
          v5 |= 4uLL;
          break;
        case 4u:
          v5 |= 8uLL;
          break;
        default:
          break;
      }

    }
  }
  return v5;
}

- (void)setModifiedTaskList:(INTaskList *)modifiedTaskList
{
  INTaskList *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = modifiedTaskList;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTaskList(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setModifiedTaskList:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setAddedTasks:(NSArray *)addedTasks
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = addedTasks;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTasks(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAddedTasks:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setWarnings:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearWarnings");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__INAddTasksIntentResponse_setWarnings___block_invoke;
  v8[3] = &unk_1E2295130;
  v8[4] = self;
  INTaskWarningCodeOptionsEnumerateBackingTypes(a3, v8);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  INAddTasksIntentResponseCode v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("code");
  v3 = -[INAddTasksIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 <= INAddTasksIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E228A078[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v5;
  v12[1] = CFSTR("modifiedTaskList");
  -[INAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v7;
  v12[2] = CFSTR("addedTasks");
  -[INAddTasksIntentResponse addedTasks](self, "addedTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v6)
  if (v4 >= 6)

  return v10;
}

void __40__INAddTasksIntentResponse_setWarnings___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_responseMessagePBRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addWarnings:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 3;
      break;
    case 1:
      if (a5)
        result = 5;
      else
        result = 4;
      break;
    case 2:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 3;
  else
    return dword_18C312B44[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
