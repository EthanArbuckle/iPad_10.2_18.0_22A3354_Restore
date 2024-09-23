@implementation INAnswerCallIntentResponse

- (id)init
{
  return -[INAnswerCallIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INAnswerCallIntentResponse)initWithCode:(INAnswerCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INAnswerCallIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INAnswerCallIntentResponseCode v16;
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
    if ((unint64_t)code > INAnswerCallIntentResponseCodeFailureRequiringAppLaunch)
      v8 = 0;
    else
      v8 = off_1E22938D8[code];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INAnswerCallIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INAnswerCallIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INAnswerCallIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INAnswerCallIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INAnswerCallIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INAnswerCallIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INAnswerCallIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INAnswerCallIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INAnswerCallIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INAnswerCallIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t result;

  result = -[INAnswerCallIntentResponse code](self, "code");
  if ((unint64_t)(result - 1) >= 6)
    return 0;
  return result;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeInProgress")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeSuccess")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeFailure")))
    v5 = 5;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INAnswerCallIntentResponseCodeFailureRequiringAppLaunch"));

  if (v6)
    return 6;
  else
    return v5;
}

- (int64_t)statusCode
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasStatusCode");
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "statusCode");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (NSArray)callRecords
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCallRecordValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (INConnectedCall)answeredCall
{
  void *v2;
  INConnectedCall *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "answeredCall");
  v3 = (INConnectedCall *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromConnectedCall(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INConnectedCall *)v4;
}

- (void)setStatusCode:(int64_t)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 1)
    v4 = 1;
  else
    v4 = 0x7FFFFFFF;
  if (a3 == 2)
    v5 = 2;
  else
    v5 = v4;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5 == 0x7FFFFFFF)
    objc_msgSend(v6, "setHasStatusCode:", 0);
  else
    objc_msgSend(v6, "setStatusCode:", v5);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v8);

}

- (void)setCallRecords:(NSArray *)callRecords
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = callRecords;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCallRecordValues(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCallRecords:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setAnsweredCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToConnectedCall(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAnsweredCall:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  INAnswerCallIntentResponseCode v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("code");
  v3 = -[INAnswerCallIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 <= INAnswerCallIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E22938D8[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("callRecords");
  v11[0] = v5;
  -[INAnswerCallIntentResponse callRecords](self, "callRecords");
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

  if (v4 >= 7)
  return v8;
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
      result = 4;
      break;
    case 1:
      if (a5)
        result = 6;
      else
        result = 5;
      break;
    case 2:
      result = 3;
      break;
    case 4:
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
  if ((unint64_t)(a3 - 1) > 5)
    return 3;
  else
    return dword_18C312B2C[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

@end
