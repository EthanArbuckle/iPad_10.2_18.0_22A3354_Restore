@implementation INReportIncidentIntentResponse

- (INReportIncidentIntentResponse)init
{
  return -[INReportIncidentIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INReportIncidentIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  INReportIncidentIntentResponse *v11;
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
    if ((unint64_t)a3 > 0xD)
      v9 = 0;
    else
      v9 = off_1E2295150[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INReportIncidentIntentResponse initWithCode:userActivity:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)INReportIncidentIntentResponse;
  v11 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, a3, v6);

  return v11;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INReportIncidentIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INReportIncidentIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INReportIncidentIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (int64_t)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INReportIncidentIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INReportIncidentIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INReportIncidentIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INReportIncidentIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t v2;

  v2 = -[INReportIncidentIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 0xC)
    return 0;
  else
    return qword_18C312820[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeUserConfirmationRequired")))v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureUnknownError")))v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureMapsLocationDisabled")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureMapsCoarseMode")))v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureMapsNotInstalled")))v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureUnsupportedIncidentType")))v4 = 10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureUnsupportedRegion")))v4 = 11;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureUnsupportedTransportType")))v5 = 12;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INReportIncidentIntentResponseCodeFailureUnsupportedUpdate"));

  if (v6)
    return 13;
  else
    return v5;
}

- (unint64_t)transportTypes
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transportTypesCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v7, "transportTypeAtIndex:", i))
      {
        case 1u:
          v5 |= 1uLL;
          break;
        case 2u:
          v5 |= 2uLL;
          break;
        case 3u:
          v5 |= 4uLL;
          break;
        case 4u:
          v5 |= 8uLL;
          break;
        case 5u:
          v5 |= 0x10uLL;
          break;
        default:
          break;
      }

    }
  }
  return v5;
}

- (CLPlacemark)location
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (NSArray)supportedTypes
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromSupportedTrafficIncidentTypes(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setTransportTypes:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearTransportTypes");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__INReportIncidentIntentResponse_setTransportTypes___block_invoke;
  v8[3] = &unk_1E2295130;
  v8[4] = self;
  INMapsTransportTypeOptionsEnumerateBackingTypes(a3, v8);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLocation:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setSupportedTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSupportedTrafficIncidentTypes(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSupportedTypes:", v6);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("code");
  v3 = -[INReportIncidentIntentResponse code](self, "code");
  v4 = v3;
  if (v3 < 0xE)
  {
    v5 = off_1E2295150[v3];
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v16[0] = v5;
  v15[1] = CFSTR("transportTypes");
  INMapsTransportTypeOptionsGetNames(-[INReportIncidentIntentResponse transportTypes](self, "transportTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v8;
  v15[2] = CFSTR("location");
  -[INReportIncidentIntentResponse location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v10;
  v15[3] = CFSTR("supportedTypes");
  -[INReportIncidentIntentResponse supportedTypes](self, "supportedTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  if (!v9)
  if (!v7)

  if (v4 >= 0xE)
  return v13;
}

void __52__INReportIncidentIntentResponse_setTransportTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_responseMessagePBRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTransportType:", a2);

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
    case 1:
      v6 = 4;
      if (a5)
        v6 = 5;
      if (a4 >= 8)
        result = v6;
      else
        result = a4 + 6;
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
  if ((unint64_t)(a3 - 1) > 0xC)
    return 3;
  else
    return dword_18C3127EC[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) >= 8)
    return 0x7FFFFFFF;
  else
    return a3 - 6;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
