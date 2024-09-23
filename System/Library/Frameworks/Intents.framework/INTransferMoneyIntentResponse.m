@implementation INTransferMoneyIntentResponse

- (id)init
{
  return -[INTransferMoneyIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INTransferMoneyIntentResponse)initWithCode:(INTransferMoneyIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INTransferMoneyIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INTransferMoneyIntentResponseCode v16;
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
    if ((unint64_t)code > INTransferMoneyIntentResponseCodeFailureInsufficientFunds)
      v8 = 0;
    else
      v8 = off_1E228AA78[code];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INTransferMoneyIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INTransferMoneyIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INTransferMoneyIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INTransferMoneyIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INTransferMoneyIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INTransferMoneyIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INTransferMoneyIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INTransferMoneyIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INTransferMoneyIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INTransferMoneyIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INTransferMoneyIntentResponseCode v2;

  v2 = -[INTransferMoneyIntentResponse code](self, "code");
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
  objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeFailureCredentialsUnverified")))v5 = 6;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INTransferMoneyIntentResponseCodeFailureInsufficientFunds"));

  if (v6)
    return 7;
  else
    return v5;
}

- (INPaymentAccount)fromAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromFinancialAccountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentAccount *)v4;
}

- (INPaymentAccount)toAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromFinancialAccountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentAccount *)v4;
}

- (INPaymentAmount)transactionAmount
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPaymentAmountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentAmount *)v4;
}

- (INDateComponentsRange)transactionScheduledDate
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionScheduledDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (NSString)transactionNote
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (INCurrencyAmount)transferFee
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferFee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCurrencyAmountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCurrencyAmount *)v4;
}

- (void)setFromAccount:(INPaymentAccount *)fromAccount
{
  INPaymentAccount *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = fromAccount;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToFinancialAccountValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFromAccount:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setToAccount:(INPaymentAccount *)toAccount
{
  INPaymentAccount *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = toAccount;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToFinancialAccountValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setToAccount:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setTransactionAmount:(INPaymentAmount *)transactionAmount
{
  INPaymentAmount *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = transactionAmount;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPaymentAmountValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransactionAmount:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setTransactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate
{
  INDateComponentsRange *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = transactionScheduledDate;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransactionScheduledDate:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setTransactionNote:(NSString *)transactionNote
{
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = transactionNote;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionNote:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setTransferFee:(INCurrencyAmount *)transferFee
{
  INCurrencyAmount *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = transferFee;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCurrencyAmountValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransferFee:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  INTransferMoneyIntentResponseCode v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  unint64_t v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("code");
  v3 = -[INTransferMoneyIntentResponse code](self, "code");
  v23 = v3;
  if ((unint64_t)v3 <= INTransferMoneyIntentResponseCodeFailureInsufficientFunds)
  {
    v4 = off_1E228AA78[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v4;
  v25[0] = v4;
  v24[1] = CFSTR("fromAccount");
  -[INTransferMoneyIntentResponse fromAccount](self, "fromAccount");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v5;
  v25[1] = v5;
  v24[2] = CFSTR("toAccount");
  -[INTransferMoneyIntentResponse toAccount](self, "toAccount");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("transactionAmount");
  -[INTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v25[3] = v9;
  v24[4] = CFSTR("transactionScheduledDate");
  -[INTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v12;
  v24[5] = CFSTR("transactionNote");
  -[INTransferMoneyIntentResponse transactionNote](self, "transactionNote");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v14;
  v24[6] = CFSTR("transferFee");
  -[INTransferMoneyIntentResponse transferFee](self, "transferFee");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v13)
  if (!v11)

  if (!v10)
  if (!v8)

  if (!v6)
  if (v23 >= 8)

  return v17;
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
      if (a4 == 2)
        v6 = 7;
      if (a4 == 1)
        result = 6;
      else
        result = v6;
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
    v3 = 2;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 6)
    return 1;
  else
    return v3;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
