@implementation INStartWorkoutIntentResponse

- (id)init
{
  return -[INStartWorkoutIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INStartWorkoutIntentResponse)initWithCode:(INStartWorkoutIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  INStartWorkoutIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INStartWorkoutIntentResponseCode v16;
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
    if ((unint64_t)code > INStartWorkoutIntentResponseCodeSuccess)
      v8 = 0;
    else
      v8 = off_1E228A030[code];
    *(_DWORD *)buf = 136315906;
    v14 = "-[INStartWorkoutIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INStartWorkoutIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INStartWorkoutIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INStartWorkoutIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INStartWorkoutIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INStartWorkoutIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartWorkoutIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartWorkoutIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INStartWorkoutIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INStartWorkoutIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INStartWorkoutIntentResponseCode v2;

  v2 = -[INStartWorkoutIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 7)
    return 0;
  else
    return qword_18C3110B8[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeSuccess")))
    v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeHandleInApp")))
    v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeFailure")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeFailureRequiringAppLaunch")))v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeFailureOngoingWorkout")))v5 = 5;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INStartWorkoutIntentResponseCodeFailureNoMatchingWorkout"));

  if (v6)
    return 6;
  else
    return v5;
}

- (BOOL)_shouldForwardIntentToApp
{
  return -[INStartWorkoutIntentResponse code](self, "code") == INStartWorkoutIntentResponseCodeHandleInApp;
}

- (id)_dictionaryRepresentation
{
  INStartWorkoutIntentResponseCode v2;
  unint64_t v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("code");
  v2 = -[INStartWorkoutIntentResponse code](self, "code");
  v3 = v2;
  if ((unint64_t)v2 <= INStartWorkoutIntentResponseCodeSuccess)
  {
    v4 = off_1E228A030[v2];
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
  int64_t result;
  int64_t v6;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 8;
      break;
    case 1:
      v6 = 3;
      if (a5)
        v6 = 4;
      if (a4 == 1)
        v6 = 6;
      if (a4)
        result = v6;
      else
        result = 5;
      break;
    case 4:
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
  if ((unint64_t)(a3 - 1) > 7)
    return 3;
  else
    return dword_18C311098[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  int v3;

  if (a3 == 6)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 5)
    return 0;
  else
    return v3;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

@end
