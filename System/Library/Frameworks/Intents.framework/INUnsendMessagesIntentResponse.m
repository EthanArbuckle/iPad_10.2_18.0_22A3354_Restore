@implementation INUnsendMessagesIntentResponse

- (id)init
{
  return -[INUnsendMessagesIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INUnsendMessagesIntentResponse)initWithCode:(INUnsendMessagesIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  INUnsendMessagesIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INUnsendMessagesIntentResponseCode v16;
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
    INUnsendMessagesIntentResponseCodeGetName(code);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v14 = "-[INUnsendMessagesIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = code;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INUnsendMessagesIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INUnsendMessagesIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INUnsendMessagesIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUnsendMessagesIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INUnsendMessagesIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INUnsendMessagesIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INUnsendMessagesIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INUnsendMessagesIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUnsendMessagesIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INUnsendMessagesIntentResponseCode v2;
  int64_t result;
  int64_t v4;
  uint64_t v5;

  v2 = -[INUnsendMessagesIntentResponse code](self, "code");
  if (v2 > 999)
  {
    v4 = 5;
    v5 = 5;
    if (v2 != 1002)
      v5 = 0;
    if (v2 != 1001)
      v4 = v5;
    if (v2 == 1000)
      return 5;
    else
      return v4;
  }
  else
  {
    switch(v2)
    {
      case INUnsendMessagesIntentResponseCodeReady:
        result = 1;
        break;
      case INUnsendMessagesIntentResponseCodeInProgress:
        result = 3;
        break;
      case INUnsendMessagesIntentResponseCodeSuccess:
        result = 4;
        break;
      case INUnsendMessagesIntentResponseCodeFailure:
      case INUnsendMessagesIntentResponseCodeFailureMessageNotFound:
      case INUnsendMessagesIntentResponseCodeFailurePastUnsendTimeLimit:
      case INUnsendMessagesIntentResponseCodeFailureMessageTypeUnsupported:
      case INUnsendMessagesIntentResponseCodeFailureUnsupportedOnService:
      case INUnsendMessagesIntentResponseCodeFailureMessageServiceNotAvailable:
      case INUnsendMessagesIntentResponseCodeFailureRequiringInAppAuthentication:
        result = 5;
        break;
      case INUnsendMessagesIntentResponseCodeFailureRequiringAppLaunch:
        result = 6;
        break;
      default:
        result = 0;
        break;
    }
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
  objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureMessageNotFound")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailurePastUnsendTimeLimit")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureMessageTypeUnsupported")))v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureUnsupportedOnService")))v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureMessageServiceNotAvailable")))v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureNotAMemberOfConversation")))v4 = 1000;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureScreenTimeRestrictionEnabled")))v4 = 1001;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureDownTimeRestrictionEnabled")))v5 = 1002;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INUnsendMessagesIntentResponseCodeFailureRequiringInAppAuthentication"));

  if (v6)
    return 11;
  else
    return v5;
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("code");
  INUnsendMessagesIntentResponseCodeGetName(-[INUnsendMessagesIntentResponse code](self, "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
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
      if ((a4 - 1) >= 9)
      {
        if (a5)
          result = 5;
        else
          result = 4;
      }
      else
      {
        result = qword_18C312C50[a4 - 1];
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
    case 9:
    case 10:
    case 11:
      goto LABEL_4;
    default:
      if ((unint64_t)(a3 - 1000) >= 3)
        result = 3;
      else
LABEL_4:
        result = 1;
      break;
  }
  return result;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  int result;
  int v4;
  int v5;

  result = 0x7FFFFFFF;
  if (a3 > 999)
  {
    if (a3 == 1002)
      v4 = 8;
    else
      v4 = 0x7FFFFFFF;
    if (a3 == 1001)
      v5 = 7;
    else
      v5 = v4;
    if (a3 == 1000)
      return 6;
    else
      return v5;
  }
  else
  {
    switch(a3)
    {
      case 6:
        result = 1;
        break;
      case 7:
        result = 2;
        break;
      case 8:
        result = 3;
        break;
      case 9:
        result = 4;
        break;
      case 10:
        result = 5;
        break;
      case 11:
        result = 9;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
