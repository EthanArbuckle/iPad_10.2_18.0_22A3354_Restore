@implementation INSendMessageIntentResponse

- (id)init
{
  return -[INSendMessageIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INSendMessageIntentResponse)initWithCode:(INSendMessageIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  INSendMessageIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INSendMessageIntentResponseCode v16;
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
    INSendMessageIntentResponseCodeGetName(code);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSendMessageIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = code;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INSendMessageIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSendMessageIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INSendMessageIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSendMessageIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INSendMessageIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INSendMessageIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSendMessageIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INSendMessageIntentResponseCode v2;
  int64_t result;

  v2 = -[INSendMessageIntentResponse code](self, "code");
  switch(v2)
  {
    case INSendMessageIntentResponseCodeReady:
      result = 1;
      break;
    case INSendMessageIntentResponseCodeInProgress:
      result = 3;
      break;
    case INSendMessageIntentResponseCodeSuccess:
      result = 4;
      break;
    case INSendMessageIntentResponseCodeFailure:
    case INSendMessageIntentResponseCodeFailureMessageServiceNotAvailable:
    case INSendMessageIntentResponseCodeFailureRequiringInAppAuthentication:
LABEL_4:
      result = 5;
      break;
    case INSendMessageIntentResponseCodeFailureRequiringAppLaunch:
      result = 6;
      break;
    default:
      switch(v2)
      {
        case 1000:
        case 1001:
        case 1002:
        case 1003:
        case 1004:
        case 1005:
          goto LABEL_4;
        default:
          result = 0;
          break;
      }
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
  objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureMessageServiceNotAvailable")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureMessageAttachmentError")))v4 = 1000;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureMessageLocationNotAllowed")))v4 = 1001;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureScreenTimeRestrictionEnabled")))v4 = 1002;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureNotAMemberOfConversation")))v4 = 1003;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureMessageLocationAuthorizationNotDetermined")))v4 = 1004;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureMessagePreciseLocationNotAuthorized")))v5 = 1005;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSendMessageIntentResponseCodeFailureRequiringInAppAuthentication"));

  if (v6)
    return 7;
  else
    return v5;
}

- (NSArray)sentMessages
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMessages(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSentMessages:(NSArray *)sentMessages
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = sentMessages;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMessages(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSentMessages:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

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
  INSendMessageIntentResponseCodeGetName(-[INSendMessageIntentResponse code](self, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("sentMessages");
  v10[0] = v4;
  -[INSendMessageIntentResponse sentMessages](self, "sentMessages");
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
      if ((a4 - 1) >= 8)
      {
        if (a5)
          result = 5;
        else
          result = 4;
      }
      else
      {
        result = qword_18C311C60[a4 - 1];
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
      goto LABEL_5;
    default:
      if ((unint64_t)(a3 - 1000) < 6)
LABEL_5:
        result = 1;
      else
        result = 3;
      break;
  }
  return result;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  int result;
  int v4;

  switch(a3)
  {
    case 1000:
      result = 2;
      break;
    case 1001:
      result = 3;
      break;
    case 1002:
      result = 4;
      break;
    case 1003:
      result = 5;
      break;
    case 1004:
      result = 6;
      break;
    case 1005:
      result = 7;
      break;
    default:
      if (a3 == 6)
        v4 = 1;
      else
        v4 = 0x7FFFFFFF;
      if (a3 == 7)
        result = 8;
      else
        result = v4;
      break;
  }
  return result;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

- (INMessage)sentMessage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[INSendMessageIntentResponse sentMessages](self, "sentMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[INSendMessageIntentResponse sentMessages](self, "sentMessages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (INMessage *)v6;
}

- (void)setSentMessage:(INMessage *)sentMessage
{
  void *v4;
  INMessage *v5;
  void *v6;
  INMessage *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = sentMessage;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = sentMessage;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[INSendMessageIntentResponse setSentMessages:](self, "setSentMessages:", v6, v7, v8);
}

@end
