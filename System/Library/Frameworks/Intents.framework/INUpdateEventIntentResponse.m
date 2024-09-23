@implementation INUpdateEventIntentResponse

- (INUpdateEventIntentResponse)init
{
  return -[INUpdateEventIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INUpdateEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INUpdateEventIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 7)
      v8 = 0;
    else
      v8 = off_1E228E1C8[a3];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INUpdateEventIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INUpdateEventIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, a3, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INUpdateEventIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INUpdateEventIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUpdateEventIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (int64_t)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INUpdateEventIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INUpdateEventIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INUpdateEventIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUpdateEventIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  int64_t v2;

  v2 = -[INUpdateEventIntentResponse code](self, "code");
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
  objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeFailure")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeFailureRequiringAppLaunch")))v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeFailureParticipantNotRemovable")))v5 = 6;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INUpdateEventIntentResponseCodeFailureParticipantAlreadyAdded"));

  if (v6)
    return 7;
  else
    return v5;
}

- (INCalendarEvent)updatedEvent
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCalendarEvent(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCalendarEvent *)v4;
}

- (NSArray)conflictingEventIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conflictingEventIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];

  return (NSArray *)v4;
}

- (int64_t)confirmationReason
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasConfirmationReason");
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "confirmationReason");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setUpdatedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCalendarEvent(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUpdatedEvent:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setConflictingEventIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearConflictingEventIdentifiers");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addConflictingEventIdentifiers:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v14);

}

- (void)setConfirmationReason:(int64_t)a3
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
    objc_msgSend(v6, "setHasConfirmationReason:", 0);
  else
    objc_msgSend(v6, "setConfirmationReason:", v5);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v8);

}

- (id)_dictionaryRepresentation
{
  unint64_t v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("code");
  v3 = -[INUpdateEventIntentResponse code](self, "code");
  v4 = v3;
  if (v3 <= 7)
  {
    v5 = off_1E228E1C8[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v5;
  v15[1] = CFSTR("updatedEvent");
  -[INUpdateEventIntentResponse updatedEvent](self, "updatedEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v7;
  v15[2] = CFSTR("conflictingEventIdentifiers");
  -[INUpdateEventIntentResponse conflictingEventIdentifiers](self, "conflictingEventIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v9;
  v15[3] = CFSTR("confirmationReason");
  v10 = -[INUpdateEventIntentResponse confirmationReason](self, "confirmationReason");
  v11 = CFSTR("unknown");
  if (v10 == 2)
    v11 = CFSTR("updateAllRecurrences");
  if (v10 == 1)
    v11 = CFSTR("scheduleConflict");
  v12 = v11;
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v6)

  if (v4 >= 8)
  return v13;
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
