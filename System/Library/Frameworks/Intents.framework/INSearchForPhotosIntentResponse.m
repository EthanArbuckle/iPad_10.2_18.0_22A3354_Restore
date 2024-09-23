@implementation INSearchForPhotosIntentResponse

- (id)init
{
  return -[INSearchForPhotosIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INSearchForPhotosIntentResponse)initWithCode:(INSearchForPhotosIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INSearchForPhotosIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INSearchForPhotosIntentResponseCode v16;
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
    if ((unint64_t)code > INSearchForPhotosIntentResponseCodeFailureAppConfigurationRequired)
      v8 = 0;
    else
      v8 = off_1E228C360[code];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForPhotosIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INSearchForPhotosIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSearchForPhotosIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INSearchForPhotosIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSearchForPhotosIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INSearchForPhotosIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSearchForPhotosIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSearchForPhotosIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INSearchForPhotosIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSearchForPhotosIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INSearchForPhotosIntentResponseCode v2;

  v2 = -[INSearchForPhotosIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_18C311CE0[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForPhotosIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForPhotosIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForPhotosIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForPhotosIntentResponseCodeFailure")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForPhotosIntentResponseCodeFailureRequiringAppLaunch")))v5 = 4;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INSearchForPhotosIntentResponseCodeFailureAppConfigurationRequired"));

  if (v6)
    return 5;
  else
    return v5;
}

- (NSNumber)searchResultsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSearchResultsCount"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "searchResultsCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setSearchResultsCount:(NSNumber *)searchResultsCount
{
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;

  v7 = searchResultsCount;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setSearchResultsCount:", -[NSNumber intValue](v7, "intValue"));
  else
    objc_msgSend(v4, "setHasSearchResultsCount:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (id)_dictionaryRepresentation
{
  INSearchForPhotosIntentResponseCode v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("code");
  v3 = -[INSearchForPhotosIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 <= INSearchForPhotosIntentResponseCodeFailureAppConfigurationRequired)
  {
    v5 = off_1E228C360[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("searchResultsCount");
  v11[0] = v5;
  -[INSearchForPhotosIntentResponse searchResultsCount](self, "searchResultsCount");
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

  if (v4 >= 6)
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t v5;
  int64_t v6;

  v5 = 3;
  if (a5)
    v5 = 4;
  if (a4 == 1)
    v5 = 5;
  v6 = 2;
  if (a3 != 4)
    v6 = a3 == 5;
  if (a3 == 1)
    return v5;
  else
    return v6;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 3;
  else
    return dword_18C311CC8[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 5)
    return 1;
  else
    return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

@end
