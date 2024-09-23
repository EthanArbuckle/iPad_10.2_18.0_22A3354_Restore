@implementation MTCreateAlarmIntentResponse

- (MTCreateAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  MTCreateAlarmIntentResponse *v7;
  MTCreateAlarmIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MTCreateAlarmIntentResponse;
  v7 = -[MTCreateAlarmIntentResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[MTCreateAlarmIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
  }

  return v8;
}

+ (id)successIntentResponseWithAlarm:(id)a3
{
  id v3;
  MTCreateAlarmIntentResponse *v4;

  v3 = a3;
  v4 = -[MTCreateAlarmIntentResponse initWithCode:userActivity:]([MTCreateAlarmIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[MTCreateAlarmIntentResponse setAlarm:](v4, "setAlarm:", v3);

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
