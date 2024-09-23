@implementation INRunVoiceCommandIntentResponse

- (INRunVoiceCommandIntentResponse)init
{
  return -[INRunVoiceCommandIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INRunVoiceCommandIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  INRunVoiceCommandIntentResponse *v11;
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
    if ((unint64_t)a3 > 0x15)
      v9 = 0;
    else
      v9 = off_1E228A0A8[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INRunVoiceCommandIntentResponse initWithCode:userActivity:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)INRunVoiceCommandIntentResponse;
  v11 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, a3, v6);

  return v11;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INRunVoiceCommandIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INRunVoiceCommandIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INRunVoiceCommandIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (int64_t)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INRunVoiceCommandIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INRunVoiceCommandIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INRunVoiceCommandIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INRunVoiceCommandIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t v2;

  v2 = -[INRunVoiceCommandIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 0x14)
    return 0;
  else
    return qword_18C311150[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeInProgress")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeSuccess")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeUserConfirmationRequired")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailure")))
    v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureRequiringAppLaunch")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureAppConfigurationRequired")))v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureUnsupportedOnDevice")))v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureIntentBlacklisted")))v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureCustomError")))v4 = 11;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureAppNotInstalledOnDevice")))v4 = 12;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureIntentUnsupportedByApp")))v4 = 13;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureAuthenticationUnsupportedOnDevice")))v4 = 14;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailurePhraseBlacklisted")))v4 = 15;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureAppBlacklisted")))v4 = 16;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureCompanionProtectedDataUnavailable")))v4 = 17;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureCompanionUnavailable")))v4 = 18;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureIntentBlocked")))v4 = 19;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailurePhraseBlocked")))v5 = 20;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INRunVoiceCommandIntentResponseCodeFailureAppBlocked"));

  if (v6)
    return 21;
  else
    return v5;
}

- (NSString)appBundleId
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (int64_t)intentCategory
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int64_t v7;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasIntentCategory");
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intentCategory");
  if (v4 && (v6 - 1) <= 0x14)
    v7 = qword_18C3120D0[v6 - 1];
  else
    v7 = 0;

  return v7;
}

- (NSNumber)customResponsesDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasCustomResponsesDisabled"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "customResponsesDisabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSString)responseTemplate
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSDictionary)parameters
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)verb
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verb");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (INArchivedObject)underlyingIntent
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "underlyingIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromArchivedObject(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INArchivedObject *)v4;
}

- (NSString)localizedAppName
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (INArchivedObject)underlyingIntentResponse
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "underlyingIntentResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromArchivedObject(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INArchivedObject *)v4;
}

