@implementation INSearchForMessagesIntentResponse

- (id)init
{
  return -[INSearchForMessagesIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INSearchForMessagesIntentResponse)initWithCode:(INSearchForMessagesIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  INSearchForMessagesIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INSearchForMessagesIntentResponseCode v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSUserActivity *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    INSearchForMessagesIntentResponseCodeGetName(code);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForMessagesIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = code;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchForMessagesIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSearchForMessagesIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INSearchForMessagesIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSearchForMessagesIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INSearchForMessagesIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSearchForMessagesIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSearchForMessagesIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INSearchForMessagesIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSearchForMessagesIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INSearchForMessagesIntentResponseCode v2;
  int64_t result;

  v2 = -[INSearchForMessagesIntentResponse code](self, "code");
  switch(v2)
  {
    case INSearchForMessagesIntentResponseCodeReady:
      result = 1;
      break;
    case INSearchForMessagesIntentResponseCodeInProgress:
      result = 3;
      break;
    case INSearchForMessagesIntentResponseCodeSuccess:
      result = 4;
      break;
    case INSearchForMessagesIntentResponseCodeFailure:
    case INSearchForMessagesIntentResponseCodeFailureMessageServiceNotAvailable:
    case INSearchForMessagesIntentResponseCodeFailureMessageTooManyResults:
    case INSearchForMessagesIntentResponseCodeFailureRequiringInAppAuthentication:
      result = 5;
      break;
    case INSearchForMessagesIntentResponseCodeFailureRequiringAppLaunch:
      result = 6;
      break;
    default:
      if (v2 == 1000)
        result = 5;
      else
        result = 0;
      break;
  }
  return result;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeFailureMessageServiceNotAvailable")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeFailureMessageTooManyResults")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeFailureScreenTimeRestrictionEnabled")))v5 = 1000;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForMessagesIntentResponseCodeFailureRequiringInAppAuthentication"));

  if (v6)
    return 8;
  else
    return v5;
}

- (NSArray)messages
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMessages(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setMessages:(NSArray *)messages
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = messages;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMessages(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMessages:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_redactedDictionaryRepresentation
{
  void *v2;
  void *v3;

  -[INSearchForMessagesIntentResponse _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", CFSTR("<redacted>"), CFSTR("messages"));
  return v3;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("code");
  INSearchForMessagesIntentResponseCodeGetName(-[INSearchForMessagesIntentResponse code](self, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("messages");
  v10[0] = v4;
  -[INSearchForMessagesIntentResponse messages](self, "messages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
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
      if ((a4 - 1) >= 4)
      {
        if (a5)
          result = 5;
        else
          result = 4;
      }
      else
      {
        result = qword_18C311728[a4 - 1];
      }
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
  int result;

  switch(a3)
  {
    case 1:
      result = 5;
      break;
    case 2:
      result = 2;
      break;
    case 3:
      result = 0;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      goto LABEL_2;
    default:
      if (a3 == 1000)
LABEL_2:
        result = 1;
      else
        result = 3;
      break;
  }
  return result;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  int v3;
  int v4;
  int v5;

  if (a3 == 1000)
    v3 = 3;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 8)
    v4 = 4;
  else
    v4 = v3;
  if (a3 == 7)
    v5 = 2;
  else
    v5 = 0x7FFFFFFF;
  if (a3 == 6)
    v5 = 1;
  if (a3 <= 7)
    return v5;
  else
    return v4;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
