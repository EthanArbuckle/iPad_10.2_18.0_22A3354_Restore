@implementation INControlHomeIntentResponse

- (INControlHomeIntentResponse)init
{
  return -[INControlHomeIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INControlHomeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  INControlHomeIntentResponse *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 0x12)
      v9 = 0;
    else
      v9 = off_1E228AF18[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INControlHomeIntentResponse initWithCode:userActivity:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)INControlHomeIntentResponse;
  v11 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, a3, v6);

  return v11;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INControlHomeIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INControlHomeIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INControlHomeIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (int64_t)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INControlHomeIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INControlHomeIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INControlHomeIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INControlHomeIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t v2;

  v2 = -[INControlHomeIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 0x11)
    return 0;
  else
    return qword_18C311258[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeUserConfirmationRequired")))v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailure")))
    v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureRequiringAppLaunch")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailurePartialSuccess")))
    v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureNotFound")))
    v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureEmptyActionSet")))
    v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureNotReady")))
    v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureUnlockRequired")))
    v4 = 11;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureNotAllowed")))
    v4 = 12;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureAlreadyActive")))
    v4 = 13;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureNetworkFailure")))
    v4 = 14;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureIntentFailure")))
    v4 = 15;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureRemoteAccessNotSetUp")))v4 = 16;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureSecuredAccessDenied")))v5 = 17;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INControlHomeIntentResponseCodeFailureIncompleteSyncData"));

  if (v6)
    return 18;
  else
    return v5;
}

- (NSArray)entityResponses
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromHomeEntityResponses(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setEntityResponses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToHomeEntityResponses(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEntityResponses:", v6);
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
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("code");
  v3 = -[INControlHomeIntentResponse code](self, "code");
  v4 = v3;
  if (v3 < 0x13)
  {
    v5 = off_1E228AF18[v3];
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v11[1] = CFSTR("entityResponses");
  v12[0] = v5;
  -[INControlHomeIntentResponse entityResponses](self, "entityResponses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (v4 >= 0x13)
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result;
  uint64_t v6;
  int64_t v7;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 3;
      break;
    case 1:
      v6 = (a4 - 1);
      v7 = 5;
      if (a5)
        v7 = 6;
      if (v6 >= 0xC)
        result = v7;
      else
        result = v6 + 7;
      break;
    case 2:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    case 7:
      result = 4;
      break;
    default:
      return result;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x11)
    return 3;
  else
    return dword_18C311210[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) < 0xC)
    return a3 - 6;
  else
    return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

@end