- (int64_t)toggleState
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasToggleState");
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "toggleState");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (NSNumber)continueRunning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasContinueRunning"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "continueRunning"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)interstitialDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasInterstitialDisabled"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "interstitialDisabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSString)underlyingIntentTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "underlyingIntentTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSArray)steps
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "steps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromVoiceCommandStepInfos(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSNumber)prefersExecutionOnCompanion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefersExecutionOnCompanion"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "prefersExecutionOnCompanion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setAppBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppBundleId:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setIntentCategory:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 0x13)
    v4 = dword_18C312080[a3 - 1];
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasIntentCategory:", 0);
  else
    objc_msgSend(v5, "setIntentCategory:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setCustomResponsesDisabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setCustomResponsesDisabled:", objc_msgSend(v7, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasCustomResponsesDisabled:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setResponseTemplate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseTemplate:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDictionary(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setParameters:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setVerb:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVerb:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setUnderlyingIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToArchivedObject(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUnderlyingIntent:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setLocalizedAppName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedAppName:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setUnderlyingIntentResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToArchivedObject(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUnderlyingIntentResponse:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setToggleState:(int64_t)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 1)
    v4 = 1;
  else
    v4 = 0x7FFFFFFF;
  if (a3 == 2)
    v5 = 2;
  else
    v5 = v4;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5 == 0x7FFFFFFF)
    objc_msgSend(v6, "setHasToggleState:", 0);
  else
    objc_msgSend(v6, "setToggleState:", v5);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v8);

}

- (void)setContinueRunning:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setContinueRunning:", objc_msgSend(v7, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasContinueRunning:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setInterstitialDisabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setInterstitialDisabled:", objc_msgSend(v7, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasInterstitialDisabled:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setUnderlyingIntentTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnderlyingIntentTitle:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setSteps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToVoiceCommandStepInfos(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSteps:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setPrefersExecutionOnCompanion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setPrefersExecutionOnCompanion:", objc_msgSend(v7, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasPrefersExecutionOnCompanion:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (id)_dictionaryRepresentation
{
  unint64_t v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  id v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  __CFString *v57;
  unint64_t v58;
  _QWORD v59[16];
  _QWORD v60[18];

  v60[16] = *MEMORY[0x1E0C80C00];
  v59[0] = CFSTR("code");
  v3 = -[INRunVoiceCommandIntentResponse code](self, "code");
  v58 = v3;
  if (v3 < 0x16)
  {
    v4 = off_1E228A0A8[v3];
    v57 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
  }
  v47 = v4;
  v60[0] = v4;
  v59[1] = CFSTR("appBundleId");
  -[INRunVoiceCommandIntentResponse appBundleId](self, "appBundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v5;
  v60[1] = v5;
  v59[2] = CFSTR("intentCategory");
  v7 = -[INRunVoiceCommandIntentResponse intentCategory](self, "intentCategory");
  if ((unint64_t)(v7 - 1) > 0x13)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2292DC8[v7 - 1];
  v55 = v8;
  v60[2] = v55;
  v59[3] = CFSTR("customResponsesDisabled");
  -[INRunVoiceCommandIntentResponse customResponsesDisabled](self, "customResponsesDisabled");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v9;
  v60[3] = v9;
  v59[4] = CFSTR("responseTemplate");
  -[INRunVoiceCommandIntentResponse responseTemplate](self, "responseTemplate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v11;
  v60[4] = v11;
  v59[5] = CFSTR("parameters");
  -[INRunVoiceCommandIntentResponse parameters](self, "parameters");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v13;
  v60[5] = v13;
  v59[6] = CFSTR("verb");
  -[INRunVoiceCommandIntentResponse verb](self, "verb");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v15;
  v60[6] = v15;
  v59[7] = CFSTR("underlyingIntent");
  -[INRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v17;
  v60[7] = v17;
  v59[8] = CFSTR("localizedAppName");
  -[INRunVoiceCommandIntentResponse localizedAppName](self, "localizedAppName");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v51 = v18;
  v40 = (void *)v19;
  v60[8] = v19;
  v59[9] = CFSTR("underlyingIntentResponse");
  -[INRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v21;
  v60[9] = v21;
  v59[10] = CFSTR("toggleState");
  v23 = -[INRunVoiceCommandIntentResponse toggleState](self, "toggleState");
  v24 = CFSTR("unknown");
  if (v23 == 2)
    v24 = CFSTR("off");
  if (v23 == 1)
    v24 = CFSTR("on");
  v49 = v24;
  v60[10] = v49;
  v59[11] = CFSTR("continueRunning");
  -[INRunVoiceCommandIntentResponse continueRunning](self, "continueRunning");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v50 = v20;
  v56 = v6;
  v38 = (void *)v25;
  v60[11] = v25;
  v59[12] = CFSTR("interstitialDisabled");
  -[INRunVoiceCommandIntentResponse interstitialDisabled](self, "interstitialDisabled");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v52 = v16;
  v53 = v14;
  v54 = v12;
  v60[12] = v27;
  v59[13] = CFSTR("underlyingIntentTitle");
  -[INRunVoiceCommandIntentResponse underlyingIntentTitle](self, "underlyingIntentTitle", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v10;
  v60[13] = v30;
  v59[14] = CFSTR("steps");
  -[INRunVoiceCommandIntentResponse steps](self, "steps");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60[14] = v33;
  v59[15] = CFSTR("prefersExecutionOnCompanion");
  -[INRunVoiceCommandIntentResponse prefersExecutionOnCompanion](self, "prefersExecutionOnCompanion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60[15] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 16);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if (!v34)

  if (!v32)
  if (!v29)

  if (!v28)
  if (!v26)

  if (!v22)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (!v54)

  if (!v31)
  if (!v56)

  if (v58 >= 0x16)
  return v48;
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
      result = 4;
      break;
    case 1:
      v6 = (a4 - 1);
      v7 = 6;
      if (a5)
        v7 = 7;
      if (v6 >= 0xE)
        result = v7;
      else
        result = v6 + 8;
      break;
    case 2:
      result = 3;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    case 7:
      result = 5;
      break;
    default:
      return result;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x14)
    return 3;
  else
    return dword_18C3110F8[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) < 0xE)
    return a3 - 7;
  else
    return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 7;
}

@end
