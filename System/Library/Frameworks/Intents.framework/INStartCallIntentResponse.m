@implementation INStartCallIntentResponse

- (id)init
{
  return -[INStartCallIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INStartCallIntentResponse)initWithCode:(INStartCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  INStartCallIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INStartCallIntentResponseCode v16;
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
    INStartCallIntentResponseCodeGetName(code);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v14 = "-[INStartCallIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = code;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INStartCallIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INStartCallIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INStartCallIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INStartCallIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INStartCallIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartCallIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartCallIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INStartCallIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INStartCallIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t result;
  int64_t v3;

  result = -[INStartCallIntentResponse code](self, "code");
  switch(result)
  {
    case 1:
    case 2:
      return result;
    case 3:
      result = 8;
      break;
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      result = 5;
      break;
    case 5:
      result = 6;
      break;
    default:
      v3 = 5;
      if (result != 1001)
        v3 = 0;
      if (result == 1000)
        result = 5;
      else
        result = v3;
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
  objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeUserConfirmationRequired")))v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureCallingServiceNotAvailable")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureContactNotSupportedByApp")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureAirplaneModeEnabled")))v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureUnableToHandOff")))
    v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureAppConfigurationRequired")))v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureCallInProgress")))
    v4 = 11;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureCallRinging")))
    v4 = 12;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureScreenTimeRestrictionEnabled")))v4 = 1000;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureDownTimeRestrictionEnabled")))v5 = 1001;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntentResponseCodeFailureRequiringInAppAuthentication"));

  if (v6)
    return 13;
  else
    return v5;
}

- (NSNumber)shouldDoEmergencyCountdown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasShouldDoEmergencyCountdown"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "shouldDoEmergencyCountdown"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)confirmationReason
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int64_t v7;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasConfirmationReason");
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "confirmationReason");
  if (v4 && (v6 - 1) <= 3)
    v7 = qword_18C3123E0[v6 - 1];
  else
    v7 = 0;

  return v7;
}

- (INConnectedCall)startedCall
{
  void *v2;
  INConnectedCall *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedCall");
  v3 = (INConnectedCall *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromConnectedCall(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INConnectedCall *)v4;
}

- (NSArray)restrictedContacts
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restrictedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContactValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setShouldDoEmergencyCountdown:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setShouldDoEmergencyCountdown:", objc_msgSend(v7, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasShouldDoEmergencyCountdown:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setConfirmationReason:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a3 > 2)
  {
    if (a3 == 3)
    {
      v4 = 3;
      goto LABEL_11;
    }
    if (a3 == 1000)
    {
      v4 = 4;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 1)
    {
      v4 = 1;
      goto LABEL_11;
    }
    if (a3 == 2)
    {
      v4 = 2;
LABEL_11:
      -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setConfirmationReason:", v4);
      goto LABEL_12;
    }
  }
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasConfirmationReason:", 0);
LABEL_12:

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setStartedCall:(id)a3
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

  objc_msgSend(v5, "setStartedCall:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setRestrictedContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContactValues(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRestrictedContacts:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

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
  INStartCallIntentResponseCodeGetName(-[INStartCallIntentResponse code](self, "code"));
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
    case 1:
      if ((a4 - 1) >= 0xA)
      {
        if (a5)
          result = 5;
        else
          result = 4;
      }
      else
      {
        result = qword_18C3122A0[a4 - 1];
      }
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    case 7:
      result = 3;
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
      result = 4;
      break;
    case 3:
      result = 7;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      goto LABEL_2;
    default:
      if ((unint64_t)(a3 - 1000) < 2)
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
  int result;
  int v4;

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
      result = 6;
      break;
    case 12:
      result = 7;
      break;
    case 13:
      result = 10;
      break;
    default:
      if (a3 == 1001)
        v4 = 9;
      else
        v4 = 0x7FFFFFFF;
      if (a3 == 1000)
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

@end
