@implementation INSendRideFeedbackIntentResponse

- (INSendRideFeedbackIntentResponse)initWithCode:(INSendRideFeedbackIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSendRideFeedbackIntentResponse;
  return (INSendRideFeedbackIntentResponse *)-[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, code, userActivity);
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSendRideFeedbackIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INSendRideFeedbackIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSendRideFeedbackIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INSendRideFeedbackIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendRideFeedbackIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (INSendRideFeedbackIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INSendRideFeedbackIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendRideFeedbackIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (id)_dictionaryRepresentation
{
  INSendRideFeedbackIntentResponseCode v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("code");
  v3 = -[INSendRideFeedbackIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 <= INSendRideFeedbackIntentResponseCodeFailure)
  {
    v5 = off_1E228E710[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("userActivity");
  v11[0] = v5;
  -[INIntentResponse userActivity](self, "userActivity");
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

  if (v4 >= 4)
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
