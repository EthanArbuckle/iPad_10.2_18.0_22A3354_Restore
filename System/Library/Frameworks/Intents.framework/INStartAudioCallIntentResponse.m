@implementation INStartAudioCallIntentResponse

- (id)init
{
  return -[INStartAudioCallIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INStartAudioCallIntentResponse)initWithCode:(INStartAudioCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INStartAudioCallIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INStartAudioCallIntentResponseCode v16;
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
    if ((unint64_t)code > INStartAudioCallIntentResponseCodeFailureNoValidNumber)
      v8 = 0;
    else
      v8 = off_1E228C748[code];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INStartAudioCallIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INStartAudioCallIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INStartAudioCallIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INStartAudioCallIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INStartAudioCallIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INStartAudioCallIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartAudioCallIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartAudioCallIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INStartAudioCallIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INStartAudioCallIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INStartAudioCallIntentResponseCode v2;

  v2 = -[INStartAudioCallIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 7)
    return 0;
  else
    return qword_18C311A78[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeFailure")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeFailureRequiringAppLaunch")))v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeFailureAppConfigurationRequired")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeFailureCallingServiceNotAvailable")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeFailureContactNotSupportedByApp")))v5 = 7;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INStartAudioCallIntentResponseCodeFailureNoValidNumber"));

  if (v6)
    return 8;
  else
    return v5;
}

- (double)timeToEstablishCall
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeToEstablish");
  v6 = v5;

  return v6;
}

- (void)setTimeToEstablishCall:(double)a3
{
  _INPBCallMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  _INPBCallMetricsValue *v9;

  v9 = objc_alloc_init(_INPBCallMetricsValue);
  -[_INPBCallMetricsValue setTimeToEstablish:](v9, "setTimeToEstablish:", a3);
  v5 = objc_alloc_init(_INPBCallMetrics);
  -[_INPBCallMetrics setValue:](v5, "setValue:", v9);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetrics:", v5);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v8);

}

- (id)_dictionaryRepresentation
{
  INStartAudioCallIntentResponseCode v2;
  unint64_t v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("code");
  v2 = -[INStartAudioCallIntentResponse code](self, "code");
  v3 = v2;
  if ((unint64_t)v2 <= INStartAudioCallIntentResponseCodeFailureNoValidNumber)
  {
    v4 = off_1E228C748[v2];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 9)

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  v5 = (a4 - 1);
  v6 = 3;
  if (a5)
    v6 = 4;
  if (v5 >= 4)
    v7 = v6;
  else
    v7 = v5 + 5;
  v8 = 2;
  if (a3 != 4)
    v8 = a3 == 5;
  if (a3 == 1)
    return v7;
  else
    return v8;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 3;
  else
    return dword_18C311A58[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) < 4)
    return a3 - 4;
  else
    return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

@end
