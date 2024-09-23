@implementation INSendPaymentIntentResponse

- (id)init
{
  return -[INSendPaymentIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INSendPaymentIntentResponse)initWithCode:(INSendPaymentIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  INSendPaymentIntentResponse *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  INSendPaymentIntentResponseCode v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  NSUserActivity *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)code > INSendPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired)
      v9 = 0;
    else
      v9 = off_1E228FBA8[code];
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INSendPaymentIntentResponse initWithCode:userActivity:]";
    v16 = 2048;
    v17 = code;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)INSendPaymentIntentResponse;
  v11 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, code, v6);

  return v11;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSendPaymentIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INSendPaymentIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSendPaymentIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INSendPaymentIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendPaymentIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendPaymentIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INSendPaymentIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSendPaymentIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INSendPaymentIntentResponseCode v2;

  v2 = -[INSendPaymentIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 0xC)
    return 0;
  else
    return qword_18C312BB8[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailureCredentialsUnverified")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailurePaymentsAmountBelowMinimum")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailurePaymentsAmountAboveMaximum")))v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailurePaymentsCurrencyUnsupported")))v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailureInsufficientFunds")))v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailureNoBankAccount")))
    v4 = 11;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailureNotEligible")))
    v5 = 12;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSendPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired"));

  if (v6)
    return 13;
  else
    return v5;
}

- (INPaymentRecord)paymentRecord
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPaymentRecord(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentRecord *)v4;
}

- (void)setPaymentRecord:(INPaymentRecord *)paymentRecord
{
  INPaymentRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = paymentRecord;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPaymentRecord(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPaymentRecord:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  INSendPaymentIntentResponseCode v3;
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
  v3 = -[INSendPaymentIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 < (INSendPaymentIntentResponseCodeFailureNotEligible|INSendPaymentIntentResponseCodeInProgress))
  {
    v5 = off_1E228FBA8[v3];
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v11[1] = CFSTR("paymentRecord");
  v12[0] = v5;
  -[INSendPaymentIntentResponse paymentRecord](self, "paymentRecord");
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

  if (v4 >= 0xE)
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
      v7 = 4;
      if (a5)
        v7 = 5;
      if (v6 >= 8)
        result = v7;
      else
        result = v6 + 6;
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
  if ((unint64_t)(a3 - 1) > 0xC)
    return 3;
  else
    return dword_18C312B80[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 8)
    return a3 - 5;
  else
    return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
