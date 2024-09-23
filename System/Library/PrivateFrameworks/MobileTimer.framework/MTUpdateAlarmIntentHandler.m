@implementation MTUpdateAlarmIntentHandler

- (void)confirmUpdateAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  MTUpdateAlarmIntentResponse *v8;
  void *v9;
  MTUpdateAlarmIntentResponse *v10;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = [MTUpdateAlarmIntentResponse alloc];
  -[MTUpdateAlarmIntentHandler _alarmUserActivityWithIntent:](self, "_alarmUserActivityWithIntent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MTUpdateAlarmIntentResponse initWithCode:userActivity:](v8, "initWithCode:userActivity:", 4, v9);
  v6[2](v6, v10);

}

- (void)handleUpdateAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  MTUpdateAlarmIntentResponse *v8;
  void *v9;
  MTUpdateAlarmIntentResponse *v10;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = [MTUpdateAlarmIntentResponse alloc];
  -[MTUpdateAlarmIntentHandler _alarmUserActivityWithIntent:](self, "_alarmUserActivityWithIntent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MTUpdateAlarmIntentResponse initWithCode:userActivity:](v8, "initWithCode:userActivity:", 2, v9);
  v6[2](v6, v10);

}

- (id)_alarmUserActivityWithIntent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3B10];
  v4 = a3;
  objc_msgSend(v3, "mtUserActivityWithActivityType:", CFSTR("com.apple.clock.alarm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createUserInfoWithIntentName:alarmIDString:time:label:", v7, v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUserInfo:", v10);
  return v5;
}

@end
