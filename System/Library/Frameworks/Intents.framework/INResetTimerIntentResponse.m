@implementation INResetTimerIntentResponse

- (INResetTimerIntentResponse)init
{
  return -[INResetTimerIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INResetTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  INResetTimerIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 7)
      v8 = 0;
    else
      v8 = (uint64_t)*(&off_1E2292A08 + a3);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INResetTimerIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INResetTimerIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, a3, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INResetTimerIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INResetTimerIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INResetTimerIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (int64_t)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INResetTimerIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INResetTimerIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INResetTimerIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INResetTimerIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t v2;

  v2 = -[INResetTimerIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 6)
    return 0;
  else
    return qword_18C312728[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeFailureNotFound")))
    v5 = 6;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INResetTimerIntentResponseCodeFailureNoTimers"));

  if (v6)
    return 7;
  else
    return v5;
}

- (NSArray)resetTimers
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTimers(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setResetTimers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTimers(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setResetTimers:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("code");
  v3 = -[INResetTimerIntentResponse code](self, "code");
  v4 = v3;
  if (v3 <= 7)
  {
    v5 = *(&off_1E2292A08 + v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("resetTimers");
  v11[0] = v5;
  -[INResetTimerIntentResponse resetTimers](self, "resetTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  if (v4 >= 8)
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result;
  int64_t v6;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 3;
      break;
    case 1:
      v6 = 4;
      if (a5)
        v6 = 5;
      if (a4 == 1)
        v6 = 7;
      if (a4)
        result = v6;
      else
        result = 6;
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
  if ((unint64_t)(a3 - 1) > 6)
    return 3;
  else
    return dword_18C312708[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  int v3;

  if (a3 == 7)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 6)
    return 0;
  else
    return v3;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
