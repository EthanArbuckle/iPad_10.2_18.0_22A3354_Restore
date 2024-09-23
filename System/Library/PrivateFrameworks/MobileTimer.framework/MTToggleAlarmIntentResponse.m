@implementation MTToggleAlarmIntentResponse

- (MTToggleAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  MTToggleAlarmIntentResponse *v7;
  MTToggleAlarmIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MTToggleAlarmIntentResponse;
  v7 = -[MTToggleAlarmIntentResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[MTToggleAlarmIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
  }

  return v8;
}

+ (id)unspecifiedIntentResponseWithState:(int64_t)a3
{
  MTToggleAlarmIntentResponse *v4;

  v4 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 0, 0);
  -[MTToggleAlarmIntentResponse setState:](v4, "setState:", a3);
  return v4;
}

+ (id)readyIntentResponseWithState:(int64_t)a3
{
  MTToggleAlarmIntentResponse *v4;

  v4 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 1, 0);
  -[MTToggleAlarmIntentResponse setState:](v4, "setState:", a3);
  return v4;
}

+ (id)continueInAppIntentResponseWithState:(int64_t)a3
{
  MTToggleAlarmIntentResponse *v4;

  v4 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 2, 0);
  -[MTToggleAlarmIntentResponse setState:](v4, "setState:", a3);
  return v4;
}

+ (id)inProgressIntentResponseWithState:(int64_t)a3
{
  MTToggleAlarmIntentResponse *v4;

  v4 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 3, 0);
  -[MTToggleAlarmIntentResponse setState:](v4, "setState:", a3);
  return v4;
}

+ (id)successIntentResponseWithState:(int64_t)a3 alarm:(id)a4
{
  id v5;
  MTToggleAlarmIntentResponse *v6;

  v5 = a4;
  v6 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[MTToggleAlarmIntentResponse setState:](v6, "setState:", a3);
  -[MTToggleAlarmIntentResponse setAlarm:](v6, "setAlarm:", v5);

  return v6;
}

+ (id)failureRequiringAppLaunchIntentResponseWithState:(int64_t)a3
{
  MTToggleAlarmIntentResponse *v4;

  v4 = -[MTToggleAlarmIntentResponse initWithCode:userActivity:]([MTToggleAlarmIntentResponse alloc], "initWithCode:userActivity:", 6, 0);
  -[MTToggleAlarmIntentResponse setState:](v4, "setState:", a3);
  return v4;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

@end
