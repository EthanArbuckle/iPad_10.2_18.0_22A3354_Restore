@implementation MTGetAlarmsIntentHandler

- (void)confirmGetAlarms:(id)a3 completion:(id)a4
{
  id v5;
  MTGetAlarmsIntentResponse *v6;

  v5 = a4;
  v6 = -[MTGetAlarmsIntentResponse initWithCode:userActivity:]([MTGetAlarmsIntentResponse alloc], "initWithCode:userActivity:", 1, 0);
  (*((void (**)(id, MTGetAlarmsIntentResponse *))a4 + 2))(v5, v6);

}

- (void)handleGetAlarms:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  -[MTAlarmIntentHandler alarmManager](self, "alarmManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alarmsIncludingSleepAlarm:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke;
  v15[3] = &unk_1E39CB4E8;
  v9 = v5;
  v16 = v9;
  v10 = (id)objc_msgSend(v7, "addFailureBlock:", v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke_2;
  v13[3] = &unk_1E39CB580;
  v14 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v7, "addSuccessBlock:", v13);

}

void __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  MTGetAlarmsIntentResponse *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[MTGetAlarmsIntentResponse initWithCode:userActivity:]([MTGetAlarmsIntentResponse alloc], "initWithCode:userActivity:", 5, 0);
  (*(void (**)(uint64_t, MTGetAlarmsIntentResponse *))(v1 + 16))(v1, v2);

}

void __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke_2(uint64_t a1, void *a2)
{
  MTGetAlarmsIntentResponse *v3;
  id v4;

  objc_msgSend(a2, "na_map:", &__block_literal_global_31);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[MTGetAlarmsIntentResponse initWithCode:userActivity:]([MTGetAlarmsIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  -[MTGetAlarmsIntentResponse setAlarms:](v3, "setAlarms:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intentAlarm");
}

@end
