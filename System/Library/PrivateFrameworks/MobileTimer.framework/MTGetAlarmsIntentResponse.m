@implementation MTGetAlarmsIntentResponse

- (MTGetAlarmsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  MTGetAlarmsIntentResponse *v7;
  MTGetAlarmsIntentResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MTGetAlarmsIntentResponse;
  v7 = -[MTGetAlarmsIntentResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    -[MTGetAlarmsIntentResponse setUserActivity:](v7, "setUserActivity:", v6);
  }

  return v8;
}

+ (id)successIntentResponseWithAlarms:(id)a3
{
  id v3;
  MTGetAlarmsIntentResponse *v4;

  v3 = a3;
  v4 = -[MTGetAlarmsIntentResponse initWithCode:userActivity:]([MTGetAlarmsIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[MTGetAlarmsIntentResponse setAlarms:](v4, "setAlarms:", v3);

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
