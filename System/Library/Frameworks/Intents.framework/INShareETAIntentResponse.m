@implementation INShareETAIntentResponse

- (INShareETAIntentResponse)init
{
  return -[INShareETAIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INShareETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  INShareETAIntentResponse *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 0xF)
      v9 = 0;
    else
      v9 = *(&off_1E22943B8 + a3);
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INShareETAIntentResponse initWithCode:userActivity:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)INShareETAIntentResponse;
  v11 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, a3, v6);

  return v11;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INShareETAIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INShareETAIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INShareETAIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (int64_t)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INShareETAIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INShareETAIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INShareETAIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INShareETAIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t v2;

  v2 = -[INShareETAIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 0xE)
    return 0;
  else
    return qword_18C3124B8[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureUnknownError")))
    v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureUnsupportedOs")))
    v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureUnsupportedOsVersion")))v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureShareEtaDisabled")))
    v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureShareEtaDisabledRemotely")))v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureNotNavigating")))
    v4 = 11;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureUnsupportedTransportationMode")))v4 = 12;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureIcloudSignedOff")))
    v4 = 13;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureiMessageDisabled")))
    v5 = 14;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INShareETAIntentResponseCodeFailureAlreadySharing"));

  if (v6)
    return 15;
  else
    return v5;
}

- (NSArray)recipients
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (unint64_t)mediums
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediumsCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v7, "mediumAtIndex:", i))
      {
        case 0u:
          v5 |= 1uLL;
          break;
        case 1u:
          v5 |= 2uLL;
          break;
        case 2u:
          v5 |= 4uLL;
          break;
        case 3u:
          v5 |= 8uLL;
          break;
        default:
          break;
      }

    }
  }
  return v5;
}

- (void)setRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRecipients:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setMediums:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearMediums");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__INShareETAIntentResponse_setMediums___block_invoke;
  v8[3] = &unk_1E2295130;
  v8[4] = self;
  INShareETAMediumOptionsEnumerateBackingTypes(a3, v8);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
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
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("code");
  v3 = -[INShareETAIntentResponse code](self, "code");
  v4 = v3;
  if (v3 < 0x10)
  {
    v5 = *(&off_1E22943B8 + v3);
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v14[0] = v5;
  v13[1] = CFSTR("recipients");
  -[INShareETAIntentResponse recipients](self, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("mediums");
  INShareETAMediumOptionsGetNames(-[INShareETAIntentResponse mediums](self, "mediums"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v7)
  if (v4 >= 0x10)

  return v11;
}

void __39__INShareETAIntentResponse_setMediums___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_responseMessagePBRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMedium:", a2);

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
      if (a4 >= 0xA)
        result = v6;
      else
        result = a4 + 6;
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
  if ((unint64_t)(a3 - 1) > 0xE)
    return 3;
  else
    return dword_18C312478[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) >= 0xA)
    return 0x7FFFFFFF;
  else
    return a3 - 6;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
